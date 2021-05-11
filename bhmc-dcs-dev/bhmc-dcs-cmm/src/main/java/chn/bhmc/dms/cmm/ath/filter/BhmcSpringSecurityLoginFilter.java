package chn.bhmc.dms.cmm.ath.filter;

import java.io.IOException;
import java.util.Locale;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.LocaleResolver;

import chn.bhmc.dms.core.i18n.AggregatingMessageSource;
import chn.bhmc.dms.security.service.LoginService;
import chn.bhmc.dms.security.userdetails.util.UserDetailsHelper;
import chn.bhmc.dms.security.vo.CustomUserVO;

/**
 *
 * @author 공통서비스 개발팀 서준식
 * @since 2011. 8. 29.
 * @version 1.0
 * @see
 *
 *      <pre>
 * 개정이력(Modification Information)
 *
 *     수정일                 수정자        	  수정내용
 *  -----------    --------   ---------------------------
 *  2011.08.29    	 서준식        	 최초생성
 *  2011.12.12      유지보수        사용자 로그인 정보 간섭 가능성 문제(멤버 변수 EgovUserDetails userDetails를 로컬변수로 변경)
 *  2014.03.07      유지보수        로그인된 상태에서 다시 로그인 시 미처리 되는 문제 수정 (로그인 처리 URL 파라미터화)
 *
 * </pre>
 */

public class BhmcSpringSecurityLoginFilter implements Filter {

    private FilterConfig config;

    private WebApplicationContext applicationContext;

    // private int sessionTimes;

    //private String loginProcessUrl;

    // private SecurityConfig securityConfig;

    // private LoginService loginService;

    //private MessageSource messageSource;
    // @Autowired
    private LocaleResolver localeResolver;

    private static final Logger LOGGER = LoggerFactory.getLogger(BhmcSpringSecurityLoginFilter.class);

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
            ServletException {

        // 로그인 URL

        // if(request.getAttribute(""))
        String loginURL = config.getInitParameter("loginUrl");
        loginURL = loginURL.replaceAll("\r", "").replaceAll("\n", ""); // 2011.10.25
                                                                       // 보안점검
                                                                       // 후속조치

        String loginProcessURL = config.getInitParameter("loginProcessUrl");
        loginProcessURL = loginProcessURL.replaceAll("\r", "").replaceAll("\n", "");

        ApplicationContext act = WebApplicationContextUtils
                .getRequiredWebApplicationContext(config.getServletContext());
        LoginService loginService = (LoginService) act.getBean("loginService");
        AggregatingMessageSource messageSource = (AggregatingMessageSource) act.getBean("messageSource");

        HttpServletRequest httpRequest = (HttpServletRequest) request;

        if (httpRequest.getRequestURI().contains("/mob/")) {
            loginURL = config.getInitParameter("mobileLoginUrl");
            // login
        }
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();

        SavedRequest savedRequest = new HttpSessionRequestCache().getRequest(httpRequest, httpResponse);
        if (savedRequest != null && savedRequest.getRedirectUrl().contains("/mob/")) {
            loginURL = config.getInitParameter("mobileLoginUrl");
            // login
        }

        // String isLocallyAuthenticated =
        // (String)session.getAttribute("isLocallyAuthenticated");
        //String isRemotelyAuthenticated = (String) session.getAttribute("isRemotelyAuthenticated");

        String requestURL = ((HttpServletRequest) request).getRequestURI();

        // 스프링 시큐리티 인증이 처리 되었는지 EgovUserDetailsHelper.getAuthenticatedUser()
        // 메서드를 통해 확인한다.
        // context-common.xml 빈 설정에 egovUserDetailsSecurityService를 등록 해서 사용해야
        // 정상적으로 동작한다.
        if (UserDetailsHelper.getAuthenticatedUser() == null || requestURL.contains(loginProcessURL)) {

            if (requestURL.contains(loginProcessURL)) {

                String password = httpRequest.getParameter("password");
                // 2011.10.11 보안점검 후속 조치(Password 검증)
                // IF (PASSWORD == NULL || PASSWORD.EQUALS("") ||
                // PASSWORD.LENGTH() < 2 || PASSWORD.LENGTH() > 20) {
                // //TODO [김종하] 국제화 필요
                // HTTPREQUEST.SETATTRIBUTE("MESSAGE", "LOGIN FAILURE");
                //
                // REQUESTDISPATCHER DISPATCHER =
                // HTTPREQUEST.GETREQUESTDISPATCHER(LOGINURL);
                // DISPATCHER.FORWARD(HTTPREQUEST, HTTPRESPONSE);
                //
                // CHAIN.DOFILTER(REQUEST, RESPONSE);
                //
                // RETURN;
                // }

                CustomUserVO loginVO = new CustomUserVO();
                loginVO.setUsrId(httpRequest.getParameter("id"));
                loginVO.setUsrPw(password.trim());
                // loginVO.setUserSe(httpRequest.getParameter("userSe"));

                try {
                    // 사용자 입력 id, password로 DB 인증을 실행함
                    loginVO = loginService.actionLogin(loginVO);

                    if (loginVO != null && loginVO.getUsrId() != null && !loginVO.getUsrId().equals("")) {
                        // 세션 로그인
                        session.setAttribute("loginVO", loginVO);

                        // 로컬 인증결과 세션에 저장
                        session.setAttribute("isLocallyAuthenticated", "true");

                        String loginSuccessUrl = httpRequest.getParameter("userLoginSuccessUrl");
                        if (loginSuccessUrl != null && loginSuccessUrl.contains("/mob/")) {
                            session.setAttribute("isMobileLogin", true);
                            session.setAttribute("naviCnt", 0);
                        } else {
                            session.setAttribute("isMobileLogin", false);
                            session.setAttribute("naviCnt", 0);
                        }

                        Locale locale = new Locale(loginVO.getLangCd());
                        localeResolver.setLocale(httpRequest, httpResponse, locale);

                        // 스프링 시큐리티 로그인

                        // httpResponse.sendRedirect(httpRequest.getContextPath()
                        // + "/j_spring_security_check");

                        UsernamePasswordAuthenticationFilter springSecurity = null;

                        @SuppressWarnings("rawtypes")
                        Map beans = act.getBeansOfType(UsernamePasswordAuthenticationFilter.class);
                        if (beans.size() > 0) {
                            springSecurity = (UsernamePasswordAuthenticationFilter) beans.values().toArray()[0];
                        } else {
                            LOGGER.error("No AuthenticationProcessingFilter");
                            throw new IllegalStateException("No AuthenticationProcessingFilter");
                        }
                        // springSecurity.setContinueChainBeforeSuccessfulAuthentication(true);
                        // // false 이면 chain 처리 되지 않음.. (filter가 아닌 경우
                        // false로...)

                        LOGGER.debug("before security filter call....");

                        if (loginURL.contains("/mob/")) {
                            httpRequest.getRequestDispatcher(httpRequest.getParameter("userLoginSuccessUrl"));
                        }

                        springSecurity.doFilter(

                                // new RequestWrapperForSecurity(httpRequest,
                                // loginVO.getUserSe() + loginVO.getId(),
                                // loginVO.getUniqId()), httpResponse, chain);
                                new RequestWrapperForSecurity(httpRequest, loginVO.getUsrId(), loginVO.getUsrPw()),
                                httpResponse, chain);

                        LOGGER.debug("after security filter call....");

                    } else {
                        httpRequest.setAttribute("errorMessage", messageSource.getMessage("global.err.invalid.idpw", null, localeResolver.resolveLocale(httpRequest)));
                        RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(loginURL);
                        dispatcher.forward(httpRequest, httpResponse);
                    }

                } catch (Exception ex) {
                    httpRequest.setAttribute("errorMessage", ex.getMessage());
                    RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(loginURL);
                    dispatcher.forward(httpRequest, httpResponse);
                }
                return;
            }

        }


//        if(BhmcUserDetailsHelper.getAuthenticatedUser() == null || requestURL.contains("/cmm/sci/selectMobileAppDownload.do")){
//            chain.doFilter(request, response);
//
//        }


        if(session.getAttribute("loginVO") == null){
            if(requestURL.contains("/mob/crm/cif/customerInfo/customerPopupListMain.do") || requestURL.contains("/mob/crm/cif/customerInfo/customerPopupInfoMain.do")){
                chain.doFilter(request, response);
            }else if(loginURL.contains("/mob/")){
                RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(loginURL);
                dispatcher.forward(httpRequest, httpResponse);
            }else{
                if (savedRequest != null && savedRequest.getRedirectUrl().contains("/mob/")) {
                    String loginUrl = config.getInitParameter("mobileLoginUrl");

                    session.setAttribute("isMobileLogin", false);
                    // TODO [김종하] XML 등에서 주소 받아오기

                    RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(loginUrl);
                    dispatcher.forward(httpRequest, httpResponse);
                    // login
                } else {
                    chain.doFilter(request, response);
                }
            }
        }else{
            if ((Boolean) session.getAttribute("isMobileLogin")
                    && Integer.parseInt(session.getAttribute("naviCnt").toString()) == 0) {
                // RequestDispatcher dispatcher =
                // httpRequest.getRequestDispatcher("/mob/cmm/main/selectMain.do");
                session.setAttribute("naviCnt", Integer.parseInt(session.getAttribute("naviCnt").toString()) + 1);
                // dispatcher.forward(httpRequest, httpResponse);
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/mob/cmm/main/selectMain.do");
            } else {
                session.setAttribute("naviCnt", Integer.parseInt(session.getAttribute("naviCnt").toString()) + 1);
                chain.doFilter(request, response);
            }
        }



        /*
        if (loginURL.contains("/mob/") && session.getAttribute("loginVO") == null) {
            RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(loginURL);
            dispatcher.forward(httpRequest, httpResponse);
        } else if (session.getAttribute("loginVO") == null) {

            if (savedRequest != null && savedRequest.getRedirectUrl().contains("/mob/")) {
                String loginUrl = config.getInitParameter("mobileLoginUrl");

                session.setAttribute("isMobileLogin", false);
                // TODO [김종하] XML 등에서 주소 받아오기

                RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(loginUrl);
                dispatcher.forward(httpRequest, httpResponse);
                // login
            } else {
                chain.doFilter(request, response);
            }

        } else {

            if ((Boolean) session.getAttribute("isMobileLogin")
                    && Integer.parseInt(session.getAttribute("naviCnt").toString()) == 0) {
                // RequestDispatcher dispatcher =
                // httpRequest.getRequestDispatcher("/mob/cmm/main/selectMain.do");
                session.setAttribute("naviCnt", Integer.parseInt(session.getAttribute("naviCnt").toString()) + 1);
                // dispatcher.forward(httpRequest, httpResponse);
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/mob/cmm/main/selectMain.do");
            } else {
                session.setAttribute("naviCnt", Integer.parseInt(session.getAttribute("naviCnt").toString()) + 1);
                chain.doFilter(request, response);
            }
        }
        */
    }

    public void init(FilterConfig filterConfig) throws ServletException {

        this.config = filterConfig;
        this.applicationContext = WebApplicationContextUtils.getWebApplicationContext(config.getServletContext());

        // this.sessionTimes =
        // Integer.parseInt(filterConfig.getInitParameter("sessionTimes"));
        //this.loginProcessUrl = config.getInitParameter("loginProcessUrl");
        // this.securityConfig =
        // applicationContext.getBean(SecurityConfig.class);

        // this.loginService = (LoginService)
        // applicationContext.getBean("loginService");
        // this.supportedLangService = (SupportedLangService)
        // applicationContext.getBean("supportedLangService");

        this.localeResolver = (LocaleResolver) applicationContext.getBean("localeResolver", LocaleResolver.class);
        //this.messageSource = (MessageSource) applicationContext.getBean("messageSource");
    }

}

class RequestWrapperForSecurity extends HttpServletRequestWrapper {
    private String username = null;
    private String password = null;

    public RequestWrapperForSecurity(HttpServletRequest request, String username, String password) {
        super(request);

        this.username = username;
        this.password = password;
    }

    @Override
    public String getRequestURI() {
        return ((HttpServletRequest) super.getRequest()).getContextPath() + "/j_spring_security_check";
    }

    @Override
    public String getParameter(String name) {
        if (name.equals("j_username")) {
            return username;
        }

        if (name.equals("j_password")) {
            return password;
        }

        return super.getParameter(name);
    }
}

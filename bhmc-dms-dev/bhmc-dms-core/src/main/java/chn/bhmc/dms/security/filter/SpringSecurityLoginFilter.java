package chn.bhmc.dms.security.filter;

import java.io.IOException;
import java.io.PrintWriter;
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

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.LocaleResolver;

import com.fasterxml.jackson.databind.ObjectMapper;

import chn.bhmc.dms.core.exception.Error;
import chn.bhmc.dms.core.exception.Errors;
import chn.bhmc.dms.security.config.SecurityConfig;
import chn.bhmc.dms.security.service.LoginService;
import chn.bhmc.dms.security.service.MobStatisticsService;
import chn.bhmc.dms.security.userdetails.util.UserDetailsHelper;
import chn.bhmc.dms.security.vo.CustomUserVO;
import chn.bhmc.dms.security.vo.LoginError;

public class SpringSecurityLoginFilter implements Filter {

    private static final Logger logger = LoggerFactory.getLogger(SpringSecurityLoginFilter.class);

    /**
     * 필터설정 Object
     */
    private FilterConfig config;

    /**
     * Application Context
     */
    private ApplicationContext applicationContext;

    private SecurityConfig securityConfig;

    /**
     * 로케일 리졸버
     */
    private LocaleResolver localeResolver;

    /**
     * 로그인 서비스
     */
    private LoginService loginService;
    
    /**
     * 新增App后台统计服务  20170703 create by sunzhiqiang
     */
    private MobStatisticsService mobStatisticsService;

    /**
     * 메세지소스
     */
    private MessageSource messageSource;

    /**
     * 세션타입아웃 시간(초)
     * 기본시간은 60분으로 설정
     */
    private int sessionTimes = 3600;

    /**
     * 로그인 처리 URL
     */
    private String loginProcessUrl;

    /**
     * APP 로그인 처리 URL
     */
    private String appLoginProcessUrl;

    public void destroy() {

    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest)request;
        HttpServletResponse httpResponse = (HttpServletResponse)response;
        HttpSession session = httpRequest.getSession();

        String requestURL = httpRequest.getRequestURI();
        String requestContextPath = httpRequest.getContextPath();
        String appFilterUrl = requestContextPath + "/api/";

        //로그인 페이지나 로그인 처리 경로가 아닌 경우
        if(!(requestURL.contains("selectCultureSettings.do")
                || requestURL.contains("selectLogoutAction.do")
                || requestURL.contains("selectLoginMain.do")
                || requestURL.contains("selectLoginFormProcess.do")
                || requestURL.contains("callReceive.do")
                || requestURL.contains("selectPingTest.do")
                || requestURL.contains(this.loginProcessUrl)
                || requestURL.contains(this.appLoginProcessUrl)
                || requestURL.contains("cmm/mig")
                || requestURL.contains("cmm/usc/usedCar/selectUsedCarBrandList.do")
                || requestURL.contains("cmm/usc/usedCar/selectUsedCarModelList.do")
                || requestURL.contains("cmm/usc/usedCar/selectUsedCarLineList.do")
                || requestURL.contains("ser/ro/workProcess/selectWorkProcessBoard.do")
                || requestURL.contains("ser/ro/workProcess/selectWorkProcessBoardList.do")
                //20200709-服务进度看板不显示数据，需要登录问题。过滤器没有排除新增方法的权限控制  create by sunzhiqiang start
                || requestURL.contains("ser/ro/workProcess/selectServiceProgressList.do")
                //20200709-服务进度看板不显示数据，需要登录问题。过滤器没有排除新增方法的权限控制  create by sunzhiqiang end
                || requestURL.contains("ser/rev/reservationReceipt/selectReservationPlanBoard.do")
                || requestURL.contains("ser/rev/reservationReceipt/selectKanbanReservation.do")
                || requestURL.contains("ser/svi/techManFnMaster/selectTechManFnMasters.do")
                || requestURL.contains("ser/svi/bayManage/selectBayManages.do")
        )){
        	Object loginUser = session.getAttribute("LOGIN_USER");
        	 //2017.09.20 注册
        	if(requestURL.startsWith(appFilterUrl)){
        		this.registerCustomUser((CustomUserVO)loginUser);
        		//新增App后台访问统计 20180703 create by sunzhiqiang start
        		try {
					this.mobStatisticsService.insertAppLogByUserInfo((CustomUserVO)loginUser, requestURL);
				} catch (Exception e) {
					// TODO: handle exception
				}
        		//新增App后台访问统计 20180703 create by sunzhiqiang end
        	}

        	if(session.getAttribute("LOGIN_USER") == null){
                // Ajax 호출인 9경우
                if (httpRequest.getHeader("X-AjaxRequest") != null && "1".equals(httpRequest.getHeader("X-AjaxRequest"))) {
                    httpResponse.setStatus(601);
                    httpResponse.setContentType("application/json");
                    httpResponse.setCharacterEncoding("UTF-8");

                    Errors errors = new Errors();

                    Error error = new Error();
                    error.setErrorCode("601");
                    error.setErrorMessage(messageSource.getMessage("global.err.invalidSession", new Object[]{}, localeResolver.resolveLocale(httpRequest)));

                    errors.add(error);

                    ObjectMapper mapper = new ObjectMapper();
                    try{
                        mapper.writeValue(httpResponse.getWriter(), errors);
                    }catch(Exception e){}
                } else {

                    String contextPath = httpRequest.getContextPath();
                    String loginUrl = null;

                    if (requestURL.contains("/mob")) {
                        loginUrl = "/mob/cmm/login/selectLoginMain.do";
                    }else{
                        loginUrl = "/cmm/ath/login/selectLoginMain.do";
                    }

                    PrintWriter out = response.getWriter();
                    out.println("<script type=\"text/javascript\">\n");
                    out.println("if(window.opener){\n");
                    out.println("    window.self.close();\n");
                    out.println("    window.opener.location.href=\"" + contextPath + loginUrl + "\";\n");
                    out.println("}else{\n");
                    out.println("    window.top.location.href=\"" + contextPath + loginUrl + "\";\n");
                    out.println("}\n");
                    out.println("</script>\n");
                    out.flush();
                    out.close();
                }

                return;
            }
        }

        if (UserDetailsHelper.getAuthenticatedUser() == null || requestURL.contains(this.loginProcessUrl) || requestURL.contains(this.appLoginProcessUrl)) {

        	if (requestURL.contains(this.loginProcessUrl) ||  requestURL.contains(this.appLoginProcessUrl)) {
//                String loginUrl = securityConfig.getLoginUrl();
                String loginFailureUrl = securityConfig.getLoginFailureUrl();
                String usrId = httpRequest.getParameter("usrId");
                String usrPw = httpRequest.getParameter("usrPwEnc");

                CustomUserVO userVO = new CustomUserVO();
                userVO.setUsrId(usrId);
                userVO.setUsrPw(usrPw);

                if(!StringUtils.isBlank(securityConfig.getLoginFailureUrlParameter())){
                    if(!StringUtils.isBlank(httpRequest.getParameter(securityConfig.getLoginFailureUrlParameter()))){
                        loginFailureUrl = httpRequest.getParameter(securityConfig.getLoginFailureUrlParameter());
                    }
                }

//                if(!StringUtils.isBlank(securityConfig.getLoginUrlParameter())){
//                    if(!StringUtils.isBlank(httpRequest.getParameter(securityConfig.getLoginUrlParameter()))){
//                        loginUrl = httpRequest.getParameter(securityConfig.getLoginUrlParameter());
//                    }
//                }

                try {

                    userVO = loginService.actionLogin(userVO);

                    //아이디/비번이 올바르지 않은경우
                    if(userVO == null){
                        LoginError loginError = new LoginError(LoginError.ERROR_INVALID_USER_ID, messageSource.getMessage("global.err.invalid.idpw", new Object[]{}, localeResolver.resolveLocale(httpRequest)));

                        httpRequest.setAttribute("error", loginError);
                        RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(loginFailureUrl);
                        dispatcher.forward(httpRequest, httpResponse);
                        return;

                    //계정이 비활성화 되어 있는 경우
                    }else if("N".equals(userVO.getEnabledYn())){
                        LoginError loginError = new LoginError(LoginError.ERROR_DISABLED_USER, messageSource.getMessage("global.err.login.denied", new Object[]{}, localeResolver.resolveLocale(httpRequest)));

                        httpRequest.setAttribute("error", loginError);
                        RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(loginFailureUrl);
                        dispatcher.forward(httpRequest, httpResponse);
                        return;

                    }else{

                        //세션 타임아웃 시간 설정
                        session.setMaxInactiveInterval(sessionTimes);

                        //사용자 정보 세션저장
                        session.setAttribute("LOGIN_USER", userVO);

                        //2017.09.20 注册
                        if(requestURL.startsWith(appFilterUrl)){
                        	this.registerCustomUser(userVO);
                        }

                        //로그인 추가적인 설정 적용
                        loginService.afterLogin(httpRequest, httpResponse, userVO);

                        @SuppressWarnings("rawtypes")
                        Map beans = this.applicationContext.getBeansOfType(UsernamePasswordAuthenticationFilter.class);
                        if (beans.size() > 0) {
                            UsernamePasswordAuthenticationFilter springSecurity = (UsernamePasswordAuthenticationFilter)beans.values().toArray()[0];
                            springSecurity.setPostOnly(false);
                            String lpu = this.loginProcessUrl;
                            if( requestURL.contains(this.appLoginProcessUrl)) {
                            	lpu = this.appLoginProcessUrl;
                            }
                            springSecurity.setFilterProcessesUrl(lpu);
                            springSecurity.setUsernameParameter("usrId");
                            springSecurity.setPasswordParameter("usrPwEnc");
                        } else {
                            logger.error("No AuthenticationProcessingFilter");
                            throw new IllegalStateException("No AuthenticationProcessingFilter");
                        }
                    }
                } catch (Exception ex) {
                    LoginError loginError = new LoginError(LoginError.ERROR_UNDIFINED, messageSource.getMessage("global.err.login", new Object[]{}, LocaleContextHolder.getLocale()));

                    httpRequest.setAttribute("error", loginError);
                    RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(loginFailureUrl);
                    dispatcher.forward(httpRequest, httpResponse);
                    return;
                }
        	}
        }

        chain.doFilter(request, response);
    }

    /**
     *
     * @Title: registerCustomUser
     * @Description: 增权限配置
     * @param userVO
     * @return void    返回类型
     * @throws
     */
    private void registerCustomUser(CustomUserVO userVO){
    	SecurityContext context = SecurityContextHolder.getContext();
		Authentication upa = new UsernamePasswordAuthenticationToken(userVO,"yonyou");
		context.setAuthentication(upa);
    }

    public void init(FilterConfig filterConfig) throws ServletException {
        this.config = filterConfig;
        this.applicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(config.getServletContext());

        this.sessionTimes = Integer.parseInt(filterConfig.getInitParameter("sessionTimes"));
        this.loginProcessUrl = config.getInitParameter("loginProcessUrl");
        this.appLoginProcessUrl = config.getInitParameter("appLoginProcessUrl");
        this.securityConfig = applicationContext.getBean(SecurityConfig.class);

        this.localeResolver = (LocaleResolver) applicationContext.getBean("localeResolver", LocaleResolver.class);
        this.loginService = (LoginService) applicationContext.getBean("loginService");
        this.messageSource = (MessageSource)applicationContext.getBean("messageSource");
        this.mobStatisticsService = (MobStatisticsService)applicationContext.getBean("mobStatisticsService");
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
        return ((HttpServletRequest)super.getRequest()).getContextPath() + "/j_spring_security_check";
    }

    @Override
    public String getParameter(String name) {

        if (name.equals("username")) {
            return username;
        }

        if (name.equals("password")) {
            return password;
        }

        return super.getParameter(name);
    }
}

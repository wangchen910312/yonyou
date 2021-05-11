package chn.bhmc.dms.cmm.core.security.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import chn.bhmc.dms.security.vo.MenuAccessSaveVO;

import chn.bhmc.dms.cmm.ath.service.ViewInfoService;
import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.vo.ViewMappingSearchVO;
import chn.bhmc.dms.cmm.ath.vo.ViewMappingVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.security.config.SecurityConfig;
import chn.bhmc.dms.security.vo.CustomUserVO;

public class UserAuthorityFilter implements Filter {

    /**
     * 필터설정 Object
     */
    private FilterConfig config;

    /**
     * 시스템구분
     */
    private String sysCd;

    /**
     * Application Context
     */
    private ApplicationContext applicationContext;

    /**
     * Spring Security 설정
     */
    private SecurityConfig securityConfig;

    /**
     * 화면정보 관리 서비스
     */
    private ViewInfoService viewInfoService;

    /**
     * 화면-역할/사용자 매핑 관리 서비스
     */
    private ViewMappingService viewMappingService;


    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest)request;
        HttpServletResponse httpResponse = (HttpServletResponse)response;
        HttpSession httpSession = httpRequest.getSession();

        if(httpSession.getAttribute("LOGIN_USER") != null){

            //전체화면 정보 조회
            Map<String, String> viewInfoAllMap = viewInfoService.selectViewInfosBySysCd(sysCd);
            String servletPath = httpRequest.getServletPath();
            String viewId = null;

            //쿼리스트링이 포함된 URL 인 경우
            if(httpRequest.getQueryString() == null){
                viewId = viewInfoAllMap.get(servletPath);

            //쿼리스트링이 포함되지 않은 URL 인 경우
            }else{
                String servletPathWithQueryString = servletPath+"?"+httpRequest.getQueryString();

                //쿼리스트링을 포함하는 경로에 해당하는 화면정보가 있다면 해당화면ID를 설정하고
                //그렇지 않다면 서블릿경로+"_"에 해당하는 화면ID를 설정한다.
                viewId = viewInfoAllMap.get(servletPathWithQueryString) == null? viewInfoAllMap.get(servletPathWithQueryString):viewInfoAllMap.get(servletPath+"_");
            }

            if(viewId != null){

                //화면-역할/사용자 매핑 정보 조회
                Map<String, Integer> viewMappingMap = new HashMap<String, Integer>();
                ViewMappingSearchVO viewMappingSearchVO = new ViewMappingSearchVO();
                viewMappingSearchVO.setsSysCd(sysCd);
                viewMappingSearchVO.setsRefTp(Constants.VIEW_AUTH_REF_TP_USER);

                List<ViewMappingVO> list = new ArrayList<ViewMappingVO>();

                try{
                    list = viewMappingService.selectViewMappingsByCondition(viewMappingSearchVO);
                }catch(Exception e){
                    e.printStackTrace();
                }

                for(ViewMappingVO viewMappingVO : list){
                    viewMappingMap.put(viewMappingVO.getViewId()+"_"+viewMappingVO.getRefId(), viewMappingVO.getMask());
                }

                String usrId = ((CustomUserVO)httpSession.getAttribute("LOGIN_USER")).getUsrId();
                if(viewMappingMap.get(viewId + "_" + usrId) == null){
                    RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(securityConfig.getAccessDeniedUrl());
                    dispatcher.forward(httpRequest, httpResponse);

                    return;
                }else{
                    MenuAccessSaveVO menuAccessSaveVO = new MenuAccessSaveVO();
                    menuAccessSaveVO.setDlrCd(((CustomUserVO)httpSession.getAttribute("LOGIN_USER")).getDlrCd());
                    menuAccessSaveVO.setViewId(viewId);
                    menuAccessSaveVO.setUsrId(usrId);

                    try {
                        viewMappingService.multiMenuAccessInfo(menuAccessSaveVO);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }

        }

        chain.doFilter(request, response);
    }

    public void init(FilterConfig filterConfig) throws ServletException {
        this.config = filterConfig;

        this.sysCd = filterConfig.getServletContext().getInitParameter("SYS_CD");
        this.applicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(config.getServletContext());
        this.securityConfig = applicationContext.getBean(SecurityConfig.class);
        this.viewInfoService = (ViewInfoService) applicationContext.getBean("viewInfoService");
        this.viewMappingService = (ViewMappingService) applicationContext.getBean("viewMappingService");
    }
}

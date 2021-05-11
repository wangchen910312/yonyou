package chn.bhmc.dms.cmm.ath.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author 공통서비스 개발팀 서준식
 * @since 2011. 8. 29.
 * @version 1.0
 * @see
 *
 * <pre>
 * 개정이력(Modification Information)
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2011. 8. 29.    서준식        최초생성
 *
 *  </pre>
 */

public class BhmcSpringSecurityLogoutFilter implements Filter{

	@SuppressWarnings("unused")
	private FilterConfig config;

	//private static final Logger LOGGER = LoggerFactory.getLogger(BhmcSpringSecurityLogoutFilter.class);

	public void destroy() {}


	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

	    HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse res = (HttpServletResponse)response;
        HttpSession session = req.getSession();

        String logoutSuccessUrl = req.getParameter("logoutSuccessUrl");

        if(logoutSuccessUrl == null) {
            logoutSuccessUrl = "/cmm/ath/login/selectLoginMain.do";
        }


//        String logoutProcessUrl = "/j_spring_security_logout";
//        boolean isMobileLogin = (Boolean)session.getAttribute("isMobileLogin");

//		if(isMobileLogin) {
//		    //TODO [김종하] XML 등에서 주소 받아오기
//		    loginUrl = "/mob/cmm/login/selectLoginMain.do";
//
//		}

//        req.getSession().setAttribute("loginVO", null);

        /*
        if(session != null) {
            session.invalidate();
        }

		res.sendRedirect(req.getContextPath() + logoutProcessUrl);
		*/

        req.logout();
        if(session != null) {
            try{
                session.invalidate();
            }catch(IllegalStateException e){
            }
        }

        res.sendRedirect(req.getContextPath() + logoutSuccessUrl);

//        res.sendRedirect(req.getContextPath() + "/logout.jsp?logoutSuccessUrl=" + logoutSuccessUrl);

//        req.setAttribute("logoutSuccessUrl", logoutSuccessUrl);
//        RequestDispatcher dispatcher = req.getRequestDispatcher(req.getContextPath() + "/logout.jsp");
//        dispatcher.forward(req, res);


	}

	public void init(FilterConfig filterConfig) throws ServletException {

		this.config = filterConfig;

	}
}

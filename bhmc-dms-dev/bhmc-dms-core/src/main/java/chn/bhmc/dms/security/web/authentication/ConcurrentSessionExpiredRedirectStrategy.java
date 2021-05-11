package chn.bhmc.dms.security.web.authentication;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.web.RedirectStrategy;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : ConcurrentSessionExpiredRecirectStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 9. 24.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 24.     Kang Seok Han     최초 생성
 * </pre>
 */

public class ConcurrentSessionExpiredRedirectStrategy implements RedirectStrategy {

    private String expiredUrl;

    public ConcurrentSessionExpiredRedirectStrategy(String expiredUrl){
        this.expiredUrl = expiredUrl;
    }

    /*
     * @see
     * org.springframework.security.web.RedirectStrategy#sendRedirect(javax.
     * servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse,
     * java.lang.String)
     */
    @Override
    public void sendRedirect(HttpServletRequest request, HttpServletResponse response, String url) throws IOException {

        // Ajax 호출인 경우
        if (request.getHeader("X-AjaxRequest") != null && "1".equals(request.getHeader("X-AjaxRequest"))) {
            response.sendError(601, "This session has been expired");
        } else {

            String contextPath = request.getContextPath();
            String requestURL = request.getRequestURI();
            String loginUrl = null;

            if (requestURL.contains("/mob")) {
                loginUrl = "/mob/cmm/login/selectLoginMain.do";
            }else{
                loginUrl = expiredUrl;
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
    }
}

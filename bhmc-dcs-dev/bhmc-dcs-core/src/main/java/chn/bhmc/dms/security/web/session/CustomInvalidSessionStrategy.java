package chn.bhmc.dms.security.web.session;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.web.session.InvalidSessionStrategy;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomInvalidSessionStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 9. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 25.     Kang Seok Han     최초 생성
 * </pre>
 */

public class CustomInvalidSessionStrategy implements InvalidSessionStrategy {

    private String expiredUrl;

    public CustomInvalidSessionStrategy(String expiredUrl){
        this.expiredUrl = expiredUrl;
    }

    /*
     * @see org.springframework.security.web.session.InvalidSessionStrategy#onInvalidSessionDetected(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    @Override
    public void onInvalidSessionDetected(HttpServletRequest request, HttpServletResponse response) throws IOException,
            ServletException {

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

            response.setContentType("text/html;charset=UTF-8");

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

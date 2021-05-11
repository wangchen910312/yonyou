package chn.bhmc.dms.security.web.authentication;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutHandler;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : CustomLogoutHandler.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 9. 8.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 8.     Kang Seok Han     최초 생성
 * </pre>
 */

public class CustomLogoutHandler implements LogoutHandler {

    /*
     * @see
     * org.springframework.security.web.authentication.logout.LogoutHandler#
     * logout(javax.servlet.http.HttpServletRequest,
     * javax.servlet.http.HttpServletResponse,
     * org.springframework.security.core.Authentication)
     */
    @Override
    public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
        try {
            HttpSession session = request.getSession(false);

            request.logout();

            if(authentication != null){
                authentication.setAuthenticated(false);
            }

            if (session != null) {
                session.invalidate();
            }
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }
}

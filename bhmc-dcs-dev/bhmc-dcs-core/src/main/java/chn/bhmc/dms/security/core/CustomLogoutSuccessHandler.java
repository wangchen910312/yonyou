package chn.bhmc.dms.security.core;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.util.StringUtils;

import chn.bhmc.dms.core.context.WebAppContext;
import chn.bhmc.dms.security.config.SecurityConfig;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : CustomLogoutSuccessHandler.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 9. 7.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 7.     Kang Seok Han     최초 생성
 * </pre>
 */

public class CustomLogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler {
    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {

        SecurityConfig securityConfig = WebAppContext.getApplicationContext().getBean(SecurityConfig.class);
        String logoutSuccessUrl = securityConfig.getLogoutSuccessUrl();
        String logoutSuccessUrlParameter = securityConfig.getLogoutSuccessUrlParameter();

        // 로그아웃 성공후 이동할 페이지
        if (StringUtils.hasText(logoutSuccessUrlParameter)
                && StringUtils.hasText(request.getParameter(logoutSuccessUrlParameter))) {
            logoutSuccessUrl = request.getParameter(logoutSuccessUrlParameter);
        }

        response.sendRedirect(request.getContextPath() + logoutSuccessUrl);
    }
}

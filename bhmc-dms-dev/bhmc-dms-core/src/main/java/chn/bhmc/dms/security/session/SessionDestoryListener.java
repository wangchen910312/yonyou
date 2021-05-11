package chn.bhmc.dms.security.session;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.session.SessionDestroyedEvent;
import org.springframework.security.web.authentication.WebAuthenticationDetails;

import chn.bhmc.dms.security.service.LoginService;
import chn.bhmc.dms.security.vo.SessionSaveVO;


public class SessionDestoryListener implements ApplicationListener<SessionDestroyedEvent> {

    @Autowired
    HttpSession httpSession;

    /**
     * 로그인 서비스
     */
    @Autowired
    private LoginService loginService;
    public void onApplicationEvent(SessionDestroyedEvent event) {

        List<SecurityContext> contexts = event.getSecurityContexts();
        if (contexts.isEmpty() == false) {
            for (SecurityContext ctx : contexts) {
                WebAuthenticationDetails webAuthenticationDetails = (WebAuthenticationDetails) ctx.getAuthentication().getDetails();
                String sessionId = webAuthenticationDetails.getSessionId();
                String userId = ctx.getAuthentication().getName();

                SessionSaveVO sessionSaveVO = new SessionSaveVO();
                sessionSaveVO.setUsrId(userId);
                sessionSaveVO.setSessionId(sessionId);
                loginService.updateSessionInfo(sessionSaveVO);

            }
        }

    }

}
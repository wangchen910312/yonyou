package chn.bhmc.dms.security.session;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.core.session.SessionCreationEvent;

public class SessionCreateListener implements ApplicationListener<SessionCreationEvent> {

    /*private LoginHistoryService loginHistoryService;

    @Autowired
    public void setLoginHistoryService(LoginHistoryService loginHistoryService) {
        this.loginHistoryService = loginHistoryService;
    }*/

    @Autowired
    HttpSession httpSession;

    @Override
    @SuppressWarnings("unused")
    public void onApplicationEvent(SessionCreationEvent event) {

        Object o = event.getSource();
        HttpSession h = httpSession;

    }

}
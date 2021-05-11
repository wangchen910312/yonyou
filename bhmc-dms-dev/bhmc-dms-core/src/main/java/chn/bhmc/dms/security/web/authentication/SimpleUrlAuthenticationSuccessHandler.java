package chn.bhmc.dms.security.web.authentication;

import java.io.IOException;
import java.net.InetAddress;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.WebAuthenticationDetails;

import chn.bhmc.dms.security.service.LoginService;
import chn.bhmc.dms.security.vo.SessionSaveVO;

public class SimpleUrlAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	protected final Log logger = LogFactory.getLog(getClass());

	/**
     * 로그인 서비스
     */
    @Autowired
    private LoginService loginService;

	public SimpleUrlAuthenticationSuccessHandler() {
    }

    /**
     * Invokes the configured {@code RedirectStrategy} with the URL returned by the
     * {@code determineTargetUrl} method.
     * <p>
     * The redirect will not be performed if the response has already been committed.
     */
    protected void handle(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        String targetUrl = determineTargetUrl(request, response);

        WebAuthenticationDetails webAuthenticationDetails = (WebAuthenticationDetails) authentication.getDetails();
        String sessionId = webAuthenticationDetails.getSessionId();
        String userId = authentication.getName();

        //Session 생성 이력 저장
        InetAddress addr = InetAddress.getLocalHost();
        SessionSaveVO sessionSaveVO = new SessionSaveVO();
        sessionSaveVO.setUsrId(userId);
        sessionSaveVO.setSessionId(sessionId);
        sessionSaveVO.setInetAddress(addr.getHostAddress());

        if(loginService.selectSessionInfoByKey(sessionId) == null){
            try{
                loginService.insertSessionInfo(sessionSaveVO);
            }catch(Exception e){
                logger.error(e.getMessage());
            }
        }

        if (response.isCommitted()) {
            logger.debug("Response has already been committed. Unable to redirect to "
                    + targetUrl);
            return;
        }

        // HTMLTagFilter에 의해서 변환된 문자를 복원한다.
        // /selectMain.do&#63;viewId=VIEW-D-10313 ==> /selectHome.do?viewId=DVIEW-D-10313
        targetUrl = targetUrl.replaceAll("&#63;", "?");

        getRedirectStrategy().sendRedirect(request, response, targetUrl);
    }
}

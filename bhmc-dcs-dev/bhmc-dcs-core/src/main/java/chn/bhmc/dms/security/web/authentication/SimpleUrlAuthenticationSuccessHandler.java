package chn.bhmc.dms.security.web.authentication;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

public class SimpleUrlAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	protected final Log logger = LogFactory.getLog(getClass());

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

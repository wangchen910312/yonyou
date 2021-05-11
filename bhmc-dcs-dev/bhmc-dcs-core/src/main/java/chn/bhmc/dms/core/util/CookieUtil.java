package chn.bhmc.dms.core.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : CookieUtil.java
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

public class CookieUtil {
    public static String getCookie(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();

        if (cookies == null) {
            return null;
        }

        for (int i = 0; i < cookies.length; i++) {
            Cookie cookie = cookies[i];

            String cookieName = cookie.getName();
            if (name.equalsIgnoreCase(cookieName)) {
                return cookie.getValue();
            }
        }

        return null;
    }
}

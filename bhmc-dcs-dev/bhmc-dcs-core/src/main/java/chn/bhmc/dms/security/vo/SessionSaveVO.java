package chn.bhmc.dms.security.vo;

import java.io.Serializable;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LoginError.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 7. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 12.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SessionSaveVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4205409816766951858L;

    private String usrId;

    private String sessionId;

    private String inetAddress;

    /**
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }

    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }

    /**
     * @return the sessionId
     */
    public String getSessionId() {
        return sessionId;
    }

    /**
     * @param sessionId the sessionId to set
     */
    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    /**
     * @return the inetAddress
     */
    public String getInetAddress() {
        return inetAddress;
    }

    /**
     * @param inetAddress the inetAddress to set
     */
    public void setInetAddress(String inetAddress) {
        this.inetAddress = inetAddress;
    }


}

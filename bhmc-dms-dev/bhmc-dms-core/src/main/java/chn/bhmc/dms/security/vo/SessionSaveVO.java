package chn.bhmc.dms.security.vo;

import java.io.Serializable;
import java.util.Date;

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

    /**
     * 사용자ID
     */
    private String usrId;

    /***
     * 세션ID
     */
    private String sessionId;

    /**
     * 세션시작일시
     */
    private Date sessionStartDt;

    /**
     * 세션종료일시
     */
    private Date sessionEndDt;

    /**
     * IP
     */
    private String inetAddress;

    /**
     * 등록자ID
     */
    private String regUsrId;

    /**
     * 등록일시
     */
    private Date regDt;

    /**
     * 수정자ID
     */
    private String updtUsrId;

    /**
     * 수정일시
     */
    private Date updtDt;

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
     * @return the sessionStartDt
     */
    public Date getSessionStartDt() {
        return sessionStartDt;
    }

    /**
     * @param sessionStartDt the sessionStartDt to set
     */
    public void setSessionStartDt(Date sessionStartDt) {
        this.sessionStartDt = sessionStartDt;
    }

    /**
     * @return the sessionEndDt
     */
    public Date getSessionEndDt() {
        return sessionEndDt;
    }

    /**
     * @param sessionEndDt the sessionEndDt to set
     */
    public void setSessionEndDt(Date sessionEndDt) {
        this.sessionEndDt = sessionEndDt;
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

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }
}

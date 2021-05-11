package chn.bhmc.dms.cmm.mail.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InternalMailReceiver.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 2.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class InternalMailReceiverSearchVO extends SearchVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6258700436611617966L;

    private String sIntMailId;
    private String sUseYn;
    private String sEnabledYn;
    private String sDelYn;
    private String sDistCd;
    private String sDlrCd;

    /**
     * @return the sIntMailId
     */
    public String getsIntMailId() {
        return sIntMailId;
    }
    /**
     * @param sIntMailId the sIntMailId to set
     */
    public void setsIntMailId(String sIntMailId) {
        this.sIntMailId = sIntMailId;
    }
    /**
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }
    /**
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
    }
    /**
     * @return the sEnabledYn
     */
    public String getsEnabledYn() {
        return sEnabledYn;
    }
    /**
     * @param sEnabledYn the sEnabledYn to set
     */
    public void setsEnabledYn(String sEnabledYn) {
        this.sEnabledYn = sEnabledYn;
    }
    /**
     * @return the sDelYn
     */
    public String getsDelYn() {
        return sDelYn;
    }
    /**
     * @param sDelYn the sDelYn to set
     */
    public void setsDelYn(String sDelYn) {
        this.sDelYn = sDelYn;
    }
    /**
     * @return the sDistCd
     */
    public String getsDistCd() {
        return sDistCd;
    }
    /**
     * @param sDistCd the sDistCd to set
     */
    public void setsDistCd(String sDistCd) {
        this.sDistCd = sDistCd;
    }
    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }
    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }
}
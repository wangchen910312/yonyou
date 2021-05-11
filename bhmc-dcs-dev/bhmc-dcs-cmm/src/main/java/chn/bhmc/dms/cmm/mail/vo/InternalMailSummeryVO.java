package chn.bhmc.dms.cmm.mail.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InternalMailSummeryVO.java
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

public class InternalMailSummeryVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1443809598773003039L;

    private String intMailId;
    private String receiveSummId;
    private String receiveId;
    private String sendId;
    private String resvSendYn;
    private String resvDt;
    private String resvHm;
    private String sendDt;
    private String receiveDt;
    private String dlrCd;

    /**
     * @return the intMailId
     */
    public String getIntMailId() {
        return intMailId;
    }
    /**
     * @param intMailId the intMailId to set
     */
    public void setIntMailId(String intMailId) {
        this.intMailId = intMailId;
    }
    /**
     * @return the receiveSummId
     */
    public String getReceiveSummId() {
        return receiveSummId;
    }
    /**
     * @param receiveSummId the receiveSummId to set
     */
    public void setReceiveSummId(String receiveSummId) {
        this.receiveSummId = receiveSummId;
    }
    /**
     * @return the receiveId
     */
    public String getReceiveId() {
        return receiveId;
    }
    /**
     * @param receiveId the receiveId to set
     */
    public void setReceiveId(String receiveId) {
        this.receiveId = receiveId;
    }
    /**
     * @return the sendId
     */
    public String getSendId() {
        return sendId;
    }
    /**
     * @param sendId the sendId to set
     */
    public void setSendId(String sendId) {
        this.sendId = sendId;
    }
    /**
     * @return the resvSendYn
     */
    public String getResvSendYn() {
        return resvSendYn;
    }
    /**
     * @param resvSendYn the resvSendYn to set
     */
    public void setResvSendYn(String resvSendYn) {
        this.resvSendYn = resvSendYn;
    }
    /**
     * @return the resvDt
     */
    public String getResvDt() {
        return resvDt;
    }
    /**
     * @param resvDt the resvDt to set
     */
    public void setResvDt(String resvDt) {
        this.resvDt = resvDt;
    }
    /**
     * @return the resvHm
     */
    public String getResvHm() {
        return resvHm;
    }
    /**
     * @param resvHm the resvHm to set
     */
    public void setResvHm(String resvHm) {
        this.resvHm = resvHm;
    }
    /**
     * @return the sendDt
     */
    public String getSendDt() {
        return sendDt;
    }
    /**
     * @param sendDt the sendDt to set
     */
    public void setSendDt(String sendDt) {
        this.sendDt = sendDt;
    }
    /**
     * @return the receiveDt
     */
    public String getReceiveDt() {
        return receiveDt;
    }
    /**
     * @param receiveDt the receiveDt to set
     */
    public void setReceiveDt(String receiveDt) {
        this.receiveDt = receiveDt;
    }
    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }
    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }
}
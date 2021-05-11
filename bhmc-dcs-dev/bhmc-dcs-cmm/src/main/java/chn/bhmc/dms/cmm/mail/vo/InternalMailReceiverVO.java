package chn.bhmc.dms.cmm.mail.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

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

public class InternalMailReceiverVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6258700436611617966L;

    private String intMailId;
    private String receiveSummId;
    private String distCd;
    private String distNm;
    private String dlrCd;
    private String dlrNm;
    private String refTp;
    private String refId;
    private String usrId;
    private String usrNm;
    private String roleId;
    private String roleNm;
    private String roleDetlCont;

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
     * @return the distCd
     */
    public String getDistCd() {
        return distCd;
    }
    /**
     * @param distCd the distCd to set
     */
    public void setDistCd(String distCd) {
        this.distCd = distCd;
    }
    /**
     * @return the distNm
     */
    public String getDistNm() {
        return distNm;
    }
    /**
     * @param distNm the distNm to set
     */
    public void setDistNm(String distNm) {
        this.distNm = distNm;
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
    /**
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }
    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }
    /**
     * @return the refTp
     */
    public String getRefTp() {
        return refTp;
    }
    /**
     * @param refTp the refTp to set
     */
    public void setRefTp(String refTp) {
        this.refTp = refTp;
    }
    /**
     * @return the refId
     */
    public String getRefId() {
        return refId;
    }
    /**
     * @param refId the refId to set
     */
    public void setRefId(String refId) {
        this.refId = refId;
    }
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
     * @return the usrNm
     */
    public String getUsrNm() {
        return usrNm;
    }
    /**
     * @param usrNm the usrNm to set
     */
    public void setUsrNm(String usrNm) {
        this.usrNm = usrNm;
    }
    /**
     * @return the roleId
     */
    public String getRoleId() {
        return roleId;
    }
    /**
     * @param roleId the roleId to set
     */
    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
    /**
     * @return the roleNm
     */
    public String getRoleNm() {
        return roleNm;
    }
    /**
     * @param roleNm the roleNm to set
     */
    public void setRoleNm(String roleNm) {
        this.roleNm = roleNm;
    }
    /**
     * @return the roleDetlCont
     */
    public String getRoleDetlCont() {
        return roleDetlCont;
    }
    /**
     * @param roleDetlCont the roleDetlCont to set
     */
    public void setRoleDetlCont(String roleDetlCont) {
        this.roleDetlCont = roleDetlCont;
    }
}
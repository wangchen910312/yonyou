package chn.bhmc.dms.cmm.mail.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InternalMailVO.java
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

public class InternalMailVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6979245778435955710L;

    private String intMailId;
    private String intMailTitleNm;
    private String intMailCont;
    private String resvSendYn;
    private String resvSendYnFlag;
    private String resvDt;
    private String resvHm;
    private String fileYn;
    private String fileDocNo;
    private String usrNm;

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
     * @return the intMailTitleNm
     */
    public String getIntMailTitleNm() {
        return intMailTitleNm;
    }
    /**
     * @param intMailTitleNm the intMailTitleNm to set
     */
    public void setIntMailTitleNm(String intMailTitleNm) {
        this.intMailTitleNm = intMailTitleNm;
    }
    /**
     * @return the intMailCont
     */
    public String getIntMailCont() {
        return intMailCont;
    }
    /**
     * @param intMailCont the intMailCont to set
     */
    public void setIntMailCont(String intMailCont) {
        this.intMailCont = intMailCont;
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
     * @return the resvSendYnFlag
     */
    public String getResvSendYnFlag() {
        return resvSendYnFlag;
    }
    /**
     * @param resvSendYnFlag the resvSendYnFlag to set
     */
    public void setResvSendYnFlag(String resvSendYnFlag) {
        this.resvSendYnFlag = resvSendYnFlag;
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
     * @return the fileYn
     */
    public String getFileYn() {
        return fileYn;
    }
    /**
     * @param fileYn the fileYn to set
     */
    public void setFileYn(String fileYn) {
        this.fileYn = fileYn;
    }
    /**
     * @return the fileDocNo
     */
    public String getFileDocNo() {
        return fileDocNo;
    }
    /**
     * @param fileDocNo the fileDocNo to set
     */
    public void setFileDocNo(String fileDocNo) {
        this.fileDocNo = fileDocNo;
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
}
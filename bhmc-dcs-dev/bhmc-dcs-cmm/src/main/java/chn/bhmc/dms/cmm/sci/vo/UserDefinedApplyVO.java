package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserDefinedApplyVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 26.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class UserDefinedApplyVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6420407074223608696L;

    private String usrDefReqDocId;
    private String usrDefReqDocNm;
    private String usrDefReqCont;
    private String startDt;
    private String endDt;
    private String dlrCd;
    private String regUsrId;
    private String writer;
    private String approveStatCd;
    private String approveUsrId;
    private String approveUsrNm;
    private String approveDt;

    /**
     * @return the usrDefReqDocId
     */
    public String getUsrDefReqDocId() {
        return usrDefReqDocId;
    }
    /**
     * @param usrDefReqDocId the usrDefReqDocId to set
     */
    public void setUsrDefReqDocId(String usrDefReqDocId) {
        this.usrDefReqDocId = usrDefReqDocId;
    }
    /**
     * @return the usrDefReqDocNm
     */
    public String getUsrDefReqDocNm() {
        return usrDefReqDocNm;
    }
    /**
     * @param usrDefReqDocNm the usrDefReqDocNm to set
     */
    public void setUsrDefReqDocNm(String usrDefReqDocNm) {
        this.usrDefReqDocNm = usrDefReqDocNm;
    }
    /**
     * @return the usrDefReqCont
     */
    public String getUsrDefReqCont() {
        return usrDefReqCont;
    }
    /**
     * @param usrDefReqCont the usrDefReqCont to set
     */
    public void setUsrDefReqCont(String usrDefReqCont) {
        this.usrDefReqCont = usrDefReqCont;
    }
    /**
     * @return the startDt
     */
    public String getStartDt() {
        return startDt;
    }
    /**
     * @param startDt the startDt to set
     */
    public void setStartDt(String startDt) {
        this.startDt = startDt;
    }
    /**
     * @return the endDt
     */
    public String getEndDt() {
        return endDt;
    }
    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(String endDt) {
        this.endDt = endDt;
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
     * @return the writer
     */
    public String getWriter() {
        return writer;
    }
    /**
     * @param writer the writer to set
     */
    public void setWriter(String writer) {
        this.writer = writer;
    }
    /**
     * @return the approveStatCd
     */
    public String getApproveStatCd() {
        return approveStatCd;
    }
    /**
     * @param approveStatCd the approveStatCd to set
     */
    public void setApproveStatCd(String approveStatCd) {
        this.approveStatCd = approveStatCd;
    }
    /**
     * @return the approveUsrId
     */
    public String getApproveUsrId() {
        return approveUsrId;
    }
    /**
     * @param approveUsrId the approveUsrId to set
     */
    public void setApproveUsrId(String approveUsrId) {
        this.approveUsrId = approveUsrId;
    }
    /**
     * @return the approveUsrNm
     */
    public String getApproveUsrNm() {
        return approveUsrNm;
    }
    /**
     * @param approveUsrNm the approveUsrNm to set
     */
    public void setApproveUsrNm(String approveUsrNm) {
        this.approveUsrNm = approveUsrNm;
    }
    /**
     * @return the approveDt
     */
    public String getApproveDt() {
        return approveDt;
    }
    /**
     * @param approveDt the approveDt to set
     */
    public void setApproveDt(String approveDt) {
        this.approveDt = approveDt;
    }
}
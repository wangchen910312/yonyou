package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SurveyReplyVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class SurveyReplyVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4373363685883140161L;

    private String  usrDefReqDocId;
    private String  usrDefReqDocNm;
    private String  dlrCd;
    private String  dlrNm;
    private String  usrNm;
    private String  writer;
    private String  startDt;
    private String  endDt;
    private String  approveStatCd;
    private String  approveUsrId;
    private String  approveUsrNm;
    private String  approveDt;
    private int     atcNo;
    private String  atcRsltInsCont;
    private String  atcEtcInsCont;

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
    /**
     * @return the atcNo
     */
    public int getAtcNo() {
        return atcNo;
    }
    /**
     * @param atcNo the atcNo to set
     */
    public void setAtcNo(int atcNo) {
        this.atcNo = atcNo;
    }
    /**
     * @return the atcRsltInsCont
     */
    public String getAtcRsltInsCont() {
        return atcRsltInsCont;
    }
    /**
     * @param atcRsltInsCont the atcRsltInsCont to set
     */
    public void setAtcRsltInsCont(String atcRsltInsCont) {
        this.atcRsltInsCont = atcRsltInsCont;
    }
    /**
     * @return the atcEtcInsCont
     */
    public String getAtcEtcInsCont() {
        return atcEtcInsCont;
    }
    /**
     * @param atcEtcInsCont the atcEtcInsCont to set
     */
    public void setAtcEtcInsCont(String atcEtcInsCont) {
        this.atcEtcInsCont = atcEtcInsCont;
    }
}
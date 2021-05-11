package chn.bhmc.dms.sal.fas.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CoercionApprovalVO.java
 * @Description : 강제판매승인 VO
 * @author Jin Suk Kim
 * @since 2016. 3. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 22.     Jin Suk Kim     최초 생성
 * </pre>
 */

public class CoercionApprovalVO extends BaseVO{
    private static final long serialVersionUID = 8835548827065572989L;

    private int seq;                // 일련번호
    private String reqStatCd;       // 요청상태 (승인/불승인 상태 여부)
    private String dlrCd;
    private String dlrNm;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date  reqDt;
    private String fceSaleReqReasonCd;  // 예외사유코드
    private String carlineCd;
    private String carlineNm;
    private String vinNo;
    private String vinNo1;
    private String vinNo2;
    private String rfidNo;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date realDlDt;   // 실제고객 인도일
    private String approveYn;   // 심사여부
    private String fileDocNo;   // 첨부파일

    private String updtUsrId;   // 수정자
    private String approveId;   // 승인자id



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
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }
    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }
    /**
     * @return the reqStatCd
     */
    public String getReqStatCd() {
        return reqStatCd;
    }
    /**
     * @param reqStatCd the reqStatCd to set
     */
    public void setReqStatCd(String reqStatCd) {
        this.reqStatCd = reqStatCd;
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
     * @return the reqDt
     */
    public Date getReqDt() {
        return reqDt;
    }
    /**
     * @param reqDt the reqDt to set
     */
    public void setReqDt(Date reqDt) {
        this.reqDt = reqDt;
    }
    /**
     * @return the fceSaleReqReasonCd
     */
    public String getFceSaleReqReasonCd() {
        return fceSaleReqReasonCd;
    }
    /**
     * @param fceSaleReqReasonCd the fceSaleReqReasonCd to set
     */
    public void setFceSaleReqReasonCd(String fceSaleReqReasonCd) {
        this.fceSaleReqReasonCd = fceSaleReqReasonCd;
    }
    /**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }
    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }
    /**
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }
    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }
    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }
    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }
    /**
     * @return the vinNo1
     */
    public String getVinNo1() {
        return vinNo1;
    }
    /**
     * @param vinNo1 the vinNo1 to set
     */
    public void setVinNo1(String vinNo1) {
        this.vinNo1 = vinNo1;
    }
    /**
     * @return the vinNo2
     */
    public String getVinNo2() {
        return vinNo2;
    }
    /**
     * @param vinNo2 the vinNo2 to set
     */
    public void setVinNo2(String vinNo2) {
        this.vinNo2 = vinNo2;
    }
    /**
     * @return the rfidNo
     */
    public String getRfidNo() {
        return rfidNo;
    }
    /**
     * @param rfidNo the rfidNo to set
     */
    public void setRfidNo(String rfidNo) {
        this.rfidNo = rfidNo;
    }
    /**
     * @return the realDlDt
     */
    public Date getRealDlDt() {
        return realDlDt;
    }
    /**
     * @param realDlDt the realDlDt to set
     */
    public void setRealDlDt(Date realDlDt) {
        this.realDlDt = realDlDt;
    }
    /**
     * @return the approveYn
     */
    public String getApproveYn() {
        return approveYn;
    }
    /**
     * @param approveYn the approveYn to set
     */
    public void setApproveYn(String approveYn) {
        this.approveYn = approveYn;
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
     * @return the approveId
     */
    public String getApproveId() {
        return approveId;
    }
    /**
     * @param approveId the approveId to set
     */
    public void setApproveId(String approveId) {
        this.approveId = approveId;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}

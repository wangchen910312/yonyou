package chn.bhmc.dms.sal.svo.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AskHelpCarVO
 * @Description : 구원차/대부차신청 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016.02.23      Kim Jin Suk        최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"          , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="usrId"          , mesgKey="sal.lbl.usrId")
   ,@ValidField(field="reqNo"         , mesgKey="sal.lbl.reqNo")
   ,@ValidField(field="reqDt"          , mesgKey="sal.lbl.reqDt")
   ,@ValidField(field="evalGradeCd"    , mesgKey="sal.lbl.evalGradeCd")
   ,@ValidField(field="salePrsnNm"     , mesgKey="sal.lbl.salePrsnNm")
   ,@ValidField(field="salePrsnTelNo"  , mesgKey="sal.lbl.salePrsnTelNo")
   ,@ValidField(field="tpCd"           , mesgKey="sal.lbl.tpCd")
   ,@ValidField(field="reqTp"          , mesgKey="sal.lbl.reqTp")
   ,@ValidField(field="uploadSeq"      , mesgKey="sal.lbl.uploadSeq")
   ,@ValidField(field="remark"         , mesgKey="sal.lbl.remark")
   ,@ValidField(field="approveCd"      , mesgKey="sal.lbl.approveCd")
   ,@ValidField(field="approveEndDt"   , mesgKey="sal.lbl.approveEndDt")
   ,@ValidField(field="lastApproveCnt" , mesgKey="sal.lbl.lastApproveCnt")
   ,@ValidField(field="lastApproveDt"  , mesgKey="sal.lbl.lastApproveDt")
   ,@ValidField(field="delYn"          , mesgKey="sal.lbl.delYn")
   ,@ValidField(field="fsdmAgrYn"      , mesgKey="sal.lbl.fsdmAgrYn")
   ,@ValidField(field="fsmdAgrDt"      , mesgKey="sal.lbl.fsmdAgrDt")
   ,@ValidField(field="regUsrId"       , mesgKey="sal.lbl.regUsrId")
   ,@ValidField(field="regDt"          , mesgKey="sal.lbl.regDt")
   ,@ValidField(field="updtUsrId"      , mesgKey="sal.lbl.updtUsrId")
   ,@ValidField(field="updtDt"         , mesgKey="sal.lbl.updtDt")
   })
public class AskHelpCarVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2396054457495152808L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private  String          dlrCd;

    /**
     * 사용자ID
     **/
    private  String          usrId;
    private  String          usrNm;

    /**
     * 요청일련번호
     **/
    private  int             reqNo;
    
    /**
     * 신청번호
     **/
    private  String          reqCarNo;

    /**
     * 요청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            reqDt;

    /**
     * 심사등급코드
     **/
    //EVAL_GRADE_CD
    private  String          evalGradeCd;

    /**
     * 판매담당자명
     **/
    //SALE_PRSN_NM
    private  String          salePrsnNm;

    /**
     * 판매담당자전화번호
     **/
    //SALE_PRSN_TEL_NO
    private  String          salePrsnTelNo;

    /**
     * 유형코드
     **/
    //TP_CD
    private  String          tpCd;

    /**
     * 요청유형
     **/
    //REQ_TP
    private  String          reqTp;

    /**
     * 갱신관련영수증 업로드
     **/
    //UPLOAD_SEQ_RENEWAL
    private  String          uploadSeqRenewal;

    /**
     * 업로드일련번호
     **/
    //UPLOAD_SEQ
    private  String         uploadSeq;

    /**
     * 비고
     **/
    //REMARK
    private  String          remark;

    /**
     * 승인여부
     **/
    private  String          approveCd;

    /**
     * 승인종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            approveEndDt;

    /**
     * 최종승인차수
     **/
    //LAST_APPROVE_CNT
    private  int             lastApproveCnt;

    /**
     * 최종승인일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            lastApproveDt;

    /**
     * 삭제여부
     **/
    //DEL_YN
    private  String          delYn;

    /**
     * FSDM_AGR_YN
     **/
    //FSDM_AGR_YN
    private  String          fsdmAgrYn;

    /**
     * FSMD_AGR_DT
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            fsmdAgrDt;

    /**
     * 등록자ID
     **/
    private  String          regUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            regDt;

    /**
     * 수정자ID
     **/
    private  String          updtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            updtDt;

    /**
     * 수량
     **/
    private  int          spcCarQty;

    /**
     * 심사일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            evalDt;

    private String policyCont;

    /**
     * @return the policyCont
     */
    public String getPolicyCont() {
        return policyCont;
    }

    /**
     * @param policyCont the policyCont to set
     */
    public void setPolicyCont(String policyCont) {
        this.policyCont = policyCont;
    }

    /**
     * 딜러지역
     */
    private String distCd;

    /**
     * 딜러명
     */
    private String dlrNm;

    /**
     * 심사여부
     */
    private String evalRsltYn;

    /**
     * 심사 일련번호
     */
    private int spcOrdSeq;

    /**
     * 심사자 id
     */
    private String pevalId;

    /**
     * 심사평가
     */
    private String judgeRemark;

    /**
     * 인수차량 이미지 파일명
     */
    private String fileNm;

    /**
     * 인수차량 이미지 파일 문서번호
     */
    private String fileDocNo;

    /**
     * 인수차량 이미지 파일번호
     */
    private int fileNo;

    /**
     * 인수차량 이미지 갱신여부
     */
    private String fileImgUploadFlag;

    /**
     * 인수차량 이미지 업로드한 시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date fileUploadDt;

    /**
     * 차량 이미지 업로드 여부
     */
    private String carImgYn;

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
     * @return the reqNo
     */
    public int getReqNo() {
        return reqNo;
    }

    /**
     * @param reqNo the reqNo to set
     */
    public void setReqNo(int reqNo) {
        this.reqNo = reqNo;
    }
    
    /**
     * @return the reqCarNo
     */
    public String getReqCarNo() {
        return reqCarNo;
    }

    /**
     * @param reqCarNo the reqCarNo to set
     */
    public void setReqCarNo(String reqCarNo) {
        this.reqCarNo = reqCarNo;
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
     * @return the evalGradeCd
     */
    public String getEvalGradeCd() {
        return evalGradeCd;
    }

    /**
     * @param evalGradeCd the evalGradeCd to set
     */
    public void setEvalGradeCd(String evalGradeCd) {
        this.evalGradeCd = evalGradeCd;
    }

    /**
     * @return the salePrsnNm
     */
    public String getSalePrsnNm() {
        return salePrsnNm;
    }

    /**
     * @param salePrsnNm the salePrsnNm to set
     */
    public void setSalePrsnNm(String salePrsnNm) {
        this.salePrsnNm = salePrsnNm;
    }

    /**
     * @return the salePrsnTelNo
     */
    public String getSalePrsnTelNo() {
        return salePrsnTelNo;
    }

    /**
     * @param salePrsnTelNo the salePrsnTelNo to set
     */
    public void setSalePrsnTelNo(String salePrsnTelNo) {
        this.salePrsnTelNo = salePrsnTelNo;
    }

    /**
     * @return the tpCd
     */
    public String getTpCd() {
        return tpCd;
    }

    /**
     * @param tpCd the tpCd to set
     */
    public void setTpCd(String tpCd) {
        this.tpCd = tpCd;
    }

    /**
     * @return the reqTp
     */
    public String getReqTp() {
        return reqTp;
    }

    /**
     * @param reqTp the reqTp to set
     */
    public void setReqTp(String reqTp) {
        this.reqTp = reqTp;
    }

    /**
     * @return the uploadSeqRenewal
     */
    public String getUploadSeqRenewal() {
        return uploadSeqRenewal;
    }

    /**
     * @param uploadSeqRenewal the uploadSeqRenewal to set
     */
    public void setUploadSeqRenewal(String uploadSeqRenewal) {
        this.uploadSeqRenewal = uploadSeqRenewal;
    }

    /**
     * @return the uploadSeq
     */
    public String getUploadSeq() {
        return uploadSeq;
    }

    /**
     * @param uploadSeq the uploadSeq to set
     */
    public void setUploadSeq(String uploadSeq) {
        this.uploadSeq = uploadSeq;
    }

    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return the approveCd
     */
    public String getApproveCd() {
        return approveCd;
    }

    /**
     * @param approveCd the approveCd to set
     */
    public void setApproveCd(String approveCd) {
        this.approveCd = approveCd;
    }

    /**
     * @return the approveEndDt
     */
    public Date getApproveEndDt() {
        return approveEndDt;
    }

    /**
     * @param approveEndDt the approveEndDt to set
     */
    public void setApproveEndDt(Date approveEndDt) {
        this.approveEndDt = approveEndDt;
    }

    /**
     * @return the lastApproveCnt
     */
    public int getLastApproveCnt() {
        return lastApproveCnt;
    }

    /**
     * @param lastApproveCnt the lastApproveCnt to set
     */
    public void setLastApproveCnt(int lastApproveCnt) {
        this.lastApproveCnt = lastApproveCnt;
    }

    /**
     * @return the lastApproveDt
     */
    public Date getLastApproveDt() {
        return lastApproveDt;
    }

    /**
     * @param lastApproveDt the lastApproveDt to set
     */
    public void setLastApproveDt(Date lastApproveDt) {
        this.lastApproveDt = lastApproveDt;
    }

    /**
     * @return the delYn
     */
    public String getDelYn() {
        return delYn;
    }

    /**
     * @param delYn the delYn to set
     */
    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }

    /**
     * @return the fsdmAgrYn
     */
    public String getFsdmAgrYn() {
        return fsdmAgrYn;
    }

    /**
     * @param fsdmAgrYn the fsdmAgrYn to set
     */
    public void setFsdmAgrYn(String fsdmAgrYn) {
        this.fsdmAgrYn = fsdmAgrYn;
    }

    /**
     * @return the fsmdAgrDt
     */
    public Date getFsmdAgrDt() {
        return fsmdAgrDt;
    }

    /**
     * @param fsmdAgrDt the fsmdAgrDt to set
     */
    public void setFsmdAgrDt(Date fsmdAgrDt) {
        this.fsmdAgrDt = fsmdAgrDt;
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

    /**
     * @return the spcCarQty
     */
    public int getSpcCarQty() {
        return spcCarQty;
    }

    /**
     * @param spcCarQty the spcCarQty to set
     */
    public void setSpcCarQty(int spcCarQty) {
        this.spcCarQty = spcCarQty;
    }

    /**
     * @return the evalDt
     */
    public Date getEvalDt() {
        return evalDt;
    }

    /**
     * @param evalDt the evalDt to set
     */
    public void setEvalDt(Date evalDt) {
        this.evalDt = evalDt;
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
     * @return the evalRsltYn
     */
    public String getEvalRsltYn() {
        return evalRsltYn;
    }

    /**
     * @param evalRsltYn the evalRsltYn to set
     */
    public void setEvalRsltYn(String evalRsltYn) {
        this.evalRsltYn = evalRsltYn;
    }

    /**
     * @return the spcOrdSeq
     */
    public int getSpcOrdSeq() {
        return spcOrdSeq;
    }

    /**
     * @param spcOrdSeq the spcOrdSeq to set
     */
    public void setSpcOrdSeq(int spcOrdSeq) {
        this.spcOrdSeq = spcOrdSeq;
    }

    /**
     * @return the pevalId
     */
    public String getPevalId() {
        return pevalId;
    }

    /**
     * @param pevalId the pevalId to set
     */
    public void setPevalId(String pevalId) {
        this.pevalId = pevalId;
    }

    /**
     * @return the judgeRemark
     */
    public String getJudgeRemark() {
        return judgeRemark;
    }

    /**
     * @param judgeRemark the judgeRemark to set
     */
    public void setJudgeRemark(String judgeRemark) {
        this.judgeRemark = judgeRemark;
    }

    /**
     * @return the fileNm
     */
    public String getFileNm() {
        return fileNm;
    }

    /**
     * @param fileNm the fileNm to set
     */
    public void setFileNm(String fileNm) {
        this.fileNm = fileNm;
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
     * @return the fileNo
     */
    public int getFileNo() {
        return fileNo;
    }

    /**
     * @param fileNo the fileNo to set
     */
    public void setFileNo(int fileNo) {
        this.fileNo = fileNo;
    }

    /**
     * @return the fileImgUploadFlag
     */
    public String getFileImgUploadFlag() {
        return fileImgUploadFlag;
    }

    /**
     * @param fileImgUploadFlag the fileImgUploadFlag to set
     */
    public void setFileImgUploadFlag(String fileImgUploadFlag) {
        this.fileImgUploadFlag = fileImgUploadFlag;
    }

    /**
     * @return the fileUploadDt
     */
    public Date getFileUploadDt() {
        return fileUploadDt;
    }

    /**
     * @param fileUploadDt the fileUploadDt to set
     */
    public void setFileUploadDt(Date fileUploadDt) {
        this.fileUploadDt = fileUploadDt;
    }

    /**
     * @return the carImgYn
     */
    public String getCarImgYn() {
        return carImgYn;
    }

    /**
     * @param carImgYn the carImgYn to set
     */
    public void setCarImgYn(String carImgYn) {
        this.carImgYn = carImgYn;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}

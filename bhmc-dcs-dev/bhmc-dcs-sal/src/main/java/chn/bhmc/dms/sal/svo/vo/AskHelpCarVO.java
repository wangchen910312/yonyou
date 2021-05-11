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

    private  String          tpCdNm;

    /**
     * 요청유형
     **/
    //REQ_TP
    private  String          reqTp;

    private  String          reqTpNm;

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

    private String useApproveCd;

    private String approvesCd;

    /**
     * 심사최종등급
     */
    private String maxEval;

    /**
     * 사용자 심사등급
     */
    private String useEval;

   /**
    * 차대번호
    */
    private String vinNo;
    /**
     * 입고일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date grDt;
    /**
     * 출고일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date custSaleDt;
    /**
     * 공장출고일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date pltGiDt;



    /**
     * 사용자 심사여부
     */
    private String useEvalYn;

    private String distOfficeCd; //사업부 코드
    private String officeNm;     //사업부 명

    private String sdptCd; //사무소코드
    private String sdptNm; //사무소명



    private String carlineCd;
    private String carlineNm;
    private String modelCd;
    private String modelNm;
    private String ocnCd;
    private String ocnNm;
    private String extColorCd;
    private String extColorNm;
    private String intColorCd;
    private String intColorNm;
    private String fscpChmMmm;
    private String ordNo;



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
     * @return the tpCdNm
     */
    public String getTpCdNm() {
        return tpCdNm;
    }

    /**
     * @param tpCdNm the tpCdNm to set
     */
    public void setTpCdNm(String tpCdNm) {
        this.tpCdNm = tpCdNm;
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
     * @return the reqTpNm
     */
    public String getReqTpNm() {
        return reqTpNm;
    }

    /**
     * @param reqTpNm the reqTpNm to set
     */
    public void setReqTpNm(String reqTpNm) {
        this.reqTpNm = reqTpNm;
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

    /**`
     * @return the useApproveCd
     */
    public String getUseApproveCd() {
        return useApproveCd;
    }

    /**
     * @param useApproveCd the useApproveCd to set
     */
    public void setUseApproveCd(String useApproveCd) {
        this.useApproveCd = useApproveCd;
    }

    /**
     * @return the approvesCd
     */
    public String getApprovesCd() {
        return approvesCd;
    }

    /**
     * @param approvesCd the approvesCd to set
     */
    public void setApprovesCd(String approvesCd) {
        this.approvesCd = approvesCd;
    }

    /**
     * @return the maxEval
     */
    public String getMaxEval() {
        return maxEval;
    }

    /**
     * @param maxEval the maxEval to set
     */
    public void setMaxEval(String maxEval) {
        this.maxEval = maxEval;
    }

    /**
     * @return the useEval
     */
    public String getUseEval() {
        return useEval;
    }

    /**
     * @param useEval the useEval to set
     */
    public void setUseEval(String useEval) {
        this.useEval = useEval;
    }

    /**
     * @return the useEvalYn
     */
    public String getUseEvalYn() {
        return useEvalYn;
    }

    /**
     * @param useEvalYn the useEvalYn to set
     */
    public void setUseEvalYn(String useEvalYn) {
        this.useEvalYn = useEvalYn;
    }

    /**
     * @return the distOfficeCd
     */
    public String getDistOfficeCd() {
        return distOfficeCd;
    }

    /**
     * @param distOfficeCd the distOfficeCd to set
     */
    public void setDistOfficeCd(String distOfficeCd) {
        this.distOfficeCd = distOfficeCd;
    }

    /**
     * @return the officeNm
     */
    public String getOfficeNm() {
        return officeNm;
    }

    /**
     * @param officeNm the officeNm to set
     */
    public void setOfficeNm(String officeNm) {
        this.officeNm = officeNm;
    }

    /**
     * @return the sdptCd
     */
    public String getSdptCd() {
        return sdptCd;
    }

    /**
     * @param sdptCd the sdptCd to set
     */
    public void setSdptCd(String sdptCd) {
        this.sdptCd = sdptCd;
    }

    /**
     * @return the sdptNm
     */
    public String getSdptNm() {
        return sdptNm;
    }

    /**
     * @param sdptNm the sdptNm to set
     */
    public void setSdptNm(String sdptNm) {
        this.sdptNm = sdptNm;
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
     * @return the grDt
     */
    public Date getGrDt() {
        return grDt;
    }

    /**
     * @param grDt the grDt to set
     */
    public void setGrDt(Date grDt) {
        this.grDt = grDt;
    }

    /**
     * @return the custSaleDt
     */
    public Date getCustSaleDt() {
        return custSaleDt;
    }

    /**
     * @param custSaleDt the custSaleDt to set
     */
    public void setCustSaleDt(Date custSaleDt) {
        this.custSaleDt = custSaleDt;
    }

    /**
     * @return the pltGiDt
     */
    public Date getPltGiDt() {
        return pltGiDt;
    }

    /**
     * @param pltGiDt the pltGiDt to set
     */
    public void setPltGiDt(Date pltGiDt) {
        this.pltGiDt = pltGiDt;
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
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }

    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }

    /**
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }

    /**
     * @param modelNm the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }

    /**
     * @return the ocnCd
     */
    public String getOcnCd() {
        return ocnCd;
    }

    /**
     * @param ocnCd the ocnCd to set
     */
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }

    /**
     * @return the ocnNm
     */
    public String getOcnNm() {
        return ocnNm;
    }

    /**
     * @param ocnNm the ocnNm to set
     */
    public void setOcnNm(String ocnNm) {
        this.ocnNm = ocnNm;
    }

    /**
     * @return the extColorCd
     */
    public String getExtColorCd() {
        return extColorCd;
    }

    /**
     * @param extColorCd the extColorCd to set
     */
    public void setExtColorCd(String extColorCd) {
        this.extColorCd = extColorCd;
    }

    /**
     * @return the extColorNm
     */
    public String getExtColorNm() {
        return extColorNm;
    }

    /**
     * @param extColorNm the extColorNm to set
     */
    public void setExtColorNm(String extColorNm) {
        this.extColorNm = extColorNm;
    }

    /**
     * @return the intColorCd
     */
    public String getIntColorCd() {
        return intColorCd;
    }

    /**
     * @param intColorCd the intColorCd to set
     */
    public void setIntColorCd(String intColorCd) {
        this.intColorCd = intColorCd;
    }

    /**
     * @return the intColorNm
     */
    public String getIntColorNm() {
        return intColorNm;
    }

    /**
     * @param intColorNm the intColorNm to set
     */
    public void setIntColorNm(String intColorNm) {
        this.intColorNm = intColorNm;
    }

    /**
     * @return the fscpChmMmm
     */
    public String getFscpChmMmm() {
        return fscpChmMmm;
    }

    /**
     * @param fscpChmMmm the fscpChmMmm to set
     */
    public void setFscpChmMmm(String fscpChmMmm) {
        this.fscpChmMmm = fscpChmMmm;
    }

    /**
     * @return the ordNo
     */
    public String getOrdNo() {
        return ordNo;
    }

    /**
     * @param ordNo the ordNo to set
     */
    public void setOrdNo(String ordNo) {
        this.ordNo = ordNo;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}

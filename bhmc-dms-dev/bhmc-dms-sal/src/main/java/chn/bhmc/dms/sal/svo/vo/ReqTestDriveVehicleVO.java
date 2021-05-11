package chn.bhmc.dms.sal.svo.vo;

import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.context.i18n.LocaleContextHolder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
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
   ,@ValidField(field="uploadUsrId"    , mesgKey="sal.lbl.uploadUsrId")
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
public class ReqTestDriveVehicleVO extends AbstractExcelDataBinder{

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
     * 시승차 신청번호
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
    private  String          tpNm;

    /**
     * 요청유형
     **/
    //REQ_TP
    private  String          reqTp;
    private  String          reqTpNm;

    /**
     * 갱신관련영수증 업로드
     **/
    //UPLOAD_USR_ID
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
    private  String          approveNm;

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
    private  Date          lastApproveDt;

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
     * 2차 심사결과 비고
     */
    private  String          fsdmAgrRemark;

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

    /**
     * 딜러지역
     */
    private String distCd;

    /**
     * 딜러명
     */
    private String dlrNm;


    /**
     * 합격여부
     **/
    private  String          evalRsltYn;

    /**
     * 보충자료
     **/
    private  String          fileYn;
    
    /**
     * 업로드일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            fileUpDt;

    /**
     * 업로드 파일명
     **/
    private  String          fileUpNm;
    
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
     * 이전 신청일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date asOrdDt;

    /**
     * 이전 제조사 출고일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date asPltGiDt;

    /**
     * 2차심사 상신 비고
     */
    private String evalRemark;

    /**
     * 차종코드
     **/
    //CARLINE_CD
    private  String             carlineCd;

    /**
     * 차종명
     */
    private  String             carlineNm;

    /**
     * 모델코드
     **/
    //MODEL_CD
    private  String             modelCd;

    /**
     * 모델명
     **/
    private  String             modelNm;

    /**
     * OCN코드
     **/
    //OCN_CD
    private  String             ocnCd;

    /**
     * OCN명
     **/
    private  String             ocnNm;

    /**
     * 외장색상코드
     **/
    //EXT_COLOR_CD
    private  String             extColorCd;

    /**
     * 외장색상명
     **/
    private  String             extColorNm;

    /**
     * 내장색상코드
     **/
    //INT_COLOR_CD
    private  String             intColorCd;

    /**
     * 내장색상명
     **/
    private  String             intColorNm;

    private String sdptCd;
    private String sdptNm;
    private String distOfficeCd;
    private String distOfficeNm;
    private String saleDlrSungCd;
    private String saleDlrSungnm;
    private String saleDlrCitycd;
    private String saleDlrCitynm;

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
     * 제조사 출고 날짜
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date pltGiDt;

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
     * @return the tpNm
     */
    public String getTpNm() {
        return tpNm;
    }

    /**
     * @param tpNm the tpNm to set
     */
    public void setTpNm(String tpNm) {
        this.tpNm = tpNm;
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
     * @return the approveNm
     */
    public String getApproveNm() {
        return approveNm;
    }

    /**
     * @param approveNm the approveNm to set
     */
    public void setApproveNm(String approveNm) {
        this.approveNm = approveNm;
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
     * @return the fsdmAgrRemark
     */
    public String getFsdmAgrRemark() {
        return fsdmAgrRemark;
    }

    /**
     * @param fsdmAgrRemark the fsdmAgrRemark to set
     */
    public void setFsdmAgrRemark(String fsdmAgrRemark) {
        this.fsdmAgrRemark = fsdmAgrRemark;
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
     * @return the fileUpDt
     */
    public Date getFileUpDt() {
        return fileUpDt;
    }

    /**
     * @param fileUpDt the fileUpDt to set
     */
    public void setFileUpDt(Date fileUpDt) {
        this.fileUpDt = fileUpDt;
    }

    /**
     * @return the fileUpNm
     */
    public String getFileUpNm() {
        return fileUpNm;
    }

    /**
     * @param fileUpNm the fileUpNm to set
     */
    public void setFileUpNm(String fileUpNm) {
        this.fileUpNm = fileUpNm;
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
     * @return the asOrdDt
     */
    public Date getAsOrdDt() {
        return asOrdDt;
    }

    /**
     * @param asOrdDt the asOrdDt to set
     */
    public void setAsOrdDt(Date asOrdDt) {
        this.asOrdDt = asOrdDt;
    }

    /**
     * @return the asPltGiDt
     */
    public Date getAsPltGiDt() {
        return asPltGiDt;
    }

    /**
     * @param asPltGiDt the asPltGiDt to set
     */
    public void setAsPltGiDt(Date asPltGiDt) {
        this.asPltGiDt = asPltGiDt;
    }

    /**
     * @return the evalRemark
     */
    public String getEvalRemark() {
        return evalRemark;
    }

    /**
     * @param evalRemark the evalRemark to set
     */
    public void setEvalRemark(String evalRemark) {
        this.evalRemark = evalRemark;
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
     * @return the distOfficeNm
     */
    public String getDistOfficeNm() {
        return distOfficeNm;
    }

    /**
     * @param distOfficeNm the distOfficeNm to set
     */
    public void setDistOfficeNm(String distOfficeNm) {
        this.distOfficeNm = distOfficeNm;
    }

    /**
     * @return the saleDlrSungCd
     */
    public String getSaleDlrSungCd() {
        return saleDlrSungCd;
    }

    /**
     * @param saleDlrSungCd the saleDlrSungCd to set
     */
    public void setSaleDlrSungCd(String saleDlrSungCd) {
        this.saleDlrSungCd = saleDlrSungCd;
    }

    /**
     * @return the saleDlrSungnm
     */
    public String getSaleDlrSungnm() {
        return saleDlrSungnm;
    }

    /**
     * @param saleDlrSungnm the saleDlrSungnm to set
     */
    public void setSaleDlrSungnm(String saleDlrSungnm) {
        this.saleDlrSungnm = saleDlrSungnm;
    }

    /**
     * @return the saleDlrCitycd
     */
    public String getSaleDlrCitycd() {
        return saleDlrCitycd;
    }

    /**
     * @param saleDlrCitycd the saleDlrCitycd to set
     */
    public void setSaleDlrCitycd(String saleDlrCitycd) {
        this.saleDlrCitycd = saleDlrCitycd;
    }

    /**
     * @return the saleDlrCitynm
     */
    public String getSaleDlrCitynm() {
        return saleDlrCitynm;
    }

    /**
     * @param saleDlrCitynm the saleDlrCitynm to set
     */
    public void setSaleDlrCitynm(String saleDlrCitynm) {
        this.saleDlrCitynm = saleDlrCitynm;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {

        try{
            switch(cellNo){
                case 0:this.setReqNo(ExcelDataBinderUtil.getIntValue(value)); break;
                case 1:this.setDistCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 2:this.setDlrCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 3:this.setDlrNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 4:this.setUsrId(ExcelDataBinderUtil.toString(value).trim()); break;
                case 5:this.setUsrNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 6:this.setTpNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 7:this.setSalePrsnNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 8:this.setSalePrsnTelNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 9:this.setReqTpNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 10:this.setSpcCarQty(ExcelDataBinderUtil.getIntValue(value)); break;
                case 11:this.setReqDt(ExcelDataBinderUtil.getDateValue(value, "")); break;
                case 12:this.setEvalDt(ExcelDataBinderUtil.getDateValue(value, "")); break;
                case 13:this.setApproveNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 14:this.setEvalRsltYn(ExcelDataBinderUtil.toString(value).trim()); break;
                case 15:this.setFsdmAgrYn(ExcelDataBinderUtil.toString(value).trim()); break;
                default :
            }
        }catch(Exception e){

            ExcelDataBindingException bindingException = new ExcelDataBindingException(messageSource.getMessage("global.err.excelUpload.dataExtract", null, LocaleContextHolder.getLocale()), e);
            bindingException.setRowNo(rowNo);
            bindingException.setColNo(cellNo);
            bindingException.setFieldValue(value.toString());

            throw bindingException;
        }
    }

    public List<ExcelUploadError> validate(ExcelDataBindContext context) {
        return null;
    }
}

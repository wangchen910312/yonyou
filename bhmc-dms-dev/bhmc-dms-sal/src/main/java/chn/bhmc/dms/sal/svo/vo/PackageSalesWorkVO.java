package chn.bhmc.dms.sal.svo.vo;

import java.util.Date;

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
 * @ClassName  : PackageSalesWorkVO
 * @Description : 집단판매업무신청 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since author           description
 *  ===========    =============    ===========================
 *  2016.03.16      Kim Jin Suk        최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="usrId"          , mesgKey="gal.lbl.usrId")
   ,@ValidField(field="reqSeq"         , mesgKey="gal.lbl.reqSeq")
   ,@ValidField(field="carlineCd"      , mesgKey="gal.lbl.carlineCd")
   ,@ValidField(field="evalGradeCd"    , mesgKey="gal.lbl.evalGradeCd")
   ,@ValidField(field="reqStartDt"     , mesgKey="gal.lbl.reqStartDt")
   ,@ValidField(field="reqEndDt"       , mesgKey="gal.lbl.reqEndDt")
   ,@ValidField(field="reqDt"          , mesgKey="gal.lbl.reqDt")
   ,@ValidField(field="atcDstinCd"     , mesgKey="gal.lbl.atcDstinCd")
   ,@ValidField(field="custNm"         , mesgKey="gal.lbl.custNm")
   ,@ValidField(field="atcIntroCont"   , mesgKey="gal.lbl.atcIntroCont")
   ,@ValidField(field="modelCd"        , mesgKey="gal.lbl.modelCd")
   ,@ValidField(field="appQty"         , mesgKey="gal.lbl.appQty")
   ,@ValidField(field="reqQuar"        , mesgKey="gal.lbl.reqQuar")
   ,@ValidField(field="reqRc"          , mesgKey="gal.lbl.reqRc")
   ,@ValidField(field="feePolicyCont"  , mesgKey="gal.lbl.feePolicyCont")
   ,@ValidField(field="dmsOpenYn"      , mesgKey="gal.lbl.dmsOpenYn")
   ,@ValidField(field="poaOfferYn"     , mesgKey="gal.lbl.poaOfferYn")
   ,@ValidField(field="approveCd"      , mesgKey="gal.lbl.approveCd")
   ,@ValidField(field="approveEndDt"   , mesgKey="gal.lbl.approveEndDt")
   ,@ValidField(field="lastApproveCnt" , mesgKey="gal.lbl.lastApproveCnt")
   ,@ValidField(field="lastApproveDt"  , mesgKey="gal.lbl.lastApproveDt")
   ,@ValidField(field="delYn"          , mesgKey="gal.lbl.delYn")
   ,@ValidField(field="applyStartDt"   , mesgKey="gal.lbl.applyStartDt")
   ,@ValidField(field="applyEndDt"     , mesgKey="gal.lbl.applyEndDt")
   ,@ValidField(field="regUsrId"       , mesgKey="gal.lbl.regUsrId")
   ,@ValidField(field="regDt"          , mesgKey="gal.lbl.regDt")
   ,@ValidField(field="updtUsrId"      , mesgKey="gal.lbl.updtUsrId")
   ,@ValidField(field="updtDt"         , mesgKey="gal.lbl.updtDt")
   })
public class PackageSalesWorkVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7269894479829746447L;

    /**
     * 딜러코드
     **/
    private String dlrCd;
    private String dlrNm;

    /**
     * 사용자ID
     **/
    private String usrId;
    private String usrNm;

    /**
     * 요청번호
     **/
    private int reqSeq;

    /**
     * 요청일련번호
     */
    private int reqNo;

    /**
     * 차종코드
     **/
    private String carlineCd;
    private String carlineNm;

    /**
     * 심사등급코드
     **/
    private String evalGradeCd;

    /**
     * 요청시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date reqStartDt;

    /**
     * 요청종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date reqEndDt;

    /**
     * 요청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date reqDt;

    /**
     * 항목구분코드
     **/
    private String atcDstinCd;

    /**
     * 고객명
     **/
    private String custNm;

    /**
     * 항목소개내용
     **/
    private String atcIntroCont;

    /**
     * 모델코드
     **/
    private String modelCd;
    private String modelNm;

    /**
     * 수량
     **/
    private int appQty;

    /**
     * 배치요구
     **/
    private String reqQuar;

    /**
     * 고객요구D/C
     **/
    private String reqRc;

    /**
     * 수수료정책내용
     **/
    private String feePolicyCont;

    /**
     * DMS공개여부
     **/
    private String dmsOpenYn;

    /**
     * 위임장제공여부
     **/
    private String poaOfferYn;

    /**
     * 승인여부
     **/
    private String approveCd;

    private String orgApproveCd;

    /**
     * 승인종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date approveEndDt;

    /**
     * 최종승인차수
     **/

    /**
     * 최종승인일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date lastApproveDt;

    /**
     * 삭제여부
     **/
    private String delYn;

    /**
     * 적용시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date applyStartDt;

    /**
     * 적용종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date applyEndDt;

    /**
     * 확정일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date confirmDt;

    /**
     * 등록자ID
     **/
    private String regUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    /**
     * 수정자ID
     **/
    private String updtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;

    /**
     * 심사 : 심사결과여부
     */
    private String evalRsltYn;
    /**
     * 심사 : 심사자id
     */
    private String pevalId;
    /**
     * 심사 : 비고
     */
    private String remark;

    /**
     * 신청 : 조회 pk
     */
    private String pk;
    /**
     * 신청 : 차량수
     */
    private String carCnt;
    /**
     * 신청 : 총수량
     */
    private String sumQty;
    /**
     * 심사 : 판매지역구분
     */
    private String distCd;


    private String submitGubun;
    private String reqSalNo;

    public String getSubmitGubun() {
		return submitGubun;
	}

	public void setSubmitGubun(String submitGubun) {
		this.submitGubun = submitGubun;
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
     * @return the carCnt
     */
    public String getCarCnt() {
        return carCnt;
    }

    /**
     * @param carCnt the carCnt to set
     */
    public void setCarCnt(String carCnt) {
        this.carCnt = carCnt;
    }

    /**
     * @return the sumQty
     */
    public String getSumQty() {
        return sumQty;
    }

    /**
     * @param sumQty the sumQty to set
     */
    public void setSumQty(String sumQty) {
        this.sumQty = sumQty;
    }

    /**
     * @return the pk
     */
    public String getPk() {
        return pk;
    }

    /**
     * @param pk the pk to set
     */
    public void setPk(String pk) {
        this.pk = pk;
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
     * @param usrId the usrId to set
     */
    public void setUsrNm(String usrNm) {
        this.usrNm = usrNm;
    }

    /**
     * @return the reqSeq
     */
    public int getReqSeq() {
        return reqSeq;
    }

    /**
     * @param reqSeq the reqSeq to set
     */
    public void setReqSeq(int reqSeq) {
        this.reqSeq = reqSeq;
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
     * @return the reqStartDt
     */
    public Date getReqStartDt() {
        return reqStartDt;
    }

    /**
     * @param reqStartDt the reqStartDt to set
     */
    public void setReqStartDt(Date reqStartDt) {
        this.reqStartDt = reqStartDt;
    }

    /**
     * @return the reqEndDt
     */
    public Date getReqEndDt() {
        return reqEndDt;
    }

    /**
     * @param reqEndDt the reqEndDt to set
     */
    public void setReqEndDt(Date reqEndDt) {
        this.reqEndDt = reqEndDt;
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
     * @return the atcDstinCd
     */
    public String getAtcDstinCd() {
        return atcDstinCd;
    }

    /**
     * @param atcDstinCd the atcDstinCd to set
     */
    public void setAtcDstinCd(String atcDstinCd) {
        this.atcDstinCd = atcDstinCd;
    }

    /**
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
    }

    /**
     * @param custNm the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }

    /**
     * @return the atcIntroCont
     */
    public String getAtcIntroCont() {
        return atcIntroCont;
    }

    /**
     * @param atcIntroCont the atcIntroCont to set
     */
    public void setAtcIntroCont(String atcIntroCont) {
        this.atcIntroCont = atcIntroCont;
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
     * @return the appQty
     */
    public int getAppQty() {
        return appQty;
    }

    /**
     * @param appQty the appQty to set
     */
    public void setAppQty(int appQty) {
        this.appQty = appQty;
    }

    /**
     * @return the reqQuar
     */
    public String getReqQuar() {
        return reqQuar;
    }

    /**
     * @param reqQuar the reqQuar to set
     */
    public void setReqQuar(String reqQuar) {
        this.reqQuar = reqQuar;
    }

    /**
     * @return the reqRc
     */
    public String getReqRc() {
        return reqRc;
    }

    /**
     * @param reqRc the reqRc to set
     */
    public void setReqRc(String reqRc) {
        this.reqRc = reqRc;
    }

    /**
     * @return the feePolicyCont
     */
    public String getFeePolicyCont() {
        return feePolicyCont;
    }

    /**
     * @param feePolicyCont the feePolicyCont to set
     */
    public void setFeePolicyCont(String feePolicyCont) {
        this.feePolicyCont = feePolicyCont;
    }

    /**
     * @return the dmsOpenYn
     */
    public String getDmsOpenYn() {
        return dmsOpenYn;
    }

    /**
     * @param dmsOpenYn the dmsOpenYn to set
     */
    public void setDmsOpenYn(String dmsOpenYn) {
        this.dmsOpenYn = dmsOpenYn;
    }

    /**
     * @return the poaOfferYn
     */
    public String getPoaOfferYn() {
        return poaOfferYn;
    }

    /**
     * @param poaOfferYn the poaOfferYn to set
     */
    public void setPoaOfferYn(String poaOfferYn) {
        this.poaOfferYn = poaOfferYn;
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
     * @return the orgApproveCd
     */
    public String getOrgApproveCd() {
        return orgApproveCd;
    }

    /**
     * @param orgApproveCd the orgApproveCd to set
     */
    public void setOrgApproveCd(String orgApproveCd) {
        this.orgApproveCd = orgApproveCd;
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
     * @return the applyStartDt
     */
    public Date getApplyStartDt() {
        return applyStartDt;
    }

    /**
     * @param applyStartDt the applyStartDt to set
     */
    public void setApplyStartDt(Date applyStartDt) {
        this.applyStartDt = applyStartDt;
    }

    /**
     * @return the applyEndDt
     */
    public Date getApplyEndDt() {
        return applyEndDt;
    }

    /**
     * @param applyEndDt the applyEndDt to set
     */
    public void setApplyEndDt(Date applyEndDt) {
        this.applyEndDt = applyEndDt;
    }

    /**
     * @return the confirmDt
     */
    public Date getConfirmDt() {
        return confirmDt;
    }

    /**
     * @param confirmDt the confirmDt to set
     */
    public void setConfirmDt(Date confirmDt) {
        this.confirmDt = confirmDt;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    /**
     * @return the reqSalNo
     */
    public String getReqSalNo() {
        return reqSalNo;
    }

    /**
     * @param reqSalNo the reqSalNo to set
     */
    public void setReqSalNo(String reqSalNo) {
        this.reqSalNo = reqSalNo;
    }

}

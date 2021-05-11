package chn.bhmc.dms.sal.cnt.vo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;





/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   :
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 15.    Kim Jin Suk      최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"       , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="contractNo"  , mesgKey="sal.lbl.contractNo")
   ,@ValidField(field="promotionCd" , mesgKey="sal.lbl.promotionCd")
   ,@ValidField(field="promotionAmt", mesgKey="sal.lbl.promotionAmt")
   ,@ValidField(field="useYn"       , mesgKey="sal.lbl.useYn")
   ,@ValidField(field="regUsrId"    , mesgKey="sal.lbl.regUsrId")
   ,@ValidField(field="regDt"       , mesgKey="sal.lbl.regDt")
   ,@ValidField(field="updtUsrId"   , mesgKey="sal.lbl.updtUsrId")
   ,@ValidField(field="updtDt"      , mesgKey="sal.lbl.updtDt")
   })
public class ContractPromotionVO implements Serializable{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3375779804260946737L;

    /**
     * 딜러코드
     **/
    private  String       dlrCd;

    /**
     * 계약번호
     **/
    private  String       contractNo;

    /**
     * 프로모션코드
     **/
    private  String       promotionCd;

    /**
     * 프로모션금액
     **/
    //PROMOTION_AMT
    private  Double       promotionAmt;

    /**
     * 사용여부
     **/
    private  String       useYn;

    /**
     * 등록자ID
     **/
    private  String       regUsrId;

    /**
     * 등록일자
     **/
    private  Date         regDt;

    /**
     * 수정자ID
     **/
    //UPDT_USR_ID
    private  String       updtUsrId;

    /**
     * 수정일자
     **/
    //UPDT_DT
    private  Date         updtDt;

    /**
     * 프로모션명
     **/
    private  String       promotionNm;

    /**
     * 프로모션유형
     **/
    private  String       promotionTp;

    // 모델
    private String modelCd;

    /**
     * 시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date         startDt;

    /**
     * 종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date         endDt;

    /**
     * 적용유형
     **/
    private  String       applyTp;

    /**
     * 제조사부담율
     **/
    private  Double       imsBudnRate;

    /**
     * 딜러부담율
     **/
    private  Double       dlrBudnRate;

    /**
     * 프로모션 계약유형
     */
    private String contractTp;

    /**
     * CHK
     */
    private String chkYn;

    /**
     * 프로모션 주관타입
     */
    private String promotionOwnCd;

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
     * @return the contractNo
     */
    public String getContractNo() {
        return contractNo;
    }

    /**
     * @param contractNo the contractNo to set
     */
    public void setContractNo(String contractNo) {
        this.contractNo = contractNo;
    }

    /**
     * @return the promotionCd
     */
    public String getPromotionCd() {
        return promotionCd;
    }

    /**
     * @param promotionCd the promotionCd to set
     */
    public void setPromotionCd(String promotionCd) {
        this.promotionCd = promotionCd;
    }

    /**
     * @return the promotionAmt
     */
    public Double getPromotionAmt() {
        return promotionAmt;
    }

    /**
     * @param promotionAmt the promotionAmt to set
     */
    public void setPromotionAmt(Double promotionAmt) {
        this.promotionAmt = promotionAmt;
    }

    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }

    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
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
     * @return the promotionNm
     */
    public String getPromotionNm() {
        return promotionNm;
    }

    /**
     * @param promotionNm the promotionNm to set
     */
    public void setPromotionNm(String promotionNm) {
        this.promotionNm = promotionNm;
    }

    /**
     * @return the promotionTp
     */
    public String getPromotionTp() {
        return promotionTp;
    }

    /**
     * @param promotionTp the promotionTp to set
     */
    public void setPromotionTp(String promotionTp) {
        this.promotionTp = promotionTp;
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
     * @return the startDt
     */
    public Date getStartDt() {
        return startDt;
    }

    /**
     * @param startDt the startDt to set
     */
    public void setStartDt(Date startDt) {
        this.startDt = startDt;
    }

    /**
     * @return the endDt
     */
    public Date getEndDt() {
        return endDt;
    }

    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(Date endDt) {
        this.endDt = endDt;
    }

    /**
     * @return the applyTp
     */
    public String getApplyTp() {
        return applyTp;
    }

    /**
     * @param applyTp the applyTp to set
     */
    public void setApplyTp(String applyTp) {
        this.applyTp = applyTp;
    }

    /**
     * @return the imsBudnRate
     */
    public Double getImsBudnRate() {
        return imsBudnRate;
    }

    /**
     * @param imsBudnRate the imsBudnRate to set
     */
    public void setImsBudnRate(Double imsBudnRate) {
        this.imsBudnRate = imsBudnRate;
    }

    /**
     * @return the dlrBudnRate
     */
    public Double getDlrBudnRate() {
        return dlrBudnRate;
    }

    /**
     * @param dlrBudnRate the dlrBudnRate to set
     */
    public void setDlrBudnRate(Double dlrBudnRate) {
        this.dlrBudnRate = dlrBudnRate;
    }

    /**
     * @return the contractTp
     */
    public String getContractTp() {
        return contractTp;
    }

    /**
     * @param contractTp the contractTp to set
     */
    public void setContractTp(String contractTp) {
        this.contractTp = contractTp;
    }

    /**
     * @return the chkYn
     */
    public String getChkYn() {
        return chkYn;
    }

    /**
     * @param chkYn the chkYn to set
     */
    public void setChkYn(String chkYn) {
        this.chkYn = chkYn;
    }

    /**
     * @return the promotionOwnCd
     */
    public String getPromotionOwnCd() {
        return promotionOwnCd;
    }

    /**
     * @param promotionOwnCd the promotionOwnCd to set
     */
    public void setPromotionOwnCd(String promotionOwnCd) {
        this.promotionOwnCd = promotionOwnCd;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}

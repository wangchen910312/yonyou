package chn.bhmc.dms.sal.prm.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PromotionVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author kim yewon
 * @since 2016. 2. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 15.       Kim yewon             최초 생성
 *
 * </pre>
 */

public class PromotionVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    //프로모션 헤더
    private String dlrCd;                                   //딜러
    private String promotionCd;                             //프로모션코드
    private String promotionNm;                             //프로모션명
    private String promotionTp;                             //프로모션유형코드
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startDt;                                   //시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDt;                                     //종료일자
    private String approveCd;                               //승인여부
    private String applyTp;                                 //적용유형
    private Double promotionAmt;                            //프로모션금액
    private Double imsBudnRate;                             //제조사부담율
    private Double dlrBudnRate;                             //딜러부담율
    private String remark;                                  //비고
    private String regUsrId;                                //등록자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;                                     //등록일자
    private String updtUsrId;                               //수정자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;                                    //수정일자
    private String promotionOwnCd;                          //프로모션주관코드



    //계약유형
    private String contractTp;                              //계약유형
    //대상고객
    private String custCd;                                  //고객코드
    private String custNm;                                  //고객명
    //대상모델
    private String modelCd;                                 //모델코드
    private String modelNm;                                 //모델명
    private String modelCdNm;                               //[모델코드]모델명


    //추가
    private Double promotionAmt1;
    private Double promotionAmt2;



    /**
     * @return the modelCdNm
     */
    public String getModelCdNm() {
        return modelCdNm;
    }
    /**
     * @param modelCdNm the modelCdNm to set
     */
    public void setModelCdNm(String modelCdNm) {
        this.modelCdNm = modelCdNm;
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
     * @return the promotionAmt1
     */
    public Double getPromotionAmt1() {
        return promotionAmt1;
    }
    /**
     * @param promotionAmt1 the promotionAmt1 to set
     */
    public void setPromotionAmt1(Double promotionAmt1) {
        this.promotionAmt1 = promotionAmt1;
    }
    /**
     * @return the promotionAmt2
     */
    public Double getPromotionAmt2() {
        return promotionAmt2;
    }
    /**
     * @param promotionAmt2 the promotionAmt2 to set
     */
    public void setPromotionAmt2(Double promotionAmt2) {
        this.promotionAmt2 = promotionAmt2;
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
     * @return the custCd
     */
    public String getCustCd() {
        return custCd;
    }
    /**
     * @param custCd the custCd to set
     */
    public void setCustCd(String custCd) {
        this.custCd = custCd;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }



    /**
     * {@inheritDoc}
     */
    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        // TODO Auto-generated method stub
        try{
            switch(cellNo){
                case 0:this.setCustCd(ExcelDataBinderUtil.toString(value).trim()); break;   //고객번호
                case 1:this.setCustNm(ExcelDataBinderUtil.toString(value).trim()); break;     //고객명
            }
        }catch(Exception e){

            ExcelDataBindingException bindingException = new ExcelDataBindingException(messageSource.getMessage("global.err.excelUpload.dataExtract", null, LocaleContextHolder.getLocale()), e);
            bindingException.setRowNo(rowNo);
            bindingException.setColNo(cellNo);
            bindingException.setFieldValue(value.toString());

            throw bindingException;
        }
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#validate(chn.bhmc.dms.core.support.excel.ExcelDataBindContext)
     */
    @Override
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {
        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();

        //카드번호
        if(StringUtils.isBlank(this.getCustCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getCustCd(), msg));
        }

        //고객명
        if(StringUtils.isBlank(this.getCustNm())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.custNm", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 1, this.getCustNm(), msg));
        }


        return errors;
    }

}

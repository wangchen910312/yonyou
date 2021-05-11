package chn.bhmc.dms.ser.svi.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.Length;
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
 * @ClassName   : LaborCodeDetailVO.java
 * @Description : 공임코드 상세 VO
 * @author Ki Hyun Kwon
 * @since 2016. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 11.     Ki Hyun Kwon     최초 생성
 * </pre>
 */
@ValidDescriptor({
     @ValidField(field="ltsModelCd" , mesgKey="global.lbl.ltsModelCd")
    ,@ValidField(field="ltsModelNm" , mesgKey="global.lbl.ltsModelNm")
    ,@ValidField(field="lbrHm" , mesgKey="global.lbl.lbrTime")
    ,@ValidField(field="validStartDt" , mesgKey="global.lbl.expStartDt")
    ,@ValidField(field="validEndDt" , mesgKey="global.lbl.expEndDt")
    ,@ValidField(field="delYn" , mesgKey="global.lbl.delYn")

})
public class LaborCodeDetailVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2836411797567859592L;

    /**
     * 구분코드
     */
    @NotEmpty
    private String dstinCd;
    
    private String dstinNm;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * 공임코드
     */
    @NotEmpty
    @Length(min=1, max=10)
    private String lbrCd;

    /**
     * 공임코드명
     */
    @NotEmpty
    @Length(min=3, max=160)
    private String lbrNm;

    /**
     * 수량
     */
    @Length(min=1, max=2)
    private int lbrQty;


    /**
     * LTS MODEL 코드
     */
    private String ltsModelCd;

    /**
     * LTS MODEL 명
     */
    private String ltsModelNm;

    /**
     * 공임시간
     */
    private Double lbrHm;

    /**
     * 유효시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date validStartDt;

    /**
     * 유효종료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date validEndDt;

    /**
     * 삭제여부
     */
    private String delYn;

    private Double lbrRate;

    /**
     * 브랜드 코드
     */
    private String brandCd;

    /**
     * 배정공임
     */
    private Double allocLbrHm;

    /**
     * 공임계수
     */
    private Double lbrCnt;

    /**
     * 난의도
     */
    private Double diffVal;

    /**
     * 정비건수
     */
    private Double serCnt;

    /**
     * 유료공임
     */
    private Double payLbrHm;

    /**
     * 수리유형
     */
    private String lbrTp;
    
    /**
     * 공임코드유형
     */
    private String lbrCdTp;

    /**
     * 보조작업 연관 여부
     */
    private String relCauLbrYn;


    /**
     * @return the dstinCd
     */
    public String getDstinCd() {
        return dstinCd;
    }

    /**
     * @param dstinCd the dstinCd to set
     */
    public void setDstinCd(String dstinCd) {
        this.dstinCd = dstinCd;
    }

    public String getDstinNm() {
        return dstinNm;
    }

    public void setDstinNm(String dstinNm) {
        this.dstinNm = dstinNm;
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
     * @return the lbrCd
     */
    public String getLbrCd() {
        return lbrCd;
    }

    /**
     * @param lbrCd the lbrCd to set
     */
    public void setLbrCd(String lbrCd) {
        this.lbrCd = lbrCd;
    }

    /**
     * @return the ltsModelCd
     */
    public String getLtsModelCd() {
        return ltsModelCd;
    }

    /**
     * @param ltsModelCd the ltsModelCd to set
     */
    public void setLtsModelCd(String ltsModelCd) {
        this.ltsModelCd = ltsModelCd;
    }



    /**
     * @return the ltsModelNm
     */
    public String getLtsModelNm() {
        return ltsModelNm;
    }

    /**
     * @param ltsModelNm the ltsModelNm to set
     */
    public void setLtsModelNm(String ltsModelNm) {
        this.ltsModelNm = ltsModelNm;
    }

    /**
     * @return the lbrHm
     */
    public Double getLbrHm() {
        return lbrHm;
    }

    /**
     * @param lbrHm the lbrHm to set
     */
    public void setLbrHm(Double lbrHm) {
        this.lbrHm = lbrHm;
    }



    /**
     * @return the validStartDt
     */
    public Date getValidStartDt() {
        return validStartDt;
    }

    /**
     * @param validStartDt the validStartDt to set
     */
    public void setValidStartDt(Date validStartDt) {
        this.validStartDt = validStartDt;
    }


    /**
     * @return the validEndDt
     */
    public Date getValidEndDt() {
        return validEndDt;
    }

    /**
     * @param validEndDt the validEndDt to set
     */
    public void setValidEndDt(Date validEndDt) {
        this.validEndDt = validEndDt;
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
     * @return the lbrNm
     */
    public String getLbrNm() {
        return lbrNm;
    }

    /**
     * @param lbrNm the lbrNm to set
     */
    public void setLbrNm(String lbrNm) {
        this.lbrNm = lbrNm;
    }

    /**
     * @return the lbrQty
     */
    public int getLbrQty() {
        return lbrQty;
    }

    /**
     * @param lbrQty the lbrQty to set
     */
    public void setLbrQty(int lbrQty) {
        this.lbrQty = lbrQty;
    }

    /**
     * @return the lbrRate01
     */

    /**
     * @return the brandCd
     */
    public String getBrandCd() {
        return brandCd;
    }

    /**
     * @param brandCd the brandCd to set
     */
    public void setBrandCd(String brandCd) {
        this.brandCd = brandCd;
    }


    /**
     * @return the allocLbrHm
     */
    public Double getAllocLbrHm() {
        return allocLbrHm;
    }

    /**
     * @param allocLbrHm the allocLbrHm to set
     */
    public void setAllocLbrHm(Double allocLbrHm) {
        this.allocLbrHm = allocLbrHm;
    }

    /**
     * @return the lbrCnt
     */
    public Double getLbrCnt() {
        return lbrCnt;
    }

    /**
     * @param lbrCnt the lbrCnt to set
     */
    public void setLbrCnt(Double lbrCnt) {
        this.lbrCnt = lbrCnt;
    }

    /**
     * @return the diffVal
     */
    public Double getDiffVal() {
        return diffVal;
    }

    /**
     * @param diffVal the diffVal to set
     */
    public void setDiffVal(Double diffVal) {
        this.diffVal = diffVal;
    }

    /**
     * @return the serCnt
     */
    public Double getSerCnt() {
        return serCnt;
    }

    /**
     * @param serCnt the serCnt to set
     */
    public void setSerCnt(Double serCnt) {
        this.serCnt = serCnt;
    }

    /**
     * @return the lbrRate
     */
    public Double getLbrRate() {
        return lbrRate;
    }

    /**
     * @param lbrRate the lbrRate to set
     */
    public void setLbrRate(Double lbrRate) {
        this.lbrRate = lbrRate;
    }

    /**
     * @return the payLbrHm
     */
    public Double getPayLbrHm() {
        return payLbrHm;
    }

    /**
     * @param payLbrHm the payLbrHm to set
     */
    public void setPayLbrHm(Double payLbrHm) {
        this.payLbrHm = payLbrHm;
    }

    /**
     * @return the lbrTp
     */
    public String getLbrTp() {
        return lbrTp;
    }

    /**
     * @param lbrTp the lbrTp to set
     */
    public void setLbrTp(String lbrTp) {
        this.lbrTp = lbrTp;
    }

    /**
     * @return the relCauLbrYn
     */
    public String getRelCauLbrYn() {
        return relCauLbrYn;
    }

    /**
     * @param relCauLbrYn the relCauLbrYn to set
     */
    public void setRelCauLbrYn(String relCauLbrYn) {
        this.relCauLbrYn = relCauLbrYn;
    }

    /**
     * @return the lbrCdTp
     */
    public String getLbrCdTp() {
        return lbrCdTp;
    }

    /**
     * @param lbrCdTp the lbrCdTp to set
     */
    public void setLbrCdTp(String lbrCdTp) {
        this.lbrCdTp = lbrCdTp;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0  : this.setDstinCd(ExcelDataBinderUtil.toString(value).trim());                 break;    //구분
                case 1  : this.setLbrCd(ExcelDataBinderUtil.toString(value).trim());                   break;    //공임코드
                case 2  : this.setLbrNm(ExcelDataBinderUtil.toString(value).trim());                   break;    //공임명
                case 3  : this.setLtsModelCd(ExcelDataBinderUtil.toString(value).trim());              break;    //LTS MODEL
                case 4  : this.setLbrHm(ExcelDataBinderUtil.getDoubleValue(value));                    break;    //표준공임
                case 5  : this.setPayLbrHm(ExcelDataBinderUtil.getDoubleValue(value));                 break;    //정비공임
                case 6  : this.setAllocLbrHm(ExcelDataBinderUtil.getDoubleValue(value));               break;    //배분공임
                case 7  : this.setSerCnt(ExcelDataBinderUtil.getDoubleValue(value));                   break;    //정비건수
                case 8  : this.setValidStartDt(ExcelDataBinderUtil.getDateValue(value,"yyyy-MM-dd"));  break;    //시작일
                case 9  : this.setValidEndDt(ExcelDataBinderUtil.getDateValue(value,"yyyy-MM-dd"));    break;    //종료일
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

        //VIN번호
       /* if(StringUtils.isBlank(this.getVinNo())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("ser.lbl.vinNo", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getVinNo(), msg));
        }*/

        return errors;
    }



}

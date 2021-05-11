package chn.bhmc.dms.sal.ctl.vo;

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
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OneShotCtrlMngVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2016. 11. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 10.     Lee Seungmin     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="carlineCd"    , mesgKey="sal.lbl.carlineCd")
   ,@ValidField(field="modelCd"      , mesgKey="global.lbl.modelCode")
   ,@ValidField(field="ocnCd"        , mesgKey="sal.lbl.ocnCd")
   })

public class OneShotCtrlMngVO extends AbstractExcelDataBinder{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4374010336631604789L;

    private String ctrlSeq;             //순번
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   ctrlStartYyMmDt;     //통제시작일시
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   ctrlEndYyMmDt;       //통제종료일시
    private String ctrlGrpCd;           //통제그룹코드
    private String ctrlTargCd;          //통제대상구분코드
    private String dlrCtrlRangeCd;      //딜러통제범위코드
    private String ctrlYn;              //통제여부
    private String remark1;             //주석1
    private String ctrlDlrCd;           //통제딜러코드
    private String remark2;             //주석2
    private String dlrCd;               //딜러코드
    private String dlrNm;               //딜러명
    private String sdptNm;              //사업부명
    private String distOfficeNm;        //사무소명
    private String courseTp;            //좌우그리드구분
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startDtTm;             //통제시작일시
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDtTm;               //통제종료일시
    private String remark;              //주석

    private String strCtrlStartYyMmDt;  //통제시작일시 캐릭터
    private String strCtrlEndYyMmDt;    //통제종료일시 캐릭터


    /**
     * @return the strCtrlStartYyMmDt
     */
    public String getStrCtrlStartYyMmDt() {
        return strCtrlStartYyMmDt;
    }
    /**
     * @param strCtrlStartYyMmDt the strCtrlStartYyMmDt to set
     */
    public void setStrCtrlStartYyMmDt(String strCtrlStartYyMmDt) {
        this.strCtrlStartYyMmDt = strCtrlStartYyMmDt;
    }
    /**
     * @return the strCtrlEndYyMmDt
     */
    public String getStrCtrlEndYyMmDt() {
        return strCtrlEndYyMmDt;
    }
    /**
     * @param strCtrlEndYyMmDt the strCtrlEndYyMmDt to set
     */
    public void setStrCtrlEndYyMmDt(String strCtrlEndYyMmDt) {
        this.strCtrlEndYyMmDt = strCtrlEndYyMmDt;
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
     * @return the courseTp
     */
    public String getCourseTp() {
        return courseTp;
    }
    /**
     * @param courseTp the courseTp to set
     */
    public void setCourseTp(String courseTp) {
        this.courseTp = courseTp;
    }
    /**
     * @return the ctrlSeq
     */
    public String getCtrlSeq() {
        return ctrlSeq;
    }
    /**
     * @param ctrlSeq the ctrlSeq to set
     */
    public void setCtrlSeq(String ctrlSeq) {
        this.ctrlSeq = ctrlSeq;
    }
    /**
     * @return the ctrlStartYyMmDt
     */
    public Date getCtrlStartYyMmDt() {
        return ctrlStartYyMmDt;
    }
    /**
     * @param ctrlStartYyMmDt the ctrlStartYyMmDt to set
     */
    public void setCtrlStartYyMmDt(Date ctrlStartYyMmDt) {
        this.ctrlStartYyMmDt = ctrlStartYyMmDt;
    }
    /**
     * @return the ctrlEndYyMmDt
     */
    public Date getCtrlEndYyMmDt() {
        return ctrlEndYyMmDt;
    }
    /**
     * @param ctrlEndYyMmDt the ctrlEndYyMmDt to set
     */
    public void setCtrlEndYyMmDt(Date ctrlEndYyMmDt) {
        this.ctrlEndYyMmDt = ctrlEndYyMmDt;
    }
    /**
     * @return the ctrlGrpCd
     */
    public String getCtrlGrpCd() {
        return ctrlGrpCd;
    }
    /**
     * @param ctrlGrpCd the ctrlGrpCd to set
     */
    public void setCtrlGrpCd(String ctrlGrpCd) {
        this.ctrlGrpCd = ctrlGrpCd;
    }
    /**
     * @return the ctrlTargCd
     */
    public String getCtrlTargCd() {
        return ctrlTargCd;
    }
    /**
     * @param ctrlTargCd the ctrlTargCd to set
     */
    public void setCtrlTargCd(String ctrlTargCd) {
        this.ctrlTargCd = ctrlTargCd;
    }
    /**
     * @return the dlrCtrlRangeCd
     */
    public String getDlrCtrlRangeCd() {
        return dlrCtrlRangeCd;
    }
    /**
     * @param dlrCtrlRangeCd the dlrCtrlRangeCd to set
     */
    public void setDlrCtrlRangeCd(String dlrCtrlRangeCd) {
        this.dlrCtrlRangeCd = dlrCtrlRangeCd;
    }
    /**
     * @return the ctrlYn
     */
    public String getCtrlYn() {
        return ctrlYn;
    }
    /**
     * @param ctrlYn the ctrlYn to set
     */
    public void setCtrlYn(String ctrlYn) {
        this.ctrlYn = ctrlYn;
    }
    /**
     * @return the remark1
     */
    public String getRemark1() {
        return remark1;
    }
    /**
     * @param remark1 the remark1 to set
     */
    public void setRemark1(String remark1) {
        this.remark1 = remark1;
    }
    /**
     * @return the ctrlDlrCd
     */
    public String getCtrlDlrCd() {
        return ctrlDlrCd;
    }
    /**
     * @param ctrlDlrCd the ctrlDlrCd to set
     */
    public void setCtrlDlrCd(String ctrlDlrCd) {
        this.ctrlDlrCd = ctrlDlrCd;
    }
    /**
     * @return the remark2
     */
    public String getRemark2() {
        return remark2;
    }
    /**
     * @param remark2 the remark2 to set
     */
    public void setRemark2(String remark2) {
        this.remark2 = remark2;
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
     * @return the startDtTm
     */
    public Date getStartDtTm() {
        return startDtTm;
    }
    /**
     * @param startDtTm the startDtTm to set
     */
    public void setStartDtTm(Date startDtTm) {
        this.startDtTm = startDtTm;
    }
    /**
     * @return the endDtTm
     */
    public Date getEndDtTm() {
        return endDtTm;
    }
    /**
     * @param endDtTm the endDtTm to set
     */
    public void setEndDtTm(Date endDtTm) {
        this.endDtTm = endDtTm;
    }

    /**
     * {@inheritDoc}
     */
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setCtrlYn(ExcelDataBinderUtil.toString(value).trim()); break;
                case 1:this.setDlrCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 2:this.setStrCtrlStartYyMmDt( (ExcelDataBinderUtil.toString(value).trim()).replaceAll("\\p{Digit}", "") ); break;
                case 3:this.setStrCtrlEndYyMmDt(ExcelDataBinderUtil.toString(value).trim()); break;
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

    /**
     * {@inheritDoc}
     */
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {

        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();

        // 개폐여부
        if(StringUtils.isBlank(this.getCtrlYn())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("sal.lbl.onKeyStat", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getCtrlYn(), msg));
        }

        //딜러코드
        if(StringUtils.isBlank(this.getDlrCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.dlrCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 1, this.getDlrCd(), msg));
        }

        //통제시작일시
        if(StringUtils.isBlank(this.getStrCtrlStartYyMmDt())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.intColorCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 2, this.getStrCtrlStartYyMmDt(), msg));
        }


        //통제종료일시
        if(StringUtils.isBlank(this.getStrCtrlEndYyMmDt())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("sal.lbl.totStockQty", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 3, this.getCtrlEndYyMmDt()+"", msg));
        }

        return errors;
    }
}

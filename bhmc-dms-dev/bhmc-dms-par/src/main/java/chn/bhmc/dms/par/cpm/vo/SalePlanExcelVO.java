package chn.bhmc.dms.par.cpm.vo;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.context.i18n.LocaleContextHolder;

import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;

/**
 * 판매계획 액셀 VO.
 *
 * @ClassName   : SalePlanExcelVO.java
 * @Description : SalePlanExcelVO Class
 * @author In Bo Shim
 * @since 2016. 7. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 15.     In Bo Shim     최초 생성
 * </pre>
 */

public class SalePlanExcelVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6783608512561460166L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 회사구분코드
     **/
    private String cmpDstinCd;

    /**
     * 년월
     **/
    private String yyMm;

    /**
     * 판매유형
     **/
    private String saleTp;

    /**
     * 목표금액
     **/
    private Double salePlanAmt = 0.0;

    /**
     * 판매품목수량
     **/
    private Double saleItemQty = 0.0;

    /**
     * 판매수량
     **/
    private Double saleQty = 0.0;

    /**
     * 판매금액
     **/
    private Double saleAmt = 0.0;

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
     * @return the cmpDstinCd
     */
    public String getCmpDstinCd() {
        return cmpDstinCd;
    }

    /**
     * @param cmpDstinCd the cmpDstinCd to set
     */
    public void setCmpDstinCd(String cmpDstinCd) {
        this.cmpDstinCd = cmpDstinCd;
    }

    /**
     * @return the yyMm
     */
    public String getYyMm() {
        return yyMm;
    }

    /**
     * @param yyMm the yyMm to set
     */
    public void setYyMm(String yyMm) {
        this.yyMm = yyMm;
    }

    /**
     * @return the saleTp
     */
    public String getSaleTp() {
        return saleTp;
    }

    /**
     * @param saleTp the saleTp to set
     */
    public void setSaleTp(String saleTp) {
        this.saleTp = saleTp;
    }

    /**
     * @return the salePlanAmt
     */
    public Double getSalePlanAmt() {
        return salePlanAmt;
    }

    /**
     * @param salePlanAmt the salePlanAmt to set
     */
    public void setSalePlanAmt(Double salePlanAmt) {
        this.salePlanAmt = salePlanAmt;
    }

    /**
     * @return the saleItemQty
     */
    public Double getSaleItemQty() {
        return saleItemQty;
    }

    /**
     * @param saleItemQty the saleItemQty to set
     */
    public void setSaleItemQty(Double saleItemQty) {
        this.saleItemQty = saleItemQty;
    }

    /**
     * @return the saleQty
     */
    public Double getSaleQty() {
        return saleQty;
    }

    /**
     * @param saleQty the saleQty to set
     */
    public void setSaleQty(Double saleQty) {
        this.saleQty = saleQty;
    }

    /**
     * @return the saleAmt
     */
    public Double getSaleAmt() {
        return saleAmt;
    }

    /**
     * @param saleAmt the saleAmt to set
     */
    public void setSaleAmt(Double saleAmt) {
        this.saleAmt = saleAmt;
    }

    /**
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#bind(int, int, java.lang.Object)
     */
    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {

        try{
            switch(cellNo){
                case 0:this.setDlrCd(ExcelDataBinderUtil.toString(value).trim()); break;        //dlrCd
                case 1:this.setYyMm(ExcelDataBinderUtil.toString(value).trim()); break;         //yyMm
                case 2:this.setSaleTp(ExcelDataBinderUtil.toString(value).trim()); break;       //saleTp
                case 3:this.setSalePlanAmt(ExcelDataBinderUtil.getDoubleValue(value)); break;   //salePlanAmt
                case 4:this.setSaleItemQty(ExcelDataBinderUtil.getDoubleValue(value)); break;   //saleItemQty
                case 5:this.setSaleQty(ExcelDataBinderUtil.getDoubleValue(value)); break;       //saleQty
                case 6:this.setSaleAmt(ExcelDataBinderUtil.getDoubleValue(value)); break;       //saleAmt
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
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#validate(chn.bhmc.dms.core.support.excel.ExcelDataBindContext)
     */
    @Override
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {

        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();

        //dlrCd
        if(StringUtils.isBlank(this.getDlrCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("par.lbl.dlrCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getDlrCd(), msg));
        }
        //yyMm
        if(StringUtils.isBlank(this.getYyMm())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("par.lbl.yyMm", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getYyMm(), msg));
        }
        //saleTp
        if(StringUtils.isBlank(this.getSaleTp())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("par.lbl.saleType", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getSaleTp(), msg));
        }
        //salePlanAmt
        if(StringUtils.isBlank(this.getSalePlanAmt().toString())){
            String msg = messageSource.getMessage(
                    "global.info.emptyParamInfo"
                    , new String[]{
                            messageSource.getMessage("par.lbl.salePlanAmt", null, LocaleContextHolder.getLocale())
                    }
                    , LocaleContextHolder.getLocale()
                );

                errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getSalePlanAmt()), msg));
        }else{
            //salePlanAmt
            if(NumberUtils.isNumber(this.getSalePlanAmt().toString())){
                if(this.getSalePlanAmt() <= 0){
                    String msg = messageSource.getMessage(
                        "par.info.itemReqZeroCntMsg"
                        , new String[]{
                                messageSource.getMessage("par.lbl.salePlanAmt", null, LocaleContextHolder.getLocale())
                               ,"0"
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getSalePlanAmt()), msg));
                }
            }else{
                String msg = messageSource.getMessage(
                        "global.err.checkQtyParam"
                        , new String[]{
                                messageSource.getMessage("par.lbl.salePlanAmt", null, LocaleContextHolder.getLocale())
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getSalePlanAmt()), msg));
            }
        }
        //saleItemQty
        if(StringUtils.isBlank(this.getSaleItemQty().toString())){
            String msg = messageSource.getMessage(
                    "global.info.emptyParamInfo"
                    , new String[]{
                            messageSource.getMessage("par.lbl.saleItemQty", null, LocaleContextHolder.getLocale())
                    }
                    , LocaleContextHolder.getLocale()
                );

                errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getSaleItemQty()), msg));
        }else{
            //saleItemQty
            if(NumberUtils.isNumber(this.getSaleItemQty().toString())){
                if(this.getSaleItemQty() <= 0){
                    String msg = messageSource.getMessage(
                        "par.info.itemReqZeroCntMsg"
                        , new String[]{
                                messageSource.getMessage("par.lbl.saleItemQty", null, LocaleContextHolder.getLocale())
                               ,"0"
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getSaleItemQty()), msg));
                }
            }else{
                String msg = messageSource.getMessage(
                        "global.err.checkQtyParam"
                        , new String[]{
                                messageSource.getMessage("par.lbl.saleItemQty", null, LocaleContextHolder.getLocale())
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getSaleItemQty()), msg));
            }
        }
        //saleQty
        if(StringUtils.isBlank(this.getSaleQty().toString())){
            String msg = messageSource.getMessage(
                    "global.info.emptyParamInfo"
                    , new String[]{
                            messageSource.getMessage("par.lbl.saleQty", null, LocaleContextHolder.getLocale())
                    }
                    , LocaleContextHolder.getLocale()
                );

                errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getSaleQty()), msg));
        }else{
            //saleQty
            if(NumberUtils.isNumber(this.getSaleQty().toString())){
                if(this.getSaleQty() <= 0){
                    String msg = messageSource.getMessage(
                        "par.info.itemReqZeroCntMsg"
                        , new String[]{
                                messageSource.getMessage("par.lbl.saleQty", null, LocaleContextHolder.getLocale())
                               ,"0"
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getSaleQty()), msg));
                }
            }else{
                String msg = messageSource.getMessage(
                        "global.err.checkQtyParam"
                        , new String[]{
                                messageSource.getMessage("par.lbl.saleQty", null, LocaleContextHolder.getLocale())
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getSaleQty()), msg));
            }
        }
        //saleAmt
        if(StringUtils.isBlank(this.getSaleAmt().toString())){
            String msg = messageSource.getMessage(
                    "global.info.emptyParamInfo"
                    , new String[]{
                            messageSource.getMessage("par.lbl.saleAmt", null, LocaleContextHolder.getLocale())
                    }
                    , LocaleContextHolder.getLocale()
                );

                errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getSaleAmt()), msg));
        }else{
            //saleAmt
            if(NumberUtils.isNumber(this.getSaleAmt().toString())){
                if(this.getSaleAmt() <= 0){
                    String msg = messageSource.getMessage(
                        "par.info.itemReqZeroCntMsg"
                        , new String[]{
                                messageSource.getMessage("par.lbl.saleAmt", null, LocaleContextHolder.getLocale())
                               ,"0"
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getSaleAmt()), msg));
                }
            }else{
                String msg = messageSource.getMessage(
                        "global.err.checkQtyParam"
                        , new String[]{
                                messageSource.getMessage("par.lbl.saleAmt", null, LocaleContextHolder.getLocale())
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getSaleQty()), msg));
            }
        }

        return errors;
    }
}

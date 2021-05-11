package chn.bhmc.dms.sal.stm.vo;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;

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
 * @ClassName   : CorpStockConditionDlrVO
 * @Description : [딜러]법인재고현황(전략오더) 조회 VO
 * @author Kim Jin Suk
 * @since 2016. 7. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 7. 25.    Kim Jin Suk           최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="carlineCd"    , mesgKey="sal.lbl.carlineCd")
   ,@ValidField(field="modelCd"      , mesgKey="sal.lbl.modelCd")
   ,@ValidField(field="ocnCd"        , mesgKey="sal.lbl.ocnCd")
   ,@ValidField(field="dispGradeCd"  , mesgKey="sal.lbl.dispGradeCd")
   ,@ValidField(field="retlPrc"      , mesgKey="sal.lbl.retlPrc")
   ,@ValidField(field="totStockQty"  , mesgKey="sal.lbl.totStockQty")
   ,@ValidField(field="ordQty"       , mesgKey="sal.lbl.ordQty")
   ,@ValidField(field="psntStockQty" , mesgKey="sal.lbl.psntStockQty")
   })
public class CorpStockConditionDlrVO extends AbstractExcelDataBinder{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2082268466139783792L;

    /**
     * 차종코드
     **/
    private  String        carlineCd;
    private  String        carlineNm;

    /**
     * 모델코드
     **/
    private  String        modelCd;
    private  String        modelNm;

    /**
     * OCN코드
     **/
    private  String        ocnCd;
    private  String        ocnNm;

    /**
     * 외색
     **/
    private String extColorCd;
    private String intColorCd;

    /**
     * 내색
     **/
    private String extColorNm;
    private String intColorNm;

    /**
     * 배기등급코드
     **/
    private  String        dispGradeCd;

    /**
     * 소매가격
     **/
    private  Double        retlPrc;

    /**
     * 총재고수량
     **/
    private  int           totStockQty;

    /**
     * 주문수량
     **/
    private  int           ordQty;

    /**
     * 현재고수량
     **/
    private  int           psntStockQty;

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
     * @return the dispGradeCd
     */
    public String getDispGradeCd() {
        return dispGradeCd;
    }

    /**
     * @param dispGradeCd the dispGradeCd to set
     */
    public void setDispGradeCd(String dispGradeCd) {
        this.dispGradeCd = dispGradeCd;
    }

    /**
     * @return the retlPrc
     */
    public Double getRetlPrc() {
        return retlPrc;
    }

    /**
     * @param retlPrc the retlPrc to set
     */
    public void setRetlPrc(Double retlPrc) {
        this.retlPrc = retlPrc;
    }

    /**
     * @return the totStockQty
     */
    public int getTotStockQty() {
        return totStockQty;
    }

    /**
     * @param totStockQty the totStockQty to set
     */
    public void setTotStockQty(int totStockQty) {
        this.totStockQty = totStockQty;
    }

    /**
     * @return the ordQty
     */
    public int getOrdQty() {
        return ordQty;
    }

    /**
     * @param ordQty the ordQty to set
     */
    public void setOrdQty(int ordQty) {
        this.ordQty = ordQty;
    }

    /**
     * @return the psntStockQty
     */
    public int getPsntStockQty() {
        return psntStockQty;
    }

    /**
     * @param psntStockQty the psntStockQty to set
     */
    public void setPsntStockQty(int psntStockQty) {
        this.psntStockQty = psntStockQty;
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
     * {@inheritDoc}
     */

    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setCarlineCd(ExcelDataBinderUtil.toString(value).trim()); break;                        // 차종코드
                case 1:this.setModelCd(ExcelDataBinderUtil.toString(value).trim()); break;                          // 모델코드
                case 2:this.setOcnCd(ExcelDataBinderUtil.toString(value).trim()); break;                            // ocn코드
                case 3:this.setDispGradeCd(ExcelDataBinderUtil.toString(value).trim()); break;                      // 배기등급코드
                case 4:this.setRetlPrc(Double.parseDouble(ExcelDataBinderUtil.toString(value).trim())); break;      // 소매가격
                case 5:this.setTotStockQty(Integer.parseInt(ExcelDataBinderUtil.toString(value).trim())); break;    // 총재고수량
                case 6:this.setOrdQty(Integer.parseInt(ExcelDataBinderUtil.toString(value).trim())); break;         // 주문수량
                case 7:this.setPsntStockQty(Integer.parseInt(ExcelDataBinderUtil.toString(value).trim())); break;   // 현재고수량
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

        // 차종코드
        if(StringUtils.isBlank(this.getCarlineCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.carLine", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getCarlineCd(), msg));
        }

        //OCN
        if(StringUtils.isBlank(this.getOcnCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.ocn", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 1, this.getOcnCd(), msg));
        }

        //총재고

        if(StringUtils.isBlank(this.getTotStockQty()+"")){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("sal.lbl.totStockQty", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 3, this.getTotStockQty()+"", msg));
        }

        return errors;
    }


    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}

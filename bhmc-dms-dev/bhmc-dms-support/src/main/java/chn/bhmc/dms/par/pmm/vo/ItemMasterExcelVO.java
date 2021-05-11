package chn.bhmc.dms.par.pmm.vo;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;

import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;

/**
 * 부품정보관리 액셀 업로드 VO
 *
 * @ClassName   : ItemMasterExcelVO.java
 * @Description : ItemMasterExcelVO Class
 * @author In Bo Shim
 * @since 2016. 8. 03.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 03.     In Bo Shim     최초 생성
 * </pre>
 */

public class ItemMasterExcelVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7029817455727647267L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 품목코드
     **/
    private String itemCd = "";

    /**
     * 품목명
     **/
    private String itemNm = "";

    /**
     * 브랜드
     **/
    private String brandCd = "";

    /**
     * 시작일자
     **/
    private String startDt = "";

    /**
     * 차종
     **/
    private String carlineCd = "";

    /**
     * 위험품여부
     **/
    private String dgrItemYn = "N";

    /**
     * 안전재고수량
     **/
    private double sftyStockQty = 0.0;

    /**
     * 안전재고수량문자열
     **/
    private String strSftyStockQty = "";

    /**
     * 재고단위코드
     **/
    private String stockUnitCd = "";

    /**
     * 입고창고코드
     **/
    private String grStrgeCd = "";

    /**
     * 출고창고코드
     **/
    private String giStrgeCd = "";

    /**
     * 부품유형코드
     **/
    private String itemDstinCd = "";

    /**
     * 구형대체품목코드
     **/
    private String oldRplcItemCd = "";

    /**
     * 신규대체품목코드
     **/
    private String newRplcItemCd = "";

    /**
     * 구형대체부품호환여부
     **/
    private String oldRplcParCmptYn = "N";

    /**
     * 신규대체부품호환여부
     **/
    private String newRplcParCmptYn = "N";

    /**
     * 추가/수정구분
     **/
    private String insertUpdateTp = "U";

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
     * @return the itemCd
     */
    public String getItemCd() {
        return itemCd;
    }

    /**
     * @param itemCd the itemCd to set
     */
    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
    }

    /**
     * @return the itemNm
     */
    public String getItemNm() {
        return itemNm;
    }

    /**
     * @param itemNm the itemNm to set
     */
    public void setItemNm(String itemNm) {
        this.itemNm = itemNm;
    }

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
     * @return the startDt
     */
    public String getStartDt() {
        return startDt;
    }

    /**
     * @param startDt the startDt to set
     */
    public void setStartDt(String startDt) {
        this.startDt = startDt;
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
     * @return the dgrItemYn
     */
    public String getDgrItemYn() {
        return dgrItemYn;
    }

    /**
     * @param dgrItemYn the dgrItemYn to set
     */
    public void setDgrItemYn(String dgrItemYn) {
        this.dgrItemYn = dgrItemYn;
    }

    /**
     * @return the sftyStockQty
     */
    public double getSftyStockQty() {
        return sftyStockQty;
    }

    /**
     * @param sftyStockQty the sftyStockQty to set
     */
    public void setSftyStockQty(double sftyStockQty) {
        this.sftyStockQty = sftyStockQty;
    }

    /**
     * @return the strSftyStockQty
     */
    public String getStrSftyStockQty() {
        return strSftyStockQty;
    }

    /**
     * @param strSftyStockQty the strSftyStockQty to set
     */
    public void setStrSftyStockQty(String strSftyStockQty) {
        this.strSftyStockQty = strSftyStockQty;
    }

    /**
     * @return the stockUnitCd
     */
    public String getStockUnitCd() {
        return stockUnitCd;
    }

    /**
     * @param stockUnitCd the stockUnitCd to set
     */
    public void setStockUnitCd(String stockUnitCd) {
        this.stockUnitCd = stockUnitCd;
    }

    /**
     * @return the grStrgeCd
     */
    public String getGrStrgeCd() {
        return grStrgeCd;
    }

    /**
     * @param grStrgeCd the grStrgeCd to set
     */
    public void setGrStrgeCd(String grStrgeCd) {
        this.grStrgeCd = grStrgeCd;
    }

    /**
     * @return the giStrgeCd
     */
    public String getGiStrgeCd() {
        return giStrgeCd;
    }

    /**
     * @param giStrgeCd the giStrgeCd to set
     */
    public void setGiStrgeCd(String giStrgeCd) {
        this.giStrgeCd = giStrgeCd;
    }

    /**
     * @return the itemDstinCd
     */
    public String getItemDstinCd() {
        return itemDstinCd;
    }

    /**
     * @param itemDstinCd the itemDstinCd to set
     */
    public void setItemDstinCd(String itemDstinCd) {
        this.itemDstinCd = itemDstinCd;
    }

    /**
     * @return the oldRplcItemCd
     */
    public String getOldRplcItemCd() {
        return oldRplcItemCd;
    }

    /**
     * @param oldRplcItemCd the oldRplcItemCd to set
     */
    public void setOldRplcItemCd(String oldRplcItemCd) {
        this.oldRplcItemCd = oldRplcItemCd;
    }

    /**
     * @return the newRplcItemCd
     */
    public String getNewRplcItemCd() {
        return newRplcItemCd;
    }

    /**
     * @param newRplcItemCd the newRplcItemCd to set
     */
    public void setNewRplcItemCd(String newRplcItemCd) {
        this.newRplcItemCd = newRplcItemCd;
    }

    /**
     * @return the oldRplcParCmptYn
     */
    public String getOldRplcParCmptYn() {
        return oldRplcParCmptYn;
    }

    /**
     * @param oldRplcParCmptYn the oldRplcParCmptYn to set
     */
    public void setOldRplcParCmptYn(String oldRplcParCmptYn) {
        this.oldRplcParCmptYn = oldRplcParCmptYn;
    }

    /**
     * @return the newRplcParCmptYn
     */
    public String getNewRplcParCmptYn() {
        return newRplcParCmptYn;
    }

    /**
     * @param newRplcParCmptYn the newRplcParCmptYn to set
     */
    public void setNewRplcParCmptYn(String newRplcParCmptYn) {
        this.newRplcParCmptYn = newRplcParCmptYn;
    }

    /**
     * @return the insertUpdateTp
     */
    public String getInsertUpdateTp() {
        return insertUpdateTp;
    }

    /**
     * @param insertUpdateTp the insertUpdateTp to set
     */
    public void setInsertUpdateTp(String insertUpdateTp) {
        this.insertUpdateTp = insertUpdateTp;
    }

    /**
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#bind(int, int, java.lang.Object)
     */
    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setItemCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 1:this.setItemNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 2:this.setBrandCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 3:this.setStartDt(ExcelDataBinderUtil.toString(value).trim()); break;
                case 4:this.setCarlineCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 5:this.setDgrItemYn(ExcelDataBinderUtil.toString(value).trim());  break;
                case 6:this.setStrSftyStockQty(ExcelDataBinderUtil.toString(value).trim());  break;
                case 7:this.setStockUnitCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 8:this.setOldRplcItemCd(ExcelDataBinderUtil.toString(value).trim()); break;//구형대체품목코드
                case 9:this.setNewRplcItemCd(ExcelDataBinderUtil.toString(value).trim()); break;//신규대체품목코드
                case 10:this.setOldRplcParCmptYn(ExcelDataBinderUtil.toString(value).trim()); break;//구형대체품목호환여부
                case 11:this.setNewRplcParCmptYn(ExcelDataBinderUtil.toString(value).trim()); break;//신규대체품목호환여부

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

        //itemCd
        if(StringUtils.isBlank(this.getItemCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getItemCd(), msg));
        }
        //itemNm
        if(StringUtils.isBlank(this.getItemNm())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("par.lbl.itemNm", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getItemCd(), msg));
        }

        return errors;
    }
}

package chn.bhmc.dms.par.pmm.vo;

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
 * 로케이션 부품 VO
 *
 * @ClassName   : BinLocationItemVO.java
 * @Description : BinLocationItemVO Class
 * @author In Bo Shim
 * @since 2016. 5. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 16.     In Bo Shim     최초 생성
 * </pre>
 */

public class BinLocationItemExcelVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4811043210094491868L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * DB저장위치ID
     **/
    private String dbLocId;

    /**
     * 위치ID
     **/
    private String locId;

    /**
     * 센터코드
     **/
    private String pltCd;

    /**
     * 창고코드
     **/
    private String strgeCd;

    /**
     * 레벨ID
     **/
    private int lvlId;

    /**
     * 트리레벨ID
     **/
    private int baseLvlId;

    /**
     * 상위레벨ID
     **/
    private int upperLvlId;

    /**
     * 위치코드
     **/
    private String locCd;

    /**
     * DB저장 위치코드
     **/
    private String dbLocCd;

    /**
     * 위치명
     **/
    private String locNm;

    /**
     * 상위위치ID
     **/
    private String upperLocId;

    /**
     * 한계관리여부
     **/
    private String lmtMngYn;

    /**
     * 품목코드
     **/
    private String itemCd;

    /**
     * 품목명
     **/
    private String itemNm;

    /**
     * 단위
     **/
    private String unitCd;

    /**
     * 최대량
     **/
    private Double maxQty;

    /**
     * 비고
     **/
    private String remark;

    /**
     * 메인위치여부
     **/
    private String mainLocYn;

    /**
     * 현재고 가용재고량
     **/
    private Double baseAvlbStockQty;

    /**
     * 가용재고량
     **/
    private Double avlbStockQty;

    /**
     * 예약재고량
     **/
    private Double resvStockQty;

    /**
     * 보류재고량
     **/
    private Double clamStockQty;

    /**
     * DB 저장여부
     **/
    private String dbYn;

    /**
     * 길이수
     **/
    private int lgthCnt = 0;

    /**
     * 코드유형
     **/
    private String cdTp;

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
     * @return the dbLocId
     */
    public String getDbLocId() {
        return dbLocId;
    }

    /**
     * @param dbLocId the dbLocId to set
     */
    public void setDbLocId(String dbLocId) {
        this.dbLocId = dbLocId;
    }

    /**
     * @return the locId
     */
    public String getLocId() {
        return locId;
    }

    /**
     * @param locId the locId to set
     */
    public void setLocId(String locId) {
        this.locId = locId;
    }

    /**
     * @return the pltCd
     */
    public String getPltCd() {
        return pltCd;
    }

    /**
     * @param pltCd the pltCd to set
     */
    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
    }

    /**
     * @return the strgeCd
     */
    public String getStrgeCd() {
        return strgeCd;
    }

    /**
     * @param strgeCd the strgeCd to set
     */
    public void setStrgeCd(String strgeCd) {
        this.strgeCd = strgeCd;
    }

    /**
     * @return the lvlId
     */
    public int getLvlId() {
        return lvlId;
    }

    /**
     * @param lvlId the lvlId to set
     */
    public void setLvlId(int lvlId) {
        this.lvlId = lvlId;
    }

    /**
     * @return the baseLvlId
     */
    public int getBaseLvlId() {
        return baseLvlId;
    }

    /**
     * @param baseLvlId the baseLvlId to set
     */
    public void setBaseLvlId(int baseLvlId) {
        this.baseLvlId = baseLvlId;
    }

    /**
     * @return the upperLvlId
     */
    public int getUpperLvlId() {
        return upperLvlId;
    }

    /**
     * @param upperLvlId the upperLvlId to set
     */
    public void setUpperLvlId(int upperLvlId) {
        this.upperLvlId = upperLvlId;
    }

    /**
     * @return the locCd
     */
    public String getLocCd() {
        return locCd;
    }

    /**
     * @param locCd the locCd to set
     */
    public void setLocCd(String locCd) {
        this.locCd = locCd;
    }

    /**
     * @return the dbLocCd
     */
    public String getDbLocCd() {
        return dbLocCd;
    }

    /**
     * @param dbLocCd the dbLocCd to set
     */
    public void setDbLocCd(String dbLocCd) {
        this.dbLocCd = dbLocCd;
    }

    /**
     * @return the locNm
     */
    public String getLocNm() {
        return locNm;
    }

    /**
     * @param locNm the locNm to set
     */
    public void setLocNm(String locNm) {
        this.locNm = locNm;
    }

    /**
     * @return the upperLocId
     */
    public String getUpperLocId() {
        return upperLocId;
    }

    /**
     * @param upperLocId the upperLocId to set
     */
    public void setUpperLocId(String upperLocId) {
        this.upperLocId = upperLocId;
    }

    /**
     * @return the lmtMngYn
     */
    public String getLmtMngYn() {
        return lmtMngYn;
    }

    /**
     * @param lmtMngYn the lmtMngYn to set
     */
    public void setLmtMngYn(String lmtMngYn) {
        this.lmtMngYn = lmtMngYn;
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
     * @return the unitCd
     */
    public String getUnitCd() {
        return unitCd;
    }

    /**
     * @param unitCd the unitCd to set
     */
    public void setUnitCd(String unitCd) {
        this.unitCd = unitCd;
    }

    /**
     * @return the maxQty
     */
    public Double getMaxQty() {
        return maxQty;
    }

    /**
     * @param maxQty the maxQty to set
     */
    public void setMaxQty(Double maxQty) {
        this.maxQty = maxQty;
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
     * @return the mainLocYn
     */
    public String getMainLocYn() {
        return mainLocYn;
    }

    /**
     * @param mainLocYn the mainLocYn to set
     */
    public void setMainLocYn(String mainLocYn) {
        this.mainLocYn = mainLocYn;
    }

    /**
     * @return the baseAvlbStockQty
     */
    public Double getBaseAvlbStockQty() {
        return baseAvlbStockQty;
    }

    /**
     * @param baseAvlbStockQty the baseAvlbStockQty to set
     */
    public void setBaseAvlbStockQty(Double baseAvlbStockQty) {
        this.baseAvlbStockQty = baseAvlbStockQty;
    }

    /**
     * @return the avlbStockQty
     */
    public Double getAvlbStockQty() {
        return avlbStockQty;
    }

    /**
     * @param avlbStockQty the avlbStockQty to set
     */
    public void setAvlbStockQty(Double avlbStockQty) {
        this.avlbStockQty = avlbStockQty;
    }

    /**
     * @return the resvStockQty
     */
    public Double getResvStockQty() {
        return resvStockQty;
    }

    /**
     * @param resvStockQty the resvStockQty to set
     */
    public void setResvStockQty(Double resvStockQty) {
        this.resvStockQty = resvStockQty;
    }

    /**
     * @return the clamStockQty
     */
    public Double getClamStockQty() {
        return clamStockQty;
    }

    /**
     * @param clamStockQty the clamStockQty to set
     */
    public void setClamStockQty(Double clamStockQty) {
        this.clamStockQty = clamStockQty;
    }

    /**
     * @return the dbYn
     */
    public String getDbYn() {
        return dbYn;
    }

    /**
     * @param dbYn the dbYn to set
     */
    public void setDbYn(String dbYn) {
        this.dbYn = dbYn;
    }

    /**
     * @return the lgthCnt
     */
    public int getLgthCnt() {
        return lgthCnt;
    }

    /**
     * @param lgthCnt the lgthCnt to set
     */
    public void setLgthCnt(int lgthCnt) {
        this.lgthCnt = lgthCnt;
    }

    /**
     * @return the cdTp
     */
    public String getCdTp() {
        return cdTp;
    }

    /**
     * @param cdTp the cdTp to set
     */
    public void setCdTp(String cdTp) {
        this.cdTp = cdTp;
    }

    /**
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#bind(int, int, java.lang.Object)
     */
    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setItemCd(ExcelDataBinderUtil.toString(value).trim()); break;       //itemCd
                case 1:this.setAvlbStockQty(ExcelDataBinderUtil.getDoubleValue(value)); break;  //avlbStockQty
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

        //avlbStockQty
        if(StringUtils.isBlank(this.getAvlbStockQty().toString())){
            String msg = messageSource.getMessage(
                    "global.info.emptyParamInfo"
                    , new String[]{
                            messageSource.getMessage("par.lbl.strgeMoveStockQty", null, LocaleContextHolder.getLocale())
                    }
                    , LocaleContextHolder.getLocale()
                );

                errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getAvlbStockQty()), msg));
        }else{
            //avlbStockQty
            if(NumberUtils.isNumber(this.getAvlbStockQty().toString())){
                if(this.getAvlbStockQty() <= 0){
                    String msg = messageSource.getMessage(
                        "par.info.itemReqZeroCntMsg"
                        , new String[]{
                                messageSource.getMessage("par.lbl.strgeMoveStockQty", null, LocaleContextHolder.getLocale())
                               ,"0"
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getAvlbStockQty()), msg));
                }
            }else{
                String msg = messageSource.getMessage(
                        "global.err.checkQtyParam"
                        , new String[]{
                                messageSource.getMessage("par.lbl.strgeMoveStockQty", null, LocaleContextHolder.getLocale())
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getAvlbStockQty()), msg));
            }
        }

        return errors;
    }
}

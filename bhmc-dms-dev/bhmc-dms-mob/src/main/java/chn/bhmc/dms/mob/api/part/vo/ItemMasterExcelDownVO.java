package chn.bhmc.dms.mob.api.part.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 부품정보관리 액셀 다운 VO
 *
 * @ClassName   : ItemMasterExcelDownVO.java
 * @Description : ItemMasterExcelDownVO Class
 * @author In Bo Shim
 * @since 2016. 8. 08.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 08.     In Bo Shim     최초 생성
 * </pre>
 */

public class ItemMasterExcelDownVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3647702299509952807L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * 품목코드
     **/
    @NotEmpty
    private String itemCd;

    /**
     * 품목명
     **/
    private String itemNm;
    /**
     * 브랜드
     **/
    private String brandCd;
    /**
     * 시작일자
     **/
    private String startDt;
    /**
     * 차종
     **/
    private String carlineCd;

    /**
     * 위험품여부
     **/
    @NotEmpty
    private String dgrItemYn = "N";

    /**
     * 안전재고수량
     **/
    private Double sftyStockQty;

    /**
     * 재고단위코드
     **/
    private String stockUnitCd;

    /**
     * 구형대체품목코드
     **/
    private String oldRplcItemCd;

    /**
     * 신규대체품목코드
     **/
    private String newRplcItemCd;

    /**
     * 구형대체부품호환여부
     **/
    private String oldRplcParCmptYn;

    /**
     * 신규대체부품호환여부
     **/
    private String newRplcParCmptYn;

    /**
     * 수정일시(UPDATE시 가능여부 체크용)
     **/
    private  String          updtDtStr;

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
    public Double getSftyStockQty() {
        return sftyStockQty;
    }

    /**
     * @param sftyStockQty the sftyStockQty to set
     */
    public void setSftyStockQty(Double sftyStockQty) {
        this.sftyStockQty = sftyStockQty;
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
     * @return the updtDtStr
     */
    public String getUpdtDtStr() {
        return updtDtStr;
    }

    /**
     * @param updtDtStr the updtDtStr to set
     */
    public void setUpdtDtStr(String updtDtStr) {
        this.updtDtStr = updtDtStr;
    }
}

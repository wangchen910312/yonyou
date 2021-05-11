package chn.bhmc.dms.par.pmm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * SaftyStockWeightDmndVO
 *
 * @ClassName   : SaftyStockWeightDmndVO.java
 * @Description : SaftyStockWeightDmndVO Class
 * @author In Bo Shim
 * @since 2016. 5. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 10.     In Bo Shim     최초 생성
 * </pre>
 */

public class SaftyStockWeightDmndVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3074519011724475349L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 센터코드
     **/
    private String pltCd;

    /**
     * 품목코드
     **/
    private String itemCd;

    /**
     * 품목명
     **/
    private String itemNm;

    /**
     * 단위명
     **/
    private String unitCd;

    /**
     * 안전재고수량
     **/
    private Double sftyStockQty;

    /**
     * 총수요량
     **/
    private Double totDmndQty;

    /**
     * 가중치부여총수요량
     **/
    private Double wgtAddTotDmndQty;

    /**
     * 평균수요량
     **/
    private Double avgDmndQty;

    /**
     * 평균편차량
     **/
    private Double avgDvsQty;

    /**
     * 평균편차반영평균수요량
     **/
    private Double avgDvsRflAvgDmnd;

    /**
     * 평균편차반영율
     **/
    private Double avgDvsRflRate;

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
     * @return the totDmndQty
     */
    public Double getTotDmndQty() {
        return totDmndQty;
    }

    /**
     * @param totDmndQty the totDmndQty to set
     */
    public void setTotDmndQty(Double totDmndQty) {
        this.totDmndQty = totDmndQty;
    }

    /**
     * @return the wgtAddTotDmndQty
     */
    public Double getWgtAddTotDmndQty() {
        return wgtAddTotDmndQty;
    }

    /**
     * @param wgtAddTotDmndQty the wgtAddTotDmndQty to set
     */
    public void setWgtAddTotDmndQty(Double wgtAddTotDmndQty) {
        this.wgtAddTotDmndQty = wgtAddTotDmndQty;
    }

    /**
     * @return the avgDmndQty
     */
    public Double getAvgDmndQty() {
        return avgDmndQty;
    }

    /**
     * @param avgDmndQty the avgDmndQty to set
     */
    public void setAvgDmndQty(Double avgDmndQty) {
        this.avgDmndQty = avgDmndQty;
    }

    /**
     * @return the avgDvsQty
     */
    public Double getAvgDvsQty() {
        return avgDvsQty;
    }

    /**
     * @param avgDvsQty the avgDvsQty to set
     */
    public void setAvgDvsQty(Double avgDvsQty) {
        this.avgDvsQty = avgDvsQty;
    }

    /**
     * @return the avgDvsRflAvgDmnd
     */
    public Double getAvgDvsRflAvgDmnd() {
        return avgDvsRflAvgDmnd;
    }

    /**
     * @param avgDvsRflAvgDmnd the avgDvsRflAvgDmnd to set
     */
    public void setAvgDvsRflAvgDmnd(Double avgDvsRflAvgDmnd) {
        this.avgDvsRflAvgDmnd = avgDvsRflAvgDmnd;
    }

    /**
     * @return the avgDvsRflRate
     */
    public Double getAvgDvsRflRate() {
        return avgDvsRflRate;
    }

    /**
     * @param avgDvsRflRate the avgDvsRflRate to set
     */
    public void setAvgDvsRflRate(Double avgDvsRflRate) {
        this.avgDvsRflRate = avgDvsRflRate;
    }

}

package chn.bhmc.dms.par.pmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * SupplyRuleVO
 *
 * @ClassName   : SupplyRuleVO.java
 * @Description : SupplyRuleVO Class
 * @author In Bo Shim
 * @since 2016. 9. 09.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 09.     In Bo Shim     최초 생성
 * </pre>
 */

public class SupplyRuleVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3608415031263871870L;

    /**
     * dlrCd
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * pltCd
     **/
    @NotEmpty
    private String pltCd;

    /**
     * ABC CLASS
     **/
    private String abcInd;

    /**
     * ABC CLASS판매율
     **/
    private double abcIndSaleRate = 0.0;

    /**
     * ABC CLASS가격
     **/
    private double abcIndPrc = 0.0;

    /**
     * 구매오더주기값
     **/
    private double purcOrdCycleVal = 0.0;

    /**
     * 구매오더운영레벨값
     **/
    private double purcOrdOperLvlVal = 0.0;

    /**
     * 요청오더량
     **/
    private double reqOrdQty = 0.0;

    /**
     * 기준경제오더량
     **/
    private double stdBizOrdQty = 0.0;

    /**
     * 안전재고수량
     **/
    private double sftyStockQty = 0.0;

    /**
     * 평균수주량
     **/
    private double avgObtQty = 0.0;

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
     * @return the abcInd
     */
    public String getAbcInd() {
        return abcInd;
    }

    /**
     * @param abcInd the abcInd to set
     */
    public void setAbcInd(String abcInd) {
        this.abcInd = abcInd;
    }

    /**
     * @return the abcIndSaleRate
     */
    public double getAbcIndSaleRate() {
        return abcIndSaleRate;
    }

    /**
     * @param abcIndSaleRate the abcIndSaleRate to set
     */
    public void setAbcIndSaleRate(double abcIndSaleRate) {
        this.abcIndSaleRate = abcIndSaleRate;
    }

    /**
     * @return the abcIndPrc
     */
    public double getAbcIndPrc() {
        return abcIndPrc;
    }

    /**
     * @param abcIndPrc the abcIndPrc to set
     */
    public void setAbcIndPrc(double abcIndPrc) {
        this.abcIndPrc = abcIndPrc;
    }

    /**
     * @return the purcOrdCycleVal
     */
    public double getPurcOrdCycleVal() {
        return purcOrdCycleVal;
    }

    /**
     * @param purcOrdCycleVal the purcOrdCycleVal to set
     */
    public void setPurcOrdCycleVal(double purcOrdCycleVal) {
        this.purcOrdCycleVal = purcOrdCycleVal;
    }

    /**
     * @return the purcOrdOperLvlVal
     */
    public double getPurcOrdOperLvlVal() {
        return purcOrdOperLvlVal;
    }

    /**
     * @param purcOrdOperLvlVal the purcOrdOperLvlVal to set
     */
    public void setPurcOrdOperLvlVal(double purcOrdOperLvlVal) {
        this.purcOrdOperLvlVal = purcOrdOperLvlVal;
    }

    /**
     * @return the reqOrdQty
     */
    public double getReqOrdQty() {
        return reqOrdQty;
    }

    /**
     * @param reqOrdQty the reqOrdQty to set
     */
    public void setReqOrdQty(double reqOrdQty) {
        this.reqOrdQty = reqOrdQty;
    }

    /**
     * @return the stdBizOrdQty
     */
    public double getStdBizOrdQty() {
        return stdBizOrdQty;
    }

    /**
     * @param stdBizOrdQty the stdBizOrdQty to set
     */
    public void setStdBizOrdQty(double stdBizOrdQty) {
        this.stdBizOrdQty = stdBizOrdQty;
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
     * @return the avgObtQty
     */
    public double getAvgObtQty() {
        return avgObtQty;
    }

    /**
     * @param avgObtQty the avgObtQty to set
     */
    public void setAvgObtQty(double avgObtQty) {
        this.avgObtQty = avgObtQty;
    }
}

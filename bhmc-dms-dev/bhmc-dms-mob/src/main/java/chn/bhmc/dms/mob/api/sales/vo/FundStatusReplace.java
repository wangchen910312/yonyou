package chn.bhmc.dms.mob.api.sales.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FundStatusReplace.java
 * @Description : 월자금현황조합용
 * @author Lee Seungmin
 * @since 2016. 10. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 20.     Lee Seungmin     최초 생성
 * </pre>
 */

public class FundStatusReplace extends BaseVO{


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3383497513925946674L;

    private double bfCashBalAmt;        // 전잔액 - 현금
    private double bfPrt2BalAmt;        // 전잔액 - 이방자금
    private double bfPrt3BalAmt;        // 전잔액 - 삼방자금
    private double bfTotBalAmt;         // 전잔액 - 합계
    private double bfPrcChgAmt;         // 전잔액 - 조정금
    private double bfIncnAmt;           // 전잔액 - 인센티브


    /**
     * @return the bfCashBalAmt
     */
    public double getBfCashBalAmt() {
        return bfCashBalAmt;
    }
    /**
     * @param bfCashBalAmt the bfCashBalAmt to set
     */
    public void setBfCashBalAmt(double bfCashBalAmt) {
        this.bfCashBalAmt = bfCashBalAmt;
    }
    /**
     * @return the bfPrt2BalAmt
     */
    public double getBfPrt2BalAmt() {
        return bfPrt2BalAmt;
    }
    /**
     * @param bfPrt2BalAmt the bfPrt2BalAmt to set
     */
    public void setBfPrt2BalAmt(double bfPrt2BalAmt) {
        this.bfPrt2BalAmt = bfPrt2BalAmt;
    }
    /**
     * @return the bfPrt3BalAmt
     */
    public double getBfPrt3BalAmt() {
        return bfPrt3BalAmt;
    }
    /**
     * @param bfPrt3BalAmt the bfPrt3BalAmt to set
     */
    public void setBfPrt3BalAmt(double bfPrt3BalAmt) {
        this.bfPrt3BalAmt = bfPrt3BalAmt;
    }
    /**
     * @return the bfTotBalAmt
     */
    public double getBfTotBalAmt() {
        return bfTotBalAmt;
    }
    /**
     * @param bfTotBalAmt the bfTotBalAmt to set
     */
    public void setBfTotBalAmt(double bfTotBalAmt) {
        this.bfTotBalAmt = bfTotBalAmt;
    }
    /**
     * @return the bfPrcChgAmt
     */
    public double getBfPrcChgAmt() {
        return bfPrcChgAmt;
    }
    /**
     * @param bfPrcChgAmt the bfPrcChgAmt to set
     */
    public void setBfPrcChgAmt(double bfPrcChgAmt) {
        this.bfPrcChgAmt = bfPrcChgAmt;
    }
    /**
     * @return the bfIncnAmt
     */
    public double getBfIncnAmt() {
        return bfIncnAmt;
    }
    /**
     * @param bfIncnAmt the bfIncnAmt to set
     */
    public void setBfIncnAmt(double bfIncnAmt) {
        this.bfIncnAmt = bfIncnAmt;
    }
}

package chn.bhmc.dms.par.stm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 재고 VO
 *
 * @ClassName   : IssueReqStatusVO.java
 * @Description : IssueReqStatusVO Class
 * @author Ju Won Lee
 * @since 2018. 2. 08.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 2. 08.     Ju Won Lee    최초 생성
 * </pre>
 */
public class StockInOutVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4480981519418159602L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String ianDlrCd;

    /**
     * 딜러명
     **/
    private String dlrNm;

    /**
     * 년월
     **/
    private String ianYymm;

    /**
     * 가용재고
     **/
    private double ianAvlbStockQty;

    /**
     * 예류재고
     **/
    private double ianResvStockQty;

    /**
     * 차입재고
     **/
    private double ianBorrowQty;

    /**
     * 차출재고
     **/
    private double ianRentQty;

    /**
     * 장면재고
     **/
    private double ianStockQty;

    /**
     * 재고금액
     **/
    private double ianStockAmt;

    /**
     * 출고수량
     **/
    private double ianGiQty;

    /**
     * 출고금액
     **/
    private double ianGiAmt;

    /**
     * 전월재고
     **/
    private double ianPreStockQty;

    /**
     * 전월재고금액
     **/
    private double ianPreStockAmt;

    /**
     * 총재고
     **/
    private double ianStockTotQty;

    /**
     * 총재고금액
     **/
    private double ianStockTotAmt;

    /**
     * 재고비율
     **/
    private double ianStockAmtRate;
    /**
     * MOS
     **/
    private double ianMos;
    /**
     * 재고회전율
     **/
    private double ianInventoryTurnoverRatio;
    /**
     * @return the ianDlrCd
     */
    public String getIanDlrCd() {
        return ianDlrCd;
    }
    /**
     * @param ianDlrCd the ianDlrCd to set
     */
    public void setIanDlrCd(String ianDlrCd) {
        this.ianDlrCd = ianDlrCd;
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
     * @return the ianYymm
     */
    public String getIanYymm() {
        return ianYymm;
    }
    /**
     * @param ianYymm the ianYymm to set
     */
    public void setIanYymm(String ianYymm) {
        this.ianYymm = ianYymm;
    }
    /**
     * @return the ianAvlbStockQty
     */
    public double getIanAvlbStockQty() {
        return ianAvlbStockQty;
    }
    /**
     * @param ianAvlbStockQty the ianAvlbStockQty to set
     */
    public void setIanAvlbStockQty(double ianAvlbStockQty) {
        this.ianAvlbStockQty = ianAvlbStockQty;
    }
    /**
     * @return the ianResvStockQty
     */
    public double getIanResvStockQty() {
        return ianResvStockQty;
    }
    /**
     * @param ianResvStockQty the ianResvStockQty to set
     */
    public void setIanResvStockQty(double ianResvStockQty) {
        this.ianResvStockQty = ianResvStockQty;
    }
    /**
     * @return the ianBorrowQty
     */
    public double getIanBorrowQty() {
        return ianBorrowQty;
    }
    /**
     * @param ianBorrowQty the ianBorrowQty to set
     */
    public void setIanBorrowQty(double ianBorrowQty) {
        this.ianBorrowQty = ianBorrowQty;
    }
    /**
     * @return the ianRentQty
     */
    public double getIanRentQty() {
        return ianRentQty;
    }
    /**
     * @param ianRentQty the ianRentQty to set
     */
    public void setIanRentQty(double ianRentQty) {
        this.ianRentQty = ianRentQty;
    }
    /**
     * @return the ianStockQty
     */
    public double getIanStockQty() {
        return ianStockQty;
    }
    /**
     * @param ianStockQty the ianStockQty to set
     */
    public void setIanStockQty(double ianStockQty) {
        this.ianStockQty = ianStockQty;
    }
    /**
     * @return the ianStockAmt
     */
    public double getIanStockAmt() {
        return ianStockAmt;
    }
    /**
     * @param ianStockAmt the ianStockAmt to set
     */
    public void setIanStockAmt(double ianStockAmt) {
        this.ianStockAmt = ianStockAmt;
    }
    /**
     * @return the ianGiQty
     */
    public double getIanGiQty() {
        return ianGiQty;
    }
    /**
     * @param ianGiQty the ianGiQty to set
     */
    public void setIanGiQty(double ianGiQty) {
        this.ianGiQty = ianGiQty;
    }
    /**
     * @return the ianGiAmt
     */
    public double getIanGiAmt() {
        return ianGiAmt;
    }
    /**
     * @param ianGiAmt the ianGiAmt to set
     */
    public void setIanGiAmt(double ianGiAmt) {
        this.ianGiAmt = ianGiAmt;
    }
    /**
     * @return the ianPreStockQty
     */
    public double getIanPreStockQty() {
        return ianPreStockQty;
    }
    /**
     * @param ianPreStockQty the ianPreStockQty to set
     */
    public void setIanPreStockQty(double ianPreStockQty) {
        this.ianPreStockQty = ianPreStockQty;
    }
    /**
     * @return the ianPreStockAmt
     */
    public double getIanPreStockAmt() {
        return ianPreStockAmt;
    }
    /**
     * @param ianPreStockAmt the ianPreStockAmt to set
     */
    public void setIanPreStockAmt(double ianPreStockAmt) {
        this.ianPreStockAmt = ianPreStockAmt;
    }
    /**
     * @return the ianStockTotQty
     */
    public double getIanStockTotQty() {
        return ianStockTotQty;
    }
    /**
     * @param ianStockTotQty the ianStockTotQty to set
     */
    public void setIanStockTotQty(double ianStockTotQty) {
        this.ianStockTotQty = ianStockTotQty;
    }
    /**
     * @return the ianStockTotAmt
     */
    public double getIanStockTotAmt() {
        return ianStockTotAmt;
    }
    /**
     * @param ianStockTotAmt the ianStockTotAmt to set
     */
    public void setIanStockTotAmt(double ianStockTotAmt) {
        this.ianStockTotAmt = ianStockTotAmt;
    }
    /**
     * @return the ianStockAmtRate
     */
    public double getIanStockAmtRate() {
        return ianStockAmtRate;
    }
    /**
     * @param ianStockAmtRate the ianStockAmtRate to set
     */
    public void setIanStockAmtRate(double ianStockAmtRate) {
        this.ianStockAmtRate = ianStockAmtRate;
    }
    /**
     * @return the ianMos
     */
    public double getIanMos() {
        return ianMos;
    }
    /**
     * @param ianMos the ianMos to set
     */
    public void setIanMos(double ianMos) {
        this.ianMos = ianMos;
    }
    /**
     * @return the ianInventoryTurnoverRatio
     */
    public double getIanInventoryTurnoverRatio() {
        return ianInventoryTurnoverRatio;
    }
    /**
     * @param ianInventoryTurnoverRatio the ianInventoryTurnoverRatio to set
     */
    public void setIanInventoryTurnoverRatio(double ianInventoryTurnoverRatio) {
        this.ianInventoryTurnoverRatio = ianInventoryTurnoverRatio;
    }

}

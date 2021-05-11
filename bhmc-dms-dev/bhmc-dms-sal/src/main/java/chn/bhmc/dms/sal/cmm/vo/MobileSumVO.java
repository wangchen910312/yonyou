package chn.bhmc.dms.sal.cmm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobileSumVO.java
 * @Description : 모바일 총경리 화면 조회용
 * @author Lee Seungmin
 * @since 2016. 10. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 23.     Lee Seungmin     최초 생성
 * </pre>
 */

public class MobileSumVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5444201672128207222L;

    private int tmonthSoldCnt;    // 이번달판매댓수
    private int tyearSoldCnt;     // 이번해판매댓수
    private double stockRate;     // 재고계수
    private int stockCnt;         // 재고댓수
    private String monthStat;     // 전월판매대비상태
    private String yearStat;      // 전년판매대비상태

    /**
     * @return the tmonthSoldCnt
     */
    public int getTmonthSoldCnt() {
        return tmonthSoldCnt;
    }
    /**
     * @param tmonthSoldCnt the tmonthSoldCnt to set
     */
    public void setTmonthSoldCnt(int tmonthSoldCnt) {
        this.tmonthSoldCnt = tmonthSoldCnt;
    }
    /**
     * @return the tyearSoldCnt
     */
    public int getTyearSoldCnt() {
        return tyearSoldCnt;
    }
    /**
     * @param tyearSoldCnt the tyearSoldCnt to set
     */
    public void setTyearSoldCnt(int tyearSoldCnt) {
        this.tyearSoldCnt = tyearSoldCnt;
    }
    /**
     * @return the stockRate
     */
    public double getStockRate() {
        return stockRate;
    }
    /**
     * @param stockRate the stockRate to set
     */
    public void setStockRate(double stockRate) {
        this.stockRate = stockRate;
    }
    /**
     * @return the stockCnt
     */
    public int getStockCnt() {
        return stockCnt;
    }
    /**
     * @param stockCnt the stockCnt to set
     */
    public void setStockCnt(int stockCnt) {
        this.stockCnt = stockCnt;
    }
    /**
     * @return the monthStat
     */
    public String getMonthStat() {
        return monthStat;
    }
    /**
     * @param monthStat the monthStat to set
     */
    public void setMonthStat(String monthStat) {
        this.monthStat = monthStat;
    }
    /**
     * @return the yearStat
     */
    public String getYearStat() {
        return yearStat;
    }
    /**
     * @param yearStat the yearStat to set
     */
    public void setYearStat(String yearStat) {
        this.yearStat = yearStat;
    }

}

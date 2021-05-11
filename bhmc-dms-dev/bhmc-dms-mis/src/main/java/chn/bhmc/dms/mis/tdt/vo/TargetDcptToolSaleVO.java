package chn.bhmc.dms.mis.tdt.vo;

import able.com.vo.SearchVO;

/**
 * <pre>
 * [딜러사] 목표분해도구(판매고문)
 * </pre>
 *
 * @ClassName   : TargetDcptToolSaleVO.java
 * @Description : [딜러사] 목표분해도구(판매고문)
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */

public class TargetDcptToolSaleVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6534031744201367732L;

    private String sToolSaleYear;
    private String sToolSaleMonth;

    private String sSaleIdccYyMm;
    private String sSaleShopYyMm;
    private String monthTotalTargetVal;
    private String monthidccGapVal;
    private String monthShopGapVal;
    private String monthDlrCnt;
    private String sSaleIdccYyMmParam;
    /**
     * @return the sToolSaleYear
     */
    public String getsToolSaleYear() {
        return sToolSaleYear;
    }
    /**
     * @param sToolSaleYear the sToolSaleYear to set
     */
    public void setsToolSaleYear(String sToolSaleYear) {
        this.sToolSaleYear = sToolSaleYear;
    }
    /**
     * @return the sToolSaleMonth
     */
    public String getsToolSaleMonth() {
        return sToolSaleMonth;
    }
    /**
     * @param sToolSaleMonth the sToolSaleMonth to set
     */
    public void setsToolSaleMonth(String sToolSaleMonth) {
        this.sToolSaleMonth = sToolSaleMonth;
    }
    /**
     * @return the sSaleIdccYyMm
     */
    public String getsSaleIdccYyMm() {
        return sSaleIdccYyMm;
    }
    /**
     * @param sSaleIdccYyMm the sSaleIdccYyMm to set
     */
    public void setsSaleIdccYyMm(String sSaleIdccYyMm) {
        this.sSaleIdccYyMm = sSaleIdccYyMm;
    }
    /**
     * @return the sSaleShopYyMm
     */
    public String getsSaleShopYyMm() {
        return sSaleShopYyMm;
    }
    /**
     * @param sSaleShopYyMm the sSaleShopYyMm to set
     */
    public void setsSaleShopYyMm(String sSaleShopYyMm) {
        this.sSaleShopYyMm = sSaleShopYyMm;
    }
    /**
     * @return the monthTotalTargetVal
     */
    public String getMonthTotalTargetVal() {
        return monthTotalTargetVal;
    }
    /**
     * @param monthTotalTargetVal the monthTotalTargetVal to set
     */
    public void setMonthTotalTargetVal(String monthTotalTargetVal) {
        this.monthTotalTargetVal = monthTotalTargetVal;
    }
    /**
     * @return the monthidccGapVal
     */
    public String getMonthidccGapVal() {
        return monthidccGapVal;
    }
    /**
     * @param monthidccGapVal the monthidccGapVal to set
     */
    public void setMonthidccGapVal(String monthidccGapVal) {
        this.monthidccGapVal = monthidccGapVal;
    }
    /**
     * @return the monthShopGapVal
     */
    public String getMonthShopGapVal() {
        return monthShopGapVal;
    }
    /**
     * @param monthShopGapVal the monthShopGapVal to set
     */
    public void setMonthShopGapVal(String monthShopGapVal) {
        this.monthShopGapVal = monthShopGapVal;
    }
    /**
     * @return the monthDlrCnt
     */
    public String getMonthDlrCnt() {
        return monthDlrCnt;
    }
    /**
     * @param monthDlrCnt the monthDlrCnt to set
     */
    public void setMonthDlrCnt(String monthDlrCnt) {
        this.monthDlrCnt = monthDlrCnt;
    }
    /**
     * @return the sSaleIdccYyMmParam
     */
    public String getsSaleIdccYyMmParam() {
        return sSaleIdccYyMmParam;
    }
    /**
     * @param sSaleIdccYyMmParam the sSaleIdccYyMmParam to set
     */
    public void setsSaleIdccYyMmParam(String sSaleIdccYyMmParam) {
        this.sSaleIdccYyMmParam = sSaleIdccYyMmParam;
    }




}

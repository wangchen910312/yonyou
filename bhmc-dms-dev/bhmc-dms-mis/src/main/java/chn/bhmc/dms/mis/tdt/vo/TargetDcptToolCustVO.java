package chn.bhmc.dms.mis.tdt.vo;

import able.com.vo.SearchVO;

/**
 * <pre>
 * [딜러사] 목표분해도구(집객)
 * </pre>
 *
 * @ClassName   : TargetDcptToolCustVO.java
 * @Description : [딜러사] 목표분해도구(집객)
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

public class TargetDcptToolCustVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3137693936684897186L;

    private String sCustGoalStatusYear;
    private String sCustGoalStatusMonth;
    private String sCustGoalStatusDate;

    private String sCustGoalStatusYearParam;
    private String sCustGoalStatusMonthParam;
    private String sCustGoalStatusDateParam;

    private String carlineCd;
    private String goalPrefVal;
    private String goalPrefRate;
    private String goalPrefGap;


    /**
     * @return the sCustGoalStatusYear
     */
    public String getsCustGoalStatusYear() {
        return sCustGoalStatusYear;
    }
    /**
     * @param sCustGoalStatusYear the sCustGoalStatusYear to set
     */
    public void setsCustGoalStatusYear(String sCustGoalStatusYear) {
        this.sCustGoalStatusYear = sCustGoalStatusYear;
    }
    /**
     * @return the sCustGoalStatusMonth
     */
    public String getsCustGoalStatusMonth() {
        return sCustGoalStatusMonth;
    }
    /**
     * @param sCustGoalStatusMonth the sCustGoalStatusMonth to set
     */
    public void setsCustGoalStatusMonth(String sCustGoalStatusMonth) {
        this.sCustGoalStatusMonth = sCustGoalStatusMonth;
    }
    /**
     * @return the sCustGoalStatusDate
     */
    public String getsCustGoalStatusDate() {
        return sCustGoalStatusDate;
    }
    /**
     * @param sCustGoalStatusDate the sCustGoalStatusDate to set
     */
    public void setsCustGoalStatusDate(String sCustGoalStatusDate) {
        this.sCustGoalStatusDate = sCustGoalStatusDate;
    }
    /**
     * @return the sCustGoalStatusYearParam
     */
    public String getsCustGoalStatusYearParam() {
        return sCustGoalStatusYearParam;
    }
    /**
     * @param sCustGoalStatusYearParam the sCustGoalStatusYearParam to set
     */
    public void setsCustGoalStatusYearParam(String sCustGoalStatusYearParam) {
        this.sCustGoalStatusYearParam = sCustGoalStatusYearParam;
    }
    /**
     * @return the sCustGoalStatusMonthParam
     */
    public String getsCustGoalStatusMonthParam() {
        return sCustGoalStatusMonthParam;
    }
    /**
     * @param sCustGoalStatusMonthParam the sCustGoalStatusMonthParam to set
     */
    public void setsCustGoalStatusMonthParam(String sCustGoalStatusMonthParam) {
        this.sCustGoalStatusMonthParam = sCustGoalStatusMonthParam;
    }
    /**
     * @return the sCustGoalStatusDateParam
     */
    public String getsCustGoalStatusDateParam() {
        return sCustGoalStatusDateParam;
    }
    /**
     * @param sCustGoalStatusDateParam the sCustGoalStatusDateParam to set
     */
    public void setsCustGoalStatusDateParam(String sCustGoalStatusDateParam) {
        this.sCustGoalStatusDateParam = sCustGoalStatusDateParam;
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
     * @return the goalPrefVal
     */
    public String getGoalPrefVal() {
        return goalPrefVal;
    }
    /**
     * @param goalPrefVal the goalPrefVal to set
     */
    public void setGoalPrefVal(String goalPrefVal) {
        this.goalPrefVal = goalPrefVal;
    }
    /**
     * @return the goalPrefRate
     */
    public String getGoalPrefRate() {
        return goalPrefRate;
    }
    /**
     * @param goalPrefRate the goalPrefRate to set
     */
    public void setGoalPrefRate(String goalPrefRate) {
        this.goalPrefRate = goalPrefRate;
    }
    /**
     * @return the goalPrefGap
     */
    public String getGoalPrefGap() {
        return goalPrefGap;
    }
    /**
     * @param goalPrefGap the goalPrefGap to set
     */
    public void setGoalPrefGap(String goalPrefGap) {
        this.goalPrefGap = goalPrefGap;
    }



}

package chn.bhmc.dms.mis.tss.vo;

import able.com.vo.SearchVO;

/**
 * <pre>
 * [딜러사] 판매고문 실적현황
 * </pre>
 *
 * @ClassName   : TargetSalemanStatusSearchVO.java
 * @Description : [딜러사] 판매고문 실적현황
 * @author chibeom.song
 * @since 2016. 10. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 23.     chibeom.song     최초 생성
 * </pre>
 */

public class TargetSalemanStatusSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String sSalemanStatusYyMm;

    private String goalYy;
    private String goalMm;
    private String empNo;
    private String carlineCd;
    private String carlineNm;
    private String goalPrefVal;
    private String dealPrefVal;
    /**
     * @return the sSalemanStatusYyMm
     */
    public String getsSalemanStatusYyMm() {
        return sSalemanStatusYyMm;
    }
    /**
     * @param sSalemanStatusYyMm the sSalemanStatusYyMm to set
     */
    public void setsSalemanStatusYyMm(String sSalemanStatusYyMm) {
        this.sSalemanStatusYyMm = sSalemanStatusYyMm;
    }
    /**
     * @return the goalYy
     */
    public String getGoalYy() {
        return goalYy;
    }
    /**
     * @param goalYy the goalYy to set
     */
    public void setGoalYy(String goalYy) {
        this.goalYy = goalYy;
    }
    /**
     * @return the goalMm
     */
    public String getGoalMm() {
        return goalMm;
    }
    /**
     * @param goalMm the goalMm to set
     */
    public void setGoalMm(String goalMm) {
        this.goalMm = goalMm;
    }
    /**
     * @return the empNo
     */
    public String getEmpNo() {
        return empNo;
    }
    /**
     * @param empNo the empNo to set
     */
    public void setEmpNo(String empNo) {
        this.empNo = empNo;
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
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }
    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
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
     * @return the dealPrefVal
     */
    public String getDealPrefVal() {
        return dealPrefVal;
    }
    /**
     * @param dealPrefVal the dealPrefVal to set
     */
    public void setDealPrefVal(String dealPrefVal) {
        this.dealPrefVal = dealPrefVal;
    }
    
    
    
    

}

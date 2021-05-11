package chn.bhmc.dms.mis.tds.vo;

import java.util.Date;

import able.com.vo.SearchVO;
/**
 * <pre>
 * 목표 분해 공구 - 차형별 이익설정
 * </pre>
 *
 * @ClassName   : TargetProfitConfigVO.java
 * @Description : 목표 분해 공구 - 차형별 이익설정
 * @author chibeom.song
 * @since 2016. 9. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 27.   chibeom.song     최초 생성
 * </pre>
 */

public class TargetProfitConfigVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String sMonitorProfitDate;

    private String goalProfitYy;
    private String goalProfitMm;
    private String carlineProfitCd;
    private String carlineProfitNm;
    private String productProfitVal;
    private String settingProfitVal;
    private String carProfitVal;
    private String allProfitVal;
    private String goalProfitPrefVal;

    private String regUsrId;
    private Date regDt;
    private String updtUsrId;
    private Date updtDt;


    /**
     * @return the sMonitorProfitDate
     */
    public String getsMonitorProfitDate() {
        return sMonitorProfitDate;
    }
    /**
     * @param sMonitorProfitDate the sMonitorProfitDate to set
     */
    public void setsMonitorProfitDate(String sMonitorProfitDate) {
        this.sMonitorProfitDate = sMonitorProfitDate;
    }
    /**
     * @return the goalProfitYy
     */
    public String getGoalProfitYy() {
        return goalProfitYy;
    }
    /**
     * @param goalProfitYy the goalProfitYy to set
     */
    public void setGoalProfitYy(String goalProfitYy) {
        this.goalProfitYy = goalProfitYy;
    }
    /**
     * @return the goalProfitMm
     */
    public String getGoalProfitMm() {
        return goalProfitMm;
    }
    /**
     * @param goalProfitMm the goalProfitMm to set
     */
    public void setGoalProfitMm(String goalProfitMm) {
        this.goalProfitMm = goalProfitMm;
    }
    /**
     * @return the carlineProfitCd
     */
    public String getCarlineProfitCd() {
        return carlineProfitCd;
    }
    /**
     * @param carlineProfitCd the carlineProfitCd to set
     */
    public void setCarlineProfitCd(String carlineProfitCd) {
        this.carlineProfitCd = carlineProfitCd;
    }
    /**
     * @return the carlineProfitNm
     */
    public String getCarlineProfitNm() {
        return carlineProfitNm;
    }
    /**
     * @param carlineProfitNm the carlineProfitNm to set
     */
    public void setCarlineProfitNm(String carlineProfitNm) {
        this.carlineProfitNm = carlineProfitNm;
    }
    /**
     * @return the productProfitVal
     */
    public String getProductProfitVal() {
        return productProfitVal;
    }
    /**
     * @param productProfitVal the productProfitVal to set
     */
    public void setProductProfitVal(String productProfitVal) {
        this.productProfitVal = productProfitVal;
    }
    /**
     * @return the settingProfitVal
     */
    public String getSettingProfitVal() {
        return settingProfitVal;
    }
    /**
     * @param settingProfitVal the settingProfitVal to set
     */
    public void setSettingProfitVal(String settingProfitVal) {
        this.settingProfitVal = settingProfitVal;
    }
    /**
     * @return the carProfitVal
     */
    public String getCarProfitVal() {
        return carProfitVal;
    }
    /**
     * @param carProfitVal the carProfitVal to set
     */
    public void setCarProfitVal(String carProfitVal) {
        this.carProfitVal = carProfitVal;
    }
    /**
     * @return the allProfitVal
     */
    public String getAllProfitVal() {
        return allProfitVal;
    }
    /**
     * @param allProfitVal the allProfitVal to set
     */
    public void setAllProfitVal(String allProfitVal) {
        this.allProfitVal = allProfitVal;
    }
    /**
     * @return the goalProfitPrefVal
     */
    public String getGoalProfitPrefVal() {
        return goalProfitPrefVal;
    }
    /**
     * @param goalProfitPrefVal the goalProfitPrefVal to set
     */
    public void setGoalProfitPrefVal(String goalProfitPrefVal) {
        this.goalProfitPrefVal = goalProfitPrefVal;
    }
    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }
    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }
    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }
    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }
    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }
    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }
    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }




}

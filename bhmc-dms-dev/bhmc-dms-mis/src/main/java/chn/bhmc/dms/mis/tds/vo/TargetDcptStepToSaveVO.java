package chn.bhmc.dms.mis.tds.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * 목표 분해 공구
 * </pre>
 *
 * @ClassName   : TargetDcptStepToSaveVO.java
 * @Description : 목표 분해 공구
 * @author chibeom.song
 * @since 2016. 9. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 20.   chibeom.song     최초 생성
 * </pre>
 */

public class TargetDcptStepToSaveVO extends BaseSaveVO<TargetDcptStepSearchVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1833185444783942676L;

    private String updtUsrId;
    private String regUsrId;
    private String goalYy;
    private String goalMm;
    private String carlineCd;
    private String carlineNm;
    private String dealerCarlineCd;
    private String dealerCarlineNm;
    private String dealerDlrTp;
    private String dealerGoalTp;
    private String dealerGoalPrefVal;
    private String dealerGoalYy;
    private String dealerGoalMm;
    private String dlrCd;

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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
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
     * @return the dealerCarlineCd
     */
    public String getDealerCarlineCd() {
        return dealerCarlineCd;
    }
    /**
     * @param dealerCarlineCd the dealerCarlineCd to set
     */
    public void setDealerCarlineCd(String dealerCarlineCd) {
        this.dealerCarlineCd = dealerCarlineCd;
    }
    /**
     * @return the dealerCarlineNm
     */
    public String getDealerCarlineNm() {
        return dealerCarlineNm;
    }
    /**
     * @param dealerCarlineNm the dealerCarlineNm to set
     */
    public void setDealerCarlineNm(String dealerCarlineNm) {
        this.dealerCarlineNm = dealerCarlineNm;
    }
    /**
     * @return the dealerDlrTp
     */
    public String getDealerDlrTp() {
        return dealerDlrTp;
    }
    /**
     * @param dealerDlrTp the dealerDlrTp to set
     */
    public void setDealerDlrTp(String dealerDlrTp) {
        this.dealerDlrTp = dealerDlrTp;
    }
    /**
     * @return the dealerGoalTp
     */
    public String getDealerGoalTp() {
        return dealerGoalTp;
    }
    /**
     * @param dealerGoalTp the dealerGoalTp to set
     */
    public void setDealerGoalTp(String dealerGoalTp) {
        this.dealerGoalTp = dealerGoalTp;
    }
    /**
     * @return the dealerGoalPrefVal
     */
    public String getDealerGoalPrefVal() {
        return dealerGoalPrefVal;
    }
    /**
     * @param dealerGoalPrefVal the dealerGoalPrefVal to set
     */
    public void setDealerGoalPrefVal(String dealerGoalPrefVal) {
        this.dealerGoalPrefVal = dealerGoalPrefVal;
    }
    /**
     * @return the dealerGoalYy
     */
    public String getDealerGoalYy() {
        return dealerGoalYy;
    }
    /**
     * @param dealerGoalYy the dealerGoalYy to set
     */
    public void setDealerGoalYy(String dealerGoalYy) {
        this.dealerGoalYy = dealerGoalYy;
    }
    /**
     * @return the dealerGoalMm
     */
    public String getDealerGoalMm() {
        return dealerGoalMm;
    }
    /**
     * @param dealerGoalMm the dealerGoalMm to set
     */
    public void setDealerGoalMm(String dealerGoalMm) {
        this.dealerGoalMm = dealerGoalMm;
    }

}

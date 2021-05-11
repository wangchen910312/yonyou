package chn.bhmc.dms.mis.tds.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * 목표 분해 공구
 * </pre>
 *
 * @ClassName   : TargetDcptStepSaSaveVO.java
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

public class TargetDcptStepSaSaveVO extends BaseSaveVO<TargetDcptStepVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1833185444783942676L;

    private String carlineCd;
    private String carlineNm;

    private String saleGoalYy;
    private String saleGoalMm;
    private String carDcptEmpNo;
    private String carDcptEmpNm;
    private String carDcptCarlineCd;
    private String carDcptCarlineNm;
    private String carDcptGoalPrefVal;
    private String carDcptGoalSumfVal;

    private String saleUpdtUsrId;
    private String saleRegUsrId;
    private String dlrCd;
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
     * @return the saleGoalYy
     */
    public String getSaleGoalYy() {
        return saleGoalYy;
    }
    /**
     * @param saleGoalYy the saleGoalYy to set
     */
    public void setSaleGoalYy(String saleGoalYy) {
        this.saleGoalYy = saleGoalYy;
    }
    /**
     * @return the saleGoalMm
     */
    public String getSaleGoalMm() {
        return saleGoalMm;
    }
    /**
     * @param saleGoalMm the saleGoalMm to set
     */
    public void setSaleGoalMm(String saleGoalMm) {
        this.saleGoalMm = saleGoalMm;
    }
    /**
     * @return the carDcptEmpNo
     */
    public String getCarDcptEmpNo() {
        return carDcptEmpNo;
    }
    /**
     * @param carDcptEmpNo the carDcptEmpNo to set
     */
    public void setCarDcptEmpNo(String carDcptEmpNo) {
        this.carDcptEmpNo = carDcptEmpNo;
    }
    /**
     * @return the carDcptEmpNm
     */
    public String getCarDcptEmpNm() {
        return carDcptEmpNm;
    }
    /**
     * @param carDcptEmpNm the carDcptEmpNm to set
     */
    public void setCarDcptEmpNm(String carDcptEmpNm) {
        this.carDcptEmpNm = carDcptEmpNm;
    }
    /**
     * @return the carDcptCarlineCd
     */
    public String getCarDcptCarlineCd() {
        return carDcptCarlineCd;
    }
    /**
     * @param carDcptCarlineCd the carDcptCarlineCd to set
     */
    public void setCarDcptCarlineCd(String carDcptCarlineCd) {
        this.carDcptCarlineCd = carDcptCarlineCd;
    }
    /**
     * @return the carDcptCarlineNm
     */
    public String getCarDcptCarlineNm() {
        return carDcptCarlineNm;
    }
    /**
     * @param carDcptCarlineNm the carDcptCarlineNm to set
     */
    public void setCarDcptCarlineNm(String carDcptCarlineNm) {
        this.carDcptCarlineNm = carDcptCarlineNm;
    }
    /**
     * @return the carDcptGoalPrefVal
     */
    public String getCarDcptGoalPrefVal() {
        return carDcptGoalPrefVal;
    }
    /**
     * @param carDcptGoalPrefVal the carDcptGoalPrefVal to set
     */
    public void setCarDcptGoalPrefVal(String carDcptGoalPrefVal) {
        this.carDcptGoalPrefVal = carDcptGoalPrefVal;
    }
    /**
     * @return the carDcptGoalSumfVal
     */
    public String getCarDcptGoalSumfVal() {
        return carDcptGoalSumfVal;
    }
    /**
     * @param carDcptGoalSumfVal the carDcptGoalSumfVal to set
     */
    public void setCarDcptGoalSumfVal(String carDcptGoalSumfVal) {
        this.carDcptGoalSumfVal = carDcptGoalSumfVal;
    }
    /**
     * @return the saleUpdtUsrId
     */
    public String getSaleUpdtUsrId() {
        return saleUpdtUsrId;
    }
    /**
     * @param saleUpdtUsrId the saleUpdtUsrId to set
     */
    public void setSaleUpdtUsrId(String saleUpdtUsrId) {
        this.saleUpdtUsrId = saleUpdtUsrId;
    }
    /**
     * @return the saleRegUsrId
     */
    public String getSaleRegUsrId() {
        return saleRegUsrId;
    }
    /**
     * @param saleRegUsrId the saleRegUsrId to set
     */
    public void setSaleRegUsrId(String saleRegUsrId) {
        this.saleRegUsrId = saleRegUsrId;
    }
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





}

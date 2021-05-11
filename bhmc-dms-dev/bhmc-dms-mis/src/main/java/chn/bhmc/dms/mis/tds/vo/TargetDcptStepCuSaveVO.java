package chn.bhmc.dms.mis.tds.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * 목표 분해 공구
 * </pre>
 *
 * @ClassName   : TargetDcptStepCuSaveVO.java
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

public class TargetDcptStepCuSaveVO  extends BaseSaveVO<TargetDcptStepVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1833185444783942676L;

    private String custGoalYy;
    private String custGoalMm;
    private String nameGubn;
    private String nameChannel;

    private String custGubnCarlineCd;
    private String custGubnCarlineNm;
    private String custGubnValue;

    private String custUpdtUsrId;
    private String custRegUsrId;
    private String custGubnVal;
    private String custChannelVal;

    private String carlineCd;
    private String carlineNm;


    /**
     * @return the custGoalYy
     */
    public String getCustGoalYy() {
        return custGoalYy;
    }
    /**
     * @param custGoalYy the custGoalYy to set
     */
    public void setCustGoalYy(String custGoalYy) {
        this.custGoalYy = custGoalYy;
    }
    /**
     * @return the custGoalMm
     */
    public String getCustGoalMm() {
        return custGoalMm;
    }
    /**
     * @param custGoalMm the custGoalMm to set
     */
    public void setCustGoalMm(String custGoalMm) {
        this.custGoalMm = custGoalMm;
    }
    /**
     * @return the nameGubn
     */
    public String getNameGubn() {
        return nameGubn;
    }
    /**
     * @param nameGubn the nameGubn to set
     */
    public void setNameGubn(String nameGubn) {
        this.nameGubn = nameGubn;
    }
    /**
     * @return the nameChannel
     */
    public String getNameChannel() {
        return nameChannel;
    }
    /**
     * @param nameChannel the nameChannel to set
     */
    public void setNameChannel(String nameChannel) {
        this.nameChannel = nameChannel;
    }
    /**
     * @return the custGubnCarlineCd
     */
    public String getCustGubnCarlineCd() {
        return custGubnCarlineCd;
    }
    /**
     * @param custGubnCarlineCd the custGubnCarlineCd to set
     */
    public void setCustGubnCarlineCd(String custGubnCarlineCd) {
        this.custGubnCarlineCd = custGubnCarlineCd;
    }
    /**
     * @return the custGubnCarlineNm
     */
    public String getCustGubnCarlineNm() {
        return custGubnCarlineNm;
    }
    /**
     * @param custGubnCarlineNm the custGubnCarlineNm to set
     */
    public void setCustGubnCarlineNm(String custGubnCarlineNm) {
        this.custGubnCarlineNm = custGubnCarlineNm;
    }
    /**
     * @return the custGubnValue
     */
    public String getCustGubnValue() {
        return custGubnValue;
    }
    /**
     * @param custGubnValue the custGubnValue to set
     */
    public void setCustGubnValue(String custGubnValue) {
        this.custGubnValue = custGubnValue;
    }
    /**
     * @return the custUpdtUsrId
     */
    public String getCustUpdtUsrId() {
        return custUpdtUsrId;
    }
    /**
     * @param custUpdtUsrId the custUpdtUsrId to set
     */
    public void setCustUpdtUsrId(String custUpdtUsrId) {
        this.custUpdtUsrId = custUpdtUsrId;
    }
    /**
     * @return the custRegUsrId
     */
    public String getCustRegUsrId() {
        return custRegUsrId;
    }
    /**
     * @param custRegUsrId the custRegUsrId to set
     */
    public void setCustRegUsrId(String custRegUsrId) {
        this.custRegUsrId = custRegUsrId;
    }
    /**
     * @return the custGubnVal
     */
    public String getCustGubnVal() {
        return custGubnVal;
    }
    /**
     * @param custGubnVal the custGubnVal to set
     */
    public void setCustGubnVal(String custGubnVal) {
        this.custGubnVal = custGubnVal;
    }
    /**
     * @return the custChannelVal
     */
    public String getCustChannelVal() {
        return custChannelVal;
    }
    /**
     * @param custChannelVal the custChannelVal to set
     */
    public void setCustChannelVal(String custChannelVal) {
        this.custChannelVal = custChannelVal;
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


}

package chn.bhmc.dms.sal.sti.vo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

public class ConfirmWearingVehiclePopupVO implements Serializable {

	private static final long serialVersionUID = -6091261787809835772L;

	private String vinNo;
	@JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlrEvalDt;
	private String dstbSerEvalVal;
	private String driverStsfVal;
	private String carIssueHmVal;
    private String carIssueMassVal;
    private String otherCont;
    private String regUsrId;
    private String updtUsrId;
    private String dlrCd;

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }
    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    /**
     * @return the dlrEvalDt
     */
    public Date getDlrEvalDt() {
        return dlrEvalDt;
    }
    /**
     * @param dlrEvalDt the dlrEvalDt to set
     */
    public void setDlrEvalDt(Date dlrEvalDt) {
        this.dlrEvalDt = dlrEvalDt;
    }
    /**
     * @return the dstbSerEvalVal
     */
    public String getDstbSerEvalVal() {
        return dstbSerEvalVal;
    }
    /**
     * @param dstbSerEvalVal the dstbSerEvalVal to set
     */
    public void setDstbSerEvalVal(String dstbSerEvalVal) {
        this.dstbSerEvalVal = dstbSerEvalVal;
    }
    /**
     * @return the driverStsfVal
     */
    public String getDriverStsfVal() {
        return driverStsfVal;
    }
    /**
     * @param driverStsfVal the driverStsfVal to set
     */
    public void setDriverStsfVal(String driverStsfVal) {
        this.driverStsfVal = driverStsfVal;
    }
    /**
     * @return the carIssueHmVal
     */
    public String getCarIssueHmVal() {
        return carIssueHmVal;
    }
    /**
     * @param carIssueHmVal the carIssueHmVal to set
     */
    public void setCarIssueHmVal(String carIssueHmVal) {
        this.carIssueHmVal = carIssueHmVal;
    }
    /**
     * @return the carIssueMassVal
     */
    public String getCarIssueMassVal() {
        return carIssueMassVal;
    }
    /**
     * @param carIssueMassVal the carIssueMassVal to set
     */
    public void setCarIssueMassVal(String carIssueMassVal) {
        this.carIssueMassVal = carIssueMassVal;
    }
    /**
     * @return the otherCont
     */
    public String getOtherCont() {
        return otherCont;
    }
    /**
     * @param otherCont the otherCont to set
     */
    public void setOtherCont(String otherCont) {
        this.otherCont = otherCont;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
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


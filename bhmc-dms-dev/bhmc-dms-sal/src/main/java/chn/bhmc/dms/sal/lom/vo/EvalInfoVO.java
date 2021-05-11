package chn.bhmc.dms.sal.lom.vo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

public class EvalInfoVO implements Serializable {

	private static final long serialVersionUID = -6091261787809835772L;

	private String dlrCd;
	private String dstbCmpNm;
	private String trsfCarNo;
	private String vinNo;
    private String carStatCd;
    private String carStatNm;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date grDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date pltGiDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlrEvalDt;

    private String dstbSerEvalVal;
    private String dstbSerEvalValNm;
    private String driverStsfVal;
    private String driverStsfValNm;
    private String carIssueHmVal;
    private String carIssueHmValNm;
    private String carIssueMassVal;
    private String carIssueMassValNm;
    private String otherCont;

    private String updtUsrId;
    private String updtUsrNm;
    private String preAlrtNtceCont;
    private String rnum;

    /**
     * @return the carStatNm
     */
    public String getCarStatNm() {
        return carStatNm;
    }
    /**
     * @param carStatNm the carStatNm to set
     */
    public void setCarStatNm(String carStatNm) {
        this.carStatNm = carStatNm;
    }
    /**
     * @return the dstbSerEvalValNm
     */
    public String getDstbSerEvalValNm() {
        return dstbSerEvalValNm;
    }
    /**
     * @param dstbSerEvalValNm the dstbSerEvalValNm to set
     */
    public void setDstbSerEvalValNm(String dstbSerEvalValNm) {
        this.dstbSerEvalValNm = dstbSerEvalValNm;
    }
    /**
     * @return the driverStsfValNm
     */
    public String getDriverStsfValNm() {
        return driverStsfValNm;
    }
    /**
     * @param driverStsfValNm the driverStsfValNm to set
     */
    public void setDriverStsfValNm(String driverStsfValNm) {
        this.driverStsfValNm = driverStsfValNm;
    }
    /**
     * @return the carIssueHmValNm
     */
    public String getCarIssueHmValNm() {
        return carIssueHmValNm;
    }
    /**
     * @param carIssueHmValNm the carIssueHmValNm to set
     */
    public void setCarIssueHmValNm(String carIssueHmValNm) {
        this.carIssueHmValNm = carIssueHmValNm;
    }
    /**
     * @return the carIssueMassValNm
     */
    public String getCarIssueMassValNm() {
        return carIssueMassValNm;
    }
    /**
     * @param carIssueMassValNm the carIssueMassValNm to set
     */
    public void setCarIssueMassValNm(String carIssueMassValNm) {
        this.carIssueMassValNm = carIssueMassValNm;
    }
    /**
     * @return the preAlrtNtceCont
     */
    public String getPreAlrtNtceCont() {
        return preAlrtNtceCont;
    }
    /**
     * @param preAlrtNtceCont the preAlrtNtceCont to set
     */
    public void setPreAlrtNtceCont(String preAlrtNtceCont) {
        this.preAlrtNtceCont = preAlrtNtceCont;
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
    /**
     * @return the dstbCmpNm
     */
    public String getDstbCmpNm() {
        return dstbCmpNm;
    }
    /**
     * @param dstbCmpNm the dstbCmpNm to set
     */
    public void setDstbCmpNm(String dstbCmpNm) {
        this.dstbCmpNm = dstbCmpNm;
    }
    /**
     * @return the trsfCarNo
     */
    public String getTrsfCarNo() {
        return trsfCarNo;
    }
    /**
     * @param trsfCarNo the trsfCarNo to set
     */
    public void setTrsfCarNo(String trsfCarNo) {
        this.trsfCarNo = trsfCarNo;
    }
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
     * @return the carStatCd
     */
    public String getCarStatCd() {
        return carStatCd;
    }
    /**
     * @param carStatCd the carStatCd to set
     */
    public void setCarStatCd(String carStatCd) {
        this.carStatCd = carStatCd;
    }
    /**
     * @return the grDt
     */
    public Date getGrDt() {
        return grDt;
    }
    /**
     * @param grDt the grDt to set
     */
    public void setGrDt(Date grDt) {
        this.grDt = grDt;
    }
    /**
     * @return the pltGiDt
     */
    public Date getPltGiDt() {
        return pltGiDt;
    }
    /**
     * @param pltGiDt the pltGiDt to set
     */
    public void setPltGiDt(Date pltGiDt) {
        this.pltGiDt = pltGiDt;
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
     * @return the updtUsrNm
     */
    public String getUpdtUsrNm() {
        return updtUsrNm;
    }
    /**
     * @param updtUsrNm the updtUsrNm to set
     */
    public void setUpdtUsrNm(String updtUsrNm) {
        this.updtUsrNm = updtUsrNm;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the rnum
     */
    public String getRnum() {
        return rnum;
    }
    /**
     * @param rnum the rnum to set
     */
    public void setRnum(String rnum) {
        this.rnum = rnum;
    }
}
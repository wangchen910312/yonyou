package chn.bhmc.dms.sal.orm.vo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

public class OrderPriorityManagementVO implements Serializable {

	private static final long serialVersionUID = -6091261787809835772L;

	private String dlrCd;
	private String ordTp;
	private String ordYyMmDt;
	private String ordPrid;
    private String ordNo;
    private String carlineNm;
    private String modelNm;
    private String ocnNm;
    private String extColorNm;
    private String intColorNm;
    private String ordGradeCd;
    private String salesNo;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date pfpExamDt;
    private String erpSendYn;


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
     * @return the ordTp
     */
    public String getOrdTp() {
        return ordTp;
    }


    /**
     * @param ordTp the ordTp to set
     */
    public void setOrdTp(String ordTp) {
        this.ordTp = ordTp;
    }


    /**
     * @return the ordYyMmDt
     */
    public String getOrdYyMmDt() {
        return ordYyMmDt;
    }


    /**
     * @param ordYyMmDt the ordYyMmDt to set
     */
    public void setOrdYyMmDt(String ordYyMmDt) {
        this.ordYyMmDt = ordYyMmDt;
    }


    /**
     * @return the ordPrid
     */
    public String getOrdPrid() {
        return ordPrid;
    }


    /**
     * @param ordPrid the ordPrid to set
     */
    public void setOrdPrid(String ordPrid) {
        this.ordPrid = ordPrid;
    }


    /**
     * @return the ordNo
     */
    public String getOrdNo() {
        return ordNo;
    }


    /**
     * @param ordNo the ordNo to set
     */
    public void setOrdNo(String ordNo) {
        this.ordNo = ordNo;
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
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }


    /**
     * @param modelNm the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }


    /**
     * @return the ocnNm
     */
    public String getOcnNm() {
        return ocnNm;
    }


    /**
     * @param ocnNm the ocnNm to set
     */
    public void setOcnNm(String ocnNm) {
        this.ocnNm = ocnNm;
    }


    /**
     * @return the extColorNm
     */
    public String getExtColorNm() {
        return extColorNm;
    }


    /**
     * @param extColorNm the extColorNm to set
     */
    public void setExtColorNm(String extColorNm) {
        this.extColorNm = extColorNm;
    }


    /**
     * @return the intColorNm
     */
    public String getIntColorNm() {
        return intColorNm;
    }


    /**
     * @param intColorNm the intColorNm to set
     */
    public void setIntColorNm(String intColorNm) {
        this.intColorNm = intColorNm;
    }




    /**
     * @return the pfpExamDt
     */
    public Date getPfpExamDt() {
        return pfpExamDt;
    }


    /**
     * @param pfpExamDt the pfpExamDt to set
     */
    public void setPfpExamDt(Date pfpExamDt) {
        this.pfpExamDt = pfpExamDt;
    }


    /**
     * @return the erpSendYn
     */
    public String getErpSendYn() {
        return erpSendYn;
    }


    /**
     * @param erpSendYn the erpSendYn to set
     */
    public void setErpSendYn(String erpSendYn) {
        this.erpSendYn = erpSendYn;
    }


    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }


    /**
     * @return the ordGradeCd
     */
    public String getOrdGradeCd() {
        return ordGradeCd;
    }


    /**
     * @param ordGradeCd the ordGradeCd to set
     */
    public void setOrdGradeCd(String ordGradeCd) {
        this.ordGradeCd = ordGradeCd;
    }


    /**
     * @return the salesNo
     */
    public String getSalesNo() {
        return salesNo;
    }


    /**
     * @param salesNo the salesNo to set
     */
    public void setSalesNo(String salesNo) {
        this.salesNo = salesNo;
    }


}


package chn.bhmc.dms.sal.sti.vo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

public class ConfirmWearingVehicleVO implements Serializable {

	private static final long serialVersionUID = -6091261787809835772L;

	private String dstbCmpNm;
	private String carRegNo;
	private String ordNo;
	private String vinNo;
    private String carDumpCd;
    private String carlineCd;
    private String carlineNm;
    private String modelCd;
    private String modelNm;
    private String ocnCd;
    private String ocnNm;
    private String extColorCd;
    private String extColorNm;
    private String intColorCd;
    private String intColorNm;
    private String ordTp;
    private String manufactYyMmDt;
    private String asdy;

    private String vinNo1;
    private String vinNo2;
    private String carId;
    private String prty;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date grDt;

    private String enginNo;
    private String certNo;
    private String chrgCd;

    private String updtUsrId;
    private String updtUsrNm;

    private String carStatCd;
    private String chgCarStatCd;
    private String barcodeNo;
    private String dlrCd;
    private String ordYymm;
    private String ordWeek;
    private String evalYn;
    private String rfidNo;



    /**
     * @return the rfidNo
     */
    public String getRfidNo() {
        return rfidNo;
    }
    /**
     * @param rfidNo the rfidNo to set
     */
    public void setRfidNo(String rfidNo) {
        this.rfidNo = rfidNo;
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
     * @return the ordYymm
     */
    public String getOrdYymm() {
        return ordYymm;
    }
    /**
     * @param ordYymm the ordYymm to set
     */
    public void setOrdYymm(String ordYymm) {
        this.ordYymm = ordYymm;
    }
    /**
     * @return the ordWeek
     */
    public String getOrdWeek() {
        return ordWeek;
    }
    /**
     * @param ordWeek the ordWeek to set
     */
    public void setOrdWeek(String ordWeek) {
        this.ordWeek = ordWeek;
    }
    /**
     * @return the evalYn
     */
    public String getEvalYn() {
        return evalYn;
    }
    /**
     * @param evalYn the evalYn to set
     */
    public void setEvalYn(String evalYn) {
        this.evalYn = evalYn;
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
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }
    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }
    /**
     * @return the ocnCd
     */
    public String getOcnCd() {
        return ocnCd;
    }
    /**
     * @param ocnCd the ocnCd to set
     */
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }
    /**
     * @return the extColorCd
     */
    public String getExtColorCd() {
        return extColorCd;
    }
    /**
     * @param extColorCd the extColorCd to set
     */
    public void setExtColorCd(String extColorCd) {
        this.extColorCd = extColorCd;
    }
    /**
     * @return the intColorCd
     */
    public String getIntColorCd() {
        return intColorCd;
    }
    /**
     * @param intColorCd the intColorCd to set
     */
    public void setIntColorCd(String intColorCd) {
        this.intColorCd = intColorCd;
    }
    /**
     * @return the barcodeNo
     */
    public String getBarcodeNo() {
        return barcodeNo;
    }
    /**
     * @param barcodeNo the barcodeNo to set
     */
    public void setBarcodeNo(String barcodeNo) {
        this.barcodeNo = barcodeNo;
    }
    /**
     * @return the carId
     */
    public String getCarId() {
        return carId;
    }
    /**
     * @param carId the carId to set
     */
    public void setCarId(String carId) {
        this.carId = carId;
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
     * @return the carRegNo
     */
    public String getCarRegNo() {
        return carRegNo;
    }
    /**
     * @param carRegNo the carRegNo to set
     */
    public void setCarRegNo(String carRegNo) {
        this.carRegNo = carRegNo;
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
     * @return the carDumpCd
     */
    public String getCarDumpCd() {
        return carDumpCd;
    }
    /**
     * @param carDumpCd the carDumpCd to set
     */
    public void setCarDumpCd(String carDumpCd) {
        this.carDumpCd = carDumpCd;
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
     * @return the manufactYyMmDt
     */
    public String getManufactYyMmDt() {
        return manufactYyMmDt;
    }
    /**
     * @param manufactYyMmDt the manufactYyMmDt to set
     */
    public void setManufactYyMmDt(String manufactYyMmDt) {
        this.manufactYyMmDt = manufactYyMmDt;
    }

    /**
     * @return the asdy
     */
    public String getAsdy() {
        return asdy;
    }
    /**
     * @param asdy the asdy to set
     */
    public void setAsdy(String asdy) {
        this.asdy = asdy;
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
     * @return the enginNo
     */
    public String getEnginNo() {
        return enginNo;
    }
    /**
     * @param enginNo the enginNo to set
     */
    public void setEnginNo(String enginNo) {
        this.enginNo = enginNo;
    }
    /**
     * @return the certNo
     */
    public String getCertNo() {
        return certNo;
    }
    /**
     * @param certNo the certNo to set
     */
    public void setCertNo(String certNo) {
        this.certNo = certNo;
    }
    /**
     * @return the chrgCd
     */
    public String getChrgCd() {
        return chrgCd;
    }
    /**
     * @param chrgCd the chrgCd to set
     */
    public void setChrgCd(String chrgCd) {
        this.chrgCd = chrgCd;
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
     * @return the chgCarStatCd
     */
    public String getChgCarStatCd() {
        return chgCarStatCd;
    }
    /**
     * @param chgCarStatCd the chgCarStatCd to set
     */
    public void setChgCarStatCd(String chgCarStatCd) {
        this.chgCarStatCd = chgCarStatCd;
    }
    /**
     * @return the vinNo1
     */
    public String getVinNo1() {
        return vinNo1;
    }
    /**
     * @param vinNo1 the vinNo1 to set
     */
    public void setVinNo1(String vinNo1) {
        this.vinNo1 = vinNo1;
    }
    /**
     * @return the vinNo2
     */
    public String getVinNo2() {
        return vinNo2;
    }
    /**
     * @param vinNo2 the vinNo2 to set
     */
    public void setVinNo2(String vinNo2) {
        this.vinNo2 = vinNo2;
    }
    /**
     * @return the prty
     */
    public String getPrty() {
        return prty;
    }
    /**
     * @param prty the prty to set
     */
    public void setPrty(String prty) {
        this.prty = prty;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }


}


package chn.bhmc.dms.sal.orm.vo;

import java.io.Serializable;

public class BtoSearchOrderVO implements Serializable {

	private static final long serialVersionUID = -6091261787809835772L;

	private String ordTp;
	private String ordYyMmDt;
	private String ordPrid;
    private String ordNo;
    private String carlineCd;
    private String modelCd;
    private String ocnCd;
    private String extColorCd;
    private String intColorCd;
    private String carlineNm;
    private String modelNm;
    private String ocnNm;
    private String extColorNm;
    private String intColorNm;
    private int ordReqQty;
    private int ordCnfrmQty;
    private String ordGradeCd;
    private String pfpExamDt;
    private String trsfDlrCd;
    private String ordStatCd;
    private String trsfDlrNm;
    private String ifresultRtn;
    private String aldy;

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
     * @return the ordReqQty
     */
    public int getOrdReqQty() {
        return ordReqQty;
    }
    /**
     * @param ordReqQty the ordReqQty to set
     */
    public void setOrdReqQty(int ordReqQty) {
        this.ordReqQty = ordReqQty;
    }
    /**
     * @return the ordCnfrmQty
     */
    public int getOrdCnfrmQty() {
        return ordCnfrmQty;
    }
    /**
     * @param ordCnfrmQty the ordCnfrmQty to set
     */
    public void setOrdCnfrmQty(int ordCnfrmQty) {
        this.ordCnfrmQty = ordCnfrmQty;
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
     * @return the pfpExamDt
     */
    public String getPfpExamDt() {
        return pfpExamDt;
    }
    /**
     * @param pfpExamDt the pfpExamDt to set
     */
    public void setPfpExamDt(String pfpExamDt) {
        this.pfpExamDt = pfpExamDt;
    }
    /**
     * @return the trsfDlrCd
     */
    public String getTrsfDlrCd() {
        return trsfDlrCd;
    }
    /**
     * @param trsfDlrCd the trsfDlrCd to set
     */
    public void setTrsfDlrCd(String trsfDlrCd) {
        this.trsfDlrCd = trsfDlrCd;
    }
    /**
     * @return the ordStatCd
     */
    public String getOrdStatCd() {
        return ordStatCd;
    }
    /**
     * @param ordStatCd the ordStatCd to set
     */
    public void setOrdStatCd(String ordStatCd) {
        this.ordStatCd = ordStatCd;
    }
    /**
     * @return the trsfDlrNm
     */
    public String getTrsfDlrNm() {
        return trsfDlrNm;
    }
    /**
     * @param trsfDlrNm the trsfDlrNm to set
     */
    public void setTrsfDlrNm(String trsfDlrNm) {
        this.trsfDlrNm = trsfDlrNm;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the ifresultRtn
     */
    public String getIfresultRtn() {
        return ifresultRtn;
    }
    /**
     * @param ifresultRtn the ifresultRtn to set
     */
    public void setIfresultRtn(String ifresultRtn) {
        this.ifresultRtn = ifresultRtn;
    }
    /**
     * @return the aldy
     */
    public String getAldy() {
        return aldy;
    }
    /**
     * @param aldy the aldy to set
     */
    public void setAldy(String aldy) {
        this.aldy = aldy;
    }
}
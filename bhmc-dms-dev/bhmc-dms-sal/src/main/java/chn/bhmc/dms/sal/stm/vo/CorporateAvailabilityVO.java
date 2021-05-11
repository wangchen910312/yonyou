package chn.bhmc.dms.sal.stm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;


public class CorporateAvailabilityVO extends BaseVO{

	/**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3903052437221189259L;

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

    private String lgOrt;
    private double kwmeng;
    private String unit;

    private double msPrc;
    private String fscpRegGrade;

    private double whPrc;
    private String ordGradeCd;

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
     * @return the lgOrt
     */
    public String getLgOrt() {
        return lgOrt;
    }

    /**
     * @param lgOrt the lgOrt to set
     */
    public void setLgOrt(String lgOrt) {
        this.lgOrt = lgOrt;
    }

    /**
     * @return the kwmeng
     */
    public double getKwmeng() {
        return kwmeng;
    }

    /**
     * @param kwmeng the kwmeng to set
     */
    public void setKwmeng(double kwmeng) {
        this.kwmeng = kwmeng;
    }

    /**
     * @return the unit
     */
    public String getUnit() {
        return unit;
    }

    /**
     * @param unit the unit to set
     */
    public void setUnit(String unit) {
        this.unit = unit;
    }

    /**
     * @return the msPrc
     */
    public double getMsPrc() {
        return msPrc;
    }

    /**
     * @param msPrc the msPrc to set
     */
    public void setMsPrc(double msPrc) {
        this.msPrc = msPrc;
    }

    /**
     * @return the fscpRegGrade
     */
    public String getFscpRegGrade() {
        return fscpRegGrade;
    }

    /**
     * @param fscpRegGrade the fscpRegGrade to set
     */
    public void setFscpRegGrade(String fscpRegGrade) {
        this.fscpRegGrade = fscpRegGrade;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    /**
     * @return the whPrc
     */
    public double getWhPrc() {
        return whPrc;
    }

    /**
     * @param whPrc the whPrc to set
     */
    public void setWhPrc(double whPrc) {
        this.whPrc = whPrc;
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
}
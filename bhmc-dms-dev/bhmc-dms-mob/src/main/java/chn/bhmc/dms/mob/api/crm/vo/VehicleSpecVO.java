package chn.bhmc.dms.mob.api.crm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleSpecVO.java
 * @Description : 차량스펙콤보용데이터를 가져온다.
 * @author Lee Seungmin
 * @since 2017. 4. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 4. 15.     Lee Seungmin     최초 생성
 * </pre>
 */

public class VehicleSpecVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7533166702132573274L;

    private String carlineCd;
    private String carlineNm;
    private String carlineNmNc;
    private String carlineEnNm;
    private String fscNm;
    private String fscCd;
    private String ocnNm;
    private String ocnCd;
    private String modelCd;
    private int    modelCnt;
    private String extColorCd;
    private String extColorNm;
    private String extColorNmNc;
    private String intColorCd;
    private String intColorNm;
    private String intColorNmNc;
    private Double whPrc;
    private Double msPrc;
    
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
     * @return the carlineNmNc
     */
    public String getCarlineNmNc() {
        return carlineNmNc;
    }
    /**
     * @param carlineNmNc the carlineNmNc to set
     */
    public void setCarlineNmNc(String carlineNmNc) {
        this.carlineNmNc = carlineNmNc;
    }
    /**
     * @return the carlineEnNm
     */
    public String getCarlineEnNm() {
        return carlineEnNm;
    }
    /**
     * @param carlineEnNm the carlineEnNm to set
     */
    public void setCarlineEnNm(String carlineEnNm) {
        this.carlineEnNm = carlineEnNm;
    }
    /**
     * @return the fscNm
     */
    public String getFscNm() {
        return fscNm;
    }
    /**
     * @param fscNm the fscNm to set
     */
    public void setFscNm(String fscNm) {
        this.fscNm = fscNm;
    }
    /**
     * @return the fscCd
     */
    public String getFscCd() {
        return fscCd;
    }
    /**
     * @param fscCd the fscCd to set
     */
    public void setFscCd(String fscCd) {
        this.fscCd = fscCd;
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
     * @return the modelCnt
     */
    public int getModelCnt() {
        return modelCnt;
    }
    /**
     * @param modelCnt the modelCnt to set
     */
    public void setModelCnt(int modelCnt) {
        this.modelCnt = modelCnt;
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
     * @return the extColorNmNc
     */
    public String getExtColorNmNc() {
        return extColorNmNc;
    }
    /**
     * @param extColorNmNc the extColorNmNc to set
     */
    public void setExtColorNmNc(String extColorNmNc) {
        this.extColorNmNc = extColorNmNc;
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
     * @return the intColorNmNc
     */
    public String getIntColorNmNc() {
        return intColorNmNc;
    }
    /**
     * @param intColorNmNc the intColorNmNc to set
     */
    public void setIntColorNmNc(String intColorNmNc) {
        this.intColorNmNc = intColorNmNc;
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
     * @return the whPrc
     */
    public Double getWhPrc() {
        return whPrc;
    }
    /**
     * @param whPrc the whPrc to set
     */
    public void setWhPrc(Double whPrc) {
        this.whPrc = whPrc;
    }
    /**
     * @return the msPrc
     */
    public Double getMsPrc() {
        return msPrc;
    }
    /**
     * @param msPrc the msPrc to set
     */
    public void setMsPrc(Double msPrc) {
        this.msPrc = msPrc;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
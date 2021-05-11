package chn.bhmc.dms.sal.veh.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleMasterIfVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2016. 9. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 26.     Lee Seungmin     최초 생성
 * </pre>
 */

public class VehicleMasterWSIfVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7252385778858894998L;

    @JsonProperty("CAR_ID")
    private String carId;

    @JsonProperty("VIN_NO")
    private String vinNo;

    @JsonProperty("CARLINE_CD")
    private String carlineCd;

    @JsonProperty("CARLINE_NM")
    private String carlineNm;

    @JsonProperty("CARLINE_CD_NM")
    private String carlineCdNm;

    @JsonProperty("MODEL_CD")
    private String modelCd;

    @JsonProperty("MODEL_NM")
    private String modelNm;

    @JsonProperty("MODEL_CD_NM")
    private String modelCdNm;

    @JsonProperty("OCN_CD")
    private String ocnCd;

    @JsonProperty("OCN_NM")
    private String ocnNm;

    @JsonProperty("OCN_CD_NM")
    private String ocnCdNm;

    @JsonProperty("EXT_COLOR_CD")
    private String extColorCd;

    @JsonProperty("EXT_COLOR_CD_NM")
    private String extColorCdNm;

    @JsonProperty("EXT_COLOR_NM")
    private String extColorNm;

    @JsonProperty("INT_COLOR_CD")
    private String intColorCd;

    @JsonProperty("INT_COLOR_NM")
    private String intColorNm;

    @JsonProperty("INT_COLOR_CD_NM")
    private String intColorCdNm;

    @JsonProperty("WH_PRC")
    private String whPrc;

    @JsonProperty("USE_YN")
    private String useYn;


    @JsonProperty("TEMP1")
    private String temp1;

    @JsonProperty("TEMP2")
    private String temp2;

    @JsonProperty("TEMP3")
    private String temp3;

    @JsonProperty("TEMP4")
    private String temp4;

    @JsonProperty("TEMP5")
    private String temp5;

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
     * @return the carlineCdNm
     */
    public String getCarlineCdNm() {
        return carlineCdNm;
    }

    /**
     * @param carlineCdNm the carlineCdNm to set
     */
    public void setCarlineCdNm(String carlineCdNm) {
        this.carlineCdNm = carlineCdNm;
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
     * @return the modelCdNm
     */
    public String getModelCdNm() {
        return modelCdNm;
    }

    /**
     * @param modelCdNm the modelCdNm to set
     */
    public void setModelCdNm(String modelCdNm) {
        this.modelCdNm = modelCdNm;
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
     * @return the ocnCdNm
     */
    public String getOcnCdNm() {
        return ocnCdNm;
    }

    /**
     * @param ocnCdNm the ocnCdNm to set
     */
    public void setOcnCdNm(String ocnCdNm) {
        this.ocnCdNm = ocnCdNm;
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
     * @return the extColorCdNm
     */
    public String getExtColorCdNm() {
        return extColorCdNm;
    }

    /**
     * @param extColorCdNm the extColorCdNm to set
     */
    public void setExtColorCdNm(String extColorCdNm) {
        this.extColorCdNm = extColorCdNm;
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
     * @return the intColorCdNm
     */
    public String getIntColorCdNm() {
        return intColorCdNm;
    }

    /**
     * @param intColorCdNm the intColorCdNm to set
     */
    public void setIntColorCdNm(String intColorCdNm) {
        this.intColorCdNm = intColorCdNm;
    }

    /**
     * @return the whPrc
     */
    public String getWhPrc() {
        return whPrc;
    }

    /**
     * @param whPrc the whPrc to set
     */
    public void setWhPrc(String whPrc) {
        this.whPrc = whPrc;
    }

    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }

    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    /**
     * @return the temp1
     */
    public String getTemp1() {
        return temp1;
    }

    /**
     * @param temp1 the temp1 to set
     */
    public void setTemp1(String temp1) {
        this.temp1 = temp1;
    }

    /**
     * @return the temp2
     */
    public String getTemp2() {
        return temp2;
    }

    /**
     * @param temp2 the temp2 to set
     */
    public void setTemp2(String temp2) {
        this.temp2 = temp2;
    }

    /**
     * @return the temp3
     */
    public String getTemp3() {
        return temp3;
    }

    /**
     * @param temp3 the temp3 to set
     */
    public void setTemp3(String temp3) {
        this.temp3 = temp3;
    }

    /**
     * @return the temp4
     */
    public String getTemp4() {
        return temp4;
    }

    /**
     * @param temp4 the temp4 to set
     */
    public void setTemp4(String temp4) {
        this.temp4 = temp4;
    }

    /**
     * @return the temp5
     */
    public String getTemp5() {
        return temp5;
    }

    /**
     * @param temp5 the temp5 to set
     */
    public void setTemp5(String temp5) {
        this.temp5 = temp5;
    }



}
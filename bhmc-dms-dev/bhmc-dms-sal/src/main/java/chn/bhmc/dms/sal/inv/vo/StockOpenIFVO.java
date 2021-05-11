 package chn.bhmc.dms.sal.inv.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * @ClassName   : StockOpenIFVO
 * @Description : 공개재고 IF VO
 * @author Jin Suk Kim
 * @since 2016. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 24.     Jin Suk Kim           최초 생성
 * </pre>
 */

public class StockOpenIFVO extends BaseVO{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 388572520261920998L;

    @JsonProperty("CARLINE_CD")
    private String carlineCd;

    @JsonProperty("CARLINE_NM")
    private String carlineNm;

    @JsonProperty("MODEL_CD")
    private String modelCd;

    @JsonProperty("MODEL_NM")
    private String modelNm;

    @JsonProperty("OCN_CD")
    private String ocnCd;

    @JsonProperty("OCN_NM")
    private String ocnNm;

    @JsonProperty("EXT_COLOR_CD")
    private String extColorCd;

    @JsonProperty("EXT_COLOR_NM")
    private String extColorNm;

    @JsonProperty("INT_COLOR_CD")
    private String intColorCd;

    @JsonProperty("INT_COLOR_NM")
    private String intColorNm;

    @JsonProperty("CAR_ID")
    private String carId;

    @JsonProperty("VIN_NO")
    private String vinNo;

    @JsonProperty("DLR_CD")
    private String dlrCd;

    @JsonProperty("DLR_NM")
    private String dlrNm;

    @JsonProperty("SUNG_CD")
    private String sungCd;

    @JsonProperty("SUNG_NM")
    private String sungNm;

    @JsonProperty("CITY_CD")
    private String cityCd;

    @JsonProperty("CITY_NM")
    private String cityNm;

    @JsonProperty("ORD_TP")
    private String ordTp;

    @JsonProperty("ORD_TP_NM")
    private String ordTpNm;

    @JsonProperty("SALE_EMP_NO")
    private String saleEmpNo;

    @JsonProperty("SALE_EMP_NM")
    private String saleEmpNm;

    @JsonProperty("SALE_EMP_TEL")
    private String saleEmpTel;
    
    @JsonProperty("SALE_EMP_HP")
    private String saleEmpHp;
    
    @JsonProperty("UPDT_USR_ID")
    private String updtUsrId;

    @JsonProperty("UPDT_STR_DT")
    private String updtStrDt;
    
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
     * @return the sungCd
     */
    public String getSungCd() {
        return sungCd;
    }

    /**
     * @param sungCd the sungCd to set
     */
    public void setSungCd(String sungCd) {
        this.sungCd = sungCd;
    }

    /**
     * @return the sungNm
     */
    public String getSungNm() {
        return sungNm;
    }

    /**
     * @param sungNm the sungNm to set
     */
    public void setSungNm(String sungNm) {
        this.sungNm = sungNm;
    }

    /**
     * @return the cityCd
     */
    public String getCityCd() {
        return cityCd;
    }

    /**
     * @param cityCd the cityCd to set
     */
    public void setCityCd(String cityCd) {
        this.cityCd = cityCd;
    }

    /**
     * @return the cityNm
     */
    public String getCityNm() {
        return cityNm;
    }

    /**
     * @param cityNm the cityNm to set
     */
    public void setCityNm(String cityNm) {
        this.cityNm = cityNm;
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
     * @return the ordTpNm
     */
    public String getOrdTpNm() {
        return ordTpNm;
    }

    /**
     * @param ordTpNm the ordTpNm to set
     */
    public void setOrdTpNm(String ordTpNm) {
        this.ordTpNm = ordTpNm;
    }

    /**
     * @return the saleEmpNo
     */
    public String getSaleEmpNo() {
        return saleEmpNo;
    }

    /**
     * @param saleEmpNo the saleEmpNo to set
     */
    public void setSaleEmpNo(String saleEmpNo) {
        this.saleEmpNo = saleEmpNo;
    }

    /**
     * @return the saleEmpNm
     */
    public String getSaleEmpNm() {
        return saleEmpNm;
    }

    /**
     * @param saleEmpNm the saleEmpNm to set
     */
    public void setSaleEmpNm(String saleEmpNm) {
        this.saleEmpNm = saleEmpNm;
    }
    
    /**
     * @return the saleEmpTel
     */
    public String getSaleEmpTel() {
        return saleEmpTel;
    }

    /**
     * @param saleEmpTel the saleEmpTel to set
     */
    public void setSaleEmpTel(String saleEmpTel) {
        this.saleEmpTel = saleEmpTel;
    }

    /**
     * @return the saleEmpHp
     */
    public String getSaleEmpHp() {
        return saleEmpHp;
    }

    /**
     * @param saleEmpHp the saleEmpHp to set
     */
    public void setSaleEmpHp(String saleEmpHp) {
        this.saleEmpHp = saleEmpHp;
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
     * @return the updtStrDt
     */
    public String getUpdtStrDt() {
        return updtStrDt;
    }

    /**
     * @param updtStrDt the updtStrDt to set
     */
    public void setUpdtStrDt(String updtStrDt) {
        this.updtStrDt = updtStrDt;
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
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }


}
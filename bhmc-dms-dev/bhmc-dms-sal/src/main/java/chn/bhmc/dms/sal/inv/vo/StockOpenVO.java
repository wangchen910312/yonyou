 package chn.bhmc.dms.sal.inv.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * @ClassName   : StockOpenVO
 * @Description : 공개재고 VO
 * @author Jin Suk Kim
 * @since 2016. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 24.     Jin Suk Kim     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"        , mesgKey="sal.lbl.dlrCd")
   })
public class StockOpenVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6028474492787544740L;

    /* 전략출고팝업 조회 */
    private String sdptNm;
    private String distOfficeNm;
    private String sungNm;
    private String cityNm;
    private String dlrCd;
    private String dlrNm;

    /* 공개재고 저장 */
    private String carId;
    private String vinNo;
    private String openYn;

    /* 공개재고관리 조회 */
    private String dlrCds;
    private String dlrNms;
    private String sungCd;
    private String cityCd;
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
    private String ordTpNm;
    private String saleEmpNo;
    private String saleEmpNm;
    private String saleEmpTel;
    private String saleEmpHp;
    private String updtUsrId;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDtFormat;
    
    /**
     * @return the sdptNm
     */
    public String getSdptNm() {
        return sdptNm;
    }
    /**
     * @param sdptNm the sdptNm to set
     */
    public void setSdptNm(String sdptNm) {
        this.sdptNm = sdptNm;
    }
    /**
     * @return the distOfficeNm
     */
    public String getDistOfficeNm() {
        return distOfficeNm;
    }
    /**
     * @param distOfficeNm the distOfficeNm to set
     */
    public void setDistOfficeNm(String distOfficeNm) {
        this.distOfficeNm = distOfficeNm;
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
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }
    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
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
     * @return the openYn
     */
    public String getOpenYn() {
        return openYn;
    }
    /**
     * @param openYn the openYn to set
     */
    public void setOpenYn(String openYn) {
        this.openYn = openYn;
    }
    /**
     * @return the dlrCds
     */
    public String getDlrCds() {
        return dlrCds;
    }
    /**
     * @param dlrCds the dlrCds to set
     */
    public void setDlrCds(String dlrCds) {
        this.dlrCds = dlrCds;
    }
    /**
     * @return the dlrNms
     */
    public String getDlrNms() {
        return dlrNms;
    }
    /**
     * @param dlrNms the dlrNms to set
     */
    public void setDlrNms(String dlrNms) {
        this.dlrNms = dlrNms;
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
     * @return the updtDtFormat
     */
    public Date getUpdtDtFormat() {
        return updtDtFormat;
    }
    /**
     * @param updtDtFormat the updtDtFormat to set
     */
    public void setUpdtDtFormat(Date updtDtFormat) {
        this.updtDtFormat = updtDtFormat;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
package chn.bhmc.dms.sal.cnt.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * @ClassName   : ContractBeforeItemVO
 * @Description : 전략출고(선출고관리) 아이템 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 5. 26.    Kim Jin Suk           최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="sal.lbl.dlrCd")
   })
public class ContractBeforeItemVO extends BaseVO{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6614337163497351274L;

    private String carId;
    private String chkYn;
    private String vinNo;
    private long mmCnt;
    private long retlPrc;
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
    private String strgeCd;
    private String locCd;
    private String carStatCd;
    private String ownStatCd;
    private String ordTp;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date grDt;
    private String preGiYn;
    private String rfidNo;

    private String dlrCd;
    private String beContractNo;

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
     * @return the chkYn
     */
    public String getChkYn() {
        return chkYn;
    }
    /**
     * @param chkYn the chkYn to set
     */
    public void setChkYn(String chkYn) {
        this.chkYn = chkYn;
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
     * @return the mmCnt
     */
    public long getMmCnt() {
        return mmCnt;
    }
    /**
     * @param mmCnt the mmCnt to set
     */
    public void setMmCnt(long mmCnt) {
        this.mmCnt = mmCnt;
    }
    /**
     * @return the retlPrc
     */
    public long getRetlPrc() {
        return retlPrc;
    }
    /**
     * @param retlPrc the retlPrc to set
     */
    public void setRetlPrc(long retlPrc) {
        this.retlPrc = retlPrc;
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
     * @return the strgeCd
     */
    public String getStrgeCd() {
        return strgeCd;
    }
    /**
     * @param strgeCd the strgeCd to set
     */
    public void setStrgeCd(String strgeCd) {
        this.strgeCd = strgeCd;
    }
    /**
     * @return the locCd
     */
    public String getLocCd() {
        return locCd;
    }
    /**
     * @param locCd the locCd to set
     */
    public void setLocCd(String locCd) {
        this.locCd = locCd;
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
     * @return the ownStatCd
     */
    public String getOwnStatCd() {
        return ownStatCd;
    }
    /**
     * @param ownStatCd the ownStatCd to set
     */
    public void setOwnStatCd(String ownStatCd) {
        this.ownStatCd = ownStatCd;
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
     * @return the preGiYn
     */
    public String getPreGiYn() {
        return preGiYn;
    }
    /**
     * @param preGiYn the preGiYn to set
     */
    public void setPreGiYn(String preGiYn) {
        this.preGiYn = preGiYn;
    }
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
     * @return the beContractNo
     */
    public String getBeContractNo() {
        return beContractNo;
    }
    /**
     * @param beContractNo the beContractNo to set
     */
    public void setBeContractNo(String beContractNo) {
        this.beContractNo = beContractNo;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}

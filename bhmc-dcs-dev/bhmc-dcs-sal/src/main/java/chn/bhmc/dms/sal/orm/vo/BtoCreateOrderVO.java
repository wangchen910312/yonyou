package chn.bhmc.dms.sal.orm.vo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

@ValidDescriptor({
     @ValidField(field="carlineCd", mesgKey="global.lbl.carLine")
    ,@ValidField(field="modelCd", mesgKey="global.lbl.model")
    ,@ValidField(field="ocnCd", mesgKey="global.lbl.ocn")
    ,@ValidField(field="extColorCd", mesgKey="global.lbl.extColor")
    ,@ValidField(field="intColorCd", mesgKey="global.lbl.intColor")
})

public class BtoCreateOrderVO implements Serializable {

	private static final long serialVersionUID = -6091261787809835772L;

	private String dlrCd;
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
    private int ordQty;
    private String ordGradeCd;
    private String ordProrCd;
    private String trsfDlrCd;
    private String ordStatCd;
    private String trsfDlrNm;
    private String ordStatNm;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date ordDt;
    private String pfpExamDt;

    private String regUsrId;
    private String regUsrNm;
    private String updtUsrId;
    private String updtUsrNm;


    private String erpTargYn;
    private String erpSendYn;

    private String saleRgstId;       // 판매고문
    private String ifresultRtn;      // ERP전송여부
    private String remark;

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
     * @return the ordQty
     */
    public int getOrdQty() {
        return ordQty;
    }
    /**
     * @param ordQty the ordQty to set
     */
    public void setOrdQty(int ordQty) {
        this.ordQty = ordQty;
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
     * @return the ordProrCd
     */
    public String getOrdProrCd() {
        return ordProrCd;
    }
    /**
     * @param ordProrCd the ordProrCd to set
     */
    public void setOrdProrCd(String ordProrCd) {
        this.ordProrCd = ordProrCd;
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
     * @return the ordStatNm
     */
    public String getOrdStatNm() {
        return ordStatNm;
    }
    /**
     * @param ordStatNm the ordStatNm to set
     */
    public void setOrdStatNm(String ordStatNm) {
        this.ordStatNm = ordStatNm;
    }
    /**
     * @return the ordDt
     */
    public Date getOrdDt() {
        return ordDt;
    }
    /**
     * @param ordDt the ordDt to set
     */
    public void setOrdDt(Date ordDt) {
        this.ordDt = ordDt;
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
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }
    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }
    /**
     * @return the regUsrNm
     */
    public String getRegUsrNm() {
        return regUsrNm;
    }
    /**
     * @param regUsrNm the regUsrNm to set
     */
    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
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
     * @return the erpTargYn
     */
    public String getErpTargYn() {
        return erpTargYn;
    }
    /**
     * @param erpTargYn the erpTargYn to set
     */
    public void setErpTargYn(String erpTargYn) {
        this.erpTargYn = erpTargYn;
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
     * @return the saleRgstId
     */
    public String getSaleRgstId() {
        return saleRgstId;
    }
    /**
     * @param saleRgstId the saleRgstId to set
     */
    public void setSaleRgstId(String saleRgstId) {
        this.saleRgstId = saleRgstId;
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
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }
    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}


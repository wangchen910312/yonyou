package chn.bhmc.dms.sal.orm.vo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
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

public class MaintainOrderQueryResultsVO  extends BaseSearchVO implements Serializable {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6000792922178141370L;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sysDt;               //시스템 일자(년월)

	private String dlrCd;             //딜러코드
	@JsonDeserialize(using=JsonDateDeserializer.class)
    private Date ptyOrdYyMmDt;      //위약오더 년월일자
	private String ptyOrdWkcntCd;     //위약오더 주차코드
    private String ptyOrdSerialNo;    //위약오더 시리얼번호
    private String ptyOrdSeq;         //위약오더 일련번호
    private String carlineCd;         //차종
    private String modelCd;           //모델
    private String ocnCd;             //OCN
    private String extColorCd;        //외장색
    private String intColorCd;        //내장색
    private String carlineNm;
    private String modelNm;
    private String ocnNm;
    private String extColorNm;
    private String intColorNm;
    private String ordNo;             //주문번호
    private String salesNo;           //판매주문번호
    private String ptyOrdStatCd;      //위약오더 상태코드
    private String stockCauCd;        //책임구분(재고 원인코드)
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date erpReqDt;            //ERP 요청일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date erpProcDt;           //ERP 처리일자
    private String ptyOrdTp;          //위약오더 유형

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date ordDt;               //주문일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date pfpDt;               //납기일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date chgPfpDt;            //변경납기일자
    private double ptyAmt;            //위약금액
    private String ptyOrdGradeTp;     //위약오더 등급유형
    private String erpSendYn;         //ERP 전송여부 (연장취소 여부)
    private String chgErpSendYn;      //ERP 전송여부 (연장취소 여부)
    private String causesCd;          //발생원인

    private String regUsrId;
    private String regUsrNm;
    private String updtUsrId;
    private String updtUsrNm;
    private String ptyOrdYyMmDtStr;
    private String erpProcDtStr;

    /**
     * @return the sysDt
     */
    public Date getSysDt() {
        return sysDt;
    }
    /**
     * @param sysDt the sysDt to set
     */
    public void setSysDt(Date sysDt) {
        this.sysDt = sysDt;
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
     * @return the ptyOrdYyMmDt
     */
    public Date getPtyOrdYyMmDt() {
        return ptyOrdYyMmDt;
    }
    /**
     * @param ptyOrdYyMmDt the ptyOrdYyMmDt to set
     */
    public void setPtyOrdYyMmDt(Date ptyOrdYyMmDt) {
        this.ptyOrdYyMmDt = ptyOrdYyMmDt;
    }
    /**
     * @return the ptyOrdWkcntCd
     */
    public String getPtyOrdWkcntCd() {
        return ptyOrdWkcntCd;
    }
    /**
     * @param ptyOrdWkcntCd the ptyOrdWkcntCd to set
     */
    public void setPtyOrdWkcntCd(String ptyOrdWkcntCd) {
        this.ptyOrdWkcntCd = ptyOrdWkcntCd;
    }
    /**
     * @return the ptyOrdSerialNo
     */
    public String getPtyOrdSerialNo() {
        return ptyOrdSerialNo;
    }
    /**
     * @param ptyOrdSerialNo the ptyOrdSerialNo to set
     */
    public void setPtyOrdSerialNo(String ptyOrdSerialNo) {
        this.ptyOrdSerialNo = ptyOrdSerialNo;
    }
    /**
     * @return the ptyOrdSeq
     */
    public String getPtyOrdSeq() {
        return ptyOrdSeq;
    }
    /**
     * @param ptyOrdSeq the ptyOrdSeq to set
     */
    public void setPtyOrdSeq(String ptyOrdSeq) {
        this.ptyOrdSeq = ptyOrdSeq;
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
    /**
     * @return the ptyOrdStatCd
     */
    public String getPtyOrdStatCd() {
        return ptyOrdStatCd;
    }
    /**
     * @param ptyOrdStatCd the ptyOrdStatCd to set
     */
    public void setPtyOrdStatCd(String ptyOrdStatCd) {
        this.ptyOrdStatCd = ptyOrdStatCd;
    }
    /**
     * @return the stockCauCd
     */
    public String getStockCauCd() {
        return stockCauCd;
    }
    /**
     * @param stockCauCd the stockCauCd to set
     */
    public void setStockCauCd(String stockCauCd) {
        this.stockCauCd = stockCauCd;
    }
    /**
     * @return the erpReqDt
     */
    public Date getErpReqDt() {
        return erpReqDt;
    }
    /**
     * @param erpReqDt the erpReqDt to set
     */
    public void setErpReqDt(Date erpReqDt) {
        this.erpReqDt = erpReqDt;
    }
    /**
     * @return the erpProcDt
     */
    public Date getErpProcDt() {
        return erpProcDt;
    }
    /**
     * @param erpProcDt the erpProcDt to set
     */
    public void setErpProcDt(Date erpProcDt) {
        this.erpProcDt = erpProcDt;
    }
    /**
     * @return the ptyOrdTp
     */
    public String getPtyOrdTp() {
        return ptyOrdTp;
    }
    /**
     * @param ptyOrdTp the ptyOrdTp to set
     */
    public void setPtyOrdTp(String ptyOrdTp) {
        this.ptyOrdTp = ptyOrdTp;
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
     * @return the pfpDt
     */
    public Date getPfpDt() {
        return pfpDt;
    }
    /**
     * @param pfpDt the pfpDt to set
     */
    public void setPfpDt(Date pfpDt) {
        this.pfpDt = pfpDt;
    }
    /**
     * @return the chgPfpDt
     */
    public Date getChgPfpDt() {
        return chgPfpDt;
    }
    /**
     * @param chgPfpDt the chgPfpDt to set
     */
    public void setChgPfpDt(Date chgPfpDt) {
        this.chgPfpDt = chgPfpDt;
    }
    /**
     * @return the ptyAmt
     */
    public double getPtyAmt() {
        return ptyAmt;
    }
    /**
     * @param ptyAmt the ptyAmt to set
     */
    public void setPtyAmt(double ptyAmt) {
        this.ptyAmt = ptyAmt;
    }
    /**
     * @return the ptyOrdGradeTp
     */
    public String getPtyOrdGradeTp() {
        return ptyOrdGradeTp;
    }
    /**
     * @param ptyOrdGradeTp the ptyOrdGradeTp to set
     */
    public void setPtyOrdGradeTp(String ptyOrdGradeTp) {
        this.ptyOrdGradeTp = ptyOrdGradeTp;
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
     * @return the chgErpSendYn
     */
    public String getChgErpSendYn() {
        return chgErpSendYn;
    }
    /**
     * @param chgErpSendYn the chgErpSendYn to set
     */
    public void setChgErpSendYn(String chgErpSendYn) {
        this.chgErpSendYn = chgErpSendYn;
    }


    /**
     * @return the causesCd
     */
    public String getCausesCd() {
        return causesCd;
    }
    /**
     * @param causesCd the causesCd to set
     */
    public void setCausesCd(String causesCd) {
        this.causesCd = causesCd;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the ptyOrdYyMmDtStr
     */
    public String getPtyOrdYyMmDtStr() {
        return ptyOrdYyMmDtStr;
    }
    /**
     * @param ptyOrdYyMmDtStr the ptyOrdYyMmDtStr to set
     */
    public void setPtyOrdYyMmDtStr(String ptyOrdYyMmDtStr) {
        this.ptyOrdYyMmDtStr = ptyOrdYyMmDtStr;
    }
    /**
     * @return the erpProcDtStr
     */
    public String getErpProcDtStr() {
        return erpProcDtStr;
    }
    /**
     * @param erpProcDtStr the erpProcDtStr to set
     */
    public void setErpProcDtStr(String erpProcDtStr) {
        this.erpProcDtStr = erpProcDtStr;
    }




}


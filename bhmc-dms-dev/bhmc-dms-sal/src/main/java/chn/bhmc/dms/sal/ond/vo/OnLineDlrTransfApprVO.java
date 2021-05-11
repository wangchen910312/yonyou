package chn.bhmc.dms.sal.ond.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OnLineDlrTransfReqVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungin
 * @since 2017. 03. 04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 03. 04.     Lee Seungmin             최초 생성
 *
 * </pre>
 */

public class OnLineDlrTransfApprVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7341860318942838084L;

    private String dlrCd;
    private String usrId;
    private int reqNo;
    private String reqDt;
    private String is4sYn;
    private String shipToDlrCd;
    private String shipToDlrNm;
    private String shipToAddr;
    private String shipToProv;
    private String shipToCity;
    private String shipToProvCd;
    private String shipToCityCd;
    private String shipToRecv;
    private String shipToIdno;
    private String shipToRecvTel;
    private String fileDocNo;
    private int fileNo;
    private String shipToAdocNo;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date evalDt;
    private String evalRsltCd;
    private String pevalId;
    private String pevalName;
    private String regUsrId;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;
    private String updtUsrId;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;
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
    private String useYn;
    private String selfYn;
    private String reptToDlrCd;
    private String reptToDlrNm;
    private String reptToAddr;
    private String reptToProv;
    private String reptToCity;
    private String reptToProvCd;
    private String reptToCityCd;
    private String reptToRecv;
    private String reptToIdno;
    private String reptToRecvTel;
    private int reqQty;
    private String dlrNm;
    private String fscpRegGrade;
    private String viewReqNo;

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
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }
    /**
     * @return the reqNo
     */
    public int getReqNo() {
        return reqNo;
    }
    /**
     * @return the reqDt
     */
    public String getReqDt() {
        return reqDt;
    }
    /**
     * @return the is4sYn
     */
    public String getIs4sYn() {
        return is4sYn;
    }
    /**
     * @return the shipToDlrCd
     */
    public String getShipToDlrCd() {
        return shipToDlrCd;
    }
    /**
     * @return the shipToAddr
     */
    public String getShipToAddr() {
        return shipToAddr;
    }
    /**
     * @return the shipToProv
     */
    public String getShipToProv() {
        return shipToProv;
    }
    /**
     * @return the shipToCity
     */
    public String getShipToCity() {
        return shipToCity;
    }
    /**
     * @return the shipToRecv
     */
    public String getShipToRecv() {
        return shipToRecv;
    }
    /**
     * @return the shipToIdno
     */
    public String getShipToIdno() {
        return shipToIdno;
    }
    /**
     * @return the shipToRecvTel
     */
    public String getShipToRecvTel() {
        return shipToRecvTel;
    }
    /**
     * @return the fileDocNo
     */
    public String getFileDocNo() {
        return fileDocNo;
    }
    /**
     * @return the fileNo
     */
    public int getFileNo() {
        return fileNo;
    }
    /**
     * @return the shipToAdocNo
     */
    public String getShipToAdocNo() {
        return shipToAdocNo;
    }
    /**
     * @return the evalDt
     */
    public Date getEvalDt() {
        return evalDt;
    }
    /**
     * @return the evalRsltCd
     */
    public String getEvalRsltCd() {
        return evalRsltCd;
    }
    /**
     * @return the pevalId
     */
    public String getPevalId() {
        return pevalId;
    }
    /**
     * @return the pevalName
     */
    public String getPevalName() {
        return pevalName;
    }
    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }
    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }
    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }
    /**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }
    /**
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }
    /**
     * @return the ocnCd
     */
    public String getOcnCd() {
        return ocnCd;
    }
    /**
     * @return the extColorCd
     */
    public String getExtColorCd() {
        return extColorCd;
    }
    /**
     * @return the intColorCd
     */
    public String getIntColorCd() {
        return intColorCd;
    }
    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }
    /**
     * @return the selfYn
     */
    public String getSelfYn() {
        return selfYn;
    }
    /**
     * @return the reptToDlrCd
     */
    public String getReptToDlrCd() {
        return reptToDlrCd;
    }
    /**
     * @return the reptToAddr
     */
    public String getReptToAddr() {
        return reptToAddr;
    }
    /**
     * @return the reptToProv
     */
    public String getReptToProv() {
        return reptToProv;
    }
    /**
     * @return the reptToCity
     */
    public String getReptToCity() {
        return reptToCity;
    }
    /**
     * @return the reptToRecv
     */
    public String getReptToRecv() {
        return reptToRecv;
    }
    /**
     * @return the reptToIdno
     */
    public String getReptToIdno() {
        return reptToIdno;
    }
    /**
     * @return the reptToRecvTel
     */
    public String getReptToRecvTel() {
        return reptToRecvTel;
    }
    /**
     * @return the reqQty
     */
    public int getReqQty() {
        return reqQty;
    }
    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }
    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }
    /**
     * @param reqNo the reqNo to set
     */
    public void setReqNo(int reqNo) {
        this.reqNo = reqNo;
    }
    /**
     * @param reqDt the reqDt to set
     */
    public void setReqDt(String reqDt) {
        this.reqDt = reqDt;
    }
    /**
     * @param is4sYn the is4sYn to set
     */
    public void setIs4sYn(String is4sYn) {
        this.is4sYn = is4sYn;
    }
    /**
     * @param shipToDlrCd the shipToDlrCd to set
     */
    public void setShipToDlrCd(String shipToDlrCd) {
        this.shipToDlrCd = shipToDlrCd;
    }
    /**
     * @param shipToAddr the shipToAddr to set
     */
    public void setShipToAddr(String shipToAddr) {
        this.shipToAddr = shipToAddr;
    }
    /**
     * @param shipToProv the shipToProv to set
     */
    public void setShipToProv(String shipToProv) {
        this.shipToProv = shipToProv;
    }
    /**
     * @param shipToCity the shipToCity to set
     */
    public void setShipToCity(String shipToCity) {
        this.shipToCity = shipToCity;
    }
    /**
     * @param shipToRecv the shipToRecv to set
     */
    public void setShipToRecv(String shipToRecv) {
        this.shipToRecv = shipToRecv;
    }
    /**
     * @param shipToIdno the shipToIdno to set
     */
    public void setShipToIdno(String shipToIdno) {
        this.shipToIdno = shipToIdno;
    }
    /**
     * @param shipToRecvTel the shipToRecvTel to set
     */
    public void setShipToRecvTel(String shipToRecvTel) {
        this.shipToRecvTel = shipToRecvTel;
    }
    /**
     * @param fileDocNo the fileDocNo to set
     */
    public void setFileDocNo(String fileDocNo) {
        this.fileDocNo = fileDocNo;
    }
    /**
     * @param fileNo the fileNo to set
     */
    public void setFileNo(int fileNo) {
        this.fileNo = fileNo;
    }
    /**
     * @param shipToAdocNo the shipToAdocNo to set
     */
    public void setShipToAdocNo(String shipToAdocNo) {
        this.shipToAdocNo = shipToAdocNo;
    }
    /**
     * @param evalDt the evalDt to set
     */
    public void setEvalDt(Date evalDt) {
        this.evalDt = evalDt;
    }
    /**
     * @param evalRsltCd the evalRsltCd to set
     */
    public void setEvalRsltCd(String evalRsltCd) {
        this.evalRsltCd = evalRsltCd;
    }
    /**
     * @param pevalId the pevalId to set
     */
    public void setPevalId(String pevalId) {
        this.pevalId = pevalId;
    }
    /**
     * @param pevalName the pevalName to set
     */
    public void setPevalName(String pevalName) {
        this.pevalName = pevalName;
    }
    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }
    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }
    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }
    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }
    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }
    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }
    /**
     * @param ocnCd the ocnCd to set
     */
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }
    /**
     * @param extColorCd the extColorCd to set
     */
    public void setExtColorCd(String extColorCd) {
        this.extColorCd = extColorCd;
    }
    /**
     * @param intColorCd the intColorCd to set
     */
    public void setIntColorCd(String intColorCd) {
        this.intColorCd = intColorCd;
    }
    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }
    /**
     * @param selfYn the selfYn to set
     */
    public void setSelfYn(String selfYn) {
        this.selfYn = selfYn;
    }
    /**
     * @param reptToDlrCd the reptToDlrCd to set
     */
    public void setReptToDlrCd(String reptToDlrCd) {
        this.reptToDlrCd = reptToDlrCd;
    }
    /**
     * @param reptToAddr the reptToAddr to set
     */
    public void setReptToAddr(String reptToAddr) {
        this.reptToAddr = reptToAddr;
    }
    /**
     * @param reptToProv the reptToProv to set
     */
    public void setReptToProv(String reptToProv) {
        this.reptToProv = reptToProv;
    }
    /**
     * @param reptToCity the reptToCity to set
     */
    public void setReptToCity(String reptToCity) {
        this.reptToCity = reptToCity;
    }
    /**
     * @param reptToRecv the reptToRecv to set
     */
    public void setReptToRecv(String reptToRecv) {
        this.reptToRecv = reptToRecv;
    }
    /**
     * @param reptToIdno the reptToIdno to set
     */
    public void setReptToIdno(String reptToIdno) {
        this.reptToIdno = reptToIdno;
    }
    /**
     * @param reptToRecvTel the reptToRecvTel to set
     */
    public void setReptToRecvTel(String reptToRecvTel) {
        this.reptToRecvTel = reptToRecvTel;
    }
    /**
     * @param reqQty the reqQty to set
     */
    public void setReqQty(int reqQty) {
        this.reqQty = reqQty;
    }
    /**
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }
    /**
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }
    /**
     * @return the ocnNm
     */
    public String getOcnNm() {
        return ocnNm;
    }
    /**
     * @return the extColorNm
     */
    public String getExtColorNm() {
        return extColorNm;
    }
    /**
     * @return the intColorNm
     */
    public String getIntColorNm() {
        return intColorNm;
    }
    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }
    /**
     * @param modelNm the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }
    /**
     * @param ocnNm the ocnNm to set
     */
    public void setOcnNm(String ocnNm) {
        this.ocnNm = ocnNm;
    }
    /**
     * @param extColorNm the extColorNm to set
     */
    public void setExtColorNm(String extColorNm) {
        this.extColorNm = extColorNm;
    }
    /**
     * @param intColorNm the intColorNm to set
     */
    public void setIntColorNm(String intColorNm) {
        this.intColorNm = intColorNm;
    }
    /**
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }
    /**
     * @return the fscpRegGrade
     */
    public String getFscpRegGrade() {
        return fscpRegGrade;
    }
    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }
    /**
     * @param fscpRegGrade the fscpRegGrade to set
     */
    public void setFscpRegGrade(String fscpRegGrade) {
        this.fscpRegGrade = fscpRegGrade;
    }
    /**
     * @return the viewReqNo
     */
    public String getViewReqNo() {
        return viewReqNo;
    }
    /**
     * @param viewReqNo the viewReqNo to set
     */
    public void setViewReqNo(String viewReqNo) {
        this.viewReqNo = viewReqNo;
    }
    /**
     * @return the shipToProvCd
     */
    public String getShipToProvCd() {
        return shipToProvCd;
    }
    /**
     * @return the shipToCityCd
     */
    public String getShipToCityCd() {
        return shipToCityCd;
    }
    /**
     * @param shipToProvCd the shipToProvCd to set
     */
    public void setShipToProvCd(String shipToProvCd) {
        this.shipToProvCd = shipToProvCd;
    }
    /**
     * @param shipToCityCd the shipToCityCd to set
     */
    public void setShipToCityCd(String shipToCityCd) {
        this.shipToCityCd = shipToCityCd;
    }
    /**
     * @return the reptToProvCd
     */
    public String getReptToProvCd() {
        return reptToProvCd;
    }
    /**
     * @return the reptToCityCd
     */
    public String getReptToCityCd() {
        return reptToCityCd;
    }
    /**
     * @param reptToProvCd the reptToProvCd to set
     */
    public void setReptToProvCd(String reptToProvCd) {
        this.reptToProvCd = reptToProvCd;
    }
    /**
     * @param reptToCityCd the reptToCityCd to set
     */
    public void setReptToCityCd(String reptToCityCd) {
        this.reptToCityCd = reptToCityCd;
    }
    /**
     * @return the shipToDlrNm
     */
    public String getShipToDlrNm() {
        return shipToDlrNm;
    }
    /**
     * @param shipToDlrNm the shipToDlrNm to set
     */
    public void setShipToDlrNm(String shipToDlrNm) {
        this.shipToDlrNm = shipToDlrNm;
    }
    /**
     * @return the reptToDlrNm
     */
    public String getReptToDlrNm() {
        return reptToDlrNm;
    }
    /**
     * @param reptToDlrNm the reptToDlrNm to set
     */
    public void setReptToDlrNm(String reptToDlrNm) {
        this.reptToDlrNm = reptToDlrNm;
    }
}
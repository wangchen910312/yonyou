package chn.bhmc.dms.sal.ond.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LogisticsTpAddrReqVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2017. 3. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 3.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class LogisticsTpAddrReqVO extends BaseVO {
    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -3398010558126976075L;

    private String dlrCd;
    
    private String usrId;
    
    private Integer reqNo;
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date reqDt;
    
    private String is4sYn;
    
    private String shipToDlrCd;
    
    private String shipToAddr;
    
    private String shipToProv;
    
    private String shipToCity;
    
    private String shipToRecv;
    
    private String shipToIdno;
    
    private String shipToRecvTel;
    
    private String fileDocNo;
    
    private Integer fileNo;
    
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
    
    private String dlrNm;
    
    private String eaiId;
    
    private String reqNoChar;

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getUsrId() {
        return usrId;
    }

    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }

    public Integer getReqNo() {
        return reqNo;
    }

    public void setReqNo(Integer reqNo) {
        this.reqNo = reqNo;
    }

    public Date getReqDt() {
        return reqDt;
    }

    public void setReqDt(Date reqDt) {
        this.reqDt = reqDt;
    }

    public String getIs4sYn() {
        return is4sYn;
    }

    public void setIs4sYn(String is4sYn) {
        this.is4sYn = is4sYn;
    }

    public String getShipToDlrCd() {
        return shipToDlrCd;
    }

    public void setShipToDlrCd(String shipToDlrCd) {
        this.shipToDlrCd = shipToDlrCd;
    }

    public String getShipToAddr() {
        return shipToAddr;
    }

    public void setShipToAddr(String shipToAddr) {
        this.shipToAddr = shipToAddr;
    }

    public String getShipToProv() {
        return shipToProv;
    }

    public void setShipToProv(String shipToProv) {
        this.shipToProv = shipToProv;
    }

    public String getShipToCity() {
        return shipToCity;
    }

    public void setShipToCity(String shipToCity) {
        this.shipToCity = shipToCity;
    }

    public String getShipToRecv() {
        return shipToRecv;
    }

    public void setShipToRecv(String shipToRecv) {
        this.shipToRecv = shipToRecv;
    }

    public String getShipToIdno() {
        return shipToIdno;
    }

    public void setShipToIdno(String shipToIdno) {
        this.shipToIdno = shipToIdno;
    }

    public String getShipToRecvTel() {
        return shipToRecvTel;
    }

    public void setShipToRecvTel(String shipToRecvTel) {
        this.shipToRecvTel = shipToRecvTel;
    }

    public String getFileDocNo() {
        return fileDocNo;
    }

    public void setFileDocNo(String fileDocNo) {
        this.fileDocNo = fileDocNo;
    }

    public Integer getFileNo() {
        return fileNo;
    }

    public void setFileNo(Integer fileNo) {
        this.fileNo = fileNo;
    }

    public String getShipToAdocNo() {
        return shipToAdocNo;
    }

    public void setShipToAdocNo(String shipToAdocNo) {
        this.shipToAdocNo = shipToAdocNo;
    }

    public Date getEvalDt() {
        return evalDt;
    }

    public void setEvalDt(Date evalDt) {
        this.evalDt = evalDt;
    }

    public String getEvalRsltCd() {
        return evalRsltCd;
    }

    public void setEvalRsltCd(String evalRsltCd) {
        this.evalRsltCd = evalRsltCd;
    }

    public String getPevalId() {
        return pevalId;
    }

    public void setPevalId(String pevalId) {
        this.pevalId = pevalId;
    }

    public String getPevalName() {
        return pevalName;
    }

    public void setPevalName(String pevalName) {
        this.pevalName = pevalName;
    }

    public String getRegUsrId() {
        return regUsrId;
    }

    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    public Date getRegDt() {
        return regDt;
    }

    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    public String getUpdtUsrId() {
        return updtUsrId;
    }

    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    public Date getUpdtDt() {
        return updtDt;
    }

    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    public String getDlrNm() {
        return dlrNm;
    }

    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }

    public String getEaiId() {
        return eaiId;
    }

    public void setEaiId(String eaiId) {
        this.eaiId = eaiId;
    }

    public String getReqNoChar() {
        return reqNoChar;
    }

    public void setReqNoChar(String reqNoChar) {
        this.reqNoChar = reqNoChar;
    }
    
}

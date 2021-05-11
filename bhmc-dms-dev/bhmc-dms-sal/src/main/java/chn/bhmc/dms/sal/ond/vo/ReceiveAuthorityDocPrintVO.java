package chn.bhmc.dms.sal.ond.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 수령권한문서출력 조회 VO
 * </pre>
 *
 * @ClassName   : ReceiveAuthorityDocPrintVO.java
 * @Description : ReceiveAuthorityDocPrintVO
 * @author Jin Choi
 * @since 2017. 3. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 6.     Jin Choi     최초 생성
 * </pre>
 */

public class ReceiveAuthorityDocPrintVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -9068255213982471724L;

    private String dlrCd; //전상코드

    private String dlrNm; //전상명칭

    private String reqNo; //신청번호

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date reqDt; //신청일자

    private String is4sYn; //4s딜러여부

    private String shipToDlrCd; //딜러코드

    private String shipToDlrNm; //수령회사명칭

    private String shipToAddr; //접수주소

    private String shipToProv; //성 코드

    private String shipToProvNm; //성 명칭

    private String shipToCity; //시 코드

    private String shipToCityNm; //시 명칭

    private String shipToRecv; //수령인(명칭)

    private String shipToIdno; //수령인증서번호

    private String shipToRecvTel; //수령인전화

    private String fileDocNo; //fileDocNo

    private String fileNo; //fileNo

    private String shipToAdocNo; //수령권한문서번호

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date evalDt; //심사일자

    private String evalRsltCd; //심사결과 (코드)

    private String pevalName; //심사인

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param reqNo the reqNo to set
     */
    public void setReqNo(String reqNo) {
        this.reqNo = reqNo;
    }

    /**
     * @return the reqNo
     */
    public String getReqNo() {
        return reqNo;
    }

    /**
     * @param is4sYn the is4sYn to set
     */
    public void setIs4sYn(String is4sYn) {
        this.is4sYn = is4sYn;
    }

    /**
     * @return the is4sYn
     */
    public String getIs4sYn() {
        return is4sYn;
    }

    /**
     * @param shipToDlrCd the shipToDlrCd to set
     */
    public void setShipToDlrCd(String shipToDlrCd) {
        this.shipToDlrCd = shipToDlrCd;
    }

    /**
     * @return the shipToDlrCd
     */
    public String getShipToDlrCd() {
        return shipToDlrCd;
    }

    /**
     * @param shipToAddr the shipToAddr to set
     */
    public void setShipToAddr(String shipToAddr) {
        this.shipToAddr = shipToAddr;
    }

    /**
     * @return the shipToAddr
     */
    public String getShipToAddr() {
        return shipToAddr;
    }

    /**
     * @param shipToProv the shipToProv to set
     */
    public void setShipToProv(String shipToProv) {
        this.shipToProv = shipToProv;
    }

    /**
     * @return the shipToProv
     */
    public String getShipToProv() {
        return shipToProv;
    }

    /**
     * @param shipToCity the shipToCity to set
     */
    public void setShipToCity(String shipToCity) {
        this.shipToCity = shipToCity;
    }

    /**
     * @return the shipToCity
     */
    public String getShipToCity() {
        return shipToCity;
    }

    /**
     * @param shipToRecv the shipToRecv to set
     */
    public void setShipToRecv(String shipToRecv) {
        this.shipToRecv = shipToRecv;
    }

    /**
     * @return the shipToRecv
     */
    public String getShipToRecv() {
        return shipToRecv;
    }

    /**
     * @param shipToIdno the shipToIdno to set
     */
    public void setShipToIdno(String shipToIdno) {
        this.shipToIdno = shipToIdno;
    }

    /**
     * @return the shipToIdno
     */
    public String getShipToIdno() {
        return shipToIdno;
    }

    /**
     * @param shipToRecvTel the shipToRecvTel to set
     */
    public void setShipToRecvTel(String shipToRecvTel) {
        this.shipToRecvTel = shipToRecvTel;
    }

    /**
     * @return the shipToRecvTel
     */
    public String getShipToRecvTel() {
        return shipToRecvTel;
    }

    /**
     * @param shipToAdocNo the shipToAdocNo to set
     */
    public void setShipToAdocNo(String shipToAdocNo) {
        this.shipToAdocNo = shipToAdocNo;
    }

    /**
     * @return the shipToAdocNo
     */
    public String getShipToAdocNo() {
        return shipToAdocNo;
    }

    /**
     * @param evalRsltCd the evalRsltCd to set
     */
    public void setEvalRsltCd(String evalRsltCd) {
        this.evalRsltCd = evalRsltCd;
    }

    /**
     * @return the evalRsltCd
     */
    public String getEvalRsltCd() {
        return evalRsltCd;
    }

    /**
     * @param pevalName the pevalName to set
     */
    public void setPevalName(String pevalName) {
        this.pevalName = pevalName;
    }

    /**
     * @return the pevalName
     */
    public String getPevalName() {
        return pevalName;
    }

    /**
     * @param reqDt the reqDt to set
     */
    public void setReqDt(Date reqDt) {
        this.reqDt = reqDt;
    }

    /**
     * @return the reqDt
     */
    public Date getReqDt() {
        return reqDt;
    }

    /**
     * @param evalDt the evalDt to set
     */
    public void setEvalDt(Date evalDt) {
        this.evalDt = evalDt;
    }

    /**
     * @return the evalDt
     */
    public Date getEvalDt() {
        return evalDt;
    }

    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }

    /**
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }

    /**
     * @param shipToDlrNm the shipToDlrNm to set
     */
    public void setShipToDlrNm(String shipToDlrNm) {
        this.shipToDlrNm = shipToDlrNm;
    }

    /**
     * @return the shipToDlrNm
     */
    public String getShipToDlrNm() {
        return shipToDlrNm;
    }

    /**
     * @param shipToProvNm the shipToProvNm to set
     */
    public void setShipToProvNm(String shipToProvNm) {
        this.shipToProvNm = shipToProvNm;
    }

    /**
     * @return the shipToProvNm
     */
    public String getShipToProvNm() {
        return shipToProvNm;
    }

    /**
     * @param shipToCityNm the shipToCityNm to set
     */
    public void setShipToCityNm(String shipToCityNm) {
        this.shipToCityNm = shipToCityNm;
    }

    /**
     * @return the shipToCityNm
     */
    public String getShipToCityNm() {
        return shipToCityNm;
    }

    /**
     * @param fileDocNo the fileDocNo to set
     */
    public void setFileDocNo(String fileDocNo) {
        this.fileDocNo = fileDocNo;
    }

    /**
     * @return the fileDocNo
     */
    public String getFileDocNo() {
        return fileDocNo;
    }

    /**
     * @param fileNo the fileNo to set
     */
    public void setFileNo(String fileNo) {
        this.fileNo = fileNo;
    }

    /**
     * @return the fileNo
     */
    public String getFileNo() {
        return fileNo;
    }



}

package chn.bhmc.dms.sal.ond.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 수령권한문서출력 조회 SearchVO
 * </pre>
 *
 * @ClassName   : ReceiveAuthorityDocPrintSearchVO.java
 * @Description : ReceiveAuthorityDocPrintSearchVO
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

public class ReceiveAuthorityDocPrintSearchVO extends BaseSearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8454432999098725065L;

    private String sEMarketCd; //(조회조건)전상코드

    private String sReceiveComNm; //(조회조건)수령회사명칭

    private String sSungCd; //(조회조건)성

    private String sCityCd; //(조회조건)도시

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqFromDt; //(조회조건)신청일자 시작일

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqToDt; //(조회조건)신청일자 종료일

    private String sReceiverNm; //(조회조건)수령인명칭

    private String sDlrCd; //전상코드

    private String sReqNo; //신청번호

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqDt; //신청일자

    private String sIs4sYn; //4s딜러여부

    private String sShipToDlrCd; //딜러코드

    private String sShipToDlrNm; //수령회사명칭

    private String sShipToAddr; //접수주소

    private String sShipToProv; //성 (코드)

    private String sShipToCity; //시 (코드)

    private String sShipToRecv; //수령인(명칭)

    private String sShipToIdno; //수령인증서번호

    private String sShipToRecvTel; //수령인전화

    private String sShipToAdocNo; //수령권한문서번호

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEvalDt; //심사일자

    private String sEvalRsltCd; //심사결과 (코드)

    private String sPevalName; //심사인

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sReqNo the sReqNo to set
     */
    public void setsReqNo(String sReqNo) {
        this.sReqNo = sReqNo;
    }

    /**
     * @return the sReqNo
     */
    public String getsReqNo() {
        return sReqNo;
    }

    /**
     * @param sIs4sYn the sIs4sYn to set
     */
    public void setsIs4sYn(String sIs4sYn) {
        this.sIs4sYn = sIs4sYn;
    }

    /**
     * @return the sIs4sYn
     */
    public String getsIs4sYn() {
        return sIs4sYn;
    }

    /**
     * @param sShipToDlrCd the sShipToDlrCd to set
     */
    public void setsShipToDlrCd(String sShipToDlrCd) {
        this.sShipToDlrCd = sShipToDlrCd;
    }

    /**
     * @return the sShipToDlrCd
     */
    public String getsShipToDlrCd() {
        return sShipToDlrCd;
    }

    /**
     * @param sShipToAddr the sShipToAddr to set
     */
    public void setsShipToAddr(String sShipToAddr) {
        this.sShipToAddr = sShipToAddr;
    }

    /**
     * @return the sShipToAddr
     */
    public String getsShipToAddr() {
        return sShipToAddr;
    }

    /**
     * @param sShipToProv the sShipToProv to set
     */
    public void setsShipToProv(String sShipToProv) {
        this.sShipToProv = sShipToProv;
    }

    /**
     * @return the sShipToProv
     */
    public String getsShipToProv() {
        return sShipToProv;
    }

    /**
     * @param sShipToCity the sShipToCity to set
     */
    public void setsShipToCity(String sShipToCity) {
        this.sShipToCity = sShipToCity;
    }

    /**
     * @return the sShipToCity
     */
    public String getsShipToCity() {
        return sShipToCity;
    }

    /**
     * @param sShipToRecv the sShipToRecv to set
     */
    public void setsShipToRecv(String sShipToRecv) {
        this.sShipToRecv = sShipToRecv;
    }

    /**
     * @return the sShipToRecv
     */
    public String getsShipToRecv() {
        return sShipToRecv;
    }

    /**
     * @param sShipToIdno the sShipToIdno to set
     */
    public void setsShipToIdno(String sShipToIdno) {
        this.sShipToIdno = sShipToIdno;
    }

    /**
     * @return the sShipToIdno
     */
    public String getsShipToIdno() {
        return sShipToIdno;
    }

    /**
     * @param sShipToRecvTel the sShipToRecvTel to set
     */
    public void setsShipToRecvTel(String sShipToRecvTel) {
        this.sShipToRecvTel = sShipToRecvTel;
    }

    /**
     * @return the sShipToRecvTel
     */
    public String getsShipToRecvTel() {
        return sShipToRecvTel;
    }

    /**
     * @param sShipToAdocNo the sShipToAdocNo to set
     */
    public void setsShipToAdocNo(String sShipToAdocNo) {
        this.sShipToAdocNo = sShipToAdocNo;
    }

    /**
     * @return the sShipToAdocNo
     */
    public String getsShipToAdocNo() {
        return sShipToAdocNo;
    }

    /**
     * @param sEvalRsltCd the sEvalRsltCd to set
     */
    public void setsEvalRsltCd(String sEvalRsltCd) {
        this.sEvalRsltCd = sEvalRsltCd;
    }

    /**
     * @return the sEvalRsltCd
     */
    public String getsEvalRsltCd() {
        return sEvalRsltCd;
    }

    /**
     * @param sPevalName the sPevalName to set
     */
    public void setsPevalName(String sPevalName) {
        this.sPevalName = sPevalName;
    }

    /**
     * @return the sPevalName
     */
    public String getsPevalName() {
        return sPevalName;
    }

    /**
     * @param sReqDt the sReqDt to set
     */
    public void setsReqDt(Date sReqDt) {
        this.sReqDt = sReqDt;
    }

    /**
     * @return the sReqDt
     */
    public Date getsReqDt() {
        return sReqDt;
    }

    /**
     * @param sEvalDt the sEvalDt to set
     */
    public void setsEvalDt(Date sEvalDt) {
        this.sEvalDt = sEvalDt;
    }

    /**
     * @return the sEvalDt
     */
    public Date getsEvalDt() {
        return sEvalDt;
    }

    /**
     * @param sEMarketCd the sEMarketCd to set
     */
    public void setsEMarketCd(String sEMarketCd) {
        this.sEMarketCd = sEMarketCd;
    }

    /**
     * @return the sEMarketCd
     */
    public String getsEMarketCd() {
        return sEMarketCd;
    }

    /**
     * @param sReceiveComNm the sReceiveComNm to set
     */
    public void setsReceiveComNm(String sReceiveComNm) {
        this.sReceiveComNm = sReceiveComNm;
    }

    /**
     * @return the sReceiveComNm
     */
    public String getsReceiveComNm() {
        return sReceiveComNm;
    }

    /**
     * @param sCityCd the sCityCd to set
     */
    public void setsCityCd(String sCityCd) {
        this.sCityCd = sCityCd;
    }

    /**
     * @return the sCityCd
     */
    public String getsCityCd() {
        return sCityCd;
    }

    /**
     * @param sReceiverNm the sReceiverNm to set
     */
    public void setsReceiverNm(String sReceiverNm) {
        this.sReceiverNm = sReceiverNm;
    }

    /**
     * @return the sReceiverNm
     */
    public String getsReceiverNm() {
        return sReceiverNm;
    }

    /**
     * @param sReqFromDt the sReqFromDt to set
     */
    public void setsReqFromDt(Date sReqFromDt) {
        this.sReqFromDt = sReqFromDt;
    }

    /**
     * @return the sReqFromDt
     */
    public Date getsReqFromDt() {
        return sReqFromDt;
    }

    /**
     * @param sReqToDt the sReqToDt to set
     */
    public void setsReqToDt(Date sReqToDt) {
        this.sReqToDt = sReqToDt;
    }

    /**
     * @return the sReqToDt
     */
    public Date getsReqToDt() {
        return sReqToDt;
    }

    /**
     * @param sShipToDlrNm the sShipToDlrNm to set
     */
    public void setsShipToDlrNm(String sShipToDlrNm) {
        this.sShipToDlrNm = sShipToDlrNm;
    }

    /**
     * @return the sShipToDlrNm
     */
    public String getsShipToDlrNm() {
        return sShipToDlrNm;
    }

    /**
     * @param sSungCd the sSungCd to set
     */
    public void setsSungCd(String sSungCd) {
        this.sSungCd = sSungCd;
    }

    /**
     * @return the sSungCd
     */
    public String getsSungCd() {
        return sSungCd;
    }

}

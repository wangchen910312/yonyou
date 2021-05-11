package chn.bhmc.dms.par.stm.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 딜러별 재고인터페이스 VO
 *
 * @ClassName   : StockInterfaceDlrInfoVO.java
 * @Description : StockInterfaceDlrInfoVO Class
 * @author Ju Won Lee
 * @since 2016. 1. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 21.     Ju Won Lee     최초 생성
 * </pre>
 */

public class StockInterfaceDlrInfoVO {

    /**
     * 법인코드
     **/
    private String dpsCrp;

    /**
     * 회사구분
     **/
    private String dpsCmpKnd;

    /**
     * 딜러코드
     **/
    @JsonProperty("DPS_DLR_CD")
    private String dpsDlrCd;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 부번
     **/
    private String dpsPno;

    /**
     * 등록유형
     **/    
    private String dpsEntTyp;

    /**
     * LOCATION
     **/
    private String dpsLoc;

    /**
     * 품명(중문)
     **/
    private String dpsPnmChm;

    /**
     * CAR MODEL
     **/
    private String dpsCar;

    /**
     * 전체재고수량
     **/
    private Double dpsAllQt;

    /**
     * 상품재고수량
     **/
    private Double dpsOhadQt;

    /**
     * 총재고수량(공정중포함)
     **/
    private Double dpsDpsQt;

    /**
     * B/O수량
     **/
    private Double dpsBo;

    /**
     * 발주의뢰수량
     **/
    private Double dpsOord;

    /**
     * 비순환품목
     **/
    private String dpsNonMov;

    /**
     * CLASS코드
     **/
    private String dpsCls;

    /**
     * 3개월평균수주량
     **/
    private Double dpsAmd3;

    /**
     * 6개월평균수주량
     **/
    private Double dpsAmd6;

    /**
     * 12개월평균수주량
     **/
    private Double dpsAmd12;

    /**
     * 수주건수
     **/    
    private int dpsDmdFrq;

    /**
     * OLD PART
     **/
    private String dpsOldPno;

    /**
     * OLD ITC
     **/
    private String dpsOldItc;

    /**
     * NEW PART
     **/    
    private String dpsNewPno;

    /**
     * NEW ITC
     **/
    private String dpsNewItc;

    /**
     * Minimum Order quantity
     **/
    private Double dpsQfp;

    /**
     * RETAIL PRICE
     **/
    private Double ptrRtlPrice;

    /**
     * EAI SEND FLAG
     **/    
    private String dpsEaiFlg;

    /**
     * Error Message
     **/
    private String dpsEaiErr;

    /**
     * 등록자ID
     **/
    private String regUsrId;

    /**
     * 딜러명
     **/    
    private String dlrNm;

    /**
     * 사업부
     **/
    private String sdptCd;

    /**
     * 동사무소
     **/
    private String distOfficeCd;

    /**
     * 성
     **/
    private String saleDlrSungCd;

    /**
     * 지역코드
     **/
    private String distCd;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    /**
     * 전송일자
     **/    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sendDt;

    /**
     * 인터페이스결과코드
     **/    
    private String ifresult;

    /**
     * 인터페이스실패메세지
     **/    
    private String iffailmsg;

    /**
     * 인터페이스생성일자
     **/
    private String createdate;

    /**
     * 인터페이스변경일자
     **/
    private String updatedate;

    /**
     * 인터페이스등록일자
     **/    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date ifRegDt;

    /**
     * 배치상태코드
     **/
    private String batStatCd;

    /**
     * 배치결과일자
     **/    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date batRsltDt;

    /**
     * 배치메세지내용
     **/
    private String batMesgCont;

    /**
     * @return the dpsCrp
     */
    public String getDpsCrp() {
        return dpsCrp;
    }

    /**
     * @param dpsCrp the dpsCrp to set
     */
    public void setDpsCrp(String dpsCrp) {
        this.dpsCrp = dpsCrp;
    }

    /**
     * @return the dpsCmpKnd
     */
    public String getDpsCmpKnd() {
        return dpsCmpKnd;
    }

    /**
     * @param dpsCmpKnd the dpsCmpKnd to set
     */
    public void setDpsCmpKnd(String dpsCmpKnd) {
        this.dpsCmpKnd = dpsCmpKnd;
    }

    /**
     * @return the dpsDlrCd
     */
    public String getDpsDlrCd() {
        return dpsDlrCd;
    }

    /**
     * @param dpsDlrCd the dpsDlrCd to set
     */
    public void setDpsDlrCd(String dpsDlrCd) {
        this.dpsDlrCd = dpsDlrCd;
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
     * @return the dpsPno
     */
    public String getDpsPno() {
        return dpsPno;
    }

    /**
     * @param dpsPno the dpsPno to set
     */
    public void setDpsPno(String dpsPno) {
        this.dpsPno = dpsPno;
    }

    /**
     * @return the dpsEntTyp
     */
    public String getDpsEntTyp() {
        return dpsEntTyp;
    }

    /**
     * @param dpsEntTyp the dpsEntTyp to set
     */
    public void setDpsEntTyp(String dpsEntTyp) {
        this.dpsEntTyp = dpsEntTyp;
    }

    /**
     * @return the dpsLoc
     */
    public String getDpsLoc() {
        return dpsLoc;
    }

    /**
     * @param dpsLoc the dpsLoc to set
     */
    public void setDpsLoc(String dpsLoc) {
        this.dpsLoc = dpsLoc;
    }

    /**
     * @return the dpsPnmChm
     */
    public String getDpsPnmChm() {
        return dpsPnmChm;
    }

    /**
     * @param dpsPnmChm the dpsPnmChm to set
     */
    public void setDpsPnmChm(String dpsPnmChm) {
        this.dpsPnmChm = dpsPnmChm;
    }

    /**
     * @return the dpsCar
     */
    public String getDpsCar() {
        return dpsCar;
    }

    /**
     * @param dpsCar the dpsCar to set
     */
    public void setDpsCar(String dpsCar) {
        this.dpsCar = dpsCar;
    }

    /**
     * @return the dpsAllQt
     */
    public Double getDpsAllQt() {
        return dpsAllQt;
    }

    /**
     * @param dpsAllQt the dpsAllQt to set
     */
    public void setDpsAllQt(Double dpsAllQt) {
        this.dpsAllQt = dpsAllQt;
    }

    /**
     * @return the dpsOhadQt
     */
    public Double getDpsOhadQt() {
        return dpsOhadQt;
    }

    /**
     * @param dpsOhadQt the dpsOhadQt to set
     */
    public void setDpsOhadQt(Double dpsOhadQt) {
        this.dpsOhadQt = dpsOhadQt;
    }

    /**
     * @return the dpsDpsQt
     */
    public Double getDpsDpsQt() {
        return dpsDpsQt;
    }

    /**
     * @param dpsDpsQt the dpsDpsQt to set
     */
    public void setDpsDpsQt(Double dpsDpsQt) {
        this.dpsDpsQt = dpsDpsQt;
    }

    /**
     * @return the dpsBo
     */
    public Double getDpsBo() {
        return dpsBo;
    }

    /**
     * @param dpsBo the dpsBo to set
     */
    public void setDpsBo(Double dpsBo) {
        this.dpsBo = dpsBo;
    }

    /**
     * @return the dpsOord
     */
    public Double getDpsOord() {
        return dpsOord;
    }

    /**
     * @param dpsOord the dpsOord to set
     */
    public void setDpsOord(Double dpsOord) {
        this.dpsOord = dpsOord;
    }

    /**
     * @return the dpsNonMov
     */
    public String getDpsNonMov() {
        return dpsNonMov;
    }

    /**
     * @param dpsNonMov the dpsNonMov to set
     */
    public void setDpsNonMov(String dpsNonMov) {
        this.dpsNonMov = dpsNonMov;
    }

    /**
     * @return the dpsCls
     */
    public String getDpsCls() {
        return dpsCls;
    }

    /**
     * @param dpsCls the dpsCls to set
     */
    public void setDpsCls(String dpsCls) {
        this.dpsCls = dpsCls;
    }

    /**
     * @return the dpsAmd3
     */
    public Double getDpsAmd3() {
        return dpsAmd3;
    }

    /**
     * @param dpsAmd3 the dpsAmd3 to set
     */
    public void setDpsAmd3(Double dpsAmd3) {
        this.dpsAmd3 = dpsAmd3;
    }

    /**
     * @return the dpsAmd6
     */
    public Double getDpsAmd6() {
        return dpsAmd6;
    }

    /**
     * @param dpsAmd6 the dpsAmd6 to set
     */
    public void setDpsAmd6(Double dpsAmd6) {
        this.dpsAmd6 = dpsAmd6;
    }

    /**
     * @return the dpsAmd12
     */
    public Double getDpsAmd12() {
        return dpsAmd12;
    }

    /**
     * @param dpsAmd12 the dpsAmd12 to set
     */
    public void setDpsAmd12(Double dpsAmd12) {
        this.dpsAmd12 = dpsAmd12;
    }

    /**
     * @return the dpsDmdFrq
     */
    public int getDpsDmdFrq() {
        return dpsDmdFrq;
    }

    /**
     * @param dpsDmdFrq the dpsDmdFrq to set
     */
    public void setDpsDmdFrq(int dpsDmdFrq) {
        this.dpsDmdFrq = dpsDmdFrq;
    }

    /**
     * @return the dpsOldPno
     */
    public String getDpsOldPno() {
        return dpsOldPno;
    }

    /**
     * @param dpsOldPno the dpsOldPno to set
     */
    public void setDpsOldPno(String dpsOldPno) {
        this.dpsOldPno = dpsOldPno;
    }

    /**
     * @return the dpsOldItc
     */
    public String getDpsOldItc() {
        return dpsOldItc;
    }

    /**
     * @param dpsOldItc the dpsOldItc to set
     */
    public void setDpsOldItc(String dpsOldItc) {
        this.dpsOldItc = dpsOldItc;
    }

    /**
     * @return the dpsNewPno
     */
    public String getDpsNewPno() {
        return dpsNewPno;
    }

    /**
     * @param dpsNewPno the dpsNewPno to set
     */
    public void setDpsNewPno(String dpsNewPno) {
        this.dpsNewPno = dpsNewPno;
    }

    /**
     * @return the dpsNewItc
     */
    public String getDpsNewItc() {
        return dpsNewItc;
    }

    /**
     * @param dpsNewItc the dpsNewItc to set
     */
    public void setDpsNewItc(String dpsNewItc) {
        this.dpsNewItc = dpsNewItc;
    }

    /**
     * @return the dpsQfp
     */
    public Double getDpsQfp() {
        return dpsQfp;
    }

    /**
     * @param dpsQfp the dpsQfp to set
     */
    public void setDpsQfp(Double dpsQfp) {
        this.dpsQfp = dpsQfp;
    }

    /**
     * @return the ptrRtlPrice
     */
    public Double getPtrRtlPrice() {
        return ptrRtlPrice;
    }

    /**
     * @param ptrRtlPrice the ptrRtlPrice to set
     */
    public void setPtrRtlPrice(Double ptrRtlPrice) {
        this.ptrRtlPrice = ptrRtlPrice;
    }

    /**
     * @return the dpsEaiFlg
     */
    public String getDpsEaiFlg() {
        return dpsEaiFlg;
    }

    /**
     * @param dpsEaiFlg the dpsEaiFlg to set
     */
    public void setDpsEaiFlg(String dpsEaiFlg) {
        this.dpsEaiFlg = dpsEaiFlg;
    }

    /**
     * @return the dpsEaiErr
     */
    public String getDpsEaiErr() {
        return dpsEaiErr;
    }

    /**
     * @param dpsEaiErr the dpsEaiErr to set
     */
    public void setDpsEaiErr(String dpsEaiErr) {
        this.dpsEaiErr = dpsEaiErr;
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
     * @return the sdptCd
     */
    public String getSdptCd() {
        return sdptCd;
    }

    /**
     * @param sdptCd the sdptCd to set
     */
    public void setSdptCd(String sdptCd) {
        this.sdptCd = sdptCd;
    }

    /**
     * @return the distOfficeCd
     */
    public String getDistOfficeCd() {
        return distOfficeCd;
    }

    /**
     * @param distOfficeCd the distOfficeCd to set
     */
    public void setDistOfficeCd(String distOfficeCd) {
        this.distOfficeCd = distOfficeCd;
    }

    /**
     * @return the saleDlrSungCd
     */
    public String getSaleDlrSungCd() {
        return saleDlrSungCd;
    }

    /**
     * @param saleDlrSungCd the saleDlrSungCd to set
     */
    public void setSaleDlrSungCd(String saleDlrSungCd) {
        this.saleDlrSungCd = saleDlrSungCd;
    }

    /**
     * @return the distCd
     */
    public String getDistCd() {
        return distCd;
    }

    /**
     * @param distCd the distCd to set
     */
    public void setDistCd(String distCd) {
        this.distCd = distCd;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the sendDt
     */
    public Date getSendDt() {
        return sendDt;
    }

    /**
     * @param sendDt the sendDt to set
     */
    public void setSendDt(Date sendDt) {
        this.sendDt = sendDt;
    }

    /**
     * @return the ifresult
     */
    public String getIfresult() {
        return ifresult;
    }

    /**
     * @param ifresult the ifresult to set
     */
    public void setIfresult(String ifresult) {
        this.ifresult = ifresult;
    }

    /**
     * @return the iffailmsg
     */
    public String getIffailmsg() {
        return iffailmsg;
    }

    /**
     * @param iffailmsg the iffailmsg to set
     */
    public void setIffailmsg(String iffailmsg) {
        this.iffailmsg = iffailmsg;
    }

    /**
     * @return the createdate
     */
    public String getCreatedate() {
        return createdate;
    }

    /**
     * @param createdate the createdate to set
     */
    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    /**
     * @return the updatedate
     */
    public String getUpdatedate() {
        return updatedate;
    }

    /**
     * @param updatedate the updatedate to set
     */
    public void setUpdatedate(String updatedate) {
        this.updatedate = updatedate;
    }

    /**
     * @return the ifRegDt
     */
    public Date getIfRegDt() {
        return ifRegDt;
    }

    /**
     * @param ifRegDt the ifRegDt to set
     */
    public void setIfRegDt(Date ifRegDt) {
        this.ifRegDt = ifRegDt;
    }

    /**
     * @return the batStatCd
     */
    public String getBatStatCd() {
        return batStatCd;
    }

    /**
     * @param batStatCd the batStatCd to set
     */
    public void setBatStatCd(String batStatCd) {
        this.batStatCd = batStatCd;
    }

    /**
     * @return the batRsltDt
     */
    public Date getBatRsltDt() {
        return batRsltDt;
    }

    /**
     * @param batRsltDt the batRsltDt to set
     */
    public void setBatRsltDt(Date batRsltDt) {
        this.batRsltDt = batRsltDt;
    }

    /**
     * @return the batMesgCont
     */
    public String getBatMesgCont() {
        return batMesgCont;
    }

    /**
     * @param batMesgCont the batMesgCont to set
     */
    public void setBatMesgCont(String batMesgCont) {
        this.batMesgCont = batMesgCont;
    }

}

package chn.bhmc.dms.par.pmm.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ItemMasterSendVO.java
 * @Description : 부품마스터 전송 VO.
 * @author In Bo Shim
 * @since 2016. 5. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 27.     In Bo Shim     최초 생성
 * </pre>
 */

public class ItemMasterSendVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8223662296368975310L;

    /**
     * 법인코드
     **/
    //DPS_CRP
    private String dpsCrp;

    /**
     * 회사구분
     **/
    //DPS_CMP_KND
    private String dpsCmpKnd;

    /**
     * 딜러코드
     **/
    //DPS_DLR_CD
    private String dpsDlrCd;

    /**
     * 부번
     **/
    //DPS_PNO
    private String dpsPno;

    /**
     * 등록유형
     **/
    //DPS_ENT_TYP
    private String dpsEntTyp;

    /**
     * LOCATION
     **/
    //DPS_LOC
    private String dpsLoc;

    /**
     * 품명(중문)
     **/
    //DPS_PNM_CHM
    private String dpsPnmChm;

    /**
     * CAR MODEL
     **/
    //DPS_CAR
    private String dpsCar;

    /**
     * 상품재고수량
     **/
    //DPS_OHAD_QT
    private Double dpsOhadQt;

    /**
     * 총재고수량(공정중포함)
     **/
    //DPS_DPS_QT
    private Double dpsDpsQt;

    /**
     * B/O수량
     **/
    //DPS_BO
    private Double dpsBo;

    /**
     * 발주의뢰수량
     **/
    //DPS_OORD
    private Double dpsOord;

    /**
     * 비순환품목
     **/
    //DPS_NON_MOV
    private String dpsNonMov;

    /**
     * CLASS코드
     **/
    //DPS_CLS
    private String dpsCls;

    /**
     * 3개월평균수주량
     **/
    //DPS_AMD3
    private Double dpsAmd3;

    /**
     * 6개월평균수주량
     **/
    //DPS_AMD6
    private Double dpsAmd6;

    /**
     * 12개월평균수주량
     **/
    //DPS_AMD12
    private Double dpsAmd12;

    /**
     * 수주건수
     **/
    //DPS_DMD_FRQ
    private int dpsDmdFrq;

    /**
     * OLD PART
     **/
    //DPS_OLD_PNO
    private String dpsOldPno;

    /**
     * OLD ITC
     **/
    //DPS_OLD_ITC
    private String dpsOldItc;

    /**
     * NEW PART
     **/
    //DPS_NEW_PNO
    private String dpsNewPno;

    /**
     * NEW ITC
     **/
    //DPS_NEW_ITC
    private String dpsNewItc;

    /**
     * Minimum Order quantity
     **/
    //DPS_QFP
    private Double dpsQfp;

    /**
     * RETAIL PRICE
     **/
    //PTR_RTL_PRICE
    private Double ptrRtlPrice;

    /**
     * EAI SEND FLAG
     **/
    //DPS_EAI_FLG
    private String dpsEaiFlg;

    /**
     * Error Message
     **/
    //DPS_EAI_ERR
    private String dpsEaiErr;

    /**
     * 등록자ID
     **/
    //REG_USR_ID
    private String regUsrId;

    /**
     * 등록일자
     **/
    //REG_DT
    private Date regDt;

    /**
     * 전송일자
     **/
    //SEND_DT
    private Date sendDt;

    /**
     * 인터페이스결과코드
     **/
    //IFRESULT
    private String ifresult;

    /**
     * 인터페이스실패메세지
     **/
    //IFFAILMSG
    private String iffailmsg;

    /**
     * 인터페이스생성일자
     **/
    //CREATEDATE
    private String createdate;

    /**
     * 인터페이스변경일자
     **/
    //UPDATEDATE
    private String updatedate;

    /**
     * 인터페이스등록일자
     **/
    //IF_REG_DT
    private Date ifRegDt;

    /**
     * 배치상태코드
     **/
    //BAT_STAT_CD
    private String batStatCd;

    /**
     * 배치결과일자
     **/
    //BAT_RSLT_DT
    private Date batRsltDt;

    /**
     * 배치메세지내용
     **/
    //BAT_MESG_CONT
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

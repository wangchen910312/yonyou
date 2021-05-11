package chn.bhmc.dms.bat.crm.cif.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerRelInfoVO.java
 * @Description : 고객 연계인 정보를 관리한다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kyo Jin Lee     최초 생성
 * </pre>
 */



public class BatCustomerRelInfoVO extends SearchVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6734201365168904321L;

    /**
     * 일련번호 (SEQ_CR_0111T_T)
     **/
    private  int          seq;

    /**
     * 연계인고객번호
     **/
    private  String       pconCustNo;
    private  String       pconSiebelRowId;

    /**
     * 상위고객번호
     **/
    //UPPER_CUST_NO
    private  String       upperCustNo;
    private  String       upperSiebelRowId;

    /**
     * 연계인유형
     **/
    //PCON_TP
    private  String       pconTp;

    /**
     * 등록자ID
     **/
    private  String       regUsrId;

    /**
     * 등록일자
     **/
    //@NotEmpty
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date         regDt;

    /**
     * 수정자ID
     **/
    //UPDT_USR_ID
    private  String       updtUsrId;

    /**
     * 수정일자
     **/
    //UPDT_DT
    private  Date         updtDt;

    private  String       dlrCd;

    private  String       custNm;
    private  String       mathDocTp;
    private  String       certiNum;
    private  String       telNo;
    private  String       hpNo;
    private  String       emailNm;
    private  String       prefCommMthCd;
    private  String       prefCommNo;
    private  String       prefContactMthCd;
    private  String       prefContactTimeCd;

    private  String       pltCd;

    private  String        batMesgCont;
    private  String        batStatCd;

    /**
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }

    /**
     * @return the pconCustNo
     */
    public String getPconCustNo() {
        return pconCustNo;
    }

    /**
     * @param pconCustNo the pconCustNo to set
     */
    public void setPconCustNo(String pconCustNo) {
        this.pconCustNo = pconCustNo;
    }

    /**
     * @return the upperCustNo
     */
    public String getUpperCustNo() {
        return upperCustNo;
    }

    /**
     * @param upperCustNo the upperCustNo to set
     */
    public void setUpperCustNo(String upperCustNo) {
        this.upperCustNo = upperCustNo;
    }

    /**
     * @return the pconTp
     */
    public String getPconTp() {
        return pconTp;
    }

    /**
     * @param pconTp the pconTp to set
     */
    public void setPconTp(String pconTp) {
        this.pconTp = pconTp;
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
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
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
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
    }

    /**
     * @param custNm the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }

    /**
     * @return the mathDocTp
     */
    public String getMathDocTp() {
        return mathDocTp;
    }

    /**
     * @param mathDocTp the mathDocTp to set
     */
    public void setMathDocTp(String mathDocTp) {
        this.mathDocTp = mathDocTp;
    }

    /**
     * @return the certiNum
     */
    public String getCertiNum() {
        return certiNum;
    }

    /**
     * @param certiNum the certiNum to set
     */
    public void setCertiNum(String certiNum) {
        this.certiNum = certiNum;
    }

    /**
     * @return the telNo
     */
    public String getTelNo() {
        return telNo;
    }

    /**
     * @param telNo the telNo to set
     */
    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    /**
     * @return the hpNo
     */
    public String getHpNo() {
        return hpNo;
    }

    /**
     * @param hpNo the hpNo to set
     */
    public void setHpNo(String hpNo) {
        this.hpNo = hpNo;
    }

    /**
     * @return the emailNm
     */
    public String getEmailNm() {
        return emailNm;
    }

    /**
     * @param emailNm the emailNm to set
     */
    public void setEmailNm(String emailNm) {
        this.emailNm = emailNm;
    }

    /**
     * @return the prefCommMthCd
     */
    public String getPrefCommMthCd() {
        return prefCommMthCd;
    }

    /**
     * @param prefCommMthCd the prefCommMthCd to set
     */
    public void setPrefCommMthCd(String prefCommMthCd) {
        this.prefCommMthCd = prefCommMthCd;
    }

    /**
     * @return the prefCommNo
     */
    public String getPrefCommNo() {
        return prefCommNo;
    }

    /**
     * @param prefCommNo the prefCommNo to set
     */
    public void setPrefCommNo(String prefCommNo) {
        this.prefCommNo = prefCommNo;
    }

    /**
     * @return the prefContactMthCd
     */
    public String getPrefContactMthCd() {
        return prefContactMthCd;
    }

    /**
     * @param prefContactMthCd the prefContactMthCd to set
     */
    public void setPrefContactMthCd(String prefContactMthCd) {
        this.prefContactMthCd = prefContactMthCd;
    }

    /**
     * @return the prefContactTimeCd
     */
    public String getPrefContactTimeCd() {
        return prefContactTimeCd;
    }

    /**
     * @param prefContactTimeCd the prefContactTimeCd to set
     */
    public void setPrefContactTimeCd(String prefContactTimeCd) {
        this.prefContactTimeCd = prefContactTimeCd;
    }

    /**
     * @return the pltCd
     */
    public String getPltCd() {
        return pltCd;
    }

    /**
     * @param pltCd the pltCd to set
     */
    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
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
     * @return the pconSiebelRowId
     */
    public String getPconSiebelRowId() {
        return pconSiebelRowId;
    }

    /**
     * @param pconSiebelRowId the pconSiebelRowId to set
     */
    public void setPconSiebelRowId(String pconSiebelRowId) {
        this.pconSiebelRowId = pconSiebelRowId;
    }

    /**
     * @return the upperSiebelRowId
     */
    public String getUpperSiebelRowId() {
        return upperSiebelRowId;
    }

    /**
     * @param upperSiebelRowId the upperSiebelRowId to set
     */
    public void setUpperSiebelRowId(String upperSiebelRowId) {
        this.upperSiebelRowId = upperSiebelRowId;
    }

}

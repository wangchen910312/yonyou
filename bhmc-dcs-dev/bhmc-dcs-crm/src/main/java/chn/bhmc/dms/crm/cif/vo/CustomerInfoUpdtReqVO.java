package chn.bhmc.dms.crm.cif.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerInfoVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since     author    description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kyo Jin Lee     최초 생성
 * </pre>
 */



public class CustomerInfoUpdtReqVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6186408167406203119L;

    /**
     * 일련번호
     **/
    private  int          seq;

    /**
     * 딜러코드
     **/
    //DLR_CD

    private  String       dlrCd;

    /**
     * 고객번호
     **/
    //CUST_NO

    private  String       custNo;

    /**
     * 고객명
     **/
    //CUST_NM

    private  String       custNm;

    /**
     * 주요인증문서유형
     **/
    //MATH_DOC_TP

    private  String       mathDocTp;
    private  String       mathDocTpNm;

    /**
     * 주민사업자등록번호
     **/
    //SSN_CRN_NO

    private  String       ssnCrnNo;

    /**
     * 휴대폰번호
     **/
    //HP_NO

    private  String       hpNo;

    /**
     * 직장전화번호
     **/
    //OFFICE_TEL_NO

    private  String       officeTelNo;

    /**
     * 문서ID
     **/
    //DOC_ID

    private  String       docId;

    /**
     * 상태코드
     **/
    //STAT_CD

    private  String       statCd;
    private  String       statNm;

    /**
     * 비고
     **/
    //REMARK

    private  String       remark;

    /**
     * 등록자ID
     **/
    private  String       regUsrId;

    /**
     * 등록일자
     **/
    //@JsonDeserialize(using=JsonDateDeserializer.class)
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
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date         updtDt;

    private String cont;
    private String custTp;
    private String custCd;
    private String custCdC;
    private String custNmC;
    private String contC;
    private String mathDocTpC;
    private String officeTelNoC;
    private String ssnCrnNoC;
    private String oldCustNm;
    private String oldHpNo;
    private String oldMathDocTp;
    private String oldSsnCrnNo;
    private String prefCommMthCd;
    private String prefCommNo;

    private String reqUsrId;   // 요청자
    private String evalUsrId;   // 심사자
    private String evalUsrNm;   // 심사자명
    private String dmsSeq;      // DMS Seq
    private String befMathDocTp;    // 이전증거유형
    private String befMathDocTpNm;
    private String befSsnCrnNo;     // 이전증거번호
    private Date reqDt;         // 요청일시
    private Date evalDt;        // 심사일시
    private String evalCont;
    private String reqUsrNm;


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
     * @return the custNo
     */
    public String getCustNo() {
        return custNo;
    }

    /**
     * @param custNo the custNo to set
     */
    public void setCustNo(String custNo) {
        this.custNo = custNo;
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
     * @return the ssnCrnNo
     */
    public String getSsnCrnNo() {
        return ssnCrnNo;
    }

    /**
     * @param ssnCrnNo the ssnCrnNo to set
     */
    public void setSsnCrnNo(String ssnCrnNo) {
        this.ssnCrnNo = ssnCrnNo;
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
     * @return the officeTelNo
     */
    public String getOfficeTelNo() {
        return officeTelNo;
    }

    /**
     * @param officeTelNo the officeTelNo to set
     */
    public void setOfficeTelNo(String officeTelNo) {
        this.officeTelNo = officeTelNo;
    }

    /**
     * @return the docId
     */
    public String getDocId() {
        return docId;
    }

    /**
     * @param docId the docId to set
     */
    public void setDocId(String docId) {
        this.docId = docId;
    }

    /**
     * @return the statCd
     */
    public String getStatCd() {
        return statCd;
    }

    /**
     * @param statCd the statCd to set
     */
    public void setStatCd(String statCd) {
        this.statCd = statCd;
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
     * @return the contC
     */
    public String getContC() {
        return contC;
    }

    /**
     * @param contC the contC to set
     */
    public void setContC(String contC) {
        this.contC = contC;
    }

    /**
     * @return the cont
     */
    public String getCont() {
        return cont;
    }

    /**
     * @param cont the cont to set
     */
    public void setCont(String cont) {
        this.cont = cont;
    }

    /**
     * @return the custTp
     */
    public String getCustTp() {
        return custTp;
    }

    /**
     * @param custTp the custTp to set
     */
    public void setCustTp(String custTp) {
        this.custTp = custTp;
    }

    /**
     * @return the mathDocTpC
     */
    public String getMathDocTpC() {
        return mathDocTpC;
    }

    /**
     * @param mathDocTpC the mathDocTpC to set
     */
    public void setMathDocTpC(String mathDocTpC) {
        this.mathDocTpC = mathDocTpC;
    }

    /**
     * @return the officeTelNoC
     */
    public String getOfficeTelNoC() {
        return officeTelNoC;
    }

    /**
     * @param officeTelNoC the officeTelNoC to set
     */
    public void setOfficeTelNoC(String officeTelNoC) {
        this.officeTelNoC = officeTelNoC;
    }

    /**
     * @return the oldCustNm
     */
    public String getOldCustNm() {
        return oldCustNm;
    }

    /**
     * @param oldCustNm the oldCustNm to set
     */
    public void setOldCustNm(String oldCustNm) {
        this.oldCustNm = oldCustNm;
    }

    /**
     * @return the oldHpNo
     */
    public String getOldHpNo() {
        return oldHpNo;
    }

    /**
     * @param oldHpNo the oldHpNo to set
     */
    public void setOldHpNo(String oldHpNo) {
        this.oldHpNo = oldHpNo;
    }

    /**
     * @return the oldMathDocTp
     */
    public String getOldMathDocTp() {
        return oldMathDocTp;
    }

    /**
     * @param oldMathDocTp the oldMathDocTp to set
     */
    public void setOldMathDocTp(String oldMathDocTp) {
        this.oldMathDocTp = oldMathDocTp;
    }

    /**
     * @return the oldSsnCrnNo
     */
    public String getOldSsnCrnNo() {
        return oldSsnCrnNo;
    }

    /**
     * @param oldSsnCrnNo the oldSsnCrnNo to set
     */
    public void setOldSsnCrnNo(String oldSsnCrnNo) {
        this.oldSsnCrnNo = oldSsnCrnNo;
    }

    /**
     * @return the ssnCrnNoC
     */
    public String getSsnCrnNoC() {
        return ssnCrnNoC;
    }

    /**
     * @param ssnCrnNoC the ssnCrnNoC to set
     */
    public void setSsnCrnNoC(String ssnCrnNoC) {
        this.ssnCrnNoC = ssnCrnNoC;
    }

    /**
     * @return the custNmC
     */
    public String getCustNmC() {
        return custNmC;
    }

    /**
     * @param custNmC the custNmC to set
     */
    public void setCustNmC(String custNmC) {
        this.custNmC = custNmC;
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
     * @return the custCd
     */
    public String getCustCd() {
        return custCd;
    }

    /**
     * @param custCd the custCd to set
     */
    public void setCustCd(String custCd) {
        this.custCd = custCd;
    }

    /**
     * @return the custCdC
     */
    public String getCustCdC() {
        return custCdC;
    }

    /**
     * @param custCdC the custCdC to set
     */
    public void setCustCdC(String custCdC) {
        this.custCdC = custCdC;
    }

    /**
     * @return the reqUsrId
     */
    public String getReqUsrId() {
        return reqUsrId;
    }

    /**
     * @param reqUsrId the reqUsrId to set
     */
    public void setReqUsrId(String reqUsrId) {
        this.reqUsrId = reqUsrId;
    }

    /**
     * @return the evalUsrId
     */
    public String getEvalUsrId() {
        return evalUsrId;
    }

    /**
     * @param evalUsrId the evalUsrId to set
     */
    public void setEvalUsrId(String evalUsrId) {
        this.evalUsrId = evalUsrId;
    }

    /**
     * @return the dmsSeq
     */
    public String getDmsSeq() {
        return dmsSeq;
    }

    /**
     * @param dmsSeq the dmsSeq to set
     */
    public void setDmsSeq(String dmsSeq) {
        this.dmsSeq = dmsSeq;
    }

    /**
     * @return the befMathDocTp
     */
    public String getBefMathDocTp() {
        return befMathDocTp;
    }

    /**
     * @param befMathDocTp the befMathDocTp to set
     */
    public void setBefMathDocTp(String befMathDocTp) {
        this.befMathDocTp = befMathDocTp;
    }

    /**
     * @return the befSsnCrnNo
     */
    public String getBefSsnCrnNo() {
        return befSsnCrnNo;
    }

    /**
     * @param befSsnCrnNo the befSsnCrnNo to set
     */
    public void setBefSsnCrnNo(String befSsnCrnNo) {
        this.befSsnCrnNo = befSsnCrnNo;
    }

    /**
     * @return the reqDt
     */
    public Date getReqDt() {
        return reqDt;
    }

    /**
     * @param reqDt the reqDt to set
     */
    public void setReqDt(Date reqDt) {
        this.reqDt = reqDt;
    }

    /**
     * @return the evalDt
     */
    public Date getEvalDt() {
        return evalDt;
    }

    /**
     * @param evalDt the evalDt to set
     */
    public void setEvalDt(Date evalDt) {
        this.evalDt = evalDt;
    }

    /**
     * @return the evalCont
     */
    public String getEvalCont() {
        return evalCont;
    }

    /**
     * @param evalCont the evalCont to set
     */
    public void setEvalCont(String evalCont) {
        this.evalCont = evalCont;
    }

    /**
     * @return the mathDocTpNm
     */
    public String getMathDocTpNm() {
        return mathDocTpNm;
    }

    /**
     * @param mathDocTpNm the mathDocTpNm to set
     */
    public void setMathDocTpNm(String mathDocTpNm) {
        this.mathDocTpNm = mathDocTpNm;
    }

    /**
     * @return the evalUsrNm
     */
    public String getEvalUsrNm() {
        return evalUsrNm;
    }

    /**
     * @param evalUsrNm the evalUsrNm to set
     */
    public void setEvalUsrNm(String evalUsrNm) {
        this.evalUsrNm = evalUsrNm;
    }

    /**
     * @return the befMathDocTpNm
     */
    public String getBefMathDocTpNm() {
        return befMathDocTpNm;
    }

    /**
     * @param befMathDocTpNm the befMathDocTpNm to set
     */
    public void setBefMathDocTpNm(String befMathDocTpNm) {
        this.befMathDocTpNm = befMathDocTpNm;
    }

    /**
     * @return the reqUsrNm
     */
    public String getReqUsrNm() {
        return reqUsrNm;
    }

    /**
     * @param reqUsrNm the reqUsrNm to set
     */
    public void setReqUsrNm(String reqUsrNm) {
        this.reqUsrNm = reqUsrNm;
    }

    /**
     * @return the statNm
     */
    public String getStatNm() {
        return statNm;
    }

    /**
     * @param statNm the statNm to set
     */
    public void setStatNm(String statNm) {
        this.statNm = statNm;
    }

}

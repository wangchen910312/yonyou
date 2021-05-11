package chn.bhmc.dms.bat.crm.cso.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * 판매기회추적
 *
 * @ClassName   : BatSalesOpptTraceMgmtVO
 * @Description : BatSalesOpptTraceMgmtVO
 * @author kyo jin lee
 * @since 2016.03.07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07     kyo jin lee      Created First
 * </pre>
 */


public class BatSalesOpptTraceMgmtVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5325374183451634077L;

       /**
        * 딜러코드
        **/
       private  String           dlrCd;

       /**
        * 일련번호
        **/
       private  String           seq;

       /**
        * 판매기회일련번호
        **/
       //SALE_OPPT_SEQ
       private  String           saleOpptSeq;

       /**
        * 추적내용
        **/
       //TRACE_CONT
       private  String           traceCont;

       /**
        * 추적등급코드
        **/
       //TRACE_GRADE_CD
       private  String           traceGradeCd;

       /**
        * 추적일자
        **/
       //TRACE_DT
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date             traceDt;

       /**
        * 추적방법코드
        **/
       //TRACE_MTH_CD
       private  String           traceMthCd;

       /**
        * 다음추적일자
        **/
       //NEXT_TRACE_DT
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date             nextTraceDt;

       /**
        * 다음추적방법코드
        **/
       //NEXT_TRACE_MTH_CD
       private  String           nextTraceMthCd;

       /**
        * 유효등급코드
        **/
       //VALID_GRADE_CD
       private  String           validGradeCd;

       /**
        * 무효원인코드
        **/
       //INVALID_CAU_CD
       private  String           invalidCauCd;

       /**
        * 삭제여부
        **/
       private  String           delYn;

       /**
        * 등록자ID
        **/
       private  String           regUsrId;

       /**
        * 등록일자
        **/
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date             regDt;

       /**
        * 수정자ID
        **/
       //UPDT_USR_ID
       private  String           updtUsrId;

       /**
        * 수정일자
        **/
       //UPDT_DT
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date             updtDt;

       private String langCd;

       private String leadStatCd;

       private String mngScNm;

       private String traceMthNm;
       private String traceGradeNm;
       private String nextTraceMthNm;

       /**
        * 고객명
        */
       private String custNm;

       private String custNo;

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
     * @return the seq
     */
    public String getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(String seq) {
        this.seq = seq;
    }

    /**
     * @return the saleOpptSeq
     */
    public String getSaleOpptSeq() {
        return saleOpptSeq;
    }

    /**
     * @param saleOpptSeq the saleOpptSeq to set
     */
    public void setSaleOpptSeq(String saleOpptSeq) {
        this.saleOpptSeq = saleOpptSeq;
    }

    /**
     * @return the traceCont
     */
    public String getTraceCont() {
        return traceCont;
    }

    /**
     * @param traceCont the traceCont to set
     */
    public void setTraceCont(String traceCont) {
        this.traceCont = traceCont;
    }

    /**
     * @return the traceGradeCd
     */
    public String getTraceGradeCd() {
        return traceGradeCd;
    }

    /**
     * @param traceGradeCd the traceGradeCd to set
     */
    public void setTraceGradeCd(String traceGradeCd) {
        this.traceGradeCd = traceGradeCd;
    }

    /**
     * @return the traceDt
     */
    public Date getTraceDt() {
        return traceDt;
    }

    /**
     * @param traceDt the traceDt to set
     */
    public void setTraceDt(Date traceDt) {
        this.traceDt = traceDt;
    }

    /**
     * @return the traceMthCd
     */
    public String getTraceMthCd() {
        return traceMthCd;
    }

    /**
     * @param traceMthCd the traceMthCd to set
     */
    public void setTraceMthCd(String traceMthCd) {
        this.traceMthCd = traceMthCd;
    }

    /**
     * @return the nextTraceDt
     */
    public Date getNextTraceDt() {
        return nextTraceDt;
    }

    /**
     * @param nextTraceDt the nextTraceDt to set
     */
    public void setNextTraceDt(Date nextTraceDt) {
        this.nextTraceDt = nextTraceDt;
    }

    /**
     * @return the nextTraceMthCd
     */
    public String getNextTraceMthCd() {
        return nextTraceMthCd;
    }

    /**
     * @param nextTraceMthCd the nextTraceMthCd to set
     */
    public void setNextTraceMthCd(String nextTraceMthCd) {
        this.nextTraceMthCd = nextTraceMthCd;
    }

    /**
     * @return the validGradeCd
     */
    public String getValidGradeCd() {
        return validGradeCd;
    }

    /**
     * @param validGradeCd the validGradeCd to set
     */
    public void setValidGradeCd(String validGradeCd) {
        this.validGradeCd = validGradeCd;
    }

    /**
     * @return the invalidCauCd
     */
    public String getInvalidCauCd() {
        return invalidCauCd;
    }

    /**
     * @param invalidCauCd the invalidCauCd to set
     */
    public void setInvalidCauCd(String invalidCauCd) {
        this.invalidCauCd = invalidCauCd;
    }

    /**
     * @return the delYn
     */
    public String getDelYn() {
        return delYn;
    }

    /**
     * @param delYn the delYn to set
     */
    public void setDelYn(String delYn) {
        this.delYn = delYn;
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
     * @return the langCd
     */
    public String getLangCd() {
        return langCd;
    }

    /**
     * @param langCd the langCd to set
     */
    public void setLangCd(String langCd) {
        this.langCd = langCd;
    }

    /**
     * @return the leadStatCd
     */
    public String getLeadStatCd() {
        return leadStatCd;
    }

    /**
     * @param leadStatCd the leadStatCd to set
     */
    public void setLeadStatCd(String leadStatCd) {
        this.leadStatCd = leadStatCd;
    }

    /**
     * @return the mngScNm
     */
    public String getMngScNm() {
        return mngScNm;
    }

    /**
     * @param mngScNm the mngScNm to set
     */
    public void setMngScNm(String mngScNm) {
        this.mngScNm = mngScNm;
    }

    /**
     * @return the traceMthNm
     */
    public String getTraceMthNm() {
        return traceMthNm;
    }

    /**
     * @param traceMthNm the traceMthNm to set
     */
    public void setTraceMthNm(String traceMthNm) {
        this.traceMthNm = traceMthNm;
    }

    /**
     * @return the traceGradeNm
     */
    public String getTraceGradeNm() {
        return traceGradeNm;
    }

    /**
     * @param traceGradeNm the traceGradeNm to set
     */
    public void setTraceGradeNm(String traceGradeNm) {
        this.traceGradeNm = traceGradeNm;
    }

    /**
     * @return the nextTraceMthNm
     */
    public String getNextTraceMthNm() {
        return nextTraceMthNm;
    }

    /**
     * @param nextTraceMthNm the nextTraceMthNm to set
     */
    public void setNextTraceMthNm(String nextTraceMthNm) {
        this.nextTraceMthNm = nextTraceMthNm;
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



}
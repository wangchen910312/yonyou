package chn.bhmc.dms.crm.css.vo;

import java.util.Date;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SatisFactionMobileResultSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 03. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author  description
 *  ===========    =============    ===========================
 *  2016. 3. 18.     Kim Hyun Ho     최초 생성
 * </pre>
 */
public class SatisFactionMobileResultSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2663335011460003285L;

    /**
    * 딜러코드
    **/
    private  String sDlrCd;

    /**
    * 사업장코드
    **/
    private  String sPltCd;

    /**
    * 만족도조사결과일련번호
    **/
    private  int    sStsfIvstRsltSeq;

    /**
    * 만족도조사일련번호
    **/
    private  int    sStsfIvstSeq;

    /**
    * 설문템플릿일련번호
    **/
    private  int    sSubyTmplSeq;

    /**
    * 고객번호
    **/
    private  String sCustNo;

    /**
    * 만족도조사점수값(조사점수)
    **/
    private  int    sStsfIvstScoreVal;

    /**
    * 만족도조사일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date   sStsfIvstDt;

    /**
    * 만족도조사사원ID
    **/
    private  String sStsfIvstEmpId;

    /**
    * VOC요청여부
    **/
    private  String sVocYn;

    /**
    * VOC일련번호
    **/
    private  int    sVocSeq;

    /**
    * VOC요청일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date   sVocRegDt;

    /**
    * 삭제여부
    **/
    private  String sDelYn;

    private  String sEmpId;
    private  String sSCmplReasonCont;
    private  String sStsfIvstNm;//만족도조사명
    private  String sStsfIvstMthCd;//만족도조사유형코드
    private  String sStsfIvstExpdCd; //만족도조사수단코드
    private  String sStsfIvstTpCd;//만족도조사타입코드
    private  int sSeq;//만족도조사 일련번호
    private  String sCmplReasonContYn;//불만족 사유여부
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date sStartDt;//시작기간
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date sEndDt;//종료기간


    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }


    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }


    /**
     * @return the sPltCd
     */
    public String getsPltCd() {
        return sPltCd;
    }


    /**
     * @param sPltCd the sPltCd to set
     */
    public void setsPltCd(String sPltCd) {
        this.sPltCd = sPltCd;
    }


    /**
     * @return the sStsfIvstRsltSeq
     */
    public int getsStsfIvstRsltSeq() {
        return sStsfIvstRsltSeq;
    }


    /**
     * @param sStsfIvstRsltSeq the sStsfIvstRsltSeq to set
     */
    public void setsStsfIvstRsltSeq(int sStsfIvstRsltSeq) {
        this.sStsfIvstRsltSeq = sStsfIvstRsltSeq;
    }


    /**
     * @return the sStsfIvstSeq
     */
    public int getsStsfIvstSeq() {
        return sStsfIvstSeq;
    }


    /**
     * @param sStsfIvstSeq the sStsfIvstSeq to set
     */
    public void setsStsfIvstSeq(int sStsfIvstSeq) {
        this.sStsfIvstSeq = sStsfIvstSeq;
    }


    /**
     * @return the sSubyTmplSeq
     */
    public int getsSubyTmplSeq() {
        return sSubyTmplSeq;
    }


    /**
     * @param sSubyTmplSeq the sSubyTmplSeq to set
     */
    public void setsSubyTmplSeq(int sSubyTmplSeq) {
        this.sSubyTmplSeq = sSubyTmplSeq;
    }


    /**
     * @return the sCustNo
     */
    public String getsCustNo() {
        return sCustNo;
    }


    /**
     * @param sCustNo the sCustNo to set
     */
    public void setsCustNo(String sCustNo) {
        this.sCustNo = sCustNo;
    }


    /**
     * @return the sStsfIvstScoreVal
     */
    public int getsStsfIvstScoreVal() {
        return sStsfIvstScoreVal;
    }


    /**
     * @param sStsfIvstScoreVal the sStsfIvstScoreVal to set
     */
    public void setsStsfIvstScoreVal(int sStsfIvstScoreVal) {
        this.sStsfIvstScoreVal = sStsfIvstScoreVal;
    }


    /**
     * @return the sStsfIvstDt
     */
    public Date getsStsfIvstDt() {
        return sStsfIvstDt;
    }


    /**
     * @param sStsfIvstDt the sStsfIvstDt to set
     */
    public void setsStsfIvstDt(Date sStsfIvstDt) {
        this.sStsfIvstDt = sStsfIvstDt;
    }


    /**
     * @return the sStsfIvstEmpId
     */
    public String getsStsfIvstEmpId() {
        return sStsfIvstEmpId;
    }


    /**
     * @param sStsfIvstEmpId the sStsfIvstEmpId to set
     */
    public void setsStsfIvstEmpId(String sStsfIvstEmpId) {
        this.sStsfIvstEmpId = sStsfIvstEmpId;
    }


    /**
     * @return the sVocYn
     */
    public String getsVocYn() {
        return sVocYn;
    }


    /**
     * @param sVocYn the sVocYn to set
     */
    public void setsVocYn(String sVocYn) {
        this.sVocYn = sVocYn;
    }


    /**
     * @return the sVocSeq
     */
    public int getsVocSeq() {
        return sVocSeq;
    }


    /**
     * @param sVocSeq the sVocSeq to set
     */
    public void setsVocSeq(int sVocSeq) {
        this.sVocSeq = sVocSeq;
    }


    /**
     * @return the sVocRegDt
     */
    public Date getsVocRegDt() {
        return sVocRegDt;
    }


    /**
     * @param sVocRegDt the sVocRegDt to set
     */
    public void setsVocRegDt(Date sVocRegDt) {
        this.sVocRegDt = sVocRegDt;
    }


    /**
     * @return the sDelYn
     */
    public String getsDelYn() {
        return sDelYn;
    }


    /**
     * @param sDelYn the sDelYn to set
     */
    public void setsDelYn(String sDelYn) {
        this.sDelYn = sDelYn;
    }




    /**
     * @return the sEmpId
     */
    public String getsEmpId() {
        return sEmpId;
    }


    /**
     * @param sEmpId the sEmpId to set
     */
    public void setsEmpId(String sEmpId) {
        this.sEmpId = sEmpId;
    }



    /**
     * @return the sSCmplReasonCont
     */
    public String getsSCmplReasonCont() {
        return sSCmplReasonCont;
    }


    /**
     * @param sSCmplReasonCont the sSCmplReasonCont to set
     */
    public void setsSCmplReasonCont(String sSCmplReasonCont) {
        this.sSCmplReasonCont = sSCmplReasonCont;
    }


    /**
     * @return the sStsfIvstNm
     */
    public String getsStsfIvstNm() {
        return sStsfIvstNm;
    }


    /**
     * @param sStsfIvstNm the sStsfIvstNm to set
     */
    public void setsStsfIvstNm(String sStsfIvstNm) {
        this.sStsfIvstNm = sStsfIvstNm;
    }


    /**
     * @return the sStsfIvstMthCd
     */
    public String getsStsfIvstMthCd() {
        return sStsfIvstMthCd;
    }


    /**
     * @param sStsfIvstMthCd the sStsfIvstMthCd to set
     */
    public void setsStsfIvstMthCd(String sStsfIvstMthCd) {
        this.sStsfIvstMthCd = sStsfIvstMthCd;
    }


    /**
     * @return the sStsfIvstExpdCd
     */
    public String getsStsfIvstExpdCd() {
        return sStsfIvstExpdCd;
    }


    /**
     * @param sStsfIvstExpdCd the sStsfIvstExpdCd to set
     */
    public void setsStsfIvstExpdCd(String sStsfIvstExpdCd) {
        this.sStsfIvstExpdCd = sStsfIvstExpdCd;
    }


    /**
     * @return the sStsfIvstTpCd
     */
    public String getsStsfIvstTpCd() {
        return sStsfIvstTpCd;
    }


    /**
     * @param sStsfIvstTpCd the sStsfIvstTpCd to set
     */
    public void setsStsfIvstTpCd(String sStsfIvstTpCd) {
        this.sStsfIvstTpCd = sStsfIvstTpCd;
    }


    /**
     * @return the sCmplReasonContYn
     */
    public String getsCmplReasonContYn() {
        return sCmplReasonContYn;
    }


    /**
     * @param sCmplReasonContYn the sCmplReasonContYn to set
     */
    public void setsCmplReasonContYn(String sCmplReasonContYn) {
        this.sCmplReasonContYn = sCmplReasonContYn;
    }


    /**
     * @return the sStartDt
     */
    public Date getsStartDt() {
        return sStartDt;
    }


    /**
     * @param sStartDt the sStartDt to set
     */
    public void setsStartDt(Date sStartDt) {
        this.sStartDt = sStartDt;
    }


    /**
     * @return the sEndDt
     */
    public Date getsEndDt() {
        return sEndDt;
    }


    /**
     * @param sEndDt the sEndDt to set
     */
    public void setsEndDt(Date sEndDt) {
        this.sEndDt = sEndDt;
    }



    /**
     * @return the sSeq
     */
    public int getsSeq() {
        return sSeq;
    }


    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(int sSeq) {
        this.sSeq = sSeq;
    }


    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }

}

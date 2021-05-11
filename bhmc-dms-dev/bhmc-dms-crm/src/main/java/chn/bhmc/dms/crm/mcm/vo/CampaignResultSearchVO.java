package chn.bhmc.dms.crm.mcm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 캠패인결과 조회 SearchVO
 *
 * @ClassName   : CampaignResultSearchVO.java
 * @Description : CampaignResultSearchVO Class
 * @author hyoung jun an
 * @since 2016.03.04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.04     hyoung jun an    최초 생성
 * </pre>
 */

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CampaignResultSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Moon Lee
 * @since 2017. 7. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 7. 25.     In Moon Lee     최초 생성
 * </pre>
 */
public class CampaignResultSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1114288647665492073L;

    private  String          sDlrCd;        // 딜러코드
    private  String          sPltCd;        // 사업장코드
    private  String          cmmCd;         // 유형코드
    private  String          langCd;        // 언어코드
    private  String          sMakCd;        // 마케팅코드
    private  String          sMakNm;        // 마케팅명
    private  String          sHostCd;       // 주최코드
    private  String          sHostTeamCd;   // 주최팀코드
    private  String          sMakTpCd;      // 마케팅유형코드
    private  String          sMakSubTpCd;   // 마케팅유형코드 makSubTpCd
    private  String          sStatCd;       // 상태코드
    private  String          sBizCd;        // 업무코드
    private  String          sCallSeq;        // 업무코드
    private  int             sStsfIvstRsltSeq;  // 만족도조사결과일련번호
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartDt;                  // 마케팅 시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndDt;                    // 마케팅 종료일자
    private String  sDocId;                 // 첨부파일 아이디
    private  String sMakTpSubTpNm;           // 마케팅sub유형

    /**
     * 조사유형
     **/
    private  String sStsfIvstMthCd;

    /**
     * 만족도조사일련번호
     **/
    private  int sStsfIvstSeq;

    /**
     * 설문템플릿일련번호
     **/
    private  int sSubyTmplSeq;

    /**
     * 일련번호
     **/
    private  int sSeq;

    /**
     * 조사유형
     **/
    private  String sIvstTp;

    /**
     * 직원번호
     **/
    private  String sEmpId;

    /**
     * 직원명
     **/
    private  String sEmpNm;


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
     * @return the sMakNm
     */
    public String getsMakNm() {
        return sMakNm;
    }
    /**
     * @param sMakNm the sMakNm to set
     */
    public void setsMakNm(String sMakNm) {
        this.sMakNm = sMakNm;
    }
    /**
     * @return the sMakCd
     */
    public String getsMakCd() {
        return sMakCd;
    }
    /**
     * @param sMakCd the sMakCd to set
     */
    public void setsMakCd(String sMakCd) {
        this.sMakCd = sMakCd;
    }
    /**
     * @return the sHostCd
     */
    public String getsHostCd() {
        return sHostCd;
    }
    /**
     * @param sHostCd the sHostCd to set
     */
    public void setsHostCd(String sHostCd) {
        this.sHostCd = sHostCd;
    }
    /**
     * @return the sHostTeamCd
     */
    public String getsHostTeamCd() {
        return sHostTeamCd;
    }
    /**
     * @param sHostTeamCd the sHostTeamCd to set
     */
    public void setsHostTeamCd(String sHostTeamCd) {
        this.sHostTeamCd = sHostTeamCd;
    }
    /**
     * @return the sMakTpCd
     */
    public String getsMakTpCd() {
        return sMakTpCd;
    }
    /**
     * @param sMakTpCd the sMakTpCd to set
     */
    public void setsMakTpCd(String sMakTpCd) {
        this.sMakTpCd = sMakTpCd;
    }
    /**
     * @return the sMakSubTpCd
     */
    public String getsMakSubTpCd() {
        return sMakSubTpCd;
    }
    /**
     * @param sMakSubTpCd the sMakSubTpCd to set
     */
    public void setsMakSubTpCd(String sMakSubTpCd) {
        this.sMakSubTpCd = sMakSubTpCd;
    }
    /**
     * @return the sStatCd
     */
    public String getsStatCd() {
        return sStatCd;
    }
    /**
     * @param sStatCd the sStatCd to set
     */
    public void setsStatCd(String sStatCd) {
        this.sStatCd = sStatCd;
    }
    /**
     * @return the cmmCd
     */
    public String getCmmCd() {
        return cmmCd;
    }
    /**
     * @param cmmCd the cmmCd to set
     */
    public void setCmmCd(String cmmCd) {
        this.cmmCd = cmmCd;
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

    /**
     * @return the sIvstTp
     */
    public String getsIvstTp() {
        return sIvstTp;
    }
    /**
     * @param sIvstTp the sIvstTp to set
     */
    public void setsIvstTp(String sIvstTp) {
        this.sIvstTp = sIvstTp;
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
     * @return the sEmpNm
     */
    public String getsEmpNm() {
        return sEmpNm;
    }
    /**
     * @param sEmpNm the sEmpNm to set
     */
    public void setsEmpNm(String sEmpNm) {
        this.sEmpNm = sEmpNm;
    }
    /**
     * @return the sDocId
     */
    public String getsDocId() {
        return sDocId;
    }
    /**
     * @param sDocId the sDocId to set
     */
    public void setsDocId(String sDocId) {
        this.sDocId = sDocId;
    }
    /**
     * @param sMakTpSubTpNm the sMakTpSubTpNm to set
     */
    public void setsMakTpSubTpNm(String sMakTpSubTpNm) {
        this.sMakTpSubTpNm = sMakTpSubTpNm;
    }
    /**
     * @return the sMakTpSubTpNm
     */
    public String getsMakTpSubTpNm() {
        return sMakTpSubTpNm;
    }
    /**
     * @return the sBizCd
     */
    public String getsBizCd() {
        return sBizCd;
    }
    /**
     * @param sBizCd the sBizCd to set
     */
    public void setsBizCd(String sBizCd) {
        this.sBizCd = sBizCd;
    }
    /**
     * @return the sCallSeq
     */
    public String getsCallSeq() {
        return sCallSeq;
    }
    /**
     * @param sCallSeq the sCallSeq to set
     */
    public void setsCallSeq(String sCallSeq) {
        this.sCallSeq = sCallSeq;
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

}
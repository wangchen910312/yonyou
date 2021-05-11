package chn.bhmc.dms.crm.mcm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 마케팅 캠패인  VO
 *
 * @ClassName   : CampaignResultVO.java
 * @Description : CampaignResultVO Class
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

@ValidDescriptor({
     @ValidField(field="dlrCd"            , mesgKey="global.lbl.dlrCd")
    ,@ValidField(field="pltCd"            , mesgKey="global.lbl.pltCd")
    ,@ValidField(field="makCd"            , mesgKey="global.lbl.crNo")
    ,@ValidField(field="makNm"            , mesgKey="global.lbl.makNm")
    ,@ValidField(field="hostCd"           , mesgKey="global.lbl.hostCd")
    ,@ValidField(field="hostTeamCd"       , mesgKey="global.lbl.hostTeamCd")
    ,@ValidField(field="makTpCd"          , mesgKey="global.lbl.type")
    ,@ValidField(field="makSubTpCd"       , mesgKey="global.lbl.type")
    ,@ValidField(field="rcpeNm"           , mesgKey="global.lbl.rcpeNm")
    ,@ValidField(field="startDt"          , mesgKey="global.lbl.startDt")
    ,@ValidField(field="endDt"            , mesgKey="global.lbl.EndDt")
    ,@ValidField(field="prid"             , mesgKey="global.lbl.term")
    ,@ValidField(field="placeNm"          , mesgKey="global.lbl.placeNm")
    ,@ValidField(field="aapCmpNm"         , mesgKey="global.lbl.aapCmpNm")
    ,@ValidField(field="budgetAmt"        , mesgKey="global.lbl.budgetAmt")
    ,@ValidField(field="statCd"           , mesgKey="global.lbl.statNm")
    ,@ValidField(field="targCustCnt"      , mesgKey="global.lbl.targCustCnt")
    ,@ValidField(field="pgssRate"         , mesgKey="global.lbl.pgssRate")
    ,@ValidField(field="activeNm"         , mesgKey="global.lbl.activeNm")
    ,@ValidField(field="activeCont"       , mesgKey="global.lbl.activeCont")
    ,@ValidField(field="activeFileDocNo"  , mesgKey="global.lbl.activeFileDocNo")
    ,@ValidField(field="adInvtHm"         , mesgKey="global.lbl.adInvtHm")
    ,@ValidField(field="adMediaCd"        , mesgKey="global.lbl.adMediaCd")
    ,@ValidField(field="adCostAmt"        , mesgKey="global.lbl.adCostAmt")
    ,@ValidField(field="adStartDt"        , mesgKey="global.lbl.adStartDt")
    ,@ValidField(field="adEndDt"          , mesgKey="global.lbl.adEndDt")
    ,@ValidField(field="apprDocNo"        , mesgKey="global.lbl.apprDocNo")
    ,@ValidField(field="delYn"            , mesgKey="global.lbl.delYn")
    ,@ValidField(field="rcpeAutoYn"       , mesgKey="global.lbl.rcpeAutoYn")

    ,@ValidField(field="seq"              , mesgKey="global.lbl.seq")
    ,@ValidField(field="targCd"           , mesgKey="global.lbl.targ")
    ,@ValidField(field="targNm"           , mesgKey="global.lbl.targ")
    ,@ValidField(field="targCntVal"       , mesgKey="global.lbl.targCntVal")
    ,@ValidField(field="targRsltVal"      , mesgKey="global.lbl.targRsltVal")

    ,@ValidField(field="budgetCd"         , mesgKey="global.lbl.budgetCd")
    ,@ValidField(field="budgetDetlCont"   , mesgKey="global.lbl.budgetDetlCont")
    ,@ValidField(field="budgetAmt"        , mesgKey="global.lbl.budgetAmt")
    ,@ValidField(field="corpBudnRate"     , mesgKey="global.lbl.corpBudnRate")
    ,@ValidField(field="imsSuptAmt"       , mesgKey="global.lbl.imsSuptAmt")

    ,@ValidField(field="ivstTp"           , mesgKey="global.lbl.ivstTp")
    ,@ValidField(field="prsnOpnCont"      , mesgKey="crm.lbl.prsnCont")
    ,@ValidField(field="stsfIvstRsltSeq"  , mesgKey="global.lbl.stsfIvstRsltSeq")
    ,@ValidField(field="empId"            , mesgKey="global.lbl.empId")
    })

public class CampaignResultVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6448748896497224041L;

    //캠페인 마스터(CR_0701T)
    /**
     * 딜러코드
     **/
     //@NotEmpty

     private  String            hDlrCd;
     private  String            custExtrTermNo;
     private  String            custExtrTitleNm;
     private  String            extrDgreCnt;

     /**
      * 사업장코드
      **/
      //@NotEmpty

      private  String            hPltCd;

    /**
     * 마케팅코드
     **/
     //@NotEmpty

     private  String            hMakCd;

    /**
    * 마케팅코드
    **/
    //@NotEmpty

    private  String            makCd;

    /**
    * 마케팅명
    **/
    //MAK_NM

    private  String            makNm;

    /**
    * 주최코드
    **/
    //HOST_CD

    private  String            hostCd;

    /**
    * 주최팀코드
    **/
    //HOST_TEAM_CD

    private  String            hostTeamCd;

    /**
    * 마케팅유형코드
    **/
    //MAK_TP_CD

    private  String            makTpCd;

    /**
    * 마케팅서브유형코드
    **/
    //MAK_SUB_TP_CD

    private  String            makSubTpCd;

    /**
    * 대상자명
    **/
    //RCPE_NM

    private  String            rcpeNm;

    /**
    * 시작일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            startDt;

    /**
    * 종료일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            endDt;

    /**
    * 기간
    **/
    //PRID

    private  int               prid;

    /**
    * 장소명
    **/
    //PLACE_NM

    private  String            placeNm;

    /**
    * 대행업체명
    **/
    //AAP_CMP_NM

    private  String            aapCmpNm;

    /**
    * 예산금액
    **/
    //BUDGET_AMT

    private  int               budgetAmt;

    /**
    * 상태코드
    **/
    //STAT_CD

    private  String            statCd;

    /**
    * 목표고객수
    **/
    //TARG_CUST_CNT

    private  int               targCustCnt;

    /**
    * 진도율
    **/
    //PGSS_RATE

    private  int               pgssRate;

    /**
    * 활동명
    **/
    //ACTIVE_NM

    private  String            activeNm;

    /**
    * 활동내용
    **/
    //ACTIVE_CONT

    private  String            activeCont;

    /**
    * 활동첨부문서번호[CM_0901T]
    **/
    //ACTIVE_FILE_DOC_NO

    private  String            activeFileDocNo;

    /**
    * 광고투자시간
    **/
    //AD_INVT_HM

    private  int               adInvtHm;

    /**
    * 광고매체코드
    **/
    //AD_MEDIA_CD

    private  String            adMediaCd;

    /**
    * 광고비용금액
    **/
    //AD_COST_AMT

    private  int               adCostAmt;

    /**
    * 광고시작일자
    **/
    //AD_START_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            adStartDt;

    /**
    * 광고종료일자
    **/
    //AD_END_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            adEndDt;

    /**
     * 광고투자시간VIEW
     **/
     //AD_INVT_HM

     private  int               vAdInvtHm;

     /**
     * 광고매체코드VIEW
     **/
     //AD_MEDIA_CD

     private  String            vAdMediaCd;

     /**
     * 광고비용금액VIEW
     **/
     //AD_COST_AMT

     private  int               vAdCostAmt;

     /**
     * 광고시작일자VIEW
     **/
     //AD_START_DT
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private  Date            vAdStartDt;

     /**
     * 광고종료일자VIEW
     **/
     //AD_END_DT
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private  Date            vAdEndDt;

    /**
    * 결재문서번호[CM_1001T]
    **/
    //APPR_DOC_NO

    private  String            apprDocNo;

    /**
    * 삭제여부
    **/
    //@NotEmpty

    private  String            delYn;

    /**
     * 대상자 자동추출 여부
     **/
     //@NotEmpty

     private  String           rcpeAutoYn;

    /**
    * 등록자ID
    **/
    //@NotEmpty

    private  String            regUsrId;

    /**
    * 등록일자
    **/
    private  Date              regDt;

    /**
    * 수정자ID
    **/
    //UPDT_USR_ID

    private  String            updtUsrId;

    /**
    * 수정일자
    **/
    //UPDT_DT
//    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              updtDt;

    private  String            cmmCd;
    private  String            cmmCdNm;
    private  String            hostNm;
    private  String            makTpSubTpNm;
    private  String            statNm;
    private  String            talkPlan;
    private  String            dlrCd;
    private  String            pltCd;
    private  String            langCd;
    private  String            result;
    private  String            stsfIvstYn;

    private  String             docId;

    private  double                actTotAmt;

    /**
     * @return the hMakCd
     */
    public String gethMakCd() {
        return hMakCd;
    }

    /**
     * @param hMakCd the hMakCd to set
     */
    public void sethMakCd(String hMakCd) {
        this.hMakCd = hMakCd;
    }

    /**
     * @return the makCd
     */
    public String getMakCd() {
        return makCd;
    }

    /**
     * @param makCd the makCd to set
     */
    public void setMakCd(String makCd) {
        this.makCd = makCd;
    }

    /**
     * @return the makNm
     */
    public String getMakNm() {
        return makNm;
    }

    /**
     * @param makNm the makNm to set
     */
    public void setMakNm(String makNm) {
        this.makNm = makNm;
    }

    /**
     * @return the hostCd
     */
    public String getHostCd() {
        return hostCd;
    }

    /**
     * @param hostCd the hostCd to set
     */
    public void setHostCd(String hostCd) {
        this.hostCd = hostCd;
    }

    /**
     * @return the hostTeamCd
     */
    public String getHostTeamCd() {
        return hostTeamCd;
    }

    /**
     * @param hostTeamCd the hostTeamCd to set
     */
    public void setHostTeamCd(String hostTeamCd) {
        this.hostTeamCd = hostTeamCd;
    }

    /**
     * @return the makTpCd
     */
    public String getMakTpCd() {
        return makTpCd;
    }

    /**
     * @param makTpCd the makTpCd to set
     */
    public void setMakTpCd(String makTpCd) {
        this.makTpCd = makTpCd;
    }

    /**
     * @return the makSubTpCd
     */
    public String getMakSubTpCd() {
        return makSubTpCd;
    }

    /**
     * @param makSubTpCd the makSubTpCd to set
     */
    public void setMakSubTpCd(String makSubTpCd) {
        this.makSubTpCd = makSubTpCd;
    }

    /**
     * @return the rcpeNm
     */
    public String getRcpeNm() {
        return rcpeNm;
    }

    /**
     * @param rcpeNm the rcpeNm to set
     */
    public void setRcpeNm(String rcpeNm) {
        this.rcpeNm = rcpeNm;
    }

    /**
     * @return the startDt
     */
    public Date getStartDt() {
        return startDt;
    }

    /**
     * @param startDt the startDt to set
     */
    public void setStartDt(Date startDt) {
        this.startDt = startDt;
    }

    /**
     * @return the endDt
     */
    public Date getEndDt() {
        return endDt;
    }

    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(Date endDt) {
        this.endDt = endDt;
    }

    /**
     * @return the prid
     */
    public int getPrid() {
        return prid;
    }

    /**
     * @param prid the prid to set
     */
    public void setPrid(int prid) {
        this.prid = prid;
    }

    /**
     * @return the placeNm
     */
    public String getPlaceNm() {
        return placeNm;
    }

    /**
     * @param placeNm the placeNm to set
     */
    public void setPlaceNm(String placeNm) {
        this.placeNm = placeNm;
    }

    /**
     * @return the aapCmpNm
     */
    public String getAapCmpNm() {
        return aapCmpNm;
    }

    /**
     * @param aapCmpNm the aapCmpNm to set
     */
    public void setAapCmpNm(String aapCmpNm) {
        this.aapCmpNm = aapCmpNm;
    }

    /**
     * @return the budgetAmt
     */
    public int getBudgetAmt() {
        return budgetAmt;
    }

    /**
     * @param budgetAmt the budgetAmt to set
     */
    public void setBudgetAmt(int budgetAmt) {
        this.budgetAmt = budgetAmt;
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
     * @return the targCustCnt
     */
    public int getTargCustCnt() {
        return targCustCnt;
    }

    /**
     * @param targCustCnt the targCustCnt to set
     */
    public void setTargCustCnt(int targCustCnt) {
        this.targCustCnt = targCustCnt;
    }

    /**
     * @return the pgssRate
     */
    public int getPgssRate() {
        return pgssRate;
    }

    /**
     * @param pgssRate the pgssRate to set
     */
    public void setPgssRate(int pgssRate) {
        this.pgssRate = pgssRate;
    }

    /**
     * @return the activeNm
     */
    public String getActiveNm() {
        return activeNm;
    }

    /**
     * @param activeNm the activeNm to set
     */
    public void setActiveNm(String activeNm) {
        this.activeNm = activeNm;
    }

    /**
     * @return the activeCont
     */
    public String getActiveCont() {
        return activeCont;
    }

    /**
     * @param activeCont the activeCont to set
     */
    public void setActiveCont(String activeCont) {
        this.activeCont = activeCont;
    }

    /**
     * @return the activeFileDocNo
     */
    public String getActiveFileDocNo() {
        return activeFileDocNo;
    }

    /**
     * @param activeFileDocNo the activeFileDocNo to set
     */
    public void setActiveFileDocNo(String activeFileDocNo) {
        this.activeFileDocNo = activeFileDocNo;
    }

    /**
     * @return the adInvtHm
     */
    public int getAdInvtHm() {
        return adInvtHm;
    }

    /**
     * @param adInvtHm the adInvtHm to set
     */
    public void setAdInvtHm(int adInvtHm) {
        this.adInvtHm = adInvtHm;
    }

    /**
     * @return the adMediaCd
     */
    public String getAdMediaCd() {
        return adMediaCd;
    }

    /**
     * @param adMediaCd the adMediaCd to set
     */
    public void setAdMediaCd(String adMediaCd) {
        this.adMediaCd = adMediaCd;
    }

    /**
     * @return the adCostAmt
     */
    public int getAdCostAmt() {
        return adCostAmt;
    }

    /**
     * @param adCostAmt the adCostAmt to set
     */
    public void setAdCostAmt(int adCostAmt) {
        this.adCostAmt = adCostAmt;
    }

    /**
     * @return the adStartDt
     */
    public Date getAdStartDt() {
        return adStartDt;
    }

    /**
     * @param adStartDt the adStartDt to set
     */
    public void setAdStartDt(Date adStartDt) {
        this.adStartDt = adStartDt;
    }

    /**
     * @return the adEndDt
     */
    public Date getAdEndDt() {
        return adEndDt;
    }

    /**
     * @param adEndDt the adEndDt to set
     */
    public void setAdEndDt(Date adEndDt) {
        this.adEndDt = adEndDt;
    }

    /**
     * @return the vAdInvtHm
     */
    public int getvAdInvtHm() {
        return vAdInvtHm;
    }

    /**
     * @param vAdInvtHm the vAdInvtHm to set
     */
    public void setvAdInvtHm(int vAdInvtHm) {
        this.vAdInvtHm = vAdInvtHm;
    }

    /**
     * @return the vAdMediaCd
     */
    public String getvAdMediaCd() {
        return vAdMediaCd;
    }

    /**
     * @param vAdMediaCd the vAdMediaCd to set
     */
    public void setvAdMediaCd(String vAdMediaCd) {
        this.vAdMediaCd = vAdMediaCd;
    }

    /**
     * @return the vAdCostAmt
     */
    public int getvAdCostAmt() {
        return vAdCostAmt;
    }

    /**
     * @param vAdCostAmt the vAdCostAmt to set
     */
    public void setvAdCostAmt(int vAdCostAmt) {
        this.vAdCostAmt = vAdCostAmt;
    }

    /**
     * @return the vAdStartDt
     */
    public Date getvAdStartDt() {
        return vAdStartDt;
    }

    /**
     * @param vAdStartDt the vAdStartDt to set
     */
    public void setvAdStartDt(Date vAdStartDt) {
        this.vAdStartDt = vAdStartDt;
    }

    /**
     * @return the vAdEndDt
     */
    public Date getvAdEndDt() {
        return vAdEndDt;
    }

    /**
     * @param vAdEndDt the vAdEndDt to set
     */
    public void setvAdEndDt(Date vAdEndDt) {
        this.vAdEndDt = vAdEndDt;
    }

    /**
     * @return the apprDocNo
     */
    public String getApprDocNo() {
        return apprDocNo;
    }

    /**
     * @param apprDocNo the apprDocNo to set
     */
    public void setApprDocNo(String apprDocNo) {
        this.apprDocNo = apprDocNo;
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
     * @return the rcpeAutoYn
     */
    public String getRcpeAutoYn() {
        return rcpeAutoYn;
    }

    /**
     * @param rcpeAutoYn the rcpeAutoYn to set
     */
    public void setRcpeAutoYn(String rcpeAutoYn) {
        this.rcpeAutoYn = rcpeAutoYn;
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
     * @return the cmmCdNm
     */
    public String getCmmCdNm() {
        return cmmCdNm;
    }

    /**
     * @param cmmCdNm the cmmCdNm to set
     */
    public void setCmmCdNm(String cmmCdNm) {
        this.cmmCdNm = cmmCdNm;
    }

    /**
     * @return the hostNm
     */
    public String getHostNm() {
        return hostNm;
    }

    /**
     * @param hostNm the hostNm to set
     */
    public void setHostNm(String hostNm) {
        this.hostNm = hostNm;
    }

    /**
     * @return the makTpSubTpNm
     */
    public String getMakTpSubTpNm() {
        return makTpSubTpNm;
    }

    /**
     * @param makTpSubTpNm the makTpSubTpNm to set
     */
    public void setMakTpSubTpNm(String makTpSubTpNm) {
        this.makTpSubTpNm = makTpSubTpNm;
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

    /**
     * @return the talkPlan
     */
    public String getTalkPlan() {
        return talkPlan;
    }

    /**
     * @param talkPlan the talkPlan to set
     */
    public void setTalkPlan(String talkPlan) {
        this.talkPlan = talkPlan;
    }

    /**
     * @return the hDlrCd
     */
    public String gethDlrCd() {
        return hDlrCd;
    }

    /**
     * @param hDlrCd the hDlrCd to set
     */
    public void sethDlrCd(String hDlrCd) {
        this.hDlrCd = hDlrCd;
    }

    /**
     * @return the hPltCd
     */
    public String gethPltCd() {
        return hPltCd;
    }

    /**
     * @param hPltCd the hPltCd to set
     */
    public void sethPltCd(String hPltCd) {
        this.hPltCd = hPltCd;
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






    // 마케팅캠페인 기본목표(리스트용)
    /**
     * 전화상담 수량
     **/
    private  int          telCsltCnt;

    /**
     * 내방 수량
     **/
    private  int          visitCnt;

    /**
     * 기록저장 수량
     **/
    private  int          recordSaveCnt;

    /**
     * 영업기회 수량
     **/
    private  int          salesOpptCnt;

    /**
     * 거래 수량
     **/
    private  int          venCnt;

    /**
     * 거래 금액
     **/
    private  int          venAmt;

    /**
     * E-mail발송 수량
     **/
    private  int          emailSendCnt;

    /**
     * 내방예약 수량
     **/
    private  int          visitResvCnt;

    /**
     * SMS발송성공수량
     **/
    private  int          smsSuccessCnt;

    /**
     * 정비완료수량
     **/
    private  int          serCompCnt;


    /**
     * @return the telCsltCnt
     */
    public int getTelCsltCnt() {
        return telCsltCnt;
    }

    /**
     * @param telCsltCnt the telCsltCnt to set
     */
    public void setTelCsltCnt(int telCsltCnt) {
        this.telCsltCnt = telCsltCnt;
    }

    /**
     * @return the visitCnt
     */
    public int getVisitCnt() {
        return visitCnt;
    }

    /**
     * @param visitCnt the visitCnt to set
     */
    public void setVisitCnt(int visitCnt) {
        this.visitCnt = visitCnt;
    }

    /**
     * @return the recordSaveCnt
     */
    public int getRecordSaveCnt() {
        return recordSaveCnt;
    }

    /**
     * @param recordSaveCnt the recordSaveCnt to set
     */
    public void setRecordSaveCnt(int recordSaveCnt) {
        this.recordSaveCnt = recordSaveCnt;
    }

    /**
     * @return the salesOpptCnt
     */
    public int getSalesOpptCnt() {
        return salesOpptCnt;
    }

    /**
     * @param salesOpptCnt the salesOpptCnt to set
     */
    public void setSalesOpptCnt(int salesOpptCnt) {
        this.salesOpptCnt = salesOpptCnt;
    }

    /**
     * @return the venCnt
     */
    public int getVenCnt() {
        return venCnt;
    }

    /**
     * @param venCnt the venCnt to set
     */
    public void setVenCnt(int venCnt) {
        this.venCnt = venCnt;
    }

    /**
     * @return the venAmt
     */
    public int getVenAmt() {
        return venAmt;
    }

    /**
     * @param venAmt the venAmt to set
     */
    public void setVenAmt(int venAmt) {
        this.venAmt = venAmt;
    }

    /**
     * @return the emailSendCnt
     */
    public int getEmailSendCnt() {
        return emailSendCnt;
    }

    /**
     * @param emailSendCnt the emailSendCnt to set
     */
    public void setEmailSendCnt(int emailSendCnt) {
        this.emailSendCnt = emailSendCnt;
    }

    /**
     * @return the visitResvCnt
     */
    public int getVisitResvCnt() {
        return visitResvCnt;
    }

    /**
     * @param visitResvCnt the visitResvCnt to set
     */
    public void setVisitResvCnt(int visitResvCnt) {
        this.visitResvCnt = visitResvCnt;
    }






    // 마케팅캠페인 - 목표(CR_0711T)
    /**
    * 일련번호
    **/
//    @NotEmpty

    private  int          seq;

    /**
    * 목표코드
    **/
    //TARG_CD
    private  String       targCd;

    /**
    * 목표명
    **/
    //TARG_NM

    private  String       targNm;

    /**
    * 목표수치값
    **/
    //TARG_CNT_VAL

    private  int          targCntVal;

    /**
    * 목표결과값
    **/
    //TARG_RSLT_VAL

    private  int          targRsltVal;


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
     * @return the targCd
     */
    public String getTargCd() {
        return targCd;
    }

    /**
     * @param targCd the targCd to set
     */
    public void setTargCd(String targCd) {
        this.targCd = targCd;
    }

    /**
     * @return the targNm
     */
    public String getTargNm() {
        return targNm;
    }

    /**
     * @param targNm the targNm to set
     */
    public void setTargNm(String targNm) {
        this.targNm = targNm;
    }

    /**
     * @return the targCntVal
     */
    public int getTargCntVal() {
        return targCntVal;
    }

    /**
     * @param targCntVal the targCntVal to set
     */
    public void setTargCntVal(int targCntVal) {
        this.targCntVal = targCntVal;
    }

    /**
     * @return the targRsltVal
     */
    public int getTargRsltVal() {
        return targRsltVal;
    }

    /**
     * @param targRsltVal the targRsltVal to set
     */
    public void setTargRsltVal(int targRsltVal) {
        this.targRsltVal = targRsltVal;
    }




    //마케팅캠페인 - 결과(CR_0712T)
    /**
    * 조사유형
    **/
    //IVST_TP
    private  String            ivstTp;

    /**
    * 담당자의견내용
    **/
    //PRSN_OPN_CONT

    private  String            prsnOpnCont;

    /**
    * 만족도조사결과일련번호
    **/
    //STSF_IVST_RSLT_SEQ

    private  int               stsfIvstRsltSeq;

    /**
    * 사원ID
    **/
    //EMP_ID

    private  String            empId;

    /**
     * 사원명
     **/
     //EMP_ID

     private  String            empNm;

     /**
      * 만족도조사점수값
      **/
      private  boolean                stsfIvstScoreVal;

      /**
      * 만족도조사일자
      **/
      @JsonDeserialize(using=JsonDateDeserializer.class)
      private  Date               stsfIvstDt;


    /**
     * @return the ivstTp
     */
    public String getIvstTp() {
        return ivstTp;
    }

    /**
     * @param ivstTp the ivstTp to set
     */
    public void setIvstTp(String ivstTp) {
        this.ivstTp = ivstTp;
    }

    /**
     * @return the prsnOpnCont
     */
    public String getPrsnOpnCont() {
        return prsnOpnCont;
    }

    /**
     * @param prsnOpnCont the prsnOpnCont to set
     */
    public void setPrsnOpnCont(String prsnOpnCont) {
        this.prsnOpnCont = prsnOpnCont;
    }

    /**
     * @return the stsfIvstRsltSeq
     */
    public int getStsfIvstRsltSeq() {
        return stsfIvstRsltSeq;
    }

    /**
     * @param stsfIvstRsltSeq the stsfIvstRsltSeq to set
     */
    public void setStsfIvstRsltSeq(int stsfIvstRsltSeq) {
        this.stsfIvstRsltSeq = stsfIvstRsltSeq;
    }

    /**
     * @return the empId
     */
    public String getEmpId() {
        return empId;
    }

    /**
     * @param empId the empId to set
     */
    public void setEmpId(String empId) {
        this.empId = empId;
    }

    /**
     * @return the empNm
     */
    public String getEmpNm() {
        return empNm;
    }

    /**
     * @param empNm the empNm to set
     */
    public void setEmpNm(String empNm) {
        this.empNm = empNm;
    }

    /**
     * @return the stsfIvstScoreVal
     */
    public boolean getStsfIvstScoreVal() {
        return stsfIvstScoreVal;
    }

    /**
     * @param stsfIvstScoreVal the stsfIvstScoreVal to set
     */
    public void setStsfIvstScoreVal(boolean stsfIvstScoreVal) {
        this.stsfIvstScoreVal = stsfIvstScoreVal;
    }

    /**
     * @return the stsfIvstDt
     */
    public Date getStsfIvstDt() {
        return stsfIvstDt;
    }

    /**
     * @param stsfIvstDt the stsfIvstDt to set
     */
    public void setStsfIvstDt(Date stsfIvstDt) {
        this.stsfIvstDt = stsfIvstDt;
    }





    /**
     * 만족도조사명
     **/
//     @NotEmpty
     private  String stsfIvstNm;

     /**
     * 만족도조사유형코드
     **/
//     @NotEmpty
     private  String stsfIvstMthCd;

     /**
     * 만족도조사수단코드
     **/
//     @NotEmpty
     private  String stsfIvstExpdCd;

     /**
     * 설문템플릿일련번호
     **/
//     @NotEmpty
     private  int subyTmplSeq;

     /**
     * 대상자추출일련번호
     **/
//     @NotEmpty
     private  String rcpeExtrSeq;

     /**
     * 사용여부
     **/
//     @NotEmpty
     private  String useYn;

     /**
      * 고객대상 여부
      **/
//      @NotEmpty
      private  String custTargYn;

    /**
     * @return the stsfIvstNm
     */
    public String getStsfIvstNm() {
        return stsfIvstNm;
    }

    /**
     * @param stsfIvstNm the stsfIvstNm to set
     */
    public void setStsfIvstNm(String stsfIvstNm) {
        this.stsfIvstNm = stsfIvstNm;
    }

    /**
     * @return the stsfIvstMthCd
     */
    public String getStsfIvstMthCd() {
        return stsfIvstMthCd;
    }

    /**
     * @param stsfIvstMthCd the stsfIvstMthCd to set
     */
    public void setStsfIvstMthCd(String stsfIvstMthCd) {
        this.stsfIvstMthCd = stsfIvstMthCd;
    }

    /**
     * @return the stsfIvstExpdCd
     */
    public String getStsfIvstExpdCd() {
        return stsfIvstExpdCd;
    }

    /**
     * @param stsfIvstExpdCd the stsfIvstExpdCd to set
     */
    public void setStsfIvstExpdCd(String stsfIvstExpdCd) {
        this.stsfIvstExpdCd = stsfIvstExpdCd;
    }

    /**
     * @return the subyTmplSeq
     */
    public int getSubyTmplSeq() {
        return subyTmplSeq;
    }

    /**
     * @param subyTmplSeq the subyTmplSeq to set
     */
    public void setSubyTmplSeq(int subyTmplSeq) {
        this.subyTmplSeq = subyTmplSeq;
    }

    /**
     * @return the rcpeExtrSeq
     */
    public String getRcpeExtrSeq() {
        return rcpeExtrSeq;
    }

    /**
     * @param rcpeExtrSeq the rcpeExtrSeq to set
     */
    public void setRcpeExtrSeq(String rcpeExtrSeq) {
        this.rcpeExtrSeq = rcpeExtrSeq;
    }

    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }

    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    /**
     * @return the custTargYn
     */
    public String getCustTargYn() {
        return custTargYn;
    }

    /**
     * @param custTargYn the custTargYn to set
     */
    public void setCustTargYn(String custTargYn) {
        this.custTargYn = custTargYn;
    }







     /**
     * 설문템플릿 명
     **/
//     @NotEmpty
//     @Length(min=1, max=100)
     private  String subyTmplNm;

     /* 설문 미리보기로 인하여 하단 추가 */
     private  int subyTmplQestSeq;
     private  String qestNum;
     private  int itemSeq;
     private  String qestCont;
     private  double qestWgtVal;
     private  String qestTpCd;
     private  String answCont;
     private  double answScoreVal;
     private  String usrNm;
     private  int tmplResultCnt;
     private  int answSelCnt;
     private  int realCustCnt;
     private  String cmplReasonCont; //불만족 원인

    /**
     * @return the subyTmplNm
     */
    public String getSubyTmplNm() {
        return subyTmplNm;
    }

    /**
     * @param subyTmplNm the subyTmplNm to set
     */
    public void setSubyTmplNm(String subyTmplNm) {
        this.subyTmplNm = subyTmplNm;
    }

    /**
     * @return the subyTmplQestSeq
     */
    public int getSubyTmplQestSeq() {
        return subyTmplQestSeq;
    }

    /**
     * @param subyTmplQestSeq the subyTmplQestSeq to set
     */
    public void setSubyTmplQestSeq(int subyTmplQestSeq) {
        this.subyTmplQestSeq = subyTmplQestSeq;
    }

    /**
     * @return the qestNum
     */
    public String getQestNum() {
        return qestNum;
    }

    /**
     * @param qestNum the qestNum to set
     */
    public void setQestNum(String qestNum) {
        this.qestNum = qestNum;
    }

    /**
     * @return the itemSeq
     */
    public int getItemSeq() {
        return itemSeq;
    }

    /**
     * @param itemSeq the itemSeq to set
     */
    public void setItemSeq(int itemSeq) {
        this.itemSeq = itemSeq;
    }

    /**
     * @return the qestCont
     */
    public String getQestCont() {
        return qestCont;
    }

    /**
     * @param qestCont the qestCont to set
     */
    public void setQestCont(String qestCont) {
        this.qestCont = qestCont;
    }

    /**
     * @return the qestWgtVal
     */
    public double getQestWgtVal() {
        return qestWgtVal;
    }

    /**
     * @param qestWgtVal the qestWgtVal to set
     */
    public void setQestWgtVal(double qestWgtVal) {
        this.qestWgtVal = qestWgtVal;
    }

    /**
     * @return the qestTpCd
     */
    public String getQestTpCd() {
        return qestTpCd;
    }

    /**
     * @param qestTpCd the qestTpCd to set
     */
    public void setQestTpCd(String qestTpCd) {
        this.qestTpCd = qestTpCd;
    }

    /**
     * @return the answCont
     */
    public String getAnswCont() {
        return answCont;
    }

    /**
     * @param answCont the answCont to set
     */
    public void setAnswCont(String answCont) {
        this.answCont = answCont;
    }

    /**
     * @return the answScoreVal
     */
    public double getAnswScoreVal() {
        return answScoreVal;
    }

    /**
     * @param answScoreVal the answScoreVal to set
     */
    public void setAnswScoreVal(double answScoreVal) {
        this.answScoreVal = answScoreVal;
    }

    /**
     * @return the usrNm
     */
    public String getUsrNm() {
        return usrNm;
    }

    /**
     * @param usrNm the usrNm to set
     */
    public void setUsrNm(String usrNm) {
        this.usrNm = usrNm;
    }

    /**
     * @return the tmplResultCnt
     */
    public int getTmplResultCnt() {
        return tmplResultCnt;
    }

    /**
     * @param tmplResultCnt the tmplResultCnt to set
     */
    public void setTmplResultCnt(int tmplResultCnt) {
        this.tmplResultCnt = tmplResultCnt;
    }

     /**
     * @return the cmplReasonCont
     */
    public String getCmplReasonCont() {
        return cmplReasonCont;
    }

    /**
     * @param cmplReasonCont the cmplReasonCont to set
     */
    public void setCmplReasonCont(String cmplReasonCont) {
        this.cmplReasonCont = cmplReasonCont;
    }






    /**
     * 만족도조사일련번호
     **/
     private  int stsfIvstSeq;

     /**
     * 질문일련번호
     **/
     private  int qestSeq;

     /**
     * 답변일련번호
     **/
     private  int answSeq;

     /**
     * 주관식답변내용
     **/
     private  String sbjvAnswCont;

     /**
     * 고객번호
     **/
     private  String custNo;


    /**
     * @return the stsfIvstSeq
     */
    public int getStsfIvstSeq() {
        return stsfIvstSeq;
    }

    /**
     * @param stsfIvstSeq the stsfIvstSeq to set
     */
    public void setStsfIvstSeq(int stsfIvstSeq) {
        this.stsfIvstSeq = stsfIvstSeq;
    }

    /**
     * @return the qestSeq
     */
    public int getQestSeq() {
        return qestSeq;
    }

    /**
     * @param qestSeq the qestSeq to set
     */
    public void setQestSeq(int qestSeq) {
        this.qestSeq = qestSeq;
    }

    /**
     * @return the answSeq
     */
    public int getAnswSeq() {
        return answSeq;
    }

    /**
     * @param answSeq the answSeq to set
     */
    public void setAnswSeq(int answSeq) {
        this.answSeq = answSeq;
    }

    /**
     * @return the sbjvAnswCont
     */
    public String getSbjvAnswCont() {
        return sbjvAnswCont;
    }

    /**
     * @param sbjvAnswCont the sbjvAnswCont to set
     */
    public void setSbjvAnswCont(String sbjvAnswCont) {
        this.sbjvAnswCont = sbjvAnswCont;
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





    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            regDtFormat;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            startDtFormat;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            endDtFormat;

    /**
     * @return the regDtFormat
     */
    public Date getRegDtFormat() {
        return regDtFormat;
    }

    /**
     * @param regDtFormat the regDtFormat to set
     */
    public void setRegDtFormat(Date regDtFormat) {
        this.regDtFormat = regDtFormat;
    }

    /**
     * @return the startDtFormat
     */
    public Date getStartDtFormat() {
        return startDtFormat;
    }

    /**
     * @param startDtFormat the startDtFormat to set
     */
    public void setStartDtFormat(Date startDtFormat) {
        this.startDtFormat = startDtFormat;
    }

    /**
     * @return the endDtFormat
     */
    public Date getEndDtFormat() {
        return endDtFormat;
    }

    /**
     * @param endDtFormat the endDtFormat to set
     */
    public void setEndDtFormat(Date endDtFormat) {
        this.endDtFormat = endDtFormat;
    }

    /**
     * @return the result
     */
    public String getResult() {
        return result;
    }

    /**
     * @param result the result to set
     */
    public void setResult(String result) {
        this.result = result;
    }

    /**
     * @return the stsfIvstYn
     */
    public String getStsfIvstYn() {
        return stsfIvstYn;
    }

    /**
     * @param stsfIvstYn the stsfIvstYn to set
     */
    public void setStsfIvstYn(String stsfIvstYn) {
        this.stsfIvstYn = stsfIvstYn;
    }

    /**
     * @return the answSelCnt
     */
    public int getAnswSelCnt() {
        return answSelCnt;
    }

    /**
     * @param answSelCnt the answSelCnt to set
     */
    public void setAnswSelCnt(int answSelCnt) {
        this.answSelCnt = answSelCnt;
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
     * @param custExtrTitleNm the custExtrTitleNm to set
     */
    public void setCustExtrTitleNm(String custExtrTitleNm) {
        this.custExtrTitleNm = custExtrTitleNm;
    }

    /**
     * @return the custExtrTitleNm
     */
    public String getCustExtrTitleNm() {
        return custExtrTitleNm;
    }

    /**
     * @param realCustCnt the realCustCnt to set
     */
    public void setRealCustCnt(int realCustCnt) {
        this.realCustCnt = realCustCnt;
    }

    /**
     * @return the realCustCnt
     */
    public int getRealCustCnt() {
        return realCustCnt;
    }

    /**
     * @param custExtrTermNo the custExtrTermNo to set
     */
    public void setCustExtrTermNo(String custExtrTermNo) {
        this.custExtrTermNo = custExtrTermNo;
    }

    /**
     * @return the custExtrTermNo
     */
    public String getCustExtrTermNo() {
        return custExtrTermNo;
    }

    /**
     * @param extrDgreCnt the extrDgreCnt to set
     */
    public void setExtrDgreCnt(String extrDgreCnt) {
        this.extrDgreCnt = extrDgreCnt;
    }

    /**
     * @return the extrDgreCnt
     */
    public String getExtrDgreCnt() {
        return extrDgreCnt;
    }

    /**
     * @return the actTotAmt
     */
    public double getActTotAmt() {
        return actTotAmt;
    }

    /**
     * @param actTotAmt the actTotAmt to set
     */
    public void setActTotAmt(double actTotAmt) {
        this.actTotAmt = actTotAmt;
    }

    /**
     * @return the smsSuccessCnt
     */
    public int getSmsSuccessCnt() {
        return smsSuccessCnt;
    }

    /**
     * @param smsSuccessCnt the smsSuccessCnt to set
     */
    public void setSmsSuccessCnt(int smsSuccessCnt) {
        this.smsSuccessCnt = smsSuccessCnt;
    }

    /**
     * @return the serCompCnt
     */
    public int getSerCompCnt() {
        return serCompCnt;
    }

    /**
     * @param serCompCnt the serCompCnt to set
     */
    public void setSerCompCnt(int serCompCnt) {
        this.serCompCnt = serCompCnt;
    }




}
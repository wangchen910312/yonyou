package chn.bhmc.dms.crm.mcm.vo;

import java.util.Date;

//import javax.validation.constraints.Min;

//import org.hibernate.validator.constraints.NotBlank;
//import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

//import chn.bhmc.dms.core.validator.groups.Draft;
//import chn.bhmc.dms.core.validator.groups.Modify;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 캠패인실행  VO
 *
 * @ClassName   : CampaignActionVO.java
 * @Description : CampaignActionVO Class
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

    ,@ValidField(field="extrDgreCnt"      , mesgKey="crm.lbl.extrDgreCnt")
    ,@ValidField(field="custNo"           , mesgKey="crm.lbl.custNo")
    ,@ValidField(field="custExtrTermNo"   , mesgKey="crm.lbl.custExtrTermNo")
    ,@ValidField(field="telNo"            , mesgKey="crm.lbl.telNo")
    ,@ValidField(field="hpNo"             , mesgKey="crm.lbl.hpNo")
    ,@ValidField(field="wechatId"         , mesgKey="crm.lbl.wechatId")
    ,@ValidField(field="emailNm"          , mesgKey="crm.lbl.emailNm")
    ,@ValidField(field="sungNm"           , mesgKey="crm.lbl.sungNm")
    ,@ValidField(field="cityNm"           , mesgKey="crm.lbl.cityNm")
    ,@ValidField(field="distNm"           , mesgKey="crm.lbl.distNm")
    ,@ValidField(field="zipCd"            , mesgKey="crm.lbl.zipCd")
    ,@ValidField(field="extZipCd"         , mesgKey="crm.lbl.extZipCd")
    ,@ValidField(field="addrNm"           , mesgKey="crm.lbl.addrNm")
    ,@ValidField(field="addrDetlCont"     , mesgKey="crm.lbl.addrDetlCont")
    ,@ValidField(field="smsSendDt"        , mesgKey="crm.lbl.smsSendDt")
    ,@ValidField(field="smsSendRsltCont"  , mesgKey="crm.lbl.smsSendRsltCont")
    ,@ValidField(field="callCenSendDt"    , mesgKey="crm.lbl.callCenSendDt")
    ,@ValidField(field="callCenRsltCont"  , mesgKey="crm.lbl.callCenRsltCont")
    ,@ValidField(field="saleSendDt"       , mesgKey="crm.lbl.saleSendDt")
    ,@ValidField(field="saleKeyNm"        , mesgKey="crm.lbl.saleKeyNm")
    ,@ValidField(field="saleRsltCont"     , mesgKey="crm.lbl.saleRsltCont")
    ,@ValidField(field="serSendDt"        , mesgKey="crm.lbl.serSendDt")
    ,@ValidField(field="serKeyNm"         , mesgKey="crm.lbl.serKeyNm")
    ,@ValidField(field="serRsltCont"      , mesgKey="crm.lbl.serRsltCont")
    })

public class CampaignActionVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2617586002317605124L;

    //캠페인 마스터(CR_0701T)
    /**
     * 딜러코드
     **/
     //@NotEmpty

     private  String            hDlrCd;

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
    * 참여인력
    **/
    //REAL_CUST_CNT

    private  int               realCustCnt;

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
    private  String            makTpNm;
    private  String            statNm;
    private  String            talkPlan;
    private  String            dlrCd;
    private  String            pltCd;
    private  String            langCd;
    private  String            refKeyNm;
    private  String            bizCd;
    private  String            result;

    private  String            receiveRsltCd;       // SMS 전송결과





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
     * @return the realCustCnt
     */
    public int getRealCustCnt() {
        return realCustCnt;
    }
    /**
     * @param realCustCnt the realCustCnt to set
     */
    public void setRealCustCnt(int realCustCnt) {
        this.realCustCnt = realCustCnt;
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
     * @return the makTpNm
     */
    public String getMakTpNm() {
        return makTpNm;
    }
    /**
     * @param makTpNm the makTpNm to set
     */
    public void setMakTpNm(String makTpNm) {
        this.makTpNm = makTpNm;
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
    /**
     * @return the refKeyNm
     */
    public String getRefKeyNm() {
        return refKeyNm;
    }
    /**
     * @param refKeyNm the refKeyNm to set
     */
    public void setRefKeyNm(String refKeyNm) {
        this.refKeyNm = refKeyNm;
    }
    /**
     * @return the bizCd
     */
    public String getBizCd() {
        return bizCd;
    }
    /**
     * @param bizCd the bizCd to set
     */
    public void setBizCd(String bizCd) {
        this.bizCd = bizCd;
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





    // 캠페인실행 대상자(CR_0710T)
    /**
    * 추출차수
    **/
//    @NotEmpty

    private  int               extrDgreCnt;

    /**
    * 고객번호
    **/
//    @NotEmpty

    private  String            custNo;

    /**
     * 고객명
     **/
//     @NotEmpty

     private  String            custNm;

    /**
    * 고객추출조건번호
    **/
    //CUST_EXTR_TERM_NO

    private  String            custExtrTermNo;
    private  String            custExtrTermCd;

    /**
    * 전화번호
    **/
    //TEL_NO

    private  String            telNo;

    /**
    * 휴대폰번호
    **/
    //HP_NO

    private  String            hpNo;

    /**
    * 위챗ID
    **/
    //WECHAT_ID

    private  String            wechatId;

    /**
    * 이메일명
    **/
    //EMAIL_NM

    private  String            emailNm;

    /**
    * 성명
    **/
    //SUNG_NM

    private  String            sungNm;

    /**
    * 도시명
    **/
    //CITY_NM

    private  String            cityNm;

    /**
    * 지역명
    **/
    //DIST_NM

    private  String            distNm;

    /**
    * 우편번호
    **/
    //ZIP_CD

    private  String            zipCd;

    /**
    * 확장우편번호
    **/
    //EXT_ZIP_CD

    private  String            extZipCd;

    /**
    * 주소명
    **/
    //ADDR_NM

    private  String            addrNm;

    /**
    * 주소상세내용
    **/
    //ADDR_DETL_CONT

    private  String            addrDetlCont;

    /**
    * SMS발송일자
    **/
    //SMS_SEND_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              smsSendDt;

    /**
    * SMS발송결과내용
    **/
    //SMS_SEND_RSLT_CONT

    private  String            smsSendRsltCont;

    /**
    * 콜센터전송일자
    **/
    //CALL_CEN_SEND_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              callCenSendDt;

    /**
    * 콜결과
    **/
    private  String            callRsltCd;
    private  String            callRsltCdNm;

    /**
    * 판매전송일자
    **/
    //SALE_SEND_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              saleSendDt;

    /**
    * 판매키명
    **/
    //SALE_KEY_NM

    private  String            saleKeyNm;

    /**
    * 판매결과내용
    **/
    //SALE_RSLT_CONT

    private  String            saleRsltCont;

    /**
    * 정비전송일자
    **/
    //SER_SEND_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              serSendDt;

    /**
    * 정비키명
    **/
    //SER_KEY_NM

    private  String            serKeyNm;

    /**
    * 정비결과내용
    **/
    //SER_RSLT_CONT

    private  String            serRsltCont;

    /**
    * 접촉번호
    **/
    //CONTACT_NO

    private  String            contactNo;

    /**
    * 콜일련번호
    **/
    //CALL_SEQ

    private  int               callSeq;

    /**
     * 대상고객일련번호
     **/
     //CALL_SEQ

     private  int               targCustSeq;

     /**
      * 콜센터결과일자
      **/
      //CALL_CEN_RSLT_DT
      @JsonDeserialize(using=JsonDateDeserializer.class)
      private  Date              callCenRsltDt;


     private int smsTmplUserSeq; //sms임시보관 일련번호






    /**
     * @return the extrDgreCnt
     */
    public int getExtrDgreCnt() {
        return extrDgreCnt;
    }
    /**
     * @param extrDgreCnt the extrDgreCnt to set
     */
    public void setExtrDgreCnt(int extrDgreCnt) {
        this.extrDgreCnt = extrDgreCnt;
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
     * @return the custExtrTermNo
     */
    public String getCustExtrTermNo() {
        return custExtrTermNo;
    }
    /**
     * @param custExtrTermNo the custExtrTermNo to set
     */
    public void setCustExtrTermNo(String custExtrTermNo) {
        this.custExtrTermNo = custExtrTermNo;
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
     * @return the wechatId
     */
    public String getWechatId() {
        return wechatId;
    }
    /**
     * @param wechatId the wechatId to set
     */
    public void setWechatId(String wechatId) {
        this.wechatId = wechatId;
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
     * @return the sungNm
     */
    public String getSungNm() {
        return sungNm;
    }
    /**
     * @param sungNm the sungNm to set
     */
    public void setSungNm(String sungNm) {
        this.sungNm = sungNm;
    }
    /**
     * @return the cityNm
     */
    public String getCityNm() {
        return cityNm;
    }
    /**
     * @param cityNm the cityNm to set
     */
    public void setCityNm(String cityNm) {
        this.cityNm = cityNm;
    }
    /**
     * @return the distNm
     */
    public String getDistNm() {
        return distNm;
    }
    /**
     * @param distNm the distNm to set
     */
    public void setDistNm(String distNm) {
        this.distNm = distNm;
    }
    /**
     * @return the zipCd
     */
    public String getZipCd() {
        return zipCd;
    }
    /**
     * @param zipCd the zipCd to set
     */
    public void setZipCd(String zipCd) {
        this.zipCd = zipCd;
    }
    /**
     * @return the extZipCd
     */
    public String getExtZipCd() {
        return extZipCd;
    }
    /**
     * @param extZipCd the extZipCd to set
     */
    public void setExtZipCd(String extZipCd) {
        this.extZipCd = extZipCd;
    }
    /**
     * @return the addrNm
     */
    public String getAddrNm() {
        return addrNm;
    }
    /**
     * @param addrNm the addrNm to set
     */
    public void setAddrNm(String addrNm) {
        this.addrNm = addrNm;
    }
    /**
     * @return the addrDetlCont
     */
    public String getAddrDetlCont() {
        return addrDetlCont;
    }
    /**
     * @param addrDetlCont the addrDetlCont to set
     */
    public void setAddrDetlCont(String addrDetlCont) {
        this.addrDetlCont = addrDetlCont;
    }
    /**
     * @return the smsSendDt
     */
    public Date getSmsSendDt() {
        return smsSendDt;
    }
    /**
     * @param smsSendDt the smsSendDt to set
     */
    public void setSmsSendDt(Date smsSendDt) {
        this.smsSendDt = smsSendDt;
    }
    /**
     * @return the smsSendRsltCont
     */
    public String getSmsSendRsltCont() {
        return smsSendRsltCont;
    }
    /**
     * @param smsSendRsltCont the smsSendRsltCont to set
     */
    public void setSmsSendRsltCont(String smsSendRsltCont) {
        this.smsSendRsltCont = smsSendRsltCont;
    }
    /**
     * @return the callCenSendDt
     */
    public Date getCallCenSendDt() {
        return callCenSendDt;
    }
    /**
     * @param callCenSendDt the callCenSendDt to set
     */
    public void setCallCenSendDt(Date callCenSendDt) {
        this.callCenSendDt = callCenSendDt;
    }
    /**
     * @return the callRsltCd
     */
    public String getCallRsltCd() {
        return callRsltCd;
    }
    /**
     * @param callRsltCd the callRsltCd to set
     */
    public void setCallRsltCd(String callRsltCd) {
        this.callRsltCd = callRsltCd;
    }
    /**
     * @return the saleSendDt
     */
    public Date getSaleSendDt() {
        return saleSendDt;
    }
    /**
     * @param saleSendDt the saleSendDt to set
     */
    public void setSaleSendDt(Date saleSendDt) {
        this.saleSendDt = saleSendDt;
    }
    /**
     * @return the saleKeyNm
     */
    public String getSaleKeyNm() {
        return saleKeyNm;
    }
    /**
     * @param saleKeyNm the saleKeyNm to set
     */
    public void setSaleKeyNm(String saleKeyNm) {
        this.saleKeyNm = saleKeyNm;
    }
    /**
     * @return the saleRsltCont
     */
    public String getSaleRsltCont() {
        return saleRsltCont;
    }
    /**
     * @param saleRsltCont the saleRsltCont to set
     */
    public void setSaleRsltCont(String saleRsltCont) {
        this.saleRsltCont = saleRsltCont;
    }
    /**
     * @return the serSendDt
     */
    public Date getSerSendDt() {
        return serSendDt;
    }
    /**
     * @param serSendDt the serSendDt to set
     */
    public void setSerSendDt(Date serSendDt) {
        this.serSendDt = serSendDt;
    }
    /**
     * @return the serKeyNm
     */
    public String getSerKeyNm() {
        return serKeyNm;
    }
    /**
     * @param serKeyNm the serKeyNm to set
     */
    public void setSerKeyNm(String serKeyNm) {
        this.serKeyNm = serKeyNm;
    }
    /**
     * @return the serRsltCont
     */
    public String getSerRsltCont() {
        return serRsltCont;
    }
    /**
     * @param serRsltCont the serRsltCont to set
     */
    public void setSerRsltCont(String serRsltCont) {
        this.serRsltCont = serRsltCont;
    }
    /**
     * @return the contactNo
     */
    public String getContactNo() {
        return contactNo;
    }
    /**
     * @param contactNo the contactNo to set
     */
    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }
    /**
     * @return the callSeq
     */
    public int getCallSeq() {
        return callSeq;
    }
    /**
     * @param callSeq the callSeq to set
     */
    public void setCallSeq(int callSeq) {
        this.callSeq = callSeq;
    }
    /**
     * @return the targCustSeq
     */
    public int getTargCustSeq() {
        return targCustSeq;
    }
    /**
     * @param targCustSeq the targCustSeq to set
     */
    public void setTargCustSeq(int targCustSeq) {
        this.targCustSeq = targCustSeq;
    }
    /**
     * @return the callCenRsltDt
     */
    public Date getCallCenRsltDt() {
        return callCenRsltDt;
    }
    /**
     * @param callCenRsltDt the callCenRsltDt to set
     */
    public void setCallCenRsltDt(Date callCenRsltDt) {
        this.callCenRsltDt = callCenRsltDt;
    }
    /**
     * @return the smsTmplUserSeq
     */
    public int getSmsTmplUserSeq() {
        return smsTmplUserSeq;
    }
    /**
     * @param smsTmplUserSeq the smsTmplUserSeq to set
     */
    public void setSmsTmplUserSeq(int smsTmplUserSeq) {
        this.smsTmplUserSeq = smsTmplUserSeq;
    }





    /**
    * 고객추출제목명
    **/
    //CUST_EXTR_TITLE_NM
    private  String            custExtrTitleNm;

    /**
    * 추출상태코드
    **/
    //EXTR_STAT_CD

    private  String            extrStatCd;

    /**
    * 추출일자
    **/
    //EXTR_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              extrDt;

    /**
    * 사용여부
    **/
//    @NotEmpty

    private  String            useYn;


    /**
     * @return the custExtrTitleNm
     */
    public String getCustExtrTitleNm() {
        return custExtrTitleNm;
    }
    /**
     * @param custExtrTitleNm the custExtrTitleNm to set
     */
    public void setCustExtrTitleNm(String custExtrTitleNm) {
        this.custExtrTitleNm = custExtrTitleNm;
    }
    /**
     * @return the extrStatCd
     */
    public String getExtrStatCd() {
        return extrStatCd;
    }
    /**
     * @param extrStatCd the extrStatCd to set
     */
    public void setExtrStatCd(String extrStatCd) {
        this.extrStatCd = extrStatCd;
    }
    /**
     * @return the extrDt
     */
    public Date getExtrDt() {
        return extrDt;
    }
    /**
     * @param extrDt the extrDt to set
     */
    public void setExtrDt(Date extrDt) {
        this.extrDt = extrDt;
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
     * @return the custExtrTermCd
     */
    public String getCustExtrTermCd() {
        return custExtrTermCd;
    }
    /**
     * @param custExtrTermCd the custExtrTermCd to set
     */
    public void setCustExtrTermCd(String custExtrTermCd) {
        this.custExtrTermCd = custExtrTermCd;
    }





    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            startDtFormat;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            endDtFormat;

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
     * @return the receiveRsltCd
     */
    public String getReceiveRsltCd() {
        return receiveRsltCd;
    }
    /**
     * @param receiveRsltCd the receiveRsltCd to set
     */
    public void setReceiveRsltCd(String receiveRsltCd) {
        this.receiveRsltCd = receiveRsltCd;
    }
    /**
     * @return the callRsltCdNm
     */
    public String getCallRsltCdNm() {
        return callRsltCdNm;
    }
    /**
     * @param callRsltCdNm the callRsltCdNm to set
     */
    public void setCallRsltCdNm(String callRsltCdNm) {
        this.callRsltCdNm = callRsltCdNm;
    }


}
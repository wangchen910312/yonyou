package chn.bhmc.dms.crm.mcm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MarketingCampaignSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author hyoung jun an
 * @since 2016. 3. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 10.   hyoung jun an     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="makCd"            , mesgKey="global.lbl.makCd")
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

   ,@ValidField(field="activeMthSeq"     , mesgKey="global.lbl.activeMthSeq")
   ,@ValidField(field="activeMthTpCd"    , mesgKey="global.lbl.activeMthTpCd")
   ,@ValidField(field="carlineCd"        , mesgKey="global.lbl.carlineCd")
   ,@ValidField(field="modelCd"          , mesgKey="global.lbl.modelCd")

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
   })

public class MarketingCampaignSaveVO extends BaseSaveVO<MarketingCampaignVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8576209622208157525L;

}
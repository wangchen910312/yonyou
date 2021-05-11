package chn.bhmc.dms.crm.crq.vo;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.validator.groups.Modify;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 마케팅 캠패인  VO
 *
 * @ClassName   : MarketingCampaignVO.java
 * @Description : MarketingCampaignVO Class
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
     @ValidField(field="dlrCd"                 , mesgKey="global.lbl.dlrCd")
    ,@ValidField(field="pltCd"                 , mesgKey="global.lbl.pltCd")
    ,@ValidField(field="vocNo"                 , mesgKey="global.lbl.vocNo")               //VOC번호
    ,@ValidField(field="vocStatCd"             , mesgKey="global.lbl.statNm")              //VOC상태코드
    ,@ValidField(field="vocTpCd"               , mesgKey="global.lbl.type")                //VOC유형코드
    ,@ValidField(field="tendCd"                , mesgKey="global.lbl.tendCd")              //성향코드
    ,@ValidField(field="vocTpSub1Cd"           , mesgKey="global.lbl.vocTpSub1Cd")         //VOC유형하위1코드
    ,@ValidField(field="vocTpSub2Cd"           , mesgKey="global.lbl.vocTpSub2Cd")         //VOC유형하위2코드
    ,@ValidField(field="vocTpSub3Cd"           , mesgKey="global.lbl.vocTpSub3Cd")         //VOC유형하위3코드
    ,@ValidField(field="acptSrcCd"             , mesgKey="global.lbl.acptSrcCd")           //접수출처코드
    ,@ValidField(field="activeGainPathCd"      , mesgKey="global.lbl.activeGainPathCd")    //활동획득경로코드
    ,@ValidField(field="cmplCauCd"             , mesgKey="global.lbl.cmplCauCd")           //불만원인코드
    ,@ValidField(field="prorCd"                , mesgKey="global.lbl.prorCd")              //우선순위코드(중요성)
    ,@ValidField(field="procLmtCd"             , mesgKey="global.lbl.procLmtCd")           //처리시한코드
    ,@ValidField(field="emgcCallNm"            , mesgKey="global.lbl.emgcCallCd")          //긴급콜코드
    ,@ValidField(field="vocEndDt"              , mesgKey="global.lbl.vocEndDt")            //VOC종료일자
    ,@ValidField(field="receiveTelNo"          , mesgKey="global.lbl.receiveTelNo")        //수신전화번호
    ,@ValidField(field="custNm"                , mesgKey="global.lbl.customer")            //고객명
    ,@ValidField(field="custNo"                , mesgKey="global.lbl.customer")            //고객번호
    ,@ValidField(field="custPrefCommNo"        , mesgKey="global.lbl.custPrefCommNo")      //고객선호연락번호
    ,@ValidField(field="hpNo"                  , mesgKey="crm.lbl.hpNo")                   //휴대폰번호
    ,@ValidField(field="homeTelNo"             , mesgKey="crm.lbl.homeTelNo")              //집전화번호
    ,@ValidField(field="officeTelNo"           , mesgKey="crm.lbl.officeTelNo")            //직장전화번호
    ,@ValidField(field="pconCustNm"            , mesgKey="global.lbl.pconCustInfo")        //연계인고객명
    ,@ValidField(field="pconCustNo"            , mesgKey="global.lbl.pconCustInfo")        //연계인고객번호
    ,@ValidField(field="pconCustMjrTelNo"      , mesgKey="global.lbl.pconCustMjrTelNo")    //연계인고객주요전화번호
    ,@ValidField(field="pconCustHpNo"          , mesgKey="global.lbl.pconCustHpNo")        //연계인고객휴대폰번호
    ,@ValidField(field="pconCustHomeTelNo"     , mesgKey="global.lbl.pconCustHomeTelNo")   //연계인고객집전화번호
    ,@ValidField(field="pconCustOfficeTelNo"   , mesgKey="global.lbl.pconCustOfficeTelNo") //연계인고객직장전화번호
    ,@ValidField(field="resvDt"                , mesgKey="ser.lbl.resvDt")                 //예약일자
    ,@ValidField(field="sendTelNo"             , mesgKey="global.lbl.sendTelNo")           //발신전화번호
    ,@ValidField(field="pconRelCd"             , mesgKey="global.lbl.pconRelCd")           //연계인관계코드
    ,@ValidField(field="pprocDeptNm"           , mesgKey="global.lbl.pprocDeptNm")         //처리부서명
    ,@ValidField(field="pprocId"               , mesgKey="global.lbl.pprocId")             //처리인ID
    ,@ValidField(field="pprocNm"               , mesgKey="global.lbl.pprocId")             //처리인명  --추가
    ,@ValidField(field="coopDeptNm"            , mesgKey="global.lbl.coopDeptNm")          //협조부서명
    ,@ValidField(field="bizDeptNm"             , mesgKey="global.lbl.division")            //사업부서명
    ,@ValidField(field="officeNm"              , mesgKey="crm.lbl.officeNm")               //사무소명
    ,@ValidField(field="sungCd"                , mesgKey="global.lbl.sungCd")              //성코드
    ,@ValidField(field="sungNm"                , mesgKey="global.lbl.sungNm")              //성명
    ,@ValidField(field="cityCd"                , mesgKey="global.lbl.cityCd")              //도시코드
    ,@ValidField(field="cityNm"                , mesgKey="global.lbl.cityNm")              //도시명
    ,@ValidField(field="vinNo"                 , mesgKey="sal.lbl.vinNo")                  //차대번호(VIN 번호)
    ,@ValidField(field="carRegNo"              , mesgKey="crm.lbl.carRegNo")               //차 번호
    ,@ValidField(field="carlineCd"             , mesgKey="global.lbl.carLine")             //차종코드
    ,@ValidField(field="carlineNm"             , mesgKey="global.lbl.carLine")             //차종명
    ,@ValidField(field="modelCd"               , mesgKey="crm.lbl.model")                  //모델코드
    ,@ValidField(field="modelNm"               , mesgKey="crm.lbl.model")                  //모델명
    ,@ValidField(field="ocnCd"                 , mesgKey="global.lbl.ocnCd")               //OCN코드
    ,@ValidField(field="ocnNm"                 , mesgKey="global.lbl.ocnNm")               //OCN명
    ,@ValidField(field="runDistVal"            , mesgKey="global.lbl.runDistVal")          //주행거리값
    ,@ValidField(field="acptDeptNm"            , mesgKey="global.lbl.acptDeptNm")          //접수부서
    ,@ValidField(field="pacptId"               , mesgKey="global.lbl.pacptId")             //접수자ID
    ,@ValidField(field="pacptNm"               , mesgKey="global.lbl.pacptId")             //접수자명 --추가
    ,@ValidField(field="acptDt"                , mesgKey="global.lbl.acptDt")              //접수일자
    ,@ValidField(field="custReqCont"           , mesgKey="global.lbl.custReqCont")         //고객요청내용
    ,@ValidField(field="custRescLocCont"       , mesgKey="global.lbl.custRescLocCont")     //고객구조위치내용
    ,@ValidField(field="pevalId"               , mesgKey="global.lbl.pevalId")             //심사인ID
    ,@ValidField(field="pevalNm"               , mesgKey="global.lbl.pevalId")             //심사인명 --추가
    ,@ValidField(field="evalAllocDt"           , mesgKey="global.lbl.evalAllocDt")         //심사배정일자
    ,@ValidField(field="callCenOpnCont"        , mesgKey="global.lbl.callCenOpnCont")      //콜센터의견내용
    ,@ValidField(field="returnCauCont"         , mesgKey="global.lbl.returnCauCont")       //반송원인내용
    ,@ValidField(field="pmoCauCd"              , mesgKey="global.lbl.pmoCauCd")            //승급원인코드
    ,@ValidField(field="pmoDt"                 , mesgKey="global.lbl.pmoDt")               //승급일자
    ,@ValidField(field="revMthCont"            , mesgKey="crm.lbl.revMthCont")          //검토방안내용
    ,@ValidField(field="realPprocId"           , mesgKey="global.lbl.realPprocId")         //실처리인ID
    ,@ValidField(field="realPprocNm"           , mesgKey="global.lbl.realPprocId")         //실처리인명 --추가
    ,@ValidField(field="procDt"                , mesgKey="global.lbl.procDt")              //처리일자
    ,@ValidField(field="pprocTelNo"            , mesgKey="global.lbl.pprocTelNo")          //처리인전화번호
    ,@ValidField(field="pprocEmailNm"          , mesgKey="global.lbl.pprocEmailNm")        //처리인이메일명
    ,@ValidField(field="procRsltCont"          , mesgKey="global.lbl.procRsltCont")        //처리결과내용
    ,@ValidField(field="stsfIvstEmpId"         , mesgKey="crm.lbl.stsfIvstEmpId")       //설문조사인
    ,@ValidField(field="stsfIvstEmpNm"         , mesgKey="crm.lbl.stsfIvstEmpId")       //설문조사인
    ,@ValidField(field="stsfIvstDt"            , mesgKey="crm.lbl.vocStsfIvstDt")          //설문조사시간
    ,@ValidField(field="stsfIvstRsltCont"      , mesgKey="crm.lbl.stsfIvstRsltCont")    //설문결과
    ,@ValidField(field="mthAchvHm"             , mesgKey="global.lbl.mthAchvHm")           //방안달성시간
    ,@ValidField(field="cmplStsfNm"            , mesgKey="crm.lbl.cmplStsfCd")          //불만만족도
    ,@ValidField(field="cmplReAcptYn"          , mesgKey="crm.lbl.cmplReAcptYn")        //불만재접수여부
    ,@ValidField(field="cmplReAcptCnt"         , mesgKey="crm.lbl.cmplReAcptCnt")       //불만재접수횟수
    ,@ValidField(field="serReqNo"              , mesgKey="crm.lbl.serReqNo")            //서비스요청번호
    ,@ValidField(field="cmplDlDeptNm"          , mesgKey="crm.lbl.cmplDlDeptNm")        //불만전달부서명
    ,@ValidField(field="cmplDlEmpId"           , mesgKey="crm.lbl.vocCmplDlEmpId")         //불만전달자ID
    ,@ValidField(field="cmplDlEmpNm"           , mesgKey="crm.lbl.vocCmplDlEmpId")         //불만전달자명 --추가
    ,@ValidField(field="saleDt"                , mesgKey="crm.lbl.vocSaleDt")              //판매일자
    ,@ValidField(field="dstbNo"                , mesgKey="crm.lbl.dstbNo")              //물류번호
    ,@ValidField(field="parOrdYn"              , mesgKey="global.lbl.parOrdYn")            //부품오더여부
    ,@ValidField(field="parOrdDt"              , mesgKey="global.lbl.parOrdDt")            //부품오더일자
    ,@ValidField(field="parArrvDt"             , mesgKey="global.lbl.parArrvDt")           //부품도착일자
    ,@ValidField(field="itemCd"                , mesgKey="par.lbl.itemCd")                 //품목코드
    ,@ValidField(field="bhmcYn"                , mesgKey="global.lbl.bhmcYn")              //BHMC여부
    ,@ValidField(field="bhmcVocNo"             , mesgKey="global.lbl.bhmcVocNo")           //BHMCVOC번호
    ,@ValidField(field="repairBookId"          , mesgKey="global.lbl.repairBookId")        //정비예약ID
    ,@ValidField(field="sendCd"        , mesgKey="global.lbl.dataShipStatCd")      //자료배송상태
    ,@ValidField(field="regUsrId"              , mesgKey="global.lbl.regUsrId")            //등록자ID
    ,@ValidField(field="regDt"                 , mesgKey="global.lbl.regDt")               //등록일자
    ,@ValidField(field="updtUsrId"             , mesgKey="global.lbl.updtUsrId")           //수정자ID
    ,@ValidField(field="updtDt"                , mesgKey="global.lbl.updtDt")              //수정일자



    ,@ValidField(field="emgcRescFstCallYn"     , mesgKey="crm.lbl.emgcRescFstCallYn")       //긴급구조첫통화여부
    ,@ValidField(field="emgcRescYn"            , mesgKey="crm.lbl.emgcRescYn")              //긴급구조여부
    ,@ValidField(field="emgcRescReasonNm"      , mesgKey="crm.lbl.emgcRescReasonNm")        //긴급구조원인명
    ,@ValidField(field="emgcRescStsfCont"      , mesgKey="crm.lbl.emgcRescStsfCont")        //긴급구조만족도내용
    ,@ValidField(field="emgcRescLocCont"       , mesgKey="crm.lbl.emgcRescLocCont")         //긴급구조위치내용


    ,@ValidField(field="vocActiveNo"           , mesgKey="global.lbl.vocActiveNo")         //VOC활동번호
    ,@ValidField(field="activeStatCd"          , mesgKey="global.lbl.activeStatCd")        //활동상태코드
    ,@ValidField(field="activeTpCd"            , mesgKey="global.lbl.activeTpCd")          //활동유형코드
    ,@ValidField(field="activeTpSubCd"         , mesgKey="global.lbl.activeTpSubCd")       //활동유형하위코드
    ,@ValidField(field="activeRsltCont"        , mesgKey="global.lbl.activeRsltCont")      //활동결과내용
    ,@ValidField(field="activeCd"              , mesgKey="global.lbl.activeCd")            //활동코드
    ,@ValidField(field="startDt"               , mesgKey="global.lbl.startDt")             //시작일자
    ,@ValidField(field="endDt"                 , mesgKey="global.lbl.endDt")               //종료일자
    ,@ValidField(field="pgssHm"                , mesgKey="global.lbl.pgssHm")              //진행시간
    ,@ValidField(field="expcStartDt"           , mesgKey="global.lbl.expcStartDt")         //예정시작일자
    ,@ValidField(field="expcEndDt"             , mesgKey="global.lbl.expcEndDt")           //예정종료일자
    ,@ValidField(field="regDeptNm"             , mesgKey="global.lbl.regDeptNm")           //등록부서명
   })

public class VocMgmtVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1147237320428771906L;

    private  String                 bhmcYn;
    private  String                 bhmcYnNm;
    private  String                 bhmcVocNo;
    private  String                 dlrCd;



    // VOC 요청접수
    private  String                 vocNo;
    private  String                 vocStatCd;
    private  String                 vocStatCdNm;
    private  String                 bfVocStatCd;
    private  String                 vocTpCd;
    private  String                 vocTpSubCd;
    private  String                 tendCd;
    private  String                 vocTpSub1Cd;
    private  String                 vocTpSub2Cd;
    private  String                 vocTpSub3Cd;
    private  String                 acptSrcCd;
    private  String                 activeGainPathCd;
    private  String                 cmplCauCd;
    private  String                 prorCd;
    private  String                 procLmtCd;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   vocEndDt;
    private  String                 dlrCmpCommYn;
    private  String                 emgcRescFstCallYn;
    private  String                 emgcRescYn;
    private  String                 emgcRescReasonNm;
    private  String                 emgcRescStsfCont;
    private  String                 emgcRescLocCont;

    private  String                 receiveTelNo;
    private  String                 custNo;
    private  String                 custNm;
    private  String                 pconTpNm;
    private  String                 pconCustNm;
    private  String                 pconCustNo;
    private  String                 custPrefCommNo;
    private  String                 hpNo;
    private  String                 homeTelNo;
    private  String                 officeTelNo;
    private  String                 pconCustMjrTelNo;
    private  String                 pconCustHpNo;
    private  String                 pconCustHomeTelNo;
    private  String                 pconCustOfficeTelNo;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   resvDt;
    private  String                 repairBookId;

    private  String                 sendTelNo;
    private  String                 pconRelCd;
    private  String                 bfPconRelCd;
    private  String                 pprocDeptNm;
    private  String                 pprocId;
    private  String                 pprocNm;
    private  String                 coopDeptNm;
    private  String                 bizDeptNm;
    private  String                 officeNm;
    private  String                 sungNm;
    private  String                 sungCd;
    private  String                 cityNm;
    private  String                 cityCd;
    private  String                 custReqCont;

    private  String                 vinNo;
    private  String                 carRegNo;
    private  String                 carlineNm;
    private  String                 carlineCd;
    private  String                 modelCd;
    private  String                 modelNm;
    private  String                 ocnNm;
    private  String                 ocnCd;
    private  String                 runDistVal;
    private  String                 acptDeptNm;
    private  String                 pacptId;
    private  String                 pacptNm;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   acptDt;

    // VOC 처리 정보
    private  String                 pevalId;
    private  String                 pevalNm;
    private  String                 returnCauCont;
    private  String                 pmoCauCd;
    private  String                 realPprocId;
    private  String                 realPprocNm;
    private  String                 pprocTelNo;
    private  String                 stsfIvstEmpId;
    private  String                 stsfIvstEmpNm;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   mthAchvHm;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   traceDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   evalAllocDt;
    private  String                 sendCd;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   pmoDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   procDt;
    private  String                 pprocEmailNm;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   stsfIvstDt;
    private  String                 traceRsltCont;

    private  String                 callCenOpnCont;
    private  String                 revMthCont;

    @Length(min=0, max=2000, groups=Modify.class)
    private  String                 procRsltCont;
    private  String                 procRsltContTmp;
    @Length(min=0, max=2000, groups=Modify.class)
    private  String                 stsfIvstRsltCont;

    //추가정보
    private  String                 cmplStsfNm;
    private  String                 cmplReAcptYn;
    private  int                    cmplReAcptCnt;
    private  String                 serReqNo;

    private  String                 cmplDlDeptNm;
    private  String                 cmplDlEmpId;
    private  String                 cmplDlEmpNm;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   saleDt;
    private  String                 dstbNo;

    private  String                 salesActiveSrcCd;
    private  String                 relSalesActiveNo;



    private  String                 parOrdYn;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   parOrdDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   parArrvDt;
    private  String                 itemCd;

    private  String            vocCnt;
    private  String            vocTpCdNm;

    private  String            callCenOpnContAppend;
    private  String            procRsltContAppend;
    private  String            stsfIvstRsltContAppend;
    private  String            returnCauContAppend;
    private  String            custVsitPlan;
    private  String            custFUResult;

    private int                callHisSeq;
    private String             recFileId;

    private String callDialNum;

    /**
     * @return the bhmcYn
     */
    public String getBhmcYn() {
        return bhmcYn;
    }



    /**
     * @param bhmcYn the bhmcYn to set
     */
    public void setBhmcYn(String bhmcYn) {
        this.bhmcYn = bhmcYn;
    }



    /**
     * @return the bhmcVocNo
     */
    public String getBhmcVocNo() {
        return bhmcVocNo;
    }



    /**
     * @param bhmcVocNo the bhmcVocNo to set
     */
    public void setBhmcVocNo(String bhmcVocNo) {
        this.bhmcVocNo = bhmcVocNo;
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
     * @return the vocNo
     */
    public String getVocNo() {
        return vocNo;
    }



    /**
     * @param vocNo the vocNo to set
     */
    public void setVocNo(String vocNo) {
        this.vocNo = vocNo;
    }



    /**
     * @return the vocStatCd
     */
    public String getVocStatCd() {
        return vocStatCd;
    }



    /**
     * @param vocStatCd the vocStatCd to set
     */
    public void setVocStatCd(String vocStatCd) {
        this.vocStatCd = vocStatCd;
    }



    /**
     * @return the vocStatCdNm
     */
    public String getVocStatCdNm() {
        return vocStatCdNm;
    }



    /**
     * @param vocStatCdNm the vocStatCdNm to set
     */
    public void setVocStatCdNm(String vocStatCdNm) {
        this.vocStatCdNm = vocStatCdNm;
    }



    /**
     * @return the bfVocStatCd
     */
    public String getBfVocStatCd() {
        return bfVocStatCd;
    }



    /**
     * @param bfVocStatCd the bfVocStatCd to set
     */
    public void setBfVocStatCd(String bfVocStatCd) {
        this.bfVocStatCd = bfVocStatCd;
    }



    /**
     * @return the vocTpCd
     */
    public String getVocTpCd() {
        return vocTpCd;
    }



    /**
     * @param vocTpCd the vocTpCd to set
     */
    public void setVocTpCd(String vocTpCd) {
        this.vocTpCd = vocTpCd;
    }



    /**
     * @return the vocTpSubCd
     */
    public String getVocTpSubCd() {
        return vocTpSubCd;
    }



    /**
     * @param vocTpSubCd the vocTpSubCd to set
     */
    public void setVocTpSubCd(String vocTpSubCd) {
        this.vocTpSubCd = vocTpSubCd;
    }



    /**
     * @return the tendCd
     */
    public String getTendCd() {
        return tendCd;
    }



    /**
     * @param tendCd the tendCd to set
     */
    public void setTendCd(String tendCd) {
        this.tendCd = tendCd;
    }



    /**
     * @return the vocTpSub1Cd
     */
    public String getVocTpSub1Cd() {
        return vocTpSub1Cd;
    }



    /**
     * @param vocTpSub1Cd the vocTpSub1Cd to set
     */
    public void setVocTpSub1Cd(String vocTpSub1Cd) {
        this.vocTpSub1Cd = vocTpSub1Cd;
    }



    /**
     * @return the vocTpSub2Cd
     */
    public String getVocTpSub2Cd() {
        return vocTpSub2Cd;
    }



    /**
     * @param vocTpSub2Cd the vocTpSub2Cd to set
     */
    public void setVocTpSub2Cd(String vocTpSub2Cd) {
        this.vocTpSub2Cd = vocTpSub2Cd;
    }



    /**
     * @return the vocTpSub3Cd
     */
    public String getVocTpSub3Cd() {
        return vocTpSub3Cd;
    }



    /**
     * @param vocTpSub3Cd the vocTpSub3Cd to set
     */
    public void setVocTpSub3Cd(String vocTpSub3Cd) {
        this.vocTpSub3Cd = vocTpSub3Cd;
    }



    /**
     * @return the acptSrcCd
     */
    public String getAcptSrcCd() {
        return acptSrcCd;
    }



    /**
     * @param acptSrcCd the acptSrcCd to set
     */
    public void setAcptSrcCd(String acptSrcCd) {
        this.acptSrcCd = acptSrcCd;
    }



    /**
     * @return the activeGainPathCd
     */
    public String getActiveGainPathCd() {
        return activeGainPathCd;
    }



    /**
     * @param activeGainPathCd the activeGainPathCd to set
     */
    public void setActiveGainPathCd(String activeGainPathCd) {
        this.activeGainPathCd = activeGainPathCd;
    }



    /**
     * @return the cmplCauCd
     */
    public String getCmplCauCd() {
        return cmplCauCd;
    }



    /**
     * @param cmplCauCd the cmplCauCd to set
     */
    public void setCmplCauCd(String cmplCauCd) {
        this.cmplCauCd = cmplCauCd;
    }



    /**
     * @return the prorCd
     */
    public String getProrCd() {
        return prorCd;
    }



    /**
     * @param prorCd the prorCd to set
     */
    public void setProrCd(String prorCd) {
        this.prorCd = prorCd;
    }



    /**
     * @return the procLmtCd
     */
    public String getProcLmtCd() {
        return procLmtCd;
    }



    /**
     * @param procLmtCd the procLmtCd to set
     */
    public void setProcLmtCd(String procLmtCd) {
        this.procLmtCd = procLmtCd;
    }



    /**
     * @return the vocEndDt
     */
    public Date getVocEndDt() {
        return vocEndDt;
    }



    /**
     * @param vocEndDt the vocEndDt to set
     */
    public void setVocEndDt(Date vocEndDt) {
        this.vocEndDt = vocEndDt;
    }



    /**
     * @return the dlrCmpCommYn
     */
    public String getDlrCmpCommYn() {
        return dlrCmpCommYn;
    }



    /**
     * @param dlrCmpCommYn the dlrCmpCommYn to set
     */
    public void setDlrCmpCommYn(String dlrCmpCommYn) {
        this.dlrCmpCommYn = dlrCmpCommYn;
    }



    /**
     * @return the receiveTelNo
     */
    public String getReceiveTelNo() {
        return receiveTelNo;
    }



    /**
     * @param receiveTelNo the receiveTelNo to set
     */
    public void setReceiveTelNo(String receiveTelNo) {
        this.receiveTelNo = receiveTelNo;
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
     * @return the pconCustNm
     */
    public String getPconCustNm() {
        return pconCustNm;
    }



    /**
     * @param pconCustNm the pconCustNm to set
     */
    public void setPconCustNm(String pconCustNm) {
        this.pconCustNm = pconCustNm;
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
     * @return the custPrefCommNo
     */
    public String getCustPrefCommNo() {
        return custPrefCommNo;
    }



    /**
     * @param custPrefCommNo the custPrefCommNo to set
     */
    public void setCustPrefCommNo(String custPrefCommNo) {
        this.custPrefCommNo = custPrefCommNo;
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
     * @return the homeTelNo
     */
    public String getHomeTelNo() {
        return homeTelNo;
    }



    /**
     * @param homeTelNo the homeTelNo to set
     */
    public void setHomeTelNo(String homeTelNo) {
        this.homeTelNo = homeTelNo;
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
     * @return the pconCustMjrTelNo
     */
    public String getPconCustMjrTelNo() {
        return pconCustMjrTelNo;
    }



    /**
     * @param pconCustMjrTelNo the pconCustMjrTelNo to set
     */
    public void setPconCustMjrTelNo(String pconCustMjrTelNo) {
        this.pconCustMjrTelNo = pconCustMjrTelNo;
    }



    /**
     * @return the pconCustHpNo
     */
    public String getPconCustHpNo() {
        return pconCustHpNo;
    }



    /**
     * @param pconCustHpNo the pconCustHpNo to set
     */
    public void setPconCustHpNo(String pconCustHpNo) {
        this.pconCustHpNo = pconCustHpNo;
    }



    /**
     * @return the pconCustHomeTelNo
     */
    public String getPconCustHomeTelNo() {
        return pconCustHomeTelNo;
    }



    /**
     * @param pconCustHomeTelNo the pconCustHomeTelNo to set
     */
    public void setPconCustHomeTelNo(String pconCustHomeTelNo) {
        this.pconCustHomeTelNo = pconCustHomeTelNo;
    }



    /**
     * @return the pconCustOfficeTelNo
     */
    public String getPconCustOfficeTelNo() {
        return pconCustOfficeTelNo;
    }



    /**
     * @param pconCustOfficeTelNo the pconCustOfficeTelNo to set
     */
    public void setPconCustOfficeTelNo(String pconCustOfficeTelNo) {
        this.pconCustOfficeTelNo = pconCustOfficeTelNo;
    }



    /**
     * @return the resvDt
     */
    public Date getResvDt() {
        return resvDt;
    }



    /**
     * @param resvDt the resvDt to set
     */
    public void setResvDt(Date resvDt) {
        this.resvDt = resvDt;
    }



    /**
     * @return the repairBookId
     */
    public String getRepairBookId() {
        return repairBookId;
    }



    /**
     * @param repairBookId the repairBookId to set
     */
    public void setRepairBookId(String repairBookId) {
        this.repairBookId = repairBookId;
    }



    /**
     * @return the sendTelNo
     */
    public String getSendTelNo() {
        return sendTelNo;
    }



    /**
     * @param sendTelNo the sendTelNo to set
     */
    public void setSendTelNo(String sendTelNo) {
        this.sendTelNo = sendTelNo;
    }



    /**
     * @return the pconRelCd
     */
    public String getPconRelCd() {
        return pconRelCd;
    }



    /**
     * @param pconRelCd the pconRelCd to set
     */
    public void setPconRelCd(String pconRelCd) {
        this.pconRelCd = pconRelCd;
    }



    /**
     * @return the pprocDeptNm
     */
    public String getPprocDeptNm() {
        return pprocDeptNm;
    }



    /**
     * @param pprocDeptNm the pprocDeptNm to set
     */
    public void setPprocDeptNm(String pprocDeptNm) {
        this.pprocDeptNm = pprocDeptNm;
    }



    /**
     * @return the pprocId
     */
    public String getPprocId() {
        return pprocId;
    }



    /**
     * @param pprocId the pprocId to set
     */
    public void setPprocId(String pprocId) {
        this.pprocId = pprocId;
    }



    /**
     * @return the pprocNm
     */
    public String getPprocNm() {
        return pprocNm;
    }



    /**
     * @param pprocNm the pprocNm to set
     */
    public void setPprocNm(String pprocNm) {
        this.pprocNm = pprocNm;
    }



    /**
     * @return the coopDeptNm
     */
    public String getCoopDeptNm() {
        return coopDeptNm;
    }



    /**
     * @param coopDeptNm the coopDeptNm to set
     */
    public void setCoopDeptNm(String coopDeptNm) {
        this.coopDeptNm = coopDeptNm;
    }



    /**
     * @return the bizDeptNm
     */
    public String getBizDeptNm() {
        return bizDeptNm;
    }



    /**
     * @param bizDeptNm the bizDeptNm to set
     */
    public void setBizDeptNm(String bizDeptNm) {
        this.bizDeptNm = bizDeptNm;
    }



    /**
     * @return the officeNm
     */
    public String getOfficeNm() {
        return officeNm;
    }



    /**
     * @param officeNm the officeNm to set
     */
    public void setOfficeNm(String officeNm) {
        this.officeNm = officeNm;
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
     * @return the sungCd
     */
    public String getSungCd() {
        return sungCd;
    }



    /**
     * @param sungCd the sungCd to set
     */
    public void setSungCd(String sungCd) {
        this.sungCd = sungCd;
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
     * @return the cityCd
     */
    public String getCityCd() {
        return cityCd;
    }



    /**
     * @param cityCd the cityCd to set
     */
    public void setCityCd(String cityCd) {
        this.cityCd = cityCd;
    }



    /**
     * @return the custReqCont
     */
    public String getCustReqCont() {
        return custReqCont;
    }



    /**
     * @param custReqCont the custReqCont to set
     */
    public void setCustReqCont(String custReqCont) {
        this.custReqCont = custReqCont;
    }


    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }



    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }



    /**
     * @return the carRegNo
     */
    public String getCarRegNo() {
        return carRegNo;
    }



    /**
     * @param carRegNo the carRegNo to set
     */
    public void setCarRegNo(String carRegNo) {
        this.carRegNo = carRegNo;
    }



    /**
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }



    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }



    /**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }



    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }



    /**
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }



    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }



    /**
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }



    /**
     * @param modelNm the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }



    /**
     * @return the ocnNm
     */
    public String getOcnNm() {
        return ocnNm;
    }



    /**
     * @param ocnNm the ocnNm to set
     */
    public void setOcnNm(String ocnNm) {
        this.ocnNm = ocnNm;
    }



    /**
     * @return the ocnCd
     */
    public String getOcnCd() {
        return ocnCd;
    }



    /**
     * @param ocnCd the ocnCd to set
     */
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }



    /**
     * @return the runDistVal
     */
    public String getRunDistVal() {
        return runDistVal;
    }



    /**
     * @param runDistVal the runDistVal to set
     */
    public void setRunDistVal(String runDistVal) {
        this.runDistVal = runDistVal;
    }



    /**
     * @return the acptDeptNm
     */
    public String getAcptDeptNm() {
        return acptDeptNm;
    }



    /**
     * @param acptDeptNm the acptDeptNm to set
     */
    public void setAcptDeptNm(String acptDeptNm) {
        this.acptDeptNm = acptDeptNm;
    }



    /**
     * @return the pacptId
     */
    public String getPacptId() {
        return pacptId;
    }



    /**
     * @param pacptId the pacptId to set
     */
    public void setPacptId(String pacptId) {
        this.pacptId = pacptId;
    }



    /**
     * @return the pacptNm
     */
    public String getPacptNm() {
        return pacptNm;
    }



    /**
     * @param pacptNm the pacptNm to set
     */
    public void setPacptNm(String pacptNm) {
        this.pacptNm = pacptNm;
    }



    /**
     * @return the acptDt
     */
    public Date getAcptDt() {
        return acptDt;
    }



    /**
     * @param acptDt the acptDt to set
     */
    public void setAcptDt(Date acptDt) {
        this.acptDt = acptDt;
    }


    /**
     * @return the pevalId
     */
    public String getPevalId() {
        return pevalId;
    }



    /**
     * @param pevalId the pevalId to set
     */
    public void setPevalId(String pevalId) {
        this.pevalId = pevalId;
    }



    /**
     * @return the pevalNm
     */
    public String getPevalNm() {
        return pevalNm;
    }



    /**
     * @param pevalNm the pevalNm to set
     */
    public void setPevalNm(String pevalNm) {
        this.pevalNm = pevalNm;
    }



    /**
     * @return the returnCauCont
     */
    public String getReturnCauCont() {
        return returnCauCont;
    }



    /**
     * @param returnCauCont the returnCauCont to set
     */
    public void setReturnCauCont(String returnCauCont) {
        this.returnCauCont = returnCauCont;
    }



    /**
     * @return the pmoCauCd
     */
    public String getPmoCauCd() {
        return pmoCauCd;
    }



    /**
     * @param pmoCauCd the pmoCauCd to set
     */
    public void setPmoCauCd(String pmoCauCd) {
        this.pmoCauCd = pmoCauCd;
    }



    /**
     * @return the realPprocId
     */
    public String getRealPprocId() {
        return realPprocId;
    }



    /**
     * @param realPprocId the realPprocId to set
     */
    public void setRealPprocId(String realPprocId) {
        this.realPprocId = realPprocId;
    }



    /**
     * @return the realPprocNm
     */
    public String getRealPprocNm() {
        return realPprocNm;
    }



    /**
     * @param realPprocNm the realPprocNm to set
     */
    public void setRealPprocNm(String realPprocNm) {
        this.realPprocNm = realPprocNm;
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
     * @return the pprocTelNo
     */
    public String getPprocTelNo() {
        return pprocTelNo;
    }



    /**
     * @param pprocTelNo the pprocTelNo to set
     */
    public void setPprocTelNo(String pprocTelNo) {
        this.pprocTelNo = pprocTelNo;
    }



    /**
     * @return the stsfIvstEmpId
     */
    public String getStsfIvstEmpId() {
        return stsfIvstEmpId;
    }



    /**
     * @param stsfIvstEmpId the stsfIvstEmpId to set
     */
    public void setStsfIvstEmpId(String stsfIvstEmpId) {
        this.stsfIvstEmpId = stsfIvstEmpId;
    }



    /**
     * @return the stsfIvstEmpNm
     */
    public String getStsfIvstEmpNm() {
        return stsfIvstEmpNm;
    }



    /**
     * @param stsfIvstEmpNm the stsfIvstEmpNm to set
     */
    public void setStsfIvstEmpNm(String stsfIvstEmpNm) {
        this.stsfIvstEmpNm = stsfIvstEmpNm;
    }



    /**
     * @return the mthAchvHm
     */
    public Date getMthAchvHm() {
        return mthAchvHm;
    }



    /**
     * @param mthAchvHm the mthAchvHm to set
     */
    public void setMthAchvHm(Date mthAchvHm) {
        this.mthAchvHm = mthAchvHm;
    }



    /**
     * @return the evalAllocDt
     */
    public Date getEvalAllocDt() {
        return evalAllocDt;
    }



    /**
     * @param evalAllocDt the evalAllocDt to set
     */
    public void setEvalAllocDt(Date evalAllocDt) {
        this.evalAllocDt = evalAllocDt;
    }





    /**
     * @return the sendCd
     */
    public String getSendCd() {
        return sendCd;
    }



    /**
     * @param sendCd the sendCd to set
     */
    public void setSendCd(String sendCd) {
        this.sendCd = sendCd;
    }



    /**
     * @return the pmoDt
     */
    public Date getPmoDt() {
        return pmoDt;
    }



    /**
     * @param pmoDt the pmoDt to set
     */
    public void setPmoDt(Date pmoDt) {
        this.pmoDt = pmoDt;
    }



    /**
     * @return the procDt
     */
    public Date getProcDt() {
        return procDt;
    }



    /**
     * @param procDt the procDt to set
     */
    public void setProcDt(Date procDt) {
        this.procDt = procDt;
    }



    /**
     * @return the pprocEmailNm
     */
    public String getPprocEmailNm() {
        return pprocEmailNm;
    }



    /**
     * @param pprocEmailNm the pprocEmailNm to set
     */
    public void setPprocEmailNm(String pprocEmailNm) {
        this.pprocEmailNm = pprocEmailNm;
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
     * @return the traceRsltCont
     */
    public String getTraceRsltCont() {
        return traceRsltCont;
    }



    /**
     * @param traceRsltCont the traceRsltCont to set
     */
    public void setTraceRsltCont(String traceRsltCont) {
        this.traceRsltCont = traceRsltCont;
    }



    /**
     * @return the callCenOpnCont
     */
    public String getCallCenOpnCont() {
        return callCenOpnCont;
    }



    /**
     * @param callCenOpnCont the callCenOpnCont to set
     */
    public void setCallCenOpnCont(String callCenOpnCont) {
        this.callCenOpnCont = callCenOpnCont;
    }



    /**
     * @return the revMthCont
     */
    public String getRevMthCont() {
        return revMthCont;
    }



    /**
     * @param revMthCont the revMthCont to set
     */
    public void setRevMthCont(String revMthCont) {
        this.revMthCont = revMthCont;
    }



    /**
     * @return the procRsltCont
     */
    public String getProcRsltCont() {
        return procRsltCont;
    }



    /**
     * @param procRsltCont the procRsltCont to set
     */
    public void setProcRsltCont(String procRsltCont) {
        this.procRsltCont = procRsltCont;
    }





    /**
     * @return the procRsltContTmp
     */
    public String getProcRsltContTmp() {
        return procRsltContTmp;
    }



    /**
     * @param procRsltContTmp the procRsltContTmp to set
     */
    public void setProcRsltContTmp(String procRsltContTmp) {
        this.procRsltContTmp = procRsltContTmp;
    }



    /**
     * @return the stsfIvstRsltCont
     */
    public String getStsfIvstRsltCont() {
        return stsfIvstRsltCont;
    }



    /**
     * @param stsfIvstRsltCont the stsfIvstRsltCont to set
     */
    public void setStsfIvstRsltCont(String stsfIvstRsltCont) {
        this.stsfIvstRsltCont = stsfIvstRsltCont;
    }



    /**
     * @return the cmplStsfNm
     */
    public String getCmplStsfNm() {
        return cmplStsfNm;
    }



    /**
     * @param cmplStsfNm the cmplStsfNm to set
     */
    public void setCmplStsfNm(String cmplStsfNm) {
        this.cmplStsfNm = cmplStsfNm;
    }



    /**
     * @return the cmplReAcptYn
     */
    public String getCmplReAcptYn() {
        return cmplReAcptYn;
    }



    /**
     * @param cmplReAcptYn the cmplReAcptYn to set
     */
    public void setCmplReAcptYn(String cmplReAcptYn) {
        this.cmplReAcptYn = cmplReAcptYn;
    }



    /**
     * @return the cmplReAcptCnt
     */
    public int getCmplReAcptCnt() {
        return cmplReAcptCnt;
    }



    /**
     * @param cmplReAcptCnt the cmplReAcptCnt to set
     */
    public void setCmplReAcptCnt(int cmplReAcptCnt) {
        this.cmplReAcptCnt = cmplReAcptCnt;
    }



    /**
     * @return the serReqNo
     */
    public String getSerReqNo() {
        return serReqNo;
    }



    /**
     * @param serReqNo the serReqNo to set
     */
    public void setSerReqNo(String serReqNo) {
        this.serReqNo = serReqNo;
    }



    /**
     * @return the cmplDlDeptNm
     */
    public String getCmplDlDeptNm() {
        return cmplDlDeptNm;
    }



    /**
     * @param cmplDlDeptNm the cmplDlDeptNm to set
     */
    public void setCmplDlDeptNm(String cmplDlDeptNm) {
        this.cmplDlDeptNm = cmplDlDeptNm;
    }



    /**
     * @return the cmplDlEmpId
     */
    public String getCmplDlEmpId() {
        return cmplDlEmpId;
    }



    /**
     * @param cmplDlEmpId the cmplDlEmpId to set
     */
    public void setCmplDlEmpId(String cmplDlEmpId) {
        this.cmplDlEmpId = cmplDlEmpId;
    }



    /**
     * @return the cmplDlEmpNm
     */
    public String getCmplDlEmpNm() {
        return cmplDlEmpNm;
    }



    /**
     * @param cmplDlEmpNm the cmplDlEmpNm to set
     */
    public void setCmplDlEmpNm(String cmplDlEmpNm) {
        this.cmplDlEmpNm = cmplDlEmpNm;
    }



    /**
     * @return the saleDt
     */
    public Date getSaleDt() {
        return saleDt;
    }



    /**
     * @param saleDt the saleDt to set
     */
    public void setSaleDt(Date saleDt) {
        this.saleDt = saleDt;
    }



    /**
     * @return the dstbNo
     */
    public String getDstbNo() {
        return dstbNo;
    }



    /**
     * @param dstbNo the dstbNo to set
     */
    public void setDstbNo(String dstbNo) {
        this.dstbNo = dstbNo;
    }



    /**
     * @return the salesActiveSrcCd
     */
    public String getSalesActiveSrcCd() {
        return salesActiveSrcCd;
    }



    /**
     * @param salesActiveSrcCd the salesActiveSrcCd to set
     */
    public void setSalesActiveSrcCd(String salesActiveSrcCd) {
        this.salesActiveSrcCd = salesActiveSrcCd;
    }



    /**
     * @return the relSalesActiveNo
     */
    public String getRelSalesActiveNo() {
        return relSalesActiveNo;
    }



    /**
     * @param relSalesActiveNo the relSalesActiveNo to set
     */
    public void setRelSalesActiveNo(String relSalesActiveNo) {
        this.relSalesActiveNo = relSalesActiveNo;
    }



    /**
     * @return the parOrdYn
     */
    public String getParOrdYn() {
        return parOrdYn;
    }



    /**
     * @param parOrdYn the parOrdYn to set
     */
    public void setParOrdYn(String parOrdYn) {
        this.parOrdYn = parOrdYn;
    }



    /**
     * @return the parOrdDt
     */
    public Date getParOrdDt() {
        return parOrdDt;
    }



    /**
     * @param parOrdDt the parOrdDt to set
     */
    public void setParOrdDt(Date parOrdDt) {
        this.parOrdDt = parOrdDt;
    }



    /**
     * @return the parArrvDt
     */
    public Date getParArrvDt() {
        return parArrvDt;
    }



    /**
     * @param parArrvDt the parArrvDt to set
     */
    public void setParArrvDt(Date parArrvDt) {
        this.parArrvDt = parArrvDt;
    }



    /**
     * @return the itemCd
     */
    public String getItemCd() {
        return itemCd;
    }



    /**
     * @param itemCd the itemCd to set
     */
    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
    }


    /**
     * @return the vocCnt
     */
    public String getVocCnt() {
        return vocCnt;
    }



    /**
     * @param vocCnt the vocCnt to set
     */
    public void setVocCnt(String vocCnt) {
        this.vocCnt = vocCnt;
    }


    /**
     * @return the emgcRescFstCallYn
     */
    public String getEmgcRescFstCallYn() {
        return emgcRescFstCallYn;
    }



    /**
     * @param emgcRescFstCallYn the emgcRescFstCallYn to set
     */
    public void setEmgcRescFstCallYn(String emgcRescFstCallYn) {
        this.emgcRescFstCallYn = emgcRescFstCallYn;
    }



    /**
     * @return the emgcRescYn
     */
    public String getEmgcRescYn() {
        return emgcRescYn;
    }



    /**
     * @param emgcRescYn the emgcRescYn to set
     */
    public void setEmgcRescYn(String emgcRescYn) {
        this.emgcRescYn = emgcRescYn;
    }



    /**
     * @return the emgcRescReasonNm
     */
    public String getEmgcRescReasonNm() {
        return emgcRescReasonNm;
    }



    /**
     * @param emgcRescReasonNm the emgcRescReasonNm to set
     */
    public void setEmgcRescReasonNm(String emgcRescReasonNm) {
        this.emgcRescReasonNm = emgcRescReasonNm;
    }



    /**
     * @return the emgcRescStsfCont
     */
    public String getEmgcRescStsfCont() {
        return emgcRescStsfCont;
    }



    /**
     * @param emgcRescStsfCont the emgcRescStsfCont to set
     */
    public void setEmgcRescStsfCont(String emgcRescStsfCont) {
        this.emgcRescStsfCont = emgcRescStsfCont;
    }



    /**
     * @return the emgcRescLocCont
     */
    public String getEmgcRescLocCont() {
        return emgcRescLocCont;
    }



    /**
     * @param emgcRescLocCont the emgcRescLocCont to set
     */
    public void setEmgcRescLocCont(String emgcRescLocCont) {
        this.emgcRescLocCont = emgcRescLocCont;
    }



    /**
     * @return the vocTpCdNm
     */
    public String getVocTpCdNm() {
        return vocTpCdNm;
    }



    /**
     * @param vocTpCdNm the vocTpCdNm to set
     */
    public void setVocTpCdNm(String vocTpCdNm) {
        this.vocTpCdNm = vocTpCdNm;
    }




    /**
     * @return the callCenOpnContAppend
     */
    public String getCallCenOpnContAppend() {
        return callCenOpnContAppend;
    }



    /**
     * @param callCenOpnContAppend the callCenOpnContAppend to set
     */
    public void setCallCenOpnContAppend(String callCenOpnContAppend) {
        this.callCenOpnContAppend = callCenOpnContAppend;
    }



    /**
     * @return the procRsltContAppend
     */
    public String getProcRsltContAppend() {
        return procRsltContAppend;
    }



    /**
     * @param procRsltContAppend the procRsltContAppend to set
     */
    public void setProcRsltContAppend(String procRsltContAppend) {
        this.procRsltContAppend = procRsltContAppend;
    }



    /**
     * @return the stsfIvstRsltContAppend
     */
    public String getStsfIvstRsltContAppend() {
        return stsfIvstRsltContAppend;
    }



    /**
     * @param stsfIvstRsltContAppend the stsfIvstRsltContAppend to set
     */
    public void setStsfIvstRsltContAppend(String stsfIvstRsltContAppend) {
        this.stsfIvstRsltContAppend = stsfIvstRsltContAppend;
    }


    /**
     * @return the returnCauContAppend
     */
    public String getReturnCauContAppend() {
        return returnCauContAppend;
    }


    /**
     * @param returnCauContAppend the returnCauContAppend to set
     */
    public void setReturnCauContAppend(String returnCauContAppend) {
        this.returnCauContAppend = returnCauContAppend;
    }



    /**
     * @return the custVsitPlan
     */
    public String getCustVsitPlan() {
        return custVsitPlan;
    }



    /**
     * @param custVsitPlan the custVsitPlan to set
     */
    public void setCustVsitPlan(String custVsitPlan) {
        this.custVsitPlan = custVsitPlan;
    }




    /**
     * @return the custFUResult
     */
    public String getCustFUResult() {
        return custFUResult;
    }



    /**
     * @param custFUResult the custFUResult to set
     */
    public void setCustFUResult(String custFUResult) {
        this.custFUResult = custFUResult;
    }


    /**
     * @return the pconTpNm
     */
    public String getPconTpNm() {
        return pconTpNm;
    }



    /**
     * @param pconTpNm the pconTpNm to set
     */
    public void setPconTpNm(String pconTpNm) {
        this.pconTpNm = pconTpNm;
    }

    /**
     * @return the bfPconRelCd
     */
    public String getBfPconRelCd() {
        return bfPconRelCd;
    }

    /**
     * @param bfPconRelCd the bfPconRelCd to set
     */
    public void setBfPconRelCd(String bfPconRelCd) {
        this.bfPconRelCd = bfPconRelCd;
    }


    /**
     * @return the callHisSeq
     */
    public int getCallHisSeq() {
        return callHisSeq;
    }



    /**
     * @param callHisSeq the callHisSeq to set
     */
    public void setCallHisSeq(int callHisSeq) {
        this.callHisSeq = callHisSeq;
    }



    /**
     * @return the recFileId
     */
    public String getRecFileId() {
        return recFileId;
    }

    /**
     * @param recFileId the recFileId to set
     */
    public void setRecFileId(String recFileId) {
        this.recFileId = recFileId;
    }

    /**
     * @return the callDialNum
     */
    public String getCallDialNum() {
        return callDialNum;
    }



    /**
     * @param callDialNum the callDialNum to set
     */
    public void setCallDialNum(String callDialNum) {
        this.callDialNum = callDialNum;
    }



    /**
     * @return the bhmcYnNm
     */
    public String getBhmcYnNm() {
        return bhmcYnNm;
    }



    /**
     * @param bhmcYnNm the bhmcYnNm to set
     */
    public void setBhmcYnNm(String bhmcYnNm) {
        this.bhmcYnNm = bhmcYnNm;
    }

}
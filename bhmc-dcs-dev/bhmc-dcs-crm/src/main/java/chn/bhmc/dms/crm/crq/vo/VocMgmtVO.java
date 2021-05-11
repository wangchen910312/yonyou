package chn.bhmc.dms.crm.crq.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
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
    ,@ValidField(field="emgcCallCd"            , mesgKey="global.lbl.emgcCallCd")          //긴급콜코드
    ,@ValidField(field="emgcRescStartYn"       , mesgKey="global.lbl.emgcRescStartYn")     //긴급구조시작여부
    ,@ValidField(field="cauCd"                 , mesgKey="ser.lbl.cause")                  //원인코드
    ,@ValidField(field="emgcRescStsfCd"        , mesgKey="global.lbl.emgcRescStsfCd")      //긴급구조만족도코드
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
    ,@ValidField(field="revMthCont"            , mesgKey="global.lbl.revMthCont")          //검토방안내용
    ,@ValidField(field="realPprocId"           , mesgKey="global.lbl.realPprocId")         //실처리인ID
    ,@ValidField(field="realPprocNm"           , mesgKey="global.lbl.realPprocId")         //실처리인명 --추가
    ,@ValidField(field="procDt"                , mesgKey="global.lbl.procDt")              //처리일자
    ,@ValidField(field="pprocTelNo"            , mesgKey="global.lbl.pprocTelNo")          //처리인전화번호
    ,@ValidField(field="pprocEmailNm"          , mesgKey="global.lbl.pprocEmailNm")        //처리인이메일명
    ,@ValidField(field="procRsltCont"          , mesgKey="global.lbl.procRsltCont")        //처리결과내용
    ,@ValidField(field="stsfIvstEmpId"         , mesgKey="global.lbl.stsfIvstEmpId")       //만족도조사인ID
    ,@ValidField(field="stsfIvstEmpNm"         , mesgKey="global.lbl.stsfIvstEmpId")       //만족도조사인명 --추가
    ,@ValidField(field="stsfIvstDt"            , mesgKey="global.lbl.stsfIvstDt")          //만족도조사일자
    ,@ValidField(field="stsfIvstRsltCont"      , mesgKey="global.lbl.stsfIvstRsltCont")    //만족도조사결과내용
    ,@ValidField(field="mthAchvHm"             , mesgKey="global.lbl.mthAchvHm")           //방안달성시간
    ,@ValidField(field="cmplStsfCd"            , mesgKey="global.lbl.cmplStsfCd")          //불만만족도코드
    ,@ValidField(field="cmplReAcptYn"          , mesgKey="global.lbl.cmplReAcptYn")        //불만재접수여부
    ,@ValidField(field="cmplReAcptCnt"         , mesgKey="global.lbl.cmplReAcptCnt")       //불만재접수횟수
    ,@ValidField(field="serReqNo"              , mesgKey="global.lbl.serReqNo")            //서비스요청번호
    ,@ValidField(field="cmplDlDeptNm"          , mesgKey="global.lbl.cmplDlDeptNm")        //불만전달부서명
    ,@ValidField(field="cmplDlEmpId"           , mesgKey="global.lbl.cmplDlEmpId")         //불만전달자ID
    ,@ValidField(field="cmplDlEmpNm"           , mesgKey="global.lbl.cmplDlEmpId")         //불만전달자명 --추가
    ,@ValidField(field="saleDt"                , mesgKey="global.lbl.saleDt")              //판매일자
    ,@ValidField(field="dstbNo"                , mesgKey="global.lbl.dstbNo")              //물류번호
    ,@ValidField(field="parOrdYn"              , mesgKey="global.lbl.parOrdYn")            //부품오더여부
    ,@ValidField(field="parOrdDt"              , mesgKey="global.lbl.parOrdDt")            //부품오더일자
    ,@ValidField(field="parArrvDt"             , mesgKey="global.lbl.parArrvDt")           //부품도착일자
    ,@ValidField(field="itemCd"                , mesgKey="par.lbl.itemCd")                 //품목코드
    ,@ValidField(field="bhmcYn"                , mesgKey="global.lbl.bhmcYn")              //BHMC여부
    ,@ValidField(field="bhmcVocNo"             , mesgKey="global.lbl.bhmcVocNo")           //BHMCVOC번호
    ,@ValidField(field="repairBookId"          , mesgKey="global.lbl.repairBookId")        //정비예약ID
    ,@ValidField(field="manufacturer"          , mesgKey="global.lbl.manufacturer")        //제조사/특약점
    ,@ValidField(field="dataShipStatCd"        , mesgKey="global.lbl.dataShipStatCd")      //자료배송상태
    ,@ValidField(field="regUsrId"              , mesgKey="global.lbl.regUsrId")            //등록자ID
    ,@ValidField(field="regDt"                 , mesgKey="global.lbl.regDt")               //등록일자
    ,@ValidField(field="updtUsrId"             , mesgKey="global.lbl.updtUsrId")           //수정자ID
    ,@ValidField(field="updtDt"                , mesgKey="global.lbl.updtDt")              //수정일자


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

    /**
    * VOC번호
    **/
//    @NotEmpty

    private  String                 vocNo;

    /**
    * VOC상태코드
    **/
    //VOC_STAT_CD

    private  String                 vocStatCd;

    /**
     * VOC상태코드명
     **/
     //VOC_STAT_NM

     private  String                 vocStatNm;

    /**
    * VOC유형코드
    **/
    //VOC_TP_CD

    private  String                 vocTpCd;

    /**
     * VOC유형코드명
     **/
     //VOC_TP_NM

     private  String                 vocTpNm;

    /**
    * 성향코드
    **/
    //TEND_CD

    private  String                 tendCd;

    /**
    * VOC유형하위1코드
    **/
    //VOC_TP_SUB1_CD

    private  String                 vocTpSub1Cd;

    /**
    * VOC유형하위2코드
    **/
    //VOC_TP_SUB2_CD

    private  String                 vocTpSub2Cd;

    /**
    * VOC유형하위3코드
    **/
    //VOC_TP_SUB3_CD

    private  String                 vocTpSub3Cd;

    /**
    * 접수출처코드
    **/
    //ACPT_SRC_CD

    private  String                 acptSrcCd;

    /**
    * 활동획득경로코드
    **/
    //ACTIVE_GAIN_PATH_CD

    private  String                 activeGainPathCd;

    /**
    * 불만원인코드
    **/
    //CMPL_CAU_CD

    private  String                 cmplCauCd;

    /**
    * 우선순위코드
    **/
    //PROR_CD

    private  String                 prorCd;

    /**
    * 처리시한코드
    **/
    //PROC_LMT_CD

    private  String                 procLmtCd;

    /**
    * 긴급콜코드
    **/
    //EMGC_CALL_CD

    private  String                 emgcCallCd;

    /**
    * 긴급구조시작여부
    **/
//    @NotEmpty

    private  String                 emgcRescStartYn;

    /**
    * 원인코드
    **/
    //CAU_CD

    private  String                 cauCd;

    /**
    * 긴급구조만족도코드
    **/
    //EMGC_RESC_STSF_CD

    private  String                 emgcRescStsfCd;

    /**
    * VOC종료일자
    **/
    //VOC_END_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   vocEndDt;

    /**
    * 수신전화번호
    **/
    //RECEIVE_TEL_NO

    private  String                 receiveTelNo;

    /**
    * 고객명
    **/
    //CUST_NM

    private  String                 custNm;

    /**
    * 고객번호
    **/
    //CUST_NO

    private  String                 custNo;

    /**
    * 고객선호연락번호
    **/
    //CUST_PREF_COMM_NO

    private  String                 custPrefCommNo;

    /**
    * 휴대폰번호
    **/
    //HP_NO

    private  String                 hpNo;

    /**
    * 집전화번호
    **/
    //HOME_TEL_NO

    private  String                 homeTelNo;

    /**
    * 직장전화번호
    **/
    //OFFICE_TEL_NO

    private  String                 officeTelNo;

    /**
    * 연계인고객명
    **/
    //PCON_CUST_NM

    private  String                 pconCustNm;

    /**
    * 연계인고객번호
    **/
    //PCON_CUST_NO

    private  String                 pconCustNo;

    /**
    * 연계인고객주요전화번호
    **/
    //PCON_CUST_MJR_TEL_NO

    private  String                 pconCustMjrTelNo;

    /**
    * 연계인고객휴대폰번호
    **/
    //PCON_CUST_HP_NO

    private  String                 pconCustHpNo;

    /**
    * 연계인고객집전화번호
    **/
    //PCON_CUST_HOME_TEL_NO

    private  String                 pconCustHomeTelNo;

    /**
    * 연계인고객직장전화번호
    **/
    //PCON_CUST_OFFICE_TEL_NO

    private  String                 pconCustOfficeTelNo;

    /**
    * 예약일자
    **/
    //RESV_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   resvDt;

    /**
    * 발신전화번호
    **/
    //SEND_TEL_NO

    private  String                 sendTelNo;

    /**
    * 연계인관계코드
    **/
    //PCON_REL_CD

    private  String                 pconRelCd;

    /**
    * 처리인ID
    **/
    //PPROC_ID

    private  String                 pprocId;

    /**
    * 협조부서명
    **/
    //COOP_DEPT_NM

    private  String                 coopDeptNm;

    /**
    * 사업부서명
    **/
    //BIZ_DEPT_NM

    private  String                 bizDeptNm;

    /**
    * 사무소명
    **/
    //OFFICE_NM

    private  String                 officeNm;

    /**
    * 성코드
    **/
    //SUNG_CD

    private  String                 sungCd;

    /**
    * 성명
    **/
    //SUNG_NM

    private  String                 sungNm;

    /**
    * 도시코드
    **/
    //CITY_CD

    private  String                 cityCd;

    /**
    * 도시명
    **/
    //CITY_NM

    private  String                 cityNm;

    /**
    * 차대번호
    **/
    //VIN_NO

    private  String                 vinNo;

    /**
    * 차량등록번호
    **/
    //CAR_REG_NO

    private  String                 carRegNo;

    /**
    * 차종코드
    **/
    //CARLINE_CD

    private  String                 carlineCd;

    /**
    * 차종명
    **/
    //CARLINE_NM

    private  String                 carlineNm;

    /**
    * 모델코드
    **/
    //MODEL_CD

    private  String                 modelCd;

    /**
    * 모델명
    **/
    //MODEL_NM

    private  String                 modelNm;

    /**
    * OCN코드
    **/
    //OCN_CD

    private  String                 ocnCd;

    /**
    * OCN명
    **/
    //OCN_NM

    private  String                 ocnNm;

    /**
    * 주행거리값
    **/
    //RUN_DIST_VAL

    private  String                 runDistVal;

    /**
    * 접수부서
    **/
    //ACPT_DEPT_NM

    private  String                 acptDeptNm;

    /**
    * 접수자ID
    **/
    //PACPT_ID

    private  String                 pacptId;

    /**
    * 접수일자
    **/
    //ACPT_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   acptDt;

    /**
    * 고객요청내용
    **/
    //CUST_REQ_CONT

    private  String                 custReqCont;

    /**
    * 고객구조위치내용
    **/
    //CUST_RESC_LOC_CONT

    private  String                 custRescLocCont;

    /**
    * 심사인ID
    **/
    //PEVAL_ID

    private  String                 pevalId;

    /**
    * 심사배정일자
    **/
    //EVAL_ALLOC_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   evalAllocDt;

    /**
    * 콜센터의견내용
    **/
    //CALL_CEN_OPN_CONT

    private  String                 callCenOpnCont;

    /**
    * 반송원인내용
    **/
    //RETURN_CAU_CONT

    private  String                 returnCauCont;

    /**
    * 승급원인코드
    **/
    //PMO_CAU_CD

    private  String                 pmoCauCd;

    /**
    * 승급일자
    **/
    //PMO_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   pmoDt;

    /**
    * 검토방안내용
    **/
    //REV_MTH_CONT

    private  String                 revMthCont;

    /**
    * 실처리인ID
    **/
    //REAL_PPROC_ID

    private  String                 realPprocId;

    /**
    * 처리일자
    **/
    //PROC_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   procDt;

    /**
    * 처리인전화번호
    **/
    //PPROC_TEL_NO

    private  String                 pprocTelNo;

    /**
    * 처리인이메일명
    **/
    //PPROC_EMAIL_NM

    private  String                 pprocEmailNm;

    /**
    * 처리결과내용
    **/
    //PROC_RSLT_CONT

    private  String                 procRsltCont;

    /**
    * 만족도조사인ID
    **/
    //STSF_IVST_EMP_ID

    private  String                 stsfIvstEmpId;

    /**
    * 만족도조사일자
    **/
    //STSF_IVST_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   stsfIvstDt;

    /**
    * 만족도조사결과내용
    **/
    //STSF_IVST_RSLT_CONT

    private  String                 stsfIvstRsltCont;

    /**
    * 방안달성시간
    **/
    //MTH_ACHV_HM

    private  int                    mthAchvHm;

    /**
    * 불만만족도코드
    **/
    //CMPL_STSF_CD

    private  String                 cmplStsfCd;

    /**
    * 불만재접수여부
    **/
//    @NotEmpty

    private  String                 cmplReAcptYn;

    /**
    * 불만재접수횟수
    **/
    //CMPL_RE_ACPT_CNT

    private  int                    cmplReAcptCnt;

    /**
    * 서비스요청번호
    **/
    //SER_REQ_NO

    private  String                 serReqNo;

    /**
    * 불만전달부서명
    **/
    //CMPL_DL_DEPT_NM

    private  String                 cmplDlDeptNm;

    /**
    * 불만전달자ID
    **/
    //CMPL_DL_EMP_ID

    private  String                 cmplDlEmpId;

    /**
    * 판매일자
    **/
    //SALE_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   saleDt;

    /**
    * 물류번호
    **/
    //DSTB_NO

    private  String                 dstbNo;

    /**
    * 부품오더여부
    **/
//    @NotEmpty

    private  String                 parOrdYn;

    /**
    * 부품오더일자
    **/
    //PAR_ORD_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   parOrdDt;

    /**
    * 부품도착일자
    **/
    //PAR_ARRV_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   parArrvDt;

    /**
    * 품목코드
    **/
    //ITEM_CD

    private  String                 itemCd;

    /**
    * BHMC여부
    **/
//    @NotEmpty

    private  String                 bhmcYn;

    /**
    * BHMCVOC번호
    **/
    //BHMC_VOC_NO

    private  String                 bhmcVocNo;

    /**
    * 등록자ID
    **/
//    @NotEmpty

    private  String                 regUsrId;

    /**
    * 등록일자
    **/
//    @NotEmpty
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   regDt;

    /**
    * 수정자ID
    **/
    //UPDT_USR_ID

    private  String                 updtUsrId;

    /**
    * 수정일자
    **/
    //UPDT_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   updtDt;

    /**
     * 처리부서명
     **/
     //PPROC_DEPT_NM
     private  String                pprocDeptNm;

     private  String            dlrCd;
     private  String            pltCd;
    private  String            cmmCd;
    private  String            cmmCdNm;
    private  String            vocCnt;
    private  String            vocCnt1;
    private  String            vocCnt2;
    private  String            vocCnt3;
    private  String            vocCnt4;
    private  String            vocCnt5;

    private  String            pprocNm;
    private  String            pacptNm;
    private  String            pevalNm;
    private  String            realPprocNm;
    private  String            stsfIvstEmpNm;
    private  String            cmplDlEmpNm;

    private  String            repairBookId;
    private  String            manufacturer;
    private  String            dataShipStatCd;




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
     * @return the emgcCallCd
     */
    public String getEmgcCallCd() {
        return emgcCallCd;
    }

    /**
     * @param emgcCallCd the emgcCallCd to set
     */
    public void setEmgcCallCd(String emgcCallCd) {
        this.emgcCallCd = emgcCallCd;
    }

    /**
     * @return the emgcRescStartYn
     */
    public String getEmgcRescStartYn() {
        return emgcRescStartYn;
    }

    /**
     * @param emgcRescStartYn the emgcRescStartYn to set
     */
    public void setEmgcRescStartYn(String emgcRescStartYn) {
        this.emgcRescStartYn = emgcRescStartYn;
    }

    /**
     * @return the cauCd
     */
    public String getCauCd() {
        return cauCd;
    }

    /**
     * @param cauCd the cauCd to set
     */
    public void setCauCd(String cauCd) {
        this.cauCd = cauCd;
    }

    /**
     * @return the emgcRescStsfCd
     */
    public String getEmgcRescStsfCd() {
        return emgcRescStsfCd;
    }

    /**
     * @param emgcRescStsfCd the emgcRescStsfCd to set
     */
    public void setEmgcRescStsfCd(String emgcRescStsfCd) {
        this.emgcRescStsfCd = emgcRescStsfCd;
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
     * @return the custRescLocCont
     */
    public String getCustRescLocCont() {
        return custRescLocCont;
    }

    /**
     * @param custRescLocCont the custRescLocCont to set
     */
    public void setCustRescLocCont(String custRescLocCont) {
        this.custRescLocCont = custRescLocCont;
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
     * @return the mthAchvHm
     */
    public int getMthAchvHm() {
        return mthAchvHm;
    }

    /**
     * @param mthAchvHm the mthAchvHm to set
     */
    public void setMthAchvHm(int mthAchvHm) {
        this.mthAchvHm = mthAchvHm;
    }

    /**
     * @return the cmplStsfCd
     */
    public String getCmplStsfCd() {
        return cmplStsfCd;
    }

    /**
     * @param cmplStsfCd the cmplStsfCd to set
     */
    public void setCmplStsfCd(String cmplStsfCd) {
        this.cmplStsfCd = cmplStsfCd;
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
     * @return the vocStatNm
     */
    public String getVocStatNm() {
        return vocStatNm;
    }

    /**
     * @param vocStatNm the vocStatNm to set
     */
    public void setVocStatNm(String vocStatNm) {
        this.vocStatNm = vocStatNm;
    }

    /**
     * @return the vocTpNm
     */
    public String getVocTpNm() {
        return vocTpNm;
    }

    /**
     * @param vocTpNm the vocTpNm to set
     */
    public void setVocTpNm(String vocTpNm) {
        this.vocTpNm = vocTpNm;
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
     * @return the vocCnt1
     */
    public String getVocCnt1() {
        return vocCnt1;
    }

    /**
     * @param vocCnt1 the vocCnt1 to set
     */
    public void setVocCnt1(String vocCnt1) {
        this.vocCnt1 = vocCnt1;
    }

    /**
     * @return the vocCnt2
     */
    public String getVocCnt2() {
        return vocCnt2;
    }

    /**
     * @param vocCnt2 the vocCnt2 to set
     */
    public void setVocCnt2(String vocCnt2) {
        this.vocCnt2 = vocCnt2;
    }

    /**
     * @return the vocCnt3
     */
    public String getVocCnt3() {
        return vocCnt3;
    }

    /**
     * @param vocCnt3 the vocCnt3 to set
     */
    public void setVocCnt3(String vocCnt3) {
        this.vocCnt3 = vocCnt3;
    }

    /**
     * @return the vocCnt4
     */
    public String getVocCnt4() {
        return vocCnt4;
    }

    /**
     * @param vocCnt4 the vocCnt4 to set
     */
    public void setVocCnt4(String vocCnt4) {
        this.vocCnt4 = vocCnt4;
    }

    /**
     * @return the vocCnt5
     */
    public String getVocCnt5() {
        return vocCnt5;
    }

    /**
     * @param vocCnt5 the vocCnt5 to set
     */
    public void setVocCnt5(String vocCnt5) {
        this.vocCnt5 = vocCnt5;
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
     * @return the manufacturer
     */
    public String getManufacturer() {
        return manufacturer;
    }

    /**
     * @param manufacturer the manufacturer to set
     */
    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    /**
     * @return the dataShipStatCd
     */
    public String getDataShipStatCd() {
        return dataShipStatCd;
    }

    /**
     * @param dataShipStatCd the dataShipStatCd to set
     */
    public void setDataShipStatCd(String dataShipStatCd) {
        this.dataShipStatCd = dataShipStatCd;
    }





    /**
    * VOC활동번호
    **/
    //@NotEmpty

    private  int             vocActiveNo;

    /**
    * 활동상태코드
    **/
    //ACTIVE_STAT_CD

    private  String          activeStatCd;

    /**
    * 활동유형코드
    **/
    //ACTIVE_TP_CD

    private  String          activeTpCd;

    /**
    * 활동유형하위코드
    **/
    //ACTIVE_TP_SUB_CD

    private  String          activeTpSubCd;

    /**
    * 활동결과내용
    **/
    //ACTIVE_RSLT_CONT

    private  String          activeRsltCont;

    /**
    * 활동코드
    **/
    //ACTIVE_CD

    private  String          activeCd;

    /**
    * 시작일자
    **/
    //START_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            startDt;

    /**
    * 종료일자
    **/
    //END_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            endDt;

    /**
    * 진행시간
    **/
    //PGSS_HM

    private  int             pgssHm;

    /**
    * 예정시작일자
    **/
    //EXPC_START_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            expcStartDt;

    /**
    * 예정종료일자
    **/
    //EXPC_END_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            expcEndDt;

    /**
    * 등록부서명
    **/
    //REG_DEPT_NM

    private  String          regDeptNm;


    /**
     * @return the vocActiveNo
     */
    public int getVocActiveNo() {
        return vocActiveNo;
    }

    /**
     * @param vocActiveNo the vocActiveNo to set
     */
    public void setVocActiveNo(int vocActiveNo) {
        this.vocActiveNo = vocActiveNo;
    }

    /**
     * @return the activeStatCd
     */
    public String getActiveStatCd() {
        return activeStatCd;
    }

    /**
     * @param activeStatCd the activeStatCd to set
     */
    public void setActiveStatCd(String activeStatCd) {
        this.activeStatCd = activeStatCd;
    }

    /**
     * @return the activeTpCd
     */
    public String getActiveTpCd() {
        return activeTpCd;
    }

    /**
     * @param activeTpCd the activeTpCd to set
     */
    public void setActiveTpCd(String activeTpCd) {
        this.activeTpCd = activeTpCd;
    }

    /**
     * @return the activeTpSubCd
     */
    public String getActiveTpSubCd() {
        return activeTpSubCd;
    }

    /**
     * @param activeTpSubCd the activeTpSubCd to set
     */
    public void setActiveTpSubCd(String activeTpSubCd) {
        this.activeTpSubCd = activeTpSubCd;
    }

    /**
     * @return the activeRsltCont
     */
    public String getActiveRsltCont() {
        return activeRsltCont;
    }

    /**
     * @param activeRsltCont the activeRsltCont to set
     */
    public void setActiveRsltCont(String activeRsltCont) {
        this.activeRsltCont = activeRsltCont;
    }

    /**
     * @return the activeCd
     */
    public String getActiveCd() {
        return activeCd;
    }

    /**
     * @param activeCd the activeCd to set
     */
    public void setActiveCd(String activeCd) {
        this.activeCd = activeCd;
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
     * @return the pgssHm
     */
    public int getPgssHm() {
        return pgssHm;
    }

    /**
     * @param pgssHm the pgssHm to set
     */
    public void setPgssHm(int pgssHm) {
        this.pgssHm = pgssHm;
    }

    /**
     * @return the expcStartDt
     */
    public Date getExpcStartDt() {
        return expcStartDt;
    }

    /**
     * @param expcStartDt the expcStartDt to set
     */
    public void setExpcStartDt(Date expcStartDt) {
        this.expcStartDt = expcStartDt;
    }

    /**
     * @return the expcEndDt
     */
    public Date getExpcEndDt() {
        return expcEndDt;
    }

    /**
     * @param expcEndDt the expcEndDt to set
     */
    public void setExpcEndDt(Date expcEndDt) {
        this.expcEndDt = expcEndDt;
    }

    /**
     * @return the regDeptNm
     */
    public String getRegDeptNm() {
        return regDeptNm;
    }

    /**
     * @param regDeptNm the regDeptNm to set
     */
    public void setRegDeptNm(String regDeptNm) {
        this.regDeptNm = regDeptNm;
    }
}
package chn.bhmc.dms.crm.crq.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VocMgmtSaveVO.java
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
    @ValidField(field="vocNo"                 , mesgKey="global.lbl.vocNo")               //VOC번호
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
   ,@ValidField(field="acptDt"                , mesgKey="global.lbl.acptDt")              //접수일자
   ,@ValidField(field="custReqCont"           , mesgKey="global.lbl.custReqCont")         //고객요청내용
   ,@ValidField(field="custRescLocCont"       , mesgKey="global.lbl.custRescLocCont")     //고객구조위치내용
   ,@ValidField(field="pevalId"               , mesgKey="global.lbl.pevalId")             //심사인ID
   ,@ValidField(field="evalAllocDt"           , mesgKey="global.lbl.evalAllocDt")         //심사배정일자
   ,@ValidField(field="callCenOpnCont"        , mesgKey="global.lbl.callCenOpnCont")      //콜센터의견내용
   ,@ValidField(field="returnCauCont"         , mesgKey="global.lbl.returnCauCont")       //반송원인내용
   ,@ValidField(field="pmoCauCd"              , mesgKey="global.lbl.pmoCauCd")            //승급원인코드
   ,@ValidField(field="pmoDt"                 , mesgKey="global.lbl.pmoDt")               //승급일자
   ,@ValidField(field="revMthCont"            , mesgKey="crm.lbl.revMthCont")          //검토방안내용
   ,@ValidField(field="realPprocId"           , mesgKey="global.lbl.realPprocId")         //실처리인ID
   ,@ValidField(field="procDt"                , mesgKey="global.lbl.procDt")              //처리일자
   ,@ValidField(field="pprocTelNo"            , mesgKey="global.lbl.pprocTelNo")          //처리인전화번호
   ,@ValidField(field="pprocEmailNm"          , mesgKey="global.lbl.pprocEmailNm")        //처리인이메일명
   ,@ValidField(field="procRsltCont"          , mesgKey="global.lbl.procRsltCont")        //처리결과내용
   ,@ValidField(field="stsfIvstEmpId"         , mesgKey="crm.lbl.stsfIvstEmpId")       //설문조사인ID
   ,@ValidField(field="stsfIvstDt"            , mesgKey="crm.lbl.vocStsfIvstDt")          //설문조사일자
   ,@ValidField(field="stsfIvstRsltCont"      , mesgKey="crm.lbl.stsfIvstRsltCont")    //설문결과
   ,@ValidField(field="mthAchvHm"             , mesgKey="global.lbl.mthAchvHm")           //방안달성시간
   ,@ValidField(field="cmplStsfCd"            , mesgKey="crm.lbl.cmplStsfCd")          //불만만족도
   ,@ValidField(field="cmplReAcptYn"          , mesgKey="crm.lbl.cmplReAcptYn")        //불만재접수여부
   ,@ValidField(field="cmplReAcptCnt"         , mesgKey="crm.lbl.cmplReAcptCnt")       //불만재접수횟수
   ,@ValidField(field="serReqNo"              , mesgKey="crm.lbl.serReqNo")            //서비스요청번호
   ,@ValidField(field="cmplDlDeptNm"          , mesgKey="crm.lbl.cmplDlDeptNm")        //불만전달부서명
   ,@ValidField(field="cmplDlEmpId"           , mesgKey="crm.lbl.vocCmplDlEmpId")         //불만전달자ID
   ,@ValidField(field="saleDt"                , mesgKey="crm.lbl.vocSaleDt")              //판매일자
   ,@ValidField(field="dstbNo"                , mesgKey="crm.lbl.dstbNo")              //물류번호
   ,@ValidField(field="parOrdYn"              , mesgKey="global.lbl.parOrdYn")            //부품오더여부
   ,@ValidField(field="parOrdDt"              , mesgKey="global.lbl.parOrdDt")            //부품오더일자
   ,@ValidField(field="parArrvDt"             , mesgKey="global.lbl.parArrvDt")           //부품도착일자
   ,@ValidField(field="itemCd"                , mesgKey="par.lbl.itemCd")                 //품목코드
   ,@ValidField(field="bhmcYn"                , mesgKey="global.lbl.bhmcYn")              //BHMC여부
   ,@ValidField(field="bhmcVocNo"             , mesgKey="global.lbl.bhmcVocNo")           //BHMCVOC번호
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

public class VocMgmtSaveVO extends BaseSaveVO<VocMgmtVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1328600105020840027L;

}
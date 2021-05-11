<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- BHMC 고객요청관리 -->
    <section class="group">
        <div class="header_area">
        <h1 class="title_basic"><spring:message code="crm.menu.BHMCVocMgmt" /></h1><!-- BHMC 고객요청관리 -->
            <div class="btn_right">
                <button type="button" class="btn_m" id="btnBHMC" >BHMC 전송<!-- BHMC 전송 --></button>
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
                <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
            </div>
        </div>

        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">BHMC 수신일</th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sRegStartDt1" name="sRegStartDt1" value="" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sRegEndDt1" name="sRegEndDt1" value="" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row">BHMC 전송일</th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sRegStartDt2" name="sRegStartDt2" value="" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sRegEndDt2" name="sRegEndDt2" value="" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row">DMS 등록여부</th>
                        <td>
                            <input id="autoActiveYn" name="autoActiveYn" value="" class="form_comboBox" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //BHMC 고객요청관리 -->



    <!-- 탭메뉴 -->
    <div class="tab_area">
        <ul>
            <li id="tab1" class="k-state-active">수신<%-- <spring:message code='global.title.active' /> --%><!-- 활동 --></li>
            <li id="tab2" >송신<%-- <spring:message code='crm.title.salesOpptHistory' /> --%><!-- SMS --></li>
        </ul>
        <div class="mt0">
            <section class="group">
            <!-- 활동 탭 그리드 -->
                <div class="table_grid mt10">
                    <div id="grid1"></div>
                </div>
            </section>
            <!-- //활동 탭 그리드 -->
        </div>
        <div class="mt0">
            <!-- SMS 탭 그리드 -->
            <section class="group">
                <div class="table_grid mt10">
                    <div id="grid2"></div>
                </div>
            </section>
            <!-- //SMS 탭 그리드 -->
        </div>
    </div>



    <script type="text/javascript">

        var crm601List = []; //VOC 불만의 원인


        <c:forEach var="obj" items="${crm601List}">
            crm601List.push({"value":"${obj.cmmCd}" , "text":"${obj.cmmCdNm}"});
        </c:forEach>

        $(document).ready(function() {

            // 계획일자
            $("#sRegStartDt1").kendoExtMaskedDatePicker({
                format:"<dms:configValue code='dateFormat' />"
                ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            });
            $("#sRegEndDt1").kendoExtMaskedDatePicker({
                format:"<dms:configValue code='dateFormat' />"
                ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            });

            // 계획일자
            $("#sRegStartDt2").kendoExtMaskedDatePicker({
                format:"<dms:configValue code='dateFormat' />"
                ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            });
            $("#sRegEndDt2").kendoExtMaskedDatePicker({
                format:"<dms:configValue code='dateFormat' />"
                ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            });

            // 자동실행여부
            $("#autoActiveYn").kendoExtDropDownList({
                dataSource:crm601List
                , dataTextField:"text"
                , dataValueField:"value"
                , optionLabel:" "
                , index:0
            });

            // 조회
            $("#btnSearch").kendoButton({
                click:function(e){
                    $("#salesActiveMgmtGrid").data("kendoExtGrid").dataSource.page(1);
                }
            });


            $(".tab_area").kendoExtTabStrip({
                animation:false
            });

            //그리드 1
            $("#grid1").kendoExtGrid({
                dataSource:{
                    transport:{
                        read:{
                            url:"<c:url value='/crm/crq/vocMgmt/selectVocMgmts.do' />"
                        }
                        ,parameterMap:function(options, operation) {
                            if (operation === "read") {

                                var params = {};

                                params["recordCountPerPage"]    = options.pageSize;
                                params["pageIndex"]             = options.page;
                                params["firstIndex"]            = options.skip;
                                params["lastIndex"]             = options.skip + options.take;
                                params["sort"]                  = options.sort;

                                /* params["sRegStartDt"]    = $("#sRegStartDt").data("kendoExtMaskedDatePicker").value();
                                params["sRegEndDt"]      = $("#sRegEndDt").data("kendoExtMaskedDatePicker").value();
                                params["sVocTpCd"]       = $("#sVocTpCd").val();
                                params["sVocStatCd"]     = $("#sVocStatCd").val();
                                params["sCmplCauCd"]     = $("#sCmplCauCd").val(); */

                                console.log(params);
                                return kendo.stringify(params);

                            }else if (operation !== "read" && options.models) {
                                return kendo.stringify(options.models);
                            }
                        }
                    }
                    ,schema:{
                        errors:"error"
                            ,data:"data"
                            ,total:"total"
                            ,model:{
                                id:"vocNo"
                                ,fields:{
                                      vocNo              :{type:"string", editable:false} //VOC번호
                                    , vocStatCd          :{type:"string", editable:false} //VOC상태코드
                                    , vocStatNm          :{type:"string", editable:false} //VOC상태코드명
                                    , vocTpCd            :{type:"string", editable:false} //VOC유형코드
                                    , vocTpNm            :{type:"string", editable:false} //VOC유형코드명
                                    , tendCd             :{type:"string", editable:false} //성향코드
                                    , vocTpSub1Cd        :{type:"string", editable:false} //VOC유형하위1코드
                                    , vocTpSub2Cd        :{type:"string", editable:false} //VOC유형하위2코드
                                    , vocTpSub3Cd        :{type:"string", editable:false} //VOC유형하위3코드
                                    , acptSrcCd          :{type:"string", editable:false} //접수출처코드
                                    , activeGainPathCd   :{type:"string", editable:false} //활동획득경로코드
                                    , cmplCauCd          :{type:"string", editable:false} //불만원인코드
                                    , prorCd             :{type:"string", editable:false} //우선순위코드
                                    , procLmtCd          :{type:"string", editable:false} //처리시한코드
                                    , vocEndDt           :{type:"date",   editable:false} //VOC종료일자
                                    , receiveTelNo       :{type:"string", editable:false} //수신전화번호
                                    , custNm             :{type:"string", editable:false} //고객명
                                    , custNo             :{type:"string", editable:false} //고객번호
                                    , custPrefCommNo     :{type:"string", editable:false} //고객선호연락번호
                                    , hpNo               :{type:"string", editable:false} //휴대폰번호
                                    , homeTelNo          :{type:"string", editable:false} //집전화번호
                                    , officeTelNo        :{type:"string", editable:false} //직장전화번호
                                    , pconCustNm         :{type:"string", editable:false} //연계인고객명
                                    , pconCustNo         :{type:"string", editable:false} //연계인고객번호
                                    , pconCustMjrTelNo   :{type:"string", editable:false} //연계인고객주요전화번호
                                    , pconCustHpNo       :{type:"string", editable:false} //연계인고객휴대폰번호
                                    , pconCustHomeTelNo  :{type:"string", editable:false} //연계인고객집전화번호
                                    , pconCustOfficeTelNo:{type:"string", editable:false} //연계인고객직장전화번호
                                    , resvDt             :{type:"date",   editable:false} //예약일자
                                    , sendTelNo          :{type:"string", editable:false} //발신전화번호
                                    , pconRelCd          :{type:"string", editable:false} //연계인관계코드
                                    , pprocId            :{type:"string", editable:false} //처리인ID
                                    , coopDeptNm         :{type:"string", editable:false} //협조부서명
                                    , bizDeptNm          :{type:"string", editable:false} //사업부서명
                                    , officeNm           :{type:"string", editable:false} //사무소명
                                    , sungCd             :{type:"string", editable:false} //성코드
                                    , sungNm             :{type:"string", editable:false} //성명
                                    , cityCd             :{type:"string", editable:false} //도시코드
                                    , cityNm             :{type:"string", editable:false} //도시명
                                    , vinNo              :{type:"string", editable:false} //차대번호
                                    , carRegNo           :{type:"string", editable:false} //차량등록번호
                                    , carlineCd          :{type:"string", editable:false} //차종코드
                                    , carlineNm          :{type:"string", editable:false} //차종명
                                    , modelCd            :{type:"string", editable:false} //모델코드
                                    , modelNm            :{type:"string", editable:false} //모델명
                                    , ocnCd              :{type:"string", editable:false} //OCN코드
                                    , ocnNm              :{type:"string", editable:false} //OCN명
                                    , runDistVal         :{type:"string", editable:false} //주행거리값
                                    , acptDeptNm         :{type:"string", editable:false} //접수부서
                                    , pacptId            :{type:"string", editable:false} //접수자ID
                                    , acptDt             :{type:"date",   editable:false} //접수일자
                                    , custReqCont        :{type:"string", editable:false} //고객요청내용
                                    , custRescLocCont    :{type:"string", editable:false} //고객구조위치내용
                                    , pevalId            :{type:"string", editable:false} //심사인ID
                                    , evalAllocDt        :{type:"date",   editable:false} //심사배정일자
                                    , callCenOpnCont     :{type:"string", editable:false} //콜센터의견내용
                                    , returnCauCont      :{type:"string", editable:false} //반송원인내용
                                    , pmoCauCd           :{type:"string", editable:false} //승급원인코드
                                    , pmoDt              :{type:"date",   editable:false} //승급일자
                                    , revMthCont         :{type:"string", editable:false} //검토방안내용
                                    , realPprocId        :{type:"string", editable:false} //실처리인ID
                                    , procDt             :{type:"date",   editable:false} //처리일자
                                    , pprocTelNo         :{type:"string", editable:false} //처리인전화번호
                                    , pprocEmailNm       :{type:"string", editable:false} //처리인이메일명
                                    , procRsltCont       :{type:"string", editable:false} //처리결과내용
                                    , stsfIvstEmpId      :{type:"string", editable:false} //만족도조사인ID
                                    , stsfIvstDt         :{type:"date",   editable:false} //만족도조사일자
                                    , stsfIvstRsltCont   :{type:"string", editable:false} //만족도조사결과내용
                                    , mthAchvHm          :{type:"string", editable:false} //방안달성시간
                                    , cmplStsfCd         :{type:"string", editable:false} //불만만족도코드
                                    , cmplReAcptYn       :{type:"string", editable:false} //불만재접수여부
                                    , cmplReAcptCnt      :{type:"string", editable:false} //불만재접수횟수
                                    , serReqNo           :{type:"string", editable:false} //서비스요청번호
                                    , cmplDlDeptNm       :{type:"string", editable:false} //불만전달부서명
                                    , cmplDlEmpId        :{type:"string", editable:false} //불만전달자ID
                                    , saleDt             :{type:"date",   editable:false} //판매일자
                                    , dstbNo             :{type:"string", editable:false} //물류번호
                                    , parOrdYn           :{type:"string", editable:false} //부품오더여부
                                    , parOrdDt           :{type:"date",   editable:false} //부품오더일자
                                    , parArrvDt          :{type:"date",   editable:false} //부품도착일자
                                    , itemCd             :{type:"string", editable:false} //품목코드
                                    , bhmcYn             :{type:"string", editable:false} //BHMC여부
                                    , bhmcVocNo          :{type:"string", editable:false} //BHMCVOC번호
                                    , regUsrId           :{type:"string", editable:false} //등록자ID
                                    , regDt              :{type:"date",   editable:false} //등록일자
                                    , updtUsrId          :{type:"string", editable:false} //수정자ID
                                    , updtDt             :{type:"date",   editable:false} //수정일자
                                    , pprocDeptNm        :{type:"string", editable:false} //처리부서명
                                    , vocCnt             :{type:"string", editable:false} //정보VIEW
                                    , dlrCd              :{type:"string"}
                                    , pltCd              :{type:"string"}
                                }
                            }
                    }
                    ,requestEnd:function(e){
                        if (e.type !== "read"){
                            //this.page(1);
                        }
                    }
                }
                ,autoBind:false
                ,editable:false
                ,height:305
                ,navigatable:false
                ,selectable:"row"
                ,columns:[
                            {field:"vocNo"              , title:"<spring:message code='global.lbl.vocNo' />"               , attributes:{"class":"ac"}, width:100}    //VOC번호
                            ,{field:"bhmcVocNo"          , title:"<spring:message code='global.lbl.BhmcVocNo' />"           , attributes:{"class":"ac"}, width:100}    //BHMCVOC번호
                            ,{field:"custNm"             , title:"<spring:message code='global.lbl.custNm' />"                , attributes:{"class":"ac"}, width:100}    //고객명
                            ,{field:"custPrefCommNo"     , title:"<spring:message code='global.lbl.telNumer' />"                , attributes:{"class":"ac"}, width:100}    //고객선호연락번호
                            ,{field:"vocTpCd"            , title:"<spring:message code='global.lbl.vocTpCd' />"               , hidden:true}                                 //VOC유형코드
                            ,{field:"vocTpNm"            , title:"<spring:message code='global.lbl.vocTpCd' />"               , attributes:{"class":"ac"}, width:100}    //VOC유형코드명
                            ,{field:"vocStatCd"          , title:"<spring:message code='global.lbl.vocStatCd' />"              , hidden:true}                                 //VOC상태코드
                            ,{field:"vocStatNm"          , title:"<spring:message code='global.lbl.vocStatCd' />"              , attributes:{"class":"ac"}, width:100}    //VOC상태코드명
                            ,{field:"procDt"             , title:"<spring:message code='crm.lbl.procDt' />"              , attributes:{"class":"ac"}, width:100
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }                 //처리일자
                            ,{field:"pprocDeptNm"        , title:"<spring:message code='crm.lbl.pprocDeptNm' />"         , attributes:{"class":"ac"}, width:100}    //사업부서명
                            ,{field:"pprocNm"            , title:"<spring:message code='crm.lbl.pprocId' />"           , attributes:{"class":"ac"}, width:100}    //처리인ID
                            ,{field:"regDt"              , title:"<spring:message code='global.lbl.regDt' />"                , attributes:{"class":"ac"}, width:100
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }                 //등록일자
                            ,{field:"tendCd"             , title:"성향코드"              , hidden:true}  //성향코드
                            ,{field:"vocTpSub1Cd"        , title:"VOC유형하위1코드"      , hidden:true}  //VOC유형하위1코드
                            ,{field:"vocTpSub2Cd"        , title:"VOC유형하위2코드"      , hidden:true}  //VOC유형하위2코드
                            ,{field:"vocTpSub3Cd"        , title:"VOC유형하위3코드"      , hidden:true}  //VOC유형하위3코드
                            ,{field:"acptSrcCd"          , title:"접수출처코드"          , hidden:true}  //접수출처코드
                            ,{field:"activeGainPathCd"   , title:"활동획득경로코드"      , hidden:true}  //활동획득경로코드
                            ,{field:"cmplCauCd"          , title:"불만원인코드"          , hidden:true}  //불만원인코드
                            ,{field:"prorCd"             , title:"우선순위코드"          , hidden:true}  //우선순위코드
                            ,{field:"procLmtCd"          , title:"처리시한코드"          , hidden:true}  //처리시한코드
                            ,{field:"vocEndDt"           , title:"VOC종료일자"           , hidden:true}  //VOC종료일자
                            ,{field:"receiveTelNo"       , title:"수신전화번호"          , hidden:true}  //수신전화번호
                            ,{field:"custNo"             , title:"고객번호"              , hidden:true}  //고객번호
                            ,{field:"hpNo"               , title:"휴대폰번호"            , hidden:true}  //휴대폰번호
                            ,{field:"homeTelNo"          , title:"집전화번호"            , hidden:true}  //집전화번호
                            ,{field:"officeTelNo"        , title:"직장전화번호"          , hidden:true}  //직장전화번호
                            ,{field:"pconCustNm"         , title:"연계인고객명"          , hidden:true}  //연계인고객명
                            ,{field:"pconCustNo"         , title:"연계인고객번호"        , hidden:true}  //연계인고객번호
                            ,{field:"pconCustMjrTelNo"   , title:"연계인고객주요전화번호", hidden:true}  //연계인고객주요전화번호
                            ,{field:"pconCustHpNo"       , title:"연계인고객휴대폰번호"  , hidden:true}  //연계인고객휴대폰번호
                            ,{field:"pconCustHomeTelNo"  , title:"연계인고객집전화번호"  , hidden:true}  //연계인고객집전화번호
                            ,{field:"pconCustOfficeTelNo", title:"연계인고객직장전화번호", hidden:true}  //연계인고객직장전화번호
                            ,{field:"resvDt"             , title:"예약일자"              , hidden:true
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }  //예약일자
                            ,{field:"sendTelNo"          , title:"발신전화번호"          , hidden:true}  //발신전화번호
                            ,{field:"pconRelCd"          , title:"연계인관계코드"        , hidden:true}  //연계인관계코드
                            ,{field:"coopDeptNm"         , title:"협조부서명"            , hidden:true}  //협조부서명
                            ,{field:"officeNm"           , title:"사무소명"              , hidden:true}  //사무소명
                            ,{field:"sungCd"             , title:"성코드"                , hidden:true}  //성코드
                            ,{field:"sungNm"             , title:"성명"                  , hidden:true}  //성명
                            ,{field:"cityCd"             , title:"도시코드"              , hidden:true}  //도시코드
                            ,{field:"cityNm"             , title:"도시명"                , hidden:true}  //도시명
                            ,{field:"vinNo"              , title:"차대번호"              , hidden:true}  //차대번호
                            ,{field:"carRegNo"           , title:"차량등록번호"          , hidden:true}  //차량등록번호
                            ,{field:"carlineCd"          , title:"차종코드"              , hidden:true}  //차종코드
                            ,{field:"carlineNm"          , title:"차종명"                , hidden:true}  //차종명
                            ,{field:"modelCd"            , title:"모델코드"              , hidden:true}  //모델코드
                            ,{field:"modelNm"            , title:"모델명"                , hidden:true}  //모델명
                            ,{field:"ocnCd"              , title:"OCN코드"               , hidden:true}  //OCN코드
                            ,{field:"ocnNm"              , title:"OCN명"                 , hidden:true}  //OCN명
                            ,{field:"runDistVal"         , title:"주행거리값"            , hidden:true}  //주행거리값
                            ,{field:"acptDeptNm"         , title:"접수부서"              , hidden:true}  //접수부서
                            ,{field:"pacptId"            , title:"접수자ID"              , hidden:true}  //접수자ID
                            ,{field:"acptDt"             , title:"접수일자"              , hidden:true
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }  //접수일자
                            ,{field:"custReqCont"        , title:"고객요청내용"          , hidden:true}  //고객요청내용
                            ,{field:"custRescLocCont"    , title:"고객구조위치내용"      , hidden:true}  //고객구조위치내용
                            ,{field:"pevalId"            , title:"심사인ID"              , hidden:true}  //심사인ID
                            ,{field:"evalAllocDt"        , title:"심사배정일자"          , hidden:true
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }  //심사배정일자
                            ,{field:"callCenOpnCont"     , title:"콜센터의견내용"        , hidden:true}  //콜센터의견내용
                            ,{field:"returnCauCont"      , title:"반송원인내용"          , hidden:true}  //반송원인내용
                            ,{field:"pmoCauCd"           , title:"승급원인코드"          , hidden:true}  //승급원인코드
                            ,{field:"pmoDt"              , title:"승급일자"              , hidden:true
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }  //승급일자
                            ,{field:"revMthCont"         , title:"검토방안내용"          , hidden:true}  //검토방안내용
                            ,{field:"realPprocId"        , title:"실처리인ID"            , hidden:true}  //실처리인ID
                            ,{field:"pprocTelNo"         , title:"처리인전화번호"        , hidden:true}  //처리인전화번호
                            ,{field:"pprocEmailNm"       , title:"처리인이메일명"        , hidden:true}  //처리인이메일명
                            ,{field:"procRsltCont"       , title:"처리결과내용"          , hidden:true}  //처리결과내용
                            ,{field:"stsfIvstEmpId"      , title:"만족도조사인ID"        , hidden:true}  //만족도조사인ID
                            ,{field:"stsfIvstDt"         , title:"만족도조사일자"        , hidden:true
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }  //만족도조사일자
                            ,{field:"stsfIvstRsltCont"   , title:"만족도조사결과내용"    , hidden:true}  //만족도조사결과내용
                            ,{field:"mthAchvHm"          , title:"방안달성시간"          , hidden:true}  //방안달성시간
                            ,{field:"cmplStsfCd"         , title:"불만만족도코드"        , hidden:true}  //불만만족도코드
                            ,{field:"cmplReAcptYn"       , title:"불만재접수여부"        , hidden:true}  //불만재접수여부
                            ,{field:"cmplReAcptCnt"      , title:"불만재접수횟수"        , hidden:true}  //불만재접수횟수
                            ,{field:"serReqNo"           , title:"서비스요청번호"        , hidden:true}  //서비스요청번호
                            ,{field:"cmplDlDeptNm"       , title:"불만전달부서명"        , hidden:true}  //불만전달부서명
                            ,{field:"cmplDlEmpId"        , title:"불만전달자ID"          , hidden:true}  //불만전달자ID
                            ,{field:"saleDt"             , title:"판매일자"              , hidden:true
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }  //판매일자
                            ,{field:"dstbNo"             , title:"물류번호"              , hidden:true}  //물류번호
                            ,{field:"parOrdYn"           , title:"부품오더여부"          , hidden:true}  //부품오더여부
                            ,{field:"parOrdDt"           , title:"부품오더일자"          , hidden:true
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }  //부품오더일자
                            ,{field:"parArrvDt"          , title:"부품도착일자"          , hidden:true
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }  //부품도착일자
                            ,{field:"itemCd"             , title:"품목코드"              , hidden:true}  //품목코드
                            ,{field:"bhmcYn"             , title:"BHMC여부"              , hidden:true}  //BHMC여부
                            ,{field:"regUsrId"           , title:"등록자ID"              , hidden:true}  //등록자ID
                            ,{field:"updtUsrId"          , title:"수정자ID"              , hidden:true}  //수정자ID
                            ,{field:"updtDt"             , title:"수정일자"              , hidden:true
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }  //수정일자
                            ,{field:"bizDeptNm"          , title:"사업부서"              , hidden:true}  //사업부서명
                            ,{field:"vocCnt1"            , title:"정보VIEW"              , hidden:true}  //정보VIEW
                            ,{field:"vocCnt3"            , title:"정보VIEW"              , hidden:true}  //정보VIEW
                            ,{field:"vocCnt4"            , title:"정보VIEW"              , hidden:true}  //정보VIEW
                            ,{field:"vocCnt5"            , title:"정보VIEW"              , hidden:true}  //정보VIEW
                            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
                            ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}                       // 사업장코드
                ]
            });
            //그리드 1

            //그리드 2
            $("#grid2").kendoExtGrid({
                dataSource:{
                    transport:{
                        read:{
                            url:"<c:url value='/crm/crq/vocMgmt/selectVocMgmts.do' />"
                        }
                        ,parameterMap:function(options, operation) {
                            if (operation === "read") {

                                var params = {};

                                params["recordCountPerPage"]    = options.pageSize;
                                params["pageIndex"]             = options.page;
                                params["firstIndex"]            = options.skip;
                                params["lastIndex"]             = options.skip + options.take;
                                params["sort"]                  = options.sort;

                                /* params["sRegStartDt"]    = $("#sRegStartDt").data("kendoExtMaskedDatePicker").value();
                                params["sRegEndDt"]      = $("#sRegEndDt").data("kendoExtMaskedDatePicker").value();
                                params["sVocTpCd"]       = $("#sVocTpCd").val();
                                params["sVocStatCd"]     = $("#sVocStatCd").val();
                                params["sCmplCauCd"]     = $("#sCmplCauCd").val(); */

                                console.log(params);
                                return kendo.stringify(params);

                            }else if (operation !== "read" && options.models) {
                                return kendo.stringify(options.models);
                            }
                        }
                    }
                    ,schema:{
                        errors:"error"
                            ,data:"data"
                            ,total:"total"
                            ,model:{
                                id:"vocNo"
                                ,fields:{
                                      vocNo              :{type:"string", editable:false} //VOC번호
                                    , vocStatCd          :{type:"string", editable:false} //VOC상태코드
                                    , vocStatNm          :{type:"string", editable:false} //VOC상태코드명
                                    , vocTpCd            :{type:"string", editable:false} //VOC유형코드
                                    , vocTpNm            :{type:"string", editable:false} //VOC유형코드명
                                    , tendCd             :{type:"string", editable:false} //성향코드
                                    , vocTpSub1Cd        :{type:"string", editable:false} //VOC유형하위1코드
                                    , vocTpSub2Cd        :{type:"string", editable:false} //VOC유형하위2코드
                                    , vocTpSub3Cd        :{type:"string", editable:false} //VOC유형하위3코드
                                    , acptSrcCd          :{type:"string", editable:false} //접수출처코드
                                    , activeGainPathCd   :{type:"string", editable:false} //활동획득경로코드
                                    , cmplCauCd          :{type:"string", editable:false} //불만원인코드
                                    , prorCd             :{type:"string", editable:false} //우선순위코드
                                    , procLmtCd          :{type:"string", editable:false} //처리시한코드
                                    , vocEndDt           :{type:"date",   editable:false} //VOC종료일자
                                    , receiveTelNo       :{type:"string", editable:false} //수신전화번호
                                    , custNm             :{type:"string", editable:false} //고객명
                                    , custNo             :{type:"string", editable:false} //고객번호
                                    , custPrefCommNo     :{type:"string", editable:false} //고객선호연락번호
                                    , hpNo               :{type:"string", editable:false} //휴대폰번호
                                    , homeTelNo          :{type:"string", editable:false} //집전화번호
                                    , officeTelNo        :{type:"string", editable:false} //직장전화번호
                                    , pconCustNm         :{type:"string", editable:false} //연계인고객명
                                    , pconCustNo         :{type:"string", editable:false} //연계인고객번호
                                    , pconCustMjrTelNo   :{type:"string", editable:false} //연계인고객주요전화번호
                                    , pconCustHpNo       :{type:"string", editable:false} //연계인고객휴대폰번호
                                    , pconCustHomeTelNo  :{type:"string", editable:false} //연계인고객집전화번호
                                    , pconCustOfficeTelNo:{type:"string", editable:false} //연계인고객직장전화번호
                                    , resvDt             :{type:"date",   editable:false} //예약일자
                                    , sendTelNo          :{type:"string", editable:false} //발신전화번호
                                    , pconRelCd          :{type:"string", editable:false} //연계인관계코드
                                    , pprocId            :{type:"string", editable:false} //처리인ID
                                    , coopDeptNm         :{type:"string", editable:false} //협조부서명
                                    , bizDeptNm          :{type:"string", editable:false} //사업부서명
                                    , officeNm           :{type:"string", editable:false} //사무소명
                                    , sungCd             :{type:"string", editable:false} //성코드
                                    , sungNm             :{type:"string", editable:false} //성명
                                    , cityCd             :{type:"string", editable:false} //도시코드
                                    , cityNm             :{type:"string", editable:false} //도시명
                                    , vinNo              :{type:"string", editable:false} //차대번호
                                    , carRegNo           :{type:"string", editable:false} //차량등록번호
                                    , carlineCd          :{type:"string", editable:false} //차종코드
                                    , carlineNm          :{type:"string", editable:false} //차종명
                                    , modelCd            :{type:"string", editable:false} //모델코드
                                    , modelNm            :{type:"string", editable:false} //모델명
                                    , ocnCd              :{type:"string", editable:false} //OCN코드
                                    , ocnNm              :{type:"string", editable:false} //OCN명
                                    , runDistVal         :{type:"string", editable:false} //주행거리값
                                    , acptDeptNm         :{type:"string", editable:false} //접수부서
                                    , pacptId            :{type:"string", editable:false} //접수자ID
                                    , acptDt             :{type:"date",   editable:false} //접수일자
                                    , custReqCont        :{type:"string", editable:false} //고객요청내용
                                    , custRescLocCont    :{type:"string", editable:false} //고객구조위치내용
                                    , pevalId            :{type:"string", editable:false} //심사인ID
                                    , evalAllocDt        :{type:"date",   editable:false} //심사배정일자
                                    , callCenOpnCont     :{type:"string", editable:false} //콜센터의견내용
                                    , returnCauCont      :{type:"string", editable:false} //반송원인내용
                                    , pmoCauCd           :{type:"string", editable:false} //승급원인코드
                                    , pmoDt              :{type:"date",   editable:false} //승급일자
                                    , revMthCont         :{type:"string", editable:false} //검토방안내용
                                    , realPprocId        :{type:"string", editable:false} //실처리인ID
                                    , procDt             :{type:"date",   editable:false} //처리일자
                                    , pprocTelNo         :{type:"string", editable:false} //처리인전화번호
                                    , pprocEmailNm       :{type:"string", editable:false} //처리인이메일명
                                    , procRsltCont       :{type:"string", editable:false} //처리결과내용
                                    , stsfIvstEmpId      :{type:"string", editable:false} //만족도조사인ID
                                    , stsfIvstDt         :{type:"date",   editable:false} //만족도조사일자
                                    , stsfIvstRsltCont   :{type:"string", editable:false} //만족도조사결과내용
                                    , mthAchvHm          :{type:"string", editable:false} //방안달성시간
                                    , cmplStsfCd         :{type:"string", editable:false} //불만만족도코드
                                    , cmplReAcptYn       :{type:"string", editable:false} //불만재접수여부
                                    , cmplReAcptCnt      :{type:"string", editable:false} //불만재접수횟수
                                    , serReqNo           :{type:"string", editable:false} //서비스요청번호
                                    , cmplDlDeptNm       :{type:"string", editable:false} //불만전달부서명
                                    , cmplDlEmpId        :{type:"string", editable:false} //불만전달자ID
                                    , saleDt             :{type:"date",   editable:false} //판매일자
                                    , dstbNo             :{type:"string", editable:false} //물류번호
                                    , parOrdYn           :{type:"string", editable:false} //부품오더여부
                                    , parOrdDt           :{type:"date",   editable:false} //부품오더일자
                                    , parArrvDt          :{type:"date",   editable:false} //부품도착일자
                                    , itemCd             :{type:"string", editable:false} //품목코드
                                    , bhmcYn             :{type:"string", editable:false} //BHMC여부
                                    , bhmcVocNo          :{type:"string", editable:false} //BHMCVOC번호
                                    , regUsrId           :{type:"string", editable:false} //등록자ID
                                    , regDt              :{type:"date",   editable:false} //등록일자
                                    , updtUsrId          :{type:"string", editable:false} //수정자ID
                                    , updtDt             :{type:"date",   editable:false} //수정일자
                                    , pprocDeptNm        :{type:"string", editable:false} //처리부서명
                                    , vocCnt             :{type:"string", editable:false} //정보VIEW
                                    , dlrCd              :{type:"string"}
                                    , pltCd              :{type:"string"}
                                }
                            }
                    }
                    ,requestEnd:function(e){
                        if (e.type !== "read"){
                            //this.page(1);
                        }
                    }
                }
                ,autoBind:false
                ,editable:false
                ,height:305
                ,navigatable:false
                ,selectable:"row"
                ,columns:[
                            {field:"vocNo"              , title:"<spring:message code='global.lbl.vocNo' />"               , attributes:{"class":"ac"}, width:100}    //VOC번호
                            ,{field:"bhmcVocNo"          , title:"<spring:message code='global.lbl.BhmcVocNo' />"           , attributes:{"class":"ac"}, width:100}    //BHMCVOC번호
                            ,{field:"custNm"             , title:"<spring:message code='global.lbl.custNm' />"                , attributes:{"class":"ac"}, width:100}    //고객명
                            ,{field:"custPrefCommNo"     , title:"<spring:message code='global.lbl.telNumer' />"                , attributes:{"class":"ac"}, width:100}    //고객선호연락번호
                            ,{field:"vocTpCd"            , title:"<spring:message code='global.lbl.vocTpCd' />"               , hidden:true}                                 //VOC유형코드
                            ,{field:"vocTpNm"            , title:"<spring:message code='global.lbl.vocTpCd' />"               , attributes:{"class":"ac"}, width:100}    //VOC유형코드명
                            ,{field:"vocStatCd"          , title:"<spring:message code='global.lbl.vocStatCd' />"              , hidden:true}                                 //VOC상태코드
                            ,{field:"vocStatNm"          , title:"<spring:message code='global.lbl.vocStatCd' />"              , attributes:{"class":"ac"}, width:100}    //VOC상태코드명
                            ,{field:"procDt"             , title:"<spring:message code='crm.lbl.procDt' />"              , attributes:{"class":"ac"}, width:100
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }                 //처리일자
                            ,{field:"pprocDeptNm"        , title:"<spring:message code='crm.lbl.pprocDeptNm' />"         , attributes:{"class":"ac"}, width:100}    //사업부서명
                            ,{field:"pprocNm"            , title:"<spring:message code='crm.lbl.pprocId' />"           , attributes:{"class":"ac"}, width:100}    //처리인ID
                            ,{field:"regDt"              , title:"<spring:message code='global.lbl.regDt' />"                , attributes:{"class":"ac"}, width:100
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }                 //등록일자
                            ,{field:"tendCd"             , title:"성향코드"              , hidden:true}  //성향코드
                            ,{field:"vocTpSub1Cd"        , title:"VOC유형하위1코드"      , hidden:true}  //VOC유형하위1코드
                            ,{field:"vocTpSub2Cd"        , title:"VOC유형하위2코드"      , hidden:true}  //VOC유형하위2코드
                            ,{field:"vocTpSub3Cd"        , title:"VOC유형하위3코드"      , hidden:true}  //VOC유형하위3코드
                            ,{field:"acptSrcCd"          , title:"접수출처코드"          , hidden:true}  //접수출처코드
                            ,{field:"activeGainPathCd"   , title:"활동획득경로코드"      , hidden:true}  //활동획득경로코드
                            ,{field:"cmplCauCd"          , title:"불만원인코드"          , hidden:true}  //불만원인코드
                            ,{field:"prorCd"             , title:"우선순위코드"          , hidden:true}  //우선순위코드
                            ,{field:"procLmtCd"          , title:"처리시한코드"          , hidden:true}  //처리시한코드
                            ,{field:"vocEndDt"           , title:"VOC종료일자"           , hidden:true}  //VOC종료일자
                            ,{field:"receiveTelNo"       , title:"수신전화번호"          , hidden:true}  //수신전화번호
                            ,{field:"custNo"             , title:"고객번호"              , hidden:true}  //고객번호
                            ,{field:"hpNo"               , title:"휴대폰번호"            , hidden:true}  //휴대폰번호
                            ,{field:"homeTelNo"          , title:"집전화번호"            , hidden:true}  //집전화번호
                            ,{field:"officeTelNo"        , title:"직장전화번호"          , hidden:true}  //직장전화번호
                            ,{field:"pconCustNm"         , title:"연계인고객명"          , hidden:true}  //연계인고객명
                            ,{field:"pconCustNo"         , title:"연계인고객번호"        , hidden:true}  //연계인고객번호
                            ,{field:"pconCustMjrTelNo"   , title:"연계인고객주요전화번호", hidden:true}  //연계인고객주요전화번호
                            ,{field:"pconCustHpNo"       , title:"연계인고객휴대폰번호"  , hidden:true}  //연계인고객휴대폰번호
                            ,{field:"pconCustHomeTelNo"  , title:"연계인고객집전화번호"  , hidden:true}  //연계인고객집전화번호
                            ,{field:"pconCustOfficeTelNo", title:"연계인고객직장전화번호", hidden:true}  //연계인고객직장전화번호
                            ,{field:"resvDt"             , title:"예약일자"              , hidden:true
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }  //예약일자
                            ,{field:"sendTelNo"          , title:"발신전화번호"          , hidden:true}  //발신전화번호
                            ,{field:"pconRelCd"          , title:"연계인관계코드"        , hidden:true}  //연계인관계코드
                            ,{field:"coopDeptNm"         , title:"협조부서명"            , hidden:true}  //협조부서명
                            ,{field:"officeNm"           , title:"사무소명"              , hidden:true}  //사무소명
                            ,{field:"sungCd"             , title:"성코드"                , hidden:true}  //성코드
                            ,{field:"sungNm"             , title:"성명"                  , hidden:true}  //성명
                            ,{field:"cityCd"             , title:"도시코드"              , hidden:true}  //도시코드
                            ,{field:"cityNm"             , title:"도시명"                , hidden:true}  //도시명
                            ,{field:"vinNo"              , title:"차대번호"              , hidden:true}  //차대번호
                            ,{field:"carRegNo"           , title:"차량등록번호"          , hidden:true}  //차량등록번호
                            ,{field:"carlineCd"          , title:"차종코드"              , hidden:true}  //차종코드
                            ,{field:"carlineNm"          , title:"차종명"                , hidden:true}  //차종명
                            ,{field:"modelCd"            , title:"모델코드"              , hidden:true}  //모델코드
                            ,{field:"modelNm"            , title:"모델명"                , hidden:true}  //모델명
                            ,{field:"ocnCd"              , title:"OCN코드"               , hidden:true}  //OCN코드
                            ,{field:"ocnNm"              , title:"OCN명"                 , hidden:true}  //OCN명
                            ,{field:"runDistVal"         , title:"주행거리값"            , hidden:true}  //주행거리값
                            ,{field:"acptDeptNm"         , title:"접수부서"              , hidden:true}  //접수부서
                            ,{field:"pacptId"            , title:"접수자ID"              , hidden:true}  //접수자ID
                            ,{field:"acptDt"             , title:"접수일자"              , hidden:true
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }  //접수일자
                            ,{field:"custReqCont"        , title:"고객요청내용"          , hidden:true}  //고객요청내용
                            ,{field:"custRescLocCont"    , title:"고객구조위치내용"      , hidden:true}  //고객구조위치내용
                            ,{field:"pevalId"            , title:"심사인ID"              , hidden:true}  //심사인ID
                            ,{field:"evalAllocDt"        , title:"심사배정일자"          , hidden:true
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }  //심사배정일자
                            ,{field:"callCenOpnCont"     , title:"콜센터의견내용"        , hidden:true}  //콜센터의견내용
                            ,{field:"returnCauCont"      , title:"반송원인내용"          , hidden:true}  //반송원인내용
                            ,{field:"pmoCauCd"           , title:"승급원인코드"          , hidden:true}  //승급원인코드
                            ,{field:"pmoDt"              , title:"승급일자"              , hidden:true
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }  //승급일자
                            ,{field:"revMthCont"         , title:"검토방안내용"          , hidden:true}  //검토방안내용
                            ,{field:"realPprocId"        , title:"실처리인ID"            , hidden:true}  //실처리인ID
                            ,{field:"pprocTelNo"         , title:"처리인전화번호"        , hidden:true}  //처리인전화번호
                            ,{field:"pprocEmailNm"       , title:"처리인이메일명"        , hidden:true}  //처리인이메일명
                            ,{field:"procRsltCont"       , title:"처리결과내용"          , hidden:true}  //처리결과내용
                            ,{field:"stsfIvstEmpId"      , title:"만족도조사인ID"        , hidden:true}  //만족도조사인ID
                            ,{field:"stsfIvstDt"         , title:"만족도조사일자"        , hidden:true
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }  //만족도조사일자
                            ,{field:"stsfIvstRsltCont"   , title:"만족도조사결과내용"    , hidden:true}  //만족도조사결과내용
                            ,{field:"mthAchvHm"          , title:"방안달성시간"          , hidden:true}  //방안달성시간
                            ,{field:"cmplStsfCd"         , title:"불만만족도코드"        , hidden:true}  //불만만족도코드
                            ,{field:"cmplReAcptYn"       , title:"불만재접수여부"        , hidden:true}  //불만재접수여부
                            ,{field:"cmplReAcptCnt"      , title:"불만재접수횟수"        , hidden:true}  //불만재접수횟수
                            ,{field:"serReqNo"           , title:"서비스요청번호"        , hidden:true}  //서비스요청번호
                            ,{field:"cmplDlDeptNm"       , title:"불만전달부서명"        , hidden:true}  //불만전달부서명
                            ,{field:"cmplDlEmpId"        , title:"불만전달자ID"          , hidden:true}  //불만전달자ID
                            ,{field:"saleDt"             , title:"판매일자"              , hidden:true
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }  //판매일자
                            ,{field:"dstbNo"             , title:"물류번호"              , hidden:true}  //물류번호
                            ,{field:"parOrdYn"           , title:"부품오더여부"          , hidden:true}  //부품오더여부
                            ,{field:"parOrdDt"           , title:"부품오더일자"          , hidden:true
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }  //부품오더일자
                            ,{field:"parArrvDt"          , title:"부품도착일자"          , hidden:true
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }  //부품도착일자
                            ,{field:"itemCd"             , title:"품목코드"              , hidden:true}  //품목코드
                            ,{field:"bhmcYn"             , title:"BHMC여부"              , hidden:true}  //BHMC여부
                            ,{field:"regUsrId"           , title:"등록자ID"              , hidden:true}  //등록자ID
                            ,{field:"updtUsrId"          , title:"수정자ID"              , hidden:true}  //수정자ID
                            ,{field:"updtDt"             , title:"수정일자"              , hidden:true
                                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }  //수정일자
                            ,{field:"bizDeptNm"          , title:"사업부서"              , hidden:true}  //사업부서명
                            ,{field:"vocCnt1"            , title:"정보VIEW"              , hidden:true}  //정보VIEW
                            ,{field:"vocCnt3"            , title:"정보VIEW"              , hidden:true}  //정보VIEW
                            ,{field:"vocCnt4"            , title:"정보VIEW"              , hidden:true}  //정보VIEW
                            ,{field:"vocCnt5"            , title:"정보VIEW"              , hidden:true}  //정보VIEW
                            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
                            ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}                       // 사업장코드
                ]
            });
            //그리드 2

        });

    </script>

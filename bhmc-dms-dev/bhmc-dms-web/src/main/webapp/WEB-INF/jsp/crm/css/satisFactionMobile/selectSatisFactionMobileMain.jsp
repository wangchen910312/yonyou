<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 만족도 조사 관리 -->
<section class="group">

    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="crm.menu.satisFaction" /></h1><!-- 만족도 조사 -->
        <div class="btn_right">
        <dms:access viewId="VIEW-D-11144" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m" id="btnSearch"><spring:message code="crm.btn.playSurvey" /></button><!-- 설문하기 -->
        </dms:access>
        <dms:access viewId="VIEW-D-11145" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
        </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch" >
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
                    <th scope="row"><spring:message code="crm.lbl.stsfIvstNm"/></th><!-- 만족도 조사 명 -->
                    <td>
                        <input id="sSeq" class="form_comboBox" />
                        <input type="hidden" id="searchFlag" name="searchFlag" value="F" >
                    </td>
                    <th scope="row"> <spring:message code="global.lbl.custNm" /> </th><!-- 고객명 -->
                    <td>
                        <div class="form_search">
                            <%-- <input id="custNm" class="form_input" placeholder="<spring:message code='global.lbl.custSearch' />" disabled="disabled" /><!-- // 고객조회 -->
                            <a href="javascript:;" id="custSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a> --%>
                            <input id="custNmSearch" name="custNmSearch" type="text" value=""  placeholder="<spring:message code='global.lbl.custSearch' />" class="form_input onKey_down" />
                            <input id="custNm" name="custNm" type="hidden" value="" class="form_input" data-json-obj="true" />
                            <!-- <input id="custNm" name="custNm" class="form_input"/> -->
                            <input type="hidden" id="custNo" name="custNo" >
                            <a href="#;" class="custSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                        </div>
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code='crm.btn.playSurvey'/><!-- 설문하기 --></h2>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

   <!-- 설문 -->
    <div>
        <form id="surveyInfoForm" >
            <div class="survey">
                <h2 id="surveyName"></h2>
                <div class="survey_content">
                <input type="hidden" id="subyTmplSeq" name="subyTmplSeq" >
                    <ul>
                    </ul>
                </div>
            </div>
        </form>
    </div>
    <!-- //설문 -->

</section>


<script type="text/javascript">
/*************************************************************
데이터 셋업
*************************************************************/
    //1.만족도 조사명 콤보 DataSource
    var stsfIvstNmList = [{"seq":"", "stsfIvstNm":""}];
    <c:forEach var="obj" items="${stsfIvstNmList}">
    stsfIvstNmList.push({
        "seq":"${obj.seq}"
        ,"stsfIvstNm":"${obj.stsfIvstNm}"
        });
    </c:forEach>
    var stsfIvstNmMap = dms.data.arrayToMap(stsfIvstNmList, function(obj){ return obj.seq; });
    var popupWindow;


$(document).ready(function() {

    // 유형
    $("#sSeq").kendoExtDropDownList({
        dataTextField:"stsfIvstNm"
        , dataValueField:"seq"
        , dataSource:stsfIvstNmList
        , filter:"contains"
    });

    $("#btnSave").kendoButton({
        click:function(e){

            var questionCnt = 0;
            var radioCnt = 0;
            var checkboxCnt = 0;
            var textAreaCnt = 0;

            if($("#sSeq").val() == ""){
                //만족도 조사(을)를 선택해 주시기 바랍니다.
                dms.notification.info("<spring:message code='global.lbl.custStsfSurvey' var='custStsfSurvey' /><spring:message code='global.info.check.field' arguments='${custStsfSurvey}' />");
                $("#sSeq").focus();
                return;
            };

            if($("#custNo").val() == ""){
                //고객명(을)를 선택해 주시기 바랍니다.
                dms.notification.info("<spring:message code='global.lbl.custNm' var='custNm' /><spring:message code='global.info.check.field' arguments='${custNm}' />");
                $("#custNm").focus();
                return;
            };

            if($('#searchFlag').val() == "F"){
                //설문하기(을)를 클릭해 주시기 바랍니다.
                dms.notification.info("<spring:message code='crm.btn.playSurvey' var='playSurvey' /><spring:message code='global.info.check.field' arguments='${playSurvey}' />");
                return;
            };

            var nameArr = [];
            var val = [];
            var seq = $("#sSeq").val();
            var strArr = [];
            var stsfIvstYn = $("input:radio[name=stsfIvstYn]:checked").val();

            $(":radio[name ^='rad_']").each(function(index){
                nameArr[index] = $(this).attr("name");
            });

            var uniqueNames = [];

            $.each(nameArr,function(i,el){
                if($.inArray(el,uniqueNames) === -1)
                    uniqueNames.push(el)
            });

            questionCnt = uniqueNames.length;

            //라디오 문제 선택 건수
            radioCnt = validChk(uniqueNames,"noTxt");

            var params = [];
            var idx = 0;
            for(var k=0; k<uniqueNames.length;k++){
                var rad_nm = uniqueNames[k];
                if($("input:radio[name="+rad_nm+"]").is(":checked")){
                    obj = {};
                    obj["stsfIvstRsltSeq"] = "0";//만족도 조사 결과 일련번호
                    obj["stsfIvstSeq"] = seq;//만족도 조사 일련번호
                    obj["subyTmplSeq"] = $("input:radio[name="+rad_nm+"]:checked").attr("data-sts");//설문 템플릿 일련번호
                    obj["qestSeq"] = $("input:radio[name="+rad_nm+"]:checked").attr("data-stqs");//질문 일련번호
                    obj["qestWgtVal"] = $("input:radio[name="+rad_nm+"]:checked").attr("data-qwv");//질문 가중치
                    obj["qestTpCd"] = $("input:radio[name="+rad_nm+"]:checked").attr("data-qtc");//질문 유형코드
                    obj["answSeq"] = $("input:radio[name="+rad_nm+"]:checked").attr("data-is");//질문일련번호
                    obj["answScoreVal"] = $("input:radio[name="+rad_nm+"]:checked").attr("data-score");
                    obj["custNo"] = $("#custNo").val();
                    obj["custNm"] = $("#custNm").val();
                    obj["sbjvAnswCont"] = "";
                    params.push(obj);
                    idx++;
                };
            };

            nameArr = [];
            $(":checkbox[name ^='chk_']").each(function(index){
                nameArr[index] = $(this).attr("name");
            });

            uniqueNames = [];

            $.each(nameArr,function(i,el){
                if($.inArray(el,uniqueNames) === -1)
                    uniqueNames.push(el)
            });

            questionCnt = questionCnt + uniqueNames.length;

            //CheckBox 문제 선택 건수
            checkboxCnt = validChk(uniqueNames,"noTxt");

            var chkCnt = 0;
            var result = false;
            var asc = 0;
            var qIdx = 0;
            var checkedCnt = 0;
            $(":checkbox[name ^='chk_']").each(function(index){
                if($(this).is(":checked")){

                    obj = {};
                    obj["stsfIvstRsltSeq"] = "0";//만족도 조사 결과 일련번호
                    obj["stsfIvstSeq"] = seq;//만족도 조사 일련번호
                    obj["subyTmplSeq"] = $(this).attr("data-sts");//설문 템플릿 일련번호
                    obj["qestSeq"] = $(this).attr("data-stqs");//질문 일련번호
                    obj["qestWgtVal"] = $(this).attr("data-qwv");//질문 가중치
                    obj["qestTpCd"] = $(this).attr("data-qtc");//질문 유형코드
                    obj["answSeq"] = $(this).attr("data-is");//답변 일련번호
                    obj["answScoreVal"] = $(this).attr("data-score");
                    obj["sbjvAnswCont"] = "";
                    obj["custNo"] = $("#custNo").val();
                    obj["custNm"] = $("#custNm").val();
                    params.push(obj);
                    idx++;
                }

                //다중선택시 답변선택가능 갯수 validation 설정
                asc = $(this).attr("data-asc");
                qIdx = $(this).attr("data-qIdx");
                checkedCnt = $("input[name ^= chk_"+$(this).attr("data-sts")+"_"+$(this).attr("data-stqs")+"]:checked").length

                if ( asc > 0 && checkedCnt > asc) {
                    result = true;
                    $("#p_chk_"+$(this).attr("data-sts")+"_"+$(this).attr("data-stqs")).parent('div').attr("style","color:red;");
                    return false;
                } else {
                    $("#p_chk_"+$(this).attr("data-sts")+"_"+$(this).attr("data-stqs")).parent('div').attr("style","color:;");
                };

            });

            if(result){
                // {qIdx}번 문항은 {asc}건 이하로만 선택해주세요.
                dms.notification.warning("<spring:message code='crm.err.surveyOverCheck' arguments='"+qIdx+", "+asc+"' />");
                return;
            }

            //textArea Validation시작
            nameArr = [];
            $("textarea[name ^='txt_']").each(function(i){
                nameArr[i] = $(this).attr("id");
            });

            uniqueNames = [];

            $.each(nameArr,function(i,el){
                if($.inArray(el,uniqueNames) === -1)
                    uniqueNames.push(el)
            });

            questionCnt = questionCnt + uniqueNames.length;

            for(var p=0; p<uniqueNames.length;p++){
                var txt_nm = uniqueNames[p];

                if($('#'+txt_nm+'').val() != ""){
                    textAreaCnt++;
                    obj = {};
                    obj["stsfIvstRsltSeq"] = "0";//만족도 조사 결과 일련번호
                    obj["stsfIvstSeq"] = seq;//만족도 조사 일련번호
                    obj["subyTmplSeq"] = $('#'+txt_nm+'').attr("data-sts");//설문 템플릿 일련번호
                    obj["qestSeq"] = $('#'+txt_nm+'').attr("data-stqs");//질문 일련번호
                    obj["qestWgtVal"] = $('#'+txt_nm+'').attr("data-qwv");//질문 가중치
                    obj["qestTpCd"] = $('#'+txt_nm+'').attr("data-qtc");//질문 유형코드
                    obj["answSeq"] = null;//답변 일련번호
                    obj["answScoreVal"] = 0;
                    obj["sbjvAnswCont"] = $('#'+txt_nm+'').val();
                    obj["custNo"] = $("#custNo").val();
                    obj["custNm"] = $("#custNm").val();
                    params.push(obj);
                    idx++;
                }
            };

            if (  dms.string.isEmpty(stsfIvstYn) ) {
                // {만족여부} 을(를) 선택하세요.
                dms.notification.warning("<spring:message code='crm.lbl.stsfIvstYn' var='returnMsg' /><spring:message code='global.info.check.field' arguments='${returnMsg}' />");
                return;
            };

            var answeredCnt = radioCnt + checkboxCnt + textAreaCnt;
            var noAnsweredCnt = questionCnt - answeredCnt;
            var confirmMsg ="<spring:message code='crm.lbl.answer'/>: "+answeredCnt+"<spring:message code='crm.lbl.count'/>,"+" <spring:message code='crm.lbl.noAnswer'/>: "+noAnsweredCnt+"<spring:message code='crm.lbl.count'/>"+"<br/>"+"<spring:message code='crm.lbl.toSave'/>";

            dms.window.confirm({
                title:""
                ,message:confirmMsg
                ,confirmBtnText:"<spring:message code='global.lbl.yes'/>"
                ,cancelBtnText:"<spring:message code='global.lbl.n'/>"
                ,callback:function(result){

                    if ( result ) {

                        var satisFactionMobileResultVO = {};
                        satisFactionMobileResultVO["stsfIvstSeq"] = seq;//만족도 조사 일련번호
                        satisFactionMobileResultVO["stsfIvstRsltSeq"] = 0;//만족도 조사 결과 일련번호
                        satisFactionMobileResultVO["subyTmplSeq"] = $("#subyTmplSeq").val(); //설문 템플릿 일련번호
                        satisFactionMobileResultVO["custNo"] = $("#custNo").val(); //고객번호
                        satisFactionMobileResultVO["custNm"] = $("#custNm").val(); //고객명
                        satisFactionMobileResultVO["stsfIvstYn"] = stsfIvstYn;
                        satisFactionMobileResultVO["cmplReasonCont"] = $("#cmplReasonCont").val();

                        //console.log(params);
                        //return;
                        $.ajax({
                            url:"<c:url value='/crm/css/satisFactionMobile/multiUsrAnswerSurveys.do'/>"
                            ,dataType:"json"
                            ,type:"POST"
                            ,contentType:"application/json"
                            ,data:JSON.stringify({"insertList":params, "satisFactionMobileResultVO":satisFactionMobileResultVO})
                            ,error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            }
                            ,success:function(data) {

                                if ( data.result === "SUCCESS" ) {

                                    dms.notification.success("<spring:message code='global.info.success'/>");
                                    $("#btnSave").data("kendoButton").enable(false);
                                    $(".survey_content > ul").empty();
                                    //설문에 응해주셔서 감사합니다.
                                    var htmladd = '<li><p class="txt_thanks"><spring:message code="crm.info.surveySucess"/></p></li>';
                                    $(".survey_content > ul").append(htmladd);
                                    $("#custNmSearch").val("");
                                    $("#custNo").val("");
                                    $("#custNm").val("");
                                    $('#searchFlag').val("F");

                                } else if ( data.result === "FAIL" ) {
                                    // {설문}등록 실패되었습니다.
                                    //dms.notification.warning("<spring:message code='crm.lbl.survey' var='custStsfSurvey' /><spring:message code='global.err.regFailedParam' arguments='${custStsfSurvey}' />");
                                } else {
                                    // {설문}을(를) 확인하여 주세요.
                                    //dms.notification.warning("<spring:message code='crm.lbl.survey' var='custStsfSurvey' /><spring:message code='global.info.confirmMsgParam' arguments='${custStsfSurvey}' />");
                                };
                            }
                            ,beforeSend:function(xhr) {
                                dms.loading.show();
                            }
                            ,complete:function(xhr, status) {
                                dms.loading.hide();
                            }
                        });

                    } else {

                        return false;

                    };

                    return false;

                }
            });

        }
        ,enable:false

    });

    // 만족도 조사 응답 건수
    function validChk(uniqueNames,txt){
        var nm = "";
        var cnt = 0;
        for(var j=0; j<uniqueNames.length;j++){
            nm = uniqueNames[j];
            if(txt == "noTxt"){
                if($("input[name="+nm+"]").is(":checked")){
                    //응답했으면  .
                    cnt++;
                }
            }
        }
        return cnt;
    }
    // 만족도 조사 응답 건수

    //설문하기
    $("#btnSearch").kendoButton({
        click:function(e){

            if($("#sSeq").val() == ""){
                //만족도 조사(을)를 선택해 주시기 바랍니다.
                dms.notification.info("<spring:message code='global.lbl.custStsfSurvey' var='custStsfSurvey' /><spring:message code='global.info.check.field' arguments='${custStsfSurvey}' />");
                $('#btnSearch').val("F");
                $('#sSeq').focus();
                return;
            }

            if($("#custNo").val() == ""){
                //고객명(을)를 선택해 주시기 바랍니다.
                dms.notification.info("<spring:message code='global.lbl.custNm' var='custNm' /><spring:message code='global.info.check.field' arguments='${custNm}' />");
                $('#btnSearch').val("F");
                $('#custNm').focus();
                return;
            }

            $('#searchFlag').val("T");

            $("#surveyName").empty();
            var surveyName = $("#sSeq").data("kendoExtDropDownList").text();
            $("#surveyName").append(surveyName);

            $(".survey_content > ul").empty();
            var sSeq = $("#sSeq").val();

            $.ajax({
                url:"<c:url value='/crm/css/satisFactionMobile/selectSatisFactionSurveyMobiles.do'/>",
                data:JSON.stringify({"sSeq":sSeq}),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(result) {

                    var questionList = result["questionList"];
                    var answerList = result["answerList"];
                    var subyTmplSeq = result["subyTmplSeq"];
                    $("#subyTmplSeq").val(subyTmplSeq);
                    var template = "";
                    var result = "";
                    var data = [];
                    var lastIdx;

                    // 만족도 조사 설문지 html 생성

                    //시작헤드
                    var headTmpl = '<li><h3>#:index #. #:qestCont # #:answSelCntCont #</h3><div class="answer_area">';

                    //라디오(객관식 단일)
                    var singleTmpl = '<p><label class="label_check"><input type="radio" id="rad_#:subyTmplSeq #_#:subyTmplQestSeq #_#:itemSeq #" '+
                                      'class="form_check"'+
                                      'name="rad_#:subyTmplSeq #_#:subyTmplQestSeq #"'+
                                      'value="#:itemSeq #"'+
                                      'data-qwv="#:qestWgtVal#" data-qtc="#:qestTpCd#" data-sts="#:subyTmplSeq#"  data-stqs="#:subyTmplQestSeq#"  data-is="#:itemSeq#" data-score="#:answScoreVal#" /> #:answCont #</label></p>';

                    //체크박스(객관식 다중)
                    var multiTmpl = '<p id="p_chk_#:subyTmplSeq #_#:subyTmplQestSeq #"><label class="label_check"><input type="checkbox" id="chk_#:subyTmplSeq #_#:subyTmplQestSeq #_#:itemSeq #" '+
                                      'class="form_check"'+
                                      'name="chk_#:subyTmplSeq #_#:subyTmplQestSeq #"'+
                                      'value="#:itemSeq #"'+
                                      'data-qIdx="#:qIdx #" data-asc="#:answSelCnt#" data-qwv="#:qestWgtVal#" data-qtc="#:qestTpCd#" data-sts="#:subyTmplSeq#" data-stqs="#:subyTmplQestSeq#"  data-is="#:itemSeq#"  data-score="#:answScoreVal#"/>#:answCont #</label></p>';
                    //주관식
                    var shortTmpl = '<textarea rows="4" cols="" id="txt_#:subyTmplSeq #_#:subyTmplQestSeq #" maxlength="1333" '+
                                      'class="form_textarea"'+
                                      'name="txt_#:subyTmplSeq #_#:subyTmplQestSeq #"'+
                                      'data-qwv="#:qestWgtVal#" data-qtc="#:qestTpCd#" data-sts="#:subyTmplSeq#"  data-stqs="#:subyTmplQestSeq#"  data-is="#:itemSeq#"  data-score="#:answScoreVal#" style="width:100%;"></textarea>';
                    //종료
                    var tailTmpl = '</div></li>';

                    //만족여부
                    var stsfIvstYnTmpl = '<li style="border-top:1px solid black;"><h3><spring:message code="crm.lbl.stsfIvstYn"/></h3><div class="answer_area">'
                                       + '<p><label class="label_check"><input type="radio" id="stsfIvstY" name="stsfIvstYn" value="Y" class="form_check" />&nbsp;<spring:message code="crm.lbl.satisfaction"/></label>&nbsp;&nbsp;<label class="label_check"><input type="radio" id="stsfIvstN" name="stsfIvstYn" value="N" class="form_check" />&nbsp;<spring:message code="crm.lbl.dissatisfied"/></label></p>'
                                       + '</div></li>';

                    //총결
                    var cmplReasonContTmpl = '<li><h3><spring:message code="crm.lbl.cmplReasonCont"/></h3><div class="answer_area">'+
                                      '<textarea rows="4" cols="" id="cmplReasonCont" maxlength="1333" '+
                                      'class="form_textarea"'+
                                      'name="cmplReasonCont'+
                                      'style="width:100%;"></textarea></div></li>';

                    //문제 for
                    var qIdx = 0;
                    for(var i=0;i < questionList.length;i++){
                        var subyTmplSeq = questionList[i].subyTmplSeq;
                        var subyTmplQestSeq = questionList[i].subyTmplQestSeq;
                        //체크박스의 경우 선택할수 있는  갯수가 정해져 있을경우 문제옆에 선택가능한 갯수를 표현해 준다.
                        var answSelCntCont = "";
                        if ( questionList[i].qestTpCd == "02" && questionList[i].answSelCnt > 0 ) {
                            answSelCntCont = '( <spring:message code="crm.lbl.selected" arguments="'+questionList[i].answSelCnt+'" /> )';
                        };

                        qIdx = i+1;
                        template = kendo.template(headTmpl);
                        data = {
                                index:qIdx
                                ,qestCont:questionList[i].qestCont
                                ,answSelCntCont:answSelCntCont
                        }
                        result += template(data);
                        lastIdx = qIdx+1;

                        //답변 for
                        for(var j=0;j < answerList.length;j++){
                            if(questionList[i].qestTpCd == "01"){
                                //객관식 단답형
                                if(subyTmplSeq == answerList[j].subyTmplSeq && subyTmplQestSeq == answerList[j].subyTmplQestSeq){
                                    template = kendo.template(singleTmpl);
                                    data = {subyTmplSeq:answerList[j].subyTmplSeq
                                            ,subyTmplQestSeq:answerList[j].subyTmplQestSeq
                                            , itemSeq:answerList[j].itemSeq
                                            , answCont:answerList[j].answCont
                                            , answScoreVal:answerList[j].answScoreVal
                                            , qestWgtVal:questionList[i].qestWgtVal
                                            , qestTpCd:questionList[i].qestTpCd
                                    }
                                    result += template(data);
                                }
                            }else if(questionList[i].qestTpCd == "02"){
                                //객관식 다답형
                                if(subyTmplSeq == answerList[j].subyTmplSeq && subyTmplQestSeq == answerList[j].subyTmplQestSeq){
                                    template = kendo.template(multiTmpl);
                                    data = {subyTmplSeq:answerList[j].subyTmplSeq
                                            ,subyTmplQestSeq:answerList[j].subyTmplQestSeq
                                            , itemSeq:answerList[j].itemSeq
                                            , answCont:answerList[j].answCont
                                            , answScoreVal:answerList[j].answScoreVal
                                            , qestWgtVal:questionList[i].qestWgtVal
                                            , qestTpCd:questionList[i].qestTpCd
                                            , answSelCnt:questionList[i].answSelCnt
                                            , qIdx:qIdx
                                    }
                                    result += template(data)
                                }
                            }else{
                                //주관식
                                if(subyTmplSeq == answerList[j].subyTmplSeq && subyTmplQestSeq == answerList[j].subyTmplQestSeq){
                                    template = kendo.template(shortTmpl);
                                    data = {subyTmplSeq:answerList[j].subyTmplSeq
                                            ,subyTmplQestSeq:answerList[j].subyTmplQestSeq
                                            , itemSeq:answerList[j].itemSeq
                                            , answScoreVal:answerList[j].answScoreVal
                                            , qestWgtVal:questionList[i].qestWgtVal
                                            , qestTpCd:questionList[i].qestTpCd
                                    }
                                    result += template(data);
                                }
                            }
                        }
                    }

                    //만족여부 추가
                    result += stsfIvstYnTmpl;
                    result += cmplReasonContTmpl;//총결 추가
                    result += tailTmpl;
                    $(".survey_content > ul").append(result);
                    $("#btnSave").data("kendoButton").enable(true);

                }
                ,beforeSend:function(xhr) {
                    dms.loading.show();
                }
                ,complete:function(xhr, status) {
                    dms.loading.hide();
                }
            });
        }
    });


    // 고객명에서 ObKeyDown
    $(".onKey_down").keydown(function(e){
        if (e.keyCode == 13) {
            if($(this).val() != "") {
                $(".custSearch").click();
            }
        }
    });

    // 고객 검색 팝업
    $(".custSearch").click(function(){

        //var custTp = $("#custTp").data("kendoExtDropDownList").value();
        var custNm = $("#custNmSearch").val();
        /* if (custTp == "02") {
            custNm = $("#custNmSearchC").val();
        } */

        popupWindow = dms.window.popup({
            windowId:"customerSearchPopupMain"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "custNm":custNm
                    , "type"  :null
                    , "callbackFunc":function(data){
                        if (data.length >= 1) {
                            //console.log("Popup Search Result:::");
                            //console.log(data[0]);
                            //console.log(data[0].custNo);
                            if ( dms.string.isNotEmpty(data[0].custNo) ) {
                                $("#custNo").val(data[0].custNo);
                                $("#custNm").val(data[0].custNm);
                                $("#custNmSearch").val(data[0].custNm);

                                //$("#custNo").val("CA07AA20160800051");
                            }
                            //$("#custNo").val("CA07AA20160800051");

                            //parent.popupWindow.close();

                            //$("#btnCustSearch").click();
                        }
                    }
                }
            }
        })
        /* popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {
                            $("#custNo").val(data[0].custNo);
                            $("#custNm").val(data[0].custNm);
                        }
                    }
                }
            }
        }); */
    });


});

</script>








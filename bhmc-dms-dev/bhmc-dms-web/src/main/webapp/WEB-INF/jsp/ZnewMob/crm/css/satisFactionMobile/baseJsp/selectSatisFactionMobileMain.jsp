<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

    <section id="content">
        <!-- content_list -->
        <c:import url="/WEB-INF/jsp/ZnewMob/crm/css/satisFactionMobile/listJsp/selectSatisFactionMobileList.jsp"></c:import>

    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="crm.menu.satisFaction" /> <spring:message code="global.title.searchCondition" /><!-- 만족도조사 조회조건  --></h2>
        </div>
       <div class="formarea">
            <table class="flist01">
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                 <tbody>
                    <tr>
                        <th scope="row"><spring:message code="crm.menu.satisFaction"/></th><!-- 만족도 조사 명 -->
                        <td>
                            <input id="sSeq_" class="form_comboBox" />
                            <input type="hidden" id="searchFlag" name="searchFlag" value="F" >
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <dms:access viewId="VIEW-D-12724" hasPermission="${dms:getPermissionMask('READ')}">
            <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
            </dms:access>
        </div>
    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <input type="hidden" id="sSeq" />
            <input type="hidden" id="stsfIvstNm" />
            <input type="hidden" id="custNo" />
            <input type="hidden" id="custNm" />

            <div class="content_title conttitlePrev">
                <h2 id="surveyName"><spring:message code="crm.lbl.stsfIvstNm" /><!-- 만족도조사명 --></h2>
            </div>
            <!-- 설문 -->
            <form id="surveyInfoForm" >
                <div class="survey">
                        <dl>
                        </dl>
                </div>
            </form>
        </section>
    </div>
    </section>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>


<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';

var toDt                = "${toDt}",
sevenDtBf           = "${sevenDtBf}";

//1.만족도 조사명 콤보 DataSource
var stsfIvstNmList = [{"seq":"", "stsfIvstNm":""}];
<c:forEach var="obj" items="${stsfIvstNmList}">
stsfIvstNmList.push({
    "seq":"${obj.seq}"
    ,"stsfIvstNm":"${obj.stsfIvstNm}"
    });
</c:forEach>
var stsfIvstNmMap = dms.data.arrayToMap(stsfIvstNmList, function(obj){ return obj.seq; });

$(document).ready(function() {
    $("#sRegDtFrom").val(chgServerDate2Str(sevenDtBf));
    $("#sRegDtTo").val(chgServerDate2Str(toDt));

    $("#sSeq_").kendoExtDropDownList({
        dataTextField:"stsfIvstNm"
        ,dataValueField:"seq"
        ,dataSource:stsfIvstNmList
        ,index:0
    });

    // 타이틀
    $("#header_title").html("<spring:message code='crm.menu.satisFaction' />");<!-- 만족도조사 -->
    //$("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    listData.read();
    // 목록 조회
    //$("#mainList").attr("src", "<c:url value='/mob/crm/css/satisFactionMobile/selectSatisFactionMobileList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sStsfIvstNm = $("#sStsfIvstNm");
            if(sStsfIvstNm.val() != "") $("#search1Area span[name='searchStr']").text(sStsfIvstNm.val());
            initList();
            listData.read();
        }
    });
});
</script>
<script>

function customerSearchPopup(dataItem){
        popupWindow = mob.window.popup({
            windowId:"customerSearchPopupMain"
            , content:{
                url:"<c:url value='/mob/crm/cif/customerInfo/selectCustSearchPopup.do?tabSel=1'/>"  //Tab선택 0:탭선택가능, 1:고객정보탭만 표시, 2:차량정보탭만 표시
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "callbackFunc":function(data){
                        if ( dms.string.isNotEmpty(data.custNo) ) {
                            $("#custNo").val(data.custNo);
                            $("#custNm").val(data.custNm);
                            $("#content_list").css("display","none");
                            $("#content_search").css("display","none");
                            $("#content_detail").css("display","block");
                            $("#stsfIvstNm").val(dataItem.stsfIvstNm);
                            $("#sSeq").val(dataItem.seq);
                            loadSurverInfo(data.custNo, dataItem.seq);
                         }
                    }
               }
          }
    })
}

function loadSurverInfo(custNo, seq){
        $("#surveyName").empty();
        $("#surveyName").empty();
        var surveyName = $("#stsfIvstNm").val();
        var custNm = $("#custNm").val();
        $("#surveyName").append(surveyName + " - " + custNm);
        $(".survey").empty();
        var sSeq = seq;
        sUserId = "admin";//$("#sStsfIvstNm").val();
        sCustNo = "01";
        var callUrl = "<c:url value='/crm/css/satisFactionMobile/selectSatisFactionSurveyMobiles.do'/>";

        $.ajax({
            url:"<c:url value='/mob/crm/css/satisFactionMobile/selectSatisFactionSurveyMobiles.do'/>",
            data:JSON.stringify({"sSeq":sSeq}),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
            }
        }).done(function(result) {
            var questionList = result["questionList"];
            var questionListCnt = result["questionListCnt"];
            var answerList = result["answerList"];
            var answerListCnt = result["answerListCnt"];
            var template = "";
            var result = "";
            var data = [];

            //시작헤드
            var headTmpl = '<div class="survey"><dl><dt>#:index #. #:qestCont #</dt>';

            // 라디오(객관식 단일)
            var singleTmpl = '<dd><input type="radio" id="rad_#:subyTmplSeq #_#:subyTmplQestSeq #_#:itemSeq #" '+
                              'class="f_radio"'+
                              'name="rad_#:subyTmplSeq #_#:subyTmplQestSeq #"'+
                              'value="#:itemSeq #"'+
                              'data-qwv="#:qestWgtVal#" data-qtc="#:qestTpCd#" data-sts="#:subyTmplSeq#"  data-stqs="#:subyTmplQestSeq#"  data-is="#:itemSeq#" data-score="#:answScoreVal#" /><label for="rad_#:subyTmplSeq #_#:subyTmplQestSeq #_#:itemSeq #">#:answCont #</label></dd>';
            //체크박스(객관식 다중)
            var multiTmpl = '<dd><input type="checkbox" id="chk_#:subyTmplSeq #_#:subyTmplQestSeq #_#:itemSeq #" '+
                              'class="f_check"'+
                              'name="chk_#:subyTmplSeq #_#:subyTmplQestSeq #"'+
                              'value="#:itemSeq #"'+
                              'data-qwv="#:qestWgtVal#" data-qtc="#:qestTpCd#" data-sts="#:subyTmplSeq#" data-stqs="#:subyTmplQestSeq#"  data-is="#:itemSeq#"  data-score="#:answScoreVal#"/><label for="chk_#:subyTmplSeq #_#:subyTmplQestSeq #_#:itemSeq #">#:answCont #</label></dd>';
            //주관식
            var shortTmpl = '<dd><textarea rows="4" cols="" id="txt_#:subyTmplSeq #_#:subyTmplQestSeq #" maxlength="1333" '+
                              'class="form_textarea"'+
                              'name="txt_#:subyTmplSeq #_#:subyTmplQestSeq #"'+
                              'data-qwv="#:qestWgtVal#" data-qtc="#:qestTpCd#" data-sts="#:subyTmplSeq#"  data-stqs="#:subyTmplQestSeq#"  data-is="#:itemSeq#"  data-score="#:answScoreVal#" style="width:100%;"></textarea></dd>';
            //종료
            var tailTmpl = '';

            var btnAreaFirst = '<div class="con_btnarea"><div><span name="nextBtn" class="btnd1" onclick="moveNext(this, '+questionList.length+');"><spring:message code="global.btn.next"/></span></div></div>';
            var btnAreaBoth = '<div class="con_btnarea btncount2"><div><span name="prevBtn" class="btnd1" onclick="movePrev(this, '+questionList.length+');" ><spring:message code="global.btn.pre"/></span></div><div><span name="nextBtn" class="btnd1" onclick="moveNext(this, '+questionList.length+');"><spring:message code="global.btn.next"/></span></div></div>';
            var btnAreaLast = '<div class="con_btnarea btncount2"><div><span name="prevBtn" class="btnd1" onclick="movePrev(this, '+questionList.length+');"><spring:message code="global.btn.pre"/></span></div><div><span name="saveBtn" class="btnd1" onclick="save();" ><spring:message code="global.btn.save"/></span></div></div>';

            //만족여부
            var stsfIvstYnTmpl = '<div class="survey" id="stsfIvstYnTmpl">'
                               + '<dl><dt><spring:message code="crm.lbl.stsfIvstYn"/></dt>'
                               + '<dd><input type="radio" class ="f_radio" id="stsfIvstY" name="stsfIvstYn" value="Y" /><label for="stsfIvstY"><spring:message code="crm.lbl.satisfaction"/></label></dd>'
                               + '<dd><input type="radio" class ="f_radio" id="stsfIvstN" name="stsfIvstYn" value="N" /><label for="stsfIvstN"><spring:message code="crm.lbl.dissatisfied"/></label></dd>'
                               + '</dl>'
                               + '</div>';

            //불만족원인
            var cmplReasonContTmpl = '<div class="survey" id="surveyLast"><dl><dt><spring:message code="crm.lbl.cmplReasonCont"/></dt>'+
                              '<dd><textarea rows="4" cols="" id="cmplReasonCont" maxlength="1333" '+
                              'class="form_textarea"'+
                              'name="cmplReasonCont'+
                              'style="width:100%;"></textarea></dd></dl></div>';

            //문제 for
            for(var i=0;i < questionList.length;i++){
                var subyTmplSeq = questionList[i].subyTmplSeq;
                var subyTmplQestSeq = questionList[i].subyTmplQestSeq;

                template = kendo.template(headTmpl.replace('><dl>', 'id="survey'+i+'"><dl>'));
                data = {
                        index:(i+1)
                        ,qestCont:questionList[i].qestCont
                }
                result += template(data);
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
                result += '</dl></div>';
                if(i==0){
                    result += btnAreaFirst.replace('<div class="con_btnarea', '<div id="btnArea'+i+'" class="con_btnarea').replace('name="nextBtn"', 'name="nextBtn" id="nextBtn'+i+'"');
                }else{
                    result += btnAreaBoth.replace('<div class="con_btnarea', '<div id="btnArea'+i+'" class="con_btnarea').replace('name="prevBtn"', 'name="prevBtn" id="prevBtn'+i+'"').replace('name="nextBtn"', 'name="nextBtn" id="nextBtn'+i+'"');
                }

            }
            //불만족 원인 추가
            result = result + stsfIvstYnTmpl;
            result = result + cmplReasonContTmpl + btnAreaLast.replace('<div class="con_btnarea', '<div id="btnArea'+questionList.length+'" class="con_btnarea').replace('name="prevBtn"', 'name="prevBtn" id="prevBtn'+questionList.length+'"');
            result += tailTmpl;

            $(".survey").append(result);
            for(var i=0;i < questionList.length;i++){
                if(i==0){
                    $("#survey"+i).css("display", "block");
                    $("#btnArea"+i).css("display", "block");
                }else{
                    $("#survey"+i).css("display", "none");
                    $("#btnArea"+i).css("display", "none");
                }
            }
            $("#stsfIvstYnTmpl").css("display","none");
            $("#surveyLast").css("display","none");
            $("#btnArea"+questionList.length).css("display", "none");
        });
}

function moveNext(obj, tot){

    var idx = 0;
    idx = parseInt(obj.id.replace("nextBtn",""));

    if(tot != (idx+1)){
        $("#survey"+ idx).css("display", "none");
        $("#btnArea"+idx).css("display","none");
        $("#survey"+ (idx+1)).css("display", "block");
        $("#btnArea" + (idx+1)).css("display","block");
    }else{
        $("#survey"+ idx).css("display", "none");
        $("#btnArea"+idx).css("display","none");
        $("#surveyLast").css("display", "block");
        $("#stsfIvstYnTmpl").css("display","block");
        $("#btnArea" + (idx+1)).css("display","block");
    }
}

function movePrev(obj, tot){
    var idx = 0;
    idx = parseInt(obj.id.replace("prevBtn",""));
    //alert("idx="+idx+", tot="+tot);

    if(tot != idx){
        $("#survey" + idx).css("display", "none");
        $("#btnArea" + idx).css("display","none");
        $("#survey" + (idx-1)).css("display", "block");
        $("#btnArea" + (idx-1)).css("display","block");
    }else{
        $("#surveyLast").css("display", "none");
        $("#stsfIvstYnTmpl").css("display","none");
        $("#btnArea" + idx).css("display","none");
        $("#survey" + (idx-1)).css("display", "block");
        $("#btnArea" + (idx-1)).css("display","block");
    }
}

function save(){
    confirmOpen(confirmMsgSave,'doSave',y,n);
}

function doSave(){
        var stsfIvstYn = $("input:radio[name=stsfIvstYn]:checked").val();

        var nameArr = [];
        var val = [];
        var seq = $("#sSeq").val();
        var strArr = [];
        //라디오 버튼 Validation시작
        $(":radio[name ^='rad_']").each(function(index){
            nameArr[index] = $(this).attr("name");
        });

        var uniqueNames = [];

        $.each(nameArr,function(i,el){
            if($.inArray(el,uniqueNames) === -1)
                uniqueNames.push(el)
                //uniqueNames[i] = el;
        });

        if(!validChk(uniqueNames,"noTxt")){
            return;
        }

        //var nm2="";
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
                //obj["answSeq"] = $("input:radio[name="+rad_nm+"]").attr("data-is");//질문일련번호

                obj["answSeq"] = $("input:radio[name="+rad_nm+"]:checked").attr("data-is");//질문일련번호

                obj["answScoreVal"] = $("input:radio[name="+rad_nm+"]:checked").attr("data-score");
                obj["custNo"] = $("#custNo").val();
                obj["custNm"] = $("#custNm").val();
                obj["sbjvAnswCont"] = "";
                obj["cmplReasonCont"] = $("#cmplReasonCont").val();
                obj["stsfIvstYn"] = stsfIvstYn;
                params.push(obj);
                idx++;
            }
        }
        //CheckBox Validation시작
        nameArr = [];
        $(":checkbox[name ^='chk_']").each(function(index){
            nameArr[index] = $(this).attr("name");
        });

        uniqueNames = [];


        $.each(nameArr,function(i,el){
            if($.inArray(el,uniqueNames) === -1)
                uniqueNames.push(el)
                //uniqueNames[i] = el;
        });

        if(!validChk(uniqueNames,"noTxt")){
            return;
        }

        var tempSubyTmplSeq;//khskhskhs

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
                obj["cmplReasonCont"] = $("#cmplReasonCont").val();
                obj["stsfIvstYn"] = stsfIvstYn;

                params.push(obj);
                idx++;

                tempSubyTmplSeq=$(this).attr("data-sts");
            }
        });

        //textArea Validation시작
        nameArr = [];
        $("textarea[name ^='txt_']").each(function(i){
            nameArr[i] = $(this).attr("id");
        });

        uniqueNames = [];

        $.each(nameArr,function(i,el){
            if($.inArray(el,uniqueNames) === -1)
                uniqueNames.push(el)
                //uniqueNames[i] = el;
        });

        for(var p=0; p<uniqueNames.length;p++){
            var txt_nm = uniqueNames[p];

            if($('#'+txt_nm+'').val() != ""){
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
                obj["cmplReasonCont"] = $("#cmplReasonCont").val();
                obj["stsfIvstYn"] = stsfIvstYn;

                params.push(obj);
                idx++;
            }
        }

        var satisFactionMobileResultVO = {};
        satisFactionMobileResultVO["stsfIvstSeq"] = seq;//만족도 조사 일련번호
        satisFactionMobileResultVO["stsfIvstRsltSeq"] = 0;//만족도 조사 결과 일련번호
        satisFactionMobileResultVO["subyTmplSeq"] =tempSubyTmplSeq;
        satisFactionMobileResultVO["custNo"] = $("#custNo").val(); //고객번호
        satisFactionMobileResultVO["custNm"] = $("#custNm").val(); //고객명

        mob.loading.show();
        $.ajax({
            url:"<c:url value='/mob/crm/css/satisFactionMobile/multiUsrAnswerSurveys.do'/>"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
            ,data:JSON.stringify({"insertList":params, "satisFactionMobileResultVO":satisFactionMobileResultVO})
            ,error:function(jqXHR,status,error) {
                //mob.notification.error(jqXHR.responseJSON.errors);
                mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                mob.loading.hide();
            }
            ,success:function(data) {
                mob.notification.success("<spring:message code='global.info.success'/>");
                //$(".survey_content > ul").empty();
                $(".survey > dl").empty();
                //설문에 응해주셔서 감사합니다.
                var htmladd = '<li><p class="txt_thanks"><spring:message code="crm.info.surveySucess"/></p></li>';
                $(".survey > dl").append(htmladd);

                $("#custNo").val("");
                $("#custNm").val("");
                $('#searchFlag').val("F");
                mob.loading.hide();
                $("#content_detail, content_search").css("display","none");
                $("#content_list").css("display","block");
                $("#content_title span").attr("class", "search_open")
            }
        });
}



function validChk(uniqueNames,txt){
        var nm = "";
        for(var j=0; j<uniqueNames.length;j++){
            nm = uniqueNames[j];

            if(txt == "noTxt"){
                if(!$("input[name="+nm+"]").is(":checked")){
                    //응답하지 않은 설문 문항이 있습니다.
                    mob.notification.success("<spring:message code='crm.info.noSurveyCheck'/>");
                    return false;
                }
            }
        }
        return true;
    }

</script>
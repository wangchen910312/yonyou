<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

    <section id="content">
        <!-- content_list -->
        <section id="content_list">
            <div class="content_title conttitlePrev">
                <h2 id="content_list_title"><spring:message code="ser.menu.wkProcMng" /><!-- 정비진도관리 --></h2>
            </div>
            <div class="skeyarea">
                <div>
                    <table class="slist01">
                        <colgroup>
                            <col style="width:35%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                            <tr id="search1Area">
                                <th scope="row"><span><spring:message code="ser.lbl.roDate" /><!-- Ro일자 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="ser.lbl.carNo" /><!--차량번호 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="ser.lbl.statNm" /><!-- 상태 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search4Area">
                                <th scope="row"><span><spring:message code="ser.lbl.driver" /><!-- 운전자 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete">삭제</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="listarea">
                        <div class="listhead dlistitem">

                            <span style="width:35%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
                            <span style="width:65%"><spring:message code="ser.lbl.roDocNo" /><!-- Ro번호 --></span>

                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.driver" /><!-- 운전자--></span>
                            <span style="width:35%"><spring:message code="ser.lbl.repairProcess" /><!-- 수리진도 --></span>
                            <span style="width:30%"><spring:message code="ser.lbl.repairStat" /><!-- 수리상태 --></span>

                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.paintStat" /><!-- 페인트상태 --></span>
                            <span style="width:35%"><spring:message code="ser.lbl.qtTestStat" /><!--  품질검사상태--></span>
                            <span style="width:30%"><spring:message code="ser.lbl.carWashStat" /><!--세차상태  --></span>

                            <%--
                            <span style="width:35%"><spring:message code="ser.lbl.roDate" /><!-- Ro일자 --></span>
                            <span class="clboth" style="width:100%"><spring:message code="ser.lbl.vinNo" /><!-- VIN NO --></span>
                            --%>
                        </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            </div>
        </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="ser.menu.wkProcMng" /> <spring:message code="global.title.searchCondition" /><!-- RO진행관리 현황 + 조회조건  --></h2>
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
                            <th scope="row"><spring:message code="ser.lbl.roDate" /><!-- Ro일자 --></th>
                            <td class="f_term">
                                <div class="f_item01">
                                    <input type="text" id="sRoFromDt" style="width:140px" class="" readOnly/>
                                    <span class="date" onclick="calpicker('sRoFromDt');">날짜선택</span>
                                </div><span class="termtext"> ∼</span>
                                <div class="f_item01">
                                    <input type="text" id="sRoToDt" style="width:140px" class="" readOnly/>
                                    <span class="date" onclick="calpicker('sRoToDt');">날짜선택</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></th>
                            <td>
                                <div class="f_text"><input id="sCarRegNo" type="text" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.statNm" /><!-- 상태 --></th>
                            <td>
                                <div class="f_text"><input id="sRoStatCd" type="text" class="form_comboBox" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.driver" /><!-- 운전자 --></th>
                            <td>
                                <div class="f_text"><input id="sDriverNm" type="text" /></div>
                            </td>
                        </tr>
                    </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
        </div>
    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="co_group">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="global.title.defaultInfo" /><!-- 기본정보 --></h2>
            </div>
            <div class="co_view" style="display:block;">
            <div class="formarea">
                <table  class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <%--
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.roDate" /><!-- RO일자 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="roDt" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.roDocNo" /><!-- RO번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="roDocNo" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="carRegNo" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.driver" /><!-- 운전자 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="driverNm" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.vinNo" /><!-- VIN NO --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="vinNo" type="text" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.repairProcess" /><!-- 수리진도 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="roStatCd" type="text" disabled="disabled"/></div>
                            </td>
                       </tr>
                        --%>


                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.roDocNo" /></th><!-- RO번호 -->
                            <td>
                                <div class="f_text f_disabled">
                                    <input type="text"  id="roDocNo" disabled="disabled"/>
                                    <input type="hidden" id="dlrCd"/>
                                    <input type="hidden" id="roGrpNo"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.fosterTp" /></th><!-- 위탁유형 -->
                            <td>
                                <div class="f_text f_disabled">
                                    <input type="text" value=""  id="roTp" disabled="disabled"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.resvDocNo" /></th><!-- 예약번호 -->
                            <td><div class="f_text f_disabled">
                                <input type="text" value=""  id="resvDocNo" disabled="disabled"/></div>
                            </td>
                            </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.preInsNo" /></th><!-- 사전점검번호 -->
                            <td><div class="f_text f_disabled">
                                <input type="text" value=""  id="diagDocNo" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.OldItemHandTp" /></th><!-- 고품처리방식 -->
                            <td><div class="f_text f_disabled">
                                <input type="text" value=""  id="atqProcTp" disabled="disabled"/></div>
                            </td>
                            </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.carWash" /></th><!-- 세차처리 -->
                            <td><div class="f_text f_disabled">
                                <input type="text" value=""  id="carWashTp" disabled="disabled"/></div>
                            </td>

                            </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.custStbyMth" /></th><!-- 고객대기방식 -->
                            <td><div class="f_text f_disabled">
                                <input type="text" value=""  id="custWaitMthCd" disabled="disabled"/></div>
                            </td>
                            </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.roDt" /></th><!--위탁확인시간 -->
                            <td><div class="f_text f_disabled">
                                <input  id="roDt" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.driver" /></th><!--운전자  -->
                            <td><div class="f_text f_disabled">
                                <input type="text" value=""  id="driverNm" disabled="disabled"/></div>
                            </td>
                            </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.repairAssign" /></th><!-- 수리배정 -->
                            <td><div class="f_text f_disabled">
                                <input type="text" value=""  id="saNm" disabled="disabled"/></div>
                            </td>
                            </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.qultTest" /></th><!-- 품질검사 -->
                            <td><div class="f_text f_disabled">
                                <input type="text" value=""  id="" disabled="disabled"/></div>
                            </td>
                            </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.expcDlvDt" /></th><!-- 예정인도시간 -->
                            <td><div class="f_text f_disabled">
                                <input type="text" value=""  id="expcDlDt" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.bayNm" /></th><!-- BAY -->
                            <td><div class="f_text f_disabled">
                                <input type="text" value=""  id="bayNm" disabled="disabled"/></div>
                            </td>
                            </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.wkgrpNo" /></th><!-- 소조 -->
                            <td><div class="f_text f_disabled">
                                <input type="text" value=""  id="" disabled="disabled"/></div>
                            </td>
                            </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.tecNm" /></th><!--테크니션  -->
                            <td><div class="f_text f_disabled">
                                <input type="text" value=""  id="tecNm" disabled="disabled"/></div>
                            </td>
                            </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.preCompDt" /></th><!-- 예정완성시간-->
                            <td><div class="f_text f_disabled">
                                <input type="text" value=""  id="" disabled="disabled"/></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </div>
            </div>

            <div class="co_group">
            <div class="content_title">
                <h2><spring:message code="global.lbl.budgetDetlCont" /><!-- 정비내역--></h2>
                <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
            </div>
            <div class="co_view" style="display:none;">
            <div class="listarea01">
                        <div class="listhead dlistitem">

                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.lbrCd" /><!-- 정비코드--></span>
                            <span style="width:65%"><spring:message code="ser.lbl.lbrNm" /><!-- 정비항목--></span>

                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.rpirDist" /><!-- 정비유형  --></span>
                            <span style="width:35%"><spring:message code="ser.lbl.rpirDt" /><!-- 수리시간  --></span>
                            <span style="width:30%"><spring:message code="ser.lbl.repairStat" /><!-- 수리상태  --></span>

                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.paintStat" /><!-- 페인트상태  --></span>
                            <span style="width:65%"><spring:message code="ser.lbl.preCompDt" /><!-- 예정종료시간 --></span>

                            <span class="clboth" style="width:100%"><spring:message code="ser.lbl.pauseCau" /><!-- 정지원인 --></span>

                            <%--
                            <span style="width:50%"><spring:message code="ser.lbl.lbrCd" /><!-- 정비코드 --></span>
                            <span style="width:50%"><spring:message code="ser.lbl.tecNm" /><!-- 테크니션 --></span>
                            <span class="clboth" style="width:50%"><spring:message code="ser.lbl.preStartDt" /><!-- 예정시작시간 --></span>
                            --%>

                        </div>
                <iframe id="subList" name="subList" border="1" frameborder="0" width="100%" ></iframe>
            </div>
            </div>

            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>
        </section>
    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>
var dlrCd  = "${dlrCd}";    // 딜러코드

var dateFormat =  '<dms:configValue code="dateFormat" />';

var toDt                = "${toDt}",
sevenDtBf           = "${sevenDtBf}";

toDate = new Date();

//RO상태 Array
//var roStatCdList = [{"cmmCd":"", "cmmCdNm":""}];
var roStatCdList = [];
<c:forEach var="obj" items="${roStatCdList}">
roStatCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>


//RO상태 Map
var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){ return obj.cmmCd; });




//진행상태 Array
var progressStatList = [{"cmmCd":"", "cmmCdNm":""}];
//var progressStatList = [];
<c:forEach var="obj" items="${progressStatList}">
progressStatList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//진행상태 map
var progressStatMap = dms.data.arrayToMap(progressStatList, function(obj){return obj.cmmCd; });


//수리유형 Array
var rpirStatList = [{"cmmCd":"", "cmmCdNm":""}];
<c:forEach var="obj" items="${rpirStatList}">
rpirStatList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//수리유형 map
var rpirStatMap = dms.data.arrayToMap(rpirStatList, function(obj){return obj.cmmCd});



//세차상태 Array
var carWashStatList = [{"cmmCd":"", "cmmCdNm":""}];
<c:forEach var="obj" items="${carWashStatList}">
carWashStatList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
progressStatList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//세차상태 map
var carWashStatMap = dms.data.arrayToMap(carWashStatList, function(obj){return obj.cmmCd});

//품질검사상태 Array
var qtTestStatList = [{"cmmCd":"", "cmmCdNm":""}];
<c:forEach var="obj" items="${qtTestStatList}">
qtTestStatList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
progressStatList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//품질검사상태 map
var qtTestStatMap = dms.data.arrayToMap(qtTestStatList, function(obj){return obj.cmmCd});

//페인트상태 Array
var paintStatList = [{"cmmCd":"", "cmmCdNm":""}];
<c:forEach var="obj" items="${paintStatList}">
paintStatList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
progressStatList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//페인트상태 map
var paintStatMap = dms.data.arrayToMap(paintStatList, function(obj){return obj.cmmCd});

//진행상태 map
var progressStatMap = dms.data.arrayToMap(progressStatList, function(obj){return obj.cmmCd});

$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sRoFromDt").val("");
            $("#sRoToDt").val("");
            break;
        case "search2Area" :
            $("#sCarRegNo").val("");
            break;
        case "search3Area" :
            $("#sRoStatCd").data("kendoExtDropDownList").value("");
            break;
        case "search4Area" :
            $("#sDriverNm").val("");
            break
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});


function setSearchBox(){
    var sRoFromDt = $("#sRoFromDt").val();
    var sRoToDt = $("#sRoToDt").val();
    var sCarRegNo = $("#sCarRegNo").val();
    var sRoStatCd = $("#sRoStatCd").data("kendoExtDropDownList").value();
    var sDriverNm = $("#sDriverNm").val();

    if(sRoFromDt == "" && sRoToDt == "" && sCarRegNo == "" && sRoStatCd == "" && sDriverNm == ""){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sRoFromDt == "" && sRoToDt == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sCarRegNo == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(sRoStatCd == "") $("#search3Area").hide();
        else $("#search3Area").show();
        if(sDriverNm == "") $("#search4Area").hide();
        else $("#search4Area").show();
    }
    setMainListHeight();
}


$(document).ready(function() {

    $("#sRoStatCd").kendoExtDropDownList({
        dataSource:roStatCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });

    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        $(".skeyarea").hide();
    }
    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='ser.menu.wkProcMng' />");<!-- RO진행관리 현황 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/ser/ro/workProcess/selectWorkProcessList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sRoFromDt = $("#sRoFromDt");
            var sRoToDt = $("#sRoToDt");
            var sCarRegNo = $("#sCarRegNo");
            var sRoStatCd = $("#sRoStatCd").data("kendoExtDropDownList");
            var sDriverNm = $("#sDriverNm");

            if(sRoFromDt.val() != "" || sRoToDt.val() != "") $("#search1Area span[name='searchStr']").html(sRoFromDt.val() + " ~<br/>" + sRoToDt.val());
            if(sCarRegNo.val() != "") $("#search2Area span[name='searchStr']").text(sCarRegNo.val());
            if(sRoStatCd.value() != "") $("#search3Area span[name='searchStr']").text(sRoStatCd.text());
            if(sDriverNm.val() != "") $("#search4Area span[name='searchStr']").text(sDriverNm.val());

            setSearchBox();
            contentList();
        }
    });



    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentList(); }
        else if ($("#content_detail").css("display") == "block") { contentList(); }
    });

    //버튼 - TOP
    $("#docu_top").bind("click", function()
    {
        $("body,html").animate({scrollTop:0}, 200);
    });

    //상단으로 이동
    $(window).scroll(function () {
        if ($(this).scrollTop() != 0)
        {
            //$("#docu_top").fadeIn();
        }
        else
        {
            $("#docu_top").fadeOut();
        }
    });



});
</script>
<script>

//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {
  $("#content_search").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
  document.getElementById("mainList").contentWindow.document.location.reload();
}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");

  $("#sRoFromDt").val(chgServerDate2Str(sevenDtBf));
  $("#sRoToDt").val(chgServerDate2Str(toDt));

}


function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    if(dataItem!=null){
        $("#roDt").val(dataItem.roDt);
        $("#roDocNo").val(dataItem.roDocNo);
        $("#carRegNo").val(dataItem.carRegNo);
        $("#driverNm").val(dataItem.driverNm);
        $("#vinNo").val(dataItem.vinNo);
        $("#roStatCd").val(dataItem.roStatNm);
    }

    if( dataItem.roDocNo != null && dataItem.roDocNo != 'undefined'){

        // 정비내역 리스트 조회
        $("#subList").attr("src", "<c:url value='/mob/ser/ro/workProcess/selectWorkProcessSubList.do' />");
        /*
        $.ajax({
            url:"<c:url value='/mob/ser/ro/workAssign/selectWorkAssigns.do' />",
            data:JSON.stringify({ sRoDocNo:key}),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error) {
                mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }

        }).done(function(result) {
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
                return false;
            }
            console.log('result:', result);
            console.log('Hash:', partsJs.validate.formJs.Hash);
            partsJs.validate.groupObjAllDataSet(result);
            gCrud = 'U';

        });
        */
    }
  }

</script>
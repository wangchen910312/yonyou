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
            <h2 id="content_list_title"><spring:message code="ser.menu.wkProcStat" /><!-- 정비진도관리 --></h2>
        </div>
        <div class="listarea">
            <div class="listhead dlistitem">
                <span style="width:50%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.vinNo" /><!-- VIN --></span>
                <span style="width:50%"><spring:message code="par.lbl.invRoDocNo" /><!-- 정비위탁번호 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.roManNm" /><!-- 정비위탁자 --></span>
                <span style="width:50%"><spring:message code="par.lbl.invResvWorkType" /><!-- 정비위탁유형 --></span>
                <span style="width:50%"><spring:message code="ser.lbl.repairSerStat" /><!-- 수리서비스상태 --></span>
                <span style="width:50%"><spring:message code="par.lbl.invResvWorkTime" /><!-- 정비위탁시간 --></span>
                <span style="width:50%"><spring:message code="par.lbl.expTime" /><!-- 예상인도시간 --></span>
            </div>
            <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
        </div>
    </section>

    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="ser.menu.wkProcStat" /> <spring:message code="global.title.searchCondition" /><!-- RO진행관리 현황 + 조회조건  --></h2>
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
                        <th scope="row"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></th>
                        <td>
                            <div class="f_text"><input id="sCarRegNo" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.invRoDocNo" /><!-- 정비위탁번호 --></th>
                        <td>
                            <div class="f_text"><input id="sRoDocNo" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.invResvWorkType" /><!-- 정비위탁유형 --></th>
                        <td>
                            <div class="f_text"><input id="sRoTp" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.invResvWorkTime" /><!-- 정비위탁시간 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sRoFromDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sRoFromDt');">날짜선택</span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sRoToDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sRoToDt');">날짜선택</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.vinNo" /><!-- VIN --></th>
                        <td>
                            <div class="f_text"><input id="sVinNo" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.carOwner" /><!-- 차량소유자 --></th>
                        <td>
                            <div class="f_text"><input id="sCarOwnerNm" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.roManNm" /><!-- 정비위탁자 --></th>
                        <td>
                            <div class="f_text"><input id="sDriverNm" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.expcDlvDt" /><!-- 예정인도시간 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sExpcDlFromDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sExpcDlFromDt');">날짜선택</span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sExpcDlToDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sExpcDlToDt');">날짜선택</span>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea btncount2">
            <div>
                <span id="btnInit" class="btnd1"><span class="btnd2"><spring:message code='global.btn.init' /><!-- 초기화 --></span></span>
            </div>
            <dms:access viewId="VIEW-D-12671" hasPermission="${dms:getPermissionMask('READ')}">
            <div>
                <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
            </div>
            </dms:access>
        </div>
    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="co_group">
                <div class="content_title conttitlePrev">
                    <h2><spring:message code="global.title.defaultInfo" /><!-- 기본정보 --></h2>
                </div>
                <div class="formarea">
                    <table  class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:35%;">
                            <col style="">
                        </colgroup>
                        <tbody id="defaultHtml"><!-- 여기에 디폴트 HTML --></tbody>
                    </table>
                    <div class="content_title">
                        <h2><spring:message code="global.btn.moreInfo" /></h2>
                        <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
                    </div>
                    <div class="co_view" style="display:none;">
                        <table  class="flist01">
                            <caption></caption>
                            <colgroup>
                                <col style="width:35%;">
                                <col style="">
                            </colgroup>
                            <tbody id="hiddenHtml"><!-- 여기에 HIDE HTML --></tbody>
                        </table>
                    </div>
                </div>
            </div>

            <%-- <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="global.lbl.budgetDetlCont" /><!-- 정비내역--></h2>
                    <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
                </div>
                <div class="co_view" style="display:none;">
                    <div class="listarea01">
                        <div class="listhead dlistitem">
                            <span class="clboth" style="width:35%"><spring:message code="ser.lbl.repairStat" /><!-- 수리상태  --></span>
                            <span style="width:35%"><spring:message code="ser.lbl.lbrCd" /><!-- 정비코드--></span>
                            <span style="width:30%"><spring:message code="ser.lbl.tecNm" /><!-- 정비사  --></span>
                            <span class="clboth" style="width:100%"><spring:message code="ser.lbl.lbrNm" /><!-- 정비항목--></span>
                            <span class="clboth" style="width:50%"><spring:message code="ser.lbl.preStartDt" /><!-- 예정시작시간  --></span>
                            <span style="width:50%"><spring:message code="ser.lbl.preCompDt" /><!-- 예정종료시간 --></span>
                        </div>
                        <iframe id="subList" name="subList" border="1" frameborder="0" width="100%" ></iframe>
                        <div class="dlistitem bgNone" style="display:none;" id="listarea_noData_sub1"><span></span></div>
                    </div>
                </div>
            </div> --%>
            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>
        </section>
    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>
</section>

<script>
var dlrCd  = "${dlrCd}";    // 딜러코드
var dateFormat =  '<dms:configValue code="dateFormat" />';
var toDt                = "${toDt}",
oneMonthDtBf           = "${oneMonthDtBf}";
toDate = new Date();

//RO유형 Array
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdMap = dms.data.arrayToMap(roTpCdList, function(obj){ return obj.cmmCd; });

//RO상태 Array
var roStatCdList = [];
<c:forEach var="obj" items="${roStatCdList}">
roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){ return obj.cmmCd; });

//진행상태 Array
var progressStatList = [];
<c:forEach var="obj" items="${progressStatList}">
progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var progressStatMap = dms.data.arrayToMap(progressStatList, function(obj){return obj.cmmCd; });

//공통코드:고객대기방식유형
var custWaitMthCdList = [];
<c:forEach var="obj" items="${custWaitMthCdList}">
custWaitMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var custWaitMthCdMap = dms.data.arrayToMap(custWaitMthCdList, function(obj){return obj.cmmCd});

//공통코드:고품처리유형
var atqProcTpCdList = [];
<c:forEach var="obj" items="${atqProcTpCdList}">
atqProcTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var atqProcTpCdMap = dms.data.arrayToMap(atqProcTpCdList, function(obj){return obj.cmmCd});

//공통코드:차량세차유형
var carWashTpCdList = [];
<c:forEach var="obj" items="${carWashTpCdList}">
carWashTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var carWashTpCdMap = dms.data.arrayToMap(carWashTpCdList, function(obj){return obj.cmmCd});

//수리유형 Array
var rpirStatList = [];
<c:forEach var="obj" items="${rpirStatList}">
rpirStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//수리유형 map
var rpirStatMap = dms.data.arrayToMap(rpirStatList, function(obj){return obj.cmmCd});

//세차상태 Array
var carWashStatList = [];
<c:forEach var="obj" items="${carWashStatList}">
carWashStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var carWashStatMap = dms.data.arrayToMap(carWashStatList, function(obj){return obj.cmmCd});

//품질검사상태 Array
var qtTestStatList = [];
<c:forEach var="obj" items="${qtTestStatList}">
qtTestStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var qtTestStatMap = dms.data.arrayToMap(qtTestStatList, function(obj){return obj.cmmCd});

//페인트상태 Array
var paintStatList = [];
<c:forEach var="obj" items="${paintStatList}">
paintStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
progressStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paintStatMap = dms.data.arrayToMap(paintStatList, function(obj){return obj.cmmCd});

//진행상태 map
var progressStatMap = dms.data.arrayToMap(progressStatList, function(obj){return obj.cmmCd});

//공통코드:차량시승요청유형
var carDriveReqTpCdList = [];
<c:forEach var="obj" items="${carDriveReqTpCdList}">
carDriveReqTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var carDriveReqTpCdMap = dms.data.arrayToMap(carDriveReqTpCdList, function(obj){return obj.cmmCd});

var yesMap = {};
yesMap["Y"] = "<spring:message code='global.lbl.yes' />";
yesMap["N"] = "<spring:message code='global.lbl.n' />";

$(document).ready(function() {

    //버튼- 초기화
    $("#btnInit").kendoButton({
        click:function(e) {
            $("#sCarRegNo").val("");
            $("#sRoDocNo").val("");
            $("#sRoTp").val("");
            $("#sRoTp").data("kendoExtDropDownList").value("");
            /* $("#sRoFromDt").val("");
            $("#sRoToDt").val(""); */
            $("#sVinNo").val("");
            $("#sCarOwnerNm").val("");
            $("#sDriverNm").val("");
            $("#sExpcDlFromDt").val("");
            $("#sExpcDlToDt").val("");

            /*
            $("#sBrandCd").data("kendoExtDropDownList").value("");
            $("#sItemCd").val("");
            $("#sItemNm").val("");
            $("#sBpNm").val("");
            $("#sCarlineCd").data("kendoExtDropDownList").value("");
            $("#sAbcInd").val("");
            $("#sCarlineCd2").data("kendoExtDropDownList").value("");
            $("#sItemDstinCd").data("kendoExtDropDownList").value("");
            */

            $("#sRoFromDt").val(chgServerDate2Str(oneMonthDtBf));
            $("#sRoToDt").val(chgServerDate2Str(toDt));


        }
    });

    //RO유형
    $("#sRoTp").kendoExtDropDownList({
        dataSource:roTpCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel : "<spring:message code='global.lbl.check'/>"
        ,index:0
    });


    $("#sRoStatCd").kendoExtDropDownList({
        dataSource:dms.data.cmmCdFilter(roStatCdList)
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
    $("#header_title").html("<spring:message code='ser.menu.wkProcStat' />");<!-- RO진행관리 현황 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

     // 목록 조회
    $("#sRoFromDt").val(chgServerDate2Str(oneMonthDtBf));
    $("#sRoToDt").val(chgServerDate2Str(toDt));

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/ser/ro/workProcess/selectWorkProcessList.do' />");

    // 버튼 - 조회
    $("#btnSearch").click(function(){
        /*
        var sRoFromDt = $("#sRoFromDt");
        var sRoToDt = $("#sRoToDt");
        var sCarRegNo = $("#sCarRegNo");
        var sRoStatCd = $("#sRoStatCd").data("kendoExtDropDownList");
        var sDriverNm = $("#sDriverNm");
        if(sRoFromDt.val() != "" || sRoToDt.val() != "") $("#search1Area span[name='searchStr']").html(sRoFromDt.val() + " ~<br/>" + sRoToDt.val());
        if(sCarRegNo.val() != "") $("#search2Area span[name='searchStr']").text(sCarRegNo.val());
        if(sRoStatCd.value() != "") $("#search3Area span[name='searchStr']").text(sRoStatCd.text());
        if(sDriverNm.val() != "") $("#search4Area span[name='searchStr']").text(sDriverNm.val());
        */
        contentList();
    });

    // 버튼 - 이전
    $("#docu_prev").bind("click", function(){
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }
    });

});


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
  setTimeout(function(){ setMainListHeight();}, 200);
}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");
}


function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    setTimeout(function(){ $("#content_detail").css("display","block")}, 10);
    $("#header_title span").removeAttr("class");

    setDetailData3(keyMapArr,dataItem,"#defaultHtml input[id]");//보이는 것
    setDetailData3(keyMapArr,dataItem,"#hiddenHtml input[id]");// 안보이는 것

    /*
    var params = {};

    params["sCarRegNo"]     = $("#sCarRegNo").val();
    params["sVinNo"]        = $("#sVinNo").val();
    params["sCarOwnerNm"]   = $("#sCarOwnerNm").val();
    params["sExpcDlFromDt"] = chgDate($("#sExpcDlFromDt").val());
    params["sExpcDlToDt"]   = chgDate($("#sExpcDlToDt").val());
    params["sRoDocNo"]      = $("#sRoDocNo").val();
    params["sRoTp"]         = $("#sRoTp").val();
    params["sDriverNm"]     = $("#sDriverNm").val();
    params["sRoFromDt"]     = chgDate($("#sRoFromDt").val());
    params["sRoToDt"]       = chgDate($("#sRoToDt").val());

    $.ajax({
        url:"<c:url value='/ser/ro/repairOrder/selectRepairOrderInfoList.do' />"
        ,data:JSON.stringify(params)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {
            parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
        }
        ,success:function(result) {
            alert(JSON.stringify(result));
        }
    });
    */



    /*
    if(dataItem!=null){
        $("#roDocNo").val(dataItem.roDocNo);
        $("#carRegNo").val(dataItem.carRegNo);
        $("#vinNo").val(dataItem.vinNo);
        $("#roStatCd").val(dataItem.roStatNm);

        $("#resvDocNo").val(dataItem.resvDocNo);
        $("#roGrpNo").val(dataItem.roGrpNo);
        $("#expcDlDt").val(kendo.toString(dataItem.expcDlDt,"<dms:configValue code='dateFormat' /> HH:mm"));
        $("#diagDocNo").val(dataItem.diagDocNo);
        $("#bayNm").val(dataItem.bayNo);
        $("#driverNm").val(dataItem.driverNm);
        $("#roDt").val(dataItem.roDt);
        if(dataItem.custWaitMthCd!=null){
        $("#custWaitMthCd").val(custWaitMthCdMap[dataItem.custWaitMthCd].cmmCdNm);
        }
        if(dataItem.atqProcTp!=null){
        $("#atqProcTp").val(atqProcTpCdMap[dataItem.atqProcTp].cmmCdNm);
        }
        if(dataItem.carWashTp!=null){
        $("#carWashTp").val(carWashTpCdMap[dataItem.carWashTp].cmmCdNm);
        }
        if(dataItem.roTp!=null){
        $("#roTp").val(roTpCdMap[dataItem.roTp].cmmCdNm);
        }
        if(dataItem.paintStatCd!=null){
            $("#paintStat").val(paintStatMap[dataItem.paintStatCd].cmmCdNm);
        }
        $('[data-for="wrk01"]').each(function(){
            $(this).data("kendoButton").enable(true)
        })
    }
    */

    $(".co_view").css("display","none");
    $(".title_btn span").attr("class", "co_open co_close");

    if(dms.string.strNvl(dataItem.atqProcTp) !="")$("#atqProcTp").val(atqProcTpCdMap[dataItem.atqProcTp].cmmCdNm);
    if(dms.string.strNvl(dataItem.carWashTp) !="")$("#carWashTp").val(carWashTpCdMap[dataItem.carWashTp].cmmCdNm);
    if(dms.string.strNvl(dataItem.custWaitMthCd) !="")$("#custWaitMthCd").val(custWaitMthCdMap[dataItem.custWaitMthCd].cmmCdNm);
    if(dms.string.strNvl(dataItem.qtTestMthCd) !="")$("#qtTestMthCd").val(dataItem.qtTestMthCd);
    if(dms.string.strNvl(dataItem.goodwillYn) !="")$("#goodwillYn").val(yesMap[dataItem.goodwillYn]);
    if(dms.string.strNvl(dataItem.carDriveReqTp) !="")$("#carDriveReqTp").val(carDriveReqTpCdMap[dataItem.carDriveReqTp].cmmCdNm);
    /* if(dms.string.strNvl(dataItem.chgExpcDlDt) !="")$("#chgExpcDlDt").val(dataItem.chgExpcDlDt);
    if(dms.string.strNvl(dataItem.expcDlDt) !="")$("#expcDlDt").val(chgDate2DateTimeStr(dataItem.expcDlDt));
    if(dms.string.strNvl(dataItem.roDt) !="")$("#roDt").val(chgDate2DateTimeStr(dataItem.roDt)); */

    /* if( dataItem.roDocNo != null && dataItem.roDocNo != 'undefined'){
        // 정비내역 리스트 조회
        $("#subList").attr("src", "<c:url value='/mob/ser/ro/workProcess/selectWorkProcessSubList.do' />");
    } */
  }

//순서에 맞게 넣고 , s는 보이는 것 h는 안보이는 것
var keyMapArr=[
               {temp:"s",key:"carRegNo",txt:"<spring:message code='ser.lbl.carNo' />",type:""}, //차량번호
               {temp:"s",key:"vinNo",txt:"<spring:message code='ser.lbl.vinNo' />",type:""},
               {temp:"s",key:"carOwnerNm",txt:"<spring:message code='ser.lbl.carOwner' />",type:""},
               {temp:"s",key:"driverNm",txt:"<spring:message code='ser.lbl.vsitr' />",type:""},
               {temp:"s",key:"carlineNm",txt:"<spring:message code='ser.lbl.carlineNm' />",type:""},
               {temp:"s",key:"modelNm",txt:"<spring:message code='par.lbl.modelNm' />",type:""},

               {temp:"h",key:"runDistVal",txt:"<spring:message code='ser.lbl.nowRunDist' />",type:"strDist"},
               {temp:"h",key:"lastRunDistVal",txt:"<spring:message code='ser.lbl.totRunDistVal' />",type:"strDist"},
               {temp:"h",key:"roStatNm",txt:"<spring:message code='par.lbl.parGiStatCd' />",type:""},
               {temp:"h",key:"roDocNo",txt:"<spring:message code='par.lbl.invRoDocNo' />",type:""},
               {temp:"h",key:"roTpNm",txt:"<spring:message code='par.lbl.invResvWorkType' />",type:""},
               {temp:"h",key:"regUsrNm",txt:"<spring:message code='ser.lbl.roManNm' />",type:""},
               {temp:"h",key:"roDt",txt:"<spring:message code='par.lbl.invResvWorkTime' />",type:"strDate"},
               {temp:"h",key:"expcDlDt",txt:"<spring:message code='ser.lbl.expcDlvDt' />",type:"strDate"},
               {temp:"h",key:"roRemark",txt:"<spring:message code='ser.lbl.roRemark' />",type:""},
               {temp:"h",key:"wrkStatNm",txt:"<spring:message code='ser.lbl.repairSerStat' />",type:""},//수리서비스상태

               {temp:"h",key:"allocStatNm",txt:"<spring:message code='ser.lbl.assignStat' />",type:""},
               /* {temp:"h",key:"wrkStatNm",txt:"<spring:message code='ser.lbl.processWorkStat' />",type:""}, *///정비진도상태:수리서비스상태와 같음
               {temp:"h",key:"qtTestMthNm",txt:"<spring:message code='ser.lbl.qtTestStat' />",type:""},
               {temp:"h",key:"dlStatNm",txt:"<spring:message code='ser.lbl.dlvChkStatus' />",type:""},
               /* {temp:"h",key:"runDistVal",txt:"<spring:message code='ser.lbl.nowRunDist' />",type:""},
               {temp:"h",key:"lastRunDistVal",txt:"<spring:message code='ser.lbl.totRunDistVal' />",type:""}, */

               {temp:"h",key:"atqProcTp",txt:"<spring:message code='ser.lbl.OldItemHandTp' />",type:""},
               {temp:"h",key:"carWashTp",txt:"<spring:message code='ser.menu.carWashMng' />",type:""},
               {temp:"h",key:"custWaitMthCd",txt:"<spring:message code='ser.lbl.custStbyMth' />",type:""},
               /* {temp:"h",key:"qtTestMthCd",txt:"<spring:message code='ser.lbl.qtTest' />",type:""}, */
               {temp:"h",key:"goodwillYn",txt:"<spring:message code='ser.lbl.goodWillYn' />",type:""},
               {temp:"h",key:"carDriveReqTp",txt:"<spring:message code='global.lbl.tdrvReq' />",type:""},
               {temp:"h",key:"chgExpcDlDt",txt:"<spring:message code='ser.lbl.chgExpcDlDt' />",type:"strDate"}

               ];

</script>
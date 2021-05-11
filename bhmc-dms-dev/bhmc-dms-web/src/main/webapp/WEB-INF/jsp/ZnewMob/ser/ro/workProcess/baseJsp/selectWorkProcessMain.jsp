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
    <c:import url="/WEB-INF/jsp/ZnewMob/ser/ro/workProcess/listJsp/selectWorkProcessList.jsp" />
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
                                <input type="date" id="sRoFromDt" style="width:140px; background-color:#ffffff;" class="" />
                                <!-- <input type="search" id="sRoFromDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sRoFromDt');">날짜선택</span> -->
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sRoToDt" style="width:140px; background-color:#ffffff;" class="" />
                                <!-- <input type="search" id="sRoToDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sRoToDt');">날짜선택</span> -->
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
                            <div class="f_text"><input id="sRegUsrNm" type="text" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.expcDlvDt" /><!-- 예정인도시간 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sExpcDlFromDt" style="width:140px; background-color:#ffffff;" class="" />
                                <!-- <input type="search" id="sExpcDlFromDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sExpcDlFromDt');">날짜선택</span> -->
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="date" id="sExpcDlToDt" style="width:140px; background-color:#ffffff;" class="" />
                                <!-- <input type="search" id="sExpcDlToDt" style="width:140px" class="" />
                                <span class="date" onclick="calpicker('sExpcDlToDt');">날짜선택</span> -->
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
            $("#sVinNo").val("");
            $("#sCarOwnerNm").val("");
            $("#sRegUsrNm").val("");
            $("#sExpcDlFromDt").val("");
            $("#sExpcDlToDt").val("");
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


    // 타이틀
    $("#header_title").html("<spring:message code='ser.menu.wkProcStat' />");<!-- RO진행관리 현황 -->
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    $("#sRoFromDt").val(chgServerDate2Str(oneMonthDtBf));
    $("#sRoToDt").val(chgServerDate2Str(toDt));


    // 버튼 - 조회
    $("#btnSearch").click(function(){
        initList();
        contentList();
    });
});


//목록페이지 보기
function contentList() {
  $("#content_search").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_list").css("display","block");
  $("#header_title span").attr("class","search_open");
  listData.read();
}

function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    setTimeout(function(){ $("#content_detail").css("display","block")}, 10);
    $("#header_title span").removeAttr("class");

    setDetailData3(keyMapArr,dataItem,"#defaultHtml input[id]");//보이는 것
    setDetailData3(keyMapArr,dataItem,"#hiddenHtml input[id]");// 안보이는 것

    $(".co_view").css("display","none");
    $(".title_btn span").attr("class", "co_open co_close");

    if(dms.string.strNvl(dataItem.atqProcTp) !="")$("#atqProcTp").val(atqProcTpCdMap[dataItem.atqProcTp].cmmCdNm);
    if(dms.string.strNvl(dataItem.carWashTp) !="")$("#carWashTp").val(carWashTpCdMap[dataItem.carWashTp].cmmCdNm);
    if(dms.string.strNvl(dataItem.custWaitMthCd) !="")$("#custWaitMthCd").val(custWaitMthCdMap[dataItem.custWaitMthCd].cmmCdNm);
    if(dms.string.strNvl(dataItem.qtTestMthCd) !="")$("#qtTestMthCd").val(dataItem.qtTestMthCd);
    if(dms.string.strNvl(dataItem.goodwillYn) !="")$("#goodwillYn").val(yesMap[dataItem.goodwillYn]);
    if(dms.string.strNvl(dataItem.carDriveReqTp) !="")$("#carDriveReqTp").val(carDriveReqTpCdMap[dataItem.carDriveReqTp].cmmCdNm);
  }

</script>
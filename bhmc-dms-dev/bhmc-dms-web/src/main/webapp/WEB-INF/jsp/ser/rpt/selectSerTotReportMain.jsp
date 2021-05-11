<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 정비위탁리포트 -->
<section class="group" style="height:500%" >
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.serTotReport" /></h1>  <!-- 서비스종합 리포트 -->
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div id="tabstrip" class="tab_area tab_iframe">
        <!-- 탭메뉴 -->
        <ul>
            <li id="tab01" class="k-state-active"><spring:message code="ser.lbl.timeSearch" /></li> <!-- 시간조회 -->
            <li id="tab02"><spring:message code="ser.lbl.fosterTp" /></li>  <!-- 위탁유형 -->
            <li id="tab03"><spring:message code="ser.lbl.carlineNm" /></li> <!-- 차종명 -->
            <!--<li id="tab04"><spring:message code="ser.lbl.rpirTp" /></li>    <!-- 수리유형 -->
            <!--<li id="tab05"><spring:message code="ser.lbl.selfDefineTp" /></li>  <!-- 자체정의유형 -->
        </ul>
        <!-- //탭메뉴 -->

        <!-- 시간조회 -->
        <div class="mt0">
            <iframe id="iframeStatus01" src="" frameborder="0" scrolling="no" width="100%" height="700"></iframe>
        </div>
        <!-- //시간조회 -->

        <!-- 차종명 -->
        <div class="mt0">
            <iframe id="iframeStatus02" src="" frameborder="0" scrolling="no" width="100%" height="700"></iframe>
        </div>
        <!-- //차종명 -->

        <!-- 위탁유형 -->
        <div class="mt0">
            <iframe id="iframeStatus03" src="" frameborder="0" scrolling="no" width="100%" height="700"></iframe>
        </div>
        <!-- //위탁유형 -->

        <!-- 수리유형
        <div class="mt0">
            <iframe id="iframeStatus04" src="" frameborder="0" scrolling="no" width="100%" height="700"></iframe>
        </div>
        <!-- //수리유형 -->

        <!-- 자체정의유형
        <div class="mt0">
            <iframe id="iframeStatus05" src="" frameborder="0" scrolling="no" width="100%" height="700"></iframe>
        </div>
        <!-- //자체정의유형 -->
    </div>
    <!-- //탭메뉴 전체 영역 -->
</section>
<!-- //차량보고서 -->

<form id="frmMain"></form>
<script type="text/javascript">

var userId = "${userId}";
var userNm = "${userNm}";
var dlrCd  = "${dlrCd}";

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var lastDay = "${lastDay}";     // 해당월 마지막일자
var sysDate = "${sysDate}";     // 시스템 날짜

//공통코드:RO유형 SER031
var roTpCdList = [];
var roTpCdListMap = [];
<c:forEach var="obj" items="${roTpCdList}">
    roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    roTpCdListMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//공통코드:수리유형
var rpirTpCdList = [];
<c:forEach var="obj" items="${rpirTpCdList}">
rpirTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var rpirTpCdMap = dms.data.arrayToMap(rpirTpCdList, function(obj){return obj.cmmCd;});

//공통코드:자체정의
var selfDefineCdList = [];
<c:forEach var="obj" items="${selfDefineCdList}">
    <c:if test="${obj.useYn eq 'Y'}">
        selfDefineCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>
var selfDefineTpCdMap = dms.data.arrayToMap(selfDefineCdList, function(obj){return obj.cmmCd;});

//차종조회
var carlineCdList = [];
var carlineCdMap = [];
<c:forEach var="obj" items="${carlineCdList}">
    carlineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
    carlineCdMap["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

var selectTabId = "tab01";

$(document).ready(function() {

    $("#tabstrip").kendoExtTabStrip({
        animation:false
        , select:function(e) {
            selectTabId = e.item.id;
            selectTab(selectTabId);
        }
    });

    selectTab(selectTabId);
});


// tab
selectTab = function(tabId){
    var iframeUrl;

    if (tabId == "tab01") {
        if($("#iframeStatus01").attr("src") == ""){
            iframeUrl = "<c:url value='/ser/rpt/selectSerTotTimeSearchReport.do' />";
            $("#iframeStatus01").attr("src", iframeUrl);
        }
    } else if (tabId == "tab02") {
        if($("#iframeStatus02").attr("src") == ""){
            iframeUrl = "<c:url value='/ser/rpt/selectSerTotFosterTpReport.do' />";
            $("#iframeStatus02").attr("src", iframeUrl);
        }
    } else if (tabId == "tab03") {
        if($("#iframeStatus03").attr("src") == ""){
            iframeUrl = "<c:url value='/ser/rpt/selectSerTotCarLineNmReport.do' />";
            $("#iframeStatus03").attr("src", iframeUrl);
        }
    } else if (tabId == "tab04") {
        if($("#iframeStatus04").attr("src") == ""){
            iframeUrl = "<c:url value='/ser/rpt/selectSerTotRepairTpReport.do' />";
            $("#iframeStatus04").attr("src", iframeUrl);
        }
    } else if (tabId == "tab05") {
        if($("#iframeStatus05").attr("src") == ""){
            iframeUrl = "<c:url value='/ser/rpt/selectSerTotSelfDefineTpReport.do' />";
            $("#iframeStatus05").attr("src", iframeUrl);
        }
    }
}

//date format yyyyMMdd
function changeDate(val) {
    var dateParam = val.split("-");
    var returnDateParam = dateParam[0]+dateParam[1]+dateParam[2];
    return returnDateParam;
}

function makeFromDate(val) {
    var dateParam = val.split("-");
    //조회 시작일은 현재일 -1년이었는데 해당월의 1일로 변경
    //dateParam[0] = (parseInt(dateParam[0])-1);
    dateParam[2] = "01";
    var returnDateParam = dateParam[0]+"-"+dateParam[1]+"-"+dateParam[2];
    return returnDateParam;
}

</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 예약서비스리포트 -->
<section class="group" style="height:500%" >
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.resvSerReport" /></h1>  <!-- 예약서비스 리포트 -->
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div id="tabstrip" class="tab_area tab_iframe">
        <!-- 탭메뉴 -->
        <ul>
            <li id="tab01" class="k-state-active"><spring:message code="ser.lbl.timeSearch" /></li> <!-- 시간조회 -->
            <li id="tab02"><spring:message code='ser.lbl.carlineNm' /></li> <!-- 차종명 -->
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
    </div>
    <!-- //탭메뉴 전체 영역 -->
</section>
<!-- //차량보고서 -->

<form id="frmMain"></form>
<script type="text/javascript">
var selectTabId = "tab01"
    ,dateYy = "${dateYy}"
    ,sysDate = "${sysDate}"
    ,dlrCd = "${dlrCd}"

//차종조회
var carlineCdList = [];
var carlineCdMap = [];
<c:forEach var="obj" items="${carlineCdList}">
    carlineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
    carlineCdMap["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

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
            iframeUrl = "<c:url value='/ser/rpt/selectResvSerTimeSearchReport.do' />";
            $("#iframeStatus01").attr("src", iframeUrl);
        }
    } else if (tabId == "tab02") {
        if($("#iframeStatus02").attr("src") == ""){
            iframeUrl = "<c:url value='/ser/rpt/selectResvSerCarLineNmReport.do' />";
            $("#iframeStatus02").attr("src", iframeUrl);
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
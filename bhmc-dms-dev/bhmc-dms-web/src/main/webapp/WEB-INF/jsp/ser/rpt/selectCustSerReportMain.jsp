<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 정비위탁리포트 -->
<section class="group" style="height:500%" >
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.custSerReport" /></h1>  <!-- 고객서비스 리포트 -->
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div id="tabstrip" class="tab_area tab_iframe">
        <!-- 탭메뉴 -->
        <ul>
            <li id="tab01" class="k-state-active"><spring:message code="ser.lbl.custSer" /></li> <!-- 고객서비스 -->
        </ul>
        <!-- //탭메뉴 -->

        <!-- 고객서비스 -->
        <div class="mt0">
            <iframe id="iframeStatus01" src="" frameborder="0" scrolling="no" width="100%" height="700"></iframe>
        </div>
        <!-- //고객서비스 -->
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
var sexCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
var custTpList = [];
var selectTabId = "tab01";

//차종조회
var carlineCdList = [];
var carlineCdMap = [];
<c:forEach var="obj" items="${carlineCdList}">
    carlineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
    carlineCdMap["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

//성별
<c:forEach var="obj" items="${sexCdList}">
    sexCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//고객유형
<c:forEach var="obj" items="${custTpList}">
    custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
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
            iframeUrl = "<c:url value='/ser/rpt/selectCustSerCustSerReport.do' />";
            $("#iframeStatus01").attr("src", iframeUrl);
        }
    }
}

//날짜변환
function changeDate(val) {
    var dateParam = val.split("-");
    var returnDateParam = dateParam[0]+dateParam[1]+dateParam[2];
    return returnDateParam;
}

</script>
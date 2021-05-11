<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 정비위탁리포트 -->
<section class="group" style="height:500%" >
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.rpirItemReport" /></h1>  <!-- 수리항목 리포트 -->
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div id="tabstrip" class="tab_area tab_iframe">
        <!-- 탭메뉴 -->
        <ul>
            <li id="tab01" class="k-state-active"><spring:message code="ser.lbl.timeSearch" /></li>  <!-- 시간조회 -->
            <li id="tab02"><spring:message code="ser.lbl.carLineTp" /></li>               <!-- 차종유형 -->
            <li id="tab03"><spring:message code="ser.lbl.fosterTp" /></li>       <!-- 위탁유형 -->
            <li id="tab04"><spring:message code="ser.lbl.roManNm" /></li>              <!-- 정비위탁자 -->
        </ul>
        <!-- //탭메뉴 -->

        <!-- 시간조회 -->
        <div class="mt0">
            <iframe id="iframeStatus01" src="" frameborder="0" scrolling="no" width="100%" height="700"></iframe>
        </div>
        <!-- //시간조회 -->

        <!-- 차종유형 -->
        <div class="mt0">
            <iframe id="iframeStatus02" src="" frameborder="0" scrolling="no" width="100%" height="700"></iframe>
        </div>
        <!-- //차종유형 -->

        <!-- 수리유형 -->
        <div class="mt0">
            <iframe id="iframeStatus03" src="" frameborder="0" scrolling="no" width="100%" height="700"></iframe>
        </div>
        <!-- //수리유형 -->

        <!-- 정비위탁자 -->
        <div class="mt0">
            <iframe id="iframeStatus04" src="" frameborder="0" scrolling="no" width="100%" height="700"></iframe>
        </div>
        <!-- //정비위탁자 -->
    </div>
    <!-- //탭메뉴 전체 영역 -->
</section>
<!-- //차량보고서 -->

<form id="frmMain"></form>
<script type="text/javascript">
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
            iframeUrl = "<c:url value='/ser/rpt/selectRpirItemTimeSearchReport.do' />";
            $("#iframeStatus01").attr("src", iframeUrl);
        }
    } else if (tabId == "tab02") {
        if($("#iframeStatus02").attr("src") == ""){
            iframeUrl = "<c:url value='/ser/rpt/selectRpirItemCarLineTpReport.do' />";
            $("#iframeStatus02").attr("src", iframeUrl);
        }
    } else if (tabId == "tab03") {
        if($("#iframeStatus03").attr("src") == ""){
            iframeUrl = "<c:url value='/ser/rpt/selectRpirItemFosterTpReport.do' />";
            $("#iframeStatus03").attr("src", iframeUrl);
        }
    } else if (tabId == "tab04") {
        if($("#iframeStatus04").attr("src") == ""){
            iframeUrl = "<c:url value='/ser/rpt/selectRpirItemRepairOrderManReport.do' />";
            $("#iframeStatus04").attr("src", iframeUrl);
        }
    }
}


</script>
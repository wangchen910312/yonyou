<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 통계보고서 -->
<section class="group" style="height:500%" >
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.statsReport' /></h1>  <!-- 통계보고서 -->
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div id="tabstrip" class="tab_area tab_iframe">
        <!-- 탭메뉴 -->
        <ul>
            <li id="tab01" class="k-state-active"><spring:message code='sal.lbl.MonthTargetReport' /></li>        <!-- 당월 인도목표 진도보고서 -->
            <li id="tab02"><spring:message code='sal.lbl.deliveryhisReport' /></li>      <!-- 인도이력 통계보고서 -->
            <li id="tab03"><spring:message code='sal.lbl.accessorySaleReport' /></li>      <!-- 경품판매 통계보고서 -->
            <li id="tab05"><spring:message code='sal.lbl.usedcarTransportReport' /></li>    <!-- 중고차 치환 통계보고서 -->
        </ul>
        <!-- //탭메뉴 -->

        <!-- 당월 인도목표 진도보고서 X -->
        <div class="mt0">
            <iframe id="iframeStatus01" src="" frameborder="0" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <!-- //당월 인도목표 진도보고서 -->

        <!-- 인도이력 통계보고서 O -->
        <div class="mt0">
            <iframe id="iframeStatus02" src="" frameborder="0" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <!-- //인도이력 통계보고서 -->

        <!-- 경품판매 통계보고서 O -->
        <div class="mt0">
            <iframe id="iframeStatus03" src="" frameborder="0" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <!-- //경품판매 통계보고서 -->


        <!-- 중고차 치환 통계보고서 O -->
        <div class="mt0">
            <iframe id="iframeStatus05" src="" frameborder="0" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <!-- //중고차 치환 통계보고서 -->
    </div>
    <!-- //탭메뉴 전체 영역 -->
</section>
<!-- //통계보고서 -->

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
            iframeUrl = "<c:url value='/sal/utr/vehicleReport/selectVehicleInfoReportMain.do' />";
            $("#iframeStatus01").attr("src", iframeUrl);
        }

    } else if (tabId == "tab02") {

        if($("#iframeStatus02").attr("src") == ""){
            iframeUrl = "<c:url value='/sal/utr/statsReport/selectDeliveryHistReportMain.do' />";
            $("#iframeStatus02").attr("src", iframeUrl);
        }

    } else if (tabId == "tab03") {
        if($("#iframeStatus03").attr("src") == ""){
            iframeUrl = "<c:url value='/sal/utr/statsReport/selectAccessorySalesReportMain.do' />";
            $("#iframeStatus03").attr("src", iframeUrl);
        }
    } else if (tabId == "tab05") {
        if($("#iframeStatus05").attr("src") == ""){
            iframeUrl = "<c:url value='/sal/utr/statsReport/selectUsedVehicleSaleReportMain.do' />";
            $("#iframeStatus05").attr("src", iframeUrl);
        }
    }

}

</script>
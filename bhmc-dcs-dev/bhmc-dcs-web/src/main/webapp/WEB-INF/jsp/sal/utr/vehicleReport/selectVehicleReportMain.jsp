<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 차량보고서 -->
<section class="group" style="height:500%" >
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.title.vehicleReport" /></h1>  <!-- 차량보고서 -->
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div id="tabstrip" class="tab_area tab_iframe">
        <!-- 탭메뉴 -->
        <ul>
            <li id="tab01" class="k-state-active"><spring:message code="sal.title.carInfoReport" /></li>  <!-- 차량정보 명세 보고서 -->
            <li id="tab02"><spring:message code="sal.title.dlrSalesReport" /></li>               <!-- 딜러 판매 현황 종합 통계 -->
            <li id="tab03"><spring:message code="sal.title.carlineMonthSucessRate" /></li>       <!-- 각 차종 월별 완성율 통계 -->
            <li id="tab04"><spring:message code="sal.title.carlineSaleRate" /></li>              <!-- 각 차종 판매율 통계 -->
            <li id="tab05"><spring:message code="sal.title.salesMonthReport" /></li>             <!-- 각 세일즈맨 월별 실적 통계 -->

            <li id="tab06"><spring:message code="sal.title.stockAnalysisReport" /></li>          <!-- 재고 계소 분석보고서 -->
        </ul>
        <!-- //탭메뉴 -->

        <!-- 차량정보 명세 보고서 O -->
        <div class="mt0">
            <iframe id="iframeStatus01" src="" frameborder="0" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <!-- //차량정보 명세 보고서 -->

        <!-- 딜러 판매 현황 종합 통계 O -->
        <div class="mt0">
            <iframe id="iframeStatus02" src="" frameborder="0" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <!-- //딜러 판매 현황 종합 통계 -->

        <!-- 각 차종 월별 완성율 통계 X -->
        <div class="mt0">
            <iframe id="iframeStatus03" src="" frameborder="0" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <!-- //각 차종 월별 완성율 통계 -->

        <!-- 각 차종 판매율 통계 O -->
        <div class="mt0">
            <iframe id="iframeStatus04" src="" frameborder="0" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <!-- //각 차종 판매율 통계 -->

        <!-- 각 세일즈맨 월별 실적 통계 O -->
        <div class="mt0">
            <iframe id="iframeStatus05" src="" frameborder="0" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <!-- //각 세일즈맨 월별 실적 통계 -->

        <!-- 재고 계소 분석보고서 X -->
        <div class="mt0">
            <iframe id="iframeStatus06" src="" frameborder="0" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <!-- //재고 계소 분석보고서 -->


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
            iframeUrl = "<c:url value='/sal/utr/vehicleReport/selectVehicleInfoReportMain.do' />";
            $("#iframeStatus01").attr("src", iframeUrl);
        }

    } else if (tabId == "tab02") {

        if($("#iframeStatus02").attr("src") == ""){
            iframeUrl = "<c:url value='/sal/utr/vehicleReport/selectDlrSalesReportMain.do' />";
            $("#iframeStatus02").attr("src", iframeUrl);
        }

    } else if (tabId == "tab03") {
        if($("#iframeStatus03").attr("src") == ""){
            iframeUrl = "<c:url value='/sal/utr/vehicleReport/selectDlrSalesReportMain.do' />";
            $("#iframeStatus03").attr("src", iframeUrl);
        }
    } else if (tabId == "tab04") {
        if($("#iframeStatus04").attr("src") == ""){
            iframeUrl = "<c:url value='/sal/utr/vehicleReport/selectCarlineSaleReportMain.do' />";
            $("#iframeStatus04").attr("src", iframeUrl);
        }
    } else if (tabId == "tab05") {
        if($("#iframeStatus05").attr("src") == ""){
            iframeUrl = "<c:url value='/sal/utr/vehicleReport/selectSalesmanMonthResultReportMain.do' />";
            $("#iframeStatus05").attr("src", iframeUrl);
        }
    } else if (tabId == "tab06") {
        if($("#iframeStatus06").attr("src") == ""){
            iframeUrl = "<c:url value='/sal/utr/vehicleReport/selectVehicleInfoReportMain.do' />";
            $("#iframeStatus06").attr("src", iframeUrl);
        }
    }
}


}

</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 목표분해도 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="mis.title.targetdcptmgmt" /></h1>
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="marketStatusTab" class="k-state-active"><spring:message code="mis.lbl.marketstatus" /></li>
            <li id="dealerStatusTab"><spring:message code="mis.lbl.dealerstatus" /></li>
            <li id="manuTargetTab"><spring:message code="mis.lbl.manutarget" /></li>
            <li id="dealerDcptSaleTab"><spring:message code="mis.lbl.dealersaledcpt" /></li>
            <li id="dealerDcptSaleManTab"><spring:message code="mis.lbl.dealersalemandcpt" /></li>
            <li id="dealerCustStatusTab"><spring:message code="mis.lbl.dealercuststatus" /></li>
            <li id="dealerTargetAchieveTab"><spring:message code="mis.lbl.dealertargetachieve" /></li>
            <li id="processMgmtTab"><spring:message code="mis.lbl.processmgmt" /></li>
            <li id="custKpiTab"><spring:message code="mis.lbl.custkpi" /></li>
        </ul>
        <!-- //탭메뉴 -->

        <!-- 시장현황 -->
        <div class="mt0">
            <iframe id="iframeMarketStatus" name="iframeMarketStatus" src="" frameborder="0" scrolling="auto" width="100%" height="768"></iframe>
        </div>
        <!-- //시장현황 -->

        <!-- 딜러현황 -->
        <div class="mt0">
            <iframe id="iframeDealerStatus" name="iframeDealerStatus"  src="" frameborder="0" scrolling="auto" width="100%" height="768"></iframe>
        </div>
        <!-- //딜러현황 -->

        <!-- 제조사목표 -->
        <div class="mt0">
            <iframe id="iframeManuTarget" name="iframeManuTarget" src="" frameborder="0" scrolling="auto" width="100%" height="768"></iframe>
        </div>
        <!-- //제조사목표 -->

        <!-- 딜러분해 -->
        <div class="mt0">
            <iframe id="iframeDealerSaleDcpt" name="iframeDealerSaleDcpt" src="" frameborder="0" scrolling="auto" width="100%" height="768"></iframe>
        </div>
        <!-- //딜러분해 -->

        <!-- 딜러분해 -->
        <div class="mt0">
            <iframe id="iframeDealerSaleManDcpt" name="iframeDealerSaleManDcpt" src="" frameborder="0" scrolling="auto" width="100%" height="768"></iframe>
        </div>
        <!-- //딜러분해 -->

        <!-- 딜러분해 -->
        <div class="mt0">
            <iframe id="iframeDealerCustStatus" name="iframeDealerCustStatus" src="" frameborder="0" scrolling="auto" width="100%" height="768"></iframe>
        </div>
        <!-- //딜러분해 -->

        <!-- 딜러분해 -->
        <div class="mt0">
            <iframe id="iframeDealerTargetAchieve" name="iframeDealerTargetAchieve" src="" frameborder="0" scrolling="auto" width="100%" height="768"></iframe>
        </div>
        <!-- //딜러분해 -->

        <!-- 과정관리 -->
        <div class="mt0">
            <iframe id="iframeProcessMgmt" name="iframeProcessMgmt" src="" frameborder="0" scrolling="auto" width="100%" height="768"></iframe>
        </div>
        <!-- //과정관리 -->

        <!-- KPI -->
        <div class="mt0">
            <iframe id="iframeCustKpi" name="iframeCustKpi" src="" frameborder="0" scrolling="auto" width="100%" height="768"></iframe>
        </div>
        <!-- //KPI -->

    </div>
    <!-- //탭메뉴 전체 영역 -->
</section>
<!-- //목표분해도 -->
<form name="frmMain" id="frmMain"></form>
<script type="text/javascript">

function mainCall(){
    var dcptMgmtUrl = "<c:url value='/mis/tdm/selectTargetDcptMgmtMarketStatusSearch.do' />";
    $("#iframeMarketStatus").attr("src", dcptMgmtUrl);
}

$(document).ready(function() {

    $(".tab_area").kendoExtTabStrip({
        animation:false
        , select:function(e) {
            var selectTabId = e.item.id;

            //alert(selectTabId);

            if (selectTabId == "marketStatusTab") {
                var marketStatusUrl = "<c:url value='/mis/tdm/selectTargetDcptMgmtMarketStatusSearch.do' />";
                $("#iframeMarketStatus").attr("src", marketStatusUrl);
            } else if (selectTabId == "dealerStatusTab") {
                var dealerStatusUrl = "<c:url value='/mis/tdm/selectTargetDcptMgmtDealerStatusSearch.do' />";
                $("#iframeDealerStatus").attr("src", dealerStatusUrl);
            } else if (selectTabId == "manuTargetTab") {
                var manuTargetUrl = "<c:url value='/mis/tdm/selectTargetDcptMgmtManuTargetSearch.do' />";
                $("#iframeManuTarget").attr("src", manuTargetUrl);
            } else if (selectTabId == "dealerDcptSaleTab") {
                var dealerSaleDcptUrl = "<c:url value='/mis/tdm/selectTargetDcptMgmtDealerDcptSaleSearch.do' />";
                $("#iframeDealerSaleDcpt").attr("src", dealerSaleDcptUrl);
            } else if (selectTabId == "dealerDcptSaleManTab") {
                var dealerSaleManDcptUrl = "<c:url value='/mis/tdm/selectTargetDcptMgmtDealerDcptSaleManSearch.do' />";
                $("#iframeDealerSaleManDcpt").attr("src", dealerSaleManDcptUrl);
            } else if (selectTabId == "dealerCustStatusTab") {
                var dealerCustStatusUrl = "<c:url value='/mis/tdm/selectTargetDcptMgmtDealerTargetStatus.do' />";
                $("#iframeDealerCustStatus").attr("src", dealerCustStatusUrl);
            } else if (selectTabId == "dealerTargetAchieveTab") {
                var dealerTargetAchieveUrl = "<c:url value='/mis/tdm/selectTargetDcptMgmtDealerTargetAchieve.do' />";
                $("#iframeDealerTargetAchieve").attr("src", dealerTargetAchieveUrl);
            } else if (selectTabId == "processMgmtTab") {
                var processMgmtUrl = "<c:url value='/mis/tdm/selectTargetDcptMgmtProcessMgmtSearch.do' />";
                $("#iframeProcessMgmt").attr("src", processMgmtUrl);
            } else if (selectTabId == "custKpiTab") {
                var custKpiUrl = "<c:url value='/mis/tdm/selectTargetDcptMgmtCustKpiSearch.do' />";
                $("#iframeCustKpi").attr("src", custKpiUrl);
            }
        }
    });

    mainCall();
});
</script>

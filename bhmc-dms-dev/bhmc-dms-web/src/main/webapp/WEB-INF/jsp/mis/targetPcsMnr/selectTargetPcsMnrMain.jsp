<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%--
    JSP Name :selectTargetPcsMnrMain.jsp
    Description :과정 모니터링 메인 화면
    author chibeom.song
    since 2016. 9. 20.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2016. 9. 20.   chibeom.song     최초 생성
--%>
<!-- 과정 모니터링 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="mis.title.targetpcsmnr" /></h1>
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="processMgmtTab" class="k-state-active"><spring:message code="mis.lbl.saleprocessmnr" /></li>
            <li id="dealerCustAchieveTab"><spring:message code="mis.lbl.custprocessmnr" /></li>
            <li id="dealerKpiTab"><spring:message code="mis.lbl.kpiprocessmnr" /></li>
        </ul>
        <!-- //탭메뉴 -->

        <!-- 과정관리 -->
        <div class="mt0">
            <iframe id="iframeProcessMgmt" name="iframeProcessMgmt"  src="" frameborder="0" scrolling="auto" width="100%" height="768"></iframe>
        </div>
        <!-- //과정관리 -->

        <!-- 딜러현황(집객달성현황) -->
        <div class="mt0">
            <iframe id="iframeDealerCustAchieve" name="iframeDealerCustAchieve" src="" frameborder="0" scrolling="auto" width="100%" height="768"></iframe>
        </div>
        <!-- //딜러현황(집객달성현황) -->

        <!-- KPI -->
        <div class="mt0">
            <iframe id="iframeDealerKpi" name="iframeDealerKpi" src="" frameborder="0" scrolling="auto" width="100%" height="768"></iframe>
        </div>
        <!-- //KPI -->


    </div>
    <!-- //탭메뉴 전체 영역 -->
</section>
<!-- //과정 모니터링 -->
<form name="frmMain" id="frmMain"></form>
<script type="text/javascript">

function mainCall(){
    var processMgmtUrl = "<c:url value='/mis/tpm/selectProcessMgmtSearch.do' />";
    $("#iframeProcessMgmt").attr("src", processMgmtUrl);
}

$(document).ready(function() {

    $(".tab_area").kendoExtTabStrip({
        animation:false
        , select:function(e) {
            var selectTabId = e.item.id;

            if (selectTabId == "processMgmtTab") {
                var processMgmtUrl = "<c:url value='/mis/tpm/selectProcessMgmtSearch.do' />";
                $("#iframeProcessMgmt").attr("src", processMgmtUrl);
            } else if (selectTabId == "dealerCustAchieveTab") {
                var dealerCustAchieveUrl = "<c:url value='/mis/tpm/selectDealerCustAchieveSearch.do' />";
                $("#iframeDealerCustAchieve").attr("src", dealerCustAchieveUrl);
            } else if (selectTabId == "dealerKpiTab") {
                var dealerKpiUrl = "<c:url value='/mis/tpm/selectDealerKpiSearch.do' />";
                $("#iframeDealerKpi").attr("src", dealerKpiUrl);
            }
        }
    });

    mainCall();
});
</script>
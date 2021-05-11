<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name:selectTargetDcptStepMain.jsp
    Description:목표 분해 공구 메인 화면
    author chibeom.song
    since 2016. 9. 20.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2016. 9. 20.   chibeom.song     최초 생성
--%>
<!-- 목표 분해 공구 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="mis.title.targetdcptstep" /></h1>
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <c:if test='${searchVO.tabNo == "1" || searchVO.tabNo == "" || searchVO.tabNo == null}' >
                <li id="targetDcptCarlineTab" class="k-state-active"><spring:message code="mis.lbl.targetdcptcarlineconfig" /></li>
                <li id="targetDcptStepTab"><spring:message code="mis.lbl.targetdcptstep" /></li>
                <li id="dealerDcptSaleTab"><spring:message code="mis.lbl.dealerdcptsale" /></li>
                <li id="dealerDcptCustTab"><spring:message code="mis.lbl.dealerdcptcust" /></li>
                <li id="derivationProfitTab"><spring:message code="mis.lbl.derivationprofitindexdcptlink" /></li>
            </c:if>
            <c:if test='${searchVO.tabNo == "2" }' >
                <li id="targetDcptCarlineTab"><spring:message code="mis.lbl.targetdcptcarlineconfig" /></li>
                <li id="targetDcptStepTab" class="k-state-active"><spring:message code="mis.lbl.targetdcptstep" /></li>
                <li id="dealerDcptSaleTab"><spring:message code="mis.lbl.dealerdcptsale" /></li>
                <li id="dealerDcptCustTab"><spring:message code="mis.lbl.dealerdcptcust" /></li>
                <li id="derivationProfitTab"><spring:message code="mis.lbl.derivationprofitindexdcptlink" /></li>
            </c:if>
            <c:if test='${searchVO.tabNo == "3" }' >
                <li id="targetDcptCarlineTab"><spring:message code="mis.lbl.targetdcptcarlineconfig" /></li>
                <li id="targetDcptStepTab"><spring:message code="mis.lbl.targetdcptstep" /></li>
                <li id="dealerDcptSaleTab" class="k-state-active"><spring:message code="mis.lbl.dealerdcptsale" /></li>
                <li id="dealerDcptCustTab"><spring:message code="mis.lbl.dealerdcptcust" /></li>
                <li id="derivationProfitTab"><spring:message code="mis.lbl.derivationprofitindexdcptlink" /></li>
            </c:if>
            <c:if test='${searchVO.tabNo == "4" }' >
                <li id="targetDcptCarlineTab"><spring:message code="mis.lbl.targetdcptcarlineconfig" /></li>
                <li id="targetDcptStepTab"><spring:message code="mis.lbl.targetdcptstep" /></li>
                <li id="dealerDcptSaleTab"><spring:message code="mis.lbl.dealerdcptsale" /></li>
                <li id="dealerDcptCustTab" class="k-state-active"><spring:message code="mis.lbl.dealerdcptcust" /></li>
                <li id="derivationProfitTab"><spring:message code="mis.lbl.derivationprofitindexdcptlink" /></li>
            </c:if>
            <c:if test='${searchVO.tabNo == "5" }' >
                <li id="targetDcptCarlineTab"><spring:message code="mis.lbl.targetdcptcarlineconfig" /></li>
                <li id="targetDcptStepTab"><spring:message code="mis.lbl.targetdcptstep" /></li>
                <li id="dealerDcptSaleTab"><spring:message code="mis.lbl.dealerdcptsale" /></li>
                <li id="dealerDcptCustTab"><spring:message code="mis.lbl.dealerdcptcust" /></li>
                <li id="derivationProfitTab" class="k-state-active"><spring:message code="mis.lbl.derivationprofitindexdcptlink" /></li>
            </c:if>
        </ul>
        <!-- //탭메뉴 -->

        <!-- 목표 차종 설정 -->
        <div class="mt0">
            <iframe id="iframeTargetDcptCarline" name="iframeTargetDcptCarline" src="" frameborder="0" scrolling="auto" width="100%" height="768"></iframe>
        </div>
        <!-- //목표 차종 설정 -->

        <!-- 목표 분해 공구 -->
        <div class="mt0">
            <iframe id="iframeTargetDcptStep" name="iframeTargetDcptStep" src="" frameborder="0" scrolling="auto" width="100%" height="768"></iframe>
        </div>
        <!-- //목표 분해 공구 -->

        <!-- 딜러현황(판매고문) -->
        <div class="mt0">
            <iframe id="iframeDealerDcptSale" name="iframeDealerDcptSale"  src="" frameborder="0" scrolling="auto" width="100%" height="768"></iframe>
        </div>
        <!-- //딜러현황(판매고문) -->

        <!-- 딜러현황(집객목표현황) -->
        <div class="mt0">
            <iframe id="iframeDealerDcptCust" name="iframeDealerDcptCust" src="" frameborder="0" scrolling="auto" width="100%" height="768"></iframe>
        </div>
        <!-- //딜러현황(집객목표현황) -->

        <!-- 파생이익지표분해 -->
        <div class="mt0">
            <iframe id="iframeDerivationProfit" name="iframeDerivationProfit" src="" frameborder="0" scrolling="auto" width="100%" height="768"></iframe>
        </div>
        <!-- //파생이익지표분해 -->


    </div>
    <!-- //탭메뉴 전체 영역 -->
</section>
<!-- //목표 분해 공구 -->
<form name="frmMain" id="frmMain"></form>
<script type="text/javascript">

function mainCall(){

    if('${searchVO.tabNo}' == '1') {
        var targetDcptCarlineUrl = "<c:url value='/mis/tds/selectTargetDcptCarlineSearch.do' />";
        $("#iframeTargetDcptCarline").attr("src", targetDcptCarlineUrl);
    } else if('${searchVO.tabNo}' == '2') {
        var selectTabId = "targetDcptStepTab";
        var targetDcptStepUrl = "<c:url value='/mis/tds/selectTargetDcptStepSearch.do' />";
        $("#iframeTargetDcptStep").attr("src", targetDcptStepUrl);
    } else if('${searchVO.tabNo}' == '3') {
        var dealerDcptSaleUrl = "<c:url value='/mis/tds/selectDealerDcptSaleSearch.do' />";
        $("#iframeDealerDcptSale").attr("src", dealerDcptSaleUrl);
    } else if('${searchVO.tabNo}' == '4') {
        var dealerDcptCustUrl = "<c:url value='/mis/tds/selectDealerDcptCustSearch.do' />";
        $("#iframeDealerDcptCust").attr("src", dealerDcptCustUrl);
    } else if('${searchVO.tabNo}' == '5') {
        var derivationProfitUrl = "<c:url value='/mis/tds/selectTargetDerivationProfitSearch.do' />";
        $("#iframeDerivationProfit").attr("src", derivationProfitUrl);
    } else {
        var targetDcptCarlineUrl = "<c:url value='/mis/tds/selectTargetDcptCarlineSearch.do' />";
        $("#iframeTargetDcptCarline").attr("src", targetDcptCarlineUrl);
    }
}

$(document).ready(function() {

    $(".tab_area").kendoExtTabStrip({
        animation:false
        , select:function(e) {
            var selectTabId = e.item.id;

            if (selectTabId == "targetDcptCarlineTab") {
                var targetDcptCarlineUrl = "<c:url value='/mis/tds/selectTargetDcptCarlineSearch.do' />";
                $("#iframeTargetDcptCarline").attr("src", targetDcptCarlineUrl);
            } else if (selectTabId == "targetDcptStepTab") {
                var targetDcptStepUrl = "<c:url value='/mis/tds/selectTargetDcptStepSearch.do' />";
                $("#iframeTargetDcptStep").attr("src", targetDcptStepUrl);
            } else if (selectTabId == "dealerDcptSaleTab") {
                var dealerDcptSaleUrl = "<c:url value='/mis/tds/selectDealerDcptSaleSearch.do' />";
                $("#iframeDealerDcptSale").attr("src", dealerDcptSaleUrl);
            } else if (selectTabId == "dealerDcptCustTab") {
                var dealerDcptCustUrl = "<c:url value='/mis/tds/selectDealerDcptCustSearch.do' />";
                $("#iframeDealerDcptCust").attr("src", dealerDcptCustUrl);
            } else if (selectTabId == "derivationProfitTab") {
                var derivationProfitUrl = "<c:url value='/mis/tds/selectTargetDerivationProfitSearch.do' />";
                $("#iframeDerivationProfit").attr("src", derivationProfitUrl);
            }
        }
    });

    mainCall();
});
</script>
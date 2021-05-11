<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<style type="text/css">
/* tabmenu */
.tab_area2 { display:inline-block; position:relative; width:100%; margin-top:10px; border:none; background:none;}
.tab_area2.k-tabstrip>.k-content { overflow-y:auto;}
.tab_area2.k-tabstrip>.k-content:after { content:""; display:block; clear:both; height:0px;}
.tab_area2.tab_area_v1 .k-tabstrip-items .k-link { padding-left:11px; padding-right:11px;}
.tab_area2.tab_area_min .k-tabstrip-items .k-link { min-width:104px; padding-left:10px; padding-right:10px;}
.tab_area2.tab_area_min .k-tabstrip-items .k-state-active .k-link { min-width:102px;}
.tab_area2.tab_iframe>.k-content{ padding:0;}
</style>

<!-- 재고관리(종합) -->
<div id="resizableContainer">
<section class="group">

    <!-- 탭메뉴 전체 영역 -->
    <div id="tabstrip" class="tab_area2 tab_iframe">
        <!-- 탭메뉴 -->
        <ul>
            <li id="tStock" class="k-state-active"><spring:message code='sal.title.stockiMgmt' /></li>  <!-- 재고관리 -->
            <!-- 20201215 战略终端相关功能页面入口隐藏 from bhit update by sunzq3 start -->
            <!--<li id="tStrategy"><spring:message code='sal.title.stockStrategySearch' /></li> -->     <!-- 전략출고조회 -->
            <!-- 20201215 战略终端相关功能页面入口隐藏 from bhit update by sunzq3 end -->
            <li id="tOpenStock"><spring:message code='sal.title.stockOpenMnt' /></li>             <!-- 공개재고관리 -->
        </ul>
        <!-- //탭메뉴 -->

        <!-- 재고관리 -->
        <div class="mt0">
            <iframe id="iframeStatus01" src="" frameborder="0" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <!-- //재고관리 -->
        
		<!-- 20201215 战略终端相关功能页面入口隐藏 from bhit update by sunzq3 start -->
        <!-- 전략출고조회 -->
        <!--<div class="mt0">-->
        <!--   <iframe id="iframeStatus02" src="" frameborder="0" scrolling="auto" width="100%" height="526"></iframe>-->
        <!--</div>-->
        <!-- //전략출고조회 -->
		<!-- 20201215 战略终端相关功能页面入口隐藏 from bhit update by sunzq3 end -->

        <!-- 공개재고관리 -->
        <div class="mt0">
            <iframe id="iframeStatus03" src="" frameborder="0" scrolling="auto" width="100%" height="526"></iframe>
        </div>
        <!-- //공개재고관리 -->

    </div>
    <!-- //탭메뉴 전체 영역 -->
</section>
</div>
<!-- //차량보고서 -->

<script type="text/javascript">
<!--

var selectTabId = "tStock";

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
    var windowHeight = $(window).innerHeight();
    var iframeUrl;
    
    if (tabId == "tStock") {
        if($("#iframeStatus01").attr("src") == ""){
            lodingShow();
            iframeUrl = "<c:url value='/sal/inv/stockMnt/selectStockMntMain.do' />";
            $("#iframeStatus01").attr("height", windowHeight - 50);
            $("#iframeStatus01").attr("src", iframeUrl);
        }

    } else if (tabId == "tStrategy") {
        if($("#iframeStatus02").attr("src") == ""){
            lodingShow();
            iframeUrl = "<c:url value='/sal/inv/stockStrategy/selectStockStrategyMain.do' />";
            $("#iframeStatus02").attr("height", windowHeight - 50);
            $("#iframeStatus02").attr("src", iframeUrl);
        }

    } else if (tabId == "tOpenStock") {
        if($("#iframeStatus03").attr("src") == ""){
            lodingShow();
            iframeUrl = "<c:url value='/sal/inv/stockOpen/selectStockOpenMain.do' />";
            $("#iframeStatus03").attr("height", windowHeight - 50);
            $("#iframeStatus03").attr("src", iframeUrl);
        }
    } 
}

function lodingShow(){
    dms.loading.show();
}

function lodinghide(){
    dms.loading.hide();
}

//-->
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- [딜러사] 종합 경영 현황 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="mis.title.totalmisstatus" /></h1>
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="saleStatusTab" class="k-state-active"><spring:message code="mis.lbl.salestatus" /></li>
            <li id="custStatusTab"><spring:message code="mis.lbl.customerstatus" /></li>
        </ul>
        <!-- //탭메뉴 -->

        <!-- 판매현황 -->
        <div class="mt0">
            <iframe id="iframeSaleStatus" name="iframeSaleStatus" src="" frameborder="0" scrolling="auto" width="100%" height="830"></iframe>
        </div>
        <!-- //판매현황 -->

        <!-- 고객현황 -->
        <div class="mt0">
            <iframe id="iframeCustStatus" name="iframeCustStatus"  src="" frameborder="0" scrolling="auto" width="100%" height="830"></iframe>
        </div>
        <!-- //고객현황 -->

    </div>
    <!-- //탭메뉴 전체 영역 -->
</section>
<!-- //목표분해도 -->
<form name="frmMain" id="frmMain"></form>
<script type="text/javascript">

function totalMisStatusMainCall(){
    var saleStatusUrl = "<c:url value='/mis/tot/selectSaleStatus.do' />";
    $("#iframeSaleStatus").attr("src", saleStatusUrl);
}

$(document).ready(function() {

    $(".tab_area").kendoExtTabStrip({
        animation:false
        , select:function(e) {
            var selectTabId = e.item.id;

            if (selectTabId == "saleStatusTab") {
                var saleStatusUrl = "<c:url value='/mis/tot/selectSaleStatus.do' />";
                $("#iframeSaleStatus").attr("src", saleStatusUrl);
            } else if (selectTabId == "custStatusTab") {
                var custStatusUrl = "<c:url value='/mis/tot/selectCustStatus.do' />";
                $("#iframeCustStatus").attr("src", custStatusUrl);
            }
        }
    });

    totalMisStatusMainCall();
});
</script>
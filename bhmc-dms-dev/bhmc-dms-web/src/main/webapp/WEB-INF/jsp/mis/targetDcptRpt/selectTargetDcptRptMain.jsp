<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name:selectTargetDcptRptMain.jsp
    Description:목표 분해 보고서 메인 화면
    author chibeom.song
    since 2016. 9. 21.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2016. 9. 21.   chibeom.song     최초 생성
--%>
<!-- 목표 분해 보고서 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="mis.menu.targetdcptrpt" /></h1>
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
                <li id="targetDcptRptMain" class="k-state-active"><spring:message code="mis.menu.targetdcptrpt" /></li>
        </ul>
        <!-- //탭메뉴 -->

        <!-- 목표 분해 보고서 메인 -->
        <div class="mt0">
            <iframe id="iframeTargetDcptRptMain" name="iframeTargetDcptRptMain" src="" frameborder="0" scrolling="auto" width="100%" height="1300"></iframe>
        </div>
        <!-- //목표 분해 보고서 메인 -->

    </div>
    <!-- //탭메뉴 전체 영역 -->
</section>

<form name="frmMain" id="frmMain"></form>
<script type="text/javascript">

function mainCall(){
    var targetDcptRptMainUrl = "<c:url value='/mis/tdr/selectTargetDcptRptMainReport.do' />";
    $("#iframeTargetDcptRptMain").attr("src", targetDcptRptMainUrl);
}

$(document).ready(function() {

    $(".tab_area").kendoExtTabStrip({
        animation:false
        , select:function(e) {
            var selectTabId = e.item.id;

            if (selectTabId == "targetDcptRptMain") {
                var targetDcptRptMainUrl = "<c:url value='/mis/tdr/selectTargetDcptRptMainReport.do' />";
                $("#iframeTargetDcptRptMain").attr("src", targetDcptRptMainUrl);
            }
        }
    });

    mainCall();
});
</script>

<!-- 목표 분해 보고서 -->
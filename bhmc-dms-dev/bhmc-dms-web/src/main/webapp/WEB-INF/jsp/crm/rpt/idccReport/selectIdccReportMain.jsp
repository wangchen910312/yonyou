<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section class="group" style="height:500%" >
    <!-- 탭메뉴 전체 영역 -->
    <div class="tab_area tab_iframe">
        <!-- 탭메뉴 -->
        <ul>
            <li id="Tab01" class="k-state-active"><spring:message code="crm.lbl.idccChannelProfit" /><!-- 채널이익분석 --></li>
            <li id="Tab02"><spring:message code="crm.lbl.idccIntentionCarlineReport" /><!-- 의향차형분석 --></li>
            <li id="Tab03"><spring:message code="crm.lbl.intentionClassReport" /><!-- 의향등급분석 --></li>
            <li id="Tab04"><spring:message code="crm.lbl.idccCallDtReport" /><!-- 통화시간분석 --></li>
<%--             <li id="Tab05"><spring:message code="crm.lbl.idccVisitResvRateReport" /><!-- 내방예약율분석 --></li> --%>
<%--             <li id="Tab06"><spring:message code="crm.lbl.idccDealRateReport" /><!-- 거래율분석 --></li> --%>
<%--             <li id="Tab07"><spring:message code="crm.lbl.idccResvAbilityReport" /><!-- IDCC예약능력 분석 --></li> --%>
        </ul>
        <!-- //탭메뉴 -->

        <!-- 채널이익분석 -->
        <div class="mt0">
            <iframe id="iframeTab01" name="iframeTab01" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
        <!-- //채널이익분석 -->

        <!-- 의향차형분석 -->
        <div class="mt0">
            <iframe id="iframeTab02" name="iframeTab02" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
        <!-- //의향차형분석 -->

        <!-- 의향등급분석 -->
        <div class="mt0">
            <iframe id="iframeTab03" name="iframeTab03" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
        <!-- //의향등급분석 -->

        <!-- 통화시간분석 -->
        <div class="mt0">
            <iframe id="iframeTab04" name="iframeTab04" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
        <!-- //통화시간분석 -->

        <!-- 내방예약율분석 -->
<!--         <div class="mt0"> -->
<!--             <iframe id="iframeTab05" name="iframeTab05" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe> -->
<!--         </div> -->
        <!-- //내방예약율분석 -->

        <!-- 거래율분석 -->
<!--         <div class="mt0"> -->
<!--             <iframe id="iframeTab06" name="iframeTab06" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe> -->
<!--         </div> -->
        <!-- //거래율분석 -->

        <!-- IDCC예약능력 분석 -->
<!--         <div class="mt0"> -->
<!--             <iframe id="iframeTab07" name="iframeTab07" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe> -->
<!--         </div> -->
        <!-- //IDCC예약능력 분석 -->

    </div>
    <!-- //탭메뉴 전체 영역 -->
</section>
<!-- //목표분해도 -->

<form name="frmMain" id="frmMain"></form>
<script type="text/javascript">
    function membershipReportMainCall(){
        var iframeUrl = "<c:url value='/crm/rpt/idccReport/selectIdccChannelProfit.do' />";
        $("#iframeTab01").attr("src", iframeUrl);
    };

    $(document).ready(function() {
        $(".tab_area").kendoExtTabStrip({
            animation:false
            , select:function(e) {
                var selectTabId = e.item.id;
                var iframeUrl;

                if (selectTabId == "Tab01") {

                    iframeUrl = "<c:url value='/crm/rpt/idccReport/selectIdccChannelProfit.do' />";

                } else if (selectTabId == "Tab02") {

                    iframeUrl = "<c:url value='/crm/rpt/idccReport/selectIdccIntentionCarlineReport.do' />";

                } else if (selectTabId == "Tab03") {

                    iframeUrl = "<c:url value='/crm/rpt/idccReport/selectIdccIntentionClassReport.do' />";

                } else if (selectTabId == "Tab04") {

                    iframeUrl = "<c:url value='/crm/rpt/idccReport/selectIdccCallDtReport.do' />";

                } else if (selectTabId == "Tab05") {

                    iframeUrl = "<c:url value='/crm/rpt/idccReport/selectIdccVisitResvRateReport.do' />";

                } else if (selectTabId == "Tab06") {

                    iframeUrl = "<c:url value='/crm/rpt/idccReport/selectIdccDealRateReport.do' />";

                } else if (selectTabId == "Tab07") {

                    iframeUrl = "<c:url value='/crm/rpt/idccReport/selectIdccResvAbilityReport.do' />";

                };

                if($("#iframe"+selectTabId).attr("src") == ""){
                    $("#iframe"+selectTabId).attr("src", iframeUrl);
                };
            }
        });
        membershipReportMainCall();
    });
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section class="group" style="height:500%" >
    <div class="tab_area tab_iframe">
        <ul>
            <li id="Tab01" class="k-state-active"><spring:message code="crm.lbl.advisorAbilityReport" /><!-- 판매고문개인능력분석 --></li>
            <li id="Tab02"><spring:message code="crm.lbl.carlineReport" /><!-- 차형 능력분석 --></li>
            <li id="Tab03"><spring:message code="crm.lbl.channelReport" /><!-- 채널 분석--></li>
            <li id="Tab04"><spring:message code="crm.lbl.intentionCarlineReport" /><!-- 의향차형 분석 --></li>
            <li id="Tab05"><spring:message code="crm.lbl.prsnIntentionCarlineReport" /><!-- 판매고문 차형 등급분석 --></li>
            <li id="Tab06"><spring:message code="crm.lbl.customerProcessTimeReport" /><!-- 고객흐름 시간단위분석 --></li>
            <li id="Tab07"><spring:message code="crm.lbl.intentionClassReport" /><!-- 의향등급분석 --></li>
            <li id="Tab08"><spring:message code="crm.lbl.prsnIntentionClassReport" /><!-- 판매고문 의향 등급별 분포량 분석 --></li>
            <li id="Tab10"><spring:message code="crm.lbl.avrResponseTimeReport" /><!-- 평균대응시간분석 --></li>
            <li id="Tab09"><spring:message code="crm.lbl.responseTimeStsfRateReport" /><!-- 대응시간 만족률 분석 --></li>
            <li id="Tab11"><spring:message code="crm.lbl.reVisitRateReport" /><!-- 재방문율분석 --></li>
        </ul>
        <div class="mt0">
            <iframe id="iframeTab01" name="iframeTab01" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
        <div class="mt0">
            <iframe id="iframeTab02" name="iframeTab02" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
        <div class="mt0">
            <iframe id="iframeTab03" name="iframeTab03" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
        <div class="mt0">
            <iframe id="iframeTab04" name="iframeTab04" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
        <div class="mt0">
            <iframe id="iframeTab05" name="iframeTab05" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
        <div class="mt0">
            <iframe id="iframeTab06" name="iframeTab06" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
        <div class="mt0">
            <iframe id="iframeTab07" name="iframeTab07" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
        <div class="mt0">
            <iframe id="iframeTab08" name="iframeTab08" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
        <div class="mt0">
            <iframe id="iframeTab10" name="iframeTab10" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
        <div class="mt0">
            <iframe id="iframeTab09" name="iframeTab09" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
        <div class="mt0">
            <iframe id="iframeTab11" name="iframeTab11" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
    </div>
</section>
<script type="text/javascript">
    function membershipReportMainCall(){
        var iframeUrl = "<c:url value='/crm/rpt/customerInfoReport/selectAdvisorAbilityReport.do' />";
        $("#iframeTab01").attr("src", iframeUrl);
    };

    $(document).ready(function() {
        $(".tab_area").kendoExtTabStrip({
            animation:false
            , select:function(e) {
                var selectTabId = e.item.id;
                var iframeUrl;

                if (selectTabId == "Tab01") {
                    //판매고문개인능력분석
                    iframeUrl = "<c:url value='/crm/rpt/customerInfoReport/selectAdvisorAbilityReport.do' />";

                } else if (selectTabId == "Tab02") {
                    //차형 능력분석
                    iframeUrl = "<c:url value='/crm/rpt/customerInfoReport/selectCarlineReport.do' />";

                } else if (selectTabId == "Tab03") {
                    //채널 분석
                    iframeUrl = "<c:url value='/crm/rpt/customerInfoReport/selectChannelReport.do' />";

                } else if (selectTabId == "Tab04") {
                    //의향차형 분석
                    iframeUrl = "<c:url value='/crm/rpt/customerInfoReport/selectIntentionCarlineReport.do' />";

                } else if (selectTabId == "Tab05") {
                    //판매고문 차형 등급분석
                    iframeUrl = "<c:url value='/crm/rpt/customerInfoReport/selectPrsnIntentionCarlineReport.do' />";

                } else if (selectTabId == "Tab06") {
                    //고객흐름 시간단위분석
                    iframeUrl = "<c:url value='/crm/rpt/customerInfoReport/selectCustomerProcessTimeReport.do' />";

                } else if (selectTabId == "Tab07") {
                    //의향등급분석
                    iframeUrl = "<c:url value='/crm/rpt/customerInfoReport/selectIntentionClassReport.do' />";

                } else if (selectTabId == "Tab08") {
                    //판매고문 의향 등급별 분포량 분석
                    iframeUrl = "<c:url value='/crm/rpt/customerInfoReport/selectPrsnIntentionClassReport.do' />";

                } else if (selectTabId == "Tab09") {
                    //평균대응시간분석
                    iframeUrl = "<c:url value='/crm/rpt/customerInfoReport/selectResponseTimeStsfRateReport.do' />";

                } else if (selectTabId == "Tab10") {
                    //대응시간 만족률 분석
                    iframeUrl = "<c:url value='/crm/rpt/customerInfoReport/selectAvrResponseTimeReport.do' />";

                } else if (selectTabId == "Tab11") {
                    //재방문율분석
                    iframeUrl = "<c:url value='/crm/rpt/customerInfoReport/selectReVisitRateReport.do' />";
                };
                if($("#iframe"+selectTabId).attr("src") == ""){
                    $("#iframe"+selectTabId).attr("src", iframeUrl);
                };
            }
        });
        membershipReportMainCall();
    });
</script>
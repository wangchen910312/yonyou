<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section class="group" style="height:500%" >
    <div class="tab_area tab_iframe">
        <ul>
            <li id="Tab01" class="k-state-active" ><spring:message code="crm.title.salesOpptLeadFUReport" /><!-- 5、线索跟踪统计表_리드 F U 통계표 --></li>
            <li id="Tab02"><spring:message code="crm.title.showRoomResponseStatistic" /><!-- 6、展厅接待统计_전시장 응대 통계 --></li>
            <li id="Tab03" ><spring:message code="crm.title.showRoomCustTimeAnalysis" /><!-- 7、展厅客流时段分析_전시장 고객 흐름 시간대 분석 --></li>
            <li id="Tab04" ><spring:message code="crm.title.currentLeadLevelAnalysis" /><!-- 8、当前线索意向级别分析_현재 리드 응향 등급 분석 --></li>
            <li id="Tab05" ><spring:message code="crm.title.salesOpptDealRateReport" /><!-- 9、成交率分析_거래율 분석 --></li>
            <%-- <li id="Tab06" ><spring:message code="crm.title.salesOpptFailDtlReport" /><!-- 10、战败明细_전페 상세 --></li> --%>
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
        </div><!--
        <div class="mt0">
            <iframe id="iframeTab06" name="iframeTab06" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div> -->
    </div>
</section>
<script type="text/javascript">
    var iframeUrl = new Array();
    iframeUrl[0] = "<c:url value='/crm/rpt/salesOpptReport/selectSalesOpptLeadFUReport.do'/>"; //5、线索跟踪统计表_리드 F U 통계표
    iframeUrl[1] = "<c:url value='/crm/rpt/salesOpptReport/selectShowRoomResponseStatisticReport.do'/>"; //6、展厅接待统计_전시장 응대 통계
    iframeUrl[2] = "<c:url value='/crm/rpt/salesOpptReport/selectShowRoomCustTimeAnalysisReport.do'/>"; //7、展厅客流时段分析_전시장 고객 흐름 시간대 분석
    iframeUrl[3] = "<c:url value='/crm/rpt/salesOpptReport/selectCurrentLeadLevelAnalysisReport.do'/>"; //8、当前线索意向级别分析_현재 리드 응향 등급 분석
    iframeUrl[4] = "<c:url value='/crm/rpt/salesOpptReport/selectSalesOpptDealRateReport.do'/>"; //9、成交率分析_거래율 분석
    iframeUrl[5] = "<c:url value='/crm/rpt/salesOpptReport/selectSalesOpptFailDtlReport.do'/>"; //10、战败明细_전페 상세

    function reportMainCall(tabId){
        var urlIndex = parseInt(tabId.replace("Tab", ""))-1;
        $("#iframe"+tabId).attr("src", iframeUrl[urlIndex]);
    };

    $(document).ready(function() {
        $(".tab_area").kendoExtTabStrip({
            animation:false
            , select:function(e) {
                var selectTabId = e.item.id;

                if($("#iframe"+selectTabId).attr("src") == ""){
                    reportMainCall(selectTabId);
                };
            }
        });
        reportMainCall("Tab01");
    });
</script>


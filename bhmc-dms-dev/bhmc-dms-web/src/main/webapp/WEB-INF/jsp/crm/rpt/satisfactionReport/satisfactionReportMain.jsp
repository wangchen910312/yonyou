<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section class="group" style="height:500%" >
    <div class="tab_area tab_iframe">
        <ul>
            <li id="Tab01" class="k-state-active"><spring:message code="crm.lbl.satisfactionTotalReport" /></li><!-- 만족도 통합 분석 현황 -->
            <li id="Tab02"><spring:message code="crm.menu.satisfactionReportPerson" /></li><!-- 만족도 조사 담당자별 현황 -->
        </ul>
        <div class="mt0">
            <iframe id="iframeTab01" name="iframeTab01" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
        <div class="mt0">
            <iframe id="iframeTab02" name="iframeTab02" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
    </div>
</section>
<script type="text/javascript">
    var iframeUrl = new Array();
    iframeUrl[0] = "<c:url value='/crm/rpt/satisfactionReport/satisfactionTotalReport.do'/>";
    iframeUrl[1] = "<c:url value='/crm/rpt/satisfactionReport/satisfactionPersonReport.do'/>";

    function reportMainCall(tabId){
        if($("#iframe"+tabId).attr("src") == ""){
            var urlIndex = parseInt(tabId.replace("Tab", ""))-1;
            $("#iframe"+tabId).attr("src", iframeUrl[urlIndex]);
        }
    };

    $(document).ready(function() {
        $(".tab_area").kendoExtTabStrip({
            animation:false
            ,displayScrollButton:true
            ,scrollWidth:50
            ,select:function(e) {
                var selectTabId = e.item.id;
                if($("#iframe"+selectTabId).attr("src") == ""){
                    reportMainCall(selectTabId);
                };
            }
        });
        reportMainCall("Tab01");
    });
</script>
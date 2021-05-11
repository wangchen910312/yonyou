<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section class="group" style="height:500%" >
    <div class="tab_area tab_iframe">
        <ul>
            <li id="Tab01" class="k-state-active"><spring:message code="crm.menu.callCenterReportType" /><!-- OB 이력현황(유형별) --></li>
            <li id="Tab02"><spring:message code="crm.menu.callCenterReportKPI" /><!-- OB KPI --></li>
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
    function membershipReportMainCall(){
        var iframeUrl = "<c:url value='/crm/rpt/OBReport/selectCallCenterReportType.do' />";
        $("#iframeTab01").attr("src", iframeUrl);
    };
    $(document).ready(function() {
        $(".tab_area").kendoExtTabStrip({
            animation:false
            , select:function(e) {
                var selectTabId = e.item.id;
                var iframeUrl;
                if (selectTabId == "Tab01") {
                    //OB 이력( 유형별 )
                    iframeUrl = "<c:url value='/crm/rpt/OBReport/selectCallCenterReportType.do' />";
                } else if (selectTabId == "Tab02") {
                    //OB 현황 ( 담당자별 )
                    iframeUrl = "<c:url value='/crm/rpt/OBReport/selectCallCenterReportPerson.do' />";
                }
                if($("#iframe"+selectTabId).attr("src") == ""){
                    $("#iframe"+selectTabId).attr("src", iframeUrl);
                };
            }
        });
        membershipReportMainCall();
    });
</script>
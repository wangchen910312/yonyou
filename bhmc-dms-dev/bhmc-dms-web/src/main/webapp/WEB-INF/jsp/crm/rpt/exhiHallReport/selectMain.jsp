<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section class="group" style="height:500%" >
    <div class="tab_area tab_iframe">
        <ul>
            <li id="Tab01" class="k-state-active" ><spring:message code="crm.title.testDriRatet" /><!-- 试乘试驾率 --></li>
            <li id="Tab02" ><spring:message code="mis.lbl.revisitcustrate" /><!-- 再次进店率 再次到店率 --></li>
            <li id="Tab03" ><spring:message code="crm.title.initialRetentionrate" /><!-- 首次留档率 --></li>
            <li id="Tab04" ><spring:message code="mis.lbl.kpiShopVsitSuccessRate" /><!-- 成交率 --></li>
            <li id="Tab05" ><spring:message code="crm.title.receptionTimeSatisfyRate" /><!-- 接待时长满足率 --></li>
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
    </div>
</section>
<script type="text/javascript">

    var iframeUrl = new Array();
    iframeUrl[0] = "<c:url value='/crm/rpt/exhiHallReport/selectTestDriveRate.do'/>"; //试驾率
    iframeUrl[1] = "<c:url value='/crm/rpt/exhiHallReport/selectAgainStoreRate.do'/>"; //再次到店率
    iframeUrl[2] = "<c:url value='/crm/rpt/exhiHallReport/selectInitialRetentionrate.do'/>"; //首次留档率
    iframeUrl[3] = "<c:url value='/crm/rpt/exhiHallReport/selectEfficiency.do'/>"; //成交率
    iframeUrl[4] = "<c:url value='/crm/rpt/exhiHallReport/selectReceptionTimeSatisfyRate.do'/>"; //接待时长满足率
   
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


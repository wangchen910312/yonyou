<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section class="group" style="height:500%" >
    <div class="tab_area tab_iframe">
        <ul>
            <li id="Tab01" class="k-state-active"><spring:message code="crm.title.opptHoldTpReport" /><!-- 98"销售线索跟进报表-按线索来源 판매기회 F/U 통계표 -리드 출처 별"-->
            <li id="Tab02" ><spring:message code="crm.title.opptManagerReport" /><!--99"销售线索跟进统计表-分特约店 판매기회 F/U 통계표 - 딜러별"-->
            <li id="Tab03" ><spring:message code="crm.title.opptCarLineReport" /><!--100"销售线索跟进统计表-分车型 판매기회 F/U 통계표 - 차형별"-->
            <li id="Tab04" ><spring:message code="crm.title.opptOpptTpReport" /><!--102"销售线索跟进统计表-分线索类型 판매기회 F/U 통계표-리드유형별 "-->
            <li id="Tab05" ><spring:message code="crm.title.opptFourthReport" /><!--105"跟踪促成阶段商机数量表 추적추진단계 판매기회수량표"-->
            <li id="Tab06" ><spring:message code="crm.title.opptFourthHoldTpReport" /><!--106"跟踪促成阶段数量表-按来源/车种 추적추진단계 판매기회-루트별/차종"-->
            <li id="Tab07" ><spring:message code="crm.title.opptFourthCarLineReport" /><!--107"跟踪促成阶段新增/战败数量-车种 추적추진 단계 신규추가/전패수량-차종"-->
            <li id="Tab08" ><spring:message code="crm.title.opptFourthManagerReport" /><!--108"跟踪促成阶段新增/战败数量-销售顾问 추적추진단계 신규추가/전패수량-판매고문"-->
            <li id="Tab09" ><spring:message code="crm.title.opptIngReport" /><!--110"当前跟踪线索数 현재추적리드수"-->
            <li id="Tab10" ><spring:message code="crm.title.opptFailReport" /><!--111"战败明细 전패명세"-->
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
            <iframe id="iframeTab09" name="iframeTab09" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
        <div class="mt0">
            <iframe id="iframeTab10" name="iframeTab10" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
    </div>
</section>
<script type="text/javascript">
    var iframeUrl = new Array();
    iframeUrl[0] = "<c:url value='/crm/rpt/opptReport/selectHoldTpReport.do'/>"; // 98"销售线索跟进报表-按线索来源 판매기회 F/U 통계표 -리드 출처 별"
    iframeUrl[1] = "<c:url value='/crm/rpt/opptReport/selectManagerReport.do'/>"; // 99"销售线索跟进统计表-分特约店 판매기회 F/U 통계표 - 판매고문별"
    iframeUrl[2] = "<c:url value='/crm/rpt/opptReport/selectCarLineReport.do'/>"; // 100"销售线索跟进统计表-分车型 판매기회 F/U 통계표 - 차형별"
    iframeUrl[3] = "<c:url value='/crm/rpt/opptReport/selectOpptTpReport.do'/>"; // 102"销售线索跟进统计表-分线索类型 판매기회 F/U 통계표-리드유형별 "
    iframeUrl[4] = "<c:url value='/crm/rpt/opptReport/selectFourthReport.do'/>"; // 105"跟踪促成阶段商机数量表 추적추진단계 판매기회수량표"
    iframeUrl[5] = "<c:url value='/crm/rpt/opptReport/selectFourthHoldTpReport.do'/>"; // 106"跟踪促成阶段数量表-按来源/车种 추적추진단계 판매기회-루트별/차종"
    iframeUrl[6] = "<c:url value='/crm/rpt/opptReport/selectFourthCarLineReport.do'/>"; // 107"跟踪促成阶段新增/战败数量-车种 추적추진 단계 신규추가/전패수량-차종"
    iframeUrl[7] = "<c:url value='/crm/rpt/opptReport/selectFourthManagerReport.do'/>"; // 108"跟踪促成阶段新增/战败数量-销售顾问 추적추진단계 신규추가/전패수량-판매고문"
    iframeUrl[8] = "<c:url value='/crm/rpt/opptReport/selectIngReport.do'/>"; // 110"当前跟踪线索数 현재추적리드수"
    iframeUrl[9] = "<c:url value='/crm/rpt/opptReport/selectFailReport.do'/>"; // 111"战败明细 전패명세"

    function reportMainCall(tabId){
        var urlIndex = parseInt(tabId.replace("Tab", ""))-1;
        $("#iframe"+tabId).attr("src", iframeUrl[urlIndex]);
    };

    $(document).ready(function() {
        $(".tab_area").kendoExtTabStrip({
            animation:false
            ,displayScrollButton:true
            ,scrollWidth:50
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


<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section class="group" style="height:500%" >
    <div class="tab_area tab_iframe">
        <ul>
            <li id="Tab01" class="k-state-active" ><spring:message code="crm.title.custCharacterReport" /><!--  1. 客户特征 고객특성 --></li>
            <li id="Tab02"><spring:message code="crm.title.custSalesReport" /><!--  "77. 增换购 추가교체구매" --></li>
            <li id="Tab03" ><spring:message code="crm.title.custHpNoValidReport" /><!--  93. "无效客户数量统计表 무효고객수 통계리포트" --></li>
            <li id="Tab04" ><spring:message code="crm.lbl.custCntReport" /><!--  " 客户数量统计고객 수량 통계" --></li>
            <li id="Tab05" ><spring:message code="crm.lbl.attritionRateAnalysis" /><!--  " 11.流失率分析_유실율 분석(정비)" --></li>
            <li id="Tab06" ><spring:message code="crm.lbl.returnFactoryFrequencyAnalysis" /><!--  " 12、返厂频次分析_수리 주기 분석(정비)" --></li>
            <li id="Tab07" ><spring:message code="crm.lbl.oneCarValueOutputAnalysis" /><!--  " 13、单车产值分析_차량 생산액 분석(정비)" --></li>
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
    </div>
</section>
<script type="text/javascript">
    var iframeUrl = new Array();
    iframeUrl[0] = "<c:url value='/crm/rpt/custReport/selectCharacterReport.do'/>"; //86. 客户特征 고객특성
    iframeUrl[1] = "<c:url value='/crm/rpt/custReport/selectCarSalesReport.do'/>"; //77. 增换购 추가교체구매
    iframeUrl[2] = "<c:url value='/crm/rpt/custReport/selectCustHpNoValidReport.do'/>"; //93. 无效客户数量统计表 무효고객수 통계리포트
    iframeUrl[3] = "<c:url value='/crm/rpt/custReport/selectCustCntReport.do'/>"; //客户数量统计고객 수량 통계
    iframeUrl[4] = "<c:url value='/crm/rpt/custReport/selectAttritionRateAnalysisReport.do'/>"; //11.流失率分析_유실율 분석(정비)
    iframeUrl[5] = "<c:url value='/crm/rpt/custReport/selectReturnFactoryFrequencyAnalysisReport.do'/>"; //12、返厂频次分析_수리 주기 분석(정비)
    iframeUrl[6] = "<c:url value='/crm/rpt/custReport/selectOneCarValueOutputAnalysis.do'/>"; //13、单车产值分析_차량 생산액 분석(정비)

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


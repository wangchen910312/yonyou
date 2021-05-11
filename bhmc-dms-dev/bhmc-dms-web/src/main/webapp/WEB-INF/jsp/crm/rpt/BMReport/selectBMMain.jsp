<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section class="group" style="height:500%" >
    <div class="tab_area tab_iframe">
        <ul>
            <li id="Tab01" class="k-state-active"><spring:message code="crm.title.BMownCarReport" /><!--  50. 蓝缤会员-车型入会现况 회원차량  --></li>
            <li id="Tab03" ><spring:message code="crm.lbl.RepairOrderInfo" /><!--14、返厂明细_수리 상세(정비)   --></li>
            <li id="Tab04" ><spring:message code="crm.lbl.RepairOrderSingIn" /><!--  15 返厂入会率 수리 가입율 --></li>
        </ul>
        <!--50.  蓝缤会员-车型入会现况 회원차량 -->
        <div class="mt0">
            <iframe id="iframeTab01" name="iframeTab01" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
        <!-- 14、返厂明细_수리 상세(정비)  -->
        <div class="mt0">
            <iframe id="iframeTab03" name="iframeTab03" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
        <!-- 15 返厂入会率 수리 가입율 -->
        <div class="mt0">
            <iframe id="iframeTab04" name="iframeTab04" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
    </div>
</section>
<script type="text/javascript">
    function reportMainCall(){
        var iframeUrl = "<c:url value='/crm/rpt/BMReport/selectBMOwnCarReport.do' />";
        $("#iframeTab01").attr("src", iframeUrl);
    };

    $(document).ready(function() {
        $(".tab_area").kendoExtTabStrip({
            animation:false
            , select:function(e) {
                var selectTabId = e.item.id;
                var iframeUrl;
                if (selectTabId == "Tab01") {
                    //50. 蓝缤会员-车型入会现况 회원차량
                    iframeUrl = "<c:url value='/crm/rpt/BMReport/selectBMOwnCarReport.do' />";
                }else if (selectTabId == "Tab03") {
                    //14、返厂明细_수리 상세(정비)
//                     iframeUrl = "<c:url value='/crm/rpt/BMReport/selectBMRoReport.do' />";
                    iframeUrl = "<c:url value='/crm/rpt/BMReport/selectRepairOrderInfoReport.do' />";
                }else if (selectTabId == "Tab04") {
                    //15 返厂入会率 수리 가입율
//                     iframeUrl = "<c:url value='/crm/rpt/BMReport/selectBMCouponReport.do' />";
                    iframeUrl = "<c:url value='/crm/rpt/BMReport/selectRepairOrderSingInReport.do' />";
                };
                if($("#iframe"+selectTabId).attr("src") == ""){
                    $("#iframe"+selectTabId).attr("src", iframeUrl);
                };
            }
        });
        reportMainCall();
    });
</script>


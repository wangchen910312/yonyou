<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section class="group" style="height:500%" >
    <div class="tab_area tab_iframe">
        <ul>
            <li id="Tab06" class="k-state-active"><spring:message code="crm.title.membershipGradeReport" /><!-- 28. 会员等级统计报表  회원등급통계보고서 --></li>
            <li id="Tab07"><spring:message code="crm.title.membershipStatsReport" /><!-- 29. 会员统计分析 회원통계분석 --></li>
            <li id="Tab03"><spring:message code="crm.title.membershipPointReport" /><!-- 31. 积分使用情况 포인트 사용현황 --></li>
            <%-- <li id="Tab01"><spring:message code="crm.title.membershipInfoReport" /><!-- 32. 会员信息汇总报表  회원정보현황 리포트 --></li> --%>
            <li id="Tab05"><spring:message code="crm.title.membershipRechargeReport" /><!-- 33. 充值卡使用情况 충전카드 사용현황 --></li>
        </ul>
        <div class="mt0">
            <iframe id="iframeTab06" name="iframeTab06" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
        <div class="mt0">
            <iframe id="iframeTab07" name="iframeTab07" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
        <div class="mt0">
            <iframe id="iframeTab03" name="iframeTab03" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div><!--
        <div class="mt0" >
            <iframe id="iframeTab01" name="iframeTab01" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div> -->
        <div class="mt0">
            <iframe id="iframeTab05" name="iframeTab05" src="" frameborder="0" scrolling="no" width="100%" height="700" class="report"></iframe>
        </div>
    </div>
</section>
<script type="text/javascript">
    function membershipReportMainCall(){
        var iframeUrl = "<c:url value='/crm/rpt/membershipReport/selectMembershipGradeReport.do' />";
        $("#iframeTab06").attr("src", iframeUrl);
    };

    $(document).ready(function() {

        $(".tab_area").kendoExtTabStrip({
            animation:false
            , select:function(e) {
                var selectTabId = e.item.id;
                var iframeUrl;
               /*  if (selectTabId == "Tab01") {
                    iframeUrl = "<c:url value='/crm/rpt/membershipReport/selectMembershipInfoReport.do' />";
               } else */
               if (selectTabId == "Tab03") {
                    iframeUrl = "<c:url value='/crm/rpt/membershipReport/selectMembershipPointHistoryReportQuarter.do' />";
                } else if (selectTabId == "Tab05") {
                    iframeUrl = "<c:url value='/crm/rpt/membershipReport/selectMembershipRechargeReport.do' />";
                } else if (selectTabId == "Tab06") {
                    iframeUrl = "<c:url value='/crm/rpt/membershipReport/selectMembershipGradeReport.do' />";
                } else if (selectTabId == "Tab07") {
                    iframeUrl = "<c:url value='/crm/rpt/membershipReport/selectMembershipStatsReport.do' />";
                };
                if($("#iframe"+selectTabId).attr("src") == ""){
                    $("#iframe"+selectTabId).attr("src", iframeUrl);
                };
            }
        });
        membershipReportMainCall();
    });
</script>
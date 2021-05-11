<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 방치품집계 -->
<div class="fsearch_area">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="par.title.leaveItemReport" /></h1>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-11581" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
        </dms:access>
        </div>
    </div>
</div>
<div class="table_info table_info_v1">
    <form id="frmTotalStatus" method="post">
        <iframe id="iframeSubTotalStatus" src="" frameborder="0" scrolling="no" width="100%" height="650" class="report"></iframe>
    </form>
</div>


<!-- script -->
<script>
var dlrCd  = "${dlrCd}";
    $(document).ready(function() {

        $("#btnSearch").kendoButton({
            click:function(e){
                subTotalStatusCall();
            }
        });

        subTotalStatusCall();

    });

    // 레포트화면 호출
    function subTotalStatusCall(){

        var subTotalStatusUrl = "<c:url value='/ReportServer?reportlet=par/selectLeaveItemReport.cpt' />"
          , param = "";

        param += "&op=view";
        param += "&sDlrCd="+dlrCd;
        $("#iframeSubTotalStatus").attr("src", subTotalStatusUrl + param);
    }
</script>
<!-- //script -->


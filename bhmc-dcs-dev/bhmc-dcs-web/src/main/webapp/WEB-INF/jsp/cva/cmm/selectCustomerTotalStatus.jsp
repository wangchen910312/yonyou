<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<%--
    JSP Name:selectTargetDcptRptMain.jsp
    Description:고객전체현황
    author Yoon Se Ran
    since selectCustomerTotalStatus.jsp
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2016. 11. 27   Yoon Se Ran              최초 생성
--%>

<form method="post" name="frmMainStatus" id="frmMainStatus">
    <div class="table_info table_info_v1">
    <iframe id="iframeCustomerTotalStatusRptMain" name="iframeCustomerTotalStatusRptMain" src="" frameborder="0" scrolling="no" width="100%" height="1150"></iframe>
    </div>
</form>


<script type="text/javascript">

    $(document).ready(function() {
        var scr_id              = "${pCallMenu}";
        //var locale = "<%=request.getLocale() %>";
        var locale = "${lang}";
        if (locale == "")   locale = "<%=request.getLocale() %>";
        var lo = locale.substring(0,2);

        //alert(lo);

        var mainStatusUrl = "<c:url value='/ReportServer?reportlet=cva/" + scr_id + ".cpt&locale=" + lo + "'/>";
        $("#iframeCustomerTotalStatusRptMain").attr("src", mainStatusUrl);
    });
</script>

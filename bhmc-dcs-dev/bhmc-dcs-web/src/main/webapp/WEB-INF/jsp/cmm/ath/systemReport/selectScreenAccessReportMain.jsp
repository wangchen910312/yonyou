<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<%--
    JSP Name : selectScreenAccessReportMain.jsp
    Description:메뉴 접속 통계
    author Choi Kyung Yong
    since selectScreenAccessReportMain.jsp
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2017. 4. 24   Choi Kyung Yong           최초 생성
--%>

<form method="post" name="frmMainStatus" id="frmMainStatus">
    <div class="table_info table_info_v1">
    <iframe id="iframeSelectScreenAccessReportMain" name="iframeSelectScreenAccessReportMain" src="" frameborder="0" scrolling="no" width="100%" height="1150"></iframe>
    </div>
</form>

<script type="text/javascript">

    $(document).ready(function() {
        //var locale = "<%=request.getLocale() %>";
        var locale = "${lang}";
        if (locale == "")   locale = "<%=request.getLocale() %>";
        var lo = locale.substring(0,2);

        var mainStatusUrl = "<c:url value='/ReportServer?reportlet=cmm/systemReport/selectScreenAccessMain.cpt&locale=" + lo + "'/>";
        $("#iframeSelectScreenAccessReportMain").attr("src", mainStatusUrl);
    });
</script>

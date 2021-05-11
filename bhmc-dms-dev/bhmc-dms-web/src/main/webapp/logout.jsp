<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String logoutSuccessUrl = request.getParameter("logoutSuccessUrl");
    if(logoutSuccessUrl == null){
        logoutSuccessUrl = "/cmm/ath/login/selectLoginMain.do";
    }
%>
<script type="text/javascript">var _contextPath = "${pageContext.request.contextPath}";</script>
<script type="text/javascript">
    if(window.parent) {
        window.parent.location.href = _contextPath + "<%=logoutSuccessUrl%>";
    }else if(window.opener) {
        window.opener.location.href = _contextPath + "<%=logoutSuccessUrl%>";
    }else {
        window.location.href = _contextPath + "<%=logoutSuccessUrl%>";
    }
</script>

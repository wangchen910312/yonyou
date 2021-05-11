<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.context.i18n.LocaleContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<c:set var="springLocale" scope="session" value="<%=LocaleContextHolder.getLocale().getLanguage()%>" />
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BHMC-DMS</title>
<%@ include file="defaultMobInclude.jsp" %>
</head>
<body style="background-color: #e9ecef;">
<div id="loadingScreen"style="position: fixed; left: 0; top:0; width: 100%; z-index: 99999 !important ;"></div>
<header id="header">
<%@ include file="headerMobInclude.jsp" %>
</header>
<div id="impoartPage">
    <c:import url="${_urlBaseJsp}"/>
</div>
</body>
<script type="text/javascript">
$(document).ready(function (){
 // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if($("#content_list").css("display") == "block") { window.history.back(); }
        else if($("#content_search").css("display") == "block") { contentListNonRefresh();}
        else if($("#content_detail").css("display") == "block") { contentListNonRefresh();}
    });
});
//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");
}

</script>
</html>
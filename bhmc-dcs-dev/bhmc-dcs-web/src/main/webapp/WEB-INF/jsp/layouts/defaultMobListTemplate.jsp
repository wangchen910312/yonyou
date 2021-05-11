<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.context.i18n.LocaleContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="springLocale" scope="session" value="<%=LocaleContextHolder.getLocale().getLanguage()%>" />
<!DOCTYPE html>
<html lang="${springLocale}">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title><tiles:insertAttribute name="title" /></title>

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mob/kendo.mobile.all.min.css"/>">

<%--
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.common.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.rtl.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.default.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.dataviz.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.dataviz.default.min.css"/>">
 --%>

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mob/mdms.css"/>">

<script type="text/javascript" src="<c:url value="/resources/js/mob/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bxslider/jquery.bxslider.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/kendo/kendo.all.min.js"/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/kendo/cultures/kendo.culture.${springLocale}.min.js' />"></script>
<!--[if lt IE 9]>
    <script src="<c:url value="/resources/js/html5shiv.js"/>"></script>
<![endif]-->

<%-- 자바스크립트 전역변수:컨텍스트 경로 --%>
<script type="text/javascript">var _contextPath = "${pageContext.request.contextPath}";</script>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.common-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/cmm/sci/js/selectCultureSettings.do' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/kendo.ui.ext-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/jquery.ext-1.0.js' />"></script>
<script type="text/javascript">
    kendo.culture("${springLocale}");
    var strY = '<spring:message code="mobile.lbl.year" />';
    var strM = '<spring:message code="mobile.lbl.month" />';
    var strPm = '<spring:message code="mobile.lbl.pm" />';
    var strAm = '<spring:message code="mobile.lbl.am" />';
    var strHour = '<spring:message code="mobile.lbl.hour" />';
    var strMinute = '<spring:message code="mobile.lbl.minute" />';
    var strSecond = '<spring:message code="mobile.lbl.second" />';
    var noDatamsg = '<spring:message code="mob.info.noSearchDataMsg" />';

    var confirmMsgDel = "<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.cnfrmMsg' arguments='${del},' />";//삭제하시겟습니까?
    var confirmMsgSave = "<spring:message code='cmm.info.saveYn'/>";//저장 하시겠습니까??
    var confirmMsgUpdate = "<spring:message code='cmm.info.updtYn'/>";//수정 하시겠습니까??

    var y = "<spring:message code='global.lbl.yes'/>";
    var n = "<spring:message code='global.lbl.n'/>";
</script>
<script type="text/javascript" src="<c:url value="/resources/js/mob/mobListCommon.js"/>"></script>
</head>

<body class="iframeBody">

<tiles:insertAttribute name="body" />

<script type="text/javascript">
/**
 * 조회 영역[AREA]에서 엔터키 입력시 이벤트 처리
 * ex)<div class="table_form" role="search" data-btnid="btnSearch"></div>
 */
 $(".table_form[role=search]").keyup(function(e) {    	 
     var btnid = $(this).attr("data-btnid");
     if (e.keyCode == 13 && btnid) {
    	 setTimeout(function(){
    		 $("#"+btnid).click();
    	 });             
     }
 });



$(document).ready(function() {

    parent.mob.loading.hide();
});



</script>
</body>
</html>
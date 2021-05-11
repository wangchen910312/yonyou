<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.context.i18n.LocaleContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<c:set var="springLocale" scope="session" value="<%=LocaleContextHolder.getLocale().getLanguage()%>" />
<!DOCTYPE html>
<html lang="${springLocale}">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no"> -->
<meta name="format-detection" content="telephone=no">
<title></title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.common.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.rtl.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.default.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.dataviz.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.dataviz.default.min.css"/>">

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
<dms:isTablet>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mob/kendo.mobile.all.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/tablet.css"/>">
</dms:isTablet>

<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
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
<script type="text/javascript" src="<c:url value='/resources/js/dms/jquery.xml2json.js' />"></script>
<script type="text/javascript">
kendo.culture("${springLocale}");
</script>
</head>

<body>

<div>
    <button id="showLodingFullScreen">전체로딩보이기</button>
    <button id="showLodingSectionScreen">부분로딩보이기</button>
    <button id="hideLodingSectionScreen">부분로딩감추기</button>
</div>

<div id="section"style="height:300px;border:1px solid #FF0000">
부분영역
</div>

<script type="text/javascript">
$(document).ready(function() {
    // 전체로딩보이기
    $("#showLodingFullScreen").kendoButton({
        click:function(e) {
            dms.loading.show();
        }
    });

    // 부분로딩보이기
    $("#showLodingSectionScreen").kendoButton({
        click:function(e) {
            dms.loading.show($("#section"));
        }
    });

    // 부분로딩보이기
    $("#hideLodingSectionScreen").kendoButton({
        click:function(e) {
            dms.loading.hide($("#section"));
        }
    });
});
</script>
<div>
    <button>테스트</button>
</div>

</body>
</html>

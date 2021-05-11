<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no"> -->
<meta name="format-detection" content="telephone=no">
<title><tiles:insertAttribute name="title" /></title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.common.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.rtl.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.default.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.dataviz.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.dataviz.default.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
<link rel="stylesheet" href="<c:url value='${theme}' />" type="text/css" />
<dms:isTablet>
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mob/kendo.mobile.all.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/tablet.css"/>">
</dms:isTablet>

<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/kendo/kendo.all.min.js"/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/kendo/cultures/kendo.culture.${springLocale}.min.js' />"></script>
<%-- <dms:isTablet>
<script type="text/javascript" src="<c:url value="/resources/js/mob/jquery.mobile-1.4.5.min.js"/>"></script>
</dms:isTablet> --%>
<!--[if lt IE 9]>
    <script src="<c:url value="/resources/js/html5shiv.js"/>"></script>
<![endif]-->


<script type="text/javascript">var _contextPath = "${pageContext.request.contextPath}";</script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.common-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/cmm/sci/js/selectCultureSettings.do' />"></script>

<dms:isNormal>
<script type="text/javascript" src="<c:url value='/resources/js/dms/kendo.ui.ext-1.0.js' />"></script>
</dms:isNormal>

<dms:isTablet>
<script type="text/javascript" src="<c:url value='/resources/js/dms/kendo.ui.ext-tablet-1.0.js' />"></script>
</dms:isTablet>

<script type="text/javascript" src="<c:url value='/resources/js/dms/jquery.ext-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/jquery.xml2json.js' />"></script>
<script type="text/javascript">
kendo.culture("${springLocale}");
</script>

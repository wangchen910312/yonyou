<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<c:url value='/ReportServer?op=emb&resource=finereport.js' />"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/ReportServer?op=emb&resource=finereport.css'/>" />
</head>
<body>
<script type="text/javascript">
function doPrint(url, isPopUp, isAutoZoom){
    parent.dms.loading.show();

    if(FR.Browser.isIE()){
        FR.doURLPDFPrint(url, isPopUp);
        setTimeout("parent.dms.loading.hide()", 10000);
    }else{
        var config = {url:url, isPopUp:isPopUp, isAutoZoom:isAutoZoom};
        FR.doURLFlashPrint(config);
//      FR.doURLFlashPrint(url, isPopUp);
        setTimeout("parent.dms.loading.hide()", 6000);
    }
}
</script>
</body>
</html>
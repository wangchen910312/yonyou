<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>BHMC-DMS</title>
<script type="text/javascript">
if(window.opener) {
    window.self.close();
    window.opener.location.href = "<c:url value="${logoutSuccessUrl}" />";
}else{
    window.top.location.href = "<c:url value="${logoutSuccessUrl}" />";
}
</script>
</head>
<body>
</body>
</html>







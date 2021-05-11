<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%-- 
    JSP Name:jspName.jsp
    Description:설명을 기술합니다.
    author Kang Seok Han
    since 2015. 12. 30.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2015. 12. 30.     Kang Seok Han     최초 생성 
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javaScript" language="javascript">

</script>
</head>
<body>
<div>en</div>
<c:forEach var="obj" items="${msgEnList}">
    <div>${obj.key}:${obj.value}</div>
</c:forEach>


<div>ko</div>
<c:forEach var="obj" items="${msgKoList}">
    <div>${obj.key}:${obj.value}</div>
</c:forEach>


<div>tables</div>
<c:forEach var="obj" items="${tableList}">
    <div>${obj.tname}</div>
</c:forEach>

</body>
</html>
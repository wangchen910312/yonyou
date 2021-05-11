<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.parentCont {
    display: flex;
    height: 680px; /* Or whatever */
}

.childCont {
    width: 438px;  /* Or whatever */
    height: 79px; /* Or whatever */
    margin: auto;  /* Magic! */
}
</style>
<div id="parentCont" class="parentCont">
    <img class="childCont" src="<c:url value='/resources/img/logo_login.png' />"/>
</div>

<script type="text/javascript">
$(document).ready(function() {
    var windowHeight = $(window).innerHeight();
    $("#parentCont").height(windowHeight-100);
});
</script>
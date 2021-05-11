<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- login -->
<div class="login_wrap">
    <section class="login">
        <h1><spring:message code='global.title.dmsFullTitle' /><!-- 北京现代 Dealer Management System  --></h1>
        <div class="login_box">

            <span>접근권한이 없습니다.</span>
            <span><a href="<c:url value='/bhmc-dms-web/index.jsp' />">메인페이지</a></span>




        </div>
    </section>
</div>








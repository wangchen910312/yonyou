<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

    <!-- content -->
    <section id="content">
        <!-- ready box -->
        <div class="readybox">
            <p><spring:message code="global.info.ready" /></p>
            <span id="btnPrev" class="btn_readyback"><span></span><spring:message code="global.info.goback" /></span>
        </div>
    </section>

<script>

$(document).ready(function() {

    var winHeight = $(window).height();
    $(".readybox").height(winHeight - 70);


    $("#btnPrev").click(function(){
        history.go(-1);
    });

});


//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}


</script>
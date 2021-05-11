<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 영수증 스캔 -->
<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnClose" class="btn_m"><spring:message code="global.btn.close" /></button> <!-- 닫기 -->
        </div>
    </div>

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_100per">
    </div>
    <!-- 조회 조건 종료 -->

</section>
<!-- //영수증 스캔 팝업 -->

<!-- script -->
<script>

$(document).ready(function() {

    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;

    // 닫기 버튼.
    $("#btnClose").kendoButton({
        click:function(e){
            var data = [];
            options.callbackFunc(data);
        }
    });

});
</script>
<!-- //script -->
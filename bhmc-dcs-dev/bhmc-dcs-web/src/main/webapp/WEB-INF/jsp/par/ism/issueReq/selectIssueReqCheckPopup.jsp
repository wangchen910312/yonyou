<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 구매요청 버튼 메시지 팝업 -->
    <section id="window" class="pop_wrap">
        <div class="msg_box">
            <p><spring:message code="par.info.issueReqCheckMsg" /><!-- 재고가 부족합니다.구매요청 하시겠습니까? --></p>
        </div>
        <div class="btn_bottom">
            <button class="btn_m" id="btnOk"><spring:message code="par.btn.orderReq" /><!-- 구매요청 --></button>
            <button class="btn_m" id="btnCancel"><spring:message code="par.btn.cancel" /><!-- 취소 --></button>
        </div>
    </section>
    <!-- // 구매요청 버튼 메시지 팝업 -->

<!-- script -->
<script>
$(document).ready(function() {

    /************************************************************
        팝업옵션 설정
    *************************************************************/
    /**
    * 팝업 옵션
    */
    var options = parent.issueReqPopupButtonWindow.options.content.data;

    // 확인 버튼.
    $("#btnOk").kendoButton({
        click:function(e){
            options.callbackFunc({ flag:"Y"});
            parent.issueReqPopupButtonWindow.close();
        }
    });

    $("#btnCancel").kendoButton({
        click:function(e){
            parent.issueReqPopupButtonWindow.close();
        }
    });

});
</script>
<!-- //script -->
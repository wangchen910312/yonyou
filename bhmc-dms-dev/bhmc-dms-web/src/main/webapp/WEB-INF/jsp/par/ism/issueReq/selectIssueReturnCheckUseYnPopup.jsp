<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- returnId popup -->
    <div id="window" class="pop_wrap msgDiv">
        <div class="msgBox" role="search" data-btnid="btnSearch">
            <center><spring:message code="par.info.returnPartsUseYnMsg" /></center>
        </div>
        <div class="btn_bottom">
            <button class="btn_m" id="btnOk"><spring:message code="par.btn.yes" /><!-- btnOk --></button>
            <button class="btn_m" id="btnCancel"><spring:message code="par.btn.cancel" /><!-- btnCancel --></button>
        </div>
    </div>
    <!-- returnId popup -->
<!-- script -->
<script>
$(document).ready(function() {

    /************************************************************
        팝업옵션 설정
    *************************************************************/
    /**
    * 팝업 옵션
    */
    var options = parent.issueReturnCheckUseYnPopupButtonWindow.options.content.data;

    //확인 버튼.
    $("#btnOk").kendoButton({
        click:function(e){

            options.callbackFunc({ flag:"Y"});
            parent.issueReturnCheckUseYnPopupButtonWindow.close();
        }
    });
    //취소버튼
    $("#btnCancel").kendoButton({
        click:function(e){
            parent.issueReturnCheckUseYnPopupButtonWindow.close();
        }
    });

});
</script>
<!-- //script -->
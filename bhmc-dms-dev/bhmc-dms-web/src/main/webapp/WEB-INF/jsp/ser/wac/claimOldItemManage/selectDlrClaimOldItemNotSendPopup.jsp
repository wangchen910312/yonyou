<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <form id="olditemForm" name="olditemForm">
    <div class="table_form mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:30%;">
                <col style="width:70%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.notSendCauseCont" /><!-- 취소상세 --></th>
                    <td>
                        <textarea rows="5" id="notSendCauseCont" name="notSendCauseCont" class="form_textarea"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    </form>
    <div class="header_area">
        <div class="btn_bottom">
            <button type="button" id="btnCreate" class="btn_m btn_create"><spring:message code="global.btn.confirm" /></button>
            <button type="button" id="btnCancel" class="btn_m btn_cancel"><spring:message code="global.btn.cancel" /></button>
        </div>
    </div>
    <!-- 조회 조건 종료 -->
</section>

<script>

$(document).ready(function() {

    /**
     * 팝업 옵션
     */
    var parentData = parent.notSendOlditemPopup.options.content.data;

    // 저장
    $("#btnCreate").kendoButton({
        click:function(e) {

            if ( dms.string.isEmpty($("#notSendCauseCont").val())) {
                dms.notification.warning("<spring:message code='ser.lbl.notSendCauseCont' var='notSendCauseCont' /><spring:message code='global.info.required.field' arguments='${notSendCauseCont}' />");
                $("#notSendCauseCont").focus();
                return false;
            }

            var params = {notSendCauseCont : $("#notSendCauseCont").val()};

            parent.notSendOlditemPopup.close();
            parentData.callbackFunc(params);
            /*
            var formParam = $("#olditemForm").serializeObject();

            $.ajax({
                url:"<c:url value='/ser/ro/preCheck/updatePreCheck.do' />"
                ,data:JSON.stringify(formParam)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){
                    parent.notSendOlditemPopup.close();
                    parentData.callbackFunc();
                }
            }); */
        }
    });

});
</script>
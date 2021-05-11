<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- receiveId popup -->
    <section id="window" class="pop_wrap">
        <div class="table_form mt10" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:22%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.receiveNm" /><!-- receiveNm --></th>
                    <td class="required_area">
                        <input id="sReceiveNm" name="sReceiveNm" class="form_input" value="" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
        <div class="btn_bottom">
            <button class="btn_m" id="btnOk"><spring:message code="par.btn.yes" /><!-- btnOk --></button>
            <button class="btn_m" id="btnCancel"><spring:message code="par.btn.no" /><!-- btnCancel --></button>
        </div>
    </section>
    <!-- receiveId popup -->
<!-- script -->
<script>
$(document).ready(function() {

    /************************************************************
        팝업옵션 설정
    *************************************************************/
    /**
    * 팝업 옵션
    */
    var options = parent.issueReceivePopupButtonWindow.options.content.data;

    // 확인 버튼.
    $("#btnOk").kendoButton({
        click:function(e){

            if($("#sReceiveNm").val() === ""){
                // 수령인는 필수 입력사항입니다.
                dms.notification.info("<spring:message code='par.lbl.receiveNm' var='receiveNm' /><spring:message code='global.info.required.field' arguments='${receiveNm}' />");
                $("#sReceiveNm").focus();

                return false;
            }

            options.callbackFunc({ flag:"Y", receiveNm:$("#sReceiveNm").val()});
            parent.issueReceivePopupButtonWindow.close();
        }
    });

    $("#btnCancel").kendoButton({
        click:function(e){
            parent.issueReceivePopupButtonWindow.close();
        }
    });

});
</script>
<!-- //script -->
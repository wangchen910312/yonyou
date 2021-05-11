<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- returnId popup -->
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
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.returner" /><!-- returner --></th>
                    <td class="required_area">
                        <input id="sReturnerNm" name="sReturnerNm" class="form_input" value="" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
        <div class="btn_bottom">
            <button class="btn_m" id="btnOk"><spring:message code="par.btn.yes" /><!-- btnOk --></button>
            <button class="btn_m" id="btnCancel"><spring:message code="par.btn.cancel" /><!-- btnCancel --></button>
        </div>
    </section>
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
    var options = parent.issueReturnPopupButtonWindow.options.content.data;

    // 확인 버튼.
    $("#btnOk").kendoButton({
        click:function(e){

            if($("#sReturnerNm").val() === ""){
                // 반환인는 필수 입력사항입니다.
                dms.notification.info("<spring:message code='par.lbl.returner' var='returner' /><spring:message code='global.info.required.field' arguments='${returner}' />");
                $("#sReturnerNm").focus();

                return false;
            }

            options.callbackFunc({ flag:"Y", returnNm:$("#sReturnerNm").val()});
            parent.issueReturnPopupButtonWindow.close();
        }
    });

    $("#btnCancel").kendoButton({
        click:function(e){
            parent.issueReturnPopupButtonWindow.close();
        }
    });

});
</script>
<!-- //script -->
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button type="button" id="btnConfirm" class="btn_m btn_create"><spring:message code="ser.btn.confirm" /></button>
        </div>
    </div>
    <div class="msg_box" id="messageId"><spring:message code="ser.lbl.resvAlramAutoSendYn" /></div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:28%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"></th>
                    <td>
                        <label class="label_check ml5"><input id="alramSetRadio" name="alramSetRadio" type="radio" class="form_check" value="A" checked /> <spring:message code="global.lbl.yes" /></label>
                        <label class="label_check ml5"><input id="alramSetRadio" name="alramSetRadio" type="radio" class="form_check" value="M" /> <spring:message code="global.lbl.n" /></label>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>

<script>

$(document).ready(function() {

    /**
     * 팝업 옵션
     */
    var options = parent.serAlramPopup.options.content.data;

    // 인쇄
    $("#btnConfirm").kendoButton({
        click:function(e) {
            var alramType = $("input:radio[name='alramSetRadio']:checked").val();
            parent.serAlramPopup.close();
            options.callbackFunc(alramType);
        }
    });
});
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button type="button" id="btnPrint" class="btn_m btn_create"><spring:message code="global.btn.print" /></button>
        </div>
    </div>

    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:23%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"></th>
                    <td>
                        <label class="label_check ml5"><input id="dlvCancelRadio" name="dlvCancelRadio" type="radio" class="form_check" value="est" checked /> <spring:message code="ser.lbl.estimateDoc" /></label>
                        <label class="label_check ml5"><input id="dlvCancelRadio" name="dlvCancelRadio" type="radio" class="form_check" value="cal" /> <spring:message code="ser.lbl.calculateDoc" /></label>
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
    var options = parent.estPrintPopup.options.content.data;

    // 인쇄
    $("#btnPrint").kendoButton({
        click:function(e) {
            var cancelType = $("input:radio[name='dlvCancelRadio']:checked").val();
            parent.estPrintPopup.close();
            options.callbackFunc(cancelType);
        }
    });
});
</script>
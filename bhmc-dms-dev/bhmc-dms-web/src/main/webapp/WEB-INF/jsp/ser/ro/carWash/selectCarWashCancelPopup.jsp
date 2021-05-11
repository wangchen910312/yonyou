<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button type="button" id="btnCreate" class="btn_m btn_create"><spring:message code="global.btn.create" /></button>
        </div>
    </div>

    <form id="carWashCancelForm" name="resvCancelForm">
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:30%;">
                <col style="width:70%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.cancReasonCd" /></span><!-- 취소사유 --></th>
                    <td class="required_area">
                        <input id="carWashCancReasonCd" name="carWashCancReasonCd" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.cancReasonDetlCont" /><!-- 취소상세 --></th>
                    <td>
                        <textarea rows="5" id="carWashCancReasonCont" name="carWashCancReasonCont" class="form_textarea"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    </form>
    <!-- 조회 조건 종료 -->
</section>

<script>

//공통코드:세차취소구분
var carWashCancCdList = [];
<c:forEach var="obj" items="${carWashCancCdList}">
carWashCancCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

$(document).ready(function() {

    /**
     * 팝업 옵션
     */
    var options = parent.carWashCancelPopup.options.content.data;

    // 예약취소구분
    $("#carWashCancReasonCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carWashCancCdList
        ,optionLabel:"<spring:message code='global.btn.select' />"
    });

    // 저장
    $("#btnCreate").kendoButton({
        click:function(e) {

            if ( dms.string.isEmpty($("#carWashCancReasonCd").val())) {
                dms.notification.warning("<spring:message code='ser.lbl.cancReasonCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#carWashCancReasonCd").focus();
                return false;
            }

            var data = {
                    "carWashCancReasonCd":$("#carWashCancReasonCd").data("kendoExtDropDownList").value()
                    ,"carWashCancReasonCont":$("#carWashCancReasonCont").val()
            }
            parent.carWashCancelPopup.close();
            options.callbackFunc(data);
        }
    });

});
</script>
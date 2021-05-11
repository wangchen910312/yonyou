<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.lbl.estCancel" /><!-- 견적취소 --></h1>
        <div class="btn_right">
            <button type="button" id="btnCreate" class="btn_m btn_create"><spring:message code="global.btn.create" /></button>
        </div>
    </div>

    <form id="estCancelForm" name="estCancelForm">
    <input type="hidden" id="estStatCd" name="estStatCd" value="C">
    <input type="hidden" id="estDocNo" name="estDocNo">
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
                        <input id="estCancReasonCd" name="estCancReasonCd" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.cancReasonDetlCont" /><!-- 취소상세 --></th>
                    <td>
                        <textarea rows="5" id="estCancReasonCont" name="estCancReasonCont" class="form_textarea"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    </form>
    <!-- 조회 조건 종료 -->
</section>

<script>

//공통코드:정산취소구분 (SER025)
var estCancCdList = [];
<c:forEach var="obj" items="${estCancelList}">
estCancCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

$(document).ready(function() {

    /**
     * 팝업 옵션
     */
    var parendData = parent.estCancelPopup.options.content.data;
    $("#estDocNo").val(parendData.estDocNo);

    // 예약취소구분
    $("#estCancReasonCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:estCancCdList
        ,optionLabel:"<spring:message code='global.btn.select' />"
    });

    // 저장
    $("#btnCreate").kendoButton({
        click:function(e) {

            if ( dms.string.isEmpty($("#estCancReasonCd").val())) {
                dms.notification.warning("<spring:message code='ser.lbl.cancReasonCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#estCancReasonCd").focus();
                return false;
            }

            var formParam = $("#estCancelForm").serializeObject();
            parendData.callbackFunc(formParam);
            parent.estCancelPopup.close();
             
        }
    });

});
</script>
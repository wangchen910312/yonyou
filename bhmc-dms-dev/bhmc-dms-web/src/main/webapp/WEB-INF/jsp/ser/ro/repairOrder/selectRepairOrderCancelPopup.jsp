<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.lbl.roCancel" /><!-- 예약취소 --></h1>
        <div class="btn_right">
            <button type="button" id="btnCreate" class="btn_m btn_create"><spring:message code="global.btn.create" /></button>
            <%-- <button type="button" id="btnCancel" class="btn_m btn_cancel"><spring:message code="global.btn.cancel" /></button> --%>
        </div>
    </div>

    <form id="roCancelForm" name="form">
    <input type="hidden" id="roStatCd" name="roStatCd" value="06">
    <input type="hidden" id="roDocNo" name="roDocNo">
    <input type="hidden" id="diagDocNo" name="diagDocNo">
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
                        <input id="cancReasonCd" name="cancReasonCd" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.cancReasonDetlCont" /><!-- 취소상세 --></th>
                    <td>
                        <textarea rows="5" id="cancReasonCont" name="cancReasonCont" class="form_textarea"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    </form>
    <!-- 조회 조건 종료 -->
</section>

<script>

//공통코드:RO취소구분
var roCancCdList = [];
<c:forEach var="obj" items="${roCancCdList}">
roCancCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

$(document).ready(function() {

    /**
     * 팝업 옵션
     */
    var options = parent.roCancelPopup.options.content.data;
    $("#roDocNo").val(options.roDocNo);
    $("#diagDocNo").val(options.diagDocNo);

    // 예약취소구분
    $("#cancReasonCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roCancCdList
        ,optionLabel:"<spring:message code='global.btn.select' />"
    });

    // 저장
    $("#btnCreate").kendoButton({
        click:function(e) {

            if ( dms.string.isEmpty($("#cancReasonCd").val())) {
                dms.notification.warning("<spring:message code='ser.lbl.cancReasonCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#cancReasonCd").focus();
                return false;
            }

            var formParam = $("#roCancelForm").serializeObject();

            $.ajax({
                url:"<c:url value='/ser/ro/repairOrder/updateRepairOrder.do' />"
                ,data:JSON.stringify(formParam)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){
                    options.callbackFunc();
                    parent.roCancelPopup.close();

                }
            });
        }
    });

/*     // 닫기 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){
            parent.roCancelPopup.close();
        }
    });
 */
});
</script>
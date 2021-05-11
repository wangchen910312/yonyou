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

    <form id="resvCancelForm" name="resvCancelForm">
    <input type="hidden" id="parResvStatCd" name="parResvStatCd" value="C">
    <input type="hidden" id="parResvDocNo" name="parResvDocNo">
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

//공통코드:예약취소구분
var resvCancCdList = [];
<c:forEach var="obj" items="${resvCancCdList}">
resvCancCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

$(document).ready(function() {

    /**
     * 팝업 옵션
     */
    var options = parent.resvCancelPopup.options.content.data;
    $("#parResvDocNo").val(options.parResvDocNo);

    // 예약취소구분
    $("#cancReasonCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:resvCancCdList
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

            var formParam = $("#resvCancelForm").serializeObject();

            $.ajax({
                url:"<c:url value='/ser/rev/partReservation/updatePartReservationReceipt.do' />"
                ,data:JSON.stringify(formParam)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){
                    parent.resvCancelPopup.close();
                    options.callbackFunc();
                }
            });



        }
    });
});
</script>
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

    <form id="calcCancelForm" name="calcCancelForm">
    <input type="hidden" id="calcStatCd" name="calcStatCd" value="07">
    <input type="hidden" id="calcDocNo" name="calcDocNo">
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:30%;">
                <col style="width:70%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.calcCancReasonCd" /></span><!-- 취소사유 --></th>
                    <td class="required_area">
                        <input id="calcCancReasonCd" name="calcCancReasonCd" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.calcCancReasonDetlCont" /><!-- 취소상세 --></th>
                    <td>
                        <textarea rows="5" id="calcCancReasonCont" name="calcCancReasonCont" class="form_textarea"></textarea>
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
var calcCancCdList = [];
<c:forEach var="obj" items="${calcCancCdList}">
calcCancCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

$(document).ready(function() {

    /**
     * 팝업 옵션
     */
    var parendData = parent.calcCancelPopup.options.content.data;
    $("#calcDocNo").val(parendData.calcDocNo);

    // 예약취소구분
    $("#calcCancReasonCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:calcCancCdList
        ,optionLabel:"<spring:message code='global.btn.select' />"
        ,height:100
    });

    // 저장
    $("#btnCreate").kendoButton({
        click:function(e) {

            if ( dms.string.isEmpty($("#calcCancReasonCd").val())) {
                dms.notification.warning("<spring:message code='ser.lbl.cancReasonCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#preChkCancReasonCd").focus();
                return false;
            }

            var formParam = $("#calcCancelForm").serializeObject();
            parendData.callbackFunc(formParam);
            parent.calcCancelPopup.close();

            /*
            $.ajax({
                url:"<c:url value='/ser/cal/calculate/multiCalculateCancel.do' />"
                ,data:JSON.stringify(formParam)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){
                    parent.calcCancelPopup.close();
                    parendData.callbackFunc();
                }
            });
            */
        }
    });

});
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.lbl.preInsCanc" /><!-- 사전점검취소 --></h1>
        <div class="btn_right">
            <button type="button" id="btnCreate" class="btn_m btn_create"><spring:message code="global.btn.create" /></button>
        </div>
    </div>

    <form id="preChkCancelForm" name="preChkCancelForm">
    <input type="hidden" id="diagStatCd" name="diagStatCd" value="C">
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
                        <input id="preChkCancReasonCd" name="preChkCancReasonCd" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.cancReasonDetlCont" /><!-- 취소상세 --></th>
                    <td>
                        <textarea rows="5" id="preChkCancReasonCont" name="preChkCancReasonCont" class="form_textarea"></textarea>
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
var preChkCancCdList = [];
<c:forEach var="obj" items="${preChkCancCdList}">
preChkCancCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

$(document).ready(function() {

    /**
     * 팝업 옵션
     */
    var options = parent.preChkCancelPopup.options.content.data;
    $("#diagDocNo").val(options.diagDocNo);

    // 예약취소구분
    $("#preChkCancReasonCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:preChkCancCdList
        ,optionLabel:"<spring:message code='global.btn.select' />"
        ,height:100
    });

    // 저장
    $("#btnCreate").kendoButton({
        click:function(e) {

            if ( dms.string.isEmpty($("#preChkCancReasonCd").val())) {
                dms.notification.warning("<spring:message code='ser.lbl.cancReasonCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#preChkCancReasonCd").focus();
                return false;
            }

            var formParam = $("#preChkCancelForm").serializeObject();

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
                    parent.preChkCancelPopup.close();
                    options.callbackFunc();
                }
            });
        }
    });

});
</script>
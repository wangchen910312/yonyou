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

    <form id="roCancelForm" name="form">
    <input type="hidden" id="roDocNo" name="roDocNo" data-json-obj="true">
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:23%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"></th> <!-- 개인정보활용동의서 -->
                    <td>
                        <label class="label_check ml5"><input id="dlvCancelRadio" name="dlvCancelRadio" type="radio" class="form_check" value="01" checked /> <spring:message code="ser.btn.deliveryCancel" /></label>
                        <label class="label_check ml5"><input id="dlvCancelRadio" name="dlvCancelRadio" type="radio" class="form_check" value="02" /> <spring:message code="ser.btn.roCancel" /></label>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.cancReasonCd" /><!-- 취소상세 --></th>
                    <td>
                        <textarea rows="5" id="cancReasonCont" name="cancReasonCont" class="form_textarea" data-json-obj="true"></textarea>
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
    var options = parent.dlvCancelPopup.options.content.data;
    $("#roDocNo").val(options.roDocNo);

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

            var formParam = $("#roCancelForm").serializeObject($("#roCancelForm").serializeArrayInSelector("[data-json-obj='true']"));
            var cancelType = $("input:radio[name='dlvCancelRadio']:checked").val();

            formParam.roDocNo = $("#roDocNo").val();
            if(cancelType == "01") {
                formParam.dlStatCd = "01";
                formParam.roStatCd = "02";
                formParam.cancelType = cancelType;
            } else {
                formParam.roStatCd = "01";
                formParam.dlStatCd = "01";
                formParam.wrkStatCd = "01";
                formParam.allocStatCd = "01";
                formParam.qtTestStatCd = "Q5";
                formParam.carWashStatCd = "W4";
                formParam.cancelType = cancelType;
            }

            $.ajax({
                url:"<c:url value='/ser/ro/repairOrder/updateDelivery.do' />"
                ,data:JSON.stringify(formParam)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){
                    options.callbackFunc();
                    parent.dlvCancelPopup.close();
                }
            });
        }
    });
});
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.lbl.vsitSer" /><!-- 방문서비스 --></h1>
        <div class="btn_right">
            <button type="button" id="btnCreate" class="btn_s btn_Insert btn_s_min5"><spring:message code="global.btn.create" /></button>
            <button type="button" id="btnCancel" class="btn_s btn_Cancel btn_s_min5"><spring:message code="global.btn.cancel" /></button>
        </div>
    </div>

    <form id="form" name="form" method="POST">
    <input type="hidden" id="resvDocNo" name="resvDocNo">
    <div class="table_form form_width_100per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.vsitCarReceiveDt" /><!-- 방문차량수령시간 --></th>
                    <td>
                        <input id="vsitCarReceiveDt" name="vsitCarReceiveDt" class="form_datetimepicker" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.vsitCarReceiveIfNm" /><!-- 차량수령연계인 --></th>
                    <td>
                        <input type="text" id="vsitCarReceiveIfNm" name="vsitCarReceiveIfNm" class="form_input" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.vsitCarReceiveCinoNo" /><!-- 차량수령연락처 --></th>
                    <td>
                        <input type="text" id="vsitCarReceiveCinoNo" name="vsitCarReceiveCinoNo" class="form_input" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.receivePrsnNm" /><!-- 수령담당자 --></th>
                    <td>
                        <input type="text" id="receivePrsnNm" name="receivePrsnNm" class="form_input" data-json-obj="true">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.vsitCarReceiveAddrNm" /><!-- 차량수령주소 --></th>
                    <td colspan="7">
                        <input type="text" id="vsitCarReceiveAddrNm" name="vsitCarReceiveAddrNm" class="form_input" data-json-obj="true">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.receiveMoveDt" /><!-- 수령출동시간 --></th>
                    <td>
                        <input id="receiveMoveDt" name="receiveMoveDt" class="form_datetimepicker" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.moveRunDistVal" /><!-- 출동주행거리 --></th>
                    <td>
                        <input type="text" id="receiveMoveRunDistVal" name="receiveMoveRunDistVal" class="form_numeric ar" data-type="number" min="1" maxlength="6" data-json-obj="true"/>
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.receiveCarReturnDt" /><!-- 수령차복귀시간 --></th>
                    <td>
                        <input id="receiveCarReturnDt" name="receiveCarReturnDt" class="form_datetimepicker" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.returnRunDistVal" /><!-- 복귀주행거리 --></th>
                    <td>
                        <input type="text" id="receiveReturnRunDistVal" name="receiveReturnRunDistVal" class="form_numeric ar" data-type="number" min="1" maxlength="6" data-json-obj="true"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.carReceiveDt" /><!-- 차량수령시간 --></th>
                    <td>
                        <input id="carReceiveDt" name="carReceiveDt" class="form_datetimepicker" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.vsitDlIfNm" /><!-- 방문인도연계인 --></th>
                    <td>
                        <input type="text" id="vsitDlIfNm" name="vsitDlIfNm" class="form_input" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.vsitDlCinoNo" /><!-- 방문인도연락처 --></th>
                    <td>
                        <input type="text" id="vsitDlCinoNo" name="vsitDlCinoNo" class="form_input" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.dlPrsnNm" /><!-- 배송담당자 --></th>
                    <td>
                        <input type="text" id="dlPrsnNm" name="dlPrsnNm" class="form_input" data-json-obj="true">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.vsitDlAddrNm" /><!-- 방문인도주소 --></th>
                    <td colspan="7">
                        <input type="text" id="vsitDlAddrNm" name="vsitDlAddrNm" class="form_input" data-json-obj="true">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.dlMoveDt" /><!-- 배송출동시간 --></th>
                    <td>
                        <input id="dlMoveDt" name="dlMoveDt" class="form_datetimepicker" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.moveRunDistVal" /><!-- 출동주행거리 --></th>
                    <td>
                        <input type="text" id="dlMoveRunDistVal" name="dlMoveRunDistVal" class="form_numeric ar" data-type="number" min="1" maxlength="6" data-json-obj="true"/>
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.dlCarReturnDt" /><!-- 배송차량복귀시간 --></th>
                    <td>
                        <input id="dlCarReturnDt" name="dlCarReturnDt" class="form_datetimepicker" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.returnRunDistVal" /><!-- 복귀주행거리 --></th>
                    <td>
                        <input type="text" id="dlReturnRunDistVal" name="dlReturnRunDistVal" class="form_numeric ar" data-type="number" min="1" maxlength="6" data-json-obj="true"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.vsitSerRemark" /><!-- 방문서비스비고 --></th>
                    <td colspan="7">
                        <input type="text" id="vsitSerRemark" name="vsitSerRemark" class="form_input" data-json-obj="true">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    </form>
</section>

<script type="text/javascript">


    $(document).ready(function() {

        // 방문차량수령시간
        $("#vsitCarReceiveDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:""
        });

        // 수령출동시간
        $("#receiveMoveDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:""
        });

        // 수령차복귀시간
        $("#receiveCarReturnDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:""
        });

        // 차량수령시간
        $("#carReceiveDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:""
        });

        // 배송출동시간
        $("#dlMoveDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:""
        });

        // 배송차량복귀시간
        $("#dlCarReturnDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:""
        });

        // 출동주행거리
        $("#receiveMoveRunDistVal").kendoExtNumericTextBox({
           min:0
          ,format:"n0" //"{0:##,###}"
          ,spinners:false             // 증,감 화살표
        });

        // 출동주행거리
        $("#receiveReturnRunDistVal").kendoExtNumericTextBox({
           min:0
          ,format:"n0" //"{0:##,###}"
          ,spinners:false             // 증,감 화살표
        });

        // 출동주행거리
        $("#dlMoveRunDistVal").kendoExtNumericTextBox({
           min:0
          ,format:"n0" //"{0:##,###}"
          ,spinners:false             // 증,감 화살표
        });

        // 출동주행거리
        $("#dlReturnRunDistVal").kendoExtNumericTextBox({
           min:0
          ,format:"n0" //"{0:##,###}"
          ,spinners:false             // 증,감 화살표
        });

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.visitServicePopup.options.content.data;

         // 데이터 가져오기
         $.ajax({
             url:"<c:url value='/ser/rev/reservationReceipt/selectReservationReceiptByKey.do' />"
             ,data:JSON.stringify({sResvDocNo:options.resvDocNo})
             ,type:'POST'
             ,dataType:'json'
             ,contentType:'application/json'
             ,error:function(jqXHR, status, error) {
                 dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
             }
             ,success:function(result, textStatus){
                 if(result != null){
                     resvInfoSet(result);
                 } else {

                 }
             }
         });

        /************************************************************
                    기능버튼 설정
        *************************************************************/

        // 등록 버튼.
        $("#btnCreate").kendoButton({
            click:function(e){

                // form 데이터 및 그리드 변경 데이터 세팅
                var param = $("#form").serializeObject();

                param.resvDocNo = options.resvDocNo;
                param.vsitCarReceiveDt = $("#vsitCarReceiveDt").data("kendoExtMaskedDatePicker").value();
                param.receiveMoveDt = $("#receiveMoveDt").data("kendoExtMaskedDatePicker").value();
                param.receiveCarReturnDt = $("#receiveCarReturnDt").data("kendoExtMaskedDatePicker").value();
                param.carReceiveDt = $("#carReceiveDt").data("kendoExtMaskedDatePicker").value();
                param.dlMoveDt = $("#dlMoveDt").data("kendoExtMaskedDatePicker").value();
                param.dlCarReturnDt = $("#dlCarReturnDt").data("kendoExtMaskedDatePicker").value();
                param.receiveMoveRunDistVal = $("#receiveMoveRunDistVal").data("kendoExtNumericTextBox").value();
                param.receiveReturnRunDistVal = $("#receiveReturnRunDistVal").data("kendoExtNumericTextBox").value();
                param.dlMoveRunDistVal = $("#dlMoveRunDistVal").data("kendoExtNumericTextBox").value();
                param.dlReturnRunDistVal = $("#dlReturnRunDistVal").data("kendoExtNumericTextBox").value();

                $.ajax({
                    url:"<c:url value='/ser/rev/reservationReceipt/updateReservationReceipt.do' />"
                    ,data:JSON.stringify(param)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(request,status,error){
                        parent.visitServicePopup.close();
                    }
                }).done(function(result) {
                    parent.visitServicePopup.close();
                    options.callbackFunc();
                });
            }
        });

        // 취소 버튼.
        $("#btnCancel").kendoButton({
            click:function(e){
                parent.visitServicePopup.close();
            }
        });

        // 예약정보 셋팅
        resvInfoSet = function(result){

            $("#vsitCarReceiveDt").data("kendoExtMaskedDatePicker").value(result.vsitCarReceiveDt);
            $("#vsitCarReceiveIfNm").val(result.vsitCarReceiveIfNm);
            $("#vsitCarReceiveCinoNo").val(result.vsitCarReceiveCinoNo);
            $("#receivePrsnNm").val(result.receivePrsnNm);
            $("#vsitCarReceiveAddrNm").val(result.vsitCarReceiveAddrNm);
            $("#receiveMoveDt").data("kendoExtMaskedDatePicker").value(result.receiveMoveDt);
            $("#receiveMoveRunDistVal").val(result.receiveMoveRunDistVal);
            $("#receiveCarReturnDt").data("kendoExtMaskedDatePicker").value(result.receiveCarReturnDt);
            $("#receiveReturnRunDistVal").val(result.receiveReturnRunDistVal);
            $("#carReceiveDt").data("kendoExtMaskedDatePicker").value(result.carReceiveDt);
            $("#receivePrsnNm").val(result.receivePrsnNm);
            $("#receivePrsnNm").val(result.receivePrsnNm);
            $("#receivePrsnNm").val(result.receivePrsnNm);
            $("#carReceiveDt").data("kendoExtMaskedDatePicker").value(result.carReceiveDt);
            $("#vsitDlIfNm").val(result.vsitDlIfNm);
            $("#vsitDlCinoNo").val(result.vsitDlCinoNo);
            $("#vsitDlAddrNm").val(result.vsitDlAddrNm);
            $("#dlMoveDt").data("kendoExtMaskedDatePicker").value(result.dlMoveDt);
            $("#dlMoveRunDistVal").val(result.dlMoveRunDistVal);
            $("#dlCarReturnDt").data("kendoExtMaskedDatePicker").value(result.dlCarReturnDt);
            $("#dlReturnRunDistVal").val(result.dlReturnRunDistVal);
            $("#vsitSerRemark").val(result.vsitSerRemark);

        };
    });

</script>










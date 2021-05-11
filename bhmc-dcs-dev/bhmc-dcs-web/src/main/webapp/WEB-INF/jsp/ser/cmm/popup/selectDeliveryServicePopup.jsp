<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.lbl.delivery" /><!-- Delivery --></h1>
        <div class="btn_right">
            <button type="button" id="btnCreate" class="btn_s btn_Insert"><spring:message code="global.btn.create" /></button>
            <button type="button" id="btnCancel" class="btn_s btn_Cancel"><spring:message code="global.btn.cancel" /></button>
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
                    <th scope="row"><spring:message code="ser.lbl.vsitAddrNm" /><!-- 방문주소 --></th>
                    <td colspan="7">
                        <input type="text" id="vsitAddrNm" name="vsitAddrNm" class="form_input" data-json-obj="true">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.vsitDt" /><!-- 방문시간 --></th>
                    <td>
                        <input id="vsitDt" name="vsitDt" class="form_datetimepicker" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.siteArrvDt" /><!-- 현장도착시간 --></th>
                    <td>
                        <input id="siteArrvDt" name="siteArrvDt" class="form_datetimepicker" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.siteStartDt" /><!-- 현장출발시간 --></th>
                    <td>
                        <input id="siteStartDt" name="siteStartDt" class="form_datetimepicker" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.serReturnDt" /><!-- 서비스복귀시간 --></th>
                    <td>
                        <input type="text" id="serReturnDt" name="serReturnDt" class="form_datetimepicker" data-json-obj="true">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.vsitSerTp" /><!-- 방문서비스방식 --></th>
                    <td>
                        <input id="vsitSerTp" name="vsitSerTp" class="form_comboBox" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.vsitSerCarNm" /><!-- 방문서비스차량 --></th>
                    <td>
                        <input type="text" id="vsitSerCarId" name="vsitSerCarId" class="form_input" data-json-obj="true">
                        <input type="hidden" id="vsitSerCarNm" name="vsitSerCarNm" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.moveRunDistVal" /><!-- 출동주행거리 --></th>
                    <td>
                        <input type="text" id="vsitMoveRunDistVal" name="vsitMoveRunDistVal" class="form_numeric ar" data-type="number" min="1" maxlength="6" data-json-obj="true" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.returnRunDistVal" /><!-- 복귀주행거리 --></th>
                    <td>
                        <input type="text" id="vsitReturnRunDistVal" name="vsitReturnRunDistVal" class="form_numeric ar" data-type="number" min="1" maxlength="6" data-json-obj="true" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.dlSerRemark" /><!-- 딜리버리서비스비고 --></th>
                    <td colspan="7">
                        <input type="text" id="dlSerRemark" name="dlSerRemark" class="form_input" data-json-obj="true">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    </form>
</section>

<script type="text/javascript">


    $(document).ready(function() {

        // 방문시간
        $("#vsitDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:""
        });

        // 현장도착시간
        $("#siteArrvDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:""
        });

        // 현장출발시간
        $("#siteStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:""
        });

        // 서비스복귀시간
        $("#serReturnDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' /> HH:mm"
            ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:""
        });

        // 출동주행거리
        $("#vsitMoveRunDistVal").kendoExtNumericTextBox({
           min:0
          ,format:"n0" //"{0:##,###}"
          ,spinners:false             // 증,감 화살표
        });

        // 복귀주행거리
        $("#vsitReturnRunDistVal").kendoExtNumericTextBox({
           min:0
          ,format:"n0" //"{0:##,###}"
          ,spinners:false             // 증,감 화살표
        });

        // 방문서비스방식
        $("#vsitSerTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:null
            ,index:0
        });
        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
        var options = parent.deliveryPopup.options.content.data;

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

        // 그리드 더블 클릭 이벤트.
        $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
            $("#btnSelect").click();
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
                param.vsitDt = $("#vsitDt").data("kendoExtMaskedDatePicker").value();
                param.siteArrvDt = $("#siteArrvDt").data("kendoExtMaskedDatePicker").value();
                param.siteStartDt = $("#siteStartDt").data("kendoExtMaskedDatePicker").value();
                param.serReturnDt = $("#serReturnDt").data("kendoExtMaskedDatePicker").value();
                param.vsitMoveRunDistVal = $("#vsitMoveRunDistVal").data("kendoExtNumericTextBox").value();
                param.vsitReturnRunDistVal = $("#vsitReturnRunDistVal").data("kendoExtNumericTextBox").value();

                $.ajax({
                    url:"<c:url value='/ser/rev/reservationReceipt/updateReservationReceipt.do' />"
                    ,data:JSON.stringify(param)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(request,status,error){
                        parent.deliveryPopup.close();
                    }
                }).done(function(result) {

                    options.callbackFunc();
                    parent.deliveryPopup.close();

                });
            }
        });

        // 취소 버튼.
        $("#btnCancel").kendoButton({
            click:function(e){
                parent.deliveryPopup.close();
            }
        });

        // 예약정보 셋팅
        resvInfoSet = function(result){
            $("#vsitAddrNm").val(result.vsitAddrNm);
            $("#vsitDt").data("kendoExtMaskedDatePicker").value(result.vsitDt);
            $("#siteArrvDt").data("kendoExtMaskedDatePicker").value(result.siteArrvDt);
            $("#siteStartDt").data("kendoExtMaskedDatePicker").value(result.siteStartDt);
            $("#serReturnDt").data("kendoExtMaskedDatePicker").value(result.serReturnDt);
            $("#vsitSerTp").val(result.vsitSerTp);
            $("#vsitSerCarId").val(result.vsitSerCarId);
            $("#vsitMoveRunDistVal").val(result.vsitMoveRunDistVal);
            $("#vsitReturnRunDistVal").val(result.vsitReturnRunDistVal);
            $("#dlSerRemark").val(result.dlSerRemark);
        }
    });

</script>










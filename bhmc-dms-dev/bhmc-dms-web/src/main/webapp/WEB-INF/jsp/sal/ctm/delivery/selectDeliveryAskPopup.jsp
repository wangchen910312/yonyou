<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 출고요청관리 팝업 -->
<section id="window" class="pop_wrap">
    <div class="table_form form_width_100per mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:18%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:13%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.contractNo' /></th>    <!-- 계약번호 -->
                    <td>
                        <input id="contractNo" readonly class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractType' /></th>   <!-- 계약유형 -->
                    <td>
                        <input id="contractTp" readonly class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.customer' /></th> <!-- 고객 -->
                    <td>
                        <input id="custNm" readonly class="form_input form_readonly" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th>     <!-- 차종 -->
                    <td class="readonly_area">
                        <input id="carlineNm" readonly class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th>     <!-- 모델 -->
                    <td class="readonly_area">
                        <input id="modelNm" readonly class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.ocn' /></th>        <!-- OCN -->
                    <td class="readonly_area">
                        <input id="ocnNm" readonly class="form_input form_readonly" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.extColor' /></th>        <!-- 외장색 -->
                    <td class="readonly_area">
                        <input id="extColorNm" readonly class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.intColor' /></th>        <!-- 내장색 -->
                    <td class="readonly_area">
                        <input id="intColorNm" readonly class="form_input form_readonly" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.vinNum' /></th>     <!-- VIN NO -->
                    <td class="readonly_area">
                        <input id="vinNo" readonly class="form_input form_readonly" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.contractDate' /></th>        <!-- 계약일 -->
                    <td class="readonly_area">
                        <input id="contractDt" readonly class="form_datepicker" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.allocDt' /></th>    <!-- 배정일 -->
                    <td class="readonly_area">
                        <input id="allocDt" readonly class="form_datepicker" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.dlReqDt' /></th>    <!-- 고객인도요청일 -->
                    <td class="readonly_area">
                        <input id="dlReqDt"  readonly class="form_datepicker" />
                    </td>
                </tr>
            </tbody>
        </table>
        <span style="display:none">
            <input id="dlrCd" type="hidden">
        </span>
    </div>

    <div class="table_form mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code='global.lbl.giStatDt' /></span></th> <!-- 출고요청일 -->
                    <td class="required_area">
                        <input id="giReqDt" class="form_datepicker" style="width:19.2%" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="btn_bottom">
        <button id="btnAskDelivery" class="btn_m"><spring:message code='global.lbl.releaseReq' /></button>           <!-- 출고요청 -->
        <button id="btnClose" class="btn_m" id="closeButton"><spring:message code='global.lbl.cancel' /></button>    <!-- 취소 -->
    </div>
</section>
<!-- //출고요청관리 팝업 -->

<script>
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일

// 계약유형
var contractTpObj = {};
<c:forEach var="obj" items="${contractTpDS}">
    contractTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


$(document).ready(function() {

    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;

    // 계약일
    $("#contractDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 배정일
    $("#allocDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 고객인도요청일
    $("#dlReqDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 출고요청일
    $("#giReqDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //출고요청 버튼
    $("#btnAskDelivery").kendoButton({
        click:function(e){

            if($("#giReqDt").data("kendoExtMaskedDatePicker").value() == null || $("#giReqDt").val() == ""){
                // 출고요청일을 입력하여 주시기 바랍니다.
                dms.notification.info("<spring:message code='global.lbl.giStatDt' var='globalLblGiStatDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblGiStatDt}' />");
                return false;
            }

            // 출고요청 하시겠습니까?
            if(!confirm("<spring:message code='global.lbl.releaseReq' var='globalLblReleaseReq' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblReleaseReq}' />")){
                return;
            }

            var param = {} , closeFlag = false;
            param.contractNo = $("#contractNo").val();
            param.dlrCd      = $("#dlrCd").val();
            param.giReqDt   = $("#giReqDt").data("kendoExtMaskedDatePicker").value();

            $.ajax({
                url:"<c:url value='/sal/ctm/deliveryAsk/confirmAskDeliveryPopup.do' />",
                data:JSON.stringify(param),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                async:false,
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(jqXHR, textStatus) {
                     var data = [];
                     data.msg = 'save';
                     options.callbackFunc(data);
                     closeFlag = true;
                }
            });

            if(closeFlag){
                parent.popupWindow.close();
            }
        }
    });

    // 닫기 버튼
    $("#btnClose").kendoButton({
        click:function(e){
            var data = [];
            data.msg = 'close';
            options.callbackFunc(data);
            parent.popupWindow.close();
        }
    });

    $("#dlrCd").val(options.dlrCd);         // 딜러코드
    $("#contractNo").val(options.contractNo);
    $("#contractTp").val(contractTpObj[options.contractTp]);

    $("#custNm").val(options.custNm);
    $("#carlineNm").val(options.carlineNm);
    $("#modelNm").val(options.modelNm);
    $("#ocnNm").val(options.ocnNm);
    $("#extColorNm").val(options.extColorNm);
    $("#intColorNm").val(options.intColorNm);
    $("#vinNo").val(options.vinNo);

    $("#contractDt").data("kendoExtMaskedDatePicker").value(options.contractDt);
    $("#allocDt").data("kendoExtMaskedDatePicker").value(options.allocDt);
    $("#dlReqDt").data("kendoExtMaskedDatePicker").value(options.dlReqDt);

});
</script>

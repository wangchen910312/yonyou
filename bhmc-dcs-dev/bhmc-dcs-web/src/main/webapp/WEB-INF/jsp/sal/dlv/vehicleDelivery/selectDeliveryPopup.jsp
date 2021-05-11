<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<section id="windows" class="pop_wrap">
    <!-- 인도처리 정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code = 'global.btn.deliveryHandle'/></h2>   <!-- 인도처리 -->
            <div class="btn_right">
                <button class="btn_m" id="btnDelivery" ><spring:message code='global.title.deliveryHandle' /></button><!-- 차량교환 -->
                <button class="btn_m" id="btnClose" ><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
            </div>
        </div>
        <div class="table_form form_width_100per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:20%;">
                    <col style="width:10%;">
                    <col style="width:25%;">
                    <col style="width:11%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.contractNo' /></th><!-- 계약번호 -->
                        <td class="readonly_area">
                            <input id="contractNo" class="form_input" readonly>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.saleType' /></th><!-- 판매유형 -->
                        <td class="readonly_area">
                            <input id="contractTp" class="form_input" readonly>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.customer' /></th><!-- 고객 -->
                        <td class="readonly_area">
                            <input id="contractCustNm" class="form_input" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                        <td class="readonly_area">
                            <input id="carlineCd" class="form_input" readonly>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                        <td class="readonly_area">
                            <input id="modelCd" class="form_input" readonly>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.ocn' /></th>    <!-- OCN -->
                        <td class="readonly_area">
                            <input id="ocnCd" class="form_input" readonly >
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                        <td class="readonly_area">
                            <input id="extColorCd" type="text" class="form_input" readonly>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                        <td class="readonly_area">
                            <input id="intColorCd" type="text" class="form_input" readonly>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.vinNum' /></th><!-- VIN NO -->
                        <td class="readonly_area">
                            <input id="vinNo" type="text" class="form_input" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.contractDate' /></th><!-- 계약일 -->
                        <td class="readonly_area">
                            <input id="contractDt" type="text" class="form_datepicker" readonly>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.giDt' /></th><!-- 출고일 -->
                        <td class="readonly_area">
                            <input id="giDt" type="text" class="form_datepicker" readonly>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.dlReqDt' /></th><!-- 인도요청일 -->
                        <td class="readonly_area">
                            <input id="dlReqDt" type="text" class="form_datepicker" readonly>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //배정정보 -->


    <!-- RFID SCAN -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='global.title.rfidScan' /></h2>  <!--  -->
        </div>
        <div class="table_form form_width_100per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:20%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.rfid' /></th><!-- RFID -->
                        <td>
                            <input id="rfidNo" type="text" class="form_input" >
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //RFID SCAN -->

    <!-- 이상출고신청 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code='global.lbl.excpDlvReq' /></h1><!-- 이상출고신청 -->
            <div class="btn_right">
                <button class="btn_s" id="btnExceptionDlv" ><spring:message code='global.btn.exceptionDelivery' /></button><!-- 이상출고처리 -->
            </div>
        </div>
        <div class="table_form form_width_100per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:20%;">
                    <col style="width:10%;">
                    <col style="width:25%;">
                    <col style="width:11%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.vinNum' /></th><!-- VIN NO -->
                        <td>
                            <input id="rfidVinNo" type="text" class="form_input" readonly>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.regReason' /></th><!-- 신청사유 -->
                        <td>
                            <input id="fceSaleReqReasonCd" type="text" class="form_comboBox" >
                        </td>
                        <th scope="row"><spring:message code='global.lbl.file' /></th><!-- FILE -->
                        <td>
                            <input id="file" type="text" class="form_input" readonly>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //이상출고신청 -->


    <!-- 서비스고문지정 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code='global.lbl.appointServiceAd' /></h1><!-- 서비스고문지정 -->
        </div>
        <div class="table_form form_width_100per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:20%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.serviceAd' /></th><!-- 서비스고문 -->
                        <td>
                            <input id="serviceAd" type="text" class="form_comboBox" style="width:30%;">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //RFID SCAN -->


</section>
<!-- //고객인도관리-인도처리 팝업 -->



<script type="text/javascript">

/**
 * 팝업 옵션
 */
var options = parent.deliveryPopupWin.options.content.data;

//강제출고처리 신청사유 데이터셋
var fceReqReason = [];
<c:forEach var="obj" items="${fceReqReasonList}">
    fceReqReason.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//서비스고문 데이터셋
var serviceAdList = [];
<c:forEach var="obj" items="${serviceAdList}">
    serviceAdList.push({tecId:"${obj.tecId}", tecNm:"${obj.tecNm}"});
</c:forEach>

$("#rfidNo").val("${excptDelivery.rfidNo}");
$("#fceSaleReqReasonCd").val("${excptDelivery.fceSaleReqReasonCd}");
var approveYn = "${excptDelivery.approveYn}";
var reqStatCd = "${excptDelivery.reqStatCd}";

$(document).ready(function() {

    //계약일
    $("#contractDt").kendoDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
    });

    //출고일자
    $("#giDt").kendoDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
    });

    //인도요청일
    $("#dlReqDt").kendoDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
    });


    //신청사유
    $("#fceSaleReqReasonCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:fceReqReason
        ,index:0
    });

    //서비스고문
    $("#serviceAd").kendoExtDropDownList({
        dataTextField:"tecNm"
        ,dataValueField:"tecId"
        ,dataSource:serviceAdList
        ,optionLabel:" "  // 선택
    });

    $("#contractNo").val(options.contractNo);
    $("#contractTp").val(options.contractTp);
    $("#contractCustNm").val(options.contractCustNm);
    $("#carlineCd").val(options.carlineNm);
    $("#modelCd").val(options.modelNm);
    $("#ocnCd").val(options.ocnNm);
    $("#extColorCd").val(options.extColorNm);
    $("#intColorCd").val(options.intColorNm);
    $("#vinNo").val(options.vinNo);
    $("#rfidVinNo").val(options.vinNo);
    $("#contractDt").data("kendoDatePicker").value(options.contractDt);
    $("#giDt").data("kendoDatePicker").value(options.giDt);
    $("#dlReqDt").data("kendoDatePicker").value(options.dlReqDt);

    /**************************** //검색 조건 **************************************/

    //버튼 - 닫기
    $("#btnClose").kendoButton({
        click:function(e){
            parent.deliveryPopupWin.close();
       }
    });

    //버튼 - 인도처리
    $("#btnDelivery").kendoButton({
        click:function(e){

            if($("#serviceAd").val() == ''){
                // 서비스고문을 선택해주세요.
                dms.notification.warning("<spring:message code='sal.info.deliveryServiceMsg' />");
                return false;
            }

            if(options.ownStatCd != 'A'){
                // 차량보유상태가 배정일 경우에만 고객인도가 가능합니다.
                dms.notification.warning("<spring:message code='sal.info.NonSelectDeliveryPop' />");
                return false;
            }

            if(options.rfidNo == $("#rfidNo").val() || approveYn == 'Y'){
                // 고객인도 를 처리 하시겠습니까?
                if (confirm("<spring:message code='global.lbl.custDelivery' var='globalLblCustDelivery' /><spring:message code='global.lbl.proce' var='globalLblProce' /><spring:message code='global.info.cnfrmsMsg' arguments='${globalLblCustDelivery}, ${globalLblProce}' />") == false ){
                    return false;
                }

                $.ajax({
                    url:"<c:url value='/sal/dlv/vehicleDelivery/vehicleDelivery.do' />",
                    dataType:"json",
                    type:"POST",
                    contentType:"application/json",
                    data:JSON.stringify(getSaveData()),
                    error:function(jqXHR,status,error){
                        //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                    },
                    success:function(jqXHR, textStatus){
                        options.callbackFunc();
                        parent.deliveryPopupWin.close();
                    }
                });
            }else {

                if(approveYn != 'Y'){
                    // 강제판매처리가 완료되어야 합니다.
                    dms.notification.warning("<spring:message code='global.lbl.coercionSal' var='globalLblCoercionSal' /><spring:message code='global.btn.approval' var='globalBtnApproval' /><spring:message code='global.info.warningInfoMsg' arguments='${globalLblCoercionSal}, ${globalBtnApproval}' />");
                    return false;
                }

                if(options.rfidNo != $("#rfidNo").val()){
                    // 차량의 RFID NO와 입력받은 RFID NO가 동일해야만 합니다.
                    dms.notification.warning("<spring:message code='global.info.carRfidChk' />");
                    return false;
                }
            }

       }
    });



    //버튼 - 이상출고처리
    $("#btnExceptionDlv").kendoButton({
        click:function(e){

            if($("#rfidNo").val() != null && $("#rfidNo").val() != '' ){
                if($("#rfidNo").val() == options.rfidNo){
                    // 스캔한 RFID NO와 차량마스터의 RFID NO가 일치합니다. \n 이상출고처리를 계속 하시겠습니까?
                    if(confirm("<spring:message code='sal.info.scanRfidMsg' /> \n <spring:message code='sal.info.qDeliveryMsg' />") == false ){
                        return false;
                    }
                }
            }

            if(reqStatCd != 'N' && !(reqStatCd == null || reqStatCd == '')){
                // 이상출고처리 된 계약건입니다.
                dms.notification.warning("<spring:message code='sal.info.qDeliveryCont' />");
                return false;
            }

            // 이상출고처리 하시겠습니까?
            if (confirm("<spring:message code='global.info.qDelivery' var='globalInfoQDelivery' /><spring:message code='global.info.cnfrmMessage' arguments='${globalInfoQDelivery}' />") == false ){
                return false;
            }

            $.ajax({
                url:"<c:url value='/sal/dlv/vehicleDelivery/exceptionDelivery.do' />",
                dataType:"json",
                type:"POST",
                contentType:"application/json",
                data:JSON.stringify(getSaveDataExcp()),
                error:function(jqXHR,status,error){
                    //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                },
                success:function(jqXHR, textStatus){
                    options.callbackFunc();
                    parent.deliveryPopupWin.close();
                }
            });
        }
    });

});


function getSaveData(){

    var saveData = {
            dlrCd:options.dlrCd
            ,contractNo:options.contractNo
            ,contractCustNo:options.contractCustNo
            ,vinNo:options.vinNo
            ,tovrNm:options.tovrNm
            ,tovrRelCd:options.tovrRelCd
            ,tecId:$("#tecId").val()
    };

    return saveData;
}


function getSaveDataExcp(){

    var saveData = {
            dlrCd:options.dlrCd
            ,contractNo:options.contractNo
            ,vinNo1:options.vinNo1
            ,vinNo2:options.vinNo2
            ,fceSaleReqReasonCd:$("#fceSaleReqReasonCd").val()
            ,rfidNo:$("#rfidNo").val()
        };

    return saveData;
}

</script>

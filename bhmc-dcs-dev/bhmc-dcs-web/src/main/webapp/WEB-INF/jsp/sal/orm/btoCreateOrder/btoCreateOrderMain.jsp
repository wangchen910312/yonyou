<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- BTO 주문생성 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.createOrder" /></h1> <!-- 주문생성 -->
            <div class="btn_right">
                <button class="btn_m" id="btnOrderConfirm"><spring:message code="sal.btn.cnfrmOrder" /></button> <!-- 주문제보 -->
                <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button> <!-- 초기화 -->
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_100per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:12%;">
                    <col style="width:8%;">
                    <col style="width:12%;">
                    <col style="width:10%;">
                    <col style="width:12%;">
                    <col style="width:8%;">
                    <col style="width:10%;">
                    <col style="width:10%;">
                    <col style="width:10%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.orderType" /></span></th> <!-- 주문유형 -->
                        <td class="required_area">
                            <input id="sOrdTp" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.orderWeek" /></span></th> <!-- 주문주차 -->
                        <td class="required_area">
                            <input id="sOrdYyMmPrid" type="text" class="form_comboBox">
                        </td>

                        <th scope="row" class="group-OrdDt1" style="display:none;"><span class="bu_required"><spring:message code="global.lbl.orderRegDt" /></span></th> <!-- 주문등록일 -->
                        <td colspan="3" class="group-OrdDt1 required_area" style="display:none;">
                            <div class="form_float">
                                <div class="date_left">
                                    <input name="sOrdDtS" id="sOrdDtS" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sOrdDtE" id="sOrdDtE" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row" class="group-OrdDt2"></th>
                        <td colspan="3" class="group-OrdDt2"></td>

                        <th scope="row"><spring:message code="sal.lbl.trsfDealer" /></th> <!-- 운송딜러 -->
                        <td class="required_area">
                            <input name="sTrsfDlrCd" id="sTrsfDlrCd" type="text" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.carLine" /></span></th> <!-- 차종 -->
                        <td class="required_area">
                            <input name="sCarlineCd" id="sCarlineCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.model" /></th> <!-- 차관 -->
                        <td class="required_area">
                            <input name="sModelCd" id="sModelCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.ocn" /></th> <!-- OCN -->
                        <td class="required_area">
                            <input name="sOcnCd" id="sOcnCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.extColor" /></th> <!-- 외장색 -->
                        <td class="required_area">
                            <input name="sExtColorCd" id="sExtColorCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.intColor" /></th> <!-- 내장색 -->
                        <td class="required_area">
                            <input name="sIntColorCd" id="sIntColorCd" type="text" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.orderQty" /></th> <!-- 주문수량 -->
                        <td class="required_area">
                            <input name="sOrdQty" id="sOrdQty" type="text" value="" class="form_numeric">
                        </td>

<%--
                        <th scope="row"><spring:message code="sal.lbl.salesAdvisor" /></th> <!-- 판매고문 -->
                        <td>
                            <input id="sSaleRgstId" type="text" class="form_comboBox">
                        </td>
 --%>
                        <th scope="row" class="bor_none"></th>
                        <td></td>
                        <th scope="row" class="bor_none"></th>
                        <td></td>
                        <th scope="row" class="bor_none"></th>
                        <td></td>
                        <th scope="row" class="bor_none"></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.refValue" /></th> <!-- 참고수량 -->
                        <td class="readonly_area">
                            <input id="sRefOrdQty" type="text" readonly class="form_numeric form_readonly">
                        </td>
                        <th scope="row"><spring:message code="sal.estimatedPayDt" /></th> <!-- 결제예정일자 -->
                        <td class="readonly_area">
                            <input name="sPfpExamDt" id="sPfpExamDt" type="text" value="" readonly class="form_input">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.orderGrade" /></th> <!-- 주문등급 -->
                        <td class="readonly_area">
                            <input name="sOrdGradeCd" id="sOrdGradeCd" type="text" value="" readonly class="form_input">
                        </td>

                        <th scope="row"><spring:message code='sal.lbl.carRetlAmt' /></th> <!-- 지도가 -->
                        <td class="readonly_area">
                            <input id="carRetlAmt" type="text" readonly class="form_numeric form_readonly ar" />
                        </td>
                        <th scope="row" class="bor_none"></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row" class="group-rmk1"><spring:message code="global.lbl.remark" /></th> <!-- 비고 -->
                        <td colspan="5" class="group-rmk1">
                            <textarea name="sRemark" id="sRemark" rows="3" cols="30" maxlength="1000" type="text" value="" readonly class="form_textarea form_readonly"></textarea>
                        </td>
                        <th scope="row" class="group-rmk2" style="display:none;"></th>
                        <td colspan="5" class="group-rmk2" style="display:none;"></td>
                        <th scope="row" class="bor_none"></th>
                        <td></td>
                        <th scope="row" class="bor_none"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="header_area">
            <div class="btn_left">
                <ul class="txt_input child_borderNone">
                    <li>
                        <span class="span_bg"><spring:message code="sal.lbl.totOrdQty" /> :</span>      <!-- 총주문수량 -->
                        <input id="totOrdQty" type="text" readonly class="form_numeric font_bold" style="width:100px">
                    </li>
                </ul>
            </div>
            <div class="btn_right">
                <button class="btn_s" id="btnApply"><spring:message code="global.btn.add" /></button> <!-- 추가 -->
                <button class="btn_s" id="btnOrdAmt"><spring:message code="sal.btn.cnfrmOrderAmt" /></button> <!-- 주문금액조회 -->
                <button class="btn_s" id="btnPriority"><spring:message code="sal.btn.prorGrant" /></button> <!-- 우선순위부여 -->
                <button class="btn_s" id="btnOrdDelete"><spring:message code="sal.btn.selOrderDelete" /></button> <!-- 선택주문삭제 -->
            </div>
        </div>
        <div class="table_grid">
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>

<script  type="text/javascript">
<!--
     var sysDate = "${sysDate}";
     var fifteenDayBf = "${fifteenDayBf}"

     /************* 주문유형 SELECT BOX  *******************/
	 var ordTpList = [];
     <c:forEach var="obj" items="${ordTpInfo}">
     var cmmCdNm = "[" + "${obj.cmmCd}" + "]" + "${obj.cmmCdNm}"
     ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":cmmCdNm, "useYn":"${obj.useYn}"});
     </c:forEach>

     var ordTpArr = dms.data.arrayToMap(ordTpList, function(obj){return obj.cmmCd});
     /************* 주문유형 SELECT BOX  *******************/

     /************* 주문주차 SELECT BOX  *******************/
     var ordYyMmPridList = [];
     <c:forEach var="obj" items="${ordYyMmPridInfo}">
     ordYyMmPridList.push({btoYmwNm:"${obj.btoYmwNm}", btoYmwCd:"${obj.btoYmwCd}", remark:"${obj.remark}"});
     </c:forEach>

     var ordYyMmPridArr = dms.data.arrayToMap(ordYyMmPridList, function(obj){return obj.btoYmwCd});
     /************* 주문주차 SELECT BOX  *******************/

     /************* 운송딜러 SELECT BOX  *******************/
     var trsfDlrCdList = [];
     <c:forEach var="obj" items="${trsfDlrCdInfo}">
     trsfDlrCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     var trsfDlrCdArr = dms.data.arrayToMap(trsfDlrCdList, function(obj){return obj.cmmCd});
     /************* 운송딜러 SELECT BOX  *******************/

     /************* 지불방식 SELECT BOX  *******************/
     var paymentCdList = [];
     <c:forEach var="obj" items="${paymentCdInfo}">
     paymentCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     var paymentCdArr = dms.data.arrayToMap(paymentCdList, function(obj){return obj.cmmCd});
     /************* 지불방식 SELECT BOX  *******************/

    // 판매고문
    var selectSaleEmpDSList = [];
    var selectSaleEmpDSObj = {};
    <c:forEach var="obj" items="${saleEmpDSInfo}">
        selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
        selectSaleEmpDSObj["${obj.usrId}"] = "[${obj.usrId}]${obj.usrNm}";
    </c:forEach>

    //인터페이스상태 Array SAL186
    var interfaceStatCdInfoList = [];
    var interfaceStatCdInfoObj = {};
    <c:forEach var="obj" items="${interfaceStatCdInfo}">
      interfaceStatCdInfoList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
      interfaceStatCdInfoObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

 //차종조회
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>


var orderAmtPopup;
function orderAmtSearchPopup(arrSelectVeh) {

    var grid = $("#grid").data("kendoExtGrid");
    var items = grid.dataSource.data();

    orderAmtPopup = dms.window.popup({
        windowId:"orderAmtSearchPopup"
        ,title:"<spring:message code='global.lbl.orderAmt' />"   // 주문금액
        ,modal:true
        ,draggable:true
        ,width:1000
        ,height:360
        ,content:{
            url:"<c:url value='/sal/orm/btoCreateOrder/selectBtoCreateOrderPopup.do'/>"
            , data:{
                "autoBind":false
                ,"arrSelectVeh":arrSelectVeh
                ,"callbackFunc":function(data){
                    console.log(JSON.stringify(data));
                }
            }
        }
    });
}

//단위유형 Array
var ordStatCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${ordStatCdInfo}">
ordStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//상태 Map
var ordStatCdMap = dms.data.arrayToMap(ordStatCdList, function(obj){ return obj.cmmCd; });

$(document).ready(function () {

     //주문유형
     $("#sOrdTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:ordTpList
        ,select:function(e){
            //주문유형에 따른 주문주차 및 메모 조회
            var ordTpCd = this.dataItem(e.item).cmmCd;

            if( ordTpCd != null && ordTpCd != ""){
                var responseJson = dms.ajax.getJson({
                    url:"<c:url value='/sal/orm/btoCreateOrder/selectOrdWeekRemark.do'/>"
                    ,data:JSON.stringify({"sOrdTp":this.dataItem(e.item).cmmCd})
                    ,async:false
                });

                if(responseJson != null && responseJson.data.length > 0){
                    $("#sOrdYyMmPrid").data("kendoExtDropDownList").setDataSource(responseJson.data);  // 주차정보
                    $("#sOrdYyMmPrid").data("kendoExtDropDownList").value(responseJson.data[0].btoYmwCd);
                    $("#sRemark").val(responseJson.remark);
                }else{
                    $("#sOrdYyMmPrid").data("kendoExtDropDownList").setDataSource([]);
                    $("#sRemark").val("");
                }

                if( ordTpCd == "N1" ){
                    $("#sOrdDtS").data("kendoDatePicker").value("");
                    $("#sOrdDtE").data("kendoDatePicker").value("");

                    $(".group-OrdDt1").hide();
                    $(".group-OrdDt2").show();
                    $(".group-rmk1").show();
                    $(".group-rmk2").hide();

                }else{
                    if( $("#sOrdDtS").data("kendoDatePicker").value() == ""
                            || $("#sOrdDtS").data("kendoDatePicker").value() == null ){
                        $("#sOrdDtS").data("kendoDatePicker").value(fifteenDayBf);
                        $("#sOrdDtE").data("kendoDatePicker").value(sysDate);
                    }
                    $("#sRemark").val("");

                    $(".group-OrdDt1").show();
                    $(".group-OrdDt2").hide();
                    $(".group-rmk1").hide();
                    $(".group-rmk2").show();
                }

            }else{
                $("#sOrdYyMmPrid").data("kendoExtDropDownList").setDataSource([]);
                $("#sRemark").val("");
            }

            $("#sCarlineCd").data("kendoExtDropDownList").value("");
            $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sModelCd").data("kendoExtDropDownList").enable(false);
            $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sOcnCd").data("kendoExtDropDownList").enable(false);
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

            $("#sOrdQty").data("kendoExtNumericTextBox").value(1);
            $("#sRefOrdQty").data("kendoExtNumericTextBox").value(0);
            $("#sPfpExamDt").val("");
            $("#sOrdGradeCd").val("");
            $("#carRetlAmt").data("kendoExtNumericTextBox").value(0);
        }
        ,optionLabel:" "  // 선택
        ,value:"N1"
     });

     $("#sOrdTp").on("change", function (){
         if( !dms.string.isEmpty($(this).data("kendoExtDropDownList").value()) ){
             bf_selectOrdYyMmPrid();        // // 주문주차에 따른 납기예시일 조회
         }
     });

     // 주문주차
     $("#sOrdYyMmPrid").kendoExtDropDownList({
         dataTextField:"btoYmwNm"
        ,dataValueField:"btoYmwCd"
        ,dataSource:ordYyMmPridList
        ,optionLabel:" "
        ,index:ordYyMmPridList.length
     });

     $("#sOrdYyMmPrid").on("change", function (){
         if( !dms.string.isEmpty($(this).data("kendoExtDropDownList").value()) ){
             bf_selectOrdYyMmPrid();       // 주문주차에 따른 납기예시일 조회
             bf_selectRefOrdQty();         // 참고수량 조회
         }
     });

     if(ordYyMmPridList != null && ordYyMmPridList.length > 0){
         $("#sRemark").val( ordYyMmPridList[ordYyMmPridList.length - 1].remark );
     }

     bf_selectOrdYyMmPrid();


     // 운송딜러
     $("#sTrsfDlrCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:trsfDlrCdList
        ,index:0
     });

    /**
     * 차종 콤보박스
     */
    $("#sCarlineCd").kendoExtDropDownList({
         dataTextField:"carlineNm"
        ,dataValueField:"carlineCd"
        ,dataSource:carLineCdList
        ,select:function(e){
            $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sModelCd").data("kendoExtDropDownList").enable(true);

            $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sOcnCd").data("kendoExtDropDownList").enable(false);

            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

            $("#carRetlAmt").data("kendoExtNumericTextBox").value(0);

            var dataItem = this.dataItem(e.item);
            if(dataItem.carlineCd == ""){
                $("#sModelCd").data("kendoExtDropDownList").enable(false);
                return false;
            }
            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/orm/btoCreateOrder/selectModel.do' />"
                ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
                ,async:false
            });

            $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

            $("#sOrdQty").data("kendoExtNumericTextBox").value("1");
        }
        ,optionLabel:" "
    });
    $("#sCarlineCd").on("change", function (){
        if( !dms.string.isEmpty($(this).data("kendoExtDropDownList").value()) ){
            bf_selectRefOrdQty();         // 참고수량 조회
        }
    });

    /**
    * 모델 콤보박스
    */
    $("#sModelCd").kendoExtDropDownList({
        dataTextField:"modelNm"
       ,dataValueField:"modelCd"
       ,select:function(e){
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(true);

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           $("#carRetlAmt").data("kendoExtNumericTextBox").value(0);
           var dataItem = this.dataItem(e.item);
           if(dataItem.modelCd == ""){
               $("#sOcnCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson;
           if($("#sOrdTp").data("kendoExtDropDownList").value() == ""){
               dms.notification.info("<spring:message code='global.lbl.orderType' var='globalLblOrderType' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblOrderType},' />"); // 주문유형을 선택해주세요.
               return false;
           }else if($("#sOrdTp").data("kendoExtDropDownList").value() != "AS"){

               /**
                * 정규오더(전략오더(AS)를 제외한 모든 오더)
                *:SAP에서 인터페이스를 받은 SA_0157T(OCN블락정보)를 참조해서 오더 제한
                */
               responseJson = dms.ajax.getJson({
                   url:"<c:url value='/sal/orm/btoCreateOrder/selectBtoOcn.do' />"
                   ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").data("kendoExtDropDownList").value(), "modelCd":dataItem.modelCd})
                   ,async:false
               });

           }else{
               // 전략오더 OCN조회
               responseJson = dms.ajax.getJson({
                   url:"<c:url value='/sal/orm/btoCreateOrder/selectStrOcn.do' />"
                   ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").data("kendoExtDropDownList").value(), "modelCd":dataItem.modelCd})
                   ,async:false
               });
           }
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

           $("#sOrdQty").data("kendoExtNumericTextBox").value("1");
       }
       ,optionLabel:" "
    });
    $("#sModelCd").data("kendoExtDropDownList").enable(false);

    /**
    * OCN 콤보박스
    */
    $("#sOcnCd").kendoExtDropDownList({
         dataTextField:"ocnNm"
        ,dataValueField:"ocnCd"
        ,select:function(e){
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(true);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

            if(this.dataItem(e.item).ocnCd == ""){
                $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }
            $("#carRetlAmt").data("kendoExtNumericTextBox").value(Number(this.dataItem(e.item).msPrc));    // 지도가

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/orm/btoCreateOrder/selectBtoExtColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
        ,optionLabel:" "
    });
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);
    $("#sOcnCd").on("change", function (){
        if( !dms.string.isEmpty($(this).data("kendoExtDropDownList").value()) ){

            // 주문유형이 전략오더일 경우 참고수량 SA_0136T 의 현재고수량 조회.
            if( $("#sOrdTp").data("kendoExtDropDownList").value() == "AS" ){

                var carlineCd = $("#sCarlineCd").data("kendoExtDropDownList").value()
                  , modelCd   = $("#sModelCd").data("kendoExtDropDownList").value()
                  , ocnCd     = $(this).data("kendoExtDropDownList").value();

                var responseJson = dms.ajax.getJson({
                    url:"<c:url value='/sal/orm/btoCreateOrder/selectASOrdRefOrdQtyChkSearch.do'/>"
                    ,data:JSON.stringify({"sCarlineCd":carlineCd, "sModelCd":modelCd, "sOcnCd":ocnCd})
                    ,async:false
                });

                if(dms.string.strNvl(responseJson) != ""){
                    $("#sRefOrdQty").data("kendoExtNumericTextBox").value(Number(responseJson));      // 참고수량
                }else{
                    bf_selectRefOrdQty();           // 참고수량 조회
                }
            }

        }
    });

    /**
    * 외장색 콤보박스
    */
    $("#sExtColorCd").kendoExtDropDownList({
        dataTextField:"extColorNm"
       ,dataValueField:"extColorCd"
       ,select:function(e){
           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(true);

           if(this.dataItem(e.item).ocnCd == ""){
               $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/orm/btoCreateOrder/selectBtoIntColor.do' />"
               ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
               ,async:false
           });
           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
       ,optionLabel:" "
    });
    $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

    /**
    * 내장색 콤보박스
    */
    $("#sIntColorCd").kendoExtDropDownList({
        dataTextField:"intColorNm"
       ,dataValueField:"intColorCd"
       ,select:function(e){
           var intColorCd = this.dataItem(e.item).intColorCd;

           if(intColorCd == ""){
               $("#sOrdGradeCd").val("");
               return;
           }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/orm/btoCreateOrder/selectOrdGradeCd.do'/>"
                ,data:JSON.stringify({ "sCarlineCd":$("#sCarlineCd").data("kendoExtDropDownList").value()
                                       , "sModelCd":$("#sModelCd").data("kendoExtDropDownList").value()
                                       , "sOcnCd":$("#sOcnCd").data("kendoExtDropDownList").value()
                                       , "sExtColorCd":$("#sExtColorCd").data("kendoExtDropDownList").value()
                                       , "sIntColorCd":intColorCd })
                ,async:false
            });

            if( responseJson.data.length > 0 ){
                $("#sOrdGradeCd").val(responseJson.data[0].ordGradeCd);     //주문등급
            }else{
                $("#sOrdGradeCd").val("");
            }

       }
       ,optionLabel:" "
    });
    $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

    //판매고문
    $("#sSaleRgstId").kendoExtDropDownList({
        dataTextField :"saleEmpNm"
       ,dataValueField:"saleEmpCd"
       ,dataSource:selectSaleEmpDSList
       ,optionLabel:" "
    });

    //주문수량
    $("#sOrdQty").kendoExtNumericTextBox({
        min:1,
        format:"n0"
    });

    //시작일자 (From)
    $("#sOrdDtS").kendoDatePicker({
        value:fifteenDayBf
       ,format:"{0:<dms:configValue code='dateFormat' />}"
    });

    //종료일자 (From)
    $("#sOrdDtE").kendoDatePicker({
        value:sysDate
       ,format:"{0:<dms:configValue code='dateFormat' />}"
    });

    // 총주문수량
    $("#totOrdQty").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0
       ,value:0
       ,spinners:false
    });

    // 참고수량
    $("#sRefOrdQty").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0
       ,value:0
       ,spinners:false
    });

    //지도가
    $("#carRetlAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });


	//버튼 - 조회
	$("#btnSearch").kendoButton({
	    click:function(e) {

	        var strOrdTp = $("#sOrdTp").data('kendoExtDropDownList').value();
            var strOrdYyMmPrid = $("#sOrdYyMmPrid").data('kendoExtDropDownList').value();
            var dtOrdDtS = $("#sOrdDtS").data('kendoDatePicker').value();
            var dtOrdDtE = $("#sOrdDtE").data('kendoDatePicker').value();

            if( strOrdTp == "N1" ){
                if( strOrdYyMmPrid == null || strOrdYyMmPrid == '' ){
                    dms.notification.info("<spring:message code='global.lbl.orderWeek' var='orderWeek' /><spring:message code='global.info.chkSelectItemMsg' arguments='${orderWeek},' />"); // 주문주차
                    return;
                }
            }else if( strOrdTp == "AD"){
                if( dtOrdDtS == null || dtOrdDtE == null ){
                    dms.notification.info("<spring:message code='global.lbl.orderRegDt' var='orderRegDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${orderRegDt},' />"); // 주문등록일
                    return;
                }
            }

	        $('#grid').data('kendoExtGrid').dataSource.read();
	    }
	});

	    //버튼 - 초기화
        $("#btnReset").kendoButton({
            click:function(e) {
                refreshAll();
            }
        });

        //버튼 - 주문제보
        $("#btnOrderConfirm").kendoButton({
            click:function(e) {

                var arrInsert = [];
                var arrUpdate = [];

                var grid = $("#grid").data("kendoExtGrid");
                //var rows = grid.select();
                var rows = grid.tbody.find("tr");

                if(rows.length  == 0 ){
                    dms.notification.info("<spring:message code='global.lbl.car' var='car' /><spring:message code='global.info.chkSelectItemMsg' arguments='${car},' />"); // 차량을 선택해주세요.
                    return false;
                }else{
                    var check = true;
                    rows.each(function(index, row) {
                        var dataItem = grid.dataItem(row);
                        var strMesg = "<spring:message code='global.info.emptyCheckParam' />";

                        if( dms.string.isEmpty(dataItem.ordDt)
                                || kendo.toString(dataItem.ordDt,"<dms:configValue code='dateFormat' />" ) == sysDate ){

                            if( dataItem.ordProrCd == null || dataItem.ordProrCd == "" ){
                                dms.notification.info("<spring:message code='sal.lbl.assignPror' var='assignPror' /><spring:message code='global.info.emptyCheckParam' arguments='${assignPror},' />"); // 배정우선순위
                                check = false;
                                return false;
                            }

                            if( dataItem.isNew() ){
                                arrInsert.push(dataItem);
                            }else{
                                if( dataItem.dirty ){
                                    //dataItem["saleRgstId"] = $("#sSaleRgstId").data("kendoExtDropDownList").value();
                                    arrUpdate.push(dataItem);
                                }
                            }
                        }

                    });

                    if( !check ){
                        return;
                    }
                }

                if(arrInsert.length + arrUpdate.length == 0){
                    //변경된 정보가 없습니다.
                      dms.notification.info("<spring:message code='global.info.required.change'/>");
                      return;
                }

                var saveData = { "insertList":arrInsert
                                ,"updateList":arrUpdate}
                $.ajax({
                    url:"<c:url value='/sal/orm/btoCreateOrder/saveBtoCreateOrder.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus){
                        grid.dataSource._destroyed = [];
                        grid.dataSource.read();

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }
        });
        //버튼 - 적용
	    $("#btnApply").kendoButton({
	        //icon:"plus",
	        click:function(e){
	            var chkFlag = true;

	            var ordYyMmPrid = $("#sOrdYyMmPrid").data('kendoExtDropDownList').value();
	            var carlineCd = $("#sCarlineCd").data('kendoExtDropDownList').value();
	            var modelCd = $("#sModelCd").data('kendoExtDropDownList').value();
	            var ocnCd = $("#sOcnCd").data('kendoExtDropDownList').value();
	            var extColorCd = $("#sExtColorCd").data('kendoExtDropDownList').value();
	            var intColorCd = $("#sIntColorCd").data('kendoExtDropDownList').value();
                var orderQty = $("#sOrdQty").data("kendoExtNumericTextBox").value();
	            var trsfDlrCd = $("#sTrsfDlrCd").data('kendoExtDropDownList').value();

	            var strMesg = "<spring:message code='global.info.chkSelectItemMsg' />";

	            if( ordYyMmPrid == null || ordYyMmPrid == "" ){
	                chkFlag = false;
	                dms.notification.info("<spring:message code='global.lbl.orderWeek' var='orderWeek' /><spring:message code='global.info.chkSelectItemMsg' arguments='${orderWeek},' />"); // 주문주차를 선택해주세요.
	            }else if( carlineCd == null || carlineCd == "" ){
                    chkFlag = false;
                    dms.notification.info("<spring:message code='global.lbl.carLine' var='carLine' /><spring:message code='global.info.chkSelectItemMsg' arguments='${carLine},' />"); // 차종을 선택해주세요.
                }else if( modelCd == null || modelCd == "" ){
                    chkFlag = false;
                    dms.notification.info("<spring:message code='global.lbl.model' var='model' /><spring:message code='global.info.chkSelectItemMsg' arguments='${model},' />"); // 모델을 선택해주세요.
                }else if( ocnCd == null || ocnCd == "" ){
                    chkFlag = false;
                    dms.notification.info("<spring:message code='global.lbl.ocn' var='ocn' /><spring:message code='global.info.chkSelectItemMsg' arguments='${ocn},' />"); // OCN을 선택해주세요.
                }else if( extColorCd == null || extColorCd == "" ){
                    chkFlag = false;
                    dms.notification.info("<spring:message code='global.lbl.extColor' var='extColor' /><spring:message code='global.info.chkSelectItemMsg' arguments='${extColor},' />"); // 외장색을 선택해주세요.
                }else if( intColorCd == null || intColorCd == "" ){
                    chkFlag = false;
                    dms.notification.info("<spring:message code='global.lbl.intColor' var='intColor' /><spring:message code='global.info.chkSelectItemMsg' arguments='${intColor},' />"); // 내장색을 선택해주세요.
                }else if( orderQty == null || orderQty == "" ){
                    chkFlag = false;
                    dms.notification.info("<spring:message code='global.lbl.orderQty' var='orderQty' /><spring:message code='global.info.chkSelectItemMsg' arguments='${orderQty},' />"); // 주문수량을 선택해주세요.
                }else if( trsfDlrCd == null || trsfDlrCd == "" ){
                    chkFlag = false;
                    dms.notification.info("<spring:message code='sal.lbl.trsfDealer' var='trsfDealer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${trsfDealer},' />"); // 운송딜러를 선택해주세요.
                }

	            if( chkFlag ){
	                for(var i = 1; i <= orderQty; i++){

	                    $('#grid').data('kendoExtGrid').dataSource.insert(0,
	                            {ordNo:""
	                            ,ordTp:$("#sOrdTp").data('kendoExtDropDownList').value()
	                            ,ordYyMmDt:ordYyMmPrid.substring(0, 6)
	                            ,ordPrid:ordYyMmPrid.substring(6, 8)
	                            ,carlineCd:carlineCd
	                            ,modelCd:modelCd
	                            ,ocnCd:ocnCd
	                            ,extColorCd:extColorCd
	                            ,intColorCd:intColorCd
	                            ,trsfDlrCd:trsfDlrCd
	                            ,ordStatCd:""
	                            ,carlineNm:$("#sCarlineCd").data('kendoExtDropDownList').text()
	                            ,modelNm:$("#sModelCd").data('kendoExtDropDownList').text()
	                            ,ocnNm:$("#sOcnCd").data('kendoExtDropDownList').text()
	                            ,extColorNm:$("#sExtColorCd").data('kendoExtDropDownList').text()
	                            ,intColorNm:$("#sIntColorCd").data('kendoExtDropDownList').text()
	                            ,ordQty:"1"
	                            ,ordGradeCd:$("#sOrdGradeCd").val()
	                            ,trsfDlrNm:$("#sTrsfDlrCd").data('kendoExtDropDownList').text()
	                            ,ordProrCd:""
	                            ,ordStatCd:""
	                            //,saleRgstId:$("#sSaleRgstId").data("kendoExtDropDownList").value()
	                            ,remark:""
	                            });
	                }

	                $('#grid').data('kendoExtGrid').refresh();
	            }
	        }
	    });

	    //버튼 - 주문금액확인
        $("#btnOrdAmt").kendoButton({
            //icon:"plus",
            click:function(e){
                var arrSelectVeh = [];

                var grid = $("#grid").data("kendoExtGrid");
                var rows = grid.select();

                if(rows.length  == 0 ){
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return false;
                }else{

                    rows.each(function(index, row) {
                        var dataItem = grid.dataItem(row);
                        // 체크여부
                        var check = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                        // 체크된 문서만 불출 취소.
                        if(check){
                            arrSelectVeh.push(dataItem);
                        }
                    });

                    orderAmtSearchPopup(arrSelectVeh);
                }
            }
        });

	    //버튼 - 우선순위 부여
	    $("#btnPriority").kendoButton({
	        //icon:"undo",
	        click:function(e){

	            var carlineCd = "";
                var modelCd = "";
                var ocnCd = "";
                var extColorCd = "";
                var intColorCd = "";
                var ordProrCd = "";

	            var grid = $("#grid").data("kendoExtGrid");
                var rows = grid.tbody.find("tr");
                var items = grid.dataSource.data();
                var gridData;

                rows.each(function(index, row) {

                    gridData = grid.dataItem(rows[index]);

                    if( (gridData.ordNo == "" || gridData.ordNo == null)
                            && (gridData.ordProrCd == "" || gridData.ordProrCd == null) ){

                        if(carlineCd == "" || ( carlineCd != gridData.carlineCd
//                                             || modelCd != gridData.modelCd
//                                             || ocnCd != gridData.ocnCd
//                                             || extColorCd != gridData.extColorCd
//                                             || intColorCd != gridData.intColorCd
                                             )){

                            carlineCd = gridData.carlineCd;
//                            modelCd = gridData.modelCd;
//                            ocnCd = gridData.ocnCd;
//                            extColorCd = gridData.extColorCd;
//                            intColorCd = gridData.intColorCd;

                            var responseJson = dms.ajax.getJson({
                                url:"<c:url value='/sal/orm/btoCreateOrder/selectOrdProrCd.do'/>"
                                ,data:JSON.stringify({"carlineCd":carlineCd
//                                                       ,"modelCd":modelCd
//                                                       ,"ocnCd":ocnCd
//                                                       ,"extColorCd":extColorCd
//                                                       ,"intColorCd":intColorCd
                                                       })
                                ,async:false
                            });

                            ordProrCd = responseJson.data[0].ordProrCd
                        }else{
                           ordProrCd = "000" + (parseInt(ordProrCd) + 1);
                           ordProrCd = ordProrCd.substr(ordProrCd.length - 4, 4);
                        }

                    }else{
                        ordProrCd = gridData.ordProrCd;
                    }
                    items[index].ordProrCd = ordProrCd;
                });
                grid.dataSource.data(items);
	        }
	    });

	    //버튼 - 선택 주문삭제
        $("#btnOrdDelete").kendoButton({
            //icon:"undo",
            click:function(e){

                var grid = $("#grid").data("kendoExtGrid");
                var rows = grid.select();

                if (rows.length < 1) {
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }
                if(!confirm("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.cnfrmMsg' arguments='${del},' />")){
                    return;
                }

                var gridData;
                var delList = [];

                var check = true;
                rows.each(function(index, row) {
                    gridData = grid.dataItem(row);

                    if( gridData.ordNo != "" && gridData.ordNo != null ){
                        var gridOrdDt = new Date(gridData.ordDt);
                        if( kendo.toString(gridOrdDt,"<dms:configValue code='dateFormat' />" ) != sysDate ){
                            dms.notification.info("<spring:message code='sal.info.chkBtoCreateOrderDeleteDt' />"); // 당일 주문생성만 삭제가 가능합니다.
                            check = false;
                            return false;
                        }

                        if(gridData.ifresultRtn == "N"){
                            dms.notification.info("<spring:message code='sal.info.erpResultRtn' />"); // 미전송건은 삭제할수 없습니다.
                            check = false;
                            return false;
                        }

                        delList.push(gridData);
                    }
                });
                if( !check ){
                    return;
                }

                rows.each(function(index, row) {
                    grid.removeRow($(this).closest('tr'));
                });

                if( delList.length > 0 ){
                    var data = {"deleteList":delList};

                    $.ajax({
                        url:"<c:url value='/sal/orm/btoCreateOrder/deleteBtoCreateOrder.do' />",
                        data:JSON.stringify(data),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        },
                        success:function(jqXHR, textStatus){

                            grid.dataSource._destroyed = [];
                            grid.dataSource.page(1);

                          //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }

            }
        });
        //그리드 1번
    	$("#grid").kendoExtGrid({
    	    gridId:"G-SAL-0721-114401"
           	,dataSource:{
               	transport:{
                     read:{
                         url:"<c:url value='/sal/orm/btoCreateOrder/selectBtoCreateOrder.do' />"
                     }
                    ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};
                             params["recordCountPerPage"] = options.pageSize;
                             params["pageIndex"] = options.page;
                             params["firstIndex"] = options.skip;
                             params["lastIndex"] = options.skip + options.take;
                             params["sort"] = options.sort;

                             var strOrdTp = $("#sOrdTp").data('kendoExtDropDownList').value();
                             var strOrdYyMmPrid = $("#sOrdYyMmPrid").data('kendoExtDropDownList').value();
                             var dtOrdDtS = $("#sOrdDtS").data('kendoDatePicker').value();
                             var dtOrdDtE = $("#sOrdDtE").data('kendoDatePicker').value();

                             params["sOrdTp"] = strOrdTp;
                             params["sOrdYyMmPrid"] = strOrdYyMmPrid;
                             params["sOrdDtS"] = dtOrdDtS;
                             params["sOrdDtE"] = dtOrdDtE;
                             params["sCarlineCd"] = $("#sCarlineCd").data('kendoExtDropDownList').value();

                             return kendo.stringify(params);
                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,schema:{
                      model:{
                          id:"ordNo"
                          ,fields:{
                              ordNo:{type:"string", editable:false} //
                              ,carlineCd:{type:"string", hidden:true, validation:{required:true}} //
                              ,modelCd:{type:"string", hidden:true, validation:{required:true}} //
                              ,ocnCd:{type:"string", hidden:true, validation:{required:true}} //
                              ,extColorCd:{type:"string", hidden:true, validation:{required:true}} //
                              ,intColorCd:{type:"string", hidden:true, validation:{required:true}} //
                              ,trsfDlrCd:{type:"string", hidden:true} //
                              ,ordStatCd:{type:"string", hidden:true} //
                              ,ordDt:{type:"date", editable:false} //Seq
                              ,carlineNm:{type:"string", editable:false} //
                              ,modelNm:{type:"string", editable:false} //
                              ,ocnNm:{type:"string", editable:false} //
                              ,extColorNm:{type:"string", editable:false} //
                              ,intColorNm:{type:"string", editable:false} //
                              ,ordQty:{type:"number", editable:false} //
                              ,ordGradeCd:{type:"string", editable:false} //
                              //,paymentCd:{type:"number", hidden:true} //
                              ,trsfDlrNm:{type:"string", editable:false} //
                              ,ordProrCd:{type:"string", validation:{required:true}} //
                              ,ordStatCd:{type:"string", editable:false} //
                              ,saleRgstId:{type:"string", editable:false} //
                              ,ifresultRtn:{type:"string", editable:false} //
                              ,remark:{type:"string", editable:false}
                          }
                     }
                 }
            }
        	,dataBound:function(e) {
                var rows = e.sender.tbody.children();
                var qty = 0;
                $.each(rows, function(idx, row){
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem.ordQty != null){
                        qty += Number(dataItem.ordQty);
                    }
                });
                $("#totOrdQty").data("kendoExtNumericTextBox").value(qty);
            }
        	,height :414
        	,multiSelectWithCheckbox:true
            ,indvColumnVisible:false          //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:false         //빈컬럼 적용. default:false
            ,enableTooltip:false             //Tooltip 적용, default:false
            ,autoBind:false
            ,edit:function(e){
                var eles = e.container.find("input");
                var fieldName;
                if(eles.length > 1){
                    fieldName = eles[eles.length-1].getAttribute("name");
                }else{
                    fieldName = eles.attr("name");
                }
                var input = e.container.find(".k-input");

                if(fieldName == "ordProrCd"){
                    if( dms.string.isNotEmpty(e.model.ordDt) && kendo.toString(e.model.ordDt,"<dms:configValue code='dateFormat' />" ) != sysDate ){
                        this.closeCell();
                    }
                }
            }
            ,columns:[
                {field:"ordNo", title:"<spring:message code='global.lbl.ordNo' />"
                    ,width:60
                    ,attributes:{"class":"ac"}
                    ,footerAttributes:{style:"visibility:hidden;"}
                    ,hidden:true
                }  // 주문번호
                ,{field:"carlineCd", hidden:true }  // 차종코드
                ,{field:"modelCd", hidden:true }  // 모델코드
                ,{field:"ocnCd", hidden:true }  // ocn코드
                ,{field:"extColorCd", hidden:true }  // 외장색 코드
                ,{field:"intColorCd", hidden:true }  // 내장색 코드
                ,{field:"trsfDlrCd", hidden:true }  // 운송딜러
                ,{field:"ordStatCd", hidden:true }  // 상태 코드
                ,{field:"ordDt", title:"<spring:message code='global.lbl.chrgDt' />"
                    ,width:75
                    ,headerAttributes:{style:"text-align:center;"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,attributes:{ "style":"text-align:center"}
                }  // 주문일
                ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />"
                    , width:70
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 차종
                ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />"
                    ,width:110
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 모델
                ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocn' />"
                    ,width:110
                    ,headerAttributes:{style:"text-align:center;"}
                }  // OCN
                ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />"
                    ,width:60
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 외장색
                ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />"
                    ,width:60
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 내장색
                ,{field:"ordQty", title:"<spring:message code='global.lbl.orderQty' />"
                    ,width:35
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:right"}
                }  // 주문수량
                ,{field:"ordGradeCd", title:"<spring:message code='global.lbl.orderGrade' />"
                    ,width:35
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{"class":"ac"}
                }  // 주문등급
                /*
                ,{field:"paymentCd", title:"지불방식"
                    ,width:55
                    ,headerAttributes:{style:"text-align:center;"}
                }*/
                ,{field:"ordProrCd", title:"<spring:message code='sal.lbl.assignPror' />"
                    ,width:40
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{"class":"ar"}
                    ,editor:function(container, options) {
                        if(!options.model.isNew()){
                            container.context.innerText = dms.string.strNvl(options.model.ordProrCd);
                            return ;
                        }

                        $('<input name="ordProrCd" type="text" maxlength="4" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoMaskedTextBox({
                             mask:"0000"
                            ,change:function(e){
                                var value = this.value();
                                var pValue = value.replace(/\_/g, '');

                                if(pValue.length > 0){
                                    while(pValue.length < 4){
                                        pValue = '0' + pValue;
                                    }
                                    options.model.ordProrCd = pValue;
                                }
                            }
                        });
                        $('<span class="k-invalid-msg" data-for="ordProrCd"></span>').appendTo(container);
                    }
                }  // 배정우선순위
                ,{field:"trsfDlrCd", title:"<spring:message code='sal.lbl.trsfDealer' />"
                    ,width:55
                    ,attributes:{"class":"ac"}
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 운송딜러
                /* ,{field:"ordStatCd", title:"<spring:message code='global.lbl.statNm' />"
                    ,width:35
                    ,template:"#=ordStatCdMap[ordStatCd].cmmCdNm#"
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:center"}
                }  */ // 상태
                ,{field:"saleRgstId", title:"<spring:message code='sal.lbl.salesAdvisor' />"
                    ,width:80
                    ,template:"#= dms.string.strNvl(selectSaleEmpDSObj[saleRgstId]) #"
                    ,headerAttributes:{"class":"ac"}
                    ,attributes:{"class":"ac"}
                }  // 판매고문
                ,{field:"ifresultRtn", title:"<spring:message code='sal.lbl.infStatNm' />"
                    ,width:90 ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                         var spanObj = "";
                         switch(dataItem.ifresultRtn){
                             case "E"://인터페이스 실패
                                 spanObj = "<span class='txt_label bg_yellow'>"+dms.string.strNvl(interfaceStatCdInfoObj[dataItem.ifresultRtn])+"</span>";
                                 break;
                             case "Z"://인터페이스 성공
                                 spanObj = "<span class='txt_label bg_green'>"+dms.string.strNvl(interfaceStatCdInfoObj[dataItem.ifresultRtn])+"</span>";
                                 break;
                             case "N"://인터페이스 중
                                 spanObj = "<span class='txt_label bg_blue'>"+dms.string.strNvl(interfaceStatCdInfoObj[dataItem.ifresultRtn])+"</span>";
                                 break;
                             default:
                                 //spanObj = "<span class='txt_label bg_gray'>"+dms.string.strNvl(interfaceStatCdInfoObj[dataItem.ifresultRtn])+"</span>";
                                 break;
                         }
                         return spanObj;
                    }
                  } // 인터페이스상태
                ,{field:"remark", title:"<spring:message code='global.lbl.remark' />"
                    ,width:150
                    ,attributes:{"class":"al"}
                    ,hidden:true
                } // 비고
            ]
    	});

}); //document.ready End
/**
 * 참고수량 조회
 **/
function bf_selectRefOrdQty(){
    var carlineCd = $("#sCarlineCd").data("kendoExtDropDownList").value()
      , ymwCd = $("#sOrdYyMmPrid").data("kendoExtDropDownList").value();

    if( carlineCd == "" || ymwCd == ""){
        $("#sRefOrdQty").data("kendoExtNumericTextBox").value(0);
        return false;
    }

    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/sal/orm/btoCreateOrder/selectOrdRefQty.do'/>"
        ,data:JSON.stringify({"sCarlineCd":carlineCd, "sOrdYyMmPrid":ymwCd})
        ,async:false
    });

    if( responseJson.data.length > 0 ){
        $("#sRefOrdQty").data("kendoExtNumericTextBox").value(Number(responseJson.data[0].ordRefQty));
    }else{
        $("#sRefOrdQty").data("kendoExtNumericTextBox").value(0);
    }
}

/**
 * 납기예시일 조회
 **/
function bf_selectOrdYyMmPrid() {
    var ymwCd = $("#sOrdYyMmPrid").data("kendoExtDropDownList").value();
    var ordTp = $("#sOrdTp").data("kendoExtDropDownList").value();

    if( ymwCd == "" || ordTp == ""){
        $("#sPfpExamDt").val("");
        return false;
    }

    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/sal/orm/btoCreateOrder/selectPfpExamDt.do'/>"
        ,data:JSON.stringify({"sOrdYyMmPrid":ymwCd, "sOrdTp":ordTp})
        ,async:false
    });

    if( responseJson.data.length > 0 ){
        $("#sPfpExamDt").val(responseJson.data[0].pfpExamDt);
    }else{
        $("#sPfpExamDt").val("");
    }
}

function complete(jqXHR, textStatus){
	var response = jQuery.parseJSON(jqXHR.responseText);
	globalNotification.show(response["result"], "info");
}

refreshAll = function() {
    $("#sOrdTp").data("kendoExtDropDownList").value("N1");

    $("#sOrdYyMmPrid").data("kendoExtDropDownList").setDataSource(ordYyMmPridList);
    $("#sOrdYyMmPrid").data("kendoExtDropDownList").select(ordYyMmPridList.length);

    $("#sOrdDtS").data("kendoDatePicker").value(fifteenDayBf);
    $("#sOrdDtE").data("kendoDatePicker").value(sysDate);

    $("#sCarlineCd").data("kendoExtDropDownList").value("");
    $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
    $("#sModelCd").data("kendoExtDropDownList").enable(false);
    $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);
    $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
    $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

    $("#sOrdQty").data("kendoExtNumericTextBox").value(1);
    $("#sRefOrdQty").data("kendoExtNumericTextBox").value(0);
    $("#sPfpExamDt").val("");
    $("#sOrdGradeCd").val("");

    $("#sRemark").val("");
    $("#sSaleRgstId").data("kendoExtDropDownList").value('');
}

-->
</script>
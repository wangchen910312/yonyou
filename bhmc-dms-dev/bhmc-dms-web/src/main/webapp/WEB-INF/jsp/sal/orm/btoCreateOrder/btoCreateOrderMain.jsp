<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<style type="text/css">
.form_readonly_text_red {background-color:#dbdbdb!important; -webkit-text-fill-color:#da1d1d; color:#da1d1d!important; -webkit-opacity:1; opacity:1;}
</style>

    <!-- BTO 주문생성 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.createOrder" /></h1> <!-- 주문생성 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-D-10959" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m" id="btnOrderConfirm"><spring:message code="sal.btn.cnfrmOrder" /></button> <!-- 주문제보 -->
                </dms:access>
                <dms:access viewId="VIEW-D-10958" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button> <!-- 초기화 -->
                </dms:access>
                <dms:access viewId="VIEW-D-10957" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                </dms:access>
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_100per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:20%;">
                    <col style="width:8%;">
                    <col style="width:25%;">
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
                        <th scope="row" class="group-OrdDt1"><span class="bu_required"><spring:message code="global.lbl.orderRegDt" /></span></th> <!-- 주문등록일 -->
                        <td class="group-OrdDt1 required_area" >
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
                        <th scope="row"><spring:message code="sal.lbl.exApplyDay" /></th> <!-- 예정공급일 -->
                        <td class="readonly_area">
                            <input name="sPfpExamDt" id="sPfpExamDt" type="text" value="" readonly class="form_input">
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
                            <input id="hiddenFscCode" type="hidden" />
                            <input id="hiddenFscName" type="hidden" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.ocn" /></th> <!-- OCN -->
                        <td class="required_area">
                            <input name="sOcnCd" id="sOcnCd" type="text" class="form_comboBox">
                            <input id="ocnNmVw" type="hidden" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.extIntColor' /></th>        <!-- 외장/내장색 -->
                        <td>
                            <input id="sExtColorCd" class="form_comboBox" style="width:49%"/>
                            <input id="sIntColorCd" class="form_comboBox" style="width:49%"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.orderQty" /></th> <!-- 주문수량 -->
                        <td class="required_area">
                            <input name="sOrdQty" id="sOrdQty" type="text" value="" class="form_numeric  ar" maxlength="2">
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.refValue" /></th> <!-- 참고수량 -->
                        <td class="readonly_area">
                            <input id="sRefOrdQty" name="sRefOrdQty" type="number" min="0" max="" class="form_numeric ar"  />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.orderGrade" /></th> <!-- 주문등급 -->
                        <td class="readonly_area">
                            <input name="sOrdGradeCd" id="sOrdGradeCd" type="text" value="" readonly class="form_input">
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.carRetlAmt' /></th> <!-- 지도가 -->
                        <td class="readonly_area">
                            <input id="carRetlAmt" name="carRetlAmt" type="number" min="0" max="" class="form_numeric ar"  />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="group-rmk1"><font color='#da1d1d'><spring:message code="sal.lbl.warInfo" /></font></th> <!-- 주의사항 -->
                        <td colspan="8" class="group-rmk1">
                            <textarea name="sRemark" id="sRemark" rows="2" cols="30" maxlength="1000" type="text" value="" readonly class="form_textarea form_readonly_text_red"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="header_area">
            <div class="btn_left">
                <ul class="txt_input child_borderNone">
                    <li>
                         <span class="form_numeric font_bold"><spring:message code='sal.lbl.totOrdQty' />&nbsp;:&nbsp;<span id="totOrdQty" name="totOrdQty">0</span></span>     <!-- 건수:-->
                    </li>
                </ul>
            </div>
            <div class="btn_right">
                <dms:access viewId="VIEW-D-10956" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnApply"><spring:message code="global.btn.add" /></button> <!-- 추가 -->
                </dms:access>
                <!--<button class="btn_s" id="btnOrdAmt"><spring:message code="sal.btn.cnfrmOrderAmt" /></button>  주문금액조회 -->
                <dms:access viewId="VIEW-D-10955" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnPriority"><spring:message code="sal.btn.prorGrant" /></button> <!-- 우선순위부여 -->
                </dms:access>
                <dms:access viewId="VIEW-D-10954" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnOrdDelete"><spring:message code="sal.btn.selOrderDelete" /></button> <!-- 선택주문삭제 -->
                </dms:access>
            </div>
        </div>
        <div class="table_grid">
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>

<script  type="text/javascript">

     var sysDate = "${sysDate}";
     var fifteenDayBf = "${fifteenDayBf}";
     var dlrCd   = "${dlrCd}";    // 딜러코드

     //체크목록 저장 변수
     var checkedListMap = {};

     /************* 주문유형 SELECT BOX  *******************/
     var ordTpList = [];
     <c:forEach var="obj" items="${ordTpInfo}">
     var cmmCdNm = "[" + "${obj.cmmCd}" + "]" + "${obj.cmmCdNm}"
       <c:if test="${obj.cmmCd eq 'N1' || obj.cmmCd eq 'AD'}">
         ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":cmmCdNm, "useYn":"${obj.useYn}"});
       </c:if>
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

    var ordYyMmPrid = $("#sOrdYyMmPrid").data('kendoExtDropDownList').value();

    orderAmtPopup = dms.window.popup({
        windowId:"orderAmtSearchPopup"
        ,title:"<spring:message code='sal.title.corporateAvailability' />"   // 법인 재고현황
        ,modal:true
        ,draggable:false
        ,width:1000
        ,height:520
        ,content:{
            url:"<c:url value='/sal/orm/btoCreateOrder/selectBtoCreateOrderPopup.do'/>"
            , data:{
                "autoBind":false
                ,"arrSelectVeh":arrSelectVeh
                ,"callbackFunc":function(callData){
                    $.each(callData, function(idx, data){
                        if(data.ordQty > 0){
                            for(var i = 1; i <= data.ordQty; i++){
                                $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                                    ordNo:""
                                   ,ordTp:$("#sOrdTp").data('kendoExtDropDownList').value()
                                   ,ordYyMmDt:ordYyMmPrid.substring(0, 6)
                                   ,ordPrid:ordYyMmPrid.substring(6, 8)
                                   ,carlineCd:data.carlineCd
                                   ,carlineNm:data.carlineNm
                                   ,modelCd:data.modelCd
                                   ,modelNm:data.modelNm
                                   ,ocnCd:data.ocnCd
                                   ,ocnNm:data.ocnNm
                                   ,extColorCd:data.extColorCd
                                   ,extColorNm:data.extColorNm
                                   ,intColorCd:data.intColorCd
                                   ,trsfDlrCd:dlrCd
                                   ,ordStatCd:""
                                   ,ordQty:"1"
                                   ,ordGradeCd:data.ordGradeCd
                                   ,carRetlAmt:data.msPrc
                                   ,ordProrCd:""
                                   ,ordStatCd:""
                                   ,saleRgstId:""
                                   ,remark:""
                               });
                          }
                        }
                    });
                    //정상적으로 반영 되었습니다.
                    //dms.notification.success("<spring:message code='global.info.success'/>");
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

            $("#sRemark").val("");
            $("#sOrdYyMmPrid").data("kendoExtDropDownList").value("");
            $("#sOrdYyMmPrid").data("kendoExtDropDownList").setDataSource([]);

            if( ordTpCd != null && ordTpCd != ""){
                var responseJson = dms.ajax.getJson({
                    url:"<c:url value='/sal/orm/btoCreateOrder/selectOrdWeekRemark.do'/>"
                    ,data:JSON.stringify({"sOrdTp":this.dataItem(e.item).cmmCd})
                    ,async:false
                });

                if(responseJson != null && responseJson.data.length > 0){
                    $("#sOrdYyMmPrid").data("kendoExtDropDownList").setDataSource(responseJson.data);  // 주차정보
                    $("#sOrdYyMmPrid").data("kendoExtDropDownList").value(responseJson.data[0].btoYmwCd);
                    $("#sRemark").val(responseJson.data[0].remark);
                }

                if( ordTpCd == "N1"){
                    $("#sOrdDtS").data("kendoDatePicker").value("");
                    $("#sOrdDtE").data("kendoDatePicker").value("");

                    $("#sOrdDtS").data("kendoDatePicker").enable(false);
                    $("#sOrdDtE").data("kendoDatePicker").enable(false);
                    $("#btnPriority").data("kendoButton").enable(true);
                }else{
                    if( $("#sOrdDtS").data("kendoDatePicker").value() == "" || $("#sOrdDtS").data("kendoDatePicker").value() == null ){
                        $("#sOrdDtS").data("kendoDatePicker").value(fifteenDayBf);
                        $("#sOrdDtE").data("kendoDatePicker").value(sysDate);
                    }
                    $("#sOrdDtS").data("kendoDatePicker").value(fifteenDayBf);
                    $("#sOrdDtE").data("kendoDatePicker").value(sysDate);
                    $("#sOrdDtS").data("kendoDatePicker").enable(true);
                    $("#sOrdDtE").data("kendoDatePicker").enable(true);
                    $("#btnPriority").data("kendoButton").enable(false);
                }
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
            //$("#sPfpExamDt").val("");
            $("#sOrdGradeCd").val("");
            $("#ocnNmVw").val("");
            $("#carRetlAmt").data("kendoExtNumericTextBox").value(0);
        }
        //,optionLabel:""  // 선택
        ,value:"N1"
     });

     $("#sOrdTp").on("change", function (){

/*          $("#sRemark").val("");
         $("#sOrdYyMmPrid").data("kendoExtDropDownList").value(""); */

         if( !dms.string.isEmpty($(this).data("kendoExtDropDownList").value()) ){
             bf_selectOrdYyMmPrid();        // // 주문주차에 따른 납기예시일 조회
         }

         $("#grid").data("kendoExtGrid").dataSource.data([]);
     });

     // 주문주차
     $("#sOrdYyMmPrid").kendoExtDropDownList({
         dataTextField:"btoYmwNm"
        ,dataValueField:"btoYmwCd"
        ,dataSource:ordYyMmPridList
     });

      $("#sOrdYyMmPrid").on("change", function (){
         if( !dms.string.isEmpty($(this).data("kendoExtDropDownList").value()) ){
             bf_selectOrdYyMmPrid();       // 주문주차에 따른 납기예시일 조회
             bf_selectRefOrdQty();         // 참고수량 조회
         }
     });

     if(ordYyMmPridList != null && ordYyMmPridList.length > 0){
         $("#sRemark").val(ordYyMmPridList[ordYyMmPridList.length - 1].remark);
     }

     bf_selectOrdYyMmPrid();

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
            $("#ocnNmVw").val("");

            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

            $("#sOrdGradeCd").val("");
            $("#carRetlAmt").data("kendoExtNumericTextBox").value(0);

            $("#hiddenFscCode").val("");
            $("#hiddenFscName").val("");

            var dataItem = this.dataItem(e.item);
            if(dataItem.carlineCd == ""){
                $("#sModelCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/orm/btoCreateOrder/selectStrN1BlockModel.do' />"
                ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
                ,async:false
                ,success:function(data) {
                    //console.log("data::::::::"+data);
                }

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
        dataTextField:"fscNm"
       ,dataValueField:"fscCd"
       ,select:function(e){
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(true);
           $("#ocnNmVw").val("");

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           $("#sOrdGradeCd").val("");
           $("#carRetlAmt").data("kendoExtNumericTextBox").value(0);

           $("#hiddenFscCode").val("");
           $("#hiddenFscName").val("");

           var dataItem = this.dataItem(e.item);

           if(dataItem.modelCd == ""){
               $("#sOcnCd").data("kendoExtDropDownList").enable(false);
               $("#ocnNmVw").val("");
               $("#sOrdGradeCd").val("");
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
                   url:"<c:url value='/sal/orm/btoCreateOrder/selectStrN1BlockOcn.do' />"
                   ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").val(), "fscCd":dataItem.fscCd})
                   ,async:false
               });

           }else{
               // 전략오더 OCN조회
               responseJson = dms.ajax.getJson({
                   url:"<c:url value='/sal/orm/btoCreateOrder/selectStrADBlockOcn.do' />"
                       ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").val(), "fscCd":dataItem.fscCd})
                       ,async:false
               });
           }
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

           $("#sOrdQty").data("kendoExtNumericTextBox").value("1");
       }
       //,optionLabel:" "
    });
    $("#sModelCd").data("kendoExtDropDownList").enable(false);
    $("#ocnNmVw").val("");

    /**
    * OCN 콤보박스
    */
    $("#sOcnCd").kendoExtDropDownList({
         dataTextField:"ocnNm"
        ,dataValueField:"ocnCd"
        ,select:function(e){

          if(Number(this.dataItem(e.item).modelCnt) > 1){
              //차종과 OCN 중복건으로 정상 사용이 불가능합니다.
              dms.notification.warning(this.dataItem(e.item).ocnCd+"<spring:message code='sal.info.modelOcnDupWrrMsg'/>");
              return false;
          }

            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(true);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

            if(this.dataItem(e.item).ocnCd == ""){
                $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
                //$("#ocnNmVw").val("");
                $("#sOrdGradeCd").val("");

                $("#hiddenFscCode").val("");
                $("#hiddenFscName").val("");

                return false;
            }

            //console.log("this.dataItem(e.item).fscpChmMmm>>>>>>"+this.dataItem(e.item).fscpChmMmm);

            $("#hiddenFscName").val(this.dataItem(e.item).fscpChmMmm);

            $("#ocnNmVw").val(this.dataItem(e.item).ocnNmPur);    // ocn명
            $("#carRetlAmt").data("kendoExtNumericTextBox").value(Number(this.dataItem(e.item).msPrc));    // 지도가

            var modelCd = $("#sModelCd").data("kendoExtDropDownList").value();
            var ocnCd   = this.dataItem(e.item).ocnCd;

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/orm/btoCreateOrder/selectBtoExtColor.do' />"
                   ,data:JSON.stringify({"modelCd":$("#hiddenFscCode").val(), "ocnCd":ocnCd})
                   ,async:false
                   ,success:function(data) {
                       $("#hiddenFscCode").val(e.dataItem.modelCd);
                   }
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

           if(this.dataItem(e.item).extColorCd == ""){
               $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
               $("#sOrdGradeCd").val("");
               return false;
           }

           var modelCd    = $("#sModelCd").data("kendoExtDropDownList").value();
           var ocnCd      = $("#sOcnCd").data("kendoExtDropDownList").value();
           var extColorCd = this.dataItem(e.item).extColorCd;

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/orm/btoCreateOrder/selectBtoIntColor.do' />"
                  ,data:JSON.stringify({"modelCd":$("#hiddenFscCode").val(), "ocnCd":ocnCd, "extColorCd":extColorCd})
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
                                       , "sModelCd":$("#hiddenFscCode").val()
                                       , "sOcnCd":$("#sOcnCd").data("kendoExtDropDownList").value()
                                       , "sExtColorCd":$("#sExtColorCd").data("kendoExtDropDownList").value()
                                       , "sIntColorCd":intColorCd })
                ,async:false
            });

            if( responseJson.data.length > 0 && responseJson.data[0] != null ){
                $("#sOrdGradeCd").val(responseJson.data[0].ordGradeCd);     //주문등급
            }else{
                $("#sOrdGradeCd").val("");
            }

       }
       ,optionLabel:" "
    });
    $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

    //판매고문
/*     $("#sSaleRgstId").kendoExtDropDownList({
        dataTextField :"saleEmpNm"
       ,dataValueField:"saleEmpCd"
       ,dataSource:selectSaleEmpDSList
       ,optionLabel:""
    }); */

    //주문수량
    $("#sOrdQty").kendoExtNumericTextBox({
        min:1
        ,max:999
        ,format:"n0"
        ,spinners : false
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

            $('#grid').data('kendoExtGrid').dataSource.page(1);
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

            var errorMessage = "";
            var isValid = true;
            var checkedList = [];
            var insertList = [];
            var updateList = [];
            var checkFlagForOrdProrCd = true;
            var grid = $("#grid").data("kendoExtGrid");
            var strOrdTp = $("#sOrdTp").data('kendoExtDropDownList').value();
            var dupChkCnt = 0;

            $.each($("input.grid-checkbox-item:checked", grid.tbody), function(idx, obj){
                checkedList.push($(obj).data("uid"));
            });

            if(checkedList.length == 0){
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            $.each(checkedList, function(idx, uid){
                var dataItem = grid.dataSource.getByUid(uid);

                if(dms.string.isEmpty(dataItem.ordProrCd)){
                    checkFlagForOrdProrCd = false;
                }

                if(isDupChkGrid(dataItem.ordProrCd, dataItem.carlineCd)){
                    dupChkCnt = dupChkCnt+1;
                }

                if(dataItem.isNew()){
                    insertList.push(dataItem);
                }else if(dataItem.dirty){
                    updateList.push(dataItem);
                }

            });

            //배정우선순위 입력값 체크
            if(strOrdTp == "N1"){
                if(!checkFlagForOrdProrCd){
                    dms.notification.info("<spring:message code='sal.lbl.assignPror' var='assignPror' /><spring:message code='global.info.emptyCheckParam' arguments='${assignPror},' />");
                    return;
                }

                if(dupChkCnt > 1){
                    //주문번호가 중복되었습니다.
                    dms.notification.info("<spring:message code='global.info.ordDuplicateCheckNew'/>");
                    return;
                }
            }

            //신규/수정 목록 체크
            if(insertList.length + updateList.length == 0){
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            dms.window.confirm({
                message:"<spring:message code='sal.btn.cnfrmOrder' var='order' /><spring:message code='global.info.cnfrmMsg' arguments='${order},' />"
                ,title :"<spring:message code='sal.btn.cnfrmOrder' />"
                ,callback:function(result){
                    if(result){
                        $.ajax({
                            url:"<c:url value='/sal/orm/btoCreateOrder/saveBtoCreateOrder.do' />",
                            data:JSON.stringify({
                                 "insertList":insertList
                                ,"updateList":updateList
                            }),
                            type:'POST',
                            dataType:'json',
                            contentType:'application/json',
                            error:function(jqXHR,status,error){
                                dms.notification.error(jqXHR.responseJSON.errors);
                            },
                            success:function(jqXHR, textStatus){

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
                                $("#carRetlAmt").data("kendoExtNumericTextBox").value(0);
                                $("#sPfpExamDt").val("");
                                $("#sOrdGradeCd").val("");
                                $("#sRemark").val("");
                                $("#totOrdQty").text(0);
                                $("#carRetlAmt").val(0);
                                $("#btnPriority").data("kendoButton").enable(true);
                                $("#hiddenFscCode").val("");

                                grid.dataSource.page(1);

                                if($("#sOrdTp").data("kendoExtDropDownList").value() == "N1"){
                                    $("#btnPriority").data("kendoButton").enable(true);
                                }else{
                                    $("#btnPriority").data("kendoButton").enable(false);
                                }
                                //정상적으로 반영 되었습니다.
                                dms.notification.success("<spring:message code='global.info.success'/>");
                            }
                        });
                    }else{
                        return false;
                    }
                }
            });
        }
    });

    //버튼 - 적용
    $("#btnApply").kendoButton({
        //icon:"plus",
        click:function(e){

            if($("#sOrdTp").data("kendoExtDropDownList").value() == "AS"){

                orderAmtSearchPopup();

            }else{

                var chkFlag = true;

                var ordYyMmPrid = $("#sOrdYyMmPrid").data('kendoExtDropDownList').value();

                var carlineCd = $("#sCarlineCd").data('kendoExtDropDownList').value();
                var carlineNm = $("#sCarlineCd").data('kendoExtDropDownList').text();

                var modelCd = $("#hiddenFscCode").val();
                var modelNm = $("#sModelCd").data('kendoExtDropDownList').text();

                var ocnCd = $("#sOcnCd").data('kendoExtDropDownList').value();
                var ocnNm = $("#ocnNmVw").val();
                var extColorCd = $("#sExtColorCd").data('kendoExtDropDownList').value();
                var extColorNm = $("#sExtColorCd").data('kendoExtDropDownList').text();
                var intColorCd = $("#sIntColorCd").data('kendoExtDropDownList').value();
                var intColorNm = $("#sIntColorCd").data('kendoExtDropDownList').text();

                var afterCarlineNm = carlineNm.split(']');
                var afterModelNm = modelNm.split(']');
                var afterExtColorNm = extColorNm.split(']');
                var afterIntColorNm = intColorNm.split(']');

                carlineNm = afterCarlineNm[1];
                modelNm = afterModelNm[1];
                extColorNm = afterExtColorNm[1];
                intColorNm = afterIntColorNm[1];

                var orderQty = $("#sOrdQty").data("kendoExtNumericTextBox").value();
                var trsfDlrCd = dlrCd;
                var carRetlAmt = $("#carRetlAmt").data('kendoExtNumericTextBox').value();

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

                    var grid = $('#grid').data('kendoExtGrid');
                    //var selectableList = [];

                    for(var i = 1; i <= orderQty; i++){
                        grid.dataSource.insert(0,
                                {
                                 ordNo:""
                                ,ordTp:$("#sOrdTp").data('kendoExtDropDownList').value()
                                ,ordYyMmDt:ordYyMmPrid.substring(0, 6)
                                ,ordPrid:ordYyMmPrid.substring(6, 8)
                                ,carlineCd:carlineCd
                                ,carlineNm:carlineNm
                                ,modelCd:modelCd
                                ,modelNm:$("#hiddenFscName").val()
                                ,ocnCd:ocnCd
                                ,ocnNm:ocnNm
                                ,extColorCd:extColorCd
                                ,extColorNm:extColorNm
                                ,intColorCd:intColorCd
                                //,intColorNm:intColorNm
                                ,trsfDlrCd:trsfDlrCd
                                ,ordStatCd:""
                                ,carlineNm:carlineNm
                                ,extColorNm:extColorNm
                                ,intColorNm:intColorNm
                                ,ordQty:"1"
                                ,ordGradeCd:$("#sOrdGradeCd").val()
                                ,carRetlAmt:carRetlAmt
                                ,trsfDlrNm:trsfDlrCd
                                ,ordProrCd:""
                                ,ordStatCd:""
                                ,saleRgstId:""
                                ,remark:""
                                ,ordYyMmPrid:$("#sOrdYyMmPrid").data('kendoExtDropDownList').value()
                                });
                        //selectableList.push("tr:eq("+(i-1)+")");
                    }
                    //grid.select(selectableList.join(","));
                }

                var grid = $("#grid").data("kendoExtGrid");
                var rows = grid.tbody.find("tr");

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);

                    if(dms.string.isEmpty(gridData.ordNo)){
                        gridData.set("ordProrCd", "");
                    }

                });

                $("#btnPriority").click();

            }
        }
    });

/*
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
 */
    //버튼 - 우선순위 부여
    $("#btnPriority").kendoButton({
        click:function(e){
            var grid = $('#grid').data('kendoExtGrid');
            var strOrdYyMmPrid = $("#sOrdYyMmPrid").data("kendoExtDropDownList").value();

            //우선순위 부여 절차
            //1.차종별 신규추가 목록을 구성한다.
            //2.차종별 신규추가 목록에 우선순위를 부여한다.
            //  우선순위는 신규추가 해당 차종의 DB상 우선순위 최고값을 기준으로 1씩 증가시킨다.
            var newOrdersByCarlineCd = {};

            //1.차종별 신규추가 목록을 구성한다.
            $.each(grid.dataSource.data(), function(idx, dataItem){
                if(dms.string.isEmpty(dataItem.ordNo)){
                    if(newOrdersByCarlineCd.hasOwnProperty(dataItem.carlineCd)){
                        newOrdersByCarlineCd[dataItem.carlineCd].push(dataItem);
                    }else{
                        newOrdersByCarlineCd[dataItem.carlineCd] = [];
                        newOrdersByCarlineCd[dataItem.carlineCd].push(dataItem);
                    }
                }
            });

            //2.차종별 신규추가 목록에 우선순위를 부여한다.
            $.each(newOrdersByCarlineCd, function(carlineCd, dataItems){
                var responseJson = dms.ajax.getJson({
                    url:"<c:url value='/sal/orm/btoCreateOrder/selectOrdProrCd.do'/>"
                    ,data:JSON.stringify({"carlineCd":carlineCd, "ordYyMmPrid":strOrdYyMmPrid})
                    ,async:false
                });

                var maxOrdProrCd = parseInt(responseJson.data[0].ordProrCd);
                var cnt = dataItems.length;

                $.each(dataItems, function(idx, dataItem){
                    dataItem.set("ordProrCd", dms.string.lpad(""+(maxOrdProrCd+cnt-idx), "0", 4));
                });
            });
        }
    });

    //버튼 - 선택 주문삭제
    $("#btnOrdDelete").kendoButton({
        click:function(e){
            var errorMessage = "";
            var isValid = true;
            var checkedList = [];
            var deleteItems = [];
            var grid = $("#grid").data("kendoExtGrid");
            var strOrdTp = $("#sOrdTp").data('kendoExtDropDownList').value();

            $.each($("input.grid-checkbox-item:checked", grid.tbody), function(idx, obj){
                checkedList.push($(obj).data("uid"));
            });

            if(checkedList.length == 0){
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            $.each(checkedList, function(idx, uid){
                var dataItem = grid.dataSource.getByUid(uid);

                if(strOrdTp == "N1"){
                    if(dataItem.ordStatCd != "" && dataItem.ordStatCd != null ){
                        var ordDt = new Date(dataItem.ordDt);
/*                         if( kendo.toString(ordDt,"<dms:configValue code='dateFormat' />" ) != sysDate ){
                            // 당일 주문생성만 삭제가 가능합니다.
                            errorMessage = "<spring:message code='sal.info.chkBtoCreateOrderDeleteDt' />";
                            isValid = false;
                            return isValid;
                        }

                        if(dataItem.ifresultRtn == "N"){
                            // 미전송건은 삭제할수 없습니다.
                            errorMessage = "<spring:message code='sal.info.erpResultRtn' />";
                            isValid = false;
                            return isValid;
                        } */

                        deleteItems.push(dataItem);
                    }else{

                      //grid.removeRow(row);
                    }
                }else{
                    if(dataItem.ordStatCd != "" && dataItem.ordStatCd != null){
                        if(dataItem.ordStatCd != undefined){
                            if(dataItem.ordStatCd == "1D"){
                                deleteItems.push(dataItem);
                            }else{
                                // 법인에서 심사처리했습니다.삭제불가능합니다.
                                errorMessage = "<spring:message code='sal.info.erpScrStpGoing' />";
                                isValid = false;
                                return isValid;
                            }
                        }
                    }else{
                        var rows = grid.tbody.find("tr");
                        rows.each(function(index, row) {
                            var gridData = grid.dataSource.at(index);
                            var data={};
                            chkRow = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");
                            if(chkRow === true){
                                grid.removeRow(row);
                            }
                        });

                    }
                }
            });

            if(!isValid){
                dms.notification.info(errorMessage);
                return;
            }

            dms.window.confirm({
                message:"<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.cnfrmMsg' arguments='${del},' />"
                ,title :"<spring:message code='global.lbl.del' />"
                ,callback:function(result){
                    if(result){
                        if( deleteItems != ""){

                            $.ajax({
                                url:"<c:url value='/sal/orm/btoCreateOrder/deleteBtoCreateOrder.do' />",
                                data:JSON.stringify({
                                    "deleteList":deleteItems
                                }),
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
                        }else{

                             var rows = grid.tbody.find("tr");
                             rows.each(function(index, row) {
                                 var gridData = grid.dataSource.at(index);
                                 var data={};
                                 chkRow = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");
                                 if(chkRow === true){
                                     grid.removeRow(row);

                                 }
                             });


                        }
                    }else{
                        return false;
                    }
                }
            });
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
                         var sModelCd = "";
                         var sFscNm = "";

                         params["sOrdTp"] = strOrdTp;
                         params["sOrdYyMmPrid"] = strOrdYyMmPrid;
                         params["sOrdDtS"] = dtOrdDtS;
                         params["sOrdDtE"] = dtOrdDtE;
                         params["sCarlineCd"] = $("#sCarlineCd").data('kendoExtDropDownList').value();

                         if($("#sOcnCd").data("kendoExtDropDownList").value() != "" || $("#sOcnCd").data("kendoExtDropDownList").value() == null){
                             sModelCd = $("#hiddenFscCode").val();
                         }else{
                             sFscNm = $("#sModelCd").data("kendoExtDropDownList").value();
                         }

                         params["sFscNm"]   = sFscNm;    // fsc명
                         params["sModelCd"]   = sModelCd;    // 모델

                         params["sOcnCd"] = $("#sOcnCd").data('kendoExtDropDownList').value();
                         params["sExtColorCd"] = $("#sExtColorCd").data('kendoExtDropDownList').value();
                         params["sIntColorCd"] = $("#sIntColorCd").data('kendoExtDropDownList').value();

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
                          ordNo:{type:"string", editable:false}
                          ,carlineCd:{type:"string", validation:{required:true}, editable:false}
                          ,carlineNm:{type:"string", editable:false}
                          ,modelCd:{type:"string", validation:{required:true}, editable:false}
                          ,modelNm:{type:"string", editable:false}
                          ,ocnCd:{type:"string", validation:{required:true}, editable:false}
                          ,ocnNm:{type:"string", editable:false}
                          ,extColorCd:{type:"string", validation:{required:true}, editable:false}
                          ,extColorNm:{type:"string", editable:false}
                          ,intColorCd:{type:"string", validation:{required:true}, editable:false}
                          //,intColorNm:{type:"string", editable:false}
                          ,trsfDlrCd:{type:"string", hidden:true}
                          ,ordStatCd:{type:"string", hidden:true}
                          ,ordDt:{type:"date", editable:false}
                          ,ordQty:{type:"number", editable:false}
                          ,ordGradeCd:{type:"string", editable:false}
                          ,trsfDlrNm:{type:"string", editable:false}
                          ,ordProrCd:{type:"string", editable:true}
                          ,ordStatCd:{type:"string", editable:false}
                          ,saleRgstId:{type:"string", editable:true}
                          ,ifresultRtn:{type:"string", editable:false}
                          ,remark:{type:"string", editable:false}
                          ,carRetlAmt:{type:"number", editable:false}
                          ,totalCnt:{type:"number", hidden:true}
                          ,ordYyMmPrid:{type:"string", editable:false}
                      }
                 }
             }
             ,change:function(e){
                 var grid = $("#grid").data("kendoExtGrid");

                 //추가/변경 데이터 체크목록에 반영
                 if(e.action === "itemchange" || e.action === "add"){
                     $.each(e.items, function(idx, dataItem){
                         checkedListMap[dataItem.uid] = dataItem.uid;
                     });
                 }

                 //체크박스 체크
                 $.each(checkedListMap, function(name, value){
                     $("input[id=checkbox-"+value+"]").prop("checked", true);
                 });
             }
        }
        ,dataBound:function(e) {
            //console.log("grid.dataBound");
            var that = this;
            var dataItems = that.dataSource.data();


            if(dataItems.length > 0){
                $("#totOrdQty").text(Number(dms.string.strNvl(dataItems[0].totalCnt)));
            }else{
                $("#totOrdQty").text(0);
            }

            //체크박스 체크 적용
            $.each(checkedListMap, function(name, value){
                $("input[id=checkbox-"+value+"]").prop("checked", true);
            });

            $(".checkAll", that.element).click(function() {
                var checked = $(this).is(":checked");
                checkedListMap = {};

                if (checked) {
                    $.each(that.dataSource.data(), function(idx, dataItem){
                        checkedListMap[dataItem.uid] = dataItem.uid;
                    });
                }

                $("input.grid-checkbox-item", that.element).prop("checked", checked);
            });

            that.element.on("click", ".grid-checkbox-item", function(e) {
                var uid = $(this).data("uid");

                if($(this).is(":checked")){
                    checkedListMap[uid] = uid;
                }else{
                    delete checkedListMap[uid];
                }

                if(Object.keys(checkedListMap).length == that.dataSource.view().length){
                    $(".checkAll", that.element).prop("checked", true);
                }else{
                    $(".checkAll", that.element).prop("checked", false);
                }
            });
        }
        ,height :414
        ,reorderable:false                  //컬럼순서변경가능여부
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:true                //Tooltip 적용, default:false
        ,autoBind:false
        ,navigatable:true
        ,sortable:false
        ,selectable:"row"
        ,pageable :{
            refresh :true
            ,pageSize :100
            ,pageSizes :[ "100", "200", "300", "400", "500"]
        }
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

                if(dms.string.isNotEmpty(e.model.ordDt)){

                     if((kendo.toString(e.model.ordDt,"<dms:configValue code='dateFormat' />")).replace(/-/gi, "") != sysDate.replace(/-/gi, "")){
                        this.closeCell();
                    }
                }

                 if($("#sOrdTp").data('kendoExtDropDownList').value() == "AS"){
                    this.closeCell();
                }

                 if($("#sOrdTp").data('kendoExtDropDownList').value() == "AD"){
                     this.closeCell();
                 }

            }

            if(fieldName == "saleRgstId"){

                if(dms.string.isNotEmpty(e.model.ordDt)){

                     if((kendo.toString(e.model.ordDt,"<dms:configValue code='dateFormat' />")).replace(/-/gi, "") != sysDate.replace(/-/gi, "")){
                        this.closeCell();
                    }
                }

            }
        }
        ,columns:[
            {_field:"_checkbox", title:"&nbsp;" ,width:30 ,sortable:false
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    var checked = "";
                    if(checkedListMap.hasOwnProperty(dataItem.uid)){
                        checked = "checked";
                    }

                    return "<input id='checkbox-"+dataItem.uid+"' type='checkbox' data-uid='"+dataItem.uid+"' "+checked+" class='grid-checkbox-item' />";
                }
                ,_hidden:true
                ,filterable:false
                ,headerTemplate:"<input type='checkbox' class='checkAll' />"
            }
            ,{field:"ordNo", title:"<spring:message code='global.lbl.ordNo' />"
                ,attributes:{"class":"ac"}
                ,footerAttributes:{style:"visibility:hidden;"}
                ,hidden:true
            }  // 주문번호
            ,{field:"trsfDlrCd", hidden:true }  // 운송딜러
            ,{field:"ordStatCd", hidden:true }  // 상태 코드
            ,{field:"ordDt", title:"<spring:message code='global.lbl.chrgDt' />"
                ,width:80
                ,headerAttributes:{style:"text-align:center;"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,attributes:{ "style":"text-align:center"}
            }  // 주문일
            ,{field:"carlineCd", title:"<spring:message code='global.lbl.carlineCd' />"
                ,width:60
                ,headerAttributes:{style:"text-align:center;"}
            }  // 차종코드
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />"
                ,width:90
                ,headerAttributes:{style:"text-align:center;"}
            }  // 차종명칭
            ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />"
                ,width:120
                ,headerAttributes:{style:"text-align:center;"}
            }  // 차관명칭
            ,{field:"ocnCd", title:"<spring:message code='global.lbl.ocnCode' />"
                ,width:60
                ,headerAttributes:{style:"text-align:center;"}
                ,attributes:{"class":"ac"}
            }  // OCN코드
            ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocnNm' />"
                ,width:120
                ,headerAttributes:{style:"text-align:center;"}
            }  // OCN명칭
            ,{field:"extColorCd", title:"<spring:message code='global.lbl.extColorCd' />"
                ,width:60
                ,headerAttributes:{style:"text-align:center;"}
            }  // 외장색코드
            ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />"
                ,width:80
                ,headerAttributes:{style:"text-align:center;"}
            }  // 외장색명칭
            ,{field:"intColorCd", title:"<spring:message code='global.lbl.intColorCd' />"
                ,width:60
                ,headerAttributes:{style:"text-align:center;"}
            }  // 내장색코드
            ,{field:"ordQty", title:"<spring:message code='global.lbl.orderQty' />"
                ,width:80
                ,headerAttributes:{style:"text-align:center;"}
                ,attributes:{ "style":"text-align:right"}
            }  // 주문수량
            ,{field:"ordGradeCd", title:"<spring:message code='global.lbl.orderGrade' />"
                ,width:80
                ,headerAttributes:{style:"text-align:center;"}
                ,attributes:{"class":"ac"}
            }  // 주문등급
            ,{field:"carRetlAmt", title:"<spring:message code='sal.lbl.carRetlAmt' />"
                ,width:80
                ,headerAttributes:{style:"text-align:center;"}
            ,format:"{0:n2}"
            ,attributes:{"class":"ar"}
            } //지도가
            ,{field:"ordProrCd", title:"<spring:message code='sal.lbl.assignPror' />"
                ,width:80
                ,headerAttributes:{style:"text-align:center;"}
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    /* if(!options.model.isNew()){
                        container.context.innerText = dms.string.strNvl(options.model.ordProrCd);
                        return ;
                    } */

                    $('<input name="ordProrCd" type="text" maxlength="4" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoMaskedTextBox({
                         mask:"0000"
                        ,max:"4999"
                        ,change:function(e){
                            var value = this.value();
                            var pValue = value.replace(/\_/g, '');

                            if(pValue.length > 0){
                                while(pValue.length < 4){
                                    pValue = '0' + pValue;
                                }

/*                                 if(Number(pValue) < 5000){ */
                                    options.model.ordProrCd = pValue;
/*                                 }else{
                                    dms.notification.info("<spring:message code='sal.info.chkNumberSizeBtoder' />");
                                    options.model.ordProrCd = "";
                                } */

                            }
                        }
                    });
                    $('<span class="k-invalid-msg" data-for="ordProrCd"></span>').appendTo(container);
                }
            }  // 배정우선순위
            ,{field:"trsfDlrCd", title:"<spring:message code='sal.lbl.trsfDealer' />"
                ,width:80
                ,attributes:{"class":"ac"}
                ,headerAttributes:{style:"text-align:center;"}
                ,hidden:true
            }  // 운송딜러
            /* ,{field:"ordStatCd", title:"<spring:message code='global.lbl.statNm' />"
                ,width:35
                ,template:"#=ordStatCdMap[ordStatCd].cmmCdNm#"
                ,headerAttributes:{style:"text-align:center;"}
                ,attributes:{ "style":"text-align:center"}
            }  */ // 상태


            ,{  // 판매고문
                field:"saleRgstId"
                ,title:"<spring:message code='sal.lbl.salesAdvisor' />"
                ,width:90
                ,attributes:{"class":"ac"}
                ,template:"#=dms.string.strNvl(selectSaleEmpDSObj[saleRgstId])#"
                ,editor:function (container, options){
                    $('<input name="saleRgstId" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                          valuePrimitive:true
                        , dataTextField: "saleEmpNm"
                        , dataValueField:"saleEmpCd"
                        , optionLabel:" "
                        , dataSource:dms.data.cmmCdFilter(selectSaleEmpDSList)
                    });
                    $('<span class="k-invalid-msg" data-for="saleRgstId"></span>').appendTo(container);
                }
            }

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
             , hidden:true
              } // 인터페이스상태
            ,{field:"remark", title:"<spring:message code='global.lbl.remark' />"
                ,width:120
                ,attributes:{"class":"al"}
                ,hidden:true
            } // 비고
        ]
    });

    getWeekInfoInit();

    $("#sOrdDtS").data("kendoDatePicker").value('');
    $("#sOrdDtE").data("kendoDatePicker").value('');
    $("#sOrdDtS").data("kendoDatePicker").enable(false);
    $("#sOrdDtE").data("kendoDatePicker").enable(false);

    $("#sRefOrdQty").data("kendoExtNumericTextBox").enable(false); //참고수량
    $("#carRetlAmt").data("kendoExtNumericTextBox").enable(false); //지도가

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
        //$("#sRemark").val(ordYyMmPridList[ordYyMmPridList.length - 1].remark);
    }else{
        $("#sRefOrdQty").data("kendoExtNumericTextBox").value(0);
        //$("#sRemark").val("");
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

function refreshAll(){
    $("#sOrdTp").data("kendoExtDropDownList").value("N1");
    $("#sOrdDtS").data("kendoDatePicker").value("");
    $("#sOrdDtE").data("kendoDatePicker").value("");
    $("#sOrdDtS").data("kendoDatePicker").enable(false);
    $("#sOrdDtE").data("kendoDatePicker").enable(false);
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
    $("#carRetlAmt").data("kendoExtNumericTextBox").value(0);
    $("#sPfpExamDt").val("");
    $("#sOrdGradeCd").val("");
    $("#sRemark").val("");
    $("#totOrdQty").text(0);
    $("#carRetlAmt").val(0);
    $("#hiddenFscCode").val("");
    $("#btnPriority").data("kendoButton").enable(true);
    $("#grid").data('kendoExtGrid').dataSource.data([]);
}

function getWeekInfoInit(){
    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/sal/orm/btoCreateOrder/selectOrdWeekRemark.do'/>"
        ,data:JSON.stringify({"sOrdTp":$("#sOrdTp").val()})
        ,async:false
    });

    if(responseJson != null && responseJson.data.length > 0){
        $("#sRemark").val(responseJson.data[0].remark);
    }
}

// 우선순위중복체크
function isDupChkGrid(ordProrCd, carlineCd){
    var flag = false;
    var grid = $('#grid').data('kendoExtGrid');
    var rows = grid.tbody.find("tr");
    var dupchk = 0;

    rows.each(function(index, row){
        var data = grid.dataItem(row);

        if(carlineCd == data.carlineCd){
            if(ordProrCd == data.ordProrCd){
                dupchk = dupchk+1;
            }
        }
    });

    if(dupchk > 1){
        flag = true;
    }

    return flag;
}
</script>
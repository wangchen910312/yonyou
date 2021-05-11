<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div id="resizableContainer">
    <!-- 미배정 주문조회 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.NotAssignedOrder" /></h1> <!-- 미배정 주문조회 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-D-13245" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_save" id="btnAskCancel" style="display:;"><spring:message code='sal.btn.ordCncAsk' /></button><!-- 신청 -->
                </dms:access>
                <dms:access viewId="VIEW-D-13246" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_cancel" id="btnAskCancelRemove" style="display:;"><spring:message code='sal.btn.ordCncCnc' /></button><!-- 요청취소 -->
                </dms:access>
                <dms:access viewId="VIEW-D-10968" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                </dms:access>
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:22%;">
                    <col style="width:9%;">
                    <col style="width:18%;">
                    <col style="width:9%;">
                    <col style="width:16%;">
                    <col style="width:9%;">
                    <col style="width:14%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.orderType" /></th> <!-- 주문유형 -->
                        <td class="required_area">
                            <input name="sOrdTp" id="sOrdTp" type="text" class="form_comboBox">
                        </td>
                        <th scope="row" class="group-OrdDt2"><spring:message code="global.lbl.orderWeek" /></th> <!-- 주문주차 -->
                        <td class="required_area group-OrdDt2">
                            <input name="sOrdYyMmPrid" id="sOrdYyMmPrid" type="text" class="form_comboBox">
                        </td>
                        <th scope="row" class="group-OrdDt1" style="display:none;"><spring:message code="global.lbl.orderRegDt" /></th> <!-- 주문등록일 -->
                        <td class="group-OrdDt1 required_area" style="display:none;">
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sOrdDtS" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sOrdDtE" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"></th><td></td>
                        <th scope="row"></th><td></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.carLine" /></th> <!-- 차종 -->
                        <td>
                            <input name="sCarlineCd" id="sCarlineCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.model" /></th> <!-- 모델 -->
                        <td>
                            <input name="sModelCd" id="sModelCd" type="text" class="form_comboBox">
                            <input id="hiddenFscCode" type="hidden" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.ocn" /></th> <!-- OCN -->
                        <td>
                            <input name="sOcnCd" id="sOcnCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.mortgageBalance" />/<spring:message code="sal.lbl.unMortgageBalance" /></th> <!-- 담보잔액 -->
                        <td class="readonly_area">
                            <input id="mortgageBalance" type="text" class="form_numeric ar" style="width:49%"/>
                            <input id="unMortgageBalance" type="text" class="form_numeric ar" style="width:49%"/>
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.accountBalance" /></th> <!-- 계정잔액 -->
                        <td class="readonly_area">
                            <input id="preAmt" type="text" class="form_numeric ar" readonly>
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.ordReqTotAmt" /></th> <!-- 필요금액 -->
                        <td class="readonly_area">
                            <input id="ordReqTotAmt" type="text" class="form_numeric ar" readonly>
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.lackAmtAssigne" /></th> <!-- 부족금액 -->
                        <td class="readonly_area">
                            <input id="lackAmt" name="lackAmt" type="number" min="" max="" class="form_numeric ar"  />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="header_area">
            <div class="btn_right">
                <%-- <dms:access viewId="VIEW-D-10968" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                    <button class="btn_s" id="btnExcel"><spring:message code="global.btn.excelExport" /></button>       <!-- 엑셀 Export -->
                    <%-- <button class="btn_s" id="btnAllChange"><spring:message code='sal.btn.stockStateAllChange' /></button> --%>       <!-- 일괄변경 -->
                <%-- </dms:access> --%>
            </div>

            <div class="btn_left">
                <ul class="txt_total">
                    <li>
                         <span class="form_numeric font_bold"><spring:message code='sal.lbl.totNo' />&nbsp;:&nbsp;<span id="mainTot" name="mainTot">0</span></span>     <!-- 건수:-->
                    </li>
                </ul>
            </div>
        </div>

        <div class="table_grid">
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>

<script  type="text/javascript">

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";
var sysDate = "${sysDate}";
var fifteenDayBf = "${fifteenDayBf}"

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일
var params = {};
//var checkedListMap = {};

/**
 * 주문유형 콤보박스
 */
var ordTpList = [];
var ordTpCdObj = {};
<c:forEach var="obj" items="${ordTpInfo}">
    ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ordTpCdObj["${obj.cmmCd}"] = "["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}";
</c:forEach>

/**
 * 담보유형 콤보박스
 */
 /*
 var mortgageTpList = [];
 var mortgageTpCdObj = {};
 <c:forEach var="obj" items="${mortgageTp}">
   mortgageTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
   mortgageTpCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>
 */

/**
 * 차종 콤보
 */
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

// 주차
var ordYyMmPridList = [];
<c:forEach var="obj" items="${ordYyMmPridInfo}">
    ordYyMmPridList.push({btoYmwNm:"${obj.btoYmwNm}", btoYmwCd:"${obj.btoYmwCd}"});
</c:forEach>

//신청상태
var adjStatList = [];
var adjStatObj = {};
<c:forEach var="obj" items="${adjStatDs}">
    <c:if test="${obj.cmmCd ne 'C'}">
        adjStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        adjStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:if>
</c:forEach>


$(document).ready(function () {
    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sModelCd").data("kendoExtDropDownList").enable(true);

           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
           $("#sOcnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

           $("#hiddenFscCode").val("");

           if(dataItem.carlineCd == ""){
               $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sModelCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectModelTypeCombo.do' />"
               ,data:JSON.stringify({"sCarlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    // 모델
    $("#sModelCd").kendoExtDropDownList({
        dataTextField:"fscNm"
       ,dataValueField:"fscCd"
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(true);

           $("#hiddenFscCode").val("");

           if(dataItem.modelCd == ""){
               $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOcnCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectOcnCombo.do' />"
               ,data:JSON.stringify({"sCarlineCd":$("#sCarlineCd").val(), "sFscCd":dataItem.fscCd})
               ,async:false
           });
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#sModelCd").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#sOcnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){

            $("#hiddenFscCode").val("");

            if(this.dataItem(e.item).ocnCd == ""){
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectExtColorCombo.do' />"
                ,data:JSON.stringify({"sModelCd":e.dataItem.modelCd})
                ,async:false
                ,success:function(data) {
                    $("#hiddenFscCode").val(e.dataItem.modelCd);
                }
            });
        }
    });
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);

     //주문유형
     $("#sOrdTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:ordTpList
        ,select:onSelectOrdTp
        ,optionLabel:" "
        //value:"N1"
     });

     //담보유형
     /*
     $("#sMortgageTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:mortgageTpList
        ,optionLabel:" "
     });
     */

     // 오더배정필요한총금액
     $("#ordReqTotAmt").kendoExtNumericTextBox({
         format:"n2"
        ,decimals:2
        ,value:0.00
        ,spinners:false
     });

     // 부족금액
     $("#lackAmt").kendoExtNumericTextBox({
         format:"n2"
        ,decimals:2
        ,value:0.00
        ,spinners:false
     });

     // 선수금 잔액
     $("#preAmt").kendoExtNumericTextBox({
         format:"n2"
        ,decimals:2
        ,value:0.00
        ,spinners:false
     });

     // 담보잔액
     $("#mortgageBalance").kendoExtNumericTextBox({
         format:"n2"
        ,decimals:2
        ,value:0.00
        ,spinners:false
     });

     // 미담보잔액
     $("#unMortgageBalance").kendoExtNumericTextBox({
         format:"n2"
        ,decimals:2
        ,value:0.00
        ,spinners:false
     });

     /**
      * 주문주차 콤보박스
      */
      $("#sOrdYyMmPrid").kendoExtDropDownList({
          dataTextField:"btoYmwNm"
         ,dataValueField:"btoYmwCd"
         ,dataSource:ordYyMmPridList
         ,optionLabel:" "  // 선택
         ,value:""
         //,index:ordYyMmPridList.length
      });


     /**
      * 주문유형변경 이벤트
      */
      function onSelectOrdTp(e) {
          var ordTpCd = this.dataItem(e.item).cmmCd;

          if(ordTpCd == "N1"){
              $("#sOrdDtS").data("kendoExtMaskedDatePicker").value("");
              $("#sOrdDtE").data("kendoExtMaskedDatePicker").value("");
              $(".group-OrdDt1").hide();
              $(".group-OrdDt2").show();
          }else{
              if( $("#sOrdDtS").data("kendoExtMaskedDatePicker").value() == "" || $("#sOrdDtS").data("kendoExtMaskedDatePicker").value() == null ){
                  $("#sOrdDtS").data("kendoExtMaskedDatePicker").value("");
                  $("#sOrdDtE").data("kendoExtMaskedDatePicker").value("");
              }
              $(".group-OrdDt2").hide();
              $(".group-OrdDt1").show();
          }

          $("#sCarlineCd").data("kendoExtDropDownList").value("");
          $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
          $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);

          $("#sModelCd").data("kendoExtDropDownList").enable(false);
          $("#sOcnCd").data("kendoExtDropDownList").enable(false);
      };

      /**
       * 시작일자 (From)
       */
       $("#sOrdDtS").kendoExtMaskedDatePicker({
          format:"{0:<dms:configValue code='dateFormat' />}"
         ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       });

       /**
       * 종료일자 (From)
       */
       $("#sOrdDtE").kendoExtMaskedDatePicker({
          format:"{0:<dms:configValue code='dateFormat' />}"
         ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       });

      $("#sModelCd").data("kendoExtDropDownList").enable(false);
      $("#sOcnCd").data("kendoExtDropDownList").enable(false);
      $(".group-OrdDt2").hide();
      $(".group-OrdDt1").show();

      $("#sOrdDtS").data("kendoExtMaskedDatePicker").value(oneDay);
      $("#sOrdDtE").data("kendoExtMaskedDatePicker").value(sysDate);

      //버튼 - 조회
      $("#btnSearch").kendoButton({
          click:function(e) {

              var fromDt = $("#sOrdDtS").data("kendoExtMaskedDatePicker").value();
              var toDt = $("#sOrdDtE").data("kendoExtMaskedDatePicker").value();

              if(salesJs.validate.isFromDateValid(fromDt, toDt)) {
                  dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
                  $("#sOrdDtS").focus();
                  return false;
              }
              if(salesJs.validate.isFromDateValid(toDt, fromDt)) {
                  dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
                  $("#sOrdDtE").focus();
                  return false;
              }

              if(!salesJs.validate.isDateValidPeriod(fromDt, toDt)){
                  dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
                  $("#sOrdDtE").data("kendoExtMaskedDatePicker").value(new Date(''));
                  $("#sOrdDtE").focus();
                  return false;
              }


              realErpSearch();
          }
      });

      //버튼 - 엑셀다운로드
      $("#btnExcel").kendoButton({
          click:function(e) {
              var strOrdTp  = $("#sOrdTp").val();
              var strOrdYyMmPrid = $("#sOrdYyMmPrid").val().replace(/-/gi, "");
              var sOrdDtS = $("#sOrdDtS").val().replace(/-/gi, "");
              var sOrdDtE = $("#sOrdDtE").val().replace(/-/gi, "");

              if($("#hiddenFscCode").val() != "" || $("#hiddenFscCode").val() != null){
                  dms.ajax.excelExport({
                      "beanName":"notAssignedOrderService"
                      ,"templateFile":"notAssignedOrder.xlsx"
                      ,"fileName":"notAssignedOrder.xlsx"
                      ,"sCarlineCd":$("#sCarlineCd").val()
                      ,"sModelCd":$("#hiddenFscCode").val()
                      ,"sOcnCd":$("#sOcnCd").val()
                      ,"sOrdTp":$("#sOrdTp").val()
                      //,"sPaym":$("#sMortgageTp").val()
                      ,"sOrdTp":strOrdTp
                      ,"sOrdPrid":strOrdYyMmPrid
                      ,"sOrdStartDtStr":sOrdDtS
                      ,"sOrdEndDtStr":sOrdDtE
                  });
              }else{
                  dms.ajax.excelExport({
                      "beanName":"notAssignedOrderService"
                      ,"templateFile":"notAssignedOrder.xlsx"
                      ,"fileName":"notAssignedOrder.xlsx"
                      ,"sCarlineCd":$("#sCarlineCd").val()
                      ,"sFscNm":$("#sModelCd").data("kendoExtDropDownList").value()
                      ,"sOcnCd":$("#sOcnCd").val()
                      ,"sOrdTp":$("#sOrdTp").val()
                      //,"sPaym":$("#sMortgageTp").val()
                      ,"sOrdTp":strOrdTp
                      ,"sOrdPrid":strOrdYyMmPrid
                      ,"sOrdStartDtStr":sOrdDtS
                      ,"sOrdEndDtStr":sOrdDtE
                  });
              }
          }
      });

      $("#btnAskCancel").kendoButton({ // 신청
          click:function(e){
              var grid = $("#grid").data("kendoExtGrid")
                , rows = grid.select()
                , askList = []
                , dataValidate = false;

              rows.each(function(index, row) {
                  var item = grid.dataItem(row);
                  if(item.adjStatCd == "A" && item.adjStatCd == "Y" && dms.string.strNvl(item.adjStatCd) != "" ){
                      dataValidate = true;
                  }
                  askList.push(item);
              });

              if(dataValidate){
                  // 요청할 수 없습니다.
                  dms.notification.warning("<spring:message code='global.btn.req' var='globalBtnReq' /><spring:message code='global.err.failedParam' arguments='${globalBtnReq}' />");
                  return false;
              }

              if(rows.length  == 0 ){
                  //목록을 선택하여 주십시오.
                  dms.notification.info("<spring:message code='global.info.required.select'/>");
                  return false;
              }else{
                  dms.window.confirm({
                      message:"<spring:message code='global.info.cancel' />"
                      ,title :"<spring:message code='global.lbl.info' />"
                      ,callback:function(result){
                          if(result){
                              $.ajax({
                                  url:"<c:url value='/sal/orc/orderPlacement/notAssignedOrderCancelAsk.do' />"
                                  ,data:JSON.stringify({"insertList":askList})
                                  ,type:'POST'
                                  ,dataType:'json'
                                  ,contentType:'application/json'
                                  ,error:function(jqXHR, status, error) {
                                      dms.notification.error(jqXHR.responseJSON.errors);
                                  }
                                  ,success:function(jqXHR, textStatus) {
                                      grid.dataSource._destroyed = [];
                                      grid.dataSource.page(1);

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
          }
          ,enable:false
      });

      $("#btnAskCancelRemove").kendoButton({ // 요청 취소신청
          click:function(e){
              var grid = $("#grid").data("kendoExtGrid")
                , rows = grid.select()
                , askList = []
                , dataValidate = false;

              rows.each(function(index, row) {
                  var item = grid.dataItem(row);
                  if(item.adjStatCd != "A"){
                      dataValidate = true;
                  }
                  askList.push(item);
              });

              if(dataValidate){
                  // 요청할 수 없습니다.
                  dms.notification.warning("<spring:message code='global.btn.req' var='globalBtnReq' /><spring:message code='global.err.failedParam' arguments='${globalBtnReq}' />");
                  return false;
              }

              if(rows.length  == 0 ){
                  //목록을 선택하여 주십시오.
                  dms.notification.info("<spring:message code='global.info.required.select'/>");
                  return false;
              }else{
                  dms.window.confirm({
                      message:"<spring:message code='global.info.cancel' />"
                      ,title :"<spring:message code='global.lbl.info' />"
                      ,callback:function(result){
                          if(result){
                              $.ajax({
                                  url:"<c:url value='/sal/orc/orderPlacement/notAssignedOrderCancelRemove.do' />"
                                  ,data:JSON.stringify({"insertList":askList})
                                  ,type:'POST'
                                  ,dataType:'json'
                                  ,contentType:'application/json'
                                  ,error:function(jqXHR, status, error) {
                                      dms.notification.error(jqXHR.responseJSON.errors);
                                  }
                                  ,success:function(jqXHR, textStatus) {
                                      grid.dataSource._destroyed = [];
                                      grid.dataSource.page(1);

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
          }
          ,enable:false
      });

        /*
        $("#btnSave").kendoButton({ // 저장
            enable:true,
            click:function(e){

                var now = new Date();
                var nowTime = now.getHours()+"";

                nowTime += now.getMinutes()+"";
                nowTime += now.getSeconds()+"";


                 if(Number('165959') < Number(nowTime) && Number(nowTime) < Number('235959')){

                    var grid = $("#grid").data("kendoExtGrid");
                    var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

                    if (grid.cudDataLength == 0) {
                        //변경된 정보가 없습니다.
                        dms.notification.info("<spring:message code='global.info.required.change'/>");
                        return;
                    }

                    if (grid.gridValidation()) {
                        $.ajax({
                            url:"<c:url value='/sal/orc/orderPlacement/updateNotAssignedOrder.do' />"
                            ,data:JSON.stringify(saveData)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,error:function(jqXHR, status, error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            }
                            ,success:function(jqXHR, textStatus) {
                                grid.dataSource._destroyed = [];
                                grid.dataSource.page(1);

                                //정상적으로 반영 되었습니다.
                                dms.notification.success("<spring:message code='global.info.success'/>");
                            }
                        });
                    }else{
                        //입력값을 확인하여 주십시오.
                        dms.notification.warning("<spring:message code='global.info.check.input'/>");
                    }

                }else{
                  dms.window.confirm({
                      message:"<spring:message code='sal.info.itsToolate' />"
                      ,title :"<spring:message code='global.lbl.info' />"
                      ,displayCancelBtn:false
                      ,callback:function(result){
                          $('#vehicleGrid').data('kendoExtGrid').dataSource.page(1);
                      }
                  });
                }
            }
        });
        */

        //그리드 1번
        $("#grid").kendoExtGrid({
            gridId:"G-SAL-0224-193009"
            ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/sal/orc/orderPlacement/selectNotAssignedOrder.do' />"
                 }
                ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};
                         var sModelCd = "";
                         var sFscCd = "";

                         /*Paging Param Start~!*/
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         /*Paging Param End~!*/

                         params["sort"] = options.sort;

                         params["sCarlineCd"] = $("#sCarlineCd").val();
                         params["sOcnCd"] = $("#sOcnCd").val();
                         params["sOrdTp"] = $("#sOrdTp").val();
                         //params["sPaym"] = $("#sMortgageTp").val();

                         if(dms.string.isNotEmpty($("#hiddenFscCode").val())){
                             sModelCd = $("#hiddenFscCode").val();
                         }else{
                             sFscCd = $("#sModelCd").data("kendoExtDropDownList").value();
                         }

                         params["sFscCd"]   = sFscCd;    // fsc코드
                         params["sModelCd"]   = sModelCd;    // 모델

                         var strOrdTp = $("#sOrdTp").val();
                         var strOrdYyMmPrid = $("#sOrdYyMmPrid").data('kendoExtDropDownList').value();

                         var sOrdDtS = $("#sOrdDtS").val().replace(/-/gi, "");
                         var sOrdDtE = $("#sOrdDtE").val().replace(/-/gi, "");

                         params["sOrdTp"] = strOrdTp;

                         if(strOrdTp == "N1"){
                             params["sOrdPrid"] = strOrdYyMmPrid;
                         }else{
                             params["sOrdStartDtStr"] = sOrdDtS;
                             params["sOrdEndDtStr"] = sOrdDtE;
                         }

                         return kendo.stringify(params);
                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,error:function(e){
             }
           ,schema:{
               data:"data"
              ,model:{
                   id:"modelCd"
                  ,fields:{
                      ordpCndy:{type:"string", editable:false}
                  ,ordDt:{type:"date", editable:false}
                  ,dlrCd:{type:"string", editable:false}
                  ,sord:{type:"string", editable:false}
                  ,carlineCd:{type:"string", editable:false} //차종코드
                  ,modelCd:{type:"string", editable:false} //모델코드
                  ,ocnCd:{type:"string", editable:false} //OCN코드
                  ,extColorCd:{type:"string", editable:false} //외색코드
                  ,intColorCd:{type:"string", editable:false} //내색코드
                  ,carlineNm:{type:"string", editable:false} //차종명
                  ,modelNm:{type:"string", editable:false} //모델명
                  ,ocnNm:{type:"string", editable:false} //OCN명
                  ,extColorNm:{type:"string", editable:false} //외색명
                  ,intColorNm:{type:"string", editable:false} //내색명
                  ,whPrc:{type:"number", editable:false} //mspr
                  ,mdpr:{type:"number", editable:false} //할인전금액
                  ,aftMdpr:{type:"number", editable:false} //할인후금액
                  ,ordpVapr:{type:"number", editable:false} //필요자금
                  ,ordpCount:{type:"number", editable:false} //오더댓수
                  ,ordpExno:{type:"date", editable:false} //납기예시일
                  //,ordpCndy:{type:"string", editable:false} //주문일
                  ,chrgCd:{type:"string", editable:false} //주문자
                  ,saleRgstNm:{type:"string", editable:false} //판매고문
                  ,salesNo:{type:"string", editable:false} //ERP오더번호
                  ,dlrCd:{type:"string", editable:false} //딜러코드
                  ,cashAmt:{type:"number", editable:false}  //현금공제금액
                  ,d2prtAmt:{type:"number", editable:false} //2방공제금액
                  ,d3prtAmt:{type:"number", editable:false} //3방공제금액
                  ,adjp:{type:"number", editable:false} //반리
                  ,damt:{type:"number", editable:false} //할인금액
                  ,aamt:{type:"number", editable:false} //영수증금액
                  ,ordYymmS:{type:"string", editable:false} //주문년월
                  ,ordWeek:{type:"string", editable:false} //주문주차
                  ,ordType:{type:"string", editable:false} //주문유형
                  ,paym:{type:"string", editable:true} //담보유형
                  ,ordRgstId:{type:"string", editable:false} //주문자
                  ,saleRgstId:{type:"string", editable:false} //판매고문
                  ,dcRate:{type:"number", editable:false} //할인율
                  ,adjStatCd:{type:"string", editable:false}
                   }
               }
           }
       ,aggregate:[
                    { field:"ordpCount", aggregate:"sum" } //오더수량
                   ,{ field:"mdpr", aggregate:"sum" } //시장지도가
                   ,{ field:"damt", aggregate:"sum" } //할인금액
                   ,{ field:"aamt", aggregate:"sum"} //할인후가격
                   ]
         }
          ,dataBound:function(e) {
              var rows = e.sender.tbody.children();
              var that = this;

              $("#mainTot").text(salesJs.String.addcomma(Number(e.sender.pager.dataSource._total)));
              /*
              var aamt = 0;
              $.each(rows, function(idx, row){
                  var dataItem = e.sender.dataItem(row);

                  if(dataItem.aamt != null){
                      aamt += Number(dataItem.aamt);
                  }
              });
              $("#ordReqTotAmt").data("kendoExtNumericTextBox").value(aamt);
              */

              //체크박스 체크 적용
              /*
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
              });
              */

          }
         ,change:gridChage
         ,indvColumnVisible:true      //컬럼 보이기/감추기 개인화 적용. default:true
         ,indvColumnReorderable:true  //컬럼순서 변경 개인화 적용. default:true
         ,appendEmptyColumn:false     //빈컬럼 적용. default:false
         ,multiSelectWithCheckbox:true
         ,enableTooltip:true          //Tooltip 적용, default:false
         ,autoBind:false
         ,scrollable:true
         //,selectable:"row"
         ,columns:[
               /*
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
               */
               {field:"adjStatCd"
                   ,title:"<spring:message code='sal.lbl.cancleStatCd' />"
                   ,width:100
                   ,attributes:{"class":"ac"}
                   ,template:"#=dms.string.strNvl(adjStatObj[adjStatCd])#"
                } //취소상태
              ,{field:"ordpCndy", title:"<spring:message code='global.lbl.orderDt' />"
                  , width:100
                  ,attributes:{"class":"ac"}
                  ,footerAttributes:{style:"visibility:hidden;"}
                  ,hidden:true
              }  // 주문일자
              ,{field:"ordDt", title:"<spring:message code='global.lbl.orderDt' />"
                  , width:100
                  ,attributes:{"class":"ac"}
                  ,format:"{0:<dms:configValue code='dateFormat' />}"
                  ,footerAttributes:{style:"visibility:hidden;"}
              }  // 주문일자
              ,{field:"salesNo", title:"<spring:message code='global.lbl.ordNo' />"
                  , width:100
                  ,attributes:{"class":"ac"}
                  ,footerAttributes:{style:"visibility:hidden;"}
              }  // 주문번호
              ,{field:"dlrCd", title:"dlrCd"
                  , width:50
                  ,attributes:{"class":"ac"}
                  ,footerAttributes:{style:"visibility:hidden;"}
                  ,hidden:true
              }  // dlrCd

              ,{field:"sord", title:"<spring:message code='global.lbl.orderType' />"
                  , width:180
                  ,headerAttributes:{style:"text-align:center;"}
                  ,footerAttributes:{style:"visibility:hidden;"}
                  ,template:"#= ordTpCdObj[sord] #"
              }  // 주문유형
              ,{field:"carlineCd",     title:"<spring:message code='global.lbl.carlineCd' />",      width:80,  attributes:{"class":"ac"}}//차종code
              ,{field:"carlineNm",     title:"<spring:message code='global.lbl.carlineNm' />",      width:120, attributes:{"class":"al"}}//차종description
              ,{field:"modelNm",       title:"<spring:message code='global.lbl.model' />",          width:120, attributes:{"class":"al"}} //모델description
              ,{field:"ocnCd",         title:"<spring:message code='global.lbl.ocnCode' />",        width:80,  attributes:{"class":"ac"}} //OCNcode
              ,{field:"ocnNm",         title:"<spring:message code='global.lbl.ocnNm' />",          width:140, attributes:{"class":"al"}} //OCNdescription
              ,{field:"extColorCd",    title:"<spring:message code='global.lbl.extColorCd' />",     width:80,  attributes:{"class":"ac"}} //외장색code
              ,{field:"extColorNm",    title:"<spring:message code='global.lbl.extColorNm' />",     width:80,  attributes:{"class":"al"}} //외장색description
              ,{field:"intColorCd",    title:"<spring:message code='global.lbl.intColorCd' />",     width:80,  attributes:{"class":"ac"}} //내장색code
              ,{field:"ordpExno",   title:"<spring:message code='sal.lbl.pfpExamDt' />"
                 ,width:110, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}      // 납기예시일
              ,{field:"ordRgstId", title:"<spring:message code='global.lbl.chrgCd' />"
                  ,width:100
                  ,headerAttributes:{style:"text-align:center;"}
              }  // 주문자
              ,{field:"saleRgstId", title:"<spring:message code='sal.lbl.salesAdvisor' />"
                  ,width:100
                  ,headerAttributes:{style:"text-align:center;"}
              }  // 판매고문
              ,{field:"ordpCount"
                  ,title:"<spring:message code='global.lbl.ordpCount' />"
                  ,width:80
                  ,attributes:{"class":"ar"}
                  ,footerTemplate:"#=kendo.toString(sum, 'n0')#"
                  ,footerAttributes:{style:"text-align:right;"}
              }//오더수량
              ,{field:"mdpr"
                ,title:"<spring:message code='global.lbl.mdpr' />"
                ,width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,footerTemplate:"#=kendo.toString(sum, 'n2')#"
                , footerAttributes:{style:"text-align:right;"}
            }//시장지도가
            ,{field:"dcRate"
                ,title:"<spring:message code='sal.lbl.saleRate' />"
                ,width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
            }//할인율
            ,{field:"damt"
                  ,title:"<spring:message code='par.lbl.dcAmt' />"
                  ,width:100
                  ,attributes:{"class":"ar"}
                  ,format:"{0:n2}"
                  ,footerTemplate:"#=kendo.toString(sum, 'n2')#"
                  , footerAttributes:{style:"text-align:right;"}
              }//할인금액
              ,{field:"aamt"
                  ,title:"<spring:message code='sal.lbl.whPrc' />"
                  ,width:100
                  ,attributes:{"class":"ar"}
                  ,format:"{0:n2}"
                  ,footerTemplate:"#=kendo.toString(sum, 'n2')#"
                  , footerAttributes:{style:"text-align:right;"}
              }//필요자금
              /*
              ,{field:"paym"
                  ,title:"<spring:message code='sal.lbl.mortgageTp' />"
                  ,width:90
                  ,attributes:{"class":"al"}
                  ,template:"#=dms.string.strNvl(mortgageTpCdObj[paym])#"
                  ,footerAttributes:{style:"visibility:hidden;"}
                  ,editor:function (container, options){
                      $('<input name="paym" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtDropDownList({
                            valuePrimitive:true
                          , dataTextField: "cmmCdNm"
                          , dataValueField:"cmmCd"
                          , optionLabel:" "  // 선택
                          , dataSource:dms.data.cmmCdFilter(mortgageTpList)
                      });
                      $('<span class="k-invalid-msg" data-for="paym"></span>').appendTo(container);
                  }
                } // 담보유형
               */

          ]
    });

    realErpSearch();
    $("#mortgageBalance").data("kendoExtNumericTextBox").enable(false); //담보잔액
    $("#unMortgageBalance").data("kendoExtNumericTextBox").enable(false); //비담보잔액
    $("#preAmt").data("kendoExtNumericTextBox").enable(false); //계정잔액
    $("#ordReqTotAmt").data("kendoExtNumericTextBox").enable(false); //필요금액
    $("#lackAmt").data("kendoExtNumericTextBox").enable(false); //부족금액

    /*
    $("#btnAllChange").kendoButton({ // 일괄변경
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            popupWindow = dms.window.popup({
                windowId:"stockStateAllChangePopup"
                ,title:"<spring:message code='sal.title.stockStateAllChange' />"   // 일괄변경
                ,width:350
                ,height:120
                , modal:true
                ,content:{
                    url:"<c:url value='/sal/orc/orderPlacement/selectNotAssignedOrderPopup.do'/>"
                    ,data:{
                        "type":null
                        ,"autoBind":false
                        ,"callbackFunc":function(data){

                            if(data.state == "01"){

                                rows.each(function(index, row) {
                                    var uid = row.attributes["data-uid"].nodeValue;
                                    var dataSourceRow = grid.dataSource.getByUid(uid);
                                    dataSourceRow.set("paym", dms.string.strNvl(data.mortgageTp));
                                    dataSourceRow.set("dirty", true);
                                });
                                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

                                $.ajax({
                                    url:"<c:url value='/sal/orc/orderPlacement/updateNotAssignedOrder.do' />"
                                    ,data:JSON.stringify(saveData)
                                    ,type:'POST'
                                    ,dataType:'json'
                                    ,contentType:'application/json'
                                    ,error:function(jqXHR, status, error) {
                                        dms.notification.error(jqXHR.responseJSON.errors);
                                    }
                                    ,success:function(jqXHR, textStatus) {
                                        grid.dataSource._destroyed = [];
                                        grid.dataSource.page(1);

                                        //정상적으로 반영 되었습니다.
                                        dms.notification.success("<spring:message code='global.info.success'/>");
                                        popupWindow.close();
                                    }
                                });
                            }else{
                                popupWindow.close();
                            }

                        }
                    }
                }
            });
        }
    });
    */

    $("#grid").extend( $("#grid").on('click', ".grid-checkbox-item"
            , function(e){
                if(!$(this).is(":checked")) {
                    if( $("#grid").data("kendoExtGrid").select().length == 0 ){
                        $("#btnAskCancel").data("kendoButton").enable(false);
                        $("#btnAskCancelRemove").data("kendoButton").enable(false);
                    }else{
                        gridChage(e);
                    }
                }
              })
    );

});

function gridChage(e){
    var grid = $("#grid").data("kendoExtGrid");
    var rows = grid.select()
      , cncBtnFlag = false
      , rmvBtnFlag = false;

    $.each(rows, function(idx, row){
        var item = grid.dataItem(row);
        if( (item.adjStatCd == "A" || item.adjStatCd == "Y") && dms.string.strNvl(item.adjStatCd) != "" ){
            cncBtnFlag = true;
        }

        if( dms.string.strNvl(item.adjStatCd) != "A" ){
            rmvBtnFlag = true;
        }

    });
    if(cncBtnFlag || rows.length == 0 ){
        $("#btnAskCancel").data("kendoButton").enable(false);
    }else{
        $("#btnAskCancel").data("kendoButton").enable(true);
    }
    if(rmvBtnFlag || rows.length == 0){
        $("#btnAskCancelRemove").data("kendoButton").enable(false);
    }else{
        $("#btnAskCancelRemove").data("kendoButton").enable(true);
    }

    /*
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
    */
}

// ERP실시간자금조회
function realErpSearch(){
    $.ajax({
        url:"<c:url value='/sal/orm/btoCreateOrder/selectBtoCreateOrderPreAmtSearch.do' />"
        //,data:JSON.stringify(param)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,async :false
        ,error:function(jqXHR, status, error) {
            //dms.notification.error(jqXHR.responseJSON.errors);
            paramSearch();
        }
        ,success:function(jqXHR, textStatus) {

            if(jqXHR.data.length > 0){
                $("#preAmt").data("kendoExtNumericTextBox").value(jqXHR.data[0].totBalAmt);
                $("#mortgageBalance").data("kendoExtNumericTextBox").value(jqXHR.data[0].prt3BalAmt);
                $("#unMortgageBalance").data("kendoExtNumericTextBox").value(jqXHR.data[0].prt2BalAmt+jqXHR.data[0].cashBalAmt);
            }else{
                $("#preAmt").data("kendoExtNumericTextBox").value("");
                $("#mortgageBalance").data("kendoExtNumericTextBox").value("");
                $("#unMortgageBalance").data("kendoExtNumericTextBox").value("");
            }
            paramSearch();
        }
    });
}


function paramSearch(){
    params["sCarlineCd"] = $("#sCarlineCd").val();
    params["sOcnCd"] = $("#sOcnCd").val();
    params["sOrdTp"] = $("#sOrdTp").val();
    //params["sPaym"] = $("#sMortgageTp").val();

    if(dms.string.isNotEmpty($("#hiddenFscCode").val())){
        sModelCd = $("#hiddenFscCode").val();
        params["sModelCd"]   = sModelCd;    // 모델
    }else{
        sFscCd = $("#sModelCd").data("kendoExtDropDownList").value();
        params["sFscCd"]   = sFscCd;    // fsc코드
    }

    if($("#sOrdTp").val() == "N1"){
        params["sOrdPrid"] = $("#sOrdYyMmPrid").data('kendoExtDropDownList').value();
    }else{
        params["sOrdStartDtStr"] = $("#sOrdDtS").val().replace(/-/gi, "");
        params["sOrdEndDtStr"] = $("#sOrdDtE").val().replace(/-/gi, "");
    }
    selectOrderSumSearch();

    $('#grid').data('kendoExtGrid').dataSource.page(1);
}

function selectOrderSumSearch(){
    $.ajax({
        url:"<c:url value='/sal/orc/orderPlacement/selectNotAssignedOrderSum.do' />"
        ,data:JSON.stringify(params)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,async :false
        ,error:function(jqXHR, status, error) {
            //dms.notification.error(jqXHR.responseJSON.errors);
        }
        ,success:function(jqXHR, textStatus) {
            $("#ordReqTotAmt").data("kendoExtNumericTextBox").value(jqXHR.aamtSum);

            var preAmt = $("#preAmt").data("kendoExtNumericTextBox").value();
            var ordReqAmt = $("#ordReqTotAmt").data("kendoExtNumericTextBox").value();

            if(Number(preAmt) > Number(ordReqAmt)){
                $("#lackAmt").data("kendoExtNumericTextBox").value(0);
            }else{
                $("#lackAmt").data("kendoExtNumericTextBox").value(Number(preAmt)-Number(ordReqAmt));
            }
        }
    });

}

</script>
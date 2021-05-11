<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 출고확정관리 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='global.title.deliveryFix' /></h1> <!-- 출고확정관리 -->
        <div class="btn_right">
            <button id="btnFixDelivery" class="btn_m"><spring:message code='global.btn.releaseComf' /></button>  <!-- 출고확정 -->
            <button id="btnCancelDelivery" class="btn_m"><spring:message code='global.btn.releaseFixCancel' /></button>    <!-- 출고확정취소 -->
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
        </div>
    </div>
    <div class="table_form form_width_70per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.contractStat' /></th>       <!-- 계약상태 -->
                    <td>
                        <input id="sContractStatCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.customer' /></th>  <!-- 고객 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="sContractCustNo" class="form_input" />
                                    <a href="javascript:bf_searchCustomer();"><spring:message code='global.btn.search' /></a>       <!-- 조회 -->
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sContractCustNm" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.giStatDt' /></th>       <!-- 출고요청일 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sGiReqStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sGiReqEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.contractNo' /></th>   <!-- 계약번호 -->
                    <td>
                        <input id="sContractNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractType' /></th>   <!-- 계약유형 -->
                    <td>
                        <input id="sContractTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.giFixDt' /></th>  <!-- 출고확정일 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sGiStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sGiEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th>   <!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th>         <!-- 모델 -->
                    <td>
                        <input id="sModelCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.ocn' /></th>        <!-- OCN -->
                    <td>
                        <input id="sOcnCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.extColor' /></th>        <!-- 외장색 -->
                    <td>
                        <input id="sExtColorCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.intColor' /></th>        <!-- 내장색 -->
                    <td>
                        <input id="sIntColorCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.dlReqDt' /></th>         <!-- 인도요청일 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sDlReqStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sDlReqEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.vinNum' /></th>  <!-- VIN NO -->
                    <td class="bor_none">
                        <input id="sVinNo" class="form_input">
                    </td>
                    <th scope="row" class="bor_none"></th>
                    <td class="bor_none"></td>
                    <th scope="row" class="bor_none"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
</section>
<!-- //출고요청관리 -->


<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일
var lastDay = "${lastDay}"; // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후
var vCustNo = "";

//계약상태 SAL002 (배정, 출고요청 만 표시)
var contractStatDSList = [];
var contractStatObj = {};
<c:forEach var="obj" items="${contractStatCdDS}">
    <c:if test="${obj.cmmCd eq '40' || obj.cmmCd eq '41'}">
        contractStatDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    contractStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//계약유형 SAL003
var contractTpDSList = [];
var contractTpObj = {};
<c:forEach var="obj" items="${contractTpDS}">
  contractTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  contractTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 차종
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

// 재고상태 SAL074
var stockTpObj = {};
<c:forEach var="obj" items="${stockTpDS}">
    stockTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

var popupWindow;    // 팝업

$(document).ready(function() {

    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){

            // 출고배정일
            if( ($("#sGiReqStartDt").data("kendoExtMaskedDatePicker").value() != null && $("#sGiReqEndDt").data("kendoExtMaskedDatePicker").value() == null)
                ||($("#sGiReqEndDt").data("kendoExtMaskedDatePicker").value() != null && $("#sGiReqStartDt").data("kendoExtMaskedDatePicker").value() == null)){
                //적용일을 모두 입력해 주세요
                  dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                  return false;
            }
            // 출고요청일
            if( ($("#sGiStartDt").data("kendoExtMaskedDatePicker").value() != null && $("#sGiEndDt").data("kendoExtMaskedDatePicker").value() == null)
                ||($("#sGiEndDt").data("kendoExtMaskedDatePicker").value() != null && $("#sGiStartDt").data("kendoExtMaskedDatePicker").value() == null)){
                //적용일을 모두 입력해 주세요
                  dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                  return false;
            }
            // 인도요청일
            if( ($("#sDlReqStartDt").data("kendoExtMaskedDatePicker").value() != null && $("#sDlReqEndDt").data("kendoExtMaskedDatePicker").value() == null)
                ||($("#sDlReqEndDt").data("kendoExtMaskedDatePicker").value() != null && $("#sDlReqStartDt").data("kendoExtMaskedDatePicker").value() == null)){
                  //적용일을 모두 입력해 주세요
                  dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                  return false;
            }

            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    $("#btnFixDelivery").kendoButton({ // 출고확정
        enable:true,
        click:function(e){
            bf_btnClick("btnFixDelivery");
        }
    });

    $("#btnCancelDelivery").kendoButton({ // 출고확정취소
        enable:true,
        click:function(e){
            bf_btnClick("btnCancelDelivery");
        }
    });

    // 계약상태
    $("#sContractStatCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:contractStatDSList
       ,optionLabel:" "   // 전체
    });


    // 출고확정 시작일
    $("#sGiStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

    // 출고확정 종료일
    $("#sGiEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 계약유형
    $("#sContractTp").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:contractTpDSList
       ,optionLabel:" "   // 전체
    });

    // 출고요청 시작일
    $("#sGiReqStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:oneDay
   });

   // 출고요청 종료일
   $("#sGiReqEndDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:toDay
   });

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

          $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
          $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

          $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
          $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

          if(dataItem.carlineCd == ""){
              $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
              $("#sModelCd").data("kendoExtDropDownList").enable(false);
              return false;
          }

          var responseJson = dms.ajax.getJson({
              url:"<c:url value='/sal/veh/vehicleMaster/selectModel.do' />"
              ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
              ,async:false
          });
          $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
      }
   });

   // 모델
   $("#sModelCd").kendoExtDropDownList({
       dataTextField:"modelNm"
      ,dataValueField:"modelCd"
      ,optionLabel:" "   // 전체
      ,select:function(e){
          var dataItem = this.dataItem(e.item);
          $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
          $("#sOcnCd").data("kendoExtDropDownList").enable(true);

          $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
          $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

          $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
          $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

          if(dataItem.modelCd == ""){
              $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
              $("#sOcnCd").data("kendoExtDropDownList").enable(false);
              return false;
          }
          var responseJson = dms.ajax.getJson({
              url:"<c:url value='/sal/veh/vehicleMaster/selectOcn.do' />"
              ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").val(), "modelCd":dataItem.modelCd})
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
           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(true);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           if(this.dataItem(e.item).ocnCd == ""){
               $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectExtColor.do' />"
               ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
               ,async:false
           });
           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
   });
   $("#sOcnCd").data("kendoExtDropDownList").enable(false);

   //외장색
   $("#sExtColorCd").kendoExtDropDownList({
        dataTextField: "extColorNm"
       ,dataValueField:"extColorCd"
       ,optionLabel:" "   // 전체
       ,select:function(e){
           if(this.dataItem(e.item).extColorCd == ""){
               $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(true);

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectIntColor.do' />"
               ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
               ,async:false
           });
           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
   });
   $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

   //내장색
   $("#sIntColorCd").kendoExtDropDownList({
        dataTextField: "intColorNm"
       ,dataValueField:"intColorCd"
       ,optionLabel:" "   // 전체
   });
   $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

   // 인도요청 시작일
   $("#sDlReqStartDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
      ,value:toDay
  });
  // 인도요청 종료일
  $("#sDlReqEndDt").kendoExtMaskedDatePicker({
      format:"<dms:configValue code='dateFormat' />"
      ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
      ,value:nextMonthDay
  });

  $("#sContractCustNo").on('change', fnCheckCustValue);   // 고객
  // 출고요청 시작일, 종료일
  $("#sGiReqStartDt").on('change', {from:$("#sGiReqStartDt"), to:$("#sGiReqEndDt")}, fnChkSearchDate);
  $("#sGiReqEndDt").on('change',   {from:$("#sGiReqStartDt"), to:$("#sGiReqEndDt")}, fnChkSearchDate);
  // 출고확정 시작일, 종료일
  $("#sGiStartDt").on('change', {from:$("#sGiStartDt"), to:$("#sGiEndDt")}, fnChkSearchDate);
  $("#sGiEndDt").on('change',   {from:$("#sGiStartDt"), to:$("#sGiEndDt")}, fnChkSearchDate);
  //인도요청 시작일, 종료일
  $("#sDlReqStartDt").on('change', {from:$("#sDlReqStartDt"), to:$("#sDlReqEndDt")}, fnChkSearchDate);
  $("#sDlReqEndDt").on('change',   {from:$("#sDlReqStartDt"), to:$("#sDlReqEndDt")}, fnChkSearchDate);

  // 메인 그리드
  $("#grid").kendoExtGrid({
      dataSource:{
          transport:{
              read:{
                  url:"<c:url value='/sal/ctm/deliveryFix/selectDeliveryFixs.do' />"
              },
              parameterMap:function(options, operation) {
                  if (operation === "read") {

                      var params = {};
                      params["recordCountPerPage"] = options.pageSize;
                      params["pageIndex"] = options.page;
                      params["firstIndex"] = options.skip;
                      params["lastIndex"] = options.skip + options.take;
                      params["sort"] = options.sort;

                      // 계약상태
                      params["sContractStatCd"] = $("#sContractStatCd").data("kendoExtDropDownList").value();
                      // 고객
                      params["sContractCustNo"] = $("#sContractCustNo").val();
                      // 출고요청 시작일
                      params["sGiReqStartDt"] = $("#sGiReqStartDt").data("kendoExtMaskedDatePicker").value();
                      // 출고요청 종료일
                      params["sGiReqEndDt"] = $("#sGiReqEndDt").data("kendoExtMaskedDatePicker").value();
                      // 계약번호
                      params["sContractNo"] = $("#sContractNo").val();
                      // 계약유형
                      params["sContractTp"] = $("#sContractTp").data("kendoExtDropDownList").value();
                      // 출고확정 시작일
                      params["sGiStartDt"] = $("#sGiStartDt").data("kendoExtMaskedDatePicker").value();
                      // 출고확정 종료일
                      params["sGiEndDt"] = $("#sGiEndDt").data("kendoExtMaskedDatePicker").value();
                      // 차종
                      params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                      // 모델
                      params["sModelCd"] = $("#sModelCd").data("kendoExtDropDownList").value();
                      // ocn
                      params["sOcnCd"] = $("#sOcnCd").data("kendoExtDropDownList").value();
                      // 외장색
                      params["sExtColorCd"] = $("#sExtColorCd").data("kendoExtDropDownList").value();
                      // 내장색
                      params["sIntColorCd"] = $("#sIntColorCd").data("kendoExtDropDownList").value();
                      // 인도요청 시작일
                      params["sDlReqStartDt"] = $("#sDlReqStartDt").data("kendoExtMaskedDatePicker").value();
                      // 인도요청 종료일
                      params["sDlReqEndDt"] = $("#sDlReqEndDt").data("kendoExtMaskedDatePicker").value();
                      // vin no
                      params["sVinNo"] = $("#sVinNo").val();

                      //console.log('grid params:',kendo.stringify(params) );
                      return kendo.stringify(params);

                  }else if (operation !== "read" && options.models) {
                      return kendo.stringify(options.models);
                  }
              }
          }
          ,schema:{
              model:{
                  id:"contractNo",
                  fields:{
                       giStat    :{type:"string"}
                      ,giStatCd  :{type:"string"}
                      ,allocQueNo:{type:"string"}
                      ,vinNo     :{type:"string"}
                      ,carlineCd :{type:"string"}
                      ,carlineNm :{type:"string"}
                      ,modelCd   :{type:"string"}
                      ,modelNm   :{type:"string"}
                      ,ocnCd     :{type:"string"}
                      ,ocnNm     :{type:"string"}
                      ,extColorCd:{type:"string"}
                      ,extColorNm:{type:"string"}
                      ,intColorCd:{type:"string"}
                      ,intColorNm:{type:"string"}
                      ,dlrCd     :{type:"string"}
                      ,contractNo:{type:"string"}
                      ,contractCustNo:{type:"string"}
                      ,custNm    :{type:"string"}
                      ,contractTp:{type:"string"}
                      ,saleEmpNo :{type:"string"}
                      ,contractDt:{type:"date"}
                      ,dlReqDt   :{type:"date"}
                      ,contractStatCd:{type:"string"}
                      ,stockTp   :{type:"string"}
                      ,giReqDt   :{type:"date"}
                      ,giDt      :{type:"date"}
                  }
              }
          }
      }
     ,multiSelectWithCheckbox:false
     ,editable   :false
     ,autoBind   :false
     ,navigatable:true
     ,selectable :"row"
     ,change:function(e){
        var grid = $("#grid").data("kendoExtGrid");
        var selectUid = grid.select()[0].attributes["data-uid"].nodeValue;

        var rows = grid.tbody.find("tr > td > input");
        $.each(rows, function(idx, row){

            // 선택한 uid와 전체 row의 uid가 같은 input 객체.
            if(selectUid == $(this).attr("data-uid")){
                if(row.disabled == false){
                    if(row.checked){
                        row.checked = false;
                    }else{
                        row.checked = true;
                        bf_checkGiStat(row);    // 다른 콤보박스 체크 초기화.
                    }
                }
            }
        });
     }
     ,columns:[
         {      // 선택
             field:"chk", title:"<spring:message code='global.lbl.check' />", width:50
            ,headerAttributes:{style:"text-align:center;"}
            ,attributes:{style:"text-align:center;"}
            ,sortable:false
            ,template:'<input type="checkbox" class="checkbox" data-uid=#= uid # onclick="bf_checkGiStat(this)" id="chk" #= giStat=="Y"? disabled="disabled":"" #  />'
         }
        ,{field:"giStat", hidden:true}
        ,{field:"giStatCd", hidden:true}    // 출고문서상태
        ,{field:"allocQueNo", title:"<spring:message code='global.lbl.allocQueNo' />", width:100, attributes:{"class":"ac"}} // 배정번호
        ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNum' />", width:160, attributes:{"class":"ac"}} // VIN NO
        ,{      // 차종정보
            title:"<spring:message code='global.lbl.carLineInfo' />", headerAttributes:{ "class":"hasBob" }
            ,columns:[
               {field:"carlineCd", hidden:true}
              ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", width:150}   // 차종
              ,{field:"modelCd", hidden:true}
              ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:250} // 모델
              ,{field:"ocnCd", hidden:true}
              ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocn' />", width:220} //OCN
              ,{field:"extColorCd", hidden:true}
              ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />", width:180}   //외장색
              ,{field:"intColorCd", hidden:true}
              ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />", width:180}   //내장색
            ]
         }
        ,{  // 계약정보
            title:"<spring:message code='global.lbl.contractInfo' />", headerAttributes:{ "class":"hasBob" }
            ,columns:[
               {field:"dlrCd", hidden:true}
              ,{field:"contractNo", title:"<spring:message code='global.lbl.contractNo' />", width:120}   // 계약번호
              ,{field:"contractCustNo", hidden:true}
              ,{field:"custNm", title:"<spring:message code='global.lbl.customer' />", width:100}  // 고객
              ,{field:"contractTp", title:"<spring:message code='global.lbl.contractType' />", width:100, template:"#=contractTpObj[contractTp]#"}   // 계약유형
              ,{field:"saleEmpNo", title:"<spring:message code='global.lbl.salEmp' />", width:100}     // 판매사원
              ,{field:"contractDt", title:"<spring:message code='global.lbl.contractDate' />", width:100, attributes:{"class":"ac"}, format:"{0:"+vDtyyyyMMdd+"}"}       //계약일
              ,{field:"dlReqDt", title:"<spring:message code='global.lbl.dlReqDt' />", width:100, attributes:{"class":"ac"}, format:"{0:"+vDtyyyyMMdd+"}"}   //고객인도요청일
            ]
         }
        ,{field:"contractStatCd", title:"<spring:message code='global.lbl.contractStat' />", width:100, attributes:{"class":"ac"}, template:"#=contractStatObj[contractStatCd]#"} // 계약상태
        ,{field:"stockTp", title:"<spring:message code='global.lbl.stockStat' />", width:100, attributes:{"class":"ac"}, template:"#=dms.string.strNvl(stockTpObj[stockTp])#"} // 재고상태
        ,{field:"giReqDt", title:"<spring:message code='global.lbl.giStatDt' />", width:100, attributes:{"class":"ac"}, format:"{0:"+vDtyyyyMMdd+"}"} // 출고요청일
        ,{field:"giDt", title:"<spring:message code='global.lbl.giFixDt' />", width:100, attributes:{"class":"ac"}, format:"{0:"+vDtyyyyMMdd+"}"} // 출고확정일
     ]
 });

    // 고객조회
    bf_searchCustomer = function(){

        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {
                            //console.log(data);
                            var custTp = data[0].custTp;
                            $("#sContractCustNo").val(data[0].custNo);       // 고객코드
                            $("#sContractCustNm").val(data[0].custNm);       // 고객명
                            vCustNo = data[0].custNo;
                        }
                        popupWindow.close();
                    }
                }
            }
        });
    }

    // 버튼 클릭 처리
    bf_btnClick = function(mg){
        var fixURL = "";
        var grid = $("#grid").data("kendoExtGrid");
        var rows = grid.tbody.find("tr");

        var  item = {};
        rows.each(function(index, row) {
            // 체크여부
            var check = $(".checkbox[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");
            if( check ){
                item = grid.dataItem(row);
            }
        });

        if(item.id == null){
            // 항목을(를) 선택해주세요.
            dms.notification.info("<spring:message code='global.lbl.item' var='globalLblItem' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblItem}' />");
            return false;
        }

        // 출고확정 처리
        if(mg == "btnFixDelivery"){
            if(item.contractStatCd != "40"){
                // 해당 내역은 출고요청 상태가 아닙니다.
                dms.notification.info("<spring:message code='global.lbl.releaseReq' var='globalLblReleaseReq' /><spring:message code='global.info.stateNotMsg' arguments='${globalLblReleaseReq}' />");
                return false;
            }

            // 출고확정을 하겠습니까?
            if(!confirm("<spring:message code='global.lbl.releaseComf' var='globalLblReleaseComf' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblReleaseComf}' />")){
                return false;
            }

            fixURL = "<c:url value='/sal/ctm/deliveryFix/confirmFixDelivery.do' />";
        }
        else if(mg == "btnCancelDelivery"){  // 출고요청 취소
            if(item.contractStatCd != "41"){
                // 해당 내역은 출고확정 상태가 아닙니다.
                dms.notification.info("<spring:message code='global.lbl.releaseComf' var='globalLblReleaseComf' /><spring:message code='global.info.stateNotMsg' arguments='${globalLblReleaseComf}' />");
                return false;
            }

            // 출고요청을 취소 하겠습니까?
            if(!confirm("<spring:message code='global.lbl.releaseReq' var='globalLblReleaseReq' /><spring:message code='global.lbl.cancel' var='globalLblCancel' /><spring:message code='global.info.cnfrmsMsg' arguments='${globalLblReleaseReq}, ${globalLblCancel}' />")){
                return false;
            }

            fixURL = "<c:url value='/sal/ctm/deliveryFix/confirmFixDeliveryCancel.do' />";
        }else{
            return false;
        }

        var param = {};
        param.dlrCd = item.dlrCd;
        param.contractNo = item.contractNo;

        $.ajax({
            url:fixURL,
            data:JSON.stringify(param),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            },
            success:function(jqXHR, textStatus) {
                $('#grid').data('kendoExtGrid').dataSource.page(1);
                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
         });
    }

    // 간반차트를 통해 넘어온 경우.
    if("${contNo}" != ""){
        $("#sContractNo").val("${contNo}");  // 계약번호
        $("#sGiReqStartDt").data("kendoExtMaskedDatePicker").value('');  // 출고요청 시작일
        $("#sGiReqEndDt").data("kendoExtMaskedDatePicker").value('');    // 출고요청 종료일
        $("#sGiStartDt").data("kendoExtMaskedDatePicker").value('');     // 출고확정 시작일
        $("#sGiEndDt").data("kendoExtMaskedDatePicker").value('');       // 출고확정 종료일
        $("#sDlReqStartDt").data("kendoExtMaskedDatePicker").value('');     // 인도요청일
        $("#sDlReqEndDt").data("kendoExtMaskedDatePicker").value('');       // 인도요청일
        $("#grid").data("kendoExtGrid").dataSource.page(1);
    }

});

//검색조건:고객
fnCheckCustValue = function(){
  if($("#sContractCustNo").val() != vCustNo){
      $("#sContractCustNm").val("");
  }
}

//조회조건:시작일-종료일 날짜 비교
fnChkSearchDate = function(e){
  if(dms.string.isEmpty(e.data.from.val())){return;}
  if(dms.string.isEmpty(e.data.to.val())){return;}

  var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
  var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
  if(startDt > endDt){
      dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
      $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
      $(this).focus();
  }
}

//다른 콤보박스 체크 초기화
function bf_checkGiStat(obj){
   var check = obj.checked;

   if(check){
       var grid = $("#grid").data("kendoExtGrid");
       var rows = grid.tbody.find("tr > td > input");
       $.each(rows, function(idx, row){
           row.checked = false;
       });

       obj.checked = true;
   }
}

</script>

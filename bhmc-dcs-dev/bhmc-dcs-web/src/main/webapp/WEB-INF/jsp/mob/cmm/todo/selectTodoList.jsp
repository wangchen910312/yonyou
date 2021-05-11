<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>



<script type="text/x-kendo-template" id="list-template">
    <div class="dlistitem">
        <span class="strong">#:ocnNm #</span>
        <span class="fright">#:ordTp #</span>
        <span class="clboth">#:ordQty #</span>
        <span class="fright">#:cnclQty #</span>
    </div>
</script>
<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({
  transport:{
    read:function(options) {
      if (rowIndex >= rowTotal)
      {
          return;
      }
      app.showLoading();
      pageIndex++;
      //alert("KBS Loading page ["+pageIndex+"]");

      var params = {};
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;
      //params["sort"] = options.sort;

      //딜러코드
      params["sDlrCd"] = parent.dlrCd;

      //주문유형
      if(parent.$("#sOrdTp").data("kendoExtDropDownList").value() != ""){
          params["sOrdTp"] = parent.$("#sOrdTp").data("kendoExtDropDownList").value();

          parent.$("#siOrdTp").text(parent.$("#sOrdTp").data("kendoExtDropDownList").text());
          parent.$("#stOrdTp").show();
      }
      else
      {
          parent.$("#siOrdTp").text("");
          parent.$("#stOrdTp").hide();
      }
      if(parent.$("#sOrdTp").data("kendoExtDropDownList").value() != "N1"){
          if(parent.$("#sOrdStartDt").val() != "" && parent.$("#sOrdEndDt").val() != ""){
              // 기간
              params["sOrdStartDt"] = new Date(parent.$("#sOrdStartDt").val());
              params["sOrdEndDt"] = new Date(parent.$("#sOrdEndDt").val());

              parent.$("#siOrdStartDt").text(parent.$("#sOrdStartDt").val());
              parent.$("#siOrdEndDt").text(parent.$("#sOrdEndDt").val());
              parent.$("#stOrdStartDt").show();
          }
          else
          {
              parent.$("#siOrdStartDt").text("");
              parent.$("#siOrdEndDt").text("");
              parent.$("#stOrdStartDt").hide();
          }
          parent.$("#siOrdYyMmPrid").val("");
          parent.$("#stOrdYyMmPrid").hide();
      }else{
          // 주차
          var ordYyMmPrid = parent.$("#sOrdYyMmPrid").data("kendoExtDropDownList").value();
          if(ordYyMmPrid != ""){
              params["sOrdYyMmDt"] = ordYyMmPrid.substring(0, 6);
              params["sOrdPrid"]   = ordYyMmPrid.substring(6, 8);

              parent.$("#siOrdYyMmPrid").text(ordYyMmPrid.substring(0, 6) + "-" + ordYyMmPrid.substring(6, 8));
              parent.$("#stOrdYyMmPrid").show();

          }
          else
          {
              parent.$("#siOrdYyMmPrid").text("");
              parent.$("#stOrdYyMmPrid").hide();
          }
          parent.$("#siOrdStartDt").text("");
          parent.$("#siOrdEndDt").text("");
          parent.$("#stOrdStartDt").hide();
      }

      //주문상태
      if(parent.$("#sOrdStatCd").data("kendoExtDropDownList").value() != "") {
          params["sOrdStatCd"] = parent.$("#sOrdStatCd").data("kendoExtDropDownList").value();

          parent.$("#siOrdStatCd").text(parent.$("#sOrdStatCd").data("kendoExtDropDownList").text());
          parent.$("#stOrdStatCd").show();
      }
      else
      {
          parent.$("#siOrdStatCd").text("");
          parent.$("#stOrdStatCd").hide();
      }

      // 차종
      if(parent.$("#sCarlineCd").data("kendoExtDropDownList").value() != "") {
          params["sCarlineCd"] = parent.$("#sCarlineCd").data("kendoExtDropDownList").value();

          parent.$("#siCarlineCd").text(parent.$("#sCarlineCd").data("kendoExtDropDownList").text());
          parent.$("#stCarlineCd").show();
      }
      else
      {
          parent.$("#siCarlineCd").text("");
          parent.$("#stCarlineCd").hide();
      }

      // 모델
      if(parent.$("#sModelCd").data("kendoExtDropDownList").value() != "") {
          params["sModelCd"] = parent.$("#sModelCd").data("kendoExtDropDownList").value();

          parent.$("#siModelCd").text(parent.$("#sModelCd").data("kendoExtDropDownList").text());
          parent.$("#stModelCd").show();
      }
      else
      {
          parent.$("#siModelCd").text("");
          parent.$("#stModelCd").hide();
      }

      // OCN
      if(parent.$("#sOcnCd").data("kendoExtDropDownList").value() != "") {
          params["sOcnCd"] = parent.$("#sOcnCd").data("kendoExtDropDownList").value();

          parent.$("#siOcnCd").text(parent.$("#sOcnCd").data("kendoExtDropDownList").text());
          parent.$("#stOcnCd").show();
      }
      else
      {
          parent.$("#siOcnCd").text("");
          parent.$("#stOcnCd").hide();
      }

      // 외장색
      if(parent.$("#sExtColorCd").data("kendoExtDropDownList").value() != "") {
          params["sExtColorCd"] = parent.$("#sExtColorCd").data("kendoExtDropDownList").value();

          parent.$("#siExtColorCd").text(parent.$("#sExtColorCd").data("kendoExtDropDownList").text());
          parent.$("#stExtColorCd").show();
      }
      else
      {
          parent.$("#siExtColorCd").text("");
          parent.$("#stExtColorCd").hide();
      }

      // 내장색
      if(parent.$("#sIntColorCd").data("kendoExtDropDownList").value() != "") {
          params["sIntColorCd"] = parent.$("#sIntColorCd").data("kendoExtDropDownList").value();

          parent.$("#siIntColorCd").text(parent.$("#sIntColorCd").data("kendoExtDropDownList").text());
          parent.$("#stIntColorCd").show();
      }
      else
      {
          parent.$("#siIntColorCd").text("");
          parent.$("#stIntColorCd").hide();
      }

      parent.$("#content_list").css("display","block");

      parent.setMainListHeight();

      $.ajax({
          url:"<c:url value='/sal/orc/sumOrderCnt/selectSumOrderCntDlrs.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              //alert("KBS Loading page Error ["+pageIndex+"]");
              //mob.notification.error(jqXHR.responseJSON.errors);
              app.hideLoading();
          }
          ,success:function(result) {
              var data = [];
              rowTotal = result.total;

              //alert("KBS Loading page Success ["+pageIndex+"]");
              if (rowTotal > 0) {
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({pageIdx:pageIndex, rowIdx:rowIndex, dlrCd:row.dlrCd, ordYyMmDt:row.ordYyMmDt, ordPrid:row.ordPrid, yyMm:row.yyMm, week:row.week, ordStatCd:row.ordStatCd, ordGradeCd:row.ordGradeCd, carlineCd:row.carlineCd, carlineNm:row.carlineNm, modelCd:row.modelCd, modelNm:row.modelNm, ocnCd:row.ocnCd, ocnNm:row.ocnNm, extColorCd:row.extColorCd, extColorNm:row.extColorNm, intColorCd:row.intColorCd, intColorNm:row.intColorNm, ordTp:row.ordTp, ordQty:row.ordQty, fstConfirmQty:row.fstConfirmQty, scndConfirmQty:row.scndConfirmQty, cnclQty:row.cnclQty, cnclRsn:row.cnclRsn, nOrdQty:row.nOrdQty, pdiQty:row.pdiQty, vinQty:row.vinQty, dlrSaleQty:row.dlrSaleQty, ordNo:row.ordNo, finalQty:row.finalQty, wtOrdQty:row.wtOrdQty, dlrCnclQty:row.dlrCnclQty});
                  });
              }

              options.success(data);

              //alert("KBS Loading page Success ["+pageIndex+"]");
              app.hideLoading();

              //정상적으로 반영 되었습니다.
              //mob.notification.success("<spring:message code='global.info.success'/>");
          }
      });
    }
  },

  pageSize:pageSize,
  serverPaging:true,
  schema:{
      total:function(){ return rowTotal; }
  }

});

function listViewClick(e)
{
    parent.contentDetail(e.dataItem.dlrCd, e.dataItem.ordYyMmDt, e.dataItem.ordPrid, e.dataItem.yyMm, e.dataItem.week, e.dataItem.ordStatCd, e.dataItem.ordGradeCd, e.dataItem.carlineCd, e.dataItem.carlineNm, e.dataItem.modelCd, e.dataItem.modelNm, e.dataItem.ocnCd, e.dataItem.ocnNm, e.dataItem.extColorCd, e.dataItem.extColorNm, e.dataItem.intColorCd, e.dataItem.intColorNm, e.dataItem.ordTp, e.dataItem.ordQty, e.dataItem.fstConfirmQty, e.dataItem.scndConfirmQty, e.dataItem.cnclQty, e.dataItem.cnclRsn, e.dataItem.nOrdQty, e.dataItem.pdiQty, e.dataItem.vinQty, e.dataItem.dlrSaleQty, e.dataItem.ordNo, e.dataItem.finalQty, e.dataItem.wtOrdQty, e.dataItem.dlrCnclQty);
}

//var app = new kendo.mobile.Application();
var app = setKendoMobApp();
</script>

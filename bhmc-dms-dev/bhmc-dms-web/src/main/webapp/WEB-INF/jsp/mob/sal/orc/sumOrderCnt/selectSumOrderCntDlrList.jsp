﻿<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <span style="width:50%">#:'['+trimNull(carlineCd)+']' ##:trimNull(carlineNm) #</span>
        <span style="width:50%">#:trimNull(extColorNm) + " / " + trimNull(intColorCd) #</span>
        <span style="width:50%">#:trimNull(ocnCd) + " / " + trimNull(modelNm) #</span>
        <span style="width:50%">#:'['+trimNull(ordTp)+']'##:changeOrdTp(ordTp) #</span>
        <span style="width:100%">#:ordQty + " / " + fstConfirmQty + " / " + scndConfirmQty + " / " + finalConfQty #</span>
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

      /*
      if(parent.$("#sOrdsTp").data("kendoExtDropDownList").value() != ""){
          params["sOrdsTp"] = parent.$("#sOrdsTp").data("kendoExtDropDownList").value();
      }
      */

      var strOrdTp = parent.$("#sOrdsTp").data('kendoExtDropDownList').value();
      var strOrdYyMmPrid ;
      var dtOrdDtS;
      var dtOrdDtE;
      if(strOrdTp == null || strOrdTp == ""){
          strOrdYyMmPrid = "";
          dtOrdDtS = "";
          dtOrdDtE = "";
      }else {
          strOrdYyMmPrid = parent.$("#sOrdYyMmPrid").data('kendoExtDropDownList').value();
          dtOrdDtS = chgDate(parent.$("#sOrdStartDt").val());
          dtOrdDtE = chgDate(parent.$("#sOrdEndDt").val());
      }

      var sOrdTp = parent.$('input:radio[name=radio]:checked').val();
      if(sOrdTp == "Y"){
          dtOrdDtS = "";
          dtOrdDtE = "";
          strOrdTp = "N1";
      }else{
          strOrdYyMmPrid = "";

      }

      params["sOrdsTp"] = sOrdTp;
      params["strOrdTp"] = strOrdTp;
      params["sOrdPrid"] = strOrdYyMmPrid;
      params["sOrdStartDt"] = dtOrdDtS;
      params["sOrdEndDt"] = dtOrdDtE;




      //주문상태
      params["sOrdStatCd"] = parent.$("#sOrdStatCd").data("kendoExtDropDownList").value();
      // 차종
      params["sCarlineCd"] = parent.$("#sCarlineCd").data("kendoExtDropDownList").value();
      // 모델
      //params["sModelCd"] = parent.$("#sModelCd").data("kendoExtDropDownList").value();
      var sOcnCd = parent.$("#sOcnCd").data("kendoExtDropDownList").value();
      var sModelCd="";
      var sFscCd="";
      if(dms.string.isNotEmpty(sOcnCd)){
          sModelCd = parent.$("#hiddenFscCode").val();
      }else{
          sFscCd = parent.$("#sModelCd").data("kendoExtDropDownList").value();
      }

      params["sFscCd"]   = sFscCd;    // fsc명
      params["sModelCd"]   = sModelCd;    // 모델
      // OCN
      params["sOcnCd"] = parent.$("#sOcnCd").data("kendoExtDropDownList").value();
      // 외장색
      params["sExtColorCd"] = parent.$("#sExtColorCd").data("kendoExtDropDownList").value();
      // 내장색
      params["sIntColorCd"] = parent.$("#sIntColorCd").data("kendoExtDropDownList").value();



      //params["sOrdPrid"] = "";
      parent.totalOrdQty=0;
      parent.totalFinalConfQty=0;
      parent.totalFstConfirmQty=0;
      parent.totalScndConfirmQty=0;

      $.ajax({
          url:"<c:url value='/sal/orc/sumOrderCnt/selectSumOrderCntDlrs.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              //alert("KBS Loading page Error ["+pageIndex+"]");
              //mob.notification.error(jqXHR.responseJSON.errors);
              parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
              app.hideLoading();
          }
          ,success:function(result) {
              checklistCnt("listarea_noData",result.total,noDatamsg);
              if(result.data!=null){
                  var data = [];
                  rowTotal = result.data.length;

                  //alert("KBS Loading page Success ["+pageIndex+"]");
                  $.each(result.data , function(i , row){
                      console.log("row:::",row);
                      rowIndex++;
                      data.push({pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          dlrCd:row.dlrCd,
                          ordYyMmDt:row.ordYyMmDt,
                          ordPrid:row.ordPrid,
                          yyMm:row.yyMm,
                          week:row.week,
                          ordStatCd:row.ordStatCd,
                          ordGradeCd:row.ordGradeCd,
                          carlineCd:row.carlineCd,
                          carlineNm:row.carlineNm,
                          modelCd:row.modelCd,
                          modelNm:row.modelNm,
                          ocnCd:row.ocnCd,
                          ocnNm:row.ocnNm,
                          extColorCd:row.extColorCd,
                          extColorNm:row.extColorNm,
                          intColorCd:row.intColorCd,
                          intColorNm:row.intColorNm,
                          ordTp:row.ordTp,
                          ordQty:row.ordQty,
                          fstConfirmQty:row.fstConfirmQty,
                          scndConfirmQty:row.scndConfirmQty,
                          cnclQty:row.cnclQty,
                          cnclRsn:row.cnclRsn,
                          nOrdQty:row.nOrdQty,
                          nonAlocQty:row.nonAlocQty,
                          pdiQty:row.pdiQty,
                          sumTotalQty:row.sumTotalQty,
                          scndParIsffAdjQty:row.scndParIsffAdjQty,
                          vinQty:row.vinQty,
                          dlrSaleQty:row.dlrSaleQty,
                          gateOutQty:row.gateOutQty,
                          dlrInQty:row.dlrInQty,
                          dlrOutQty:row.dlrOutQty,
                          ordNo:row.ordNo,
                          finalQty:row.finalQty,
                          wtOrdQty:row.wtOrdQty,
                          dlrCnclQty:row.dlrCnclQty,
                          finalConfQty:row.finalConfQty,

                          missSetQty:row.missSetQty,
                          tranMissQty:row.tranMissQty
                      });

                      parent.totalOrdQty += row.ordQty
                      parent.totalFinalConfQty += row.finalConfQty;
                      parent.totalFstConfirmQty += row.fstConfirmQty;
                      parent.totalScndConfirmQty += row.scndConfirmQty;

                   });

                  options.success(data);

                  //alert("KBS Loading page Success ["+pageIndex+"]");
                  app.hideLoading();

                  parent.$("#totalSum").html(parent.totalOrdQty + "/" + parent.totalFstConfirmQty + "/" + parent.totalScndConfirmQty + "/" +parent.totalFinalConfQty);

                  //checkResultForChrom(rowIndex);
              } else {
                  app.hideLoading();
                  //checkResultForChrom(0);
              }

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

changeOrdTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.ordTpObj[val];
    }
    return returnVal;
};

/* function listViewClick(e)
{
    parent.contentDetail(e.dataItem.dlrCd, e.dataItem.ordYyMmDt, e.dataItem.ordPrid, e.dataItem.yyMm, e.dataItem.week, e.dataItem.ordStatCd, e.dataItem.ordGradeCd, e.dataItem.carlineCd, e.dataItem.carlineNm, e.dataItem.modelCd, e.dataItem.modelNm, e.dataItem.ocnCd, e.dataItem.ocnNm, e.dataItem.extColorCd, e.dataItem.extColorNm, e.dataItem.intColorCd, e.dataItem.intColorNm, e.dataItem.ordTp, e.dataItem.ordQty, e.dataItem.fstConfirmQty, e.dataItem.scndConfirmQty, e.dataItem.cnclQty, e.dataItem.cnclRsn, e.dataItem.nOrdQty, e.dataItem.pdiQty, e.dataItem.vinQty, e.dataItem.dlrSaleQty, e.dataItem.ordNo, e.dataItem.finalQty, e.dataItem.wtOrdQty, e.dataItem.dlrCnclQty);
} */

function listViewClick(e)
{
    parent.contentDetail(e);
}

//var app = new kendo.mobile.Application();
var app = setKendoMobApp();
</script>

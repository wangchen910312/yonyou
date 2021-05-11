<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<div data-role="view">
  <ul data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick" >
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
    <div class="dlistitem">
        <span style="width:50%">#:trimNull(rowData.carRegNo) #</span>
        <span style="width:50%">#:rowData.vinNo #</span>
        <span style="width:50%">#:rowData.calcDocNo #</span>
        <span style="width:50%">#:rowData.regUsrNm #</span>
        <span style="width:50%">#:rowData.roTpNm #</span>
        <span style="width:50%">#:changeRoStatCd(rowData.calcStatCd) #</span>
        <span style="width:50%">#:rowData.regDt #</span>
        <span style="width:50%">#:rowData.roDt #</span>
    </div>
</script>


<script>

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

var listData = new kendo.data.DataSource({
  transport:{
    read:function(options) {

      if (rowIndex >= rowTotal){
          return;
      }

      app.showLoading();
      pageIndex++;

      var params = {};
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;

      params["sCarRegNo"]   = parent.$("#sCarRegNo").val();
      params["sRoTp"]       = parent.$("#sRoTp").data("kendoExtDropDownList").value();
      params["sCalcDocNo"]  = parent.$("#sCalcDocNo").val();
      params["sVinNo"]      = parent.$("#sVinNo").val();
      params["sRegUsrNm"]   = parent.$("#sRegUsrNm").val();
      params["sCalcStatCd"] = parent.$("#sCalcStatCd").data("kendoExtDropDownList").value();
      params["sCalcFromDt"] = chgDate(parent.$("#sCalcFromDt").val());
      params["sCalcToDt"]   = chgDate(parent.$("#sCalcToDt").val());
      params["sRoFromDt"]   = chgDate(parent.$("#sRoFromDt").val());
      params["sRoToDt"]     = chgDate(parent.$("#sRoToDt").val());

      /*
      params["sCarRegNo"] = parent.$("#sCarRegNo").val();//차량번호
      params["sVinNo"] = parent.$("#sVinNo").val();// VIN NO
      params["sRoDocNo"] = parent.$("#sRoDocNo").val();// RO번호

      if(parent.$("#sCalcFromDt").val() == ""){
          params["sCalcFromDt"] = null;
      }else{
          params["sCalcFromDt"] = chgDate(parent.$("#sCalcFromDt").val());
      }

      if(parent.$("#sCalcToDt").val() == ""){
          params["sCalcToDt"] = null;
      }else{
          params["sCalcToDt"] = chgDate(parent.$("#sCalcToDt").val());
      }

      params["sRoTp"] = parent.$("#sRoTp").data("kendoExtDropDownList").value();

      params["sCalcDocNo"]  = parent.$("#sCalcDocNo").val();
      params["sCarOwnerNm"] = parent.$("#sCarOwnerNm").val();
      params["sDriverNm"]   = parent.$("#sDriverNm").val();
      */

      console.log("params",params);


      $.ajax({
          //url:"<c:url value='/mob/ser/ro/repairOrder/selectRepairOrders.do' />"
          url:"<c:url value='/ser/cal/calculate/selectCalculatesList.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              app.hideLoading();
          }
          ,success:function(result) {
              checklistCnt("listarea_noData",result.total,noDatamsg);
              if(result.data!=null && result.data != ""){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({rowData:result.data[i]});
                  });

                  parent.makeDetailHtml(result.data, parent.keyMapArr, "#defaultHtml", "#hiddenHtml");

                  options.success(data);
                  app.hideLoading();
              }else{
                  app.hideLoading();
              }
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

// RO유형
roTpCdGrid = function(val){
     var returnVal = "";
     if(val != null && val != ""){
         returnVal = parent.roTpCdArr[val].cmmCdNm;
     }
     return returnVal;
}

changeRoStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.roStatCdMap[val].cmmCdNm;
    }
    return returnVal;
};

function listViewClick(e){
    //parent.contentDetail(e.dataItem.roDocNo);
    parent.contentDetail(e.dataItem.rowData);
}

var app = setKendoMobApp();
</script>
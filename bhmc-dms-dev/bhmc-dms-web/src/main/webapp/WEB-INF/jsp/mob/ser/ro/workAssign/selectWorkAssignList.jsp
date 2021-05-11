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
    <span style="width:50%">#:trimNull(rowData.carRegNo) #</span>
    <span style="width:50%">#:trimNull(rowData.vinNo) #</span>
    <span style="width:50%">#:trimNull(rowData.roDocNo) #</span>
    <span style="width:50%">#:trimNull(rowData.driverNm) #</span>
    <span style="width:50%">#:trimNull(rowData.roTpNm) #</span>
    <span style="width:50%">#:allocStatCdGrid(rowData.allocStatCd) #</span>
    <span style="width:50%">#:chgDate2DateTimeStr(rowData.roDt) #</span>
    <span style="width:50%">#:chgDate2DateTimeStr(rowData.expcDlDt) #</span>
</div>
</script>

<script>
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
      params["sort"] = null;


      params["sRoFromDt"] = chgDate(parent.$("#sRoFromDt").val());
      params["sRoToDt"] = chgDate(parent.$("#sRoToDt").val());
      params["sExpcDlFromDt"] = chgDate(parent.$("#sExpcDlFromDt").val());
      params["sExpcDlToDt"] = chgDate(parent.$("#sExpcDlToDt").val());
      params["sRoDocNo"] = parent.$("#sRoDocNo").val();
      params["sRoTp"] = parent.$("#sRoTp").data("kendoExtDropDownList").value();
      params["sVinNo"] = parent.$("#sVinNo").val();
      //params["sSaNm"] = parent.$("#sSaNm").val();driverNm
      params["sDriverNm"] = parent.$("#sSaNm").val();
      params["sCarRegNo"] = parent.$("#sCarRegNo").val();
      params["sAllocStatCd"] = parent.$("#sAllocStatCd").data("kendoExtDropDownList").value();
      params["sListType"] = "AL";

      /*
      if(parent.$("#sRoDt").val() == "" ){
          params["sRoToDt"] = null;
          params["sRoFromDt"] = null;
      }else{
          params["sRoToDt"] = chgDate(parent.$("#sRoDt").val());
          params["sRoFromDt"] = chgDate(parent.$("#sRoDtFrom").val());
      }
      if(parent.$("#sExpcDlDt").val() == "" && parent.$("#sExpcDlDtFrom").val() == "" ){
          params["sExpcDlToDt"] = null;
          params["sExpcDlFromDt"] = null;
      }else{
          params["sExpcDlToDt"] = chgDate(parent.$("#sExpcDlDt").val());
          params["sExpcDlFromDt"] = chgDate(parent.$("#sExpcDlDtFrom").val());
      }
      params["sRoDocNo"] = parent.$("#sRoDocNo").val();
      params["sAllocStatCd"] = parent.$("#sAllocStatCd").data("kendoExtDropDownList").value();
      params["sRoTp"] = parent.$("#sRoTp").data("kendoExtDropDownList").value();
      params["sBayNo"] = parent.$("#sBayNo").val();
      params["sVinNo"] = parent.$("#sVinNo").val();
      params["sSaNm"] = parent.$("#sSaNm").val();
      console.log("sCarRegNo : ", parent.$("#sCarRegNo").val());
      params["sCarRegNo"] = parent.$("#sCarRegNo").val();
      params["sListType"] = "AL";
      */

      console.log("params",params);

      $.ajax({
          url:"<c:url value='/ser/ro/repairOrder/selectRepairOrders.do' />"
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
                  if(rowTotal > result.data.length){
                      rowTotal = result.data.length;
                  }
                  $.each(result.data , function(i , row){
                      console.log("row",row);
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


//배정상태
chgRoStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(parent.roStatCdMap[val] != null){
            returnVal = parent.roStatCdMap[val].cmmCdNm;
        }else{
            returnVal = "";
        }
    }
    return returnVal;
};

//배정상태(위에 것 안쓰고 이것으로 수정)
allocStatCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(parent.allocStatCdMap[val] != undefined)
        returnVal = parent.allocStatCdMap[val].cmmCdNm;
    }
    return returnVal;
};

changeRoTpCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.roTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

function listViewClick(e){
    parent.contentDetail(e.dataItem.rowData);
}

var app = setKendoMobApp();

</script>
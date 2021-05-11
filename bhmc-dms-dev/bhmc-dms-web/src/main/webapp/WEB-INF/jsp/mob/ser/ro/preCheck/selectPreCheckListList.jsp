﻿<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div data-role="view">
  <ul id="subListView1" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">
    <span style="width:50%">#:trimNull(rowData.carRegNo) #</span>
    <span style="width:50%">#:trimNull(rowData.vinNo) #</span>
    <span style="width:50%">#:trimNull(rowData.diagDocNo) #</span>
    <span style="width:50%">#:trimNull(rowData.regUsrNm) #</span>
    <span style="width:50%">#:setCarAcptTpMap(rowData.carAcptTp) #</span>
    <span style="width:50%">#:setDiagStatCdMap(rowData.diagStatCd) #</span>
    <span style="width:50%">#:trimNull(chgDate2DateTimeStr(rowData.preChkDt)) #</span>
    <span style="width:50%">#:trimNull(rowData.carlineNm) #</span>
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

      params["sFromDt"]       = chgDate(parent.$("#sFromDt").val());
      params["sToDt"]         = chgDate(parent.$("#sToDt").val());
      params["sFromEndDt"]    = chgDate(parent.$("#sFromEndDt").val());
      params["sToEndDt"]      = chgDate(parent.$("#sToEndDt").val());
      params["sCarRegNo"]     = parent.$("#sCarRegNo").val();
      params["sDriverNm"]     = parent.$("#sDriverNm").val();
      params["sRegUsrNm"]     = parent.$("#sRegUsrNm").val();
      params["sCarOwnerNm"]   = parent.$("#sCarOwnerNm").val();
      params["sCarAcptTp"]    = parent.$("#sCarAcptTp").data("kendoExtDropDownList").value();
      params["sVinNo"]        = parent.$("#sVinNo").val();
      params["sDiagDocNo"]    = parent.$("#sDiagDocNo").val();
      params["sDiagStatCd"]   = parent.$("#sDiagStatCd").data("kendoExtDropDownList").value();
      params["sCarlineCd"]   = parent.$("#sCarlineCd").data("kendoExtDropDownList").value();

      $.ajax({
          url:"<c:url value='/mob/ser/ro/preCheck/selectPreCheckListMains.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              app.hideLoading();
          }
          ,success:function(result) {
              checklistCnt("listarea_noData",result.total,noDatamsg);
              if(result.data!=null){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({rowData:result.data[i]});
                  });
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


function listViewClick(e){
    parent.contentDetail(e.dataItem.rowData);
}

//입고점검유형
setCarAcptTpMap = function(val){
    var resultVal = "";
    if( dms.string.isNotEmpty(val)){
        if(parent.carAcptTpMap[val] != undefined)
        resultVal = parent.carAcptTpMap[val].cmmCdNm;
    }
    return resultVal;
};

//사전점검상태
setDiagStatCdMap = function(val){
    var resultVal = "";
    if( dms.string.isNotEmpty(val)){
        if(parent.diagStatCdMap[val] != undefined)
        resultVal = parent.diagStatCdMap[val].cmmCdNm;
    }
    return resultVal;
};

var app = setKendoMobApp();

</script>


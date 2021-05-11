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
    <span style="width:50%">#:trimNull(rowData.vinNo)   #</span>
    
    <span style="width:50%">#:trimNull(rowData.roDocNo) #</span>
    <span style="width:50%">#:trimNull(rowData.regUsrNm) #</span>

    <span style="width:50%">#:trimNull(rowData.roTpNm) #</span>
    <span style="width:50%">#:trimNull(rowData.roStatNm) #</span>

    <span style="width:50%">#:chgDate2DateTimeStr(rowData.roDt) #</span>
    <span style="width:50%">#:chgDate2DateTimeStr(rowData.expcDlDt) #</span>
</div>

</script>

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

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

var listData = new kendo.data.DataSource({
  transport:{
    read:function(options) {

      if (rowIndex >= rowTotal)
      {
          return;
      }
      app.showLoading();
      pageIndex++;

      var params = {};
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;

      params["sCarRegNo"]     = parent.$("#sCarRegNo").val();
      params["sRoStatCd"]     = parent.$("#sRoStatCd").data("kendoExtDropDownList").value();
      params["sRegUsrNm"]     = parent.$("#sRegUsrNm").val();
      params["sVinNo"]        = parent.$("#sVinNo").val();
      params["sRoDocNo"]      = parent.$("#sRoDocNo").val();
      params["sRoTp"]         = parent.$("#sRoTp").data("kendoExtDropDownList").value();
      params["sExpcDlToDt"]   = chgDate(parent.$("#sExpcDlToDt").val());
      params["sExpcDlFromDt"] = chgDate(parent.$("#sExpcDlFromDt").val());
      params["sRoFromDt"]     = chgDate(parent.$("#sRoFromDt").val());
      params["sRoToDt"]       = chgDate(parent.$("#sRoToDt").val());

      $.ajax({
          url:"<c:url value='/ser/ro/repairOrder/selectRepairOrdersList.do' />"

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


//수리진도
changeRoStatCd = function(val){
 var returnVal = "";
 if(val != null && val != ""){
     returnVal = parent.roStatCdMap[val].cmmCdNm;
 }
 return returnVal;
};

function listViewClick(e){
    parent.contentDetail(e.dataItem.rowData);
}

var app = setKendoMobApp();

</script>

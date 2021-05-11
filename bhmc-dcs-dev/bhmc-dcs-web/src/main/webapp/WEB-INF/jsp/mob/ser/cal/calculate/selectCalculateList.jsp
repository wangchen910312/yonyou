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
        <span style="width:35%">#:trimNull(carRegNo) #</span>
        <span style="width:65%">#:trimNull(vinNo) #</span>

        <span class="clboth" style="width:35%">#:roTpCdGrid(roTp) #</span>
        <span style="width:65%">#:trimNull(roDocNo) #</span>

        <span class="clboth" style="width:35%">#:trimNull(driverNm) #</span>
        <span style="width:35%">#:trimNull(saNm) #</span>
        <span style="width:30%">#:changeRoStatCd(roStatCd) #</span>

        <span class="clboth" style="width:100%">#:chgDate2DateTimeStr(expcDlDt) #</span>

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

      /*
      var sort = [];
      var sortItem = {};
      sortItem.field = "regDt";
      sortItem.dir = "desc";
      sort.push(sortItem);
      params["sort"] = sort;
      */

      //params["sort"] = [{"field":"regDt","dir":"desc"}];

      params["sCarRegNo"] = parent.$("#sCarRegNo").val();//차량번호
      params["sVinNo"] = parent.$("#sVinNo").val();// VIN NO
      params["sRoDocNo"] = parent.$("#sRoDocNo").val();// RO번호

      if(parent.$("#sRoFromDt").val() == "" || parent.$("#search4Area span[name='searchStr']").text() == ""){
          params["sRoFromDt"] = null;
      }else{
          params["sRoFromDt"] = chgDate(parent.$("#sRoFromDt").val());
      }

      if(parent.$("#sRoToDt").val() == "" || parent.$("#search4Area span[name='searchStr']").text() == ""){
          params["sRoToDt"] = null;
      }else{
          params["sRoToDt"] = chgDate(parent.$("#sRoToDt").val());
      }


      $.ajax({
          url:"<c:url value='/mob/ser/ro/repairOrder/selectRepairOrders.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              //alert("KBS Loading page Error ["+pageIndex+"]");
              mob.notification.error(jqXHR.responseJSON.errors);
              app.hideLoading();
          }
          ,success:function(result) {
              if(result.data!=null && result.data != ""){
                  var data = [];

                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          dlrCd:row.dlrCd,

                          carRegNo:row.carRegNo,
                          vinNo:row.vinNo,
                          driverNm:row.driverNm,
                          saNm:row.saNm,
                          roDocNo:row.roDocNo,
                          roTp:row.roTp,
                          expcDlDt:row.expcDlDt,
                          roStatCd:row.roStatCd,
                          roDocNo:row.roDocNo
                       });
                  });
                  options.success(data);
                  //alert("KBS Loading page Success ["+pageIndex+"]");
                  app.hideLoading();
                  //mob.notification.success("<spring:message code='global.info.success'/>");
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

//listData.sort({ field:"regDt", dir:"desc"});

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


function listViewClick(e)
{
    //parent.contentDetail(e.dataItem);
    parent.contentDetail(e.dataItem.roDocNo);
}

var app = setKendoMobApp();

</script>

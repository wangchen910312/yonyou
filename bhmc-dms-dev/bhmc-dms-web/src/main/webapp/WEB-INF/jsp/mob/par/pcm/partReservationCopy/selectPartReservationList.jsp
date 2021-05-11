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
        <span style="width:50%">#:rowData.carRegNo #</span>
        <span style="width:50%">#:trimNull(rowData.vinNo) #</span>
        <span class="clboth" style="width:50%">#:trimNull(rowData.parResvDocNo) #</span>
        <span style="width:50%">#:trimNull(rowData.regUsrNm) #</span>
        <span class="clboth" style="width:50%">#:changePartResvTpCdList(rowData.parResvTp) #</span>
        <span style="width:50%">#:trimNull(rowData.parResvStatNm) #</span>
        <span class="clboth" class="clboth" style="width:50%">#:trimNull(chgCustDateTime2Str2(rowData.regDt)) #</span>
        <span style="width:50%">#:trimNull(rowData.preAmt) #</span>
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

      params["sCarRegNo"]       = parent.$("#sCarRegNo").val();
      params["sPartNm"]     = parent.$("#sPartNm").val();
      params["sRegUsrNm"]       = parent.$("#sRegUsrNm").val();
      /* params["sRegUsrId"]       = parent.$("#sRegUsrId").val(); */
      params["sVinNo"]          = parent.$("#sVinNo").val();
      params["sParResvDocNo"]   = parent.$("#sParResvDocNo").val();
      params["sParResvTp"]      = parent.$("#sParResvTp").data("kendoExtDropDownList").value();
      params["sParResvStartDt"] = chgDate(parent.$("#sParResvStartDt").val());
      params["sParResvEndDt"]   = chgDate(parent.$("#sParResvEndDt").val());
      params["sParResvStatCd"]  = parent.$("#sParResvStatCd").data("kendoExtDropDownList").value();


      params["sPreFixId"]       = parent.preFixId;

      $.ajax({
          url:"<c:url value='/mob/ser/rev/partReservation/selectPartReservations.do' />"
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


changeResvStatCdList = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.resvStatCdMap[val].cmmCdNm;
    }
    return returnVal;
};

changePartResvTpCdList = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.partResvTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

chgCustDateTime2Str2 = function(val) {
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = val.substring(0,16);
    }
    return returnVal;
}


function listViewClick(e)
{
    parent.contentDetail(e.dataItem.rowData);
}

var app = setKendoMobApp();

</script>

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
        <span style="width:50%">#:trimNull(rowData.vinNo) #</span>
        <span style="width:50%">#:trimNull(rowData.roDocNo) #</span>
        <span style="width:50%">#:trimNull(rowData.calcPrsnNm) #</span>
        <span style="width:50%">#:trimNull(rowData.roTpNm) #</span>
        <span style="width:50%">#:trimNull(receiveCdGrid(rowData.rcvStatCd)) #</span>
        <span style="width:50%">#:trimNull(chgDate2DateTimeStr(rowData.calcDt)) #</span>
        <span style="width:50%">#:trimNull(rowData.paymYnNm) #</span>
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

      params["sRoDocNo"] = parent.$("#sRoDocNo").val();//
      params["sRoTp"] = parent.$("#sRoTp").data("kendoExtDropDownList").value();
      params["sRcvStatCd"] = parent.$("#sRcvStatCd").data("kendoExtDropDownList").value();
      params["sPaymTp"] = parent.$("#sPaymTp").data("kendoExtDropDownList").value();
      params["sPaymPrid"] = parent.$("#sPaymPrid").data("kendoExtDropDownList").value();
      params["sVinNo"] = parent.$("#sVinNo").val();
      //params["sRcvDocNo"] = parent.$("#sRcvDocNo").val();
      params["sCarOwnerNm"] = parent.$("#sCarOwnerNm").val();
      params["sCarRegNo"] = parent.$("#sCarRegNo").val();
      params["sPaymUsrNm"] = parent.$("#sPaymUsrNm").val();
      params["sCalcPrsnNm"] = parent.$("#sCalcPrsnNm").val();
      params["sPaymYn"]     = parent.$("#sPaymYn").data("kendoExtDropDownList").value();


      if(parent.$("#sRcvCpltFromDt").val() == "" ){
          params["sRcvCpltFromDt"] = null;
      }else{
          params["sRcvCpltFromDt"] = chgDate(parent.$("#sRcvCpltFromDt").val());
      }

      if(parent.$("#sRcvCpltToDt").val() == "" ){
          params["sRcvCpltToDt"] = null;
      }else{
          params["sRcvCpltToDt"] = chgDate(parent.$("#sRcvCpltToDt").val());
      }

      //params["sCalcStatCd"]   = "00";
      params["sSerParDstinCd"] = "SER";


      $.ajax({
          //url:"<c:url value='/ser/rcv/serviceReceive/selectServiceReceives.do' />" //selectServiceReceiveStatus
           url:"<c:url value='/ser/rcv/serviceReceive/selectServiceReceiveStatus.do' />" //selectServiceReceiveStatus
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
                  rowTotal = result.data.length;//result.total;
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

//수납 구분
receiveCdGrid = function(val){
     var returnVal = "";
     if(val != null && val != ""){
         returnVal = parent.receiveCdMap[val].cmmCdNm;
     }
     return returnVal;
}


function listViewClick(e){
    parent.contentDetail(e.dataItem.rowData);
}

var app = setKendoMobApp();
</script>
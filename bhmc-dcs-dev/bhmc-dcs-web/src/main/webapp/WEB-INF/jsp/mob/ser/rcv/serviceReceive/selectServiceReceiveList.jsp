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

        <span class="clboth" style="width:35%">#:trimNull(carOwnerNm) #</span>
        <span style="width:35%">#:trimNull(driverNm) #</span>
        <span style="width:30%"></span>

        <span class="clboth" style="width:35%">#:receiveCdGrid(rcvStatCd) #</span>
        <span style="width:65%">#:chgDate2DateTimeStr(calcDt) #</span>

        <span class="clboth" style="width:100%">#:trimNull(rcvDocNo) #</span>
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
      params["sRoDocNo"] = parent.$("#sRoDocNo").val();//
      params["sRoTp"] = parent.$("#sRoTp").data("kendoExtDropDownList").value();//
      params["sRcvStatCd"] = parent.$("#sRcvStatCd").data("kendoExtDropDownList").value();//
      //params["sTecNm"] = parent.$("#sTecNm").val();
      params["sVinNo"] = parent.$("#sVinNo").val();//
      params["calcDocNo"] = parent.$("#sRcvDocNo").val();
      params["sDriverNm"] = parent.$("#sDriverNm").val();//
      params["sCarRegNo"] = parent.$("#sCarRegNo").val();//


      $.ajax({
          url:"<c:url value='/mob/ser/rcv/serviceReceive/selectServiceReceives.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              //alert("KBS Loading page Error ["+pageIndex+"]");
              alert('wqerqwer');
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
                          carOwnerNm:row.carOwnerNm,
                          driverNm:row.driverNm,
                          rcvStatCd:row.rcvStatCd,
                          calcDt:row.calcDt,
                          rcvDocNo:row.rcvDocNo,
                          calcPrsnId:row.calcPrsnId,
                          roDocNo:row.roDocNo,
                          roTp:row.roTp,

                          lbrCalcAmt:row.lbrCalcAmt,
                          lbrDcRate:row.lbrDcRate,
                          lbrDcAmt:row.lbrDcAmt,
                          lbrBmPointUseAmt:row.lbrBmPointUseAmt,
                          lbrPointUseAmt:row.lbrPointUseAmt,
                          lbrEtcDcAmt:row.lbrEtcDcAmt,
                          lbrCalcSumAmt:row.lbrCalcSumAmt,

                          parCalcAmt:row.parCalcAmt,
                          parDcRate:row.parDcRate,
                          parDcAmt:row.parDcAmt,
                          parBmPointUseAmt:row.parBmPointUseAmt,
                          parPointUseAmt:row.parPointUseAmt,
                          parEtcDcAmt:row.parEtcDcAmt,
                          parCalcSumAmt:row.parCalcSumAmt,

                          etcCalcAmt:row.etcCalcAmt,
                          etcDcRate:row.etcDcRate,
                          etcDcAmt:row.etcDcAmt,
                          etcBmPointUseAmt:row.etcBmPointUseAmt,
                          etcPointUseAmt:row.etcPointUseAmt,
                          etcOtherDcAmt:row.etcOtherDcAmt,
                          etcCalcSumAmt:row.etcCalcSumAmt,

                          rcvAmt:row.rcvAmt,
                          rcvCpltDt:row.rcvCpltDt,
                          npayAmt:row.npayAmt,
                          npayChkDt:row.npayChkDt,
                          rcptTp:row.rcptTp,
                          rcptNo:row.rcptNo,
                          rcptDt:row.rcptDt,
                          rcvRemark:row.rcvRemark
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
/*
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
 */


//수납 구분
 receiveCdGrid = function(val){
     var returnVal = "";
     if(val != null && val != ""){
         returnVal = parent.receiveCdMap[val].cmmCdNm;
     }
     return returnVal;
 }


function listViewClick(e)
{
    parent.contentDetail(e.dataItem);
    //parent.contentDetail(e.dataItem.roDocNo);
}

var app = setKendoMobApp();

</script>

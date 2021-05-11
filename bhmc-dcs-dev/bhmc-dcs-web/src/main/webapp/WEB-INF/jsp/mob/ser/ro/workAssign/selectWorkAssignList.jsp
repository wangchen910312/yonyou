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
    <span style="width:35%">#:changeRoTpCd(roTp) #</span>
    <span style="width:65%">#:trimNull(roDocNo) #</span>

    <span class="clboth" style="width:35%">#:trimNull(carRegNo) #</span>
    <span style="width:65%">#:trimNull(vinNo) #</span>

    <span class="clboth" style="width:35%">#:trimNull(driverNm) #</span>
    <span style="width:35%">#:trimNull(saNm) #</span>
    <span style="width:30%">#:changeRoStatCd(roStatCd) #</span>

    <span class="clboth" style="width:100%">#:chgDate2DateTimeStr(expcDlDt) #</span>

</div>
</script>

<script>
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

      var params = {};
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;
      params["sort"] = null;


      params["sCarRegNo"] = parent.$("#sCarRegNo").val();
      params["sCarOwnerNm"] = parent.$("#sCarOwnerNm").val();
      params["sRoDocNo"] = parent.$("#sRoDocNo").val();


      if(parent.$("#sRoDt").val() == "" || parent.$("#search4Area span[name='searchStr']").text() == ""){
          params["sRoToDt"] = null;
          params["sRoFromDt"] = null;
      }else{
          params["sRoToDt"] = chgDate(parent.$("#sRoDt").val());
          params["sRoFromDt"] = chgDate(parent.$("#sRoDt").val());
      }

      params["sVinNo"] = parent.$("#sVinNo").val();
      params["sDriverNm"] = parent.$("#sDriverNm").val();


      if(parent.$("#sExpcDlDt").val() == "" || parent.$("#search7Area span[name='searchStr']").text() == ""){
          params["sExpcDlToDt"] = null;
          params["sExpcDlFromDt"] = null;
      }else{
          params["sExpcDlToDt"] = chgDate(parent.$("#sExpcDlDt").val());
          params["sExpcDlFromDt"] = chgDate(parent.$("#sExpcDlDt").val());

      }

      params["roStatCd"] = parent.$("#roStatCd").data("kendoExtDropDownList").value();
      params["sSaNm"] = parent.$("#sSaNm").val();
      params["sRoTp"] = parent.$("#sRoTp").data("kendoExtDropDownList").value();
      params["sBayNo"] = parent.$("#sBayNo").val();


      $.ajax({
          url:"<c:url value='/mob/ser/ro/repairOrder/selectRepairOrders.do' />"
          //url:"<c:url value='/mob/ser/ro/workAssign/selectWorkAssignLists.do' />"

          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              //mob.notification.error(jqXHR.responseJSON.errors);
              app.hideLoading();
          }
          ,success:function(result) {
              if(result.data!=null && result.data != ""){
                  var data = [];
                  rowTotal = result.total;

                  if(rowTotal > result.data.length){
                      rowTotal = result.data.length;
                  }

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

                          /*
                          resvDocNo:row.resvDocNo,
                          diagDocNo:row.diagDocNo,
                          atqProcTp:row.atqProcTp,
                          carWashTp:row.carWashTp,
                          custWaitMthCd:row.custWaitMthCd,
                          roDt:chgDate2DateTimeStr(row.roDt),
                          tecNm:row.tecNm
                          */

                          roDocNo:row.roDocNo,
                          lineNo:row.lineNo,
                          bayNo:row.bayNo,
                          bayNm:row.bayNm,
                          rpirTp:row.rpirTp,
                          rpirCd:row.rpirCd,
                          rpirNm:row.rpirNm,
                          rpirDstinCd:row.rpirDstinCd,
                          wrkStatCd:row.wrkStatCd,
                          qtTestCd:row.qtTestCd,
                          realTecId:row.realTecId,
                          realTecNm:row.realTecNm,
                          wkgrpCd:row.wkgrpCd,
                          wkgrpNm:row.wkgrpNm,
                          wrkStartDt:row.wrkStartDt,
                          wrkEndDt:row.wrkEndDt,
                          planHm:row.planHm


                          });
                  });
                  options.success(data);
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



changeRoStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.roStatCdMap[val].cmmCdNm;
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




function listViewClick(e)
{
    //parent.contentDetail(e.dataItem.roDocNo);
    parent.contentDetail(e.dataItem);
}

var app = setKendoMobApp();

</script>

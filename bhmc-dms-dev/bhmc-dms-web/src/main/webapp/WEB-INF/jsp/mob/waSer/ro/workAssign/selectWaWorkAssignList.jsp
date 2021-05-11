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

    <span class="clboth" style="width:100%">#:expcDlDt #</span>

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
                          expcDlDt:chgDate2DateTimeStr(row.expcDlDt),
                          roStatCd:row.roStatCd,

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
                          wrkStartDt:chgDate2DateTimeStr(row.wrkStartDt),
                          wrkEndDt:chgDate2DateTimeStr(row.wrkEndDt),
                          planHm:row.planHm
                          });
                  });
                  options.success(data);
                  app.hideLoading();
              }else{
                  app.hideLoading();
              }
              checklistCnt("listarea_noData",result.total,noDatamsg);
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
    parent.contentDetail(e.dataItem);
}

var app = setKendoMobApp();

</script>

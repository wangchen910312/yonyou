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
        <span class="strong">#:ordTp #</span>
        <span class="fright">#:ordStatCd #</span>
        <span class="fright">#:ordDate #</span>
        <span class="clboth">#:chrgCd #</span>
        <span class="fright">#:retailDt #</span>
    </div>
</script>

<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

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
      //params["sort"] = options.sort;

      if(parent.$("#dDlrCd").val() != ""){
          params["sDlrCd"] = parent.$("#dDlrCd").val();
      }
      if(parent.$("#dOrdYyMmDt").val() != ""){
          params["sOrdYyMmDt"] = parent.$("#dOrdYyMmDt").val();
      }
      if(parent.$("#dWeek").val() != ""){
          params["sOrdPrid"] = parent.$("#dWeek").val();
      }
      if(parent.$("#dCarlineCd").val() != ""){
          params["sCarlineCd"] = parent.$("#dCarlineCd").val();
      }
      if(parent.$("#dOrdNo").val() != ""){
          params["sOrdSeq"] = parent.$("#dOrdNo").val();
      }

      $.ajax({
          url:"<c:url value='/sal/orc/sumOrderCnt/selectSumOrderCntDlrSubs.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              //alert("KBS Loading page Error ["+pageIndex+"]");
              //mob.notification.error(jqXHR.responseJSON.errors);
              app.hideLoading();
          }
          ,success:function(result) {
              var data = [];
              rowTotal = result.total;

              //alert("KBS Loading page Success ["+pageIndex+"]");
              if (rowTotal > 0) {
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({pageIdx:pageIndex, rowIdx:rowIndex, totCnt:row.totCnt, ordTp:row.ordTp, ordStatCd:row.ordStatCd, ordDate:row.ordDate, chrgCd:row.chrgCd, ordSeq:row.ordSeq, vinmVloc:row.vinmVloc, fndlDt:row.fndlDt, carlineCd:row.carlineCd, carlineNm:row.carlineNm, modelCd:row.modelCd, modelNm:row.modelNm, ocnCd:row.ocnCd, ocnNm:row.ocnNm, extColorCd:row.extColorCd, extColorNm:row.extColorNm, intColorCd:row.intColorCd, intColorNm:row.intColorNm, pdiDt:row.pdiDt, vinDt:row.vinDt, retailDt:row.retailDt, vinNo:row.vinNo});
                  });
              }

              options.success(data);

              //alert("KBS Loading page Success ["+pageIndex+"]");
              app.hideLoading();

              //정상적으로 반영 되었습니다.
              //mob.notification.success("<spring:message code='global.info.success'/>");
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

function listViewClick(e)
{
    parent.contentSubDetail(e.dataItem.totCnt, e.dataItem.ordTp, e.dataItem.ordStatCd, e.dataItem.ordDate, e.dataItem.chrgCd, e.dataItem.ordSeq, e.dataItem.vinmVloc, e.dataItem.fndlDt, e.dataItem.carlineCd, e.dataItem.carlineNm, e.dataItem.modelCd, e.dataItem.modelNm, e.dataItem.ocnCd, e.dataItem.ocnNm, e.dataItem.extColorCd, e.dataItem.extColorNm, e.dataItem.intColorCd, e.dataItem.intColorNm, e.dataItem.pdiDt, e.dataItem.vinDt, e.dataItem.retailDt, e.dataItem.vinNo);
}

//var app = new kendo.mobile.Application();
var app = setKendoMobApp();
</script>

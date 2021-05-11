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
    <span style="width:50%">#:trimNull(dstinCd) #</span>
    <span style="width:50%">#:trimNull(lbrTp) #</span>

    <span class="clboth" style="width:50%">#:trimNull(lbrCd) #</span>
    <span style="width:50%">#:trimNull(lbrNm) #</span>
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

      if (rowIndex >= rowTotal){
          return;
      }
      app.showLoading();
      pageIndex++;

      var params = {};
      params["recordCountPerPage"] = options.pageSize;
      params["pageIndex"] = options.page;
      params["firstIndex"] = options.skip;
      params["lastIndex"] = options.skip + options.take;
      params["sort"] = options.sort;

      params["sDstinCd"] = parent.$("#sDstinCd").val();
      params["sLtsModelCd"] = parent.$("#sLtsModelCd").data("kendoExtDropDownList").value();
      params["sLbrTp"] = parent.$("#sLbrTp").data("kendoExtDropDownList").value();
      params["sLbrCd"] = parent.$("#sLbrCd").val();
      params["sLbrNm"] = parent.$("#sLbrNm").val();


      $.ajax({
          url:"<c:url value='/ser/svi/laborManage/selectLaborCodePopups.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
              app.hideLoading();
          }
          ,success:function(result) {
            checklistCnt("listarea_noData", result.total, noDatamsg);
              if (result.data != null && result.data != "") {
                  var data = [];
                  rowTotal = result.total;

                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          dstinCd:parent.dstinCdGrid(row.dstinCd),
                          lbrTp:parent.lbrTpCdGrid(row.lbrTp),
                          lbrCd:row.lbrCd,
                          lbrNm:row.lbrNm,
                          lbrQty:row.lbrQty,
                          lbrHm:row.lbrHm,
                          allocLbrHm:row.allocLbrHm,
                          payLbrHm:row.payLbrHm,
                          diffVal:row.diffVal,
                          serCnt:row.serCnt,
                          validStartDt:row.validStartDt,
                          validEndDt:row.validEndDt,
                          relCauLbrYn:row.relCauLbrYn,
                      });
                  });
                  options.success(data);
                  app.hideLoading();
              }
              else {
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
    $("div.dlistitem").removeClass("dlist_selected");
    e.item.children().addClass("dlist_selected");
    parent.setSelectedItem(e.dataItem);
}

var app = setKendoMobApp();

</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul data-role="listview" data-source="listData" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
        <div class="dlistitem bgNone">
            <span style="width:35%">#:rowData.itemCd  #</span>
            <span style="width:65%">#:rowData.itemNm #</span>
            <span class="clboth" style="width:35%">#:rowData.itemQty  # / #:rowData.calcUnitCd #</span>
            <span style="width:35%">#:mob.format.currency(rowData.itemPrc, "{0:n0}") #</span>
            <span style="width:30%">#:mob.format.currency(rowData.itemTotAmt, "{0:n0}")  #</span>
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

      params["sPreFixId"] = "ET";
      params["sDocNo"] = parent.$("#estDocNo").val();


      $.ajax({
          url:"<c:url value='/ser/cmm/tabInfo/selectServiceParts.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              app.hideLoading();
          }
          ,success:function(result) {
              checklistCnt("listarea_noData_sub1",result.total,noDatamsg);
              if(result.data!=null && result.data != ""){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({rowData:result.data[i]});
                      /*
                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,
                          dlrCd:row.dlrCd,
                          estDocNo:row.estDocNo,
                          esTp:row.estTp,
                          itemCd:row.itemCd,
                          itemNm:row.itemNm,
                          itemQty:row.itemQty,
                          calcUnitCd:row.calcUnitCd,
                          itemPrc:row.itemPrc,
                          itemTotAmt:row.itemTotAmt
                      });
                      */
                  });
                  options.success(data);

                  if(result.total > 0){
                      parent.$("#estTp").val(changeEstTpCd(result.data[0].estTp));
                  }
                  app.hideLoading();
                  parent.setSubListHeightNew("itemList",2,rowTotal);
              }else{
                  app.hideLoading();
                  parent.setSubListHeightNew("itemList",2,0);
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
}

changeEstTpCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.estTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

var app = setKendoMobAppForNativeScroll();
</script>

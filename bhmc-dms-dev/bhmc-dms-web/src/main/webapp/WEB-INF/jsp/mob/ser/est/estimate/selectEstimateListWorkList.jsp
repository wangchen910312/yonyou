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
            <span style="width:30%">#:trimNull(rowData.lbrCd)  #</span>
            <span style="width:70%">#:trimNull(rowData.lbrNm) #</span>
            <span class="clboth" style="width:30%">#:chgInt(mob.format.currency(rowData.lbrTotAmt, "{0:n0}")) #</span>
            <span style="width:30%">#:commaZero(rowData.lbrHm) #</span>
            <span style="width:40%">#:chgInt(mob.format.currency(rowData.lbrPrc, "{0:n0}")) # ( #:commaZero(rowData.dcAmt) # ) </span>
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
          url:"<c:url value='/ser/cmm/tabInfo/selectServiceLabors.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              app.hideLoading();
          }
          ,success:function(result) {
              checklistCnt("listarea_noData_sub2",result.total,noDatamsg);
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
                          estTp:row.estTp,
                          lbrCd:row.lbrCd,
                          lbrNm:row.lbrNm,
                          lbrHm:row.lbrHm,
                          lbrPrc:row.lbrPrc,
                          dcAmt:row.dcAmt,
                          lbrTotAmt:row.lbrTotAmt
                      });
                      */
                  });
                  options.success(data);
                  app.hideLoading();
                  parent.setSubListHeightNew("workList",2,rowTotal);
              }else{
                  app.hideLoading();
                  parent.setSubListHeightNew("workList",2,rowTotal);
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

var app = setKendoMobAppForNativeScroll();
</script>

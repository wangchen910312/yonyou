<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul data-role="listview" data-source="listData"  data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">
    <span style="width:35%">#:bhmcYn #</span>
    <span style="width:30%">#:expcSaleDt #</span>
    <span style="width:35%">#:succPrbCd #</span>
    <span class="clboth" style="width:35%">#:saleOpptSrcCd #</span>
    <span style="width:30%">#:saleOpptStepCd #</span>
    <span style="width:35%">#:regDt #</span>

</div>


</script>
<!--연락일:regDt
    유형:contactStatCd
   연락방법:contactTp
   연락내용:contactCont  -->
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

      var params = {};
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;
      params["sort"] = null;

      params["sSaleOpptNo"] = parent.$("#saleOpptNo").val();
      $.ajax({
          url:"<c:url value='/mob/crm/cso/salesOpptMgmt/selectSalesOpptHistorys.do' />"

          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              //mob.notification.error(jqXHR.responseJSON.errors);
              app.hideLoading();
          }
          ,success:function(result) {
              if(result.data!=null){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({
                          pageIdx:pageIndex,
                          rowIdx:rowIndex,

                          bhmcYn:row.regDt,
                          expcSaleDt:row.expcSaleDt,
                          succPrbCd:row.succPrbCd,
                          saleOpptSrcCd:row.saleOpptSrcCd,
                          saleOpptStepCd:row.saleOpptStepCd,
                          regDt:row.regDt
                          });
                  });
                  options.success(data);
                  app.hideLoading();
                  parent.setSubListHeight("historyList",rowTotal);
                  //mob.notification.success("<spring:message code='global.info.success'/>");
              }else{
                  parent.setSubListHeight("historyList",0);
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

function listViewClick(e)
{
    //parent.contentDetail(e.dataItem);
}

//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();

</script>

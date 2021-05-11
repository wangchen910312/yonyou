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
<div class="deleteitem">
    <span style="width:35%">#:bhmcYn #</span>
    <span style="width:30%">#:chgDate2Str(expcSaleDt) #</span>
    <span style="width:35%">#:changeSuccPrbCd(trimNull(succPrbCd)) #</span>
    <span class="clboth" style="width:35%">#:changeSaleOpptSrcCdObj(saleOpptSrcCd) #</span>
    <span style="width:30%">#:changeSaleOpptStepCd(trimNull(saleOpptStepCd)) #</span>
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

                          bhmcYn:row.bhmcYn,
                          expcSaleDt:row.expcSaleDt,
                          succPrbCd:row.succPrbCd,
                          saleOpptSrcCd:row.saleOpptSrcCd,
                          saleOpptStepCd:row.saleOpptStepCd,
                          regDt:row.regDt
                          });
                  });
                  options.success(data);
                  app.hideLoading();
                  //parent.setSubListHeight2("historyList",rowTotal,"N");
                  parent.setSubListHeightNew("historyList",2,rowTotal);
                  //mob.notification.success("<spring:message code='global.info.success'/>");
              }else{
                  app.hideLoading();
                  //parent.setSubListHeight2("historyList",0,"N");
                  parent.setSubListHeightNew("historyList",2,0);
              }
              checklistCnt("historyList_noData",result.total,noDatamsg);
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

//성공확률
changeSuccPrbCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.succPrbCdObj[val];
    }
    return returnVal;
}

//판매기회단계
changeSaleOpptStepCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.saleOpptStepCdObj[val];
    }
    return returnVal;
}

//판매기회 출처
changeSaleOpptSrcCdObj = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.saleOpptSrcCdObj[val];
    }
    return returnVal;
}


//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();

</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul data-role="listview" data-source="listData" data-template="list-template" data-click="">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">
<span style="width35%">#:salesActiveStatCdArrVal(salesActiveStatCd) #</span>
<span style="width:55%">#:salesActiveTpCdArrVal(salesActiveStatCd) #</span>
<span class="clboth" style="width:35%">#:custNm #</span>
<span style="width:30%">#:prefCommNo #</span>
<span style="width:35%">#:saleOpptNo #</span>
<span class="clboth" >#:trimNull(activeCont) #</span>
<span class="clboth" >#:trimNull(activeRsltCont) #</span>
<span class="clboth" style="width:35%">#:planStartDt #</span>
<span style="">#:planEndDt #</span>
</div>
</script>

<script>

//시스템 날짜 정보 가져오기.
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
          url:"<c:url value='/mob/crm/cso/salesOpptMgmt/selectSalesActives.do' />"

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

                          salesActiveStatCd:row.salesActiveStatCd,
                          planStartDt:chgDate2Str(row.planStartDt),
                          planEndDt:chgDate2Str(row.planEndDt),
                          salesActiveTpCd:row.salesActiveTpCd,
                          activeCont:row.activeCont,
                          activeRsltCont:row.activeRsltCont,
                          saleOpptNo:row.saleOpptNo,
                          custNm:row.custNm,
                          prefCommNo:row.prefCommNo
                          });
                  });
                  options.success(data);
                  app.hideLoading();

                  parent.setSubListHeight("activeList",rowTotal);
                  //mob.notification.success("<spring:message code='global.info.success'/>");
              }else{
                  app.hideLoading();
                  parent.setSubListHeight("activeList",0);
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

//영업활동상태
salesActiveStatCdArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.salesActiveStatCdArr[val];
    }
    console.log(returnVal);
    return returnVal;
};

//영업활동유형
salesActiveTpCdArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.salesActiveTpCdArr[val];
    }
    console.log(returnVal);
    return returnVal;
};

//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();

</script>

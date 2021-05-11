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
    <span style="width:40%">#:salesActiveStatCdArrVal(salesActiveStatCd) #</span>
    <span style="width:25%">#:trimNull(custNm)            #</span>
    <span style="width:35%">#:trimNull(prefCommNo)        #</span>
    <span style="width:40%" class="clboth">#:chgDate2DateTimeStr(planStartDt)       #</span>
    <span style="width:60%">#:chgDate2DateTimeStr(planEndDt)         #</span>
    <span style="width:100%" class="clboth">#:trimNull(activeCont)        #</span>
    <span style="width:100%" class="clboth">#:trimNull(activeRsltCont)    #</span>
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
      //params["sort"] = null;

      params["sScId"] = parent.$("#sScId").data("kendoExtDropDownList").value();
      params["sCustNm"] = parent.$("#sCustNm").val();
      params["sSalesActiveTpCd"] = parent.$("#sSalesActiveTpCd").data("kendoExtDropDownList").value();
      //date타입 오류로 임수 주석처리

      parent.$("#content_list").css("display","block");

      $.ajax({
          url:"<c:url value='/mob/crm/cso/salesActive/selectSalesActiveMgmts.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {

              //alert("KBS Loading page Error ["+pageIndex+"]");
              //parent.mob.notification.error(jqXHR.responseJSON.errors);
              parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
              app.hideLoading();
          }
          ,success:function(result) {
              if(result.data!=null){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;
                      data.push({pageIdx:pageIndex, rowIdx:rowIndex,
                          salesActiveNo     :row.salesActiveNo,
                          salesActiveStatCd :row.salesActiveStatCd,
                          planStartDt       :row.planStartDt      ,
                          planEndDt         :row.planEndDt        ,
                          salesActiveTpCd   :row.salesActiveTpCd  ,
                          activeCont        :row.activeCont       ,
                          activeRsltCont    :row.activeRsltCont   ,
                          saleOpptNo        :row.saleOpptNo       ,
                          custNm            :row.custNm           ,
                          prefCommNo        :row.prefCommNo});
                      //if(rowIndex>11) return false;
                  });
                  options.success(data);
                  //alert("KBS Loading page Success ["+pageIndex+"]");
                  app.hideLoading();
                  //mob.notification.success("<spring:message code='global.info.success'/>");
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

changeAapWrkDstinCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.aapWrkDstinCdObj[val];
    }
    return returnVal;
};

//영업활동상태 DS
salesActiveStatCdArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.salesActiveStatCdArr[val];
    }
    return returnVal;
};

//영업활동유형 DS
salesActiveTpCdArrVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.salesActiveTpCdArr[val];
    }
    return returnVal;
};

function listViewClick(e)
{
    var dataItem = e.dataItem;
    parent.contentDetail(e.dataItem);
}

var app = setKendoMobApp();

</script>

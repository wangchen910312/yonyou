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
        <div class="dlistitem">
            <span style="width:30%">#:trimNull(lbrCd)  #</span>
            <span style="width:70%">#:trimNull(lbrNm) #</span>

            <span class="clboth" style="width:30%">#:trimNull(expcLbrAmt)  #</span>
            <span style="width:30%">#:trimNull(lbrHm) #</span>
            <span style="width:40%">#:trimNull(lbrPrc)  # ( #:chgInt(dcAmt) # ) </span>
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
      //alert("KBS Loading page ["+pageIndex+"]");

      var params = {};
      params["recordCountPerPage"] = pageSize;
      params["pageIndex"] = pageIndex;
      params["firstIndex"] = (pageIndex - 1) * pageSize;
      params["lastIndex"] = pageIndex * pageSize;
      params["sort"] = null;

      params["sEstDocNo"] = parent.$("#estDocNo").val();



      $.ajax({
          url:"<c:url value='/mob/ser/est/estimate/selectEstimateListLabours.do' />"

          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              //alert("KBS Loading page Error ["+pageIndex+"]");
              mob.notification.error(jqXHR.responseJSON.errors);
              app.hideLoading();
          }
          ,success:function(result) {
              if(result.data!=null && result.data != ""){
                  var data = [];
                  rowTotal = result.total;
                  $.each(result.data , function(i , row){
                      rowIndex++;

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
                          expcLbrAmt:row.expcLbrAmt
                      });
                  });
                  options.success(data);

                  //alert("KBS Loading page Success ["+pageIndex+"]");
                  app.hideLoading();
                  //mob.notification.success("<spring:message code='global.info.success'/>");
                  parent.setSubListHeight("workList",rowTotal);
              }else{
                  app.hideLoading();
                  parent.setSubListHeight("workList",rowTotal);
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
    //parent.contentDetail(e.dataItem.itemCd);
}

/*
progressStatChange = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.progressStatMap[val].cmmCdNm;
    }
    return returnVal;
}
*/

//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();
</script>

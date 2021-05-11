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
            <span style="width:35%">#:itemCd  #</span>
            <span style="width:65%">#:itemNm #</span>
            <span class="clboth" style="width:35%">#:itemQty  # / #:calcUnitCd #</span>
            <span style="width:35%">#:itemPrc #</span>
            <span style="width:30%">#:expcParAmt  #</span>
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
          url:"<c:url value='/mob/ser/est/estimate/selectEstimateListParts.do' />"

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
                          esTp:row.estTp,
                          itemCd:row.itemCd,
                          itemNm:row.itemNm,
                          itemQty:row.itemQty,
                          calcUnitCd:row.calcUnitCd,
                          itemPrc:row.itemPrc,
                          expcParAmt:row.expcParAmt
                      });
                  });
                  options.success(data);

                  if(result.total > 0){
                      //alert(roTpCdChange(result.data[0].roTp));
                      parent.$("#estTp").val(changeEstTpCd(result.data[0].estTp));
                  }
                  //alert("KBS Loading page Success ["+pageIndex+"]");
                  app.hideLoading();
                  //mob.notification.success("<spring:message code='global.info.success'/>");
                  parent.setSubListHeight("itemList",rowTotal);
              }else{
                  app.hideLoading();
                  parent.setSubListHeight("itemList",0);
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

changeEstTpCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.estTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};


//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();
</script>

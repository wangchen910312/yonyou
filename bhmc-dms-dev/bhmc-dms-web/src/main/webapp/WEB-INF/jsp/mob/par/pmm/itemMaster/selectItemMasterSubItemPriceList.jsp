<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />


<div data-role="view">
  <ul id="subListView2" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick" >
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem bgNone">
    <span style="width:30%">#:commaZero(rowData.movingAvgPrc) #</span>
    <span style="width:30%">#:commaZero(rowData.rectGiPrc) #</span>
    <span style="width:40%">#:commaZero(rowData.retlPrc) #</span>
    <span style="width:30%" class="clboth">#:changeBasePriceCalTpMap(rowData.stdPrcCd) #</span>
    <span style="width:30%">#:commaZero(rowData.retlPrc) #</span>
    <span style="width:40%">#:commaZero(rowData.whslPrc) #</span>
    <span style="width:30%" class="clboth">#:commaZero(rowData.incPrc) #</span>
    <span style="width:30%">#:commaZero(rowData.grtePrc) #</span>
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
      params["recordCountPerPage"] = options.pageSize;
      params["pageIndex"] = options.page;
      params["firstIndex"] = options.skip;
      params["lastIndex"] = options.skip + options.take;
      params["sort"] = options.sort;
      params["sItemCd"] = parent.$("#itemCd").val();

      $.ajax({
          //url:"<c:url value='/mob/par/pmm/itemMaster/selectItemMasterSubItemPriceData.do' />"
          url:"<c:url value='/par/pmm/partsPriceMaster/selectPartsVenderSalPriceTargetMasters.do' />"
          ,data:JSON.stringify(params)
          ,type:'POST'
          ,dataType:'json'
          ,contentType:'application/json'
          ,error:function(jqXHR, status, error) {
              app.hideLoading();
          }
          ,success:function(result) {
              checklistCnt("listarea_noData_dt_2",result.total,noDatamsg);
              if(result.data!=null && result.data != ""){
                  var data = [];
                  rowTotal = result.data.length;
                  $.each(result.data , function(i , row){
                      console.log("row",row);
                      rowIndex++;
                      data.push({rowData:result.data[i]});

                  });
                  options.success(data);
                  app.hideLoading();
              }else{
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

changeBasePriceCalTpMap = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.basePriceCalTpMap[val];
    }
    return returnVal;
}


var app = setKendoMobApp();

</script>

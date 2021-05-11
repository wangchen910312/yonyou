<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subListView1" name="subListView1" data-json-obj='true' data-role="listview" data-source="listData" data-template="list-template">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="deleteitem">
    <span style="width:45%">#:trimNull(carlineNm) #</span>
    <span style="width:55%">#:trimNull(modelNm)#</span>
    <span class="clboth" style="width:55%">#:trimNull(vinNo) #</span>
    <span style="width:45%">#:trimNull(contractNo) #</span>
    <span class="clboth" style="width:45%">#:incCmpCdChg(incCmpCd) #</span>
    <span style="width:55%">#:trimNull(incNo) #</span>
    <span class="clboth" style="width:45%">#:commaPointPlus(incExpcTotAmt) #</span>
    <span style="width:55%">#:commaPointPlus(realIncTotAmt) #</span>
    <span class="clboth" style="width:45%">#:commaPointPlus(incFeeTotAmt) #</span>
    <span style="width:55%">#:trimNull(saleId) #</span>
    <span class="clboth" style="width:45%">#:chgDateFormat(incJoinDt) #</span>
    <span style="width:55%">#:trimNull(incPrsnNm) #</span>
    <span class="clboth" style="width:100%">#:trimNull(incProfitNm) #</span>
</div>
</script>

<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var pageIndex = 0, pageSize = 100;
var rowIndex = 0, rowTotal = 1000;

var data = [];
// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({
  transport:{
      read:{
          url:"<c:url value='/crm/cif/customerInfo/selectIncSearch.do' />"
          ,dataType:"json"
          ,type:"POST"
          ,contentType:"application/json"
      }
      ,parameterMap:function(options, operation) {
          if (operation === "read") {

              var params = {};

              params["recordCountPerPage"] = options.pageSize;
              params["pageIndex"] = options.page;
              params["firstIndex"] = options.skip;
              params["lastIndex"] = options.skip + options.take;
              params["sort"] = options.sort;

              params["sDlrCd"] = parent.$("#dlrCd").val();
              params["sCustNo"]  = parent.$("#custNo").val();

              return kendo.stringify(params);

          }
      }
  }
  ,batch:true
  ,pageSize:pageSize
  ,serverPaging:true
  ,schema:{
      data:"data"
      ,total:"total"
      ,model:{
          id:"incPk"
          ,fields:{
               incPk:{type:"string", editable:false}
              ,incCmpNm:{type:"string", editable:false}
              ,incNo:{type:"string", editable:false}
              ,incExpcTotAmt:{type:"string", validation:{required:true}, editable:false}
              ,realIncTotAmt:{type:"string", validation:{required:true}, editable:false}
              ,incFeeTotAmt:{type:"string", validation:{required:false}, editable:false}
              ,saleId:{type:"string", validation:{required:false}, editable:false}
              ,incJoinDt:{type:"date", validation:{required:false}, editable:false}
              ,incPrsnId:{type:"string", validation:{required:false}, editable:false}
              ,incProfitNm:{type:"string", validation:{required:false}, editable:false}
              ,carlineNm:{type:"string", validation:{required:false}, editable:false}
              ,modelNm:{type:"string", validation:{required:false}, editable:false}
              ,vinNo:{type:"string", validation:{required:false}, editable:false}
          }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          //parent.setSubListHeight2("blueMbrShipList", rTotal, "Y");
          parent.setSubListHeightNew("incList",4,rTotal);
      }else{
          //parent.setSubListHeight2("blueMbrShipList", 0, "Y");
          parent.setSubListHeightNew("incList",4,0);
      }
      }, 200);

      checklistCnt("incList_noData",this.total(),noDatamsg);

    }
    ,error:function(e){
      parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

//보험회사
incCmpCdChg = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.incCmpCdMap[val];
    }
    return returnVal;
}


chgDateFormat = function(val){
    console.log(val);
    var returnVal;

    if (val !== null ){
        returnVal =  kendo.toString(val, "<dms:configValue code='dateFormat' />")
    }else{
        returnVal = '';
    }
    return returnVal;
}

function commaPointPlus(val) {
    if(val == null || val == ""){
        return "";
    }

    var num = parseFloat(val);
    return kendo.format("{0:#,###.00}", num);
}

//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();

</script>

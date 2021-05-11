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
    <span style="width:45%">#:trimNull(dlrCd) #</span>
    <span style="width:55%">#:trimNull(vinNo) #</span>
    <span class="clboth" style="width:45%">#:trimNull(carRegNo) #</span>
    <span style="width:55%">#:trimNull(driverNm) #</span>
    <span class="clboth" style="width:45%">#:trimNull(runDistVal) #</span>
    <span style="width:55%">#:trimNull(lastRunDistVal) #</span>
    <span class="clboth" style="width:45%">#:chgDateFormat(roDt) #</span>
    <span style="width:55%">#:trimNull(roTp) #</span>
    <span class="clboth" style="width:100%">#:trimNull(roDocNo) #</span>
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
          url:"<c:url value='/crm/cmm/selectRepairOrdersHistory.do' />"
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

              params["sCarOwnerId"] =  parent.$("#custNo").val();
              params["sRoStatCd"] = "05";

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
          id:"rnum"
          ,fields:{
              rnum:{type:"number"}
              ,dlrCd:{type:"string"}
              ,resvDocNo:{type:"string"}
              ,vinNo:{type:"string"}
              ,carRegNo:{type:"string"}
              ,driverNm:{type:"string"}
              ,runDistVal:{type:"number", format:"{0:n0}"}
              ,lastRunDistVal:{type:"number", format:"{0:n0}"}
              ,roDocNo:{type:"string"}
              ,roTp:{type:"string"}
              ,roDt:{type:"date"}
          }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          //parent.setSubListHeight2("lbrList", rTotal, "Y");
          parent.setSubListHeightNew("lbrList",3,rTotal);
      }else{
          //parent.setSubListHeight2("lbrList", 0, "Y");
          parent.setSubListHeightNew("lbrList",3,0);
      }
      }, 200);

      checklistCnt("lbrList_noData",this.total(),noDatamsg);

    }
    ,error:function(e){
      parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

//RO유형
roTpCdChg = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.roTpCdListMap[val];
    }
    return returnVal;

}

chgDateFormat = function(val){
    console.log(val);
    var returnVal;

    if (val !== null ){
        returnVal =  kendo.toString(val, '<dms:configValue code='dateFormat' /> HH:mm')
    }else{
        returnVal = '';
    }
    return returnVal;
}

//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();

</script>

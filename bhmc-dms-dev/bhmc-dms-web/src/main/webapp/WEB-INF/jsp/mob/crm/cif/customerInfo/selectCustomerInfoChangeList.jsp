<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subListView1" name="subListView1" data-json-obj='true' data-role="listview" data-source="listData"  data-template="list-template">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="deleteitem">
    <span style="width:45%">#:trimNull(rnum) #</span>
    <span style="width:55%">#:trimNull(chgCdNm) #</span>
    <span class="clboth" style="width:45%">#:trimNull(befValue) #</span>
    <span style="width:55%">#:trimNull(aftValue) #</span>
    <span class="clboth" style="width:45%">#:trimNull(regUsrNm)#</span>
    <span style="width:55%">#:chgDateFormat(logDt)#</span>
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
          url:"<c:url value='/crm/cif/customerInfo/selectCustomerInfoHistory.do' />"
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

              params["sCustNo"] =  parent.$("#custNo").val();

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
              rnum:{type:"number", editable:false}
              ,regUsrNm:{type:"string", editable:false}
              ,befValue:{type:"string", editable:false}
              ,aftValue:{type:"string", editable:false}
              ,logDt:{type:"date", editable:false}
              ,chgCdNm:{type:"string", editbale:false}
          }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          //parent.setSubListHeight2("leadList", rTotal, "Y");
          parent.setSubListHeightNew("infoUpdHistList",5,rTotal);
      }else{
          //parent.setSubListHeight2("leadList", 0, "Y");
          parent.setSubListHeightNew("infoUpdHistList",5,0);
      }
      }, 200);

      checklistCnt("infoUpdHisList_noData",this.total(),noDatamsg);

    }
    ,error:function(e){
      parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

//리드출처
leadSrcChg = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.leadSrcMap[val];
    }
    return returnVal;
}

//상태
statMapChg = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.statMap[val];
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

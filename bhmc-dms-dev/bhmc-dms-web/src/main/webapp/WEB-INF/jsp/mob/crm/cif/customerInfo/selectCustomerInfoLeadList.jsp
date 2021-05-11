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

    <span style="width:35%">#:leadSrcChg(leadSrcCd) #</span>
    <span style="width:30%">#:bhmcYn #</span>
    <span style="width:35%">#:hpNo #</span>
    <span class="clboth" style="width:35%">#:telNo #</span>
    <span style="width:30%">#:prsnNm #</span>
    <span style="width:35%">#:regUsrNm #</span>
    <span class="clboth" style="width:30%">#:statMapChg(statCd) #</span>
    <span style="width:50%">#:chgDate2Str(ddlnDt )#</span>

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
          url:"<c:url value='/crm/cif/customerInfo/selectLeads.do' />"
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

              //params["sLeadTp"] = "IDCC";
              params["sCallListCd"] = "IDCCLEAD";
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
          id:"vinNo"
          ,fields:{
              leadTp:{type:"string", editable:false}
              ,hpNo:{type:"string", editable:false}
              ,telNo:{type:"string", editable:false}
              ,leadSrcCd:{type:"string", editable:false}
              ,bhmcYn:{type:"string", editable:false}
              ,prsnNm:{type:"string", editable:false}
              ,ddlnDt:{type:"date", editable:false}
              ,opptChgDt:{type:"date", editable:false}
              ,regUsrNm:{type:"string", editable:false}
              ,regDt:{type:"date", editable:false}
              ,statCd:{type:"string", editable:false}
              ,delayYn:{type:"string", editable:false}
              ,callStatCd:{type:"string", editable:false}
              ,allocDt:{type:"date", editable:false}
              ,nextCallDt:{type:"date", editable:false}
          }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          //parent.setSubListHeight2("leadList", rTotal, "Y");
          parent.setSubListHeightNew("leadList",3,rTotal);
      }else{
          //parent.setSubListHeight2("leadList", 0, "Y");
          parent.setSubListHeightNew("leadList",3,0);
      }
      }, 200);

      checklistCnt("leadList_noData",this.total(),noDatamsg);

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

//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();

</script>

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
    <span style="width:30%">#:trimNull(rnum) #</span>
    <span style="width:35%">#:chgDateFormat(regDt) #</span>
    <span style="width:35%">#:trimNull(contactStatCd) #</span>
    <span class="clboth" style="width:30%">#:trimNull(contactTpNm) #</span>
    <span style="width:35%">#:trimNull(contactBizCdNm) #</span>
    <span style="width:35%">#:trimNull(receiveRsltCdNm) #</span>
    <span class="clboth" style="width:100%">#:trimNull(contactCont) #</span>
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
          url:"<c:url value='/crm/cif/customerInfo/selectMsgHistorys.do' />"
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

           // 기존 업무 정보가 아닌 콜센터 업무 정보로 조회
             /*  params["sContactBizCd"] = "01";
              params["sRefTableNm"] = "CR_0101T";
              params["sRefKeyNm"] = $("#custNo").val(); */

              params["sCustNo"] = parent.$("#custNo").val();

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
          id:"contactNo"
          ,fields:{
              rnum:{type:"number"}
              ,regDt:{type:"date"}
              ,contactStatCd:{type:"string"}
              ,contactTpNm:{type:"string"}
              ,contactCont:{type:"string"}
              ,contactBizCdNm:{type:"string"}
              ,receiveRsltCdNm:{type:"string"}
          }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          //parent.setSubListHeight2("salesOpptList", rTotal, "Y");
          parent.setSubListHeightNew("msgList",3,rTotal);
      }else{
          //parent.setSubListHeight2("salesOpptList", 0, "Y");
          parent.setSubListHeightNew("msgList",3,0);
      }
      }, 200);

      checklistCnt("msgList_noData",this.total(),noDatamsg);

    }
    ,error:function(e){
      parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

chgDateFormat = function(val){
    var returnVal;

    if (val !== null ){
        returnVal =  kendo.toString(val, '<dms:configValue code='dateFormat' />')
    }else{
        returnVal = '';
    }
    return returnVal;
}

    var app = setKendoMobAppForNativeScroll();

</script>

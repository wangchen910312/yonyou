<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul data-json-obj='true' id="listView" name="listView" data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">
    <span style="width:70%" >#:trimNull(purcCustNm)   #</span>
    <span style="width:30%">#:changePurcStatCd(purcStatCd) #  </span>
    <span class="clboth">#:purcNo #</span>
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
          url:"<c:url value='/mob/sal/usc/purcEval/selectPurcMng.do' />"
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

              //date타입 오류로 임수 주석처리
              if(parent.$("#sPurcRegStartDt").val() == "" /* || parent.$("#search1Area span[name='searchStr']").text() == "" */){
                  params["sPurcRegStartDt"] = null;
              }else{
                  //params["sPurcRegStartDt"] = new Date(parent.$("#sPurcRegStartDt").val());   //발차일자FROM
                  params["sPurcRegStartDt"] = chgDate(parent.$("#sPurcRegStartDt").val());
              }

              if(parent.$("#sPurcRegEndDt").val() == "" /* || parent.$("#search1Area span[name='searchStr']").text() == "" */){
                  params["sPurcRegEndDt"] = null;
              }else{
                  //params["sPurcRegEndDt"] = new Date(parent.$("#sPurcRegEndDt").val());   //발차일자TO
                  params["sPurcRegEndDt"] = chgDate(parent.$("#sPurcRegEndDt").val());
              }

              params["sPurcCustNo"] = parent.$("#sPurcCustNo").val();
              params["sPurcNo"] = parent.$("#sPurcNo").val();

              params["sVinNo"] = parent.$("#sVinNo").val();

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
          fields:{
                        purcNo      :{type:"string"}
                        ,purcCustNm :{type:"string"}
                        ,purcStatCd :{type:"string"}
          }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#listView").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
          checklistCnt("listarea_noData",rTotal,noDatamsg);
      }, 200);

  },
  error:function(e){
      parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
  }
});

//매입상태
changePurcStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.purcStatCdMap[val].cmmCdNm;
    }
    return returnVal;
}

function listViewClick(e)
{
    var dataItem = e.dataItem;
    //parent.contentDetail(e.dataItem.itemCd);
    parent.contentDetail(e.dataItem);
}


var app = setKendoMobApp();

</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul data-json-obj='true' data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="deleteitem">
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

              params["sPurcRegStartDt"] = new Date(parent.$("#sPurcRegStartDt").val());
              params["sPurcRegEndDt"] = new Date(parent.$("#sPurcRegEndDt").val());
              params["sPurcCustNo"] = parent.$("#sPurcCustNo").val();
              params["sPurcNo"] = parent.$("#sPurcNo").val();

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

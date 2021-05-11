<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subListView1" name="subListView1" data-json-obj='true' data-role="listview" data-source="listData" data-template="list-template" data-click="">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="deleteitem">

    <span style="width:40%">#:carRegNo #</span>
    <span style="width:60%">#:vinNo #</span>
    <span class="clboth" style="width:40%">#:carOwnNm #</span>
    <span style="width:30%">#:carOwnNm #</span>
    <span style="width:30%">#:runDistVal #</span>
    <span class="clboth" style="width:40%">#:carNm #</span>
    <span style="width:60%">#:roDocNo #</span>
    <span class="clboth" style="width:40%">#:rnum #</span>
    <span style="width:30%">#:roTpCdChg(roTp) #</span>
    <span style="width:30%">#:ro #</span>

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
          url:"<c:url value='/mob/crm/cif/customerInfo/selectSalesOpptMgmts.do' />"
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
              ,roDocNo:{type:"string"}
          }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          parent.setSubListHeight2("lbrList", rTotal, "Y");
      }else{
          parent.setSubListHeight2("lbrList", 0, "Y");
      }
      }, 200);

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

//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();

</script>

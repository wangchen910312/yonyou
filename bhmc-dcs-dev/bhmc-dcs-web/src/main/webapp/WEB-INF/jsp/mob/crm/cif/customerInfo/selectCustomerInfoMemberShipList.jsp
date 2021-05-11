<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div data-role="view">
  <ul id="subListView1" name="subListView1" data-json-obj='true' data-role="listview" data-source="listData"  data-template="list-template" data-click="">
  </ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="deleteitem">

    <span style="width:30%">#:pointTp #</span>
    <span style="width:70%">#:pointCd #</span>
    <span class="clboth" style="width:30%">#:occrPointVal #</span>
    <span style="width:35%">#:lastPointVal #</span>
    <span style="width:35%">#:chgDate2Str(occrDt) #</span>

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
          url:"<c:url value='/crm/cif/customerInfo/selectMembershipPointHiss.do' />"
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
          id:"rnum"
              ,fields:{
                  rnum:{type:"string"}
                  ,dlrCd:{type:"string" }
                  ,membershipNo:{type:"string"}
                  ,membershipTp:{type:"string"}
                  ,cardNo:{type:"string"}
                  ,pointCd:{type:"string"}
                  ,pointTp:{type:"string"}
                  ,occrPointVal:{type:"string"}
                  ,occrPointVal2:{type:"string"}
                  ,deptNm:{type:"string"}
                  ,prsnId:{type:"string"}
                  ,occrDt:{type:"string"}
              }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          parent.setSubListHeight2("dlrMbrShipList", rTotal, "Y");
      }else{
          parent.setSubListHeight2("dlrMbrShipList", 0, "Y");
      }
      }, 200);

    }
});

changeCarlineCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        //returnVal = parent.carLineCdObj[val].cmmCdNm;
        returnVal = parent.carLineCdObj[val];
    }
    return returnVal;
}



//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();

</script>

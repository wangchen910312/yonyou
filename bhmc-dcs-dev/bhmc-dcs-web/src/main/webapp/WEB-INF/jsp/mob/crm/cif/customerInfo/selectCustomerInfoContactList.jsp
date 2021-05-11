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

    <span class="clboth" style="width:30%">#:contractNo #</span>
    <span style="width:30%">#:contractTp(contractTp) #</span>
    <span style="width:40%">#:contractDt #</span>
    <span class="clboth" style="width:30%">#:contractStat(contractStatCd) #</span>
    <span style="width:30%">#:contractCustNo #</span>
    <span style="width:40%">#:saleEmpNo #</span>
    <span class="clboth" style="width:30%">#:carlineCd #</span>
    <span style="width:30%">#:modelCd #</span>
    <span style="width:40%">#:extColorCd #/#:intColorCd #</span>
    <span class="clboth" style="width:30%">#:carAmt #</span>

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

              params["sDlrCd"] = parent.$("#dlrCd").val();            //딜러코드
              params["sContractCustNo"] = parent.$("#custNo").val();            //고객번호

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
          id:"contractNo"
          ,fields:{
              contractNo     :{type:"string"}
              ,contractTp    :{type:"string"}
              ,contractDt    :{type:"date"}
              ,contractStatCd:{type:"string"}
              ,contractCustNo:{type:"string"}
              ,saleEmpNo     :{type:"string"}
              ,carlineCd     :{type:"string"}
              ,modelCd       :{type:"string"}
              ,ocnCd         :{type:"string"}
              ,extColorCd    :{type:"string"}
              ,intColorCd    :{type:"string"}
              ,carAmt        :{type:"number"}
          }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          parent.setSubListHeight2("contractList", rTotal, "Y");
      }else{
          parent.setSubListHeight2("contractList", 0, "Y");
      }
      }, 200);

    }
});

//계약유형
contractTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.contractTpObj[val];
    }
    return returnVal;
}

//계약상태
contractStat = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.contractStatObj[val];
    }
    return returnVal;
}

//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();
</script>

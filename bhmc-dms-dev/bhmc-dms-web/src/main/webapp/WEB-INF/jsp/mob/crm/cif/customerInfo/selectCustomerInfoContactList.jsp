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
    <span style="width:33%">#:trimNull(contractNo) #</span>
    <span style="width:33%">#:contractTpChg(contractTp) #</span>
    <span style="width:34%">#:chgDateFormat(contractDt) #</span>
    <span class="clboth" style="width:33%">#:contractStat(contractStatCd) #</span>
    <span style="width:33%">#:trimNull(saleEmpNm) #</span>
    <span style="width:34%">#:trimNull(carlineNm) #</span>
    <span class="clboth" style="width:33%">#:trimNull(modelNm) #</span>
    <span style="width:31%">#:commaPointPlus(carAmt) #</span>
    <span style="width:36%">#:trimNull(vinNo) #</span>
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
          url:"<c:url value='/crm/cif/customerInfo/selectProgressSts.do' />"
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
              ,saleEmpNm     :{type:"string"}
              ,carlineNm     :{type:"string"}
              ,modelNm       :{type:"string"}
              ,vinNo         :{type:"string"}
              ,carAmt        :{type:"number"}
          }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          //parent.setSubListHeight2("contractList", rTotal, "Y");
          parent.setSubListHeightNew("contractList",4,rTotal);
      }else{
          //parent.setSubListHeight2("contractList", 0, "Y");
          parent.setSubListHeightNew("contractList",4,0);
      }
      }, 200);

      checklistCnt("contractList_noData",this.total(),noDatamsg);

    }
    ,error:function(e){
      parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

//계약유형
contractTpChg = function(val){
    var returnVal;
    if(val != null && val != ""){
        returnVal = parent.contractTpObj[val];
    }
    return returnVal;
}

//계약상태
contractStat = function(val){
    var returnVal;
    if(val != null && val != ""){
        returnVal = parent.contractStatObj[val];
    }
    return returnVal;
}


chgDateFormat = function(val){
    console.log(val);
    var returnVal;

    if (val !== null ){
        returnVal =  kendo.toString(val, "<dms:configValue code='dateFormat' />");
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

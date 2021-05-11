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
    <span style="width:30%">#:carlineNm #</span>
    <span style="width:35%">#:modelNm #</span>
    <span class="clboth" style="width:30%">#:expcSaleDt #</span>
    <span style="width:35%">#:succPrbCdArrVal(succPrbCd) #</span>
    <span style="width:35%">#:saleOpptSrcCdArrVal(saleOpptSrcCd) #</span>
    <span class="clboth" style="width:30%">#:saleOpptStepCdArrVal(saleOpptStepCd) #</span>
    <span style="width:35%">#:usersArrVal(scId) #</span>
    <span style="width:35%">#:trsfStatCdArrVal(trsfStatCd) #</span>


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
          id:"saleOpptSeq"
          ,fields:{
              rnum:{type:"number"}
              ,saleOpptSeq:{type:"number"}
              ,custNm:{type:"string"}
              ,carlineNm:{type:"string"}
              ,modelNm:{type:"string"}
              ,expcSaleDt:{type:"date"}
              ,succPrbCd:{type:"string"}
              ,saleOpptSrcCd:{type:"string"}
              ,saleOpptStepCd:{type:"string"}
              ,scNm:{type:"string"}
              ,regDt:{type:"date"}
          }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          parent.setSubListHeight2("salesOpptList", rTotal, "Y");
      }else{
          parent.setSubListHeight2("salesOpptList", 0, "Y");
      }
      }, 200);

    }
});

//판매고문
    usersArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = parent.usersArr[val];
        }
        return returnVal;
    };

//성공확률
    succPrbCdArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = parent.succPrbCdArr[val];
        }
        return returnVal;
    };

//판매기회출처
    saleOpptSrcCdArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = parent.saleOpptSrcCdArr[val];
        }
        return returnVal;
    };

//판매기회단계
   saleOpptStepCdArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = parent.saleOpptStepCdArr[val];
        }
        return returnVal;
    };

//전출상태
    trsfStatCdArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = parent.trsfStatCdArr[val];
        }
        return returnVal;
    };

  //var app = setKendoMobApp();
    var app = setKendoMobAppForNativeScroll();

</script>

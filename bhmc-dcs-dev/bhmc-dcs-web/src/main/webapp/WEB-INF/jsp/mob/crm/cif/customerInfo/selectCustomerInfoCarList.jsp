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
    <span style="width:50%">#:purcCarBrandCdChg(carBrandCd) #</span>
    <span style="width:50%">#:carlineNm#</span>
    <span class="clboth" style="width:50%">#:modelNm#</span>
    <span style="width:50%">#:extColorNm# / #:intColorNm#</span>
    <span class="clboth" style="width:50%">#:vinNo#</span>
    <span style="width:50%">#:carRegNo#</span>
    <span class="clboth" style="width:50%">#:dlrNm#</span>
    <span style="width:50%">#:chgDate2Str(custSaleDt) #</span>

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
          url:"<c:url value='/mob/crm/cif/customerInfo/selectHaveCar.do' />"
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
              params["sDlrCd"] = parent.$("#dlrCd").val();

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
              vinNo               :{type:"string"}
             , ncarDstinCd         :{type:"string"}
             , dlrCd               :{type:"string"}
             , carRegNo            :{type:"string"}
             , carlineCd           :{type:"string"}
             , carlineNm           :{type:"string"}
             , modelCd             :{type:"string"}
             , modelNm             :{type:"string"}
             , ocnCd               :{type:"string"}
             , ocnNm               :{type:"string"}
             , extColorCd          :{type:"string"}
             , extColorNm          :{type:"string"}
             , intColorCd          :{type:"string"}
             , intColorNm          :{type:"string"}
             , corpCarDstinCd      :{type:"string"}
             , carBrandCd          :{type:"string"}
             , carNm               :{type:"string"}
             , enginNo             :{type:"string"}
             , custSaleDt          :{type:"date"}
             , dlrNm               :{type:"string"}
          }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#subListView1").data("kendoMobileListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          parent.setSubListHeight2("haveCarList", rTotal, "Y");
      }else{
          parent.setSubListHeight2("haveCarList", 0, "Y");
      }
      }, 200);

    }
});

//브랜드
purcCarBrandCdChg = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.purcCarBrandCdMap[val];
    }
    return returnVal;
}

//var app = setKendoMobApp();
var app = setKendoMobAppForNativeScroll();

</script>

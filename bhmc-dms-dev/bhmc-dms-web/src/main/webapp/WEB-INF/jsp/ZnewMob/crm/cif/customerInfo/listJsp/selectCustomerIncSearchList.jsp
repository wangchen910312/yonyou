<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code='sal.title.incInfo' /><!-- 보험정보 --></h2>
        <div class="title_btn">
            <span class="co_open co_close" id="btnIncSearch"><span>상세내용 접기 </span></span>
            <!-- <span class="co_open co_close"><span>상세내용 보기 </span></span>  -->
        </div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="deleteitem listhead">
            <span style="width:45%"><spring:message code='global.lbl.carLine' /><!-- 차종 --></span>
            <span style="width:55%"><spring:message code='global.lbl.model' /><!-- 차관 --></span>
            <span class="clboth" style="width:45%"><spring:message code='global.lbl.vinNum' /><!-- VIN NO --></span>
            <span style="width:55%"><spring:message code='global.lbl.contractNo' /><!-- 계약번호 --></span>
            <span class="clboth" style="width:45%"><spring:message code='global.lbl.incCmp' /><!-- 보험회사 --></span>
            <span style="width:55%"><spring:message code='global.lbl.incNo' /><!-- 보험 증서 번호 --></span>
            <span class="clboth" style="width:45%"><spring:message code='sal.lbl.incExpcAmt' /><!-- 보험예상금액 --></span>
            <span style="width:55%"><spring:message code='sal.lbl.realIncAmt' /><!-- 실보험금액 --></span>
            <span class="clboth" style="width:45%"><spring:message code='ser.lbl.incFeeAmt' /><!-- 보험수수료 --></span>
            <span style="width:55%"><spring:message code='sal.lbl.salesAdvisor' /><!-- 판매고문 --></span>
            <span class="clboth" style="width:45%"><spring:message code='global.lbl.incJoinDt' /><!-- 보험가입일 --></span>
            <span style="width:55%"><spring:message code='sal.lbl.incPerson' /><!-- 보험담당자 --></span>
            <span class="clboth" style="width:100%"><spring:message code='sal.lbl.incProfitNm' /><!-- 제1수익자 --></span>
        </div>
        <div>
            <div id="subListView10" style="height:200px; overflow:scroll;"></div>
        </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate10">
<div class="deleteitem">
    <span style="width:45%">#:trimNull(carlineNm) #</span>
    <span style="width:55%">#:trimNull(modelNm)#</span>
    <span class="clboth" style="width:55%">#:trimNull(vinNo) #</span>
    <span style="width:45%">#:trimNull(contractNo) #</span>
    <span class="clboth" style="width:45%">#:incCmpCdChg(incCmpCd) #</span>
    <span style="width:55%">#:trimNull(incNo) #</span>
    <span class="clboth" style="width:45%">#:commaPointPlus(incExpcTotAmt) #</span>
    <span style="width:55%">#:commaPointPlus(realIncTotAmt) #</span>
    <span class="clboth" style="width:45%">#:commaPointPlus(incFeeTotAmt) #</span>
    <span style="width:55%">#:trimNull(saleId) #</span>
    <span class="clboth" style="width:45%">#:chgDateFormat(incJoinDt) #</span>
    <span style="width:55%">#:trimNull(incPrsnNm) #</span>
    <span class="clboth" style="width:100%">#:trimNull(incProfitNm) #</span>
</div>
</script>

<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var data = [];
// datasource below is customized for demo purposes.
var subListData10 = new kendo.data.DataSource({
  transport:{
      read:{
          url:"<c:url value='/crm/cif/customerInfo/selectIncSearch.do' />"
          ,dataType:"json"
          ,type:"POST"
          ,contentType:"application/json"
      }
      ,parameterMap:function(options, operation) {
          if (operation === "read") {
              var params = {};
              params["sDlrCd"] = $("#dlrCd").val();
              params["sCustNo"]  = $("#custNo").val();
              return kendo.stringify(params);
          }
      }
  }
  ,batch:true
  ,schema:{
      data:"data"
      ,total:"total"
      ,model:{
          id:"incPk"
          ,fields:{
               incPk:{type:"string", editable:false}
              ,incCmpNm:{type:"string", editable:false}
              ,incNo:{type:"string", editable:false}
              ,incExpcTotAmt:{type:"string", validation:{required:true}, editable:false}
              ,realIncTotAmt:{type:"string", validation:{required:true}, editable:false}
              ,incFeeTotAmt:{type:"string", validation:{required:false}, editable:false}
              ,saleId:{type:"string", validation:{required:false}, editable:false}
              ,incJoinDt:{type:"date", validation:{required:false}, editable:false}
              ,incPrsnId:{type:"string", validation:{required:false}, editable:false}
              ,incProfitNm:{type:"string", validation:{required:false}, editable:false}
              ,carlineNm:{type:"string", validation:{required:false}, editable:false}
              ,modelNm:{type:"string", validation:{required:false}, editable:false}
              ,vinNo:{type:"string", validation:{required:false}, editable:false}
          }
      }
  },
  change:function(e) {
      var rTotal = 0;
      rTotal = $("#subListView10").data("kendoListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          setSubListHeightNew("incList",4,rTotal);
      }else{
          setSubListHeightNew("incList",4,0);
      }
      }, 200);
    }
    ,error:function(e){
      mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

//보험회사
incCmpCdChg = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = incCmpCdMap[val];
    }
    return returnVal;
};


chgDateFormat = function(val){
    var returnVal;
    if (val !== null ){
        returnVal =  kendo.toString(val, "<dms:configValue code='dateFormat' />");
    }else{
        returnVal = '';
    }
    return returnVal;
};

function commaPointPlus(val) {
    if(val == null || val == ""){
        return "";
    }
    var num = parseFloat(val);
    return kendo.format("{0:#,###.00}", num);
}

$(document).ready(function(){
    $("#subListView10").kendoListView({
        dataSource:subListData10
        ,template:kendo.template($("#subTemplate10").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView10").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView10").css({"background-image":"none"});
            }
        }
    });
});

</script>

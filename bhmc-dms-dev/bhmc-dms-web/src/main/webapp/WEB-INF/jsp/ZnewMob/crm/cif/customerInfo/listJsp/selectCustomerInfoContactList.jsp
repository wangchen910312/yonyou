<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code='global.lbl.contract' /><!-- 계약 이력 --></h2>
        <div class="title_btn">
            <span class="co_open co_close" id="btnContractSearch"><span>상세내용 접기 </span></span>
            <!-- <span class="co_open co_close"><span>상세내용 보기 </span></span>  -->
        </div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
            <div class="deleteitem listhead">
                <span style="width:33%"><spring:message code='global.lbl.contractNo' /><!-- 계약번호 --></span>
                <span style="width:33%"><spring:message code='global.lbl.saleType' /><!-- 판매유형 --></span>
                <span style="width:34%"><spring:message code='global.lbl.contractDate' /><!-- 계약일 --></span>
                <span class="clboth" style="width:33%"><spring:message code='global.lbl.contractStat' /><!-- 계약상태 --></span>
                <span style="width:33%"><spring:message code='sale.lbl.saleEmpNo' /><!-- 영업사원 --></span>
                <span style="width:34%"><spring:message code='global.lbl.carLine' /><!-- 차종 --></span>
                <span class="clboth" style="width:33%"><spring:message code='global.lbl.model' /><!-- 모델(차관) --></span>
                <span style="width:33%"><spring:message code='global.lbl.vehiclePrice' /><!-- 차량가격 --></span>
                <span style="width:34%"><spring:message code='global.lbl.vinNo' /><!-- VIN NO --></span>
            </div>
            <div>
                <div id="subListView15" style="height:200px; overflow:scroll;"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate15">
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

var data = [];
// datasource below is customized for demo purposes.
var subListData15 = new kendo.data.DataSource({
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
              params["sDlrCd"] = $("#dlrCd").val();            //딜러코드
              params["sContractCustNo"] = $("#custNo").val();            //고객번호
              return kendo.stringify(params);
          }
      }
  }
  ,batch:true
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
      rTotal = $("#subListView15").data("kendoListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          setSubListHeightNew("contractList",4,rTotal);
      }else{
          setSubListHeightNew("contractList",4,0);
      }
      }, 200);
    }
    ,error:function(e){
      mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

//계약유형
contractTpChg = function(val){
    var returnVal;
    if(val != null && val != ""){
        returnVal = contractTpObj[val];
    }
    return returnVal;
};

//계약상태
contractStat = function(val){
    var returnVal;
    if(val != null && val != ""){
        returnVal = contractStatObj[val];
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
    $("#subListView15").kendoListView({
        dataSource:subListData15
        ,template:kendo.template($("#subTemplate15").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView15").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView15").css({"background-image":"none"});
            }
        }
    });
});
</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code='global.lbl.haveCar' /><!-- 보유차량 --></h2>
        <div class="title_btn">
            <span class="co_open co_close" id="btnCarSearch"><span>상세내용 접기 </span></span>
        </div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
            <div class="deleteitem listhead">   <!-- 신차구분, 차종명, 차관, VIN, 엔진번호, 번호판, 외장색명, 내장색명, 판매일자, 영수증일자 -->
                <span style="width:50%"><spring:message code='global.lbl.gubun' /><!-- 신차구분 --></span>
                <span style="width:50%"><spring:message code='global.lbl.carlineNm' /><!-- 차종명 --></span>
                <span class="clboth" style="width:50%"><spring:message code='global.lbl.modelNm' /><!-- 차관 --></span>
                <span style="width:50%"><spring:message code='global.lbl.vinNo' /><!-- VIN 번호 --></span>
                <span class="clboth" style="width:50%"><spring:message code='global.lbl.enginNo' /><!-- 엔진번호 --></span>
                <span style="width:50%"><spring:message code='global.lbl.licensePlt' /><!-- 번호판 --></span>
                <span class="clboth" style="width:50%"><spring:message code='global.lbl.extColorNm' /><!-- 외장색 --></span>
                <span style="width:50%"><spring:message code='global.lbl.intColorNm' /><!-- 내장색 --></span>
                <span class="clboth" style="width:50%"><spring:message code='sal.lbl.saleDt' /><!-- 판매일자 --></span>
                <span style="width:50%"><spring:message code='sal.lbl.invoiceDt' /><!-- 영수증일자 --></span>
            </div>
            <div>
                <div id="subListView3" style="height:200px; overflow:scroll;"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate3">
<div class="deleteitem">
    <span style="width:50%">#:createGubunData(useYn)#</span>
    <span style="width:50%">#:trimNull(carlineNm)#</span>
    <span class="clboth" style="width:50%">#:trimNull(modelNm)#</span>
    <span style="width:50%">#:trimNull(vinNo)#</span>
    <span class="clboth" style="width:50%">#:trimNull(enginSerialNo)#</span>
    <span style="width:50%">#:trimNull(carRegNo)#</span>
    <span class="clboth" style="width:50%">#:trimNull(extColorNm)#</span>
    <span style="width:50%">#:trimNull(intColorNm)#</span>
    <span class="clboth" style="width:50%">#:chgDate2Str(custSaleDt) #</span>
    <span style="width:50%">#:chgDate2Str(invcPublDt) #</span>
</div>
</script>

<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var data = [];
// datasource below is customized for demo purposes.
var subListData3 = new kendo.data.DataSource({
  transport:{
      read:{
          url:"<c:url value='/mob/crm/cif/customerInfo/selectHaveCar.do' />"
          ,dataType:"json"
          ,type:"POST"
          ,contentType:"application/json"
      }
      ,parameterMap:function(options, operation) {
              var params = {};
              params["sCustNo"] = $("#custNo").val();
              params["sDlrCd"] = $("#dlrCd").val();
              return kendo.stringify(params);
      }
  }
  ,batch:true
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
             , custSaleDt          :{type:"string"}
             , dlrNm               :{type:"string"}
             , enginSerialNo       :{type:"string"}
             , invcPublDt          :{type:"string"}
             , useYn               :{type:"string"}
          }
      }
  },
  change:function(e) {

      var rTotal = 0;
      rTotal = $("#subListView3").data("kendoListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          setSubListHeightNew("haveCarList",4,rTotal);
      }else{
          setSubListHeightNew("haveCarList",4,0);
      }
      }, 200);
    }
    ,error:function(e){
        mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

//브랜드
purcCarBrandCdChg = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = purcCarBrandCdMap[val];
    }
    return returnVal;
};

//신차구분
newCarBrandCdChg = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = ncarDstinCdMap[val];
    }
    return returnVal;
};

//구분
createGubunData = function(useYn){
    if(useYn == null || useYn == "") {
        return "";
    }
    return (useYn == "Y")? "<spring:message code='global.lbl.haveCar' />" : "<spring:message code='global.lbl.historyCar' />";
};

$(document).ready(function(){
    $("#subListView3").kendoListView({
        dataSource:subListData3
        ,template:kendo.template($("#subTemplate3").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView3").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView3").css({"background-image":"none"});
            }
        }
    });
});

</script>

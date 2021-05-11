<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="listarea02">    <!-- 충전카드이력 -->
    <div class="deleteitem listhead">
        <span style="width:33%"><spring:message code='global.lbl.no'/><!-- 번호 --></span>
        <span style="width:34%"><spring:message code='global.lbl.cardNo'/><!-- 카드번호 --></span>
        <span style="width:33%"><spring:message code='global.lbl.amt'/><!-- 금액 --></span>
        <span class="clboth" style="width:33%"><spring:message code='crm.lbl.realTotAmt'/><!-- 가용금액 --></span>
        <span style="width:34%"><spring:message code='global.lbl.arDt'/><!-- 발생일 --></span>
        <span style="width:33%"><spring:message code='crm.lbl.prsNm'/><!-- 책임자 --></span>
        <span class="clboth" style="width:100%"><spring:message code='crm.lbl.pointCdCont'/><!-- 포인트출처 --></span>
    </div>
    <div>
        <div id="subListView8" style="height:200px; overflow:scroll;"></div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate8">
<div class="deleteitem">
    <span style="width:45%">#:trimNull(rnum) #</span>
    <span style="width:55%">#:trimNull(cardNo) #</span>
    <span class="clboth" style="width:45%">#:trimNull(pointCdNm) #</span>
    <span style="width:55%">#:trimNull(occrPointVal2) #</span>
    <span style="width:45%">#:trimNull(realTotAmt) #</span>
    <span style="width:55%">#:trimNull(occrDt) #</span>
    <span style="width:55%">#:trimNull(prsnNm) #</span>
</div>
</script>

<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var data = [];
// datasource below is customized for demo purposes.
var subListData8 = new kendo.data.DataSource({
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
              params["sCardTpCd"] = "02";
              params["sMembershipNo"] = $("#membershipNo").data("kendoExtDropDownList").value();
              return kendo.stringify(params);

          }
      }
  }
  ,batch:true
  ,schema:{
      data:"data"
      ,total:"total"
      ,model:{
          id:"rnum"
            ,fields:{
                rnum:{type:"string"}
                ,dlrCd:{type:"string"}
                ,membershipNo:{type:"string"}
                ,membershipTp:{type:"string"}
                ,cardNo:{type:"string"}
                ,pointCd:{type:"string"}
                ,pointTp:{type:"string"}
                ,occrPointVal:{type:"string"}
                ,occrPointVal2:{type:"string"}
                ,lastPointVal:{type:"string"}
                ,deptNm:{type:"string"}
                ,prsnNm:{type:"string"}
                ,occrDt:{type:"string",format:"{0:<dms:configValue code='dateTimeFormat' />}"}
            }
      }
  }
    ,error:function(e){
      mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});


chagneCardTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = cardTpCdMap[val];
    }
    return returnVal;
};

function changeDatePattern(val){
    return val.split("/").join("-");
}

$(document).ready(function(){
    $("#subListView8").kendoListView({
        dataSource:subListData8
        ,template:kendo.template($("#subTemplate8").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView8").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView8").css({"background-image":"none"});
            }
        }
    });
});

</script>

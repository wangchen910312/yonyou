<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code='ser.lbl.lbrHistory' /><!-- 정비이력 --></h2>
        <div class="title_btn">
            <span class="co_open co_close" id="btnLbrSearch"><span>상세내용 접기 </span></span>
            <!-- <span class="co_open co_close"><span>상세내용 보기 </span></span>  -->
        </div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
            <div class="deleteitem listhead">
                <span style="width:45%"><spring:message code='ser.lbl.dealer' /><!-- 딜러 --></span>
                <span style="width:55%"><spring:message code='global.lbl.vinNo' /><!-- VIN 번호 --></span>
                <span class="clboth" style="width:45%"><spring:message code='ser.lbl.carNo' /><!-- 차량번호 --></span>
                <span style="width:55%"><spring:message code='ser.lbl.vsitr' /><!--방문자--></span>
                <span class="clboth" style="width:45%"><spring:message code='ser.lbl.nowRunDist' /><!-- 사전점검주행거리 --></span>
                <span style="width:55%"><spring:message code='ser.lbl.accuDrivDis' /><!-- 누계주행거리 --></span>
                <span class="clboth" style="width:45%"><spring:message code='ser.lbl.roDt' /><!-- RO일자 --></span>
                <span style="width:55%"><spring:message code='ser.lbl.roTp' /><!-- RO유형 --></span>
                <span class="clboth" style="width:100%"><spring:message code='ser.lbl.roDocNo' /><!-- RO번호 --></span>
            </div>
            <div>
                <div id="subListView6" style="height:200px; overflow:scroll;"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate6">
<div class="deleteitem">
    <span style="width:45%">#:trimNull(dlrCd) #</span>
    <span style="width:55%">#:trimNull(vinNo) #</span>
    <span class="clboth" style="width:45%">#:trimNull(carRegNo) #</span>
    <span style="width:55%">#:trimNull(driverNm) #</span>
    <span class="clboth" style="width:45%">#:trimNull(runDistVal) #</span>
    <span style="width:55%">#:trimNull(lastRunDistVal) #</span>
    <span class="clboth" style="width:45%">#:chgDateFormat(roDt) #</span>
    <span style="width:55%">#:trimNull(roTp) #</span>
    <span class="clboth" style="width:100%">#:trimNull(roDocNo) #</span>
</div>
</script>

<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var data = [];
// datasource below is customized for demo purposes.
var subListData6 = new kendo.data.DataSource({
  transport:{
      read:{
          url:"<c:url value='/crm/cmm/selectRepairOrdersHistory.do' />"
          ,dataType:"json"
          ,type:"POST"
          ,contentType:"application/json"
      }
      ,parameterMap:function(options, operation) {
          if (operation === "read") {
              var params = {};
              params["sCarOwnerId"] =  $("#custNo").val();
              params["sRoStatCd"] = "05";
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
              rnum:{type:"number"}
              ,dlrCd:{type:"string"}
              ,resvDocNo:{type:"string"}
              ,vinNo:{type:"string"}
              ,carRegNo:{type:"string"}
              ,driverNm:{type:"string"}
              ,runDistVal:{type:"number", format:"{0:n0}"}
              ,lastRunDistVal:{type:"number", format:"{0:n0}"}
              ,roDocNo:{type:"string"}
              ,roTp:{type:"string"}
              ,roDt:{type:"date"}
          }
      }
  },
  change:function(e) {
      var rTotal = 0;
      rTotal = $("#subListView6").data("kendoListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          setSubListHeightNew("lbrList",3,rTotal);
      }else{
          setSubListHeightNew("lbrList",3,0);
      }
      }, 200);
    }
    ,error:function(e){
      mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

//RO유형
roTpCdChg = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = roTpCdListMap[val];
    }
    return returnVal;
};

chgDateFormat = function(val){
    var returnVal;
    if (val !== null ){
        returnVal =  kendo.toString(val, '<dms:configValue code='dateFormat' /> HH:mm');
    }else{
        returnVal = '';
    }
    return returnVal;
};

$(document).ready(function(){
    $("#subListView6").kendoListView({
        dataSource:subListData6
        ,template:kendo.template($("#subTemplate6").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView6").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView6").css({"background-image":"none"});
            }
        }
    });
});

</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code='global.lbl.infoUpdHist' /><!-- 고객 정보변경 이력 --></h2>
        <div class="title_btn">
            <span class="co_open co_close" id="btnInfoHissSearch"><span>상세내용 접기 </span></span>
            <!-- <span class="co_open co_close"><span>상세내용 보기 </span></span>  -->
        </div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
            <div class="deleteitem listhead">
                <span style="width:45%"><spring:message code='global.lbl.no' /><!-- 번호 --></span>
                <span style="width:55%"><spring:message code='global.lbl.field' /><!-- 필드 --></span>
                <span class="clboth" style="width:45%"><spring:message code='crm.lbl.beforeValue' /><!-- 이전값 --></span>
                <span style="width:55%"><spring:message code='crm.lbl.afterValue' /><!-- 이후값 --></span>
                <span class="clboth" style="width:45%"><spring:message code='global.lbl.updtUsrId' /><!-- 수정자 --></span>
                <span style="width:55%"><spring:message code='global.lbl.chgDt' /><!-- 변경일 --></span>
            </div>
            <div>
                <div id="subListView13" style="height:200px; overflow:scroll;"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate13">
<div class="deleteitem">
    <span style="width:45%">#:trimNull(rnum) #</span>
    <span style="width:55%">#:trimNull(chgCdNm) #</span>
    <span class="clboth" style="width:45%">#:trimNull(befValue) #</span>
    <span style="width:55%">#:trimNull(aftValue) #</span>
    <span class="clboth" style="width:45%">#:trimNull(regUsrNm)#</span>
    <span style="width:55%">#:chgDateFormat(logDt)#</span>
</div>
</script>

<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var data = [];
// datasource below is customized for demo purposes.
var subListData13 = new kendo.data.DataSource({
  transport:{
      read:{
          url:"<c:url value='/crm/cif/customerInfo/selectCustomerInfoHistory.do' />"
          ,dataType:"json"
          ,type:"POST"
          ,contentType:"application/json"
      }
      ,parameterMap:function(options, operation) {
          if (operation === "read") {
              var params = {};
              params["sCustNo"] =  $("#custNo").val();
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
              rnum:{type:"number", editable:false}
              ,regUsrNm:{type:"string", editable:false}
              ,befValue:{type:"string", editable:false}
              ,aftValue:{type:"string", editable:false}
              ,logDt:{type:"date", editable:false}
              ,chgCdNm:{type:"string", editbale:false}
          }
      }
  },
  change:function(e) {
      var rTotal = 0;
      rTotal = $("#subListView13").data("kendoListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          setSubListHeightNew("infoUpdHistList",5,rTotal);
      }else{
          setSubListHeightNew("infoUpdHistList",5,0);
      }
      }, 200);
    }
    ,error:function(e){
      mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

//리드출처
leadSrcChg = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = leadSrcMap[val];
    }
    return returnVal;
};

//상태
statMapChg = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = statMap[val];
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
    $("#subListView13").kendoListView({
        dataSource:subListData13
        ,template:kendo.template($("#subTemplate13").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView13").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView13").css({"background-image":"none"});
            }
        }
    });
});

</script>

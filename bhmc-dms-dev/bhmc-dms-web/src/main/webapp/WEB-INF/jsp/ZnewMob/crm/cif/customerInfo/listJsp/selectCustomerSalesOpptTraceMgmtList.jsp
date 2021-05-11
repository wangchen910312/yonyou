<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code='crm.lbl.activeHistory' /><!-- 추적이력 --></h2>
        <div class="title_btn">
            <span class="co_open co_close" id="btnTraceSearch"><span>상세내용 접기 </span></span>
        </div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
            <div class="deleteitem listhead">
                <span style="width:50%"><spring:message code='crm.lbl.tracer' /><!-- 추적자 --></span>
                <span style="width:50%"><spring:message code='crm.lbl.traceDt' /><!-- 추적시간 --></span>
                <span class="clboth" style="width:50%"><spring:message code='crm.lbl.traceMth' /><!-- 추적방식 --></span>
                <span style="width:50%"><spring:message code='crm.lbl.activeGrade' /><!-- 추적등급 --></span>
                <span style="width:100%"><spring:message code='crm.lbl.traceCont' /><!-- 추적상황 --></span>
                <span class="clboth" style="width:50%"><spring:message code='crm.lbl.nextTraceDt' /><!-- 다음추적시간 --></span>
                <span style="width:50%"><spring:message code='crm.lbl.nextTraceMthCd' /><!-- 다음추적방식 --></span>
            </div>
            <div>
                <div id="subListView4" style="height:200px; overflow:scroll;"></div>
            </div>
       </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate4">
<div class="deleteitem">
    <span style="width:50%">#:trimNull(mngScNm) #</span>
    <span style="width:50%">#:chgDateFormat(traceDt) #</span>
    <span class="clboth" style="width:50%">#:trimNull(traceMthNm) #</span>
    <span style="width:50%">#:trimNull(traceGradeNm) #</span>
    <span class="clboth" style="width:100%">#:trimNull(traceCont) #</span>
    <span class="clboth" style="width:50%">#:chgDateFormat(nextTraceDt) #</span>
    <span style="width:50%">#:trimNull(nextTraceMthNm) #</span>
</div>
</script>

<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var data = [];
// datasource below is customized for demo purposes.
var subListData4 = new kendo.data.DataSource({
  transport:{
      read:{
          url:"<c:url value='/crm/cif/customerInfo/selectSalesOpptTraceMgmt.do' />"
          ,dataType:"json"
          ,type:"POST"
          ,contentType:"application/json"
      }
      ,parameterMap:function(options, operation) {
          if (operation === "read") {
              var seq = $("#seq").val();
              if (dms.string.isEmpty(seq)){
                  seq = "-999999";
              }
              var params = {};
              params["sSaleOpptSeq"]           = seq;
              return kendo.stringify(params);
          }
      }
  }
  ,batch:true
  ,schema:{
      data:"data"
      ,total:"total"
      ,model:{
          id:"seq"
          ,fields:{
              seq:{type:"string", editable:false}
          ,rnum  :{type:"number" , editable:false}
          ,mngScNm:{type:"string", editable:true}
          ,traceMthNm:{type:"string", editable:false}
          ,traceGradeNm:{type:"string", editable:false}
          ,traceCont:{type:"string", editable:false}
          ,nextTraceMthNm:{type:"string", editable:false}
          ,traceDt:{type:"date", editable:false}
          ,nextTraceDt:{type:"date", editable:false}
          ,traceDtFormat:{type:"date", editable:false}
          ,nextTraceDtFormat:{type:"date", editable:false}
          }
      }
  },
  change:function(e) {
      var rTotal = 0;
      rTotal = $("#subListView4").data("kendoListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          setSubListHeightNew("traceList",3,rTotal);
      }else{
          setSubListHeightNew("traceList",3,0);
      }
      }, 200);
    }
    ,error:function(e){
      mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

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
    $("#subListView4").kendoListView({
        dataSource:subListData4
        ,template:kendo.template($("#subTemplate4").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView4").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView4").css({"background-image":"none"});
            }
        }
    });
});
</script>

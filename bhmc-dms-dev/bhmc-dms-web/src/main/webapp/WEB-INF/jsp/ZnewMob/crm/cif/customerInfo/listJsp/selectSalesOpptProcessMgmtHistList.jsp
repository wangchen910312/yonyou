<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code='crm.lbl.leadStatusExchange' /><!-- 회전기록 --></h2>
        <div class="title_btn">
            <span class="co_open co_close" id="btnLeadStatusExchangSearch"><span>상세내용 접기 </span></span>
            <!-- <span class="co_open co_close"><span>상세내용 보기 </span></span>  -->
        </div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
            <div class="deleteitem listhead">
                <span style="width:50%"><spring:message code='global.lbl.dateTime' /><!-- 일시 --></span>
                <span style="width:50%"><spring:message code='crm.lbl.leadStat' /><!-- 리드상태 --></span>
                <span class="clboth" style="width:50%"><spring:message code='crm.lbl.prsNm' /><!-- 책임자 --></span>
                <span style="width:50%"><spring:message code='global.lbl.handler' /><!-- 조작인 --></span>
                <span style="width:100%"><spring:message code='crm.title.detailCont' /><!-- 상세내용 --></span>
            </div>
            <div>
                <div id="subListView5" style="height:200px; overflow:scroll;"></div>
            </div>
       </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate5">
<div class="deleteitem">
    <span style="width:50%">#:chgDateFormat(regDt) #</span>
    <span style="width:50%">#:trimNull(leadStatCont) #</span>
    <span class="clboth" style="width:50%">#:trimNull(mngScNm) #</span>
    <span style="width:50%">#:trimNull(regUsrNm) #</span>
    <span class="clboth" style="width:100%">#:trimNull(sysMesgCont) #</span>

</div>
</script>

<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var data = [];
// datasource below is customized for demo purposes.
var subListData5 = new kendo.data.DataSource({
  transport:{
      read:{
          url:"<c:url value='/crm/cif/customerInfo/selectSalesOpptProcessMgmtHist.do' />"
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
          ,regDt:{type:"date", editable:true}
          ,leadStatCont:{type:"string", editable:false}
          ,mngScNm:{type:"string", editable:false}
          ,regUsrNm:{type:"string", editable:false}
          ,sysMesgCont:{type:"string", editable:false}
          }
      }
  },
  change:function(e) {
      var rTotal = 0;
      rTotal = $("#subListView5").data("kendoListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          setSubListHeightNew("leadStatusExchangeList",3,rTotal);
      }else{
          setSubListHeightNew("leadStatusExchangeList",3,0);
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
    $("#subListView5").kendoListView({
        dataSource:subListData5
        ,template:kendo.template($("#subTemplate5").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView5").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView5").css({"background-image":"none"});
            }
        }
    });
});

</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="co_group mb40">
    <div class="content_title">
        <h2><spring:message code='global.lbl.message' /><!-- 계약 이력 --></h2>
        <div class="title_btn">
            <span class="co_open co_close" id="btnMsgSearch"><span>상세내용 접기 </span></span>
            <!-- <span class="co_open co_close"><span>상세내용 보기 </span></span>  -->
        </div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
            <div class="deleteitem listhead">
                <span style="width:30%"><spring:message code='global.lbl.issueNo' /><!-- 번호 --></span>
                <span style="width:35%"><spring:message code='global.crm.contactDt' /><!-- 연락일 --></span>
                <span style="width:35%"><spring:message code='crm.lbl.blueMemMthCd' /><!-- 유형 --></span>
                <span class="clboth" style="width:30%"><spring:message code='global.lbl.contactTp' /><!-- 연락방법 --></span>
                <span style="width:32%"><spring:message code='global.lbl.contactBizCd' /><!-- 접촉업무 --></span>
                <span style="width:38%"><spring:message code='crm.lbl.smsSendRsltCont' /><!-- SMS전송결과 --></span>
                <span class="clboth" style="width:100%"><spring:message code='global.lbl.contactCont' /><!-- 연락내용 --></span>
            </div>
            <div>
                <div id="subListView17" style="height:200px; overflow:scroll;"></div>
            </div>

        </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate17">
<div class="deleteitem">
    <span style="width:30%">#:trimNull(rnum) #</span>
    <span style="width:35%">#:chgDateFormat(regDt) #</span>
    <span style="width:35%">#:trimNull(contactStatCd) #</span>
    <span class="clboth" style="width:30%">#:trimNull(contactTpNm) #</span>
    <span style="width:35%">#:trimNull(contactBizCdNm) #</span>
    <span style="width:35%">#:trimNull(receiveRsltCdNm) #</span>
    <span class="clboth" style="width:100%">#:trimNull(contactCont) #</span>
</div>
</script>

<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var data = [];
// datasource below is customized for demo purposes.
var subListData17 = new kendo.data.DataSource({
  transport:{
      read:{
          url:"<c:url value='/crm/cif/customerInfo/selectMsgHistorys.do' />"
          ,dataType:"json"
          ,type:"POST"
          ,contentType:"application/json"
      }
      ,parameterMap:function(options, operation) {
          if (operation === "read") {

              var params = {};
              params["sCustNo"] = $("#custNo").val();
              return kendo.stringify(params);
          }
      }
  }
  ,batch:true
  ,schema:{
      data:"data"
      ,total:"total"
      ,model:{
          id:"contactNo"
          ,fields:{
              rnum:{type:"number"}
              ,regDt:{type:"date"}
              ,contactStatCd:{type:"string"}
              ,contactTpNm:{type:"string"}
              ,contactCont:{type:"string"}
              ,contactBizCdNm:{type:"string"}
              ,receiveRsltCdNm:{type:"string"}
          }
      }
  },
  change:function(e) {
      var rTotal = 0;
      rTotal = $("#subListView17").data("kendoListView").dataSource.total();
      setTimeout(function(){
      if(rTotal > 0){
          setSubListHeightNew("msgList",3,rTotal);
      }else{
          setSubListHeightNew("msgList",3,0);
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
        returnVal =  kendo.toString(val, '<dms:configValue code='dateFormat' />');
    }else{
        returnVal = '';
    }
    return returnVal;
};

$(document).ready(function(){
    $("#subListView17").kendoListView({
        dataSource:subListData17
        ,template:kendo.template($("#subTemplate17").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView17").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView17").css({"background-image":"none"});
            }
        }
    });
});

</script>

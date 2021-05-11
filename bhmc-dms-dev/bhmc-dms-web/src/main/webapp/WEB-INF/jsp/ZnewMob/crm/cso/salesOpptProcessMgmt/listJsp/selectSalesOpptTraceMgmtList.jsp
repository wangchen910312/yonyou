<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div class="co_group">
    <div class="content_title">
        <h2><spring:message code="crm.lbl.activeHistory" /><!-- 추적기록 --></h2>
        <div class="title_btn">
            <span class="co_open co_close" id="activeHistoryListBtn"><span> </span></span>
        </div>
    </div>
    <div class="co_view" style="display:none">
        <div class="listarea01">
            <div class="deleteitem listhead">
                <span style="width:50%"><spring:message code='crm.lbl.tracer' /><!-- 추적자 --></span>
                <span style="width:50%"><spring:message code='crm.lbl.traceDt' /><!-- 추적시간 --></span>
                <span class="clboth" style="width:50%"><spring:message code='crm.lbl.traceMth' /><!-- 추적방식 --></span>
                <span style="width:50%"><spring:message code='crm.lbl.activeGrade' /><!-- 등급 --></span>
                <span class="clboth" style="width:50%"><spring:message code='crm.lbl.traceCont' /><!-- 상황 --></span>
            </div>
            <div>
                <div id="subListView2" style="height:300px; overflow:scroll;"></div>
            </div>
            <div class="deleteitem" style="display:none;" id="activeHistoryList_noData"><span></span></div>
        </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate2">
<div class="deleteitem">
    <span style="width:50%">#:trimNull(mngScNm) #</span>
    <span style="width:50%">#:chgDateFormat(traceDtFormat) #</span>
    <span class="clboth" style="width:50%">#:trimNull(traceMthNm) #</span>
    <span style="width:50%">#:trimNull(traceGradeNm) #</span>
    <span class="clboth" style="width:50%">#:trimNull(traceCont) #</span>
</div>
</script>

<script>
var subListData2 = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptTraceMgmt.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                var parentUrl = document.location.href;
                var seq = "";
                if(parentUrl.indexOf("selectEditSalesOpptProcessPopup") > -1){
                    seq = $("#seq").val();
                }else{
                    seq = $("#seq").val();
                }
                // 고객번호
               if ( dms.string.isEmpty(seq) ) {
                    mob.notification.warning("<spring:message code='global.lbl.saleOppt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                };
                params["sSaleOpptSeq"] = seq;
                return kendo.stringify(params);
            }
        }
    }
    ,batch:true
    ,serverPaging:true
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
        },parse:function(d) {
            if(d.data){
                $.each(d.data, function(idx, elem) {
                    elem.traceDtFormat = kendo.parseDate(elem.traceDt, "<dms:configValue code='dateTimeFormat' />");
                    elem.nextTraceDtFormat = kendo.parseDate(elem.nextTraceDt, "<dms:configValue code='dateFormat' />");
                });
            }
            return d;
        }
    },
    change :function(e){
        var rTotal = 0;
        rTotal = e.items.length;
        setTimeout(function(){
            if(rTotal > 0){
                setSubListHeightNew("activeHistoryList",3,rTotal);
            }else{
                setSubListHeightNew("activeHistoryList",3,0);
            }
        }, 200);
        //app.hideLoading();
        //checklistCnt("activeHistoryList_noData",e.items.length,noDatamsg);
    }
    ,error:function(e){
      mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
  }
});

$(document).ready(function(){
    $("#subListView2").kendoListView({
        dataSource:subListData2
        ,template:kendo.template($("#subTemplate2").html())
        ,autoBind:false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView2").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView2").css({"background-image":"none"});
            }
        }
    });
    $("#activeHistoryListBtn").click(function(){
        if($(this).attr("class") == "co_open"){
            subListData2.read();
        }
    });
});
chgDateFormat = function(val){
    var returnVal;
    if (val !== null ){
        returnVal =  kendo.toString(val, "<dms:configValue code='dateFormat' />");
    }else{
        returnVal = '';
    }
    return returnVal;
};
</script>

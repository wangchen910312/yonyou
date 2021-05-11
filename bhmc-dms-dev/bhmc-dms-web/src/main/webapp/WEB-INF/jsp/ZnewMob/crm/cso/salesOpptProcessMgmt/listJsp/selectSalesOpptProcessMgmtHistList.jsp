<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

               <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="crm.lbl.leadStatusExchange" /> <!-- 회전기록 流转记录--></h2>
                    <div class="title_btn">
                         <span class="co_open co_close" id="leadStatusExchangeListBtn"><span></span></span>
                    </div>
                </div>
                <div class="co_view" style="display:none">
                    <div class="listarea01">
                        <div class="deleteitem listhead">
                            <span style="width:50%"><spring:message code='global.lbl.dateTime' /><!-- 일시 --></span>
                            <span style="width:50%"><spring:message code='crm.lbl.leadStat' /><!-- 리드상태 --></span>
                            <span class="clboth" style="width:50%"><spring:message code='crm.lbl.prsNm' /><!-- 담당자 --></span>
                            <span style="width:50%"><spring:message code='global.lbl.handler' /><!-- 조작인 --></span>
                            <span class="clboth" style="width:50%"><spring:message code='global.lbl.message' /><!-- 메세지 --></span>
                        </div>
                        <div id="subListView3" style="height:300px; overflow:scroll;"></div>
                        <div class="deleteitem" style="display:none;" id="leadStatusExchangeList_noData"><span></span></div>
                    </div>
                </div>
            </div>
<script type="text/x-kendo-template" id="subTemplate3">
<div class="deleteitem">
    <span style="width:50%">#:chgDateFormat(regDtFormat)#</span>
    <span style="width:50%">#:trimNull(leadStatCont)#</span>
    <span class="clboth" style="width:50%">#:trimNull(mngScNm)#</span>
    <span style="width:50%">#:trimNull(regUsrNm) #</span>
    <span class="clboth" id="#:id #" style="width:100%">#:trimNull(sysMesgCont) #</span>
</div>
</script>

<script>
var subListData3 = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtHist.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                var seq = "";
                var parentUrl = parent.document.location.href;
                if(parentUrl.indexOf("selectEditSalesOpptProcessPopup") > -1){
                    seq = parent.$("#seq").val();
                }else{
                    seq = parent.$("#seq").val();
                }
               if ( dms.string.isEmpty(seq) ) {
                    mob.notification.warning("<spring:message code='global.lbl.saleOppt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                    return false;
                };
                params["sSaleOpptSeq"]           = seq;
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
                ,regUsrNm:{type:"string", editable:false}
                ,regDt:{type:"date", editable:false}
                ,regDtFormat:{type:"date", editable:false}
            }
        },parse:function(d) {
            if(d.data){
                $.each(d.data, function(idx, elem) {
                    elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateTimeFormat' />");
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
                parent.setSubListHeight();
                for(var i=0; i<e.items.length; i++){
                    $("#"+e.items[i].id).html($("#"+e.items[i].id).text());
                }
            }else{
                parent.setSubListHeightNew("leadStatusExchangeList",3,0);
            }
        }, 200);
        //app.hideLoading();
        //checklistCnt("leadStatusExchangeList_noData",e.items.length,noDatamsg);
    }
    ,error:function(e){
        parent.mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
        //app.hideLoading();
  }
});
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
    $("#leadStatusExchangeListBtn").click(function(){
        if($(this).attr("class") == "co_open"){
            subListData3.read();
        }
    });
});

</script>

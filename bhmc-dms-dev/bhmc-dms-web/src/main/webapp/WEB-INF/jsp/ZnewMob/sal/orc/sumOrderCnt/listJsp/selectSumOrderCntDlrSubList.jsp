<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<div class="co_group">
    <div class="content_title">
        <h2><spring:message code="global.lbl.dtlInfo" /><!-- 상세정보 --></h2>
        <div class="title_btn"><span class="co_open co_close" id="detailListBtn"><span></span></span></div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="listarea01">
            <div class="dlistitem listhead">
                <%-- <span style="width:33%"><spring:message code='global.lbl.chrgDt' /><!-- 주문일자 --></span> --%>
                <span style="width:33%"><spring:message code='sal.lbl.ordStat' /><!-- 오더상태 --></span>
                <%-- <span style="width:33%"><spring:message code='global.lbl.ordNo' /><!-- 오더번호 --></span> --%>
                <span style="width:34%"><spring:message code='sal.lbl.ordSetDt' /><!-- 오더배정일 --></span>
                <span style="width:33%"><spring:message code='global.lbl.vinDt' /><!-- VIN배정일자 --></span>
                <span style="width:33%"><spring:message code='sal.lbl.factoryPltGidt' /><!-- 공장출고일자 --></span>
                <span style="width:34%"><spring:message code='sal.lbl.grDts' /><!-- 입고일자  --></span>
                <span style="width:33%"><spring:message code='sal.lbl.saleDt' /><!-- 소매일자 --></span>
                <span style="width:100%"><spring:message code='ser.lbl.vinNo' /><!-- VIN  --></span>
            </div>
            <div>
                <div id="subListView" style="height: 300px; overflow: scroll;"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/x-kendo-template" id="subTemplate">
    <div class="dlistitem bgNone">
        <span style="width:33%">#:chgOrdStatCdObj(ordStatCd) #</span>
        <span style="width:34%">#:chgDate2Str(pdiDt) #</span>
        <span style="width:33%">#:chgDate2Str(vinDt) #</span>
        <span style="width:33%" class="clboth">#:chgDate2Str(retailDt) #</span>
        <span style="width:34%">#:chgDate2Str(dlrGrDt) #</span>
        <span style="width:33%">#:chgDate2Str(custSaleDt) #</span>
        <span style="width:100%" class="clboth">#:trimNull(vinNo) #</span>
    </div>
</script>

<script>
var subListData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/sal/orc/sumOrderCnt/selectSumOrderCntDlrSubs.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["sDlrCd"] = parent.$("#dlrCd").val();
                params["sOrdYyMmDt"] = parent.$("#ordYyMmDt").val();
                params["sOrdPrid"] = parent._ordPrid;
                params["sOrdsTp"] = parent._ordsTp;
                params["sCarlineCd"] = parent.$("#carlineCd").val();
                params["sModelCd"] = parent.$("#modelCd").val();
                params["sOcnCd"] = parent.$("#ocnCd").val();
                params["sExtColorCd"] = parent.$("#extColorCd").val();
                params["sIntColorCd"] = parent.$("#intColorCd").val();
                return kendo.stringify(params);
            }
        }
    }
    ,batch:true
    //,pageSize:pageSize
    ,schema:{
        data:"data"
        ,total:"total"
        ,model:{
            id:"seq"
             ,fields:{
                rnum:{type:"number"}
            }
        }
    }
    ,change :function(e){
    }
    ,error:function(e){
        console.log(e);
    }
});
chgOrdTpObj = function(val){
    var returnVal;

    if (val !== null ){
        returnVal = parent.ordTpObj[val];
    }else{
        returnVal = '';
    }
    return returnVal;
}
chgOrdStatCdObj = function(val){
    var returnVal;

    if (val !== null ){
        returnVal = parent.ordStatCdObj[val];
    }else{
        returnVal = '';
    }
    return returnVal;
}
$(document).ready(function() {
    $("#subListView").kendoListView({
        dataSource:subListData
        ,template: kendo.template($("#subTemplate").html())
        ,autoBind: false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#subListView").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#subListView").css({"background-image":"none"});
            }
        }
    });
})
</script>

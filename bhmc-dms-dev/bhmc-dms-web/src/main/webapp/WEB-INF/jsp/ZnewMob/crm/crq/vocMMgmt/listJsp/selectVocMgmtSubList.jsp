<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="co_group">
    <div class="content_title" id="carHistTitle">
        <h2><spring:message code="global.title.active" /><!-- 활동 --></h2>
        <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
    </div>
    <div class="co_view" style="display:none;">
        <div class="subListarea">
            <div class="listhead dlistitem">
                <span style="width:30%"><spring:message code="global.lbl.customer" /><!-- 고객 --></span>
                <span style="width:40%"><spring:message code="crm.lbl.pconCustInfo" /><!-- 연계인 --></span>
                <span style="width:30%"><spring:message code="global.lbl.statNm" /><!-- 상태 --></span>
                <span class="clboth" style="width:30%"><spring:message code="global.lbl.type" /><!-- 유형 --></span>
                <span style="width:70%"><spring:message code="crm.lbl.activeTpSubCd" /><!-- 자 유형 --></span>
                <span class="clboth" style="width:30%"><spring:message code="crm.lblvocRregUsrId" /><!-- 작성인 --></span>
                <span style="width:70%"><spring:message code="crm.lbl.regDt" /><!-- 작성시간 --></span>
                <span class="clboth" style="width:100%"><spring:message code="crm.lbl.vocActiveCont" />/<spring:message code="crm.lbl.activeRsltCont" /><!-- 실행 내용/실행 결과--></span>
            </div>
            <div>
                <div id="subListView" style="height:300px; overflow:scroll;"></div>
            </div>
        </div>
    </div>
</div>


<script type="text/x-kendo-template" id="subTemplate">
<div class="dlistitem bgNone">
    <span style="width:30%">#:trimNull(custNm) #</span>
    <span style="width:40%">#:trimNull(pconCustNm) #</span>
    <span style="width:30%">#:activeStatCdListVal(activeStatCd) #</span>
    <span class="clboth" style="width:30%">#:activeTpCdListVal(activeTpCd) #</span>
    <span style="width:70%">#:activeTpSubCdListVal(activeTpSubCd) #</span>
    <span class="clboth" style="width:30%">#:trimNull(regUsrId) #</span>
    <span style="width:70%">#:trimNull((regDt)) #</span>
    <span class="clboth" style="width:100%">#:trimNull(activeCont) #/#:trimNull(activeRsltCont) #</span>
</div>
</script>

<script type="text/javascript">

var subListData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/mob/crm/crq/vocMgmt/selectActives.do' />"
            ,type:"POST"
            ,dataType:"json"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation){
            params = {};
            params["sDlrCd"]       = $("#sDlrCd").val();
            params["sVocNo"]       = $("#sVocNo").val();
            return kendo.stringify(params);
        }
    }
    ,batch:true
    ,schema:{
        data:"data"
        ,total:"total"
        ,model:{
            id:"seq"
            ,field:{
                rnum:{type:"number"}
            }
        }
    }
    ,error:function(e){
        mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

activeStatCdListVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = activeStatCdMap[val];
    }
    return returnVal;
};

activeTpCdListVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = activeTpCdMap[val];
    }
    return returnVal;
};

activeTpSubCdListVal = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = activeTpSubCdMap[val];
    }
    return returnVal;
};

$(document).ready(function(){
    $("#subListView").kendoListView({
        dataSource:subListData
        ,template:kendo.template($("#subTemplate").html())
        ,autoBind:false
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
});
</script>
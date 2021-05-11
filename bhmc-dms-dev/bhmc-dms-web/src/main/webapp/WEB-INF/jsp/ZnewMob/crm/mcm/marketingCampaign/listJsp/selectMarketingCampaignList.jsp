<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title">
            <spring:message code="crm.title.campaign" />
            <!-- 캠페인 목록 -->
        </h2>
    </div>
    <div class="listarea01">
        <div class="listhead dlistitem">
            <span style="width: 100%"><spring:message code="global.lbl.crNm" /></span> <!-- 캠페인 명 -->
            <span style="width: 40%"><spring:message code="global.lbl.hostCd" /></span> <!-- 주최 -->
            <span style="width: 40%"><spring:message code="global.lbl.statNm" /></span> <!-- 상태 -->
            <span style="width: 20%"><spring:message code="crm.lbl.blueMemMthCd" /></span> <!-- 유형 -->
            <span class="clboth" style="width: 40%"><spring:message code="crm.lbl.startDt" /></span> <!-- 시작일 -->
            <span style="width: 60%"><spring:message code="crm.lbl.endDt" /></span> <!-- 종료일 -->
        </div>
        <div>
            <div id="listView" style="height:300px; overflow:scroll;"></div>
        </div>
    </div>
</section>

<script type="text/x-kendo-template" id="template">
<div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
    <span style="width:100%">#:makNm #</span>
    <span class="clboth" style="width:40%">#:trimNull(hostNm)#</span>
    <span style="width:40%">#:fnChangeStat(statCd) #</span>
    <span style="width:20%">#:fnChangeMakTpCd(makTpCd) #</span>
    <span class="clboth" style="width:40%">#:chgDate2Str(startDt) #</span>
    <span style="width:60%">#:chgDate2Str(endDt) #</span>
</div>
</script>

<script type="text/javascript">
var viewRow = 10
var pageIndex = 0;
var pageSize = viewRow;
var rowTotal = 0;
var tempData = [];

var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/mob/crm/mcm/marketingCampaign/selectMarketingCampaigns.do' />"
            ,type:"POST"
            ,dataType:"json"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation){
            var params = {};
            params["firstIndex"] = pageIndex;
            params["lastIndex"] = pageSize;

            params["sMakNm"] = $("#sMakNm").val();
            params["sMakCd"]      = $("#sMakCd2").val();
            params["sHostCd"] = $("#sHostCd").val();
            params["sMakTpCd"] = $("#sMakTpCd").val();
            params["sMakSubTpCd"] = $("#sMakSubTpCd").val();
            params["sStatCd"] = $("#sStatCd").val();
            params["sStartDt"] = new Date($("#sStartDt").val());
            params["sEndDt"] = new Date($("#sEndDt").val());

            return kendo.stringify(params);
        }
    }
    ,batch:true
    ,pageSize:pageSize
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
    ,change:function(e){
        rowTotal=this._total;
        if(rowTotal==0){
            tempData=[];
            listData._view=tempData;
        }else{
            tempData.push.apply(tempData, this._data);
            listData._view=tempData;
        }
        $("#content_search, #content_detail").hide();
        $("#content_list").show();
        $("#content_title span").attr("class", "search_open");
    }
    ,error:function(e){
        mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
    }
});

fnChangehostTeamCd = function(val){
    var returnVal = "";

    if(val != null && val != ""){
        returnVal = hostTeamList[val];
    }

    return returnVal;
};

fnChangeStat = function(val){
    var returnVal = "";

    if(val != null && val != ""){
        returnVal = statCdObj[val];
    }

    return returnVal;
};

fnChangeMakTpCd = function(val) {
    var returnVal = "";

    if(val != null && val != ""){
        returnVal = makTpCdObj[val];
    }

    return returnVal;
}

// 리스트  클릭
listViewClick = function(dataItem) {
    $("#content_search, #content_list").hide();
    $("#content_detail").show();
    $("#content_title span").removeAttr("class");
    if(dataItem!=null){
        fnContentDetail(dataItem.makCd, dataItem.signDocId, dataItem.apprDocNo);
    }
}

</script>
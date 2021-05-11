<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code="crm.title.vocProc" /></h2>
    </div>
    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:70%"><spring:message code="global.lbl.vocNo" /><!-- VOC 번호 --></span>
            <span style="width:30%"><spring:message code="crm.lbl.blueMemMthCd" /><!-- 유형 --></span>
            <span class="clboth" style="width:30%"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></span>
            <span style="width:40%"><spring:message code="global.lbl.telNumer" /><!-- 연락처 --></span>
            <span style="width:30%"><spring:message code="global.lbl.vocStatCd" /><!-- 진행상태 --></span>
            <span class="clboth" style="width:30%"><spring:message code="crm.lbl.procDt" /><!-- 처리기간 --></span>
            <span style="width:40%"><spring:message code="crm.lbl.mainDeptNm" /><!-- 담당부서 --></span>
            <span style="width:30%"><spring:message code="crm.lbl.prsn" /><!-- 담당자 --></span>
        </div>
        <div>
            <div id="listView" style="height:300px; overflow:scroll;"></div>
        </div>
    </div>
</section>

<script type="text/x-kendo-template" id="template">
<div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
    <span style="width:70%">#:trimNull(vocNo) #</span>
    <span style="width:30%">#:trimNull(vocTpCdNm) #</span>
    <span class="clboth" style="width:30%">#:trimNull(custNm) #</span>
    <span style="width:40%">#:trimNull(custPrefCommNo) #</span>
    <span style="width:30%">#:trimNull(vocStatCdNm) #</span>
    <span class="clboth" style="width:30%">#:chgDate2Str(procDt) #</span>
    <span style="width:40%">#:trimNull(pprocDeptNm) #</span>
    <span style="width:30%">#:trimNull(pprocNm) #</span>
</div>
</script>

<script type="text/javascript">
var viewRow=10;//한번에 조회할 건수
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수

var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/mob/crm/crq/vocMgmt/selectVocMgmts.do' />"
            ,type:"POST"
            ,dataType:"json"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            var params = {};
            params["firstIndex"] = pageIndex;
            params["lastIndex"] = pageSize;
            params["sRegStartDt"] = new Date($("#sRegStartDt").val());
            params["sRegEndDt"] = new Date($("#sRegEndDt").val());
            params["sVocTpCd"] = $("#sVocTpCd").val();
            params["sVocStatCd"] = $("#sVocStatCd").val();
            params["sCmplCauCd"] = $("#sCmplCauCd").val();
            params["sCust"] = $("#sCust").val();
            params["sMngScId"]= $("#sMngScId").val();
            params["sPprocIdNm"]= $("#sPprocIdNm").val();
            params["sBhmcYn"]= $("#sBhmcYn").val();
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
            ,fields:{
                rnum:{type:"number"}
            }
        }
    }
    ,change:function(e){
        rowTotal=this._total;
        if(rowTotal == 0){
            tempData=[];
            listData._view=tempData;
        }else{
            tempData.push.apply(tempData, this._data);
            listData._view=tempData;
        }
        $("#content_search, #content_detail").hide();
        $("#content_list").show();
        $("#header_title span").attr("class", "search_open");
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
};

listViewClick = function(dataItem) {
    $("#content_list, #content_search").hide();
    $("#content_detail").show();
    $("#content_title span").removeAttr("class");
    if(dataItem!=null){
        fnContentDetail(dataItem);
    }
};
</script>
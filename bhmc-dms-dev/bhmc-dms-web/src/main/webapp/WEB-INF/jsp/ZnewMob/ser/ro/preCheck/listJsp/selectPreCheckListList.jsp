<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code="ser.menu.preCheckList" /></h2>
    </div>
    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:50%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.vinNo" /><!-- vinNo --></span>
            <span style="width:50%"><spring:message code="ser.lbl.preInsNo" /><!-- 입고점검번호 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.preChkNm" /><!-- 사전점검자 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.preCheckTp" /><!-- 입고점검유형 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.preChkStatus" /><!-- 사전점검상태 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.preInsDt" /><!-- 사전점검시간 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.carlineNm" /><!-- 차종명 --></span>
        </div>
        <div>
            <div id="listView" style="height: 300px; overflow: scroll;"></div>
        </div>
    </div>
</section>
<script type="text/x-kendo-template" id="template">
<div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
    <span style="width:50%; display:none;">#:rnum #</span>
    <span style="width:50%">#:trimNull(carRegNo) #</span>
    <span style="width:50%">#:trimNull(vinNo) #</span>
    <span style="width:50%">#:trimNull(diagDocNo) #</span>
    <span style="width:50%">#:trimNull(regUsrNm) #</span>
    <span style="width:50%">#:setCarAcptTpMap(carAcptTp) #</span>
    <span style="width:50%">#:setDiagStatCdMap(diagStatCd) #</span>
    <span style="width:50%">#:trimNull(chgDate2DateTimeStr(preChkDt)) #</span>
    <span style="width:50%">#:trimNull(carlineNm) #</span>
</div>
</script>
<script>
var viewRow=10;//한번에 조회할 건수
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수

var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/ser/ro/preCheck/selectPreCheckListMains.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["firstIndex"] = pageIndex;
                params["lastIndex"] = pageSize;

                params["sFromDt"]       = chgDate(parent.$("#sFromDt").val());
                params["sToDt"]         = chgDate(parent.$("#sToDt").val());
                params["sFromEndDt"]    = chgDate(parent.$("#sFromEndDt").val());
                params["sToEndDt"]      = chgDate(parent.$("#sToEndDt").val());
                params["sCarRegNo"]     = parent.$("#sCarRegNo").val();
                params["sDriverNm"]     = parent.$("#sDriverNm").val();
                params["sRegUsrNm"]     = parent.$("#sRegUsrNm").val();
                params["sCarOwnerNm"]   = parent.$("#sCarOwnerNm").val();
                params["sCarAcptTp"]    = parent.$("#sCarAcptTp").data("kendoExtDropDownList").value();
                params["sVinNo"]        = parent.$("#sVinNo").val();
                params["sDiagDocNo"]    = parent.$("#sDiagDocNo").val();
                params["sDiagStatCd"]   = parent.$("#sDiagStatCd").data("kendoExtDropDownList").value();
                params["sCarlineCd"]   = parent.$("#sCarlineCd").data("kendoExtDropDownList").value();
                return kendo.stringify(params);
            }
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
    ,change :function(e){
        rowTotal=this._total;
        if(rowTotal == 0){
            tempData=[];
            listData._view=tempData;
        }else{
            tempData.push.apply(tempData, this._data);
            listData._view=tempData;
        }
        $("#totalSum").text(rowTotal);
        $("#content_search, #content_detail").hide();
        $("#content_list").show();
        $("#header_title span").attr("class","search_open");
    }
    ,error:function(e){
        console.log(e);
    }
});
function listViewClick(dataItem){
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");
    $("#header_title span").removeAttr("class");

    if(dataItem != null){
        setDetailData(dataItem,".setDetailData input[id]");
        $("#runDistVal").val(commaZero(dataItem.runDistVal));
        $("#carRunDistVal").val(commaZero(dataItem.carRunDistVal));
        $("#runDistVal2").val(commaZero(dataItem.runDistVal));
        $("#carAcptTp").val(setCarAcptTpMap($("#carAcptTp").val()));
        $("#diagStatCd").val(setDiagStatCdMap($("#diagStatCd").val()));
        $("#carRunDistVal").val(commaZero(dataItem.carRunDistVal));

        $("#preChkDt").val(chgDate2DateTimeStr(dataItem.preChkDt));
        $("#updtDt").val(chgDate2DateTimeStr(dataItem.updtDt));
        $("#preChkCancDt").val(chgDate2DateTimeStr(dataItem.preChkCancDt));
        $(".co_view").css("display","none");
        $(".title_btn span").attr("class", "co_open co_close");
    }
}
//입고점검유형
setCarAcptTpMap = function(val){
    var resultVal = "";
    if( dms.string.isNotEmpty(val)){
        if(parent.carAcptTpMap[val] != undefined)
        resultVal = parent.carAcptTpMap[val].cmmCdNm;
    }
    return resultVal;
};

//사전점검상태
setDiagStatCdMap = function(val){
    var resultVal = "";
    if( dms.string.isNotEmpty(val)){
        if(parent.diagStatCdMap[val] != undefined)
        resultVal = parent.diagStatCdMap[val].cmmCdNm;
    }
    return resultVal;
};
</script>


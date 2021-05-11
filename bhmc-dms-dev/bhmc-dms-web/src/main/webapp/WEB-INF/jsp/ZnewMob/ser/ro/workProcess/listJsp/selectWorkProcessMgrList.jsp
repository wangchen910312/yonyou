<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code="ser.menu.wkProcMng" /><!-- 정비진도관리 --></h2>
    </div>
   <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:50%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.vinNo" /><!-- VIN --></span>
            <span style="width:50%"><spring:message code="par.lbl.invRoDocNo" /><!-- 정비위탁번호 --></span>
            <span style="width:50%"><spring:message code="par.lbl.parGiMan" /><!-- 정비위탁자 --></span>
            <span style="width:50%"><spring:message code="par.lbl.invResvWorkType" /><!-- 정비위탁유형 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.processWorkStat" /><!-- 정비진도상태 --></span>
            <span style="width:50%"><spring:message code="par.lbl.invResvWorkTime" /><!-- 정비위탁시간 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.expcDlvDt" /><!-- 예상인도시간 --></span>
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
    <span style="width:50%">#:trimNull(roDocNo) #</span>
    <span style="width:50%">#:trimNull(driverNm) #</span>
    <span style="width:50%">#:trimNull(roTpNm) #</span>
    <span style="width:50%">#:progressStatGrid(wrkStatCd) #</span>
    <span style="width:50%">#:chgDate2DateTimeStr(roDt) #</span>
    <span style="width:50%">#:chgDate2DateTimeStr(expcDlDt) #</span>
</div>
</script>

<script>
//순서에 맞게 넣고 , s는 보이는 것 h는 안보이는 것
var keyMapArr=[
               {temp:"s",key:"carRegNo",txt:"<spring:message code='ser.lbl.carNo' />",type:""}, //차량번호
               {temp:"s",key:"vinNo",txt:"<spring:message code='ser.lbl.vinNo' />",type:""},
               {temp:"s",key:"carOwnerNm",txt:"<spring:message code='ser.lbl.carOwner' />",type:""},
               {temp:"s",key:"driverNm",txt:"<spring:message code='ser.lbl.vsitr' />",type:""},
               {temp:"s",key:"carlineNm",txt:"<spring:message code='ser.lbl.carlineNm' />",type:""},
               {temp:"s",key:"modelNm",txt:"<spring:message code='par.lbl.modelNm' />",type:""},

               {temp:"h",key:"runDistVal",txt:"<spring:message code='ser.lbl.nowRunDist' />",type:""},
               {temp:"h",key:"lastRunDistVal",txt:"<spring:message code='ser.lbl.totRunDistVal' />",type:""},
               {temp:"h",key:"roStatNm",txt:"<spring:message code='ser.lbl.processWorkStat' />",type:""},
               {temp:"h",key:"roDocNo",txt:"<spring:message code='par.lbl.invRoDocNo' />",type:""},
               {temp:"h",key:"roTpNm",txt:"<spring:message code='par.lbl.invResvWorkType' />",type:""},
               {temp:"h",key:"roDt",txt:"<spring:message code='par.lbl.invResvWorkTime' />",type:""},
               {temp:"h",key:"regUsrNm",txt:"<spring:message code='ser.lbl.roManNm' />",type:""},//정비위탁자와 방문자가 같다!
               {temp:"h",key:"expcDlDt",txt:"<spring:message code='ser.lbl.expcDlvDt' />",type:""},
               /* {temp:"h",key:"wrkStatNm",txt:"<spring:message code='ser.lbl.processWorkStat' />",type:""}, */
               /* {temp:"h",key:"runDistVal",txt:"<spring:message code='ser.lbl.nowRunDist' />",type:""}, */
               {temp:"h",key:"atqProcTp",txt:"<spring:message code='ser.lbl.OldItemHandTp' />",type:""},

               /* {temp:"h",key:"atqProcTp",txt:"<spring:message code='global.lbl.OldItemHandTp' />",type:""}, */
               {temp:"h",key:"carWashTp",txt:"<spring:message code='ser.menu.carWashMng' />",type:""},
               {temp:"h",key:"custWaitMthCd",txt:"<spring:message code='ser.lbl.custStbyMth' />",type:""},
               {temp:"h",key:"qtTestMthCd",txt:"<spring:message code='ser.lbl.qtTest' />",type:""},
               {temp:"h",key:"goodwillYn",txt:"<spring:message code='ser.lbl.goodWillYn' />",type:""},
               {temp:"h",key:"carDriveReqTp",txt:"<spring:message code='global.lbl.tdrvReq' />",type:""},
               {temp:"h",key:"chgExpcDlDt",txt:"<spring:message code='ser.lbl.chgExpcDlDt' />",type:""}

               ];

var viewRow=10;//한번에 조회할 건수
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수

var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/ser/ro/repairOrder/selectRepairOrders.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["firstIndex"] = pageIndex;
                params["lastIndex"] = pageSize;

                params["sWrkStatCd"] = $("#sWrkStatCd").data("kendoExtDropDownList").value();
                params["sRoTp"] = $("#sRoTp").data("kendoExtDropDownList").value();
                params["sVinNo"] = $("#sVinNo").val();
                params["sSaNm"] = $("#sSaNm").val();
                params["sCarRegNo"] = $("#sCarRegNo").val();
                params["sRoDocNo"] = $("#sRoDocNo").val();
                params["sRoFromDt"] = chgDate($("#sRoFromDt").val());
                params["sRoToDt"] = chgDate($("#sRoToDt").val());
                params["sExpcDlFromDt"] = chgDate($("#sExpcDlFromDt").val());
                params["sExpcDlToDt"] = chgDate($("#sExpcDlToDt").val());
                params["sListType"] = "WRK";
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
        makeDetailHtml(listData._data, keyMapArr, "#defaultHtml", "#hiddenHtml");
    }
    ,error:function(e){
        console.log(e);
    }
});
function listViewClick(dataItem){
    $("#content_list").css("display", "none");
    $("#content_search").css("display", "none");
    $("#content_detail").css("display", "block");
    $("#header_title span").removeAttr("class");

    $("#rpipStart").prop("disabled", true).addClass("disabled");
    $("#rpipComplete").prop("disabled", true).addClass("disabled");
    $("#rpipCancel").prop("disabled", true).addClass("disabled");

    setDetailData3(keyMapArr,dataItem,"#defaultHtml input[id]");//보이는 것
    setDetailData3(keyMapArr,dataItem,"#hiddenHtml input[id]");// 안보이는 것

    if(dms.string.strNvl(dataItem.atqProcTp) !="")$("#atqProcTp").val(atqProcTpCdMap[dataItem.atqProcTp].cmmCdNm);
    if(dms.string.strNvl(dataItem.carWashTp) !="")$("#carWashTp").val(carWashTpCdMap[dataItem.carWashTp].cmmCdNm);
    if(dms.string.strNvl(dataItem.custWaitMthCd) !="")$("#custWaitMthCd").val(custWaitMthCdMap[dataItem.custWaitMthCd].cmmCdNm);
    if(dms.string.strNvl(dataItem.qtTestMthCd) !="")$("#qtTestMthCd").val(qtTestMap[dataItem.qtTestMthCd].cmmCdNm);
    if(dms.string.strNvl(dataItem.goodwillYn) !="")$("#goodwillYn").val(yesMap[dataItem.goodwillYn]);
    if(dms.string.strNvl(dataItem.carDriveReqTp) !="")$("#carDriveReqTp").val(carDriveReqTpCdMap[dataItem.carDriveReqTp].cmmCdNm);
    if(dms.string.strNvl(dataItem.chgExpcDlDt) !="")$("#chgExpcDlDt").val(dataItem.chgExpcDlDt);
    if(dms.string.strNvl(dataItem.expcDlDt) !="")$("#expcDlDt").val(chgDate2DateTimeStr(dataItem.expcDlDt));
    if(dms.string.strNvl(dataItem.runDistVal) !="")$("#runDistVal").val(commaZero(dataItem.runDistVal));
    if(dms.string.strNvl(dataItem.lastRunDistVal) !="")$("#lastRunDistVal").val(commaZero(dataItem.lastRunDistVal));
    if(dms.string.strNvl(dataItem.roDt) !="")$("#roDt").val(chgDate2DateTimeStr(dataItem.roDt));
    if(dms.string.strNvl(dataItem.chgExpcDlDt) !="")$("#chgExpcDlDt").val(chgDate2DateTimeStr(dataItem.chgExpcDlDt));

    if (dataItem.roDocNo != null && dataItem.roDocNo != 'undefined') {
        // 정비내역 리스트 조회
        subListData.read();
    }
}
//수리진도
fnChangeRoStatCd = function(val){
 var returnVal = "";
 if(val != null && val != ""){
     if(roStatCdMap[val] != null){
         returnVal = roStatCdMap[val].cmmCdNm;
     }else{
         returnVal = "";
     }
 }
 return returnVal;
};
//수리상태
fnChangeRoTp = function(val){
 var returnVal = "";
 if(val != null && val != ""){
     returnVal = roTpCdMap[val].cmmCdNm;
 }
 return returnVal;
};
paintStatGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(paintStatMap[val] != undefined)
        returnVal = paintStatMap[val].cmmCdNm;
    }
    return returnVal;
}
//진행상태
progressStatGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(progressStatMap[val] != undefined)
        returnVal = progressStatMap[val].cmmCdNm;
    }
    return returnVal;
}
</script>
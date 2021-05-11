<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code="ser.menu.wkProcStat" /><!-- 정비진도관리 --></h2>
    </div>
    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:50%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.vinNo" /><!-- VIN --></span>
            <span style="width:50%"><spring:message code="par.lbl.invRoDocNo" /><!-- 정비위탁번호 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.roManNm" /><!-- 정비위탁자 --></span>
            <span style="width:50%"><spring:message code="par.lbl.invResvWorkType" /><!-- 정비위탁유형 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.repairSerStat" /><!-- 수리서비스상태 --></span>
            <span style="width:50%"><spring:message code="par.lbl.invResvWorkTime" /><!-- 정비위탁시간 --></span>
            <span style="width:50%"><spring:message code="par.lbl.expTime" /><!-- 예상인도시간 --></span>
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
    <span style="width:50%">#:trimNull(regUsrNm) #</span>
    <span style="width:50%">#:trimNull(roTpNm) #</span>
    <span style="width:50%">#:trimNull(wrkStatNm) #</span>
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

               {temp:"h",key:"runDistVal",txt:"<spring:message code='ser.lbl.nowRunDist' />",type:"strDist"},
               {temp:"h",key:"lastRunDistVal",txt:"<spring:message code='ser.lbl.totRunDistVal' />",type:"strDist"},
               {temp:"h",key:"roStatNm",txt:"<spring:message code='par.lbl.parGiStatCd' />",type:""},
               {temp:"h",key:"roDocNo",txt:"<spring:message code='par.lbl.invRoDocNo' />",type:""},
               {temp:"h",key:"roTpNm",txt:"<spring:message code='par.lbl.invResvWorkType' />",type:""},
               {temp:"h",key:"regUsrNm",txt:"<spring:message code='ser.lbl.roManNm' />",type:""},
               {temp:"h",key:"roDt",txt:"<spring:message code='par.lbl.invResvWorkTime' />",type:"strDate"},
               {temp:"h",key:"expcDlDt",txt:"<spring:message code='ser.lbl.expcDlvDt' />",type:"strDate"},
               {temp:"h",key:"roRemark",txt:"<spring:message code='ser.lbl.roRemark' />",type:""},
               {temp:"h",key:"wrkStatNm",txt:"<spring:message code='ser.lbl.repairSerStat' />",type:""},//수리서비스상태

               {temp:"h",key:"allocStatNm",txt:"<spring:message code='ser.lbl.assignStat' />",type:""},
               {temp:"h",key:"qtTestMthNm",txt:"<spring:message code='ser.lbl.qtTestStat' />",type:""},
               {temp:"h",key:"dlStatNm",txt:"<spring:message code='ser.lbl.dlvChkStatus' />",type:""},

               {temp:"h",key:"atqProcTp",txt:"<spring:message code='ser.lbl.OldItemHandTp' />",type:""},
               {temp:"h",key:"carWashTp",txt:"<spring:message code='ser.menu.carWashMng' />",type:""},
               {temp:"h",key:"custWaitMthCd",txt:"<spring:message code='ser.lbl.custStbyMth' />",type:""},
               {temp:"h",key:"goodwillYn",txt:"<spring:message code='ser.lbl.goodWillYn' />",type:""},
               {temp:"h",key:"carDriveReqTp",txt:"<spring:message code='global.lbl.tdrvReq' />",type:""},
               {temp:"h",key:"chgExpcDlDt",txt:"<spring:message code='ser.lbl.chgExpcDlDt' />",type:"strDate"}
               ];











var viewRow=10;//한번에 조회할 건수
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수

var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/ser/ro/repairOrder/selectRepairOrderInfoList.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["firstIndex"] = pageIndex;
                params["lastIndex"] = pageSize;

                params["sCarRegNo"]     = $("#sCarRegNo").val();
                params["sVinNo"]        = $("#sVinNo").val();
                params["sCarOwnerNm"]   = $("#sCarOwnerNm").val();
                params["sExpcDlFromDt"] = chgDate($("#sExpcDlFromDt").val());
                params["sExpcDlToDt"]   = chgDate($("#sExpcDlToDt").val());
                params["sRoDocNo"]      = $("#sRoDocNo").val();
                params["sRoTp"]         = $("#sRoTp").val();
                params["sRegUsrNm"]     = $("#sRegUsrNm").val();
                params["sRoFromDt"]     = chgDate($("#sRoFromDt").val());
                params["sRoToDt"]       = chgDate($("#sRoToDt").val());
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
//수리진도
changeRoStatCd = function(val){
 var returnVal = "";
 if(val != null && val != ""){
     if(roStatCdMap[val] != undefined)
         returnVal = roStatCdMap[val].cmmCdNm;
 }
 return returnVal;
};

//수리상태
changeWrkStatCd = function(val){
 var returnVal = "";
 if(val != null && val != ""){
     if(rpirStatMap[val] != undefined)
         returnVal = rpirStatMap[val].cmmCdNm;
 }
 return returnVal;
};

// 품질검사상태
changeQtTestStatCd = function(val){
 var returnVal = "";
 if(val != null && val != ""){
     if(qtTestStatMap[val] != undefined)
         returnVal = qtTestStatMap[val].cmmCdNm;
 }
 return returnVal;
};

// 세차상태
changeCarWashStatCd = function(val){
 var returnVal = "";
 if(val != null && val != ""){
     if(carWashStatMap[val] != undefined)
         returnVal = carWashStatMap[val].cmmCdNm;
 }
 return returnVal;
};


function listViewClick(dataItem){
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    setTimeout(function(){ $("#content_detail").css("display","block")}, 10);
    $("#header_title span").removeAttr("class");

    setDetailData3(keyMapArr,dataItem,"#defaultHtml input[id]");//보이는 것
    setDetailData3(keyMapArr,dataItem,"#hiddenHtml input[id]");// 안보이는 것

    $(".co_view").css("display","none");
    $(".title_btn span").attr("class", "co_open co_close");

    if(dms.string.strNvl(dataItem.atqProcTp) !="")$("#atqProcTp").val(atqProcTpCdMap[dataItem.atqProcTp].cmmCdNm);
    if(dms.string.strNvl(dataItem.carWashTp) !="")$("#carWashTp").val(carWashTpCdMap[dataItem.carWashTp].cmmCdNm);
    if(dms.string.strNvl(dataItem.custWaitMthCd) !="")$("#custWaitMthCd").val(custWaitMthCdMap[dataItem.custWaitMthCd].cmmCdNm);
    if(dms.string.strNvl(dataItem.qtTestMthCd) !="")$("#qtTestMthCd").val(dataItem.qtTestMthCd);
    if(dms.string.strNvl(dataItem.goodwillYn) !="")$("#goodwillYn").val(yesMap[dataItem.goodwillYn]);
    if(dms.string.strNvl(dataItem.carDriveReqTp) !="")$("#carDriveReqTp").val(carDriveReqTpCdMap[dataItem.carDriveReqTp].cmmCdNm);
}

</script>
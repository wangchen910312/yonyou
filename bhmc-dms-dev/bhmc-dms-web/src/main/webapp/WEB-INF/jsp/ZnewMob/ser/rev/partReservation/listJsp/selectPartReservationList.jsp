<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code='ser.menu.partReserveStatus' /><!-- 부품예약현황 --></h2>
    </div>
    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:50%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.vinNo" /><!-- vinNo --></span>
            <span class="clboth" style="width:50%"><spring:message code="ser.lbl.partReserveNo" /><!-- 부품예약번호 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.partResveNm" /><!-- 부품예약자 --></span>
            <span class="clboth" style="width:50%"><spring:message code="ser.lbl.partResvTp" /><!-- 부품예약유형 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.partResvStat" /><!-- 부품예약상태 --></span>
            <span class="clboth" style="width:50%"><spring:message code="ser.lbl.preResvPartHm" /><!-- 부품예약시간 --></span>
            <span style="width:50%"><spring:message code='ser.lbl.preAmt' /><!-- 부품선수금 --></span>
        </div>
        <div>
            <div id="listView" style="height: 300px; overflow: scroll;"></div>
        </div>
    </div>
</section>
<script type="text/x-kendo-template" id="template">
    <div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
        <span style="width:50%; display:none;">#:rnum #</span>
        <span style="width:50%">#:carRegNo #</span>
        <span style="width:50%">#:trimNull(vinNo) #</span>
        <span class="clboth" style="width:50%">#:trimNull(parResvDocNo) #</span>
        <span style="width:50%">#:trimNull(regUsrNm) #</span>
        <span class="clboth" style="width:50%">#:changePartResvTpCdList(parResvTp) #</span>
        <span style="width:50%">#:trimNull(parResvStatNm) #</span>
        <span class="clboth" class="clboth" style="width:50%">#:trimNull(chgCustDateTime2Str2(regDt)) #</span>
        <span style="width:50%">#:trimNull(kendo.toString(preAmt,'n2')) #</span>
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
               {temp:"s",key:"runDistVal",txt:"<spring:message code='ser.lbl.nowRunDist' />",type:""},
               {temp:"h",key:"carRunDistVal",txt:"<spring:message code='ser.lbl.accuDrivDis' />",type:"strDist"},
               {temp:"h",key:"parResvStatNm",txt:"<spring:message code='ser.lbl.partResvStat' />",type:""},//부품예약상태
               {temp:"h",key:"parResvDocNo",txt:"<spring:message code='ser.lbl.partReserveNo' />",type:""},//부품예약번호
               {temp:"h",key:"parResvTp",txt:"<spring:message code='ser.lbl.partResvTp' />",type:""},//부품예약유형
               {temp:"h",key:"regDt",txt:"<spring:message code='ser.lbl.preResvPartHm' />",type:"strDate"},//부품예약시간
               {temp:"h",key:"regUsrNm",txt:"<spring:message code='ser.lbl.parRsrvRegistrant' />",type:""},//부품예약자?
               {temp:"h",key:"updtDt",txt:"<spring:message code='ser.lbl.parResvChgDt' />",type:"strDate"},//부품예약변경시간
               {temp:"h",key:"updtUsrNm",txt:"<spring:message code='ser.lbl.parRecvUpdtUsrNm' />",type:""},//예약변경자
               {temp:"h",key:"cancParResvDt",txt:"<spring:message code='ser.lbl.parResvCancTime' />",type:"strDate"},
               {temp:"h",key:"cancParUsrNm",txt:"<spring:message code='ser.lbl.parResvCancUsrNm' />",type:""},
               {temp:"h",key:"cancReasonNm",txt:"<spring:message code='ser.lbl.cancReasonCd' />",type:""},
               {temp:"h",key:"confirmParDt",txt:"<spring:message code='ser.lbl.parResvConfirmTime' />",type:"strDate"},
               {temp:"h",key:"confirmParUsrNm",txt:"<spring:message code='ser.lbl.parResvConfirmUsrNm' />",type:""},
               {temp:"h",key:"itemCdQty",txt:"<spring:message code='ser.lbl.parResvItem' />",type:""},//부품예약품목
               {temp:"h",key:"parAmt",txt:"<spring:message code='ser.lbl.preParSubAmt' />",type:"strAmt"},//예정부품대
               {temp:"h",key:"etcAmt",txt:"<spring:message code='ser.lbl.preEtcSubAmt' />",type:"strAmt"},//예상기타비소계
               {temp:"h",key:"sumAmt",txt:"<spring:message code='ser.lbl.prePartTotAmt' />",type:"strAmt"},//예상부품비합계
               {temp:"h",key:"preAmt",txt:"<spring:message code='ser.lbl.preAmt' />",type:"strAmt"},//부품선수금
               {temp:"h",key:"parResvRemark",txt:"<spring:message code='ser.lbl.partResvRemark' />",type:""},//부품예약비고
               {temp:"h",key:"reqQty",txt:"<spring:message code='ser.lbl.dsctScheduleQty' />",type:""},//부품예약수량
               {temp:"h",key:"arryAlrtDt",txt:"<spring:message code='ser.lbl.parResvAramTime' />",type:"strDate"}//부품예약알람시간
               ];

var viewRow=10;//한번에 조회할 건수
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수

var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/mob/ser/rev/partReservation/selectPartReservations.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["firstIndex"] = pageIndex;
                params["lastIndex"] = pageSize;

                params["sCarRegNo"]       = parent.$("#sCarRegNo").val();
                params["sPartNm"]     = parent.$("#sPartNm").val();
                params["sRegUsrNm"]       = parent.$("#sRegUsrNm").val();
                params["sVinNo"]          = parent.$("#sVinNo").val();
                params["sParResvDocNo"]   = parent.$("#sParResvDocNo").val();
                params["sParResvTp"]      = parent.$("#sParResvTp").data("kendoExtDropDownList").value();
                params["sParResvStartDt"] = chgDate(parent.$("#sParResvStartDt").val());
                params["sParResvEndDt"]   = chgDate(parent.$("#sParResvEndDt").val());
                params["sParResvStatCd"]  = parent.$("#sParResvStatCd").data("kendoExtDropDownList").value();
                params["sPreFixId"]       = parent.preFixId;
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

    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");
    $("#header_title span").removeAttr("class");
    if(dataItem != null){
        setDetailData3(keyMapArr,dataItem,"#defaultHtml input[id]");//보이는 것
        setDetailData3(keyMapArr,dataItem,"#hiddenHtml input[id]");// 안보이는 것
        $("#carRunDistVal").val(comma($("#carRunDistVal").val()));
        $(".co_view").css("display","none");
        $(".title_btn span").attr("class", "co_open co_close");
        $("#parResvTp").val(partResvTpCdMap[dataItem.parResvTp].cmmCdNm);
        _parResvDocNo=dataItem.parResvDocNo;
        subListData.read();
        subListData3.read();
        subListData4.read();
    }

}
changeResvStatCdList = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.resvStatCdMap[val].cmmCdNm;
    }
    return returnVal;
};

changePartResvTpCdList = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = parent.partResvTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

chgCustDateTime2Str2 = function(val) {
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = val.substring(0,16);
    }
    return returnVal;
}
</script>

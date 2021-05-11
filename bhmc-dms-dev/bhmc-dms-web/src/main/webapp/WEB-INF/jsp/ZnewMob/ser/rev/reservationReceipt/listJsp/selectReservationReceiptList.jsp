<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code="ser.menu.reserStatus" /><!-- 예약접수현황 --></h2>
    </div>
    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:50%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.vinNo" /><!-- vinNo --></span>
            <span style="width:50%"><spring:message code="ser.lbl.resvDocNo" /><!-- 수리예약번호 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.resvAcceptNm" /><!-- 예약접수자 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.resvChannel" /><!-- 예약채널 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.resvStat" /><!-- 예약상태 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.resvDt" /><!-- 예약시간 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.repairResvDt" /><!-- 예약서비스시간 --></span>
        </div>
        <div>
            <div id="listView" style="height: 300px; overflow: scroll;"></div>
        </div>
        <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
    </div>
</section>
<script type="text/x-kendo-template" id="template">
<div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
    <span style="width:50%; display:none;">#:rnum #</span>
    <span style="width:50%">#:trimNull(carRegNo) #</span>
    <span style="width:50%">#:trimNull(vinNo) #</span>
    <span class="clboth" style="width:50%">#:trimNull(resvDocNo) #</span>
    <span style="width:50%">#:trimNull(regUsrNm) #</span>
    <span class="clboth" style="width:50%">#:trimNull(changeResvTpCd(resvTp)) #</span>
    <span style="width:50%">#:trimNull(changeResvStatCd(resvStatCd)) #</span>
    <span class="clboth" class="clboth" style="width:50%">#:trimNull(chgDate2DateTimeStr(serResvStartDt)) #</span>
    <span style="width:50%">#:trimNull(chgDate2DateTimeStr(resvDt)) #</span>
</div>
</script>

<script>
//순서에 맞게 넣고 , s는 보이는 것 h는 안보이는 것
var keyMapArr=[
               {temp:"s",key:"carRegNo",txt:"<spring:message code='ser.lbl.carNo' />",type:""}, //차량번호
               {temp:"s",key:"vinNo",txt:"<spring:message code='ser.lbl.vinNo' />",type:""}, //VIN
               {temp:"s",key:"carOwnerNm",txt:"<spring:message code='ser.lbl.carOwner' />",type:""}, //차량소유자
               {temp:"s",key:"driverNm",txt:"<spring:message code='ser.lbl.vsitr' />",type:""}, //방문자
               {temp:"s",key:"carlineNm",txt:"<spring:message code='ser.lbl.carlineNm' />",type:""}, //차종명
               {temp:"s",key:"modelNm",txt:"<spring:message code='par.lbl.modelNm' />",type:""}, //차관명
               {temp:"s",key:"runDistVal",txt:"<spring:message code='ser.lbl.nowRunDist' />",type:""}, //실제주행거리
               {temp:"h",key:"carRunDistVal",txt:"<spring:message code='ser.lbl.accuDrivDis' />",type:"strDist"},//누계주행거리
               {temp:"h",key:"resvStatCd",txt:"<spring:message code='ser.lbl.resvStat' />",type:""},//예약상태
               {temp:"h",key:"resvDocNo",txt:"<spring:message code='ser.lbl.resvDocNo' />",type:""},//수리예약번호
               {temp:"h",key:"resvTp",txt:"<spring:message code='ser.lbl.resvChannel' />",type:""},//예약채널
               {temp:"h",key:"resvDt",txt:"<spring:message code='ser.lbl.repairResvDt' />",type:"strDate"},//수리예약시간
               {temp:"h",key:"regUsrNm",txt:"<spring:message code='ser.lbl.resvAcceptNm' />",type:""},//예약자?
               {temp:"h",key:"resvPrintDt",txt:"<spring:message code='ser.lbl.resvPrintDt' />",type:"strDate"},//예약프린트시간
               {temp:"h",key:"updtDt",txt:"<spring:message code='ser.lbl.resvUpdt' />",type:"strDate"},//예약변경시간
               {temp:"h",key:"updtUsrNm",txt:"<spring:message code='ser.lbl.resvChgUsrNm' />",type:""},//예약변경자
               {temp:"h",key:"cancResvDt",txt:"<spring:message code='ser.lbl.resvCancelDt' />",type:"strDate"},//예약취소시간
               {temp:"h",key:"cancUsrNm",txt:"<spring:message code='ser.lbl.resvCancelUsrId' />",type:""},//예약취소자
               {temp:"h",key:"cancReasonCont",txt:"<spring:message code='ser.lbl.cancReasonCd' />",type:""},//취소원인
               {temp:"h",key:"hopeResvDt",txt:"<spring:message code='ser.lbl.hopeResvDt' />",type:"strDate"},//예약희망일자
               {temp:"h",key:"serResvStartDt",txt:"<spring:message code='ser.lbl.resvDt' />",type:"strDate"},// 예약시간
               {temp:"h",key:"confirmDt",txt:"<spring:message code='ser.lbl.resvConfirmHm' />",type:"strDate"},//예약완료시간
               {temp:"h",key:"confirmUsrNm",txt:"<spring:message code='ser.lbl.resvConfirmUsrNm' />",type:""},//예약완료자
               {temp:"h",key:"resvRemark",txt:"<spring:message code='ser.lbl.resvRemark' />",type:""},//예약비고
               {temp:"h",key:"saNm",txt:"<spring:message code='ser.lbl.saAppoint' />",type:""},//SA
               {temp:"h",key:"tecNm",txt:"<spring:message code='ser.lbl.tecAppoint' />",type:""},//테크니션
               {temp:"h",key:"lbrAmt",txt:"<spring:message code='ser.lbl.preLbrSubAmt' />",type:"strAmt"},//예정공임비
               {temp:"h",key:"parAmt",txt:"<spring:message code='ser.lbl.preParSubAmt' />",type:"strAmt"},//예정부품비
               {temp:"h",key:"etcAmt",txt:"<spring:message code='ser.lbl.preEtcSubAmt' />",type:"strAmt"},//에정기타비
               {temp:"h",key:"sumAmt",txt:"<spring:message code='ser.lbl.preTotAmt' />",type:"strAmt"},//예정총금액
               {temp:"h",key:"resvAlramDt",txt:"<spring:message code='ser.lbl.resvAlramDt' />",type:"strDate"},//수리예약알람시간
               {temp:"h",key:"resvAlramUsrNm",txt:"<spring:message code='ser.lbl.resvAlramUsr' />",type:""},//수리예약알람자
               ];


var viewRow=10;//한번에 조회할 건수
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수

var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/ser/rev/reservationReceipt/selectReservationReceiptsList.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["firstIndex"] = pageIndex;
                params["lastIndex"] = pageSize;

                params["sDlrCd"]       = "${dlrCd}";
                params["sCarRegNo"]    = $("#sCarRegNo").val();
                params["sPreFixId"]    = "RE";
                params["sort"] = options.sort;
                params["sListType"] = '01';
                params["sRegUsrNm"] = $("#sRegUsrNm").val();
                params["sResvTp"] = $("#sResvTp").data("kendoExtDropDownList").value();
                params["sVinNo"] = $("#sVinNo").val();
                params["sResvDocNo"] = $("#sResvDocNo").val();
                params["sResvStatCd"] = $("#sResvStatCd").data("kendoExtDropDownList").value();
                if($("#sResvFromDt").val() == "" ){
                    params["sResvFromDt"] = null;
                }else{
                    params["sResvFromDt"] = chgDate($("#sResvFromDt").val());
                }
                if($("#sResvToDt").val() == ""){
                    params["sResvToDt"] = null;
                }else{
                    params["sResvToDt"] = chgDate($("#sResvToDt").val());
                }
                if($("#sSerResvStartFromDt").val() == "" ){
                    params["sSerResvStartFromDt"] = null;
                }else{
                    params["sSerResvStartFromDt"] = chgDate($("#sSerResvStartFromDt").val());
                }
                if($("#sSerResvStartToDt").val() == ""){
                    params["sSerResvStartToDt"] = null;
                }else{
                    params["sSerResvStartToDt"] = chgDate($("#sSerResvStartToDt").val());
                }
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
    setTimeout(function(){ $("#content_detail").css("display","block")}, 10);
    $("#header_title span").removeAttr("class");

    if(dataItem != null){

        setDetailData3(keyMapArr,dataItem,"#defaultHtml input[id]");//보이는 것
        setDetailData3(keyMapArr,dataItem,"#hiddenHtml input[id]");// 안보이는 것
        $(".co_view").css("display","none");
        $(".title_btn span").attr("class", "co_open co_close");
        $("#resvStatCd").val(resvStatCdObj[$("#resvStatCd").val()]);
        $("#resvTp").val(resvTpCdObj[$("#resvTp").val()]);

        _sResvDocNo=dataItem.resvDocNo;
        subListData.read();
        subListData2.read();
        subListData3.read();
        subListData4.read();
    }
}
function changeGroupDate(obj){
    var result = "";
    if(obj != null && obj != ""){
        result = obj.substring(5,7)+"-"+obj.substring(8,10);
        //result = obj.substring(5,7);
    }else{
        result = "";
    }
    return result;
}
changeResvStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = resvStatCdObj[val];
    }
    return returnVal;
};

changeResvTpCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = resvTpCdObj[val];
    }
    return returnVal;
};
// 예약접수상태
resvReptStatCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = resvReptStatCdArr[val].cmmCdNm;
    }
    return returnVal;
};

</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code="ser.menu.roStatus" /><!-- RO작업이력현황 --></h2>
    </div>
    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:50%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.vinNo" /><!-- vinNo --></span>
            <span style="width:50%"><spring:message code="ser.lbl.roDocNo" /><!-- RO번호 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.roWrtrNm" /><!-- RO발행자 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.roTp" /><!-- RO유형 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.roStatus" /><!-- RO상태 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.roDt" /><!-- RO일자 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.expcDlvDt" /><!-- 예정인도시간 --></span>
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
    <span style="width:50%">#:trimNull(vinNo)   #</span>
    <span style="width:50%">#:trimNull(roDocNo) #</span>
    <span style="width:50%">#:trimNull(regUsrNm) #</span>
    <span style="width:50%">#:trimNull(roTpNm) #</span>
    <span style="width:50%">#:trimNull(roStatNm) #</span>
    <span style="width:50%">#:chgDate2DateTimeStr(roDt) #</span>
    <span style="width:50%">#:chgDate2DateTimeStr(expcDlDt) #</span>
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
               {temp:"s",key:"runDistVal",txt:"<spring:message code='ser.lbl.nowRunDist' />",type:"strDist"}, //사전점검주행거리
               {temp:"h",key:"lastRunDistVal",txt:"<spring:message code='ser.lbl.accuDrivDis' />",type:"strDist"},//누계주행거리
               {temp:"h",key:"roStatNm",txt:"<spring:message code='ser.lbl.roStatus' />",type:""},//RO상태
               {temp:"h",key:"roDocNo",txt:"<spring:message code='ser.lbl.roDocNo' />",type:""},//RO위탁번호
               {temp:"h",key:"roTpNm",txt:"<spring:message code='ser.lbl.roTp' />",type:""},// RO유형
               {temp:"h",key:"roDt",txt:"<spring:message code='ser.lbl.roDt' />",type:"strDate"},//정비위탁시간
               {temp:"h",key:"regUsrNm",txt:"<spring:message code='ser.lbl.roWrtrNm' />",type:""},//위탁인-
               {temp:"h",key:"roPrintDt",txt:"<spring:message code='ser.lbl.roPrintDt' />",type:"strDate"},//정비인쇄일자
               {temp:"h",key:"updtDt",txt:"<spring:message code='ser.lbl.roUpdtDt' />",type:"strDate"},//변경정비위탁시간
               {temp:"h",key:"updtUsrNm",txt:"<spring:message code='ser.lbl.roUpdtUsrNm' />",type:""},//변경정비위탁자
               {temp:"h",key:"roCancDt",txt:"<spring:message code='ser.lbl.roCancDt' />",type:"strDate"},//정비위탁취소시간
               {temp:"h",key:"roCancNm",txt:"<spring:message code='ser.lbl.roCancUsr' />",type:""},//정비위탁취소자
               {temp:"h",key:"cancReasonNm",txt:"<spring:message code='ser.lbl.cancReasonCd' />",type:""},//취소원인
               {temp:"h",key:"lbrAmt",txt:"<spring:message code='ser.lbl.preLbrSubAmt' />",type:"strAmt"},//예상공임비소계
               {temp:"h",key:"parAmt",txt:"<spring:message code='ser.lbl.preParSubAmt' />",type:"strAmt"},// 예상부품비소계
               {temp:"h",key:"etcAmt",txt:"<spring:message code='ser.lbl.preEtcSubAmt' />",type:"strAmt"},//예상기타비소계
               {temp:"h",key:"sumAmt",txt:"<spring:message code='ser.lbl.preTotAmt' />",type:""},//예상수리비합계
               {temp:"h",key:"expcDlDt",txt:"<spring:message code='ser.lbl.expcDlvDt' />",type:"strDate"},//예상인도시간
               {temp:"h",key:"wrkStatNm",txt:"<spring:message code='ser.lbl.repairSerStat' />",type:""},//수리서비스상태
               {temp:"h",key:"atqProcTpNm",txt:"<spring:message code='ser.lbl.OldItemHandTp' />",type:""},//고품처리
               {temp:"h",key:"carWashTpNm",txt:"<spring:message code='ser.lbl.carWash' />",type:""},//세차
               {temp:"h",key:"custWaitMthNm",txt:"<spring:message code='ser.lbl.custStbyMth' />",type:""},//고객대기
               {temp:"h",key:"qtTestMthNm",txt:"<spring:message code='ser.lbl.qtTest' />",type:""},//품질검사
               {temp:"h",key:"goodwillYnNm",txt:"<spring:message code='ser.lbl.goodWillYn' />",type:""},//선의배상
               {temp:"h",key:"carDriveReqTpNm",txt:"<spring:message code='ser.lbl.tdrvReq' />",type:""},//시승
               {temp:"h",key:"roRemark",txt:"<spring:message code='ser.lbl.roRemark' />",type:""},//정비위탁비고
               {temp:"h",key:"dlrRoTpNm",txt:"<spring:message code='ser.lbl.dlrRoTp' />",type:""},//자체정의위탁유형
               {temp:"h",key:"diagDocNo",txt:"<spring:message code='ser.lbl.preInsNo' />",type:""},//사전점검번호
               {temp:"h",key:"incReqNo",txt:"<spring:message code='ser.lbl.incReqNo' />",type:""},//보험청구번호
               {temp:"h",key:"baseRoNo",txt:"<spring:message code='ser.lbl.origRorcptNo' />",type:""},//기존정비위탁번호
               {temp:"h",key:"calcDocNo",txt:"<spring:message code='ser.lbl.calcNo' />",type:""},//서비스정산번호
               {temp:"h",key:"calcRegDt",txt:"<spring:message code='ser.lbl.calcDt' />",type:"strDate"},//서비스정산시간
               {temp:"h",key:"calcPrsnNm",txt:"<spring:message code='ser.lbl.settlement' />",type:""},//서비스정산자
               {temp:"h",key:"calcDt",txt:"<spring:message code='ser.lbl.calcEndDt' />",type:"strDate"},//정산완료시간
               {temp:"h",key:"calcLbrAmt",txt:"<spring:message code='ser.lbl.lbrCalcAmt' />",type:"strAmt"},//정산공임금액
               {temp:"h",key:"calcParAmt",txt:"<spring:message code='ser.lbl.parCalcAmt' />",type:"strAmt"},//정산부품금액
               {temp:"h",key:"calcEtcAmt",txt:"<spring:message code='ser.lbl.etcCalcAmt' />",type:"strAmt"},//정산기타금액
               {temp:"h",key:"lbrDcAmt",txt:"<spring:message code='ser.lbl.lbrCdDcAmt' />",type:"strAmt"},//공임할인금액
               {temp:"h",key:"parDcAmt",txt:"<spring:message code='ser.lbl.parDcAmt' />",type:"strAmt"},//부품할인금액
               {temp:"h",key:"pointUseAmt",txt:"<spring:message code='ser.lbl.dlrPointUseAmt' />",type:"strAmt"},//회원포인트사용금액
               {temp:"h",key:"bmPointUseAmt",txt:"<spring:message code='ser.lbl.bmPointUseAmt' />",type:"strAmt"},//BM포인트사용금액
               {temp:"h",key:"bmCupnUseAmt",txt:"<spring:message code='ser.lbl.bmCupnUseAmt' />",type:"strAmt"},//BM쿠폰용금액
               {temp:"h",key:"calcEtcDcAmt",txt:"<spring:message code='ser.lbl.etcSaleAmt' />",type:"strAmt"},//기타할인금액
               {temp:"h",key:"calcSumAmt",txt:"<spring:message code='ser.lbl.finalCalcAmt' />",type:"strAmt"},//최종정산금액
               {temp:"h",key:"paidYnNm",txt:"<spring:message code='ser.lbl.paidYn' />",type:""},//지불완료여부
               {temp:"h",key:"wonUnitCutAmt",txt:"<spring:message code='ser.lbl.interSettAmt' />",type:"strAmt"},//정산절사금액
               {temp:"h",key:"demicPointCutAmt",txt:"<spring:message code='ser.lbl.calcZeroAmt' />",type:"strAmt"},//정산제로금액
               {temp:"h",key:"paymAmt",txt:"<spring:message code='ser.lbl.arCd' />",type:"strAmt"},//발생금액
               {temp:"h",key:"rcvAmt",txt:"<spring:message code='ser.lbl.gisuAmt' />",type:"strAmt"},//실수령금액
               {temp:"h",key:"npayAmt",txt:"<spring:message code='ser.lbl.outstdAmt' />",type:"strAmt"},//미수금액
               ];


var viewRow=10;//한번에 조회할 건수
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수

var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/ser/ro/repairOrder/selectRepairOrdersList.do' />"
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
                params["sRoStatCd"]     = $("#sRoStatCd").data("kendoExtDropDownList").value();
                params["sRegUsrNm"]     = $("#sRegUsrNm").val();
                params["sVinNo"]        = $("#sVinNo").val();
                params["sRoDocNo"]      = $("#sRoDocNo").val();
                params["sRoTp"]         = $("#sRoTp").data("kendoExtDropDownList").value();
                params["sExpcDlToDt"]   = chgDate($("#sExpcDlToDt").val());
                params["sExpcDlFromDt"] = chgDate($("#sExpcDlFromDt").val());
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
        $.each(e.items, function(idx,obj){
            obj.rnum = idx+1;
        });
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
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");
    $("#header_title span").removeAttr("class");

    if(dataItem!=null){
        $("#roDocNo").val(dataItem.roDocNo);
        setDetailData3(keyMapArr,dataItem,"#defaultHtml input[id]");//보이는 것
        setDetailData3(keyMapArr,dataItem,"#hiddenHtml input[id]");// 안보이는 것

        _sRoDocNo=dataItem.roDocNo;
        subListData.read();
        subListData2.read();
        subListData3.read();
        subListData4.read();
    }

    $(".co_view").css("display","none");
    $(".title_btn span").attr("class", "co_open co_close");
}
//수리진도
changeRoStatCd = function(val){
 var returnVal = "";
 if(val != null && val != ""){
     returnVal = roStatCdMap[val].cmmCdNm;
 }
 return returnVal;
};
</script>

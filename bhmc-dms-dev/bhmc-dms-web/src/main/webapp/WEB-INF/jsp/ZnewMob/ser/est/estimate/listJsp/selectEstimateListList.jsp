<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code="ser.menu.estList" /><!-- 견적현황 --></h2>
    </div>
    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:50%"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.vinNo" /><!-- vinNo --></span>
            <span style="width:50%"><spring:message code="ser.lbl.estDocNo" /><!-- 정비견적번호 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.estWrtrNm" /><!-- 견적조작자 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.roTp" /><!-- RO유형 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.estimateStatCd" /><!-- 견적상태 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.estDt" /><!-- 견적일자 --></span>
            <span style="width:50%"><spring:message code="ser.lbl.roDt" /><!-- RO일자 --></span>
        </div>
        <div>
            <div id="listView" style="height: 300px; overflow: scroll;"></div>
        </div>
    </div>
</section>
<script type="text/x-kendo-template" id="template">
<div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
    <span style="width:50%; display:none;">#:rnum #</span>
    <span style="width:50%">#:trimNull(carRegNo)   #</span>
    <span style="width:50%">#:trimNull(vinNo) #</span>
    <span style="width:50%">#:trimNull(estDocNo) #</span>
    <span style="width:50%">#:trimNull(regUsrNm) #</span>
    <span style="width:50%">#:trimNull(roTpNm) #</span>
    <span style="width:50%">#:trimNull(roStatNm) #</span>
    <span style="width:50%">#:chgDate2DateTimeStr(estDt) #</span>
    <span style="width:50%">#:chgDate2DateTimeStr(roDt) #</span>
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
               {temp:"h",key:"carRunDistVal",txt:"<spring:message code='ser.lbl.accuDrivDis' />",type:"strDist"},//누계주행거리
               {temp:"h",key:"estStatNm",txt:"<spring:message code='ser.lbl.estimateStatCd' />",type:""},//견적상태
               {temp:"h",key:"estDocNo",txt:"<spring:message code='ser.lbl.estDocNo' />",type:""},//견적번호
               {temp:"h",key:"estDt",txt:"<spring:message code='ser.lbl.estDt' />",type:"strDate"},//견적등록일자
               {temp:"h",key:"regUsrNm",txt:"<spring:message code='ser.lbl.estWrtrNm' />",type:""},//정비견적자
               {temp:"h",key:"estPrintDt",txt:"<spring:message code='ser.lbl.estPrintDt' />",type:"strDate"},//정비견적프린트시간
               {temp:"h",key:"estCancDt",txt:"<spring:message code='ser.lbl.estCancDt' />",type:"strDate"},//정비견적취소시간
               {temp:"h",key:"estCancNm",txt:"<spring:message code='ser.lbl.estCancId' />",type:""},//정비견적취소자
               {temp:"h",key:"estCancReasonNm",txt:"<spring:message code='ser.lbl.cancReasonCd' />",type:""},//취소원인
               {temp:"h",key:"updtDt",txt:"<spring:message code='ser.lbl.estUpdtDt' />",type:"strDate"},//정비견적수정시간
               {temp:"h",key:"updtUsrNm",txt:"<spring:message code='ser.lbl.estUpdtNm' />",type:""},//정비견적변경자
               {temp:"h",key:"roStatNm",txt:"<spring:message code='ser.lbl.roStatus' />",type:""},//RO상태
               {temp:"h",key:"roDocNo",txt:"<spring:message code='ser.lbl.roDocNo' />",type:""},//RO번호
               {temp:"h",key:"roTpNm",txt:"<spring:message code='ser.lbl.roTp' />",type:""},//RO유형
               {temp:"h",key:"roDt",txt:"<spring:message code='ser.lbl.roDt' />",type:"strDate"},//RO일자
               {temp:"h",key:"roUsrNm",txt:"<spring:message code='ser.lbl.roWrtrNm' />",type:""},//정비위탁자
               {temp:"h",key:"estRemark",txt:"<spring:message code='ser.lbl.estRemark' />",type:""},//정비정산비고
               {temp:"h",key:"lbrCalcSumAmt",txt:"<spring:message code='ser.lbl.lbrEstAmt' />",type:""},//공임견적금액
               {temp:"h",key:"parCalcSumAmt",txt:"<spring:message code='ser.lbl.parEstAmt' />",type:""},//부품정산금액
               {temp:"h",key:"etcCalcAmt",txt:"<spring:message code='ser.lbl.etcEstAmt' />",type:""},//기타견적금액
               {temp:"h",key:"lbrDcAmt",txt:"<spring:message code='ser.lbl.lbrCdDcAmt' />",type:""},//공임할인금액
               {temp:"h",key:"parDcAmt",txt:"<spring:message code='ser.lbl.parDcAmt' />",type:""},//부품할인금액
               {temp:"h",key:"pointTotAmt",txt:"<spring:message code='ser.lbl.dlrPointUseAmt' />",type:""},//포인트사용금액
               {temp:"h",key:"bmPointTotAmt",txt:"<spring:message code='ser.lbl.bmPointUseAmt' />",type:""},//BM포인트사용금액
               {temp:"h",key:"etcTotAmt",txt:"<spring:message code='ser.lbl.etcSaleAmt' />",type:""},//기타할인금액
               {temp:"h",key:"calcTotAmt",txt:"<spring:message code='ser.lbl.finalEstAmt' />",type:""},//견적금액
               {temp:"h",key:"wonUnitCutAmt",txt:"<spring:message code='ser.lbl.estInterSettAmt' />",type:""},//견적절사금액
               {temp:"h",key:"demicPointCutAmt",txt:"<spring:message code='ser.lbl.estZeroAmt' />",type:""},//견적제로금액
               {temp:"h",key:"paymAmt",txt:"<spring:message code='ser.lbl.arCd' />",type:""},//수납금액 (수납)
               {temp:"h",key:"runDistVal",txt:"<spring:message code='ser.lbl.realDrivDis' />",type:"strDist"}//현주행거리
               ];


var viewRow=10;//한번에 조회할 건수
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수

var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/ser/est/estimate/selectEstimateListMains.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["firstIndex"] = pageIndex;
                params["lastIndex"] = pageSize;
                if($("#sFromDt").val() == ""){
                    params["sEstFromDt"] = null;
                }else{
                    params["sEstFromDt"] = chgDate($("#sFromDt").val());
                }
                if($("#sToDt").val() == ""){
                    params["sEstToDt"] = null;
                }else{
                    params["sEstToDt"] = chgDate($("#sToDt").val());
                }
                params["sCarRegNo"] = $("#sCarRegNo").val();
                params["sEstDocNo"] = $("#sEstDocNo").val();
                params["sRegUsrNm"] = $("#sRegUsrNm").val();
                params["sRoDocNo"] = $("#sRoDocNo").val();
                params["sVinNo"] = $("#sVinNo").val();
                params["sEstStatCd"] = $("#sEstStatCd").data("kendoExtDropDownList").value();

                if($("#sRoFromDt").val() == ""){
                    params["sRoFromDt"] = null;
                }else{
                    params["sRoFromDt"] = chgDate($("#sRoFromDt").val());
                }
                if($("#sRoToDt").val() == ""){
                    params["sRoToDt"] = null;
                }else{
                    params["sRoToDt"] = chgDate($("#sRoToDt").val());
                }
                params["sRoTp"]      = $("#sRoTp").data("kendoExtDropDownList").value();
                params["sPreFixId"]  = "ET";
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

    if(dataItem!=null){

        $.ajax({
            url:"<c:url value='/ser/est/estimate/selectEstimateManageMains.do' />"
            ,data:JSON.stringify({sRoDocNo:dataItem.roDocNo, sEstDocNo:dataItem.estDocNo})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                mob.loading.hide();
            }
            ,success:function(result, textStatus){
                if(dms.string.strNvl(result.estDocNo) == ""){
                    mob.notification.info("<spring:message code='ser.menu.estimate' var='returnMsg' /><spring:message code='ser.info.noInfoData' arguments='${returnMsg}' />");
                    initEstInfoSet();

                } else {
                    estInfoSet(result, "CA");
                }
                mob.loading.hide();
            }
        });


      //견적정보 셋팅
        estInfoSet = function(result, listType){
            $("#C_lbrCalcAmt").text(result.lbrCalcAmt);
            $("#C_lbrDcRate").text("("+chgInt(result.lbrDcRate)+"%)");
            $("#C_lbrDcAmt").text(result.lbrDcAmt);
            $("#C_lbrBmPointUseAmt").text(result.lbrBmPointUseAmt);
            $("#C_lbrBmCupnUseAmt").text(result.lbrBmCupnUseAmt);
            $("#C_lbrPointUseAmt").text(result.lbrPointUseAmt);
            $("#C_lbrEtcDcAmt").text(result.lbrEtcDcAmt);
            $("#C_lbrCalcSumAmt").text(result.lbrCalcSumAmt);
            $("#C_lbrSumAmt").text(result.lbrCalcSumAmt);

            $("#C_parCalcAmt").text(result.parCalcAmt);
            $("#C_parDcRate").text("("+chgInt(result.parDcRate)+"%)");
            $("#C_parDcAmt").text(result.parDcAmt);
            $("#C_parBmPointUseAmt").text(result.parBmPointUseAmt);
            $("#C_parBmCupnUseAmt").text(result.parBmCupnUseAmt);
            $("#C_parPointUseAmt").text(result.parPointUseAmt);
            $("#C_parEtcDcAmt").text(result.parEtcDcAmt);
            $("#C_parCalcSumAmt").text(result.parCalcSumAmt);
            $("#C_parSumAmt").text(result.parCalcSumAmt);

            $("#C_etcCalcAmt").text(result.etcCalcAmt);
            $("#C_etcDcRate").text("("+chgInt(result.etcDcRate)+"%)");
            $("#C_etcDcAmt").text(result.etcDcAmt);
            $("#C_etcBmPointUseAmt").text(result.etcBmPointUseAmt);
            $("#C_etcBmCupnUseAmt").text(result.etcBmCupnUseAmt);
            $("#C_etcPointUseAmt").text(result.etcPointUseAmt);
            $("#C_etcOtherDcAmt").text(result.etcOtherDcAmt);
            $("#C_etcCalcSumAmt").text(result.etcCalcSumAmt);
            $("#C_etcSumAmt").text(result.etcCalcSumAmt);

            $("#C_calcTotAmt").text(result.calcTotAmt);
            $("#C_dcTotRate").text("("+chgInt(result.dcTotRate)+"%)");
            $("#C_dcTotAmt").text(result.dcTotAmt);
            $("#C_bmPointTotAmt").text(result.bmPointTotAmt);
            $("#C_bmCupnUseAmt").text(result.bmCupnUseAmt);
            $("#C_pointTotAmt").text(result.pointTotAmt);
            $("#C_etcTotAmt").text(result.etcTotAmt);
            $("#C_lastCalcTotAmt").text(result.lastCalcTotAmt);
            $("#C_totSumAmt").text(result.lastCalcTotAmt);
        }

      //견적정보 초기화
        initEstInfoSet = function(){
            $("#C_lbrCalcAmt").text("");
            $("#C_lbrDcRate").text("");
            $("#C_lbrDcAmt").text("");
            $("#C_lbrBmPointUseAmt").text("");
            $("#C_lbrPointUseAmt").text("");
            $("#C_lbrEtcDcAmt").text("");
            $("#C_lbrCalcSumAmt").text("");
            $("#C_lbrSumAmt").text("");

            $("#C_parCalcAmt").text("");
            $("#C_parDcRate").text("");
            $("#C_parDcAmt").text("");
            $("#C_parBmPointUseAmt").text("");
            $("#C_parPointUseAmt").text("");
            $("#C_parEtcDcAmt").text("");
            $("#C_parCalcSumAmt").text("");
            $("#C_parSumAmt").text("");

            $("#C_etcCalcAmt").text("");
            $("#C_etcDcRate").text("");
            $("#C_etcDcAmt").text("");
            $("#C_etcBmPointUseAmt").text("");
            $("#C_etcPointUseAmt").text("");
            $("#C_etcOtherDcAmt").text("");
            $("#C_etcCalcSumAmt").text("");
            $("#C_etcSumAmt").text("");

            $("#C_calcTotAmt").text("");
            $("#C_dcTotRate").text("");
            $("#C_dcTotAmt").text("");
            $("#C_bmPointTotAmt").text("");
            $("#C_pointTotAmt").text("");
            $("#C_etcTotAmt").text("");
            $("#C_lastCalcTotAmt").text("");
            $("#C_totSumAmt").text("");
        }

        setDetailData3(keyMapArr,dataItem,"#defaultHtml input[id]");//보이는 것
        setDetailData3(keyMapArr,dataItem,"#hiddenHtml input[id]");// 안보이는 것

        $(".co_view").css("display","none");
        $(".title_btn span").attr("class", "co_open co_close");

        _sEstDocNo=dataItem.estDocNo;
        _sLtsModelCd=dataItem.ltsModelCd;

        $("#estDocNo").val(dataItem.estDocNo);
        subListData.read();
        subListData2.read();
        subListData3.read();
        subListData4.read();
    }


}
changeEstTpCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = estTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

getLtsModelNm = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = ltsMap[val].cmmCdNm;
    }
    return returnVal;
};

</script>

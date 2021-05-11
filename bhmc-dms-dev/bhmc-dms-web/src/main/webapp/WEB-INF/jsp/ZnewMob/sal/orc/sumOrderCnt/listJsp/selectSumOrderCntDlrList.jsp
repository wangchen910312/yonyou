<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section id="content_list" class="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code='global.lbl.orderStatus' /><!-- 오더종합현황 --></h2>
    </div>
    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:50%"><spring:message code='global.lbl.carLine' /></span><!-- 차종 -->
            <span style="width:50%"><spring:message code='sal.lbl.extColor' />/<spring:message code='sal.lbl.intColor' /></span><!-- 외색/내색 -->
            <span style="width:50%"><spring:message code='global.lbl.ocn' />/<spring:message code='mis.lbl.dealermodel' /></span><!-- OCN/차관 -->
            <span style="width:50%"><spring:message code='global.lbl.orderType' /></span><!-- 주문유형 -->
            <span style="width:100%"><spring:message code='sal.lbl.etcsTot' /></span><!-- 1차/2차 심사 -->
        </div>
        <div>
            <div id="listView" style="height: 300px; overflow: scroll;"></div>
        </div>
    </div>
    <div class="btnfixed">
        <div class="dlistitem bgNone" style="text-align: left;">
            <span style="width:50%"><spring:message code='global.lbl.total' />:<!-- 합계 --></span>
            <span style="width:50%" id="totalSum"></span>
        </div>
    </div>
</section>
<script type="text/x-kendo-template" id="template">
    <div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
        <span style="width:50%; display:none;">#:rnum #</span>
        <span style="width:50%">#:'['+trimNull(carlineCd)+']' ##:trimNull(carlineNm) #</span>
        <span style="width:50%">#:trimNull(extColorNm) + " / " + trimNull(intColorCd) #</span>
        <span style="width:50%">#:trimNull(ocnCd) + " / " + trimNull(modelNm) #</span>
        <span style="width:50%">#:'['+trimNull(ordTp)+']'##:changeOrdTp(ordTp) #</span>
        <span style="width:100%">#:ordQty + " / " + fstConfirmQty + " / " + scndConfirmQty + " / " + finalConfQty #</span>
    </div>
</script>
<script>
var viewRow=10;//한번에 조회할 건수
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수

var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/sal/orc/sumOrderCnt/selectSumOrderCntDlrs.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["firstIndex"] = pageIndex;
                params["lastIndex"] = pageSize;

                params["sDlrCd"] = dlrCd;
                var strOrdTp = $("#sOrdsTp").data('kendoExtDropDownList').value();
                var strOrdYyMmPrid ;
                var dtOrdDtS;
                var dtOrdDtE;
                if(strOrdTp == null || strOrdTp == ""){
                    strOrdYyMmPrid = "";
                    dtOrdDtS = "";
                    dtOrdDtE = "";
                }else {
                    strOrdYyMmPrid = $("#sOrdYyMmPrid").data('kendoExtDropDownList').value();
                    dtOrdDtS = chgDate($("#sOrdStartDt").val());
                    dtOrdDtE = chgDate($("#sOrdEndDt").val());
                }
                var sOrdTp = $('input:radio[name=radio]:checked').val();
                if(sOrdTp == "Y"){
                    dtOrdDtS = "";
                    dtOrdDtE = "";
                    strOrdTp = "N1";
                }else{
                    strOrdYyMmPrid = "";
                }
                params["sOrdsTp"] = sOrdTp;
                params["strOrdTp"] = strOrdTp;
                params["sOrdPrid"] = strOrdYyMmPrid;
                params["sOrdStartDt"] = dtOrdDtS;
                params["sOrdEndDt"] = dtOrdDtE;
                params["sOrdStatCd"] = $("#sOrdStatCd").data("kendoExtDropDownList").value();
                params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                var sOcnCd = $("#sOcnCd").data("kendoExtDropDownList").value();
                var sModelCd="";
                var sFscCd="";
                if(dms.string.isNotEmpty(sOcnCd)){
                    sModelCd = $("#hiddenFscCode").val();
                }else{
                    sFscCd = $("#sModelCd").data("kendoExtDropDownList").value();
                }
                params["sFscCd"]   = sFscCd;    // fsc명
                params["sModelCd"]   = sModelCd;    // 모델
                params["sOcnCd"] = $("#sOcnCd").data("kendoExtDropDownList").value();
                params["sExtColorCd"] = $("#sExtColorCd").data("kendoExtDropDownList").value();
                params["sIntColorCd"] = $("#sIntColorCd").data("kendoExtDropDownList").value();
                totalOrdQty=0;
                totalFinalConfQty=0;
                totalFstConfirmQty=0;
                totalScndConfirmQty=0;
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
        for(var i=0; i<listData._view.length; i++){
            totalOrdQty += listData._view[i].ordQty
            totalFinalConfQty += listData._view[i].finalConfQty;
            totalFstConfirmQty += listData._view[i].fstConfirmQty;
            totalScndConfirmQty += listData._view[i].scndConfirmQty;
        }

        $("#totalSum").html(totalOrdQty + "/" + totalFstConfirmQty + "/" + totalScndConfirmQty + "/" +totalFinalConfQty);
    }
    ,error:function(e){
        console.log(e);
    }
});
function listViewClick(dataItem){
    if(typeof dataItem != 'undefined'){

        $("#dlrCd").val(dataItem.dlrCd);
        $("#ordYyMmDt").val(dataItem.ordYyMmDt);
        _ordPrid=dataItem.week;
        _ordsTp=dataItem.or
        $("#carlineCd").val(dataItem.carlineCd);
        $("#modelCd").val(dataItem.modelCd);
        $("#ocnCd").val(dataItem.ocnCd);
        $("#intColorCd").val(dataItem.intColorCd);
        $("#carlineCds").val(dataItem.carlineCd);
        $("#carlineNm").val(dataItem.carlineNm);
        $("#ocnCds").val(dataItem.ocnCd);
        setDetailData(dataItem,".detialListData input[id]");
        $("#misSetQty").val(dataItem.missSetQty);
        $("#tranSchQty").val(dataItem.tranMissQty);
    }
    $("#ordTp").val(ordTpObj[$("#ordTp").val()]);
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_subdetail").css("display","none");
    $("#content_detail").css("display","block");
    $("#header_title span").removeAttr("class");
    $("#detailCloseBtn").show();
    subListData.read();
}
changeOrdTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = ordTpObj[val];
    }
    return returnVal;
};
</script>

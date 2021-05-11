<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code="sal.menu.dlrOrderSearch" /></h2>
    </div>
    <div class="listarea">
        <div class="dlistitem listhead">
            <span style="width:50%" ><spring:message code="global.lbl.carLine" /><!-- 차종 --></span>
            <span style="width:50%" ><spring:message code="global.lbl.extColor" />/<spring:message code="global.lbl.intColor" /><!-- 외장색/내장색 --></span>
            <span style="width:50%" ><spring:message code="global.lbl.ocn" /><!-- OCN -->/<spring:message code="global.lbl.model" /><!-- OCN/차관 --></span>
            <span style="width:50%" ><spring:message code="global.lbl.orderType" /><!-- 오더유형 --></span>
            <span style="width:50%" ><spring:message code="sal.lbl.pdiDt" /><!-- 오더분배일자--></span>
            <span style="width:50%" ><spring:message code="sal.lbl.evalConfMth" /><!-- 심사평가월--></span>
            <span style="width:50%" ><spring:message code="sal.lbl.ordStat" /><!-- 오더상태 --></span>
            <span style="width:50%" ><spring:message code="sal.lbl.whPrc" /><!-- 할인후가격 --></span>
        </div>
        <div>
            <div id="listView" style="height: 300px; overflow: scroll;"></div>
        </div>
        <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
    </div>
    <div class="btnfixed">
        <div class="dlistitem bgNone" style="text-align: left;">
            <span style="width:15%"><spring:message code='global.lbl.total' />:<!-- 합계 --></span>
            <span style="width:10%" id="totalSum"></span>
        </div>
    </div>
</section>
<script type="text/x-kendo-template" id="template">
    <div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
        <span style="width:50%; display:none;">#:rnum #</span>
        <span style="width:50%">#:'['+carlineCd+']'##:carlineNm #</span>
        <span style="width:50%">#:extColorNm + "/" + intColorCd #</span>
        <span style="width:50%" class="clboth">#:ocnCd + "/" + modelNm #</span>
        <span style="width:50%">#:changeOrdTp(ordTp) #</span>
        <span style="width:50%" class="clboth">#:chgDate2Str(pdiDt) #</span>
        <span style="width:50%">#:trimNull(emont) #</span>
        <span style="width:50%" class="clboth">#:changeOrdStatCd(ordStatCd) #</span>
        <span style="width:50%">#:trimNull(kendo.toString(aamt, 'n2')) #</span>
    </div>
</script>
<script>
//순서에 맞게 넣고 , s는 보이는 것 h는 안보이는 것
var keyMapArr=[
               {temp:"s",key:"carlineCd",txt:"<spring:message code='global.lbl.carlineCd' />",type:""}, //차종
               {temp:"s",key:"carlineNm",txt:"<spring:message code='global.lbl.carlineNm' />",type:""}, //차종
               {temp:"s",key:"modelNm",txt:"<spring:message code='global.lbl.model' />",type:""}, //차관
               {temp:"s",key:"ocnCd",txt:"<spring:message code='global.lbl.ocnCode' />",type:""}, //OCN 코드
               {temp:"s",key:"ocnNm",txt:"<spring:message code='global.lbl.ocnNm' />",type:""}, //OCN 명칭
               {temp:"s",key:"extColorCd",txt:"<spring:message code='global.lbl.extColorCd' />",type:""}, //외장색 코드
               {temp:"s",key:"extColorNm",txt:"<spring:message code='global.lbl.extColorNm' />",type:""}, //외장색 명칭
               {temp:"s",key:"intColorNm",txt:"<spring:message code='sal.lbl.intColor' />",type:""}, //내장색
               {temp:"s",key:"ordQty",txt:"<spring:message code='global.lbl.qty' />",type:""},//수량
               {temp:"s",key:"ordTp",txt:"<spring:message code='global.lbl.orderType' />",type:""},//주문유형
               {temp:"s",key:"ordStatCd",txt:"<spring:message code='sal.lbl.ordStat' />",type:""},//오더상태
               {temp:"s",key:"ordDt",txt:"<spring:message code='global.lbl.chrgDt' />",type:"strDateOnly"},//주문일자
               {temp:"s",key:"saleRgstId",txt:"<spring:message code='sal.lbl.salesAdvisor' />",type:""},//판매고문
               {temp:"s",key:"ordSeq",txt:"<spring:message code='global.lbl.ordNo' />",type:""},//주문번호
               {temp:"s",key:"vinmVloc",txt:"<spring:message code='sal.lbl.plant' />",type:""},//공장
               {temp:"s",key:"emont",txt:"<spring:message code='sal.lbl.evalConfMth' />",type:""},//심사평가월
               {temp:"s",key:"pdiDt",txt:"<spring:message code='global.llbl.pdiDt' />",type:"strDateOnly"},//오더분배일자(PDI분배일)
               {temp:"s",key:"misSetDt",txt:"<spring:message code='sal.lbl.misSetDt' />",type:"strDateOnly"},//임무배정일
               {temp:"s",key:"tranSetDt",txt:"<spring:message code='sal.lbl.tranSchDt' />",type:"strDateOnly"},//운송계획일
               {temp:"s",key:"vinDt",txt:"<spring:message code='global.lbl.vinDt' />",type:"strDateOnly"},//VIN배정일
               {temp:"s",key:"retailDt",txt:"<spring:message code='sal.lbl.factoryOutDate' />",type:"strDateOnly"},//공장출고일
               {temp:"s",key:"dlrGrDt",txt:"<spring:message code='global.lbl.grDt' />",type:"strDateOnly"},//입고일
               {temp:"s",key:"custSaleDt",txt:"<spring:message code='sal.lbl.saleDt' />",type:"strDateOnly"},//판매일자
               {temp:"s",key:"vinNo",txt:"<spring:message code='global.lbl.vinNo' />",type:""},//VIN
               {temp:"s",key:"mdpr",txt:"<spring:message code='sal.lbl.carRetlAmt' />",type:"strAmt"},//지도가
               {temp:"s",key:"dcRate",txt:"<spring:message code='global.lbl.dcRate' />",type:""},//할인율(%)
               {temp:"s",key:"damt",txt:"<spring:message code='sal.lbl.bDcAmt' />",type:"strAmt"},//할인금액
               {temp:"s",key:"aamt",txt:"<spring:message code='global.lbl.deductionAmt' />",type:"strAmt"},//공제금액
               ];

var viewRow=10;//한번에 조회할 건수
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수

var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/sal/orc/dlrOrderSearch/selectDlrOrderSearchs.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["firstIndex"] = pageIndex;//options.skip;
                params["lastIndex"] = pageSize;//options.skip + options.take;

                var srchTp = $('input:radio[name=sRadio]:checked').val();
                params["sOrdTpList"] = $("#sOrderType").data("kendoExtMobileMultiSelectDropDownList").value();//주문유형
                params["sOrdStatCd"] = $("#sOrdStat").val();//주문상태

                if(srchTp == 'Y'){
                    params["sOrdStartDtstr"] = $("#sOrdStartDt").val().replace(/-/gi, "");// 주문일자
                    params["sOrdEndDtstr"] = $("#sOrdEndDt").val().replace(/-/gi, "");
                }else{
                    params["sConfirmDt"] = $("#sEvalConfMth").val().replace(/-/gi, "");// 심사평가월
                }
                params["sCarlineCd"] = $("#sCarLine").val();// 차종
                params["sModelCd"] = $("#hiddenFscCode").val();// 모델
                params["sOcnCd"] = $("#sOcn").val();// OCN
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
        makeDetailHtml(listData._data,keyMapArr,"#defaultHtml");
    }
    ,error:function(e){
        console.log(e);
    }
});
function listViewClick(dataItem){
    $("#content_list, #content_search").hide();
    $("#content_detail").show();
    $("#header_title span").removeAttr("class");
    if(dataItem != null){
        setDetailData3(keyMapArr,dataItem,"#defaultHtml input[id]");
        $("#ordTp").val(changeOrdTp(dataItem.ordTp));
        $("#ordStatCd").val(changeStatTp(dataItem.ordStatCd));
        $("#vinmVloc").val(changePlant(dataItem.vinmVloc));
    }
}

changeOrdTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = ordTpObj[val];
    }
    return returnVal;
};

changeOrdStatCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = ordStatCdObj[val];
    }
    return returnVal;
};
</script>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code="sal.title.contractTot" /></h2><!-- 계약종합조회-->
    </div>
    <div class="listarea">
        <div class="dlistitem listhead">
            <span style="width:34%" ><spring:message code="global.lbl.contractNo" /><!-- 계약번호--></span>
            <span style="width:33%" ><spring:message code="global.lbl.contractDt" /><!-- 계약일자 --></span>
            <span style="width:33%" ><spring:message code="global.lbl.custNm" /><!--고객명 --></span>
            <span style="width:34%" ><spring:message code="global.lbl.carLine" /><!-- 차종 --></span>
            <span style="width:33%" ><spring:message code="global.lbl.model" /><!-- 차관 --></span>
            <span style="width:33%" ><spring:message code="sal.lbl.extColor" />/<spring:message code="sal.lbl.intColor" /><!-- 외색 /내색--></span>
            <span style="width:100%" ><spring:message code="global.lbl.contractStat" /><!-- 계약상태 --></span>
        </div>
        <div id="listView" style="height:300px; overflow:scroll"></div>
    </div>
    <div class="btnfixed">
        <div class="dlistitem bgNone" style="text-align: left;">
            <span style="width:15%"><spring:message code='global.lbl.total' />:<!-- 합계 --></span>
            <span style="width:10%" id="totalSum"></span>
        </div>
    </div>
</section>

<script type="text/x-kendo-template" id="template">
<div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #])">
    <span style="width:34%">#:trimNull(contractNo) #</span>
    <span style="width:33%">#:trimNull(chgDate2Str(contractDt)) #</span>
    <span style="width:33%">#:trimNull(custNm) #</span>
    <span style="width:34%">#:trimNull("[" + carlineCd + "]" + carlineNm) #</span>
    <span style="width:33%">#:trimNull(fscNm) #</span>
    <span style="width:33%">#:getColor(extColorNm, intColorCd) #</span>
    <span style="width:100%">#:trimNull(contractStatNm) #</span>
</div>
</script>

<script>

var viewRow=10;
var pageIndex=0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수

var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/sal/cnt/contractProgress/selectContractProgressSearch.do' />"
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["firstIndex"] = pageIndex;
                params["lastIndex"] = pageSize;

             // 딜러코드
                params["sDlrCd"] = dlrCd;
                // 판매사원
                params["sSaleEmpNo"] = $("#sSalPrsnNm").data("kendoExtDropDownList").value();
                // 고객명
                params["sContractCustNm"] = $("#sCustomerNm").val();
                //고객
                params["sContractCustNo"] = $("#sCustomerId").val();
                // 계약상태
                params["sContractStatCd"] = $("#sContractStat").data("kendoExtDropDownList").value();
                // 계약일자
                //params["sStartContractDt"] = chgDate($("#sCtrStartDt").val());
                //params["sEndContractDt"]   = chgDate($("#sCtrEndDt").val());
                params["sComboDt"] = "01";
                params["sStartDt"] = chgDate($("#sCtrStartDt").val());
                params["sEndDt"]   = chgDate($("#sCtrEndDt").val());

                // vin no
                params["sVinNo"] = $("#sVinNum").val().toUpperCase();
                params["sContractNo"] = $("#sContractNo").val();
                return kendo.stringify(params);
            }
        }
    }
    ,batch:true
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
        $("#totalSum").html(rowTotal);
    }
});

getColor = function(extColor, intColor){
    var returnVal = "";

    if(extColor != null && intColor != null){
        returnVal = extColor + "/" + intColor;
    }else{
        returnVal = "";
    }
    return returnVal;
};

getFsc = function(fscNm, fscCd){
    var returnVal = "";

    if(fscNm == " " || fscCd == " "){
        returnVal = "";
    }else{
        returnVal = "[" + fscCd + "]" + fscNm;
    }
    return returnVal;
};


function listViewClick(dataItem)
{
    contentDetail(dataItem);
}

</script>


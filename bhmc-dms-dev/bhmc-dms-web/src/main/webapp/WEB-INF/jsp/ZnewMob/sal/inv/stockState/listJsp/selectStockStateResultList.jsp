<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code="mob.sal.title.stockResult" /><!-- 재고차종결과 --></h2>
        <div class="title_btn">
            <span class="tbtn01" id="stockCreate"><spring:message code='sal.btn.stockCreate' /></span>
        </div>
    </div>
    <div class="listarea">
        <div class="dlistitem listhead">
            <span style="width:65%;"><spring:message code='global.lbl.vinNum' /></span>
            <span style="width:35%;"><spring:message code="par.lbl.inInvestYn" /><!-- 실사여부 --></span>
            <span style="width:65%;" class="clboth"><spring:message code="global.lbl.ocn" />/<spring:message code="global.lbl.model" /><!-- OCN/차관 --></span>
            <span style="width:35%;"><spring:message code='ser.lbl.carLine' /><!-- 차종 --></span>
            <span style="width:65%;" class="clboth"><spring:message code="global.lbl.stockMonth" /><!-- 재고월령 --></span>
        </div>
        <div id="listView" style="height:300px; overflow:scroll"></div>
    </div>
    <div class="btnfixed">
        <div class="dlistitem bgNone" style="text-align: left; border-bottom: 0px">
            <span style="width:16.5%"><spring:message code='sal.lbl.stock' />:</span>
            <span style="width:16.5%" id="stockSum"></span>
            <span style="width:16.5%"><spring:message code='mob.sal.label.stockDone' />:</span>
            <span style="width:16.5%" id="stockDoneSum"></span>
            <span style="width:16.5%"><spring:message code='mob.sal.label.stockNo' />:</span>
            <span style="width:16.5%" id="stockNoSum"></span>
        </div>
    </div>
</section>

<script type="text/x-kendo-template" id="template">
<div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
    <span style="width:65%;">#:vinNo#</span>
    <span style="width:35%;">#:fnChangeynObj(confirmYn)#</span>
    <span style="width:65%;" class="clboth">#:ocnCd#/#:modelNm#</span>
    <span style="width:35%;">[#:carlineCd#]#:carlineNm#</span>
    <span style="width:65%;" class="clboth">#:stockAgingCnt#</span>
</div>
</script>

<script type="text/javascript">

var viewRow=10;
var pageIndex=0; pageSize=viewRow, rowTotal=0;
var tempData=[];
    var listData = new kendo.data.DataSource({
        transport:{
            read:{
                url:"<c:url value='/sal/inv/stockDue/selectStockDueDetailSearch.do' />"
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
            }
            ,parameterMap:function(options, operation) {
                if (operation === "read") {
                    var params = {};
                    params["firstIndex"] = pageIndex;
                    params["lastIndex"] = pageSize;

                    params["sConfirmYn"] = $("#sConfirmYn").val();
                    params["sStockDt"] = chgDate($("#sStockDt").val());
                    params["sVinNo"] = $("#sVinNo").val();
                    return kendo.stringify(params);
                }
            }
        }
        ,batch:true
        //,pageSize:pageSize
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

            var stockNoSum;
            var stockDoneSum;
            if(e.items.length==0){
                $("#stockSum").text(0);
                $("#stockDoneSum").text(0);
                $("#stockNoSum").text(0);
            }else{
                stockNoSum=0;
                stockDoneSum=0;
                $.each(tempData,function(idx,obj){
                    (obj.confirmYn=="Y")? stockDoneSum++ : stockNoSum++;
                });
                makeDetailHtml(listData._data, keyMapArr, "#defaultHtml", "#hiddenHtml");
                $("#stockSum").text(tempData.length);
                $("#stockDoneSum").text(stockDoneSum);
                $("#stockNoSum").text(stockNoSum);
            }
        }
    });

    fnChangeynObj = function(val){
        var returnVal = "";

        if(val != null && val != ""){
            returnVal = ynObj[val];
        }

        return returnVal;
    };

    listViewClick = function(dataItem) {
        contentDetail(dataItem);
    };
</script>
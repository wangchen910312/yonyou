<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section id="content_list2" style="display:none">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title2"><spring:message code="global.lbl.stockCarList" /><!-- 재고차종 리스트 --></h2>
    </div>
    <div class="listarea">
        <div class="dlistitem listhead" id="_listhead">
            <span style="width:50%"><spring:message code="global.lbl.carLine" /><!-- 차종 --></span>
            <span style="width:50%"><spring:message code="global.lbl.vinNo" /><!-- 빈번호 --></span>
            <span style="width:50%"><spring:message code="global.lbl.ocn" /><!-- OCN명 -->/<spring:message code="global.lbl.model" /><!-- 차관 --></span>
            <span style="width:50%"><spring:message code="global.lbl.extColor" />/<spring:message code="global.lbl.intColor" /><!-- 외장색명/내장색명 --></span>
            <span style="width:50%"><spring:message code="global.lbl.stockCd" /><!-- 재고유형 --></span>
            <span style="width:50%"><spring:message code="sal.lbl.giDdCnt" /><!-- 재고일령(공장출고) --></span>
        </div>
        <div>
            <div id="listView2" style="height: 300px; overflow: scroll;"></div>
        </div>
    </div>
        <div class="btnfixed">
            <div class="dlistitem bgNone" style="text-align: left;">
                <span style="width:50%"><spring:message code='global.lbl.total' />:</span>
                <span style="width:50%" id="subTotalSum"></span>
            </div>
        </div>
</section>
<script type="text/x-kendo-template" id="template2">
    <div class="dlistitem" onclick="javascript:listViewClick2(listData2._view[#:rnum-1 #])">
        <span style="width:50%; display:none;">#:rnum #</span>
        <span style="width:50%">[#:carlineCd #]#:carlineNm #</span>
        <span style="width:50%">#:vinNo #</span>
        <span style="width:50%">#:ocnCd #/#:modelNm #</span>
        <span style="width:50%">#:extColorNm #/#:intColorCd #</span>
        <span style="width:50%">#:carStatNm #</span>
        <span style="width:50%">#:giDdCnt #(天)</span>
    </div>
</script>
<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var viewRow=10;//한번에 조회할 건수
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData2=[];//데이타를 append 시키기위한 임시데이타 변수

var listData2 = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/sal/inv/stockMnt/selectStockMntSearch.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
                params["firstIndex"] = pageIndex;
                params["lastIndex"] = pageSize;

              //재고유형
                params["tStockTp"] = $("#tStockTp").data("kendoExtDropDownList").value();
                params["sVinNo"] = $("#sVinNo").val();
                params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                params["sFscCd"] =$("#sFscCd").data("kendoExtDropDownList").value();
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
            tempData2=[];
            listData2._view=tempData2;
        }else{
            tempData2.push.apply(tempData2, this._data);
            listData2._view=tempData2;
        }

        $("#subTotalSum").text(rowTotal);
        $("#content_search, #content_detail, #content_DetailList").hide();
        $("#content_list").hide();
        $("#content_list2").show();
        $("#header_title span").attr("class","search_open");
    }
    ,error:function(e){
        console.log(e);
    }
});
function listViewClick2(dataItem){

    var sss=listData2._view[0];

    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_DetailList").css("display","block");
    $("#content_detail").css("display","none");
    $("#content_list2").css("display","none");
    $("#header_title").html(_title);


    setDetailData(dataItem,".detialListDataReadOnly input[id]");
    $("#strYnNm").val(ynObj[$("#strYn").val()]);
    $("#damageCd").data("kendoExtDropDownList").value(dataItem.damageCd); //재고유형
    $("#blockYn").data("kendoExtDropDownList").value(dataItem.blockYn); //고정
    $("#blockSaleAdvNo").data("kendoExtDropDownList").value(dataItem.blockSaleAdvNo); //판매고문
    $("#strgeCd").data("kendoExtDropDownList").value(dataItem.strgeCd); //창고
    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/sal/inv/stockState/selectLocation.do' />"
        ,data:JSON.stringify(dms.string.strNvl(dataItem.strgeCd))
        ,async:false
    });
    locDSList = responseJson.data;

    locCdObj = {};
    $.each(locDSList, function(idx, obj){
        locCdObj[locCd] = locNm;
    });
    $("#locCd").data("kendoExtDropDownList").setDataSource(locDSList);
    $("#locCd").data("kendoExtDropDownList").value(dataItem.locCd); //위치
    $("#cmpCarYn").data("kendoExtDropDownList").value(dataItem.cmpCarYn); //회사차여부
    $("#cmpCarDstinCd").data("kendoExtDropDownList").value(dataItem.cmpCarDstinCd); //회사차유형
    $("#openYnNm").val(ynObj[$("#openYn").val()]);
    $("#pltGiDt").val(chgDate2Str($("#pltGiDt").val()));
    $("#dlrGrDt").val(chgDate2Str($("#dlrGrDt").val()));
    //$("#whslPrcCurrency").val(dms.format.currency(Number($("#whslPrc").val())));

    if(dataItem.carStatCd=="50") {
        $("#damageCd").data("kendoExtDropDownList").enable(false);
        $("#blockSaleAdvNo").data("kendoExtDropDownList").enable(false);
        $("#strgeCd").data("kendoExtDropDownList").enable(false);
        $("#locCd").data("kendoExtDropDownList").enable(false);
        $("#temp2").attr("disabled",true);
        $("#temp2").addClass("showOnly");
        $("#cmpCarYn").data("kendoExtDropDownList").enable(false);
        $("#cmpCarDstinCd").data("kendoExtDropDownList").enable(false);
    }else{
        $("#damageCd").data("kendoExtDropDownList").enable(true);
        $("#blockSaleAdvNo").data("kendoExtDropDownList").enable(true);
        $("#strgeCd").data("kendoExtDropDownList").enable(true);
        $("#locCd").data("kendoExtDropDownList").enable(true);
        $("#temp2").attr("disabled",false);
        $("#temp2").removeClass("showOnly");
        $("#cmpCarYn").data("kendoExtDropDownList").enable(true);
        $("#cmpCarDstinCd").data("kendoExtDropDownList").enable(true);
    }
}
function initLis2(){
    tempData2=[];
    pageIndex = 0,rowTotal = 0;
}
$(document).ready(function() {
    $("#listView2").scroll(function(e){
        if(e.target.scrollTop == e.target.scrollHeight-e.target.clientHeight && rowTotal>pageSize){
            pageSize+=viewRow;
            pageIndex+=viewRow;
            $(this).data('kendoListView').dataSource.read();
        }
    });
    $("#listView2").height($(window).height()-($("#header").outerHeight()+$(".content_title").outerHeight()+$("#_listhead").outerHeight()+$(".btnfixed").outerHeight()));
});
</script>

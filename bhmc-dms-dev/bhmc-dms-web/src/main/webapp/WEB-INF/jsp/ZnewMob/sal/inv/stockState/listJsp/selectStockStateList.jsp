<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code="sal.title.stockiMgmt" /><!-- 재고관리 리스트 --></h2>
    </div>
    <div class="listarea">
        <div class="dlistitem listhead">
            <span style="width:50%"><spring:message code="global.lbl.carLine" /><!-- 차종 --></span>
            <span style="width:50%"><spring:message code="sal.lbl.qty" /><!-- 수량 --></span>
        </div>
        <div>
            <div id="listView" style="height: 300px; overflow: scroll;"></div>
        </div>
        <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
    </div>
        <div class="btnfixed">
            <div class="dlistitem bgNone" style="text-align: left;">
                <span style="width:50%"><spring:message code='global.lbl.total' />:</span>
                <span style="width:50%" id="totalSum"></span>
            </div>
        </div>
</section>
<script type="text/x-kendo-template" id="template">
    <div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #])">
        <span style="width:50%; display:none;">#:rnum #</span>
        <span style="width:50%">[#:carlineCd #]#:carlineNm #</span>
        <span style="width:50%">#:cnt #</span>
    </div>
</script>
<script>
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수
var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/mob/sal/inv/stockState/selectStockState.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params = {};
              //재고유형
                params["tStockTp"] = $("#tStockTp").data("kendoExtDropDownList").value();
                // vin
                params["sVinNo"] = $("#sVinNo").val();
                params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                params["sFscCd"] = $("#sFscCd").data("kendoExtDropDownList").value();
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
        var totalSum=0;
        for(var i=0; i<e.items.length; i++){
            totalSum+=e.items[i].cnt;
        }
        $("#totalSum").text(totalSum);
        $("#content_search, #content_detail").hide();
        $("#content_list").show();
        $("#header_title span").attr("class","search_open");
    }
    ,error:function(e){
        console.log(e);
    }
});
function listViewClick(dataItem){
    initLis2();
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_DetailList").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_list2").css("display","block");
    $("#sCarlineCd").data("kendoExtDropDownList").value(dataItem.carlineCd); //차종

    $("#sFscCd").data("kendoExtDropDownList").setDataSource([]);
    $("#sFscCd").data("kendoExtDropDownList").enable(true);

    if(dataItem.carlineCd == ""){
        $("#sFscCd").data("kendoExtDropDownList").setDataSource([]);
        $("#sFscCd").data("kendoExtDropDownList").enable(false);
        return false;
    }

    var responseJson = dms.ajax.getJson({
        url :"<c:url value='/sal/inv/stockMnt/selectFscList.do' />"
        ,data :JSON.stringify({"sCarlineCd":dataItem.carlineCd})
        ,async :false
    });
    $("#sFscCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
    if(responseJson.data.length == 0){
        $("#sFscCd").data("kendoExtDropDownList").setDataSource([]);
        $("#sFscCd").data("kendoExtDropDownList").enable(false);
    }

    console.log("header"+$("#header").outerHeight());
    console.log("content_title"+$("#content_list2 .content_title").outerHeight());
    console.log("_listhead"+$("#_listhead").outerHeight());
    console.log("btnfixed"+$("#content_list2 .btnfixed").outerHeight());

    listData2.read();
    $("#listView2").height($(window).outerHeight()-($("#header").outerHeight()+$("#content_list2 .content_title").outerHeight()+$("#_listhead").outerHeight()+$("#content_list2 .btnfixed").outerHeight()));
    openSearchBtn();

}
</script>

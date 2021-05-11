<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="content_list">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title"><spring:message code="par.title.stockDdDocList" /><!-- 재고실사문서 목록 --></h2>
    </div>
    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:50%"><spring:message code="par.lbl.stockDdDoc" /><!-- 재고실사문서 --></span>
            <span style="width:50%"><spring:message code="par.lbl.stockDdStatCd" /><!-- 재고실사상태 --></span>
            <span style="width:50%" class="clboth"><spring:message code="par.lbl.investigationConfPsn" /><!-- 실사확인자 --></span>
            <span style="width:50%"><spring:message code="par.lbl.investigationConfDt" /><!-- 실사확인일자 --></span>
        </div>
        <div>
            <div id="listView" style="height: 300px; overflow: scroll;"></div>
        </div>
    </div>
</section>

<script type="text/x-kendo-template" id="template">
<div class="dlistitem" onclick="javascript:listViewClick(listData._view[#:rnum-1 #]);">
    <span style="width:50%; display:none;">#:rnum #</span>
	<span style="width:50%">#:trimNull(stockDdDocNo) #</span>
    <span style="width:50%">#:changeDocStatObj(docStatCd) #</span>
    <span style="width:50%">#:trimNull(prsnNm) #</span>
    <span style="width:50%">#:chgServerDate2Str(regDt) #</span>
</div>
</script>
<script type="text/javascript">
var viewRow=10;//한번에 조회할 건수
var pageIndex = 0, pageSize = viewRow, rowTotal = 0;
var tempData=[];//데이타를 append 시키기위한 임시데이타 변수
var _stockDdDocNo=""
var listData = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/par/stm/investigation/selectInvestigationListGrid.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params={};
                params["firstIndex"] = pageIndex;
                params["lastIndex"] = pageSize;

                params["sStockDdDocNo"] = $("#sStockDdDocNo").val();
                params["sPrsnId"] = $("#sPrsnId").val();

                if($("#sRegDtFr").val() == ""){
                    params["sRegDtFr"] = null;
                    params["sRegDtTo"] = null;
                }else{
                    params["sRegDtFr"] = chgDate($("#sRegDtFr").val());
                    params["sRegDtTo"] = chgDate($("#sRegDtTo").val());
                }

                if($("#sApproveReqDtFr").val() == ""){
                    params["sApproveReqDtFr"] = null;
                    params["sApproveReqDtTo"] = null;
                }else{
                    params["sApproveReqDtFr"] = chgDate($("#sApproveReqDtFr").val());
                    params["sApproveReqDtTo"] = chgDate($("#sApproveReqDtTo").val());
                }

                params["sDocStatCd"] = $("#sDocStatCd").data("kendoExtDropDownList").value();
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
    }
    ,error:function(e){
        console.log(e);
    }
});

//입고 창고
changeStrgeCd = function(val) {
	var returnVal = "";
	if (val != null && val != "") {
		returnVal = storageObj[val];
	}
	return returnVal;
};

// 문서상태
changeDocStatObj = function(val) {
	var returnVal = "";
	if (val != null && val != "") {
		returnVal = docStatObj[val];
	}
	return returnVal;
};

function listViewClick(dataItem) {
    $("#listView2").kendoListView({
        dataSource:listData2
        ,template: kendo.template($("#template2").html())
        ,autoBind: false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#listView2").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#listView2").css({"background-image":"none"});
            }
        }
    });

	_regDt = chgServerDate2Str(dataItem.regDt);
	$("#sel1DocStatCd").val(dataItem.docStatCd);
	$("#sel1UpdtDtStr").val(dataItem.updtDtStr);
	checkDocStateCd(dataItem.sel1DocStatCd);

    $("#content_list").css("display", "none");
    $("#content_list2").css("display", "block");
    $("#content_search").css("display", "none");
    $("#content_itemList").css("display", "none");
    $("#content_detail").css("display", "none");
    $("#header_title span").attr("class", "search_hide");

    _stockDdDocNo=dataItem.stockDdDocNo;
    initList2();
	listData2.read();
    $("#listView2").height($(window).height()-($("#header").outerHeight()+$("#content_list2 > .content_title").outerHeight()+$("#content_list2 .listhead").outerHeight()+$("#content_list2 .btnfixed").outerHeight()+gap));
}
function initList(){
    tempData=[];
    pageIndex = 0,rowTotal = 0;
    pageSize = viewRow;
}
</script>

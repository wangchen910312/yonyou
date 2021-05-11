<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section id="content_list2" style="display:none;">
    <div class="content_title conttitlePrev">
        <h2 id="content_list_title2"><spring:message code="par.title.stockDdDocList" /><!-- 재고실사문서 목록 --></h2>
    </div>
    <div class="listarea">
        <div class="listhead dlistitem">
            <span style="width:50%"><spring:message code="par.lbl.stockDdDoc" /><!-- 재고실사문서 --></span>
            <span style="width:50%"><spring:message code="par.lbl.stockDdStatCd" /><!-- 재고실사상태 --></span>
            <span style="width:50%" class="clboth"><spring:message code="par.lbl.strgeNm" /><!-- 창고 --></span>
            <span style="width:50%"><spring:message code="par.lbl.investigationConfDt" /><!-- 실사확인일자 --></span>
        </div>
        <div>
            <div id="listView2" style="height: 300px; overflow: scroll;"></div>
        </div>
    </div>
    <div class="btnfixed">
        <div class="con_btnarea btncount2">
            <div style="width:50%;">
                <span class="btnd1" id="btnStockDdDocLocationListClose"><spring:message code='global.btn.close' /><!-- 닫기 --></span>
            </div>
            <dms:access viewId="VIEW-D-12700" hasPermission="${dms:getPermissionMask('READ')}">
                <div style="width:50%;padding-right:2px;">
                    <span class="btnd1" id="btnApplyReq"><spring:message code='global.btn.req' /><!-- 요청 --></span>
                </div>
            </dms:access>
        </div>
    </div>
</section>
<script type="text/x-kendo-template" id="template2">
<div class="dlistitem" onclick="javascript:listViewClick2(listData2._view[#:rnum-1 #]);">
    <span style="width:50%; display:none;">#:rnum #</span>
	<span style="width:50%">#:trimNull(stockDdDocNo) #</span>
    <span style="width:50%">#:changeDocStatObj(docStatCd) #</span>
    <span style="width:50%">#:changeStrgeCd(strgeCd) #</span>
    <span style="width:50%">#:getParentData() #</span>
</div>
</script>
<!-- chgServerDate2Str(approveReqDt) -->
<script type="text/javascript">
var viewRow2=10;//한번에 조회할 건수
var pageIndex2 = 0, pageSize2 = viewRow2, rowTotal2 = 0;
var tempData2=[];//데이타를 append 시키기위한 임시데이타 변수
var tmpDataItem = {};
var _strgeCd;
var listData2 = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/par/stm/investigation/selectInvestigationStrge.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params={};
                params["firstIndex"] = pageIndex2;
                params["lastIndex"] = pageSize2;

                params["sStockDdDocNo"]=_stockDdDocNo;
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

getParentData = function() {
    return _regDt;
};
function initList2(){
    tempData2=[];
    pageIndex2 = 0,rowTotal2 = 0;
    pageSize2 = viewRow2;
}
function listViewClick2(dataItem) {
    $("#content_list").css("display", "none");
    $("#content_list2").css("display", "none");
    $("#content_search").css("display", "none");
    $("#content_itemList").css("display", "block");
    $("#content_detail").css("display", "none");
    $("#header_title span").attr("class", "search_hide");
    $("#selStockDdDocNo").val(dataItem.stockDdDocNo);

    $("#listView3").kendoListView({
        dataSource:listData3
        ,template: kendo.template($("#template3").html())
        ,autoBind: false
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#listView3").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#listView3").css({"background-image":"none"});
            }
        }
    });
    _stockDdDocNo=dataItem.stockDdDocNo;
    _strgeCd=dataItem.strgeCd;

    if (dataItem != null) {
        partsJs.validate.groupObjAllDataSet(dataItem);
        gCrud = 'U';
    }
    tmpDataItem = dataItem;
    initList3();
    listData3.read();
    $("#listView3").height($(window).height()-($("#header").outerHeight()+$("#content_itemList > .content_title").outerHeight()+$("#content_itemList .listhead").outerHeight()+$("#content_itemList .btnfixed").outerHeight()+gap));
}
$(document).ready(function() {

});

</script>

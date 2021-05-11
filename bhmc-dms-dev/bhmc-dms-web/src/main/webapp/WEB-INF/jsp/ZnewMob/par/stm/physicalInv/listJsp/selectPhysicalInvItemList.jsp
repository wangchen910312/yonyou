<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<div class="content_right">
    <section id="content_itemList" class="content_detail" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="par.title.stockDdDocPartsList" /><!-- 재고실사문서 부품리스트 --></h2>
        </div>
        <input id="sel1DlrCd" type="hidden" />
        <input id="sel1StrgeCd" type="hidden" />
        <input id="sel1StockDdDocNo" type="hidden" />
        <input id="sel1PrsnId" type="hidden" />
        <input id="sel1DocStatCd" type="hidden" />
        <input id="sel1PltCd" type="hidden" />
        <input id="sel1StockLockYn" type="hidden" />
        <input id="sel1ApproveReqDt" type="hidden" />
        <input id="sel1EndDt" type="hidden" />
        <input id="sel1CancDt" type="hidden" />
        <input id="sel1SignOpnCont" type="hidden" />
        <input id="sel1Remark" type="hidden" />
        <input id="sel1UpdtDtStr" type="hidden" />
        <input id="selStockDdDocNo" type="hidden" />

        <div class="listarea">
            <div class="listhead dlistitem">
                <span style="width:50%"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></span>
                <span style="width:50%"><spring:message code="par.lbl.docStockQty" />/<spring:message code='par.lbl.ddQty' /><!-- 장면수량/실사수량--></span>
                <span style="width:50%"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></span>
                <span style="width:50%"><spring:message code="par.lbl.strgeCd" />/<spring:message code="par.lbl.locationCd" /><!-- 창고번호/Location --></span>
            </div>

            <div>
            <div id="listView3" style="height: 300px; overflow: scroll;"></div>
        </div>
        </div>
        <div class="btnfixed">
            <div class="con_btnarea btncount2">
                <div style="width:20%;">
                    <em style="position:relative;top:8px;font-size:14px;"><spring:message code="mob.lbl.barcode" /><!-- 바코드 --></em>
                </div>
                <div style="width:40%;margin-bottom:10px;" class="al">
                    <div class="f_text f_barc">
                        <input type="text" id="barcode" name="barcode" />
                    </div>
                </div>
                <dms:access viewId="VIEW-D-12703" hasPermission="${dms:getPermissionMask('READ')}">
                    <div style="width:20%;padding:0 2px;">
                        <span class="btnd1" id="btnBarcodeConfirm"><spring:message code='global.btn.confirm' /><!-- 확인 --></span>
                    </div>
                </dms:access>
                <dms:access viewId="VIEW-D-12702" hasPermission="${dms:getPermissionMask('READ')}">
                    <div style="width:20%;padding-left:2px;">
                        <span class="btnd1" id="btnBarcodeScan"><spring:message code='mob.lbl.scan' /><!-- 스캔 --></span>
                    </div>
                </dms:access>
            </div>
            <div class="con_btnarea">
                <div>
                    <span class="btnd1" id="btnItemListClose"><spring:message code='global.btn.close' /><!-- 닫기 --></span>
                </div>
            </div>
        </div>
    </section>
</div>

<script type="text/x-kendo-template" id="template3">
<div class="dlistitem" onclick="javascript:listViewClick3(listData3._view[#:rnum-1 #]);">
    <span style="width:50%; display:none;">#:rnum #</span>
    <span name="itemCd" style="width:50%">#:trimNull(itemCd) #</span>
    <span style="width:50%">#:fnFixNum(stockQty,1) #/#:fnFixNum(ddQty,1) #</span>
    <span style="width:50%">#:trimNull(itemNm) #</span>
    <span style="width:50%">#:changeStrgeCd(strgeCd) #/#:trimNull(locCd) #</span>

    <input type="hidden" name="itemLstStockDdDocNo" value="#:stockDdDocNo #"/>
    <input type="hidden" name="itemLstStockDdDocLineNo" value="#:stockDdDocLineNo #"/>
    <input type="hidden" name="itemLstStrgeCd" value="#:strgeCd #"/>
    <input type="hidden" name="itemLstStrgeNm" value="#: changeStrgeCd(strgeCd) #"/>
    <input type="hidden" name="itemLstLocCd" value="#:locCd #"/>
    <input type="hidden" name="itemLstItemCd" value="#:itemCd #"/>
    <input type="hidden" name="itemLstItemStatCd" value="#:itemStatCd #"/>
    <input type="hidden" name="itemLstItemStatNm" value="#:changeItemStatCd(itemStatCd) #"/>
    <input type="hidden" name="itemLstItemNm" value="#:itemNm #"/>
    <input type="hidden" name="itemLstStockQty" value="#:stockQty #"/>
    <input type="hidden" name="itemLstDdQty" value="#:ddQty #"/>
    <input type="hidden" name="itemLstDiffQty" value="#:diffQty #"/>
    <input type="hidden" name="itemLstBookQty" value="#:bookQty #"/>
    <input type="hidden" name="itemLstAmt" value="#:amt #"/>
    <input type="hidden" name="itemLstMovingAvgPrc" value="#:movingAvgPrc #"/>
    <input type="hidden" name="itemLstReasonCont" value="#:reasonCont #"/>
    <input type="hidden" name="itemLstItemDstinCn" value="#:itemDstinCd #"/>
    <input type="hidden" name="itemLstCarlineCd" value="#:carlineCd #"/>
    <input type="hidden" name="itemLstAbcInd" value="#:abcInd #"/>
    <input type="hidden" name="itemLstUnitCd" value="#:unitCd #"/>
</div>
</script>

<script type="text/javascript">
var viewRow3=10;//한번에 조회할 건수
var pageIndex3 = 0, pageSize3 = viewRow3, rowTotal3 = 0;
var tempData3=[];//데이타를 append 시키기위한 임시데이타 변수
var listData3Length = 0;
var listData3 = new kendo.data.DataSource({
    transport:{
        read:{
            url:"<c:url value='/par/stm/investigation/selectInvestigationItem.do' />"
            ,dataType:"json"
            ,type:"POST"
            ,async:false
            ,contentType:"application/json"
        }
        ,parameterMap:function(options, operation) {
            if (operation === "read") {
                var params={};
                params["firstIndex"] = pageIndex3;
                params["lastIndex"] = pageSize3;

                params["sStockDdDocNo"] = _stockDdDocNo;
                params["sStrgeCd"] = _strgeCd;
                return kendo.stringify(params);
            }
        }
    }
    ,batch:true
    ,pageSize:pageSize
    ,schema:{
        data:function (result){

            listData3Length = result.total;
            if(result.total === 0){
                //dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
            }

            return result.data;
        }
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
            tempData3=[];
            listData3._view=tempData3;
            listData3._data=tempData3;
        }else{
            for(var i=0; i<this._data.length; i++){
                this._data[i]['isSave']="";
            }
            tempData3.push.apply(tempData3, this._data);
            listData3._view=tempData3;
            listData3._data=tempData3;
            setTimeout(function() {
                $("#barcode").focus();
            }, 200);
        }
    }
    ,error:function(e){
        console.log(e);
    }
});


// 재고상태
changeItemStatCd = function(val) {
	var returnVal = "";
	if (val != null && val != "") {
		returnVal = parent.itemStatObj[val];
	}
	return returnVal;
};

//입고 창고
changeStrgeCd = function(val) {
	var returnVal = "";
	if (val != null && val != "") {
		returnVal = parent.storageObj[val];
	}
	return returnVal;
};

//로케이션
changeLocCd = function(val) {
	var returnVal = "";
	if (val != null && val != "") {
		returnVal = parent.locationObj[val];
	}
	return returnVal;
};

//손익수량 로직처리
checkDiffQty = function(val) {
	var returnVal = "";
	if (val < 0) {
		returnVal = 0;
	} else {
		returnVal = val;
	}
	return returnVal;
};

function listViewClick3(dataItem) {
	var curRow = 0;
	$.each(listData3._data, function(cnt, row) {//삭제된 데이터로 인하여 현재로 값 취득
		if (row.rowIdx == dataItem.rowIdx) {
			curRow = cnt + 1;
		}
	});
	contentDetailFromList(dataItem, curRow);
}

//바코드를 이용하여 실사 상세정보화면으로 이동
function listViewClickFromBarCodeReader(val) {
	var curRow = 0;
	var selData = {};
	$.each(listData3._data, function(cnt, row) {//삭제된 데이터로 인하여 현재로 값 취득
		if (row.itemCd == val) {
			curRow = cnt + 1;
			selData = row;
		}
	});

	if (curRow > 0) {
		contentDetailFromList(selData, curRow);
		$("#barcode").val("");
	} else {
		mob.notification.warning("<spring:message code='global.info.nonexistPhysicalInfData'/>");
		return false;
	}
}

function removeDetailListGrid(key, dataUid) {
    listData3.data([]);
    listData3.read();
    if(listData3Length === 0){
        listData.data([]);
        listData.read();
        listData2.data([]);
        listData2.read();
    }
    //listData3.remove(model); //삭제시 선택 한 데이터 삭제 후 목록 데이터 refresh.
}

function saveDetailListGrid(key, gridData) {
	listData3._data[key - 1].ddQty = gridData.ddQty;
	listData3._data[key - 1].stockQty = gridData.stockQty;
	listData3._data[key - 1].ddQty = gridData.ddQty;
	listData3._data[key - 1].diffQty = gridData.diffQty;
	listData3._data[key - 1].bookQty = gridData.bookQty;
	listData3._data[key - 1].amt = gridData.amt;
	listData3._data[key - 1].reasonCont = gridData.reasonCont;
	initList3();
	listData3.read();
}
function initList3(){
    tempData3=[];
    pageIndex3 = 0,rowTotal3 = 0;
    pageSize3 = viewRow3;
}
$(document).ready(function() {
    $("#listView3").height($(window).height()-($("#header").outerHeight()+$("#content_list_title3").outerHeight()+$(".listhead").outerHeight()+$(".btnfixed").outerHeight()+gap));
});
</script>
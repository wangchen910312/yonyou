<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div data-role="view" id="itemListView" data-before-show="mainViewLoad">
	<ul  data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick" id="detailListUL"></ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">
    <span name="itemCd" style="width:50%">#:trimNull(itemCd) #</span>
    <span style="width:50%">#:fnFixNum(stockQty,1) #/#:fnFixNum(ddQty,1) #</span>
    <span style="width:50%">#:trimNull(itemNm) #</span>
    <span style="width:50%">#:changeStrgeCd(strgeCd) #/#:trimNull(locCd) #</span>

    <input type="hidden" name="itemLstStockDdDocNo" value="#:stockDdDocNo #"/>
    <input type="hidden" name="itemLstStockDdDocLineNo" value="#:stockDdDocLineNo #"/>
    <input type="hidden" name="itemLstStrgeCd" value="#:strgeCd #"/>
    <input type="hidden" name="itemLstStrgeNm" value="#:strgeNm #"/>
    <input type="hidden" name="itemLstLocCd" value="#:locCd #"/>
    <input type="hidden" name="itemLstItemCd" value="#:itemCd #"/>
    <input type="hidden" name="itemLstItemStatCd" value="#:itemStatCd #"/>
    <input type="hidden" name="itemLstItemStatNm" value="#:itemStatNm #"/>
    <input type="hidden" name="itemLstItemNm" value="#:itemNm #"/>
    <input type="hidden" name="itemLstStockQty" value="#:stockQty #"/>
    <input type="hidden" name="itemLstDdQty" value="#:ddQty #"/>
    <input type="hidden" name="itemLstDiffQty" value="#:diffQty #"/>
    <input type="hidden" name="itemLstBookQty" value="#:bookQty #"/>
    <input type="hidden" name="itemLstAmt" value="#:amt #"/>
    <input type="hidden" name="itemLstMovingAvgPrc" value="#:movingAvgPrc #"/>
    <input type="hidden" name="itemLstReasonCont" value="#:reasonCont #"/>
    <input type="hidden" name="itemLstItemDstinCn" value="#:itemDstinCn #"/>
    <input type="hidden" name="itemLstCarlineCd" value="#:carlineCd #"/>
    <input type="hidden" name="itemLstAbcInd" value="#:abcInd #"/>
    <input type="hidden" name="itemLstUnitCd" value="#:unitCd #"/>
</div>
</script>

<script type="text/javascript">

var pageIndex = 0
	,pageSize = 100
	,rowIndex = 0
	,rowTotal = 1000;
// datasource below is customized for demo purposes.

var listData = new kendo.data.DataSource({
	transport : {
		read : function(options) {

			if (rowIndex >= rowTotal) {
				return;
			}
			app.showLoading();
			pageIndex++;

			var params = {};
			params["recordCountPerPage"] = pageSize;
			params["pageIndex"] = pageIndex;
			params["firstIndex"] = (pageIndex - 1) * pageSize;
			params["lastIndex"] = pageIndex * pageSize;
			params["sort"] = null;

			params["sStockDdDocNo"] = "${stockDdDocNo}";
			params["sStrgeCd"] = "${strgeCd}";

			$.ajax({
				//url : "<c:url value='/mob/par/stm/physicalInv/selectPhysicalInvItemLists.do' />",
				url : "<c:url value='/par/stm/investigation/selectInvestigationItem.do' />",
				data : JSON.stringify(params),
				type : 'POST',
				dataType : 'json',
				contentType : 'application/json',
				error : function(jqXHR, status, error) {
					app.hideLoading();
				},
				success : function(result) {
					checklistCnt("listarea_noData_sub1", result.total, noDatamsg);
					if (result.data != null && result.data != "") {
						var data = [];
						rowTotal = result.total;

						$.each(result.data, function(i, row) {
							rowIndex++;
							data.push({
								pageIdx : pageIndex,
								rowIdx : rowIndex,
								dlrCd : row.dlrCd,

								stockDdDocNo : row.stockDdDocNo,
								stockDdDocLineNo : row.stockDdDocLineNo,
								strgeCd : row.strgeCd,
								strgeNm : changeStrgeCd(row.strgeCd),
								locCd : row.locCd,
								locNm : changeLocCd(row.locNm),
								itemCd : row.itemCd,
								itemStatCd : row.itemStatCd,
								itemStatNm : changeItemStatCd(row.itemStatCd),
								itemNm : row.itemNm,
								stockQty : row.stockQty,
								ddQty : row.ddQty,
								diffQty : row.diffQty,
								bookQty : row.bookQty,
								amt : row.amt,
								movingAvgPrc : row.movingAvgPrc,
								reasonCont : row.reasonCont,
								itemDstinCn : row.itemDstinCd,
								carlineCd : row.carlineCd,
								abcInd : row.abcInd,
								lastGrDt : row.lastGrDt,
								lastGiDt : row.lastGiDt,
								unitCd : row.unitCd,
								itemDstinCd : row.itemDstinCd,

								isSave : ""
							});
						});
						options.success(data);
						app.hideLoading();
						setTimeout(function() {
							parent.$("#barcode").focus();
						}, 200);
					} else {
						app.hideLoading();
					}
				}
			});
		}
	},

	pageSize : pageSize,
	serverPaging : true,
	schema : {
		total : function() {
			return rowTotal;
		}
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

function listViewClick(e) {
	var curRow = 0;
	$.each(listData._data, function(cnt, row) {//삭제된 데이터로 인하여 현재로 값 취득
		if (row.rowIdx == e.dataItem.rowIdx) {
			curRow = cnt + 1;
		}
	});
	parent.contentDetailFromList(e.dataItem, curRow);
}

//바코드를 이용하여 실사 상세정보화면으로 이동
function listViewClickFromBarCodeReader(val) {
	var curRow = 0;
	var selData = {};
	$.each(listData._data, function(cnt, row) {//삭제된 데이터로 인하여 현재로 값 취득
		if (row.itemCd == val) {
			curRow = cnt + 1;
			selData = row;
		}
	});

	if (curRow > 0) {
		parent.contentDetailFromList(selData, curRow);
		parent.$("#barcode").val("");
	} else {
		parent.mob.notification.warning("<spring:message code='global.info.nonexistPhysicalInfData'/>");
		return false;
	}
}

function removeDetailListGrid(key, dataUid) {
	var model = listData.getByUid(dataUid);
	listData.remove(model); //삭제시 선택 한 데이터 삭제 후 목록 데이터 refresh.
// 	parent.detailDeleteByIframe(key, dataUid);
}

function saveDetailListGrid(key, gridData) {
	listData._data[key - 1].ddQty = gridData.ddQty;
	listData._data[key - 1].stockQty = gridData.stockQty;
	listData._data[key - 1].ddQty = gridData.ddQty;
	listData._data[key - 1].diffQty = gridData.diffQty;
	listData._data[key - 1].bookQty = gridData.bookQty;
	listData._data[key - 1].amt = gridData.amt;
	listData._data[key - 1].reasonCont = gridData.reasonCont;
	$("#detailListUL").data("kendoMobileListView").refresh();
// 	parent.detailSaveByIframe(key, gridData);
}

var app = setKendoMobApp();
</script>
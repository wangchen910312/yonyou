﻿﻿﻿<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div data-role="view">
	<ul data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick" ></ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">
	<span style="width:50%">#:trimNull(stockDdDocNo) #</span>
    <span style="width:50%">#:changeDocStatObj(sel1DocStatCd) #</span>
    <span style="width:50%">#:trimNull(sel1PrsnNm) #</span>
    <span style="width:50%">#:chgServerDate2Str(regDt) #</span>
</div>
</script>

<script type="text/javascript">
var pageIndex = 0
	,pageSize = 100
	,rowIndex = 0
	,rowTotal = 40000;

// datasource below is customized for demo purposes.
var listData = new kendo.data.DataSource({
	transport:{
    	read:function(options) {
			if (rowIndex >= rowTotal){
			    app.hideLoading();
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

			//params["sStrgeCd"] = parent.$("#sStrgeCd").data("kendoExtDropDownList").value();
			params["sStockDdDocNo"] = parent.$("#sStockDdDocNo").val();
			params["sPrsnId"] = parent.$("#sPrsnId").val();

			if(parent.$("#sRegDtFr").val() == ""){
			    params["sRegDtFr"] = null;
			    params["sRegDtTo"] = null;
			}else{
			    params["sRegDtFr"] = chgDate(parent.$("#sRegDtFr").val());
			    params["sRegDtTo"] = chgDate(parent.$("#sRegDtTo").val());
			}

			if(parent.$("#sApproveReqDtFr").val() == ""){
			    params["sApproveReqDtFr"] = null;
			    params["sApproveReqDtTo"] = null;
			}else{
			    params["sApproveReqDtFr"] = chgDate(parent.$("#sApproveReqDtFr").val());
			    params["sApproveReqDtTo"] = chgDate(parent.$("#sApproveReqDtTo").val());
			}

			params["sDocStatCd"] = parent.$("#sDocStatCd").data("kendoExtDropDownList").value();


			$.ajax({
				url : "<c:url value='/par/stm/investigation/selectInvestigationListGrid.do' />",
				data : JSON.stringify(params),
				type : 'POST',
				dataType : 'json',
				contentType : 'application/json',
				error : function(jqXHR, status, error) {
					app.hideLoading();
				},
				success : function(result) {
					checklistCnt("listarea_noData", result.total, noDatamsg);
					if (result.data != null && result.data != "") {
						var data = [];
						rowTotal = result.data.length;

						$.each(result.data, function(i, row) {
							rowIndex++;
							data.push({
								pageIdx : pageIndex,
								rowIdx : rowIndex,
								dlrCd : row.dlrCd,
								regDt : row.regDt,
								strgeCd : row.strgeCd,
								stockDdDocNo : row.stockDdDocNo,
								prsnId : row.prsnId,

								sel1DlrCd : row.dlrCd,
								sel1RegDt : row.regDt,
								sel1StrgeCd : row.strgeCd,
								sel1StockDdDocNo : row.stockDdDocNo,
								sel1PrsnId : row.prsnId,
								sel1PrsnNm : row.prsnNm,
								sel1DocStatCd : row.docStatCd,
								sel1PltCd : row.pltCd,
								sel1StockLockYn : row.stockLockYn,
								sel1ApproveReqDt : row.approveReqDt,
								sel1EndDt : row.endDt,
								sel1CancDt : row.cancDt,
								sel1SignOpnCont : row.signOpnCont,
								sel1Remark : row.remark,
								sel1UpdtDtStr : row.updtDtStr

							});
						});
						options.success(data);
						app.hideLoading();
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

//입고 창고
changeStrgeCd = function(val) {
	var returnVal = "";
	if (val != null && val != "") {
		returnVal = parent.storageObj[val];
	}
	return returnVal;
};

// 문서상태
changeDocStatObj = function(val) {
	var returnVal = "";
	if (val != null && val != "") {
		returnVal = parent.docStatObj[val];
	}
	return returnVal;
};

function listViewClick(e) {
	/* parent.contentItemListFromList(e.dataItem);//부품리스트 보기 */
	parent._regDt = chgServerDate2Str(e.dataItem.regDt);
	parent.$("#sel1DocStatCd").val(e.dataItem.sel1DocStatCd);
	parent.$("#sel1UpdtDtStr").val(e.dataItem.sel1UpdtDtStr);
	parent.checkDocStateCd(e.dataItem.sel1DocStatCd);
	parent.contentLocationListFromList(e.dataItem);

}

var app = setKendoMobApp();
</script>

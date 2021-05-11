﻿﻿﻿<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div data-role="view">
	<ul data-role="listview" data-source="listData" data-endless-scroll="true" data-template="list-template" data-click="listViewClick" ></ul>
</div>

<script type="text/x-kendo-template" id="list-template">
<div class="dlistitem">
	<span style="width:50%">#:trimNull(rowData.stockDdDocNo) #</span>
    <span style="width:50%">#:changeDocStatObj(rowData.docStatCd) #</span>
    <span style="width:50%">#:changeStrgeCd(rowData.strgeCd) #</span>
    <span style="width:50%">#:getParentData() #</span>
</div>
</script>
<!-- chgServerDate2Str(rowData.approveReqDt) -->
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

			//params["dlrCd"]="${dlrCd}";
			params["sStockDdDocNo"]="${stockDdDocNo}";

			$.ajax({
				url : "<c:url value='/par/stm/investigation/selectInvestigationStrge.do' />",
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
							data.push({rowData:result.data[i]});
						});
						//data.push({'_regDt':parent._regDt});
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

getParentData = function() {
    return parent._regDt;
};

function listViewClick(e) {
	/* parent.contentItemListFromList(e.dataItem);//부품리스트 보기
	parent.$("#sel1DocStatCd").val(e.dataItem.sel1DocStatCd);
	parent.$("#sel1UpdtDtStr").val(e.dataItem.sel1UpdtDtStr);
	parent.checkDocStateCd(e.dataItem.sel1DocStatCd); */

    parent.contentItemListFromList(e.dataItem.rowData);//부품리스트 보기
    /* parent.$("#sel1DocStatCd").val(e.dataItem.rowData.strgeCd);
    parent.$("#sel1UpdtDtStr").val(parent.chgDate2TimeStr(e.dataItem.rowData.approveReqDt));
    parent.checkDocStateCd(e.dataItem.rowData.strgeCd); */

}
/* function listViewClick(e){
    parent.contentDetail(e.dataItem.rowData);
} */
var app = setKendoMobApp();
</script>

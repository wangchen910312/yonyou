<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<section id="content">
	<!-- content_list -->
	<!-- 재고실사문서 목록 -->
    <c:import url="/WEB-INF/jsp/ZnewMob/par/stm/physicalInv/listJsp/selectPhysicalInvList.jsp" />
    <c:import url="/WEB-INF/jsp/ZnewMob/par/stm/physicalInv/listJsp/selectPhysicalInvLocList.jsp" />
	<!-- content_search -->
	<!-- 재고실사문서 조회조건  -->
	<section id="content_search" class="content_search" style="display:none;">
		<div class="content_title conttitlePrev">
			<h2><spring:message code="par.title.stockDdDocSearchCondition" /><!-- 재고실사문서 조회조건  --></h2>
		</div>
		<div class="formarea">
			<table class="flist01">
				<caption></caption>
				<colgroup>
					<col style="width:30%;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><spring:message code="par.lbl.stockDdDoc" /><!-- 재고실사문서 --></th>
						<td>
							<div class="f_text">
								<input type="text" id="sStockDdDocNo" class="form_input" style="width:100%">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><spring:message code="par.lbl.stockDdStatCd" /><!-- 재고실사상태 --></th>
						<td>
							<div class="f_text">
								<input type="text" id="sDocStatCd" class="form_comboBox" style="width:100%" />
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><spring:message code="par.lbl.investigationPrsId" /><!-- 재고실사 담당자 --></th>
						<td>
							<div class="f_text">
								<input type="text" id="sPrsnId" class="form_input" style="width:100%">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><spring:message code="par.lbl.regDt" /><!-- 생성일자 --></th>
						<td class="f_term">
							<div class="f_item01" style="width:82%">
                                <input type="date" id="sRegDtFr" style="width:140px; background-color: #ffffff;" />
								<!-- <input type="search" id="sRegDtFr" style="width:140px" />
								<span class="date" onclick="calpicker('sRegDtFr');"></span> -->
							</div>
							<span class="termtext"> ∼</span>
							<div class="f_item01" style="width:82%">
                                <input type="date" id="sRegDtTo" style="width:140px; background-color: #ffffff;" />
								<!-- <input type="search" id="sRegDtTo" style="width:140px" />
								<span class="date" onclick="calpicker('sRegDtTo');"></span> -->
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><spring:message code="par.lbl.approveReqDt" /><!-- 승인요청일자 --></th>
						<td class="f_term">
							<div class="f_item01" style="width:82%">
                                <input type="date" id="sApproveReqDtFr" style="width:140px; background-color: #ffffff;" />
								<!-- <input type="search" id="sApproveReqDtFr" style="width:140px" />
								<span class="date" onclick="calpicker('sApproveReqDtFr');"></span> -->
							</div>
							<span class="termtext"> ∼</span>
							<div class="f_item01" style="width:82%">
                                <input type="date" id="sApproveReqDtTo" style="width:140px; background-color: #ffffff;" />
								<!-- <input type="search" id="sApproveReqDtTo" style="width:140px" />
								<span class="date" onclick="calpicker('sApproveReqDtTo');"></span> -->
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="con_btnarea">
			<dms:access viewId="VIEW-D-12704" hasPermission="${dms:getPermissionMask('READ')}">
				<span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
			</dms:access>
		</div>
	</section>

	<!-- content_detail -->
	<!-- 재고실사문서 부품리스트 -->
    <c:import url="/WEB-INF/jsp/ZnewMob/par/stm/physicalInv/listJsp/selectPhysicalInvItemList.jsp" />

	<!-- content_detail -->
	<!-- 재고실사 결과등록 -->
	<div class="content_right" id="itemForm">
		<!-- content_detail -->
		<section id="content_detail" class="content_detail" style="display:none">
			<div class="content_title conttitlePrev">
				<h2><spring:message code="par.menu.stockResultInvest" /><!-- 재고실사 결과등록 --></h2>
			</div>
			<input id="dlrCd" type="hidden" />
			<input id="unitCd" type="hidden" />
			<input id="stockDdDocNo" type="hidden" />
			<input id="stockDdDocLineNo" type="hidden" />
			<input id="itemStatCd" type="hidden" />
			<input id="docStatCd" type="hidden" />
			<input id="curRowIdx" type="hidden" />
			<input id="curDataUid" type="hidden" />
			<input id="diffQty" type="hidden" />
			<input id="bookQty" type="hidden" />
			<input id="amt" type="hidden" />
			<input id="stockItemPlusQty" type="hidden" />
			<input id="stockItemPlusPrc" type="hidden" />
			<input id="stockItemMinusQty" type="hidden" />
			<input id="stockItemMinusPrc" type="hidden" />

			<div class="formarea">
				<table class="flist01">
					<caption></caption>
					<colgroup>
						<col style="width:30%;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
							<td>
								<div class="f_text f_disabled">
									<input id="itemCd" type="text" placeholder="" disabled="disabled" />
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
							<td>
								<div class="f_text f_disabled">
									<input id="itemNm" type="text" placeholder="" disabled="disabled" />
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><spring:message code='par.lbl.strgeCd'  /><!-- 창고번호 --></th>
							<td>
								<div class="f_text">
									<input id="strgeCd" type="text" class="form_comboBox" data-type="combo" data-mandatory="true" />
								</div>
							</td>
						</tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.locationCd' /><!-- Location --></th>
                            <td>
                                <div class="f_text">
                                    <input id="locCd" type="text" placeholder="" disabled="disabled" />
                                </div>
                            </td>
                        </tr>
						<tr>
							<th scope="row"><spring:message code='par.lbl.itemDstinCd' /><!-- 품목유형 --></th>
							<td>
								<div class="f_text f_disabled">
									<input id="itemDstinNm" type="text" placeholder="" disabled="disabled" />
									<input id="itemDstinCd" type="hidden" />
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><spring:message code='par.lbl.carLine' /><!-- 차종명칭 --></th>
							<td>
								<div class="f_text f_disabled">
									<input id="carlineCd" type="text" placeholder="" disabled="disabled" />
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><spring:message code='par.lbl.abcInd' /><!-- Class --></th>
							<td>
								<div class="f_text f_disabled">
									<input id="abcInd" type="text" placeholder="" disabled="disabled" />
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><spring:message code="par.lbl.docStockQty" /><!-- 장면재고 --></th>
							<td>
								<div class="f_text f_disabled">
									<input id="stockQty" type="text" placeholder="" disabled="disabled" />
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><spring:message code="par.lbl.ddQty" /><!-- 실사수량 --></th>
							<td>
								<div class="f_text">
									<input id="ddQty" type="number" placeholder="" onblur="calcul_Qty();" onkeypress='numValidate(event)' />
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><spring:message code="par.lbl.stockCost" /><!-- 단가 --></th>
							<td>
								<div class="f_text f_disabled">
									<input id="movingAvgPrc" type="text" placeholder="" disabled="disabled" />
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="con_btnarea btncount3">
				<div><span id="detailConfirmBtn" class="btnd1"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>

				<dms:access viewId="VIEW-D-12698" hasPermission="${dms:getPermissionMask('READ')}">
				<div><span id="btnDel_inc" class="btnd1"><spring:message code='global.btn.del' /><!-- 삭제 --></span></div>
				</dms:access>

				<dms:access viewId="VIEW-D-12697" hasPermission="${dms:getPermissionMask('READ')}">
				<div><span id="btnSave_inc" class="btnd1"><spring:message code='global.btn.save' /><!-- 저장 --></span></div>
				</dms:access>
			</div>
		</section>

		<section class="lay_pop" id="lay_01" style="left:25px;top:930px">
			<div class="lay_title">
				<h1><spring:message code='par.lbl.remark' /><!-- 비고 --></h1>
			</div>
			<div class="lay_cont">
				<div class="formarea">
					<table class="flist01">
						<caption><spring:message code='par.lbl.remark' var='remarkCd' /><!-- 비고 --></caption>
						<tbody>
							<tr>
								<td>
									<textarea rows="4" cols="" id="remark" class="f_textarea" placeholder="<spring:message code='global.info.validation.required' arguments='${remarkCd}' /> "></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="btnarea">
				<span class="btnd1t2" onclick="layerClose('.lay_pop')"><spring:message code='global.btn.cancel' /><!-- 취소 --></span>

				<dms:access viewId="VIEW-D-12695" hasPermission="${dms:getPermissionMask('READ')}">
				<span class="btnd1" onclick="layerClose('.lay_pop');doSaveInclude();"><spring:message code="global.btn.save" /><!-- 저장 --></span>
				</dms:access>
			</div>
		</section>

	</div>

	<div id="docu_prev"><spring:message code="global.btn.pre" /><!-- 이전 --></div>
</section>

<!-- script -->
<script type="text/javascript">
var dateFormat = '<dms:configValue code="dateFormat" />'
	,dlrCd = "${dlrCd}"
	,docStatList = []
	,docStatObj = {}
	,gCrud
	,itemStatObj = {}
	,itemDstinCdObj = {}
	,locationListObj = {}
	,locationObj = {}
	,saveList = []
	,sevenDtBf = "${sevenDtBf}"
	,storageList = []
	,storageObj = {}
	,toDt = "${toDt}";

//창고
storageObj[' '] = "";
<c:forEach var="obj" items="${storageList}" varStatus="status">
storageList.push({
	"cmmCd" : "${obj.strgeCd}",
	"cmmCdNm" : "${obj.strgeNm}"
});
storageObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

//품목유형
itemDstinCdObj[' '] = "";
<c:forEach var="obj" items="${itemDstinList}" varStatus="status">
itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//재고실사상태
<c:forEach var="obj" items="${docStatList}" varStatus="status">
docStatList.push({
	"cmmCd" : "${obj.cmmCd}",
	"cmmCdNm" : "${obj.cmmCdNm}",
	"useYn" : "${obj.useYn}"
});
docStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

itemStatObj[' '] = "";
<c:forEach var="obj" items="${itemStatList}" varStatus="status">
	itemStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

var _regDt;
var gap = 10; //listView height adj

$(document).ready(function() {

	//재고실사문서 조회조건
	//조회조건 - 재고실사상태
	$("#sDocStatCd").kendoExtDropDownList({
		dataTextField : "cmmCdNm",
		dataValueField : "cmmCd",
		//dataSource : dms.data.cmmCdFilter(docStatList),
		dataSource : docStatList,
		index : 0,
		optionLabel : "<spring:message code='global.lbl.check' />" // 선택
	}).data("kendoExtDropDownList").value("RGST");

	//재고실사 결과등록 입력 폼
	//재고실사 결과등록 - 창고
	$("#strgeCd").kendoExtDropDownList({
		dataTextField : "cmmCdNm",
		dataValueField : "cmmCd",
		dataSource : storageList,
		index : 0,
		optionLabel : "<spring:message code='global.lbl.check' />" // 선택
	});


	if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
		return false;
	}
	partsJs.validate.groupObjAllDataInit();
	gCrud = 'C';

	// 타이틀
	$("#header_title")
	.on("click", moveSearch)
	.html("<span class='search_open'><spring:message code='par.menu.stockResultInvest' /></span>");

	var sRegDtFr = $("#sRegDtFr");
	var sRegDtTo = $("#sRegDtTo");


	// 재고실사 문서목록 - 조회
	$("#btnSearch").click(function() {
	    initList();
		contentList();
	});

	// 재고실사문서 부품리스트 - 요청
	$("#btnApplyReq").click(function() {
		confirmOpen(confirmMsgSave, 'doApplyReq', y, n);
	});

	// 재고실사문서창고리스트 - 닫기
    $("#btnStockDdDocLocationListClose").click(function() {
        //backFromItemList();
        $("#docu_prev").click();
    });

	// 재고실사문서 부품리스트 - 닫기
	$("#btnItemListClose").click(function() {
	    contentListNonRefresh_();
	});

	// 재고실사문서 부품리스트 - 확인(바코드)
	$("#btnBarcodeConfirm").click(function() {
		//setCheckItemList();
		if ($("#btnBarcodeConfirm").hasClass("disabled")) {
			return false;
		}
		checkBarcode();
	});

	$("#barcode").keyup(function(e) {
		if (e.keyCode == 120) { // pda 바코드 스캔키 (노란색버튼)
			var barcode = "";
			barcode = $("#barcode").val();
			setTimeout(function() {
				changeBarCode(e.keyCode);
			}, 500);
		}
	});

	// 재고실사문서 부품리스트 - 스캔
	$("#btnBarcodeScan").click(function() {
		//setCheckItemList();
		if ($("#btnBarcodeScan").hasClass("disabled")) {
			return false;
		}
		scanBarcode();
	});

	//버튼 - 이전
	$("#docu_prev").bind("click", function() {
		if ($("#content_list").css("display") == "block") {
			goMain();
		} else if ($("#content_list2").css("display") == "block") {
		    contentListNonRefresh();
		    $("#content_list2").hide();
        } else if ($("#content_search").css("display") == "block") {
			contentListNonRefresh();
		} else if ($("#content_itemList").css("display") == "block") {
		    contentListNonRefresh_();
		} else if ($("#content_detail").css("display") == "block") {
			contentItemListNonRefresh($("#sel1StockDdDocNo").val());
			//setCheckItemList();
		}
	});

	$("#listView").kendoListView({
        dataSource:listData
        ,template: kendo.template($("#template").html())
        ,autoBind: true
        ,dataBinding: function(e) {
            if(e.items.length == 0){
                $("#listView").css(
                        {"background-image":"url("+"<c:url value='/resources/img/mob/bg_nodata.png' />"+")"
                            ,"background-repeat":"no-repeat"
                            ,"background-position":"center"});
            }else{
                $("#listView").css({"background-image":"none"});
            }
        }
    });

	$("#listView").height($(window).height()-($("#header").outerHeight()+$("#content_list .conttitlePrev").outerHeight()+$("#content_list .listhead").outerHeight()+gap));
    $("#listView").scroll(function(e){
        if(e.target.scrollTop == e.target.scrollHeight-e.target.clientHeight && rowTotal>pageSize){
            pageSize+=viewRow;
            pageIndex+=viewRow;
            //$(this).data('kendoListView').dataSource.read();
            listData.read();
        }
    });
    $("#listView2").scroll(function(e){
        if(e.target.scrollTop == e.target.scrollHeight-e.target.clientHeight && rowTotal2>pageSize2){
            pageSize2+=viewRow2;
            pageIndex2+=viewRow2;
            //$("#listView2").data('kendoListView').dataSource.read();
            listData2.read();
        }
    });
    $("#listView3").scroll(function(e){
        if(e.target.scrollTop == e.target.scrollHeight-e.target.clientHeight && rowTotal3>pageSize3){
            pageSize3+=viewRow3;
            pageIndex3+=viewRow3;
            //$("#listView2").data('kendoListView').dataSource.read();
            listData3.read();
        }
    });

});

function contentListNonRefresh_(){
    $("#content_search").css("display", "none");
    $("#content_itemList").css("display", "none");
    $("#content_detail").css("display", "none");
    $("#content_list").css("display", "none");
    $("#content_list2").css("display", "block");
}

function changeBarCode(keyCode) {
	var barcode = $("#barcode").val();
	if ($("#btnBarcodeConfirm").hasClass("disabled")) {
		return false;
	}
	checkBarcode();
}

/* function backFromItemList() {
	var checkCnt = 0;
	var checkedCodeLst = [];
	$("#detailList").contents().find("input[name='isSave']").each(function(cnt) {
		var checked = $("#detailList").contents().find("input[name='isSave']")[cnt].checked;
		if (checked) {
			checkCnt++;
			var code = $(this).parent().parent().find("span[name='itemCd']").text();
			checkedCodeLst.push(code);
		}
	});

	if (checkCnt > 0) {
		setTimeout(function() {
			for (var i = 0; i < checkedCodeLst.length; i++) {
				$("#detailList")
				.contents()
				.find("input[name='isSave']")
				.each(function(cnt) {
					var code = $(this).parent().parent().find("span[name='itemCd']").text();
					if (code == checkedCodeLst[i]) {
						$("#detailList").contents().find("input[name='isSave']")[cnt].checked = true;
					}
				});
			}
		}, 200);
	} else {
		contentList();
	}
} */

function doApplyReq() {

	var data = {
		"investigationVO" : {
			stockDdDocNo:$("#selStockDdDocNo").val(),
			updtDtStr:$("#sel1UpdtDtStr").val(),
			remark:$("#remark").val()
		}
	};

	$.ajax({
		url : "<c:url value='/par/stm/investigation/updateInvestigationApplyReq.do' />",
		data : kendo.stringify(data),
		type : 'POST',
		dataType : 'json',
		contentType : 'application/json',
		async : false,
		success : function(result) {
			if (result === 1) {
				mob.notification.info("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.modifySuccessParam' arguments='${stockDdDoc}'/>");
				initList();
				contentList();
			} else {
				if (result === 0) {
					mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
				} else {
					mob.notification.error("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.err.modifyFailedParam' arguments='${stockDdDoc}'/>");
				}
			}
			mob.loading.hide();
		},
		error : function(jqXHR, status, error) {
			mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
			mob.loading.hide();
		}
	});
}

//목록페이지 보기
function contentList() {
	$("#content_search").css("display", "none");
	$("#content_itemList").css("display", "none");
	$("#content_detail").css("display", "none");
	$("#content_list").css("display", "block");
	$("#content_list2").css("display", "none");
	$("#header_title span").attr("class", "search_open");
	listData.read();
}

//검색페이지 보기
function contentSearch() {
	$("#content_list").css("display", "none");
	$("#content_itemList").css("display", "none");
	$("#content_detail").css("display", "none");
	$("#content_search").css("display", "block");
	$("#content_list2").css("display", "none");
}

//부품리스트 보기
function contentItemList(key) {
	$("#content_list").css("display", "none");
	$("#content_search").css("display", "none");
	$("#content_itemList").css("display", "block");
	$("#content_detail").css("display", "none");
	$("#content_list2").css("display", "none");

	// 부품리스트 조회
	$("#selStockDdDocNo").val(key);
	mob.loading.show();
	$("#detailList").attr("src", "<c:url value='/mob/par/stm/physicalInv/selectPhysicalInvItemList.do' />");
}

//부품리스트 보기(리스트에서 클릭할때)
var tmpDataItem = {};
function contentItemListFromList(dataItem) {
	$("#content_list").css("display", "none");
	$("#content_list2").css("display", "none");
	$("#content_search").css("display", "none");
	$("#content_itemList").css("display", "block");
	$("#content_detail").css("display", "none");
	$("#header_title span").attr("class", "search_hide");
	//setMainListHeight();
	setMainListHeightId("#detailList",150);
	$("#selStockDdDocNo").val(dataItem.stockDdDocNo);
	mob.loading.show();
	$("#detailList").attr("src","<c:url value='/mob/par/stm/physicalInv/selectPhysicalInvItemList.do?stockDdDocNo="+dataItem.stockDdDocNo+"&strgeCd="+dataItem.strgeCd+"' />");
	if (dataItem != null) {
		partsJs.validate.groupObjAllDataSet(dataItem);
		gCrud = 'U';
	}
// 	resetPreData();
	tmpDataItem = dataItem;
}



// function resetPreData() {
// 	$("#btnApplyReq").addClass("disabled");
// }

//부품리스트 보기
function contentItemListNonRefresh(key) {
	$("#content_list").css("display", "none");
	$("#content_list2").css("display", "none");
	$("#content_search").css("display", "none");
	$("#content_itemList").css("display", "block");
	$("#content_detail").css("display", "none");
	$("#sel1StockDdDocNo").val(key);
}

//상세페이지 보기
/* function contentDetailFromBarcode(itemCd) {
	if (itemCd != null && itemCd != "") {
		var dataItem = {};
		$("iframe[name='detailList']")
		.contents()
		.find("input[name='isSave']")
		.each(function(cnt) {
			var _parent = $(this).parent().parent();

			if (_parent.find("span[name='itemCd']").text() == itemCd) {
				dataItem.stockDdDocNo = _parent.find("input[name='itemLstStockDdDocNo']").val();
				dataItem.stockDdDocLineNo = _parent.find("input[name='itemLstStockDdDocLineNo']").val();
				dataItem.strgeCd = _parent.find("input[name='itemLstStrgeCd']").val();
				dataItem.strgeNm = _parent.find("input[name='itemLstStrgeNm']").val();
				dataItem.locCd = _parent.find("input[name='itemLstLocCd']").val();
				dataItem.itemCd = _parent.find("input[name='itemLstItemCd']").val();
				dataItem.statCd = _parent.find("input[name='itemLstItemStatCd']").val();
				dataItem.itemStatCd = _parent.find("input[name='itemLstItemStatCd']").val();
				dataItem.itemStatNm = _parent.find("input[name='itemLstItemStatNm']").val();
				dataItem.lstItemNm = _parent.find("input[name='itemLstItemNm']").val();
				dataItem.stockQty = _parent.find("input[name='itemLstStockQty']").val();
				dataItem.ddQty = _parent.find("input[name='itemLstDdQty']").val();
				dataItem.diffQty = _parent.find("input[name='itemLstDiffQty']").val();
				dataItem.bookQty = _parent.find("input[name='itemLstBookQty']").val();
				dataItem.amt = _parent.find("input[name='itemLstAmt']").val();
				dataItem.movingAvgPrc = _parent.find("input[name='itemLstMovingAvgPrc']").val();
				dataItem.itemDstinCn = _parent.find("input[name='itemLstItemDstinCn']").val();
				dataItem.carlineCd = _parent.find("input[name='itemLstCarlineCd']").val();
				dataItem.abcInd = _parent.find("input[name='itemLstAbcInd']").val();
				dataItem.unitCd = _parent.find("input[name='itemLstUnitCd']").val();
				return false;
			}
		});
		contentDetailFromList(dataItem);
	}
} */

//실사대상 상세저장 후 부품리스트 목록이동
function contentItemListFromDetailSave(key, gridData) {
	$("#content_list").css("display", "none");
	$("#content_list2").css("display", "none");
	$("#content_search").css("display", "none");
	$("#content_itemList").css("display", "block");
	$("#content_detail").css("display", "none");
	saveDetailListGrid(key, gridData);
}

function contentItemListFromDetailDelete(key, dataUid) {
	$("#content_list").css("display", "none");
	$("#content_list2").css("display", "none");
	$("#content_search").css("display", "none");
	$("#content_itemList").css("display", "block");
	$("#content_detail").css("display", "none");
	removeDetailListGrid(key, dataUid);
}

//버튼 - 저장
function scanBarcode() {
	var userAgent = navigator.userAgent.toLowerCase();
    if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1)|| (userAgent.search("ipad") > -1))
    {
		document.location = 'bhmccp://openBarcodeReader?type=etc&return_func=resultOpenBarcode';
	} else {
		try {
			window.bhmccp.openBarcodeReader('etc', 'N','resultOpenBarcode');
		} catch (e) {
			resultOpenBarcode('Y');
		}
	}
}

function resultOpenBarcode(param) {
	listViewClickFromBarCodeReader(param);
}

function checkBarcode() {
	var str = $("#barcode").val();
	var curCharLen = 0;
	var spaceCnt = 0;
	//두번째 공백 위치 구하기
	var secondSpaceDigit = str.length;
	for (var i = 0; i < str.length; i++) {
		if (' ' == str.charAt(i)) {
			spaceCnt = spaceCnt + 1;
			if (spaceCnt == 2) {
				secondSpaceDigit = i;//두번째 스페이스 위치
				break;
			}
		}
	}
	str = str.substring(0, secondSpaceDigit);//연속해서 공백이 2개이상인 경우 첫번째 공란 이후 정보 삭제
	str = str.replace(/ /g, "");
	if ("-" == str.substring(5, 6)) {
		str = str.substring(0, 5) + str.substring(6, str.length);
	}
	$("#barcode").val(str);
	listViewClickFromBarCodeReader(str);
}

function checkDocStateCd(sel1DocStatCd) {
	if (sel1DocStatCd == "CAN" || sel1DocStatCd == "REQ") {
		if (!($("#btnBarcodeConfirm").hasClass("disabled"))) {
			$("#btnBarcodeConfirm").addClass("disabled");//확인
		}
		if (!($("#btnBarcodeScan").hasClass("disabled"))) {
			$("#btnBarcodeScan").addClass("disabled");//스캔
		}
		if (!($("#btnSave_inc").hasClass("disabled"))) {
			$("#btnSave_inc").addClass("disabled");//저장
		}
		if (!($("#btnDel_inc").hasClass("disabled"))) {
			$("#btnDel_inc").addClass("disabled");//삭제
		}
	} else {
		if ($("#btnBarcodeConfirm").hasClass("disabled")) {
			$("#btnBarcodeConfirm").removeClass("disabled");//확인
		}
		if ($("#btnBarcodeScan").hasClass("disabled")) {
			$("#btnBarcodeScan").removeClass("disabled");//스캔
		}
		if ($("#btnSave_inc").hasClass("disabled")) {
			$("#btnSave_inc").removeClass("disabled");//저장
		}
		if ($("#btnDel_inc").hasClass("disabled")) {
			$("#btnDel_inc").removeClass("disabled");//삭제
		}
	}
}

////////////////////////////////

function contentDetailFromList(dataItem, curRow) {
	$("#content_list").css("display", "none");
	$("#content_list2").css("display", "none");
	$("#content_search").css("display", "none");
	$("#content_itemList").css("display", "none");
	$("#content_detail").css("display", "block");
	$("#header_title span").removeAttr("class");
	var key = dataItem.itemCd;
	var itemList = [];
	itemList.push(key);
	var header = {
		sItemCdLst : itemList
	};

	$.ajax({
		url : "<c:url value='/par/pmm/binlocation/selectBinLocationMasterByItemCd.do' />",
		data : kendo.stringify(header),
		type : 'POST',
		dataType : 'json',
		contentType : 'application/json',
		async : false,
		success : function(result) {
			locationListObj = {};
			locationObj[' '] = "";
			if (result.data != null) {
				for (var i = 0, dataLen = result.data.length; i < dataLen; i = i + 1) {
					if (locationListObj.hasOwnProperty(result.data[i].itemCd)) {
						locationListObj[result.data[i].itemCd].push({
							cmmCd : result.data[i].locCd,
							cmmCdNm : result.data[i].locNm
						});
					} else {
						locationListObj[result.data[i].itemCd] = [{
							cmmCd : "",
							cmmCdNm : ""
						}];

						locationListObj[result.data[i].itemCd].push({
							cmmCd : result.data[i].locCd,
							cmmCdNm : result.data[i].locNm
						});
					}
					if (!locationObj.hasOwnProperty(result.data[i].locCd)) {
						locationObj[result.data[i].locCd] = result.data[i].locCd;
					}
				}
			}
		},
		error : function(jqXHR, status, error) {
			mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
			return false;
		}
	});


	$("#itemCd").val(dataItem.itemCd);
	$("#itemNm").val(dataItem.itemNm);
	$("#strgeCd").data("kendoExtDropDownList").value(dataItem.strgeCd);
	$("#locCd").val(dataItem.locCd);
	$("#itemDstinCd").val(dataItem.itemDstinCd);
	$("#itemDstinNm").val(itemDstinCdObj[dataItem.itemDstinCd]);
	$("#carlineCd").val(dataItem.carlineCd);
	$("#abcInd").val(dataItem.abcInd);
	$("#stockQty").val(dataItem.stockQty);
	$("#ddQty").val(dataItem.ddQty);
	$("#diffQty").val(dataItem.diffQty);
	$("#bookQty").val(dataItem.bookQty);
	$("#amt").val(dataItem.amt);
	$("#movingAvgPrc").val(kendo.toString(dataItem.movingAvgPrc,'n2'));

	$("#stockDdDocNo").val(dataItem.stockDdDocNo);
	$("#stockDdDocLineNo").val(dataItem.stockDdDocLineNo);
	$("#itemStatCd").val(dataItem.itemStatCd);
	$("#docStatCd").val(dataItem.docStatCd);

	$("#unitCd").val(dataItem.unitCd);
	$("#dlrCd").val(dataItem.dlrCd);

	$("#curRowIdx").val(curRow);
	$("#curDataUid").val(dataItem.uid);

	if ($("#sel1DocStatCd").val() == "REQ") {
		$("#strgeCd").data("kendoExtDropDownList").enable(false);
		$("#strgeCd").parent().parent().addClass("f_disabled");
		$("#locCd").parent().parent().addClass("f_disabled");
		$("#ddQty").attr("disabled", true);
		$("#ddQty").parent().addClass("f_disabled");
	} else {
		$("#strgeCd").data("kendoExtDropDownList").enable(false);
		$("#strgeCd").parent().parent().removeClass("f_disabled");
		$("#locCd").parent().parent().removeClass("f_disabled");
		$("#ddQty").attr("disabled", false);
		$("#ddQty").parent().removeClass("f_disabled");
	}
}

$("#btnSave_inc").click(function() {
    var ddQty = $("#ddQty").val();
    var numYN = checkOnlyNum(ddQty);

	if ($("#btnSave_inc").hasClass("disabled")) {
		return false;
	}
	if(!ddQty || !numYN) {
	    $("#ddQty").val("");
	    mob.notification.warning("<spring:message code='par.lbl.ddQty' var='ddQty' /><spring:message code='global.err.checkQtyParam' arguments='${ddQty}'/>");
	    return false;
	}

	$("#remark").val("");
	doSaveInclude();
});

function checkOnlyNum(value) {
    if(!($.isNumeric(value))) {
        return false;
    }else{
        return true;
    }
}

$("#btnDel_inc").click(function() {
	if ($("#btnDel_inc").hasClass("disabled")) {
		return false;
	}
	confirmOpen(confirmMsgDel, 'doDeleteInclude', y, n);
});

$("#detailConfirmBtn").click(function() {
	setTimeout(function() {
		$("#content_list").css("display", "none");
		$("#content_list2").css("display", "none");
		$("#content_search").css("display", "none");
		$("#content_itemList").css("display", "block");
		$("#content_detail").css("display", "none");
	}, 200);
});

function doSaveInclude() {
	var saveData = {};
	var header;
	saveData.insertList = [];
	saveData.updateList = [];
	saveData.deleteList = [];
	saveData.investigationVO = {};
	var gridData = {
		dlrCd : "",
		stockDdDocNo : "",
		stockDdDocLineNo : "",
		strgeCd : "",
		locCd : "",
		itemCd : "",
		itemStatCd : "",
		itemNm : "",
		itemDstinCd : "",
		carlineCd : "",
		abcInd : "",
		stockQty : "",
		ddQty : "",
		diffQty : "",
		bookQty : "",
		amt : "",
		stockItemPlusQty : "",
		stockItemPlusPrc : "",
		stockItemMinusQty : "",
		stockItemMinusPrc : "",
		unitCd : "",
		reasonCont : ""
	};
	header = {
		stockDdDocNo : $("#stockDdDocNo").val(),
		remark : $("#remark").val(),
		docStatCd : $("#sel1DocStatCd").val(),
		stockLockYn : $("#sel1StockLockYn").val(),
		stockDdDocNo : $("#stockDdDocNo").val(),
		updtDtStr : $("#sel1UpdtDtStr").val()
	};

	gridData.dlrCd = $("#dlrCd").val();
	gridData.stockDdDocNo = $("#stockDdDocNo").val();
	gridData.stockDdDocLineNo = $("#stockDdDocLineNo").val();
	gridData.strgeCd = $("#strgeCd").val();
	gridData.locCd = $("#locCd").val();
	gridData.itemCd = $("#itemCd").val();
	gridData.itemStatCd = $("#itemStatCd").val();
	gridData.itemNm = $("#itemNm").val();
	gridData.itemDstinCd = $("#itemDstinCd").val();
	gridData.carlineCd = $("#carlineCd").val();
	gridData.abcInd = $("#abcInd").val();
	gridData.stockQty = $("#stockQty").val();
	gridData.ddQty = $("#ddQty").val();
	gridData.diffQty = $("#diffQty").val();
	gridData.bookQty = $("#bookQty").val();
	gridData.amt = $("#amt").val();
	gridData.stockItemPlusQty = $("#stockItemPlusQty").val();
	gridData.stockItemPlusPrc = $("#stockItemPlusPrc").val();
	gridData.stockItemMinusQty = $("#stockItemMinusQty").val();
	gridData.stockItemMinusPrc = $("#stockItemMinusPrc").val();
	gridData.unitCd = $("#unitCd").val();
	gridData.reasonCont = $("#reasonCont").val();
	saveList.push(gridData);
	saveData.updateList.push(gridData);
	saveData.investigationVO = header;

	if (saveData.updateList.length > 0) {
		mob.loading.show();
		setTimeout(function() {
			$.ajax({
				url : "<c:url value='/par/stm/investigation/multiInvestigations.do' />",
				data : kendo.stringify(saveData),
				type : 'POST',
				dataType : 'json',
				contentType : 'application/json',
				async : false,
				success : function(result) {
					if (result === true) {
						mob.notification.info("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.modifySuccessParam' arguments='${stockDdDoc}'/>");
						contentItemListFromDetailSave($("#curRowIdx").val(), gridData);//저장후 부품리스트 반영

						//재고실사문서 변경일자를 재반영 한다.
						$.ajax({
							url : "<c:url value='/par/stm/investigation/selectInvestigationListByKey.do' />",
							data : kendo.stringify({
								"sStockDdDocNo":$("#stockDdDocNo").val()
							}),
							type : 'POST',
							dataType : 'json',
							contentType : 'application/json',
							async : false,
							success : function(result){
								$("#sel1UpdtDtStr").val(result.updtDtStr);
							}
						});


					} else {
						if (result === 0) {
							mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
						}
					}
					mob.loading.hide();
					saveData = [];
				},
				error : function(jqXHR, status, error) {
					mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
					mob.loading.hide();
					saveData = [];
				}
			});
		}, 200);
	}
}

function doDeleteInclude() {
	var saveData = {};
	var header;
	saveData.insertList = [];
	saveData.updateList = [];
	saveData.deleteList = [];
	saveData.investigationVO = {};
	var gridData = {
		dlrCd : "",
		stockDdDocNo : "",
		stockDdDocLineNo : "",
		strgeCd : "",
		locCd : "",
		itemCd : "",
		itemStatCd : "",
		itemNm : "",
		itemDstinCd : "",
		carlineCd : "",
		abcInd : "",
		stockQty : "",
		ddQty : "",
		diffQty : "",
		bookQty : "",
		amt : "",
		stockItemPlusQty : "",
		stockItemPlusPrc : "",
		stockItemMinusQty : "",
		stockItemMinusPrc : "",
		unitCd : "",
		reasonCont : ""
	};

	header = {
		stockDdDocNo : $("#stockDdDocNo").val(),
		remark : $("#remark").val(),
		docStatCd : $("#sel1DocStatCd").val(),
		stockLockYn : $("#sel1StockLockYn").val(),
		stockDdDocNo : $("#stockDdDocNo").val(),
		updtDtStr : $("#sel1UpdtDtStr").val()
	};

	gridData.dlrCd = $("#dlrCd").val();
	gridData.stockDdDocNo = $("#stockDdDocNo").val();
	gridData.stockDdDocLineNo = $("#stockDdDocLineNo").val();
	gridData.strgeCd = $("#strgeCd").val();
	gridData.locCd = $("#locCd").val();
	gridData.itemCd = $("#itemCd").val();
	gridData.itemStatCd = $("#itemStatCd").val();
	gridData.itemNm = $("#itemNm").val();
	gridData.itemDstinCd = $("#itemDstinCd").val();
	gridData.carlineCd = $("#carlineCd").val();
	gridData.abcInd = $("#abcInd").val();
	gridData.stockQty = $("#stockQty").val();
	gridData.ddQty = $("#ddQty").val();
	gridData.diffQty = $("#diffQty").val();
	gridData.bookQty = $("#bookQty").val();
	gridData.amt = $("#amt").val();
	gridData.stockItemPlusQty = $("#stockItemPlusQty").val();
	gridData.stockItemPlusPrc = $("#stockItemPlusPrc").val();
	gridData.stockItemMinusQty = $("#stockItemMinusQty").val();
	gridData.stockItemMinusPrc = $("#stockItemMinusPrc").val();
	gridData.unitCd = $("#unitCd").val();
	gridData.reasonCont = $("#reasonCont").val();
	saveData.deleteList.push(gridData);
	saveData.investigationVO = header;

	if (saveData.deleteList.length > 0) {
		mob.loading.show();
		setTimeout(function() {
			$.ajax({
				url : "<c:url value='/mob/par/stm/physicalInv/actionPhysicalInv.do' />",
				data : kendo.stringify(saveData),
				type : 'POST',
				dataType : 'json',
				contentType : 'application/json',
				async : false,
				success : function(result) {
					if (result === true) {
						mob.notification.info("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.modifySuccessParam' arguments='${stockDdDoc}'/>");
						contentItemListFromDetailDelete($("#curRowIdx").val(), $("#curDataUid").val());

						//재고실사문서 변경일자를 재반영 한다.
						$.ajax({
							url : "<c:url value='/par/stm/investigation/selectInvestigationListByKey.do' />",
							data : kendo.stringify({
								"sStockDdDocNo":$("#stockDdDocNo").val()
							}),
							type : 'POST',
							dataType : 'json',
							contentType : 'application/json',
							async : false,
							success : function(result){
								$("#sel1UpdtDtStr").val(result.updtDtStr);
							}
						});

					} else {
						if (result === 0) {
							mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
						}
					}
					mob.loading.hide();
					saveData = [];
				},
				error : function(jqXHR, status, error) {
					mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
					mob.loading.hide();
					saveData = [];
				}
			});
		}, 200);
	}
}

function calcul_Qty() {

	/*
     * 실사수량 기준 장면재고 마이너스 처리한다.(무조건)
     */
	var ddQty = parseInt(dms.string.defaultString($("#ddQty").val(), "0"));
    var stockQty = parseInt(dms.string.defaultString($("#stockQty").val(), "0"));
    var movingAvgPrc = parseFloat(dms.string.defaultString($("#movingAvgPrc").val(), "0.0"));
    var diffQty = ddQty - stockQty;

    var stockItemPlusQty = 0;
    var stockItemPlusPrc = 0.00;
    var stockItemMinusQty = 0;
    var stockItemMinusPrc = 0.00;

    if(diffQty > 0){
    	stockItemPlusQty = diffQty;
        stockItemPlusPrc = diffQty * movingAvgPrc;
    }else if(diffQty < 0){
        stockItemMinusQty = diffQty * -1;
        stockItemMinusPrc = (diffQty * movingAvgPrc) * -1;
    }

    $("#diffQty").val(diffQty);
	$("#bookQty").val(stockQty);
	$("#amt").val(diffQty * movingAvgPrc);
    $("#stockItemPlusQty").val(stockItemPlusQty);	// 손익수량
	$("#stockItemPlusPrc").val(stockItemPlusPrc);	// 손익금액
	$("#stockItemMinusQty").val(stockItemMinusQty);	// 손실수량
	$("#stockItemMinusPrc").val(stockItemMinusPrc);	// 손실금액
}
</script>
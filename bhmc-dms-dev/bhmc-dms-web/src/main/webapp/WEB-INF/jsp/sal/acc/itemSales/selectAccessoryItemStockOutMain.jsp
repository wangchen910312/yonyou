<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 용품출고 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="par.lbl.custInfo" /><!-- 고객 정보 --></h1> --%>
            <div class="btn_left">
                <dms:access viewId="VIEW-D-12792" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnInit" name="btnInit" class="btn_m btn_reset"><spring:message code="par.btn.init" /></button><!-- 초기화 -->
                </dms:access>
            </div>
            <div class="btn_right">
                <dms:access viewId="VIEW-D-12790" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSave" class="btn_m"><spring:message code="par.btn.save" /></button><!-- 저장 -->
                </dms:access>
                <dms:access viewId="VIEW-D-12789" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnCnfm" class="btn_m"><spring:message code="sal.btn.itemOut" /></button><!--출고 -->
                </dms:access>
                <dms:access viewId="VIEW-D-12791" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_search btn_m_min" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
                <button type="button" id="btnPrint" class="btn_m"><spring:message code="par.btn.receivePrint" /></button><!--인쇄 -->
                </dms:access>
            </div>
        </div>
        <div class="table_form form_width_70per"  role="search" data-btnid="btnSearch" id="searchForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:18%;">
                    <col style="width:8%;">
                    <col style="width:18%;">
                    <col style="width:8%;">
                    <col style="width:18%;">
                    <col style="width:8%;">
                    <col style="width:18%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.wrkTp" /><!-- 업무유형 --></th>
                        <td>
                            <input id="sGoodsTp" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.ordNo" /><!-- 오더번호 --></th>
                        <td>
                           <div class="form_search">
                                <input id="sGoodsContractNo" class="form_input"/>
                                <a id="searchGoodsContractNo"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="global.lbl.reqStat" /><!-- 상태 --></th>
                        <td>
                            <input id="sContractStatCd" type="text" data-type="multicombo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.customer" /><!-- 고객 --></th>
                        <td>
                            <div class="form_float">
                                <div class="form_left">
                                    <div class="form_search">
                                        <input type="text" id="sContractCustNm" name="sContractCustNm" class="form_input" />
                                        <a href="javascript:void(0);" id="btnSearchCustomer"><spring:message code='global.lbl.search' /></a>
                                    </div>
                                </div>
                                <div class="form_right">
                                    <input type="text" id="sContractCustNo" name="sContractCustNo" class="form_input form_readonly" readonly />
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.reqDt" /><!-- 요청일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input type="text" id="sStartRegDt" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input type="text" id="sEndRegDt" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.realDlsDt" /><!-- 완성일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input type="text" id="sStartRealDlDt" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input type="text" id="sEndRealDlDt" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.expcGiEndsDt" /><!-- 예정출고완료일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input type="text" id="sStartExpcGiEndDt" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input type="text" id="sEndExpcGiEndDt" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.returnDt" /><!-- 반품일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input type="text" id="sStartReturnDt" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input type="text" id="sEndReturnDt" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <form id="form">
            <div style="display:none">
                <input type="text" id="dlrCd" />
                <input type="text" id="cancCupnPubliNo" />
                <input type="text" id="cupnPubliNo" />
                <input type="text" id="cupnAmt" />
                <input type="text" id="membershipNo" />
                <input type="text" id="cardNo" />
                <input type="text" id="pointVal" />
                <input type="text" id="pointAmt" />
                <input type="text" id="pointSaveYn" />
                <input type="text" id="cupnSaveYn" />
                <input type="text" id="goodsContractNo"  />
                <input type="text" id="contractStatCd"  />
                <input type="text" id="goodsTp"  />
                <input type="text" id="contractCustNo"  />
                <input type="text" id="contractCustNm"  />
                <input type="text" id="contractCustTp"  />
                <input type="text" id="vinNo"  />
                <input type="text" id="custPayAmt" data-type="number"  />
                <input type="text" id="saleContractNo"  />
                <input type="text" id="carBrandCd"  />
                <input type="text" id="goodsAmt" data-type="number"  />
                <input type="text" id="goodsRealAmt" data-type="number"  />
                <input type="text" id="prenAmt" data-type="number"  />
                <input type="text" id="addPrenAmt" data-type="number"  />
                <input type="text" id="updtDtStr" />
            </div>
        </form>
         <div class="table_grid mt10">
            <!-- 헤더 그리드 -->
            <div id="gridHead"></div>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
                <dms:access viewId="VIEW-D-12788" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnAdd"  class="btn_s btn_add btn_s_min5"><spring:message code="par.btn.add" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-12787" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnDelItem" class="btn_s btn_del btn_s_min5"><spring:message code="par.btn.del" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-12786" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnReturn"  class="btn_s btn_s_min5"><spring:message code="par.btn.innerReturn" /></button><!--반품 -->
                </dms:access>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div class="table_grid">
            <!-- 부품판매 그리드 -->
            <div id="gridDetail" class="resizable_grid"></div>
        </div>
    </section>
</div>
<!-- //부품판매 -->

<!-- script -->
<script>
//세율 (0.16)
var vatCode = "${vatCd}";
var vatCd = dms.string.isEmpty(vatCode)?0.16:Number(vatCode);
vatCd = vatCd + 1;

var toDt                = "${toDt}",
    sessionUsrId        = "${usrId}",
    sessionUsrNm        = "${usrNm}",
    toDt                = "${toDt}",
    searchBfDt          = "${searchBfDt}",
    goodsTpList         = [],
    goodsTpObj          = {},
    contractStatCdList  = [],
    contractStatCdObj   = {},
    itemStatCdObj       = {},
    giStrgeTpList       = [],
    giStrgeTpObj        = {},
    unitCdObj           = {},
    tempGrid            = {},
    existItemChkObj     = {},
    selectGridHeadObj   = {},
    changeAmtEditor,
    changeUnitCd,
    setAccessoryItemStockOutReturnPopupWindow,
    goodsContractListPopupWindow;

goodsTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${goodsTpList}" varStatus="status">
    goodsTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    goodsTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

contractStatCdList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${contractStatCdList}" varStatus="status">
    if("${obj.useYn}" === 'Y'){
        contractStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }
    contractStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${itemStatCdList}" varStatus="status">
    itemStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

unitCdObj[' '] = "";
<c:forEach var="obj" items="${unitCdList}" varStatus="status">
    unitCdObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
</c:forEach>

giStrgeTpObj[' '] = "";
<c:forEach var="obj" items="${storageList}" varStatus="status">
    giStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
    giStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

var gridRow = 0;
var selectedGoodsContractNo;

$(document).ready(function() {

    //고객유형선택
    $("#sGoodsTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:goodsTpList
        ,index:0
    });

    //오더상태선택
    $("#sContractStatCd").kendoExtMultiSelectDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:contractStatCdList
        ,dataBound:function(){
            var current = this.value();
            this._savedOld = current.slice(0);
        }
        ,select:function(e){
            var selectContractStatCd = e.dataItem.cmmCd;

            if(dms.string.isEmpty(selectContractStatCd)){
                $("#sContractStatCd").data("kendoExtMultiSelectDropDownList").refresh();
                $("#sContractStatCd").data("kendoExtMultiSelectDropDownList").value([]);
            }

        }
    });

    //조회조건 - 고객명 변경 이벤트
    //조회조건의 고객명 변경시 고객번호를 초기화 한다.
    $("#sContractCustNm").bind("change", function(){
        $("#sContractCustNo").val("");
    });

    //조회조건-요청일 선택
    $("#sStartRegDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });
    //조회조건-요청일 선택
    $("#sEndRegDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });
    //조회조건-완성일 선택
    $("#sStartRealDlDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    //조회조건-완성일 선택
    $("#sEndRealDlDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });
    //조회조건-예정출고완료일 선택
    $("#sStartExpcGiEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    //조회조건-예정출고완료일 선택
    $("#sEndExpcGiEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });
    //조회조건-반품일 선택
    $("#sStartReturnDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    //조회조건-반품일 선택
    $("#sEndReturnDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    //custPayAmt
    $("#custPayAmt").kendoExtNumericTextBox({
        enable:false
        ,format:"n2"
        ,decimals:2
        ,spinners:false
        ,value:0
    });

    //goodsAmt
    $("#goodsAmt").kendoExtNumericTextBox({
        enable:false
        ,format:"n2"
        ,decimals:2
        ,spinners:false
        ,value:0
    });

    //goodsRealAmt
    $("#goodsRealAmt").kendoExtNumericTextBox({
        enable:false
        ,format:"n2"
        ,decimals:2
        ,spinners:false
        ,value:0
    });

    //prenAmt
    $("#prenAmt").kendoExtNumericTextBox({
        enable:false
        ,format:"n2"
        ,decimals:2
        ,spinners:false
        ,value:0
    });

    //addPrenAmt
    $("#addPrenAmt").kendoExtNumericTextBox({
        enable:false
        ,format:"n2"
        ,decimals:2
        ,spinners:false
        ,value:0
    });

    // 초기화 버튼
    $("#btnInit").kendoButton({
        click:function(e){
            initPage();
        }
    });

    // 조회 버튼
    $("#btnSearch").kendoButton({
        click:function(e){

            initHiddenForm();
            $("#gridHead").data("kendoExtGrid").dataSource.page(1);
            $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
        }
    });

    //버튼 - 고객조회팝업
    $("#btnSearchCustomer").bind("click", function(){
        openCustomerSearchPopup($("#sContractCustNm").val(), function(data){
            $("#sContractCustNo").val(data[0].custNo);
            $("#sContractCustNm").val(data[0].custNm);

            //popupWindow.close();
        });
    });

    $("#searchGoodsContractNo").on('click', selectGoodsContractListPopupWindow);

     $(document).on("click", ".grid-checkAll", function(e){
        var grid = $("#gridDetail").data("kendoExtGrid"),
            checked = $(this).is(":checked"),
            rows = grid.tbody.find("tr"),
            lineDisabled;

        if(checked){
            rows.each(function(index, row) {
                lineDisabled = $(this).find(".grid-checkbox-item").prop("disabled");
                if(!lineDisabled){
                    grid.select($(this));
                    $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                }
            });
        }else{
            grid.clearSelection();

            rows.each(function(index, row) {
                $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
            });
        }
    });

    $(document).on("click", ".grid-checkbox-item", function(e){
        var grid = $("#gridDetail").data("kendoExtGrid")
          , row = grid.tbody.find("tr[data-uid='" + $(this).attr("data-uid") + "']")
          , lineDisabled = $(this).prop("disabled");

        if($(this).is(":checked")){
            if(!lineDisabled){
                grid.select(row);
            }
        }else{
            $(e.currentTarget).closest("tr").removeClass("k-state-selected");
            $(row).removeClass("k-state-selected");
        }

    });

    // 반품
    $("#btnReturn").kendoButton({

        click:function(e){
            var grid           = $("#gridDetail").data("kendoExtGrid"),
                rows           = grid.tbody.find("tr"),
                contractStatCd = $("#sContractStatCd").data("kendoExtMultiSelectDropDownList").value(),
                chkCnt         = 0,
                avlbReturnQty  = 0,
                selectGridData = {},
                gridData,
                chkRow;

            var selectedVal = grid.dataItem(grid.select());

            if(rows.length  == 0 ){
                // 선택값이 없습니다.
                dms.notification.warning("<spring:message code='global.info.unselected' />");
                return false;
            }

            rows.each(function(index, row) {
                gridData = grid.dataSource.at(index);
                chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");
                if(chkRow === true){
                    if(chkCnt === 0){
                        selectGridData.dlrCd            = gridData.dlrCd;
                        selectGridData.goodsContractNo  = gridData.goodsContractNo;
                        selectGridData.seq              = gridData.seq;
                        selectGridData.goodsCd          = gridData.goodsCd;
                        selectGridData.goodsNm          = gridData.goodsNm;
                        selectGridData.carlineCd        = gridData.carlineCd;
                        selectGridData.goodsUnitCd      = gridData.goodsUnitCd;
                        selectGridData.retlPrc          = gridData.retlPrc;
                        selectGridData.dcRate           = gridData.dcRate;
                        selectGridData.dcAmt            = gridData.dcAmt;
                        selectGridData.pkgItemCd        = gridData.pkgItemCd;
                        selectGridData.giStrgeCd        = gridData.giStrgeCd;
                        selectGridData.orgRetlPrc       = gridData.orgRetlPrc;
                        selectGridData.goodsCnt         = gridData.goodsCnt;
                        selectGridData.saleAmt          = gridData.saleAmt;
                        selectGridData.eqipCostAmt      = gridData.eqipCostAmt;
                        selectGridData.avlbReturnQty    = gridData.goodsCnt;
                        //selectGridData.refDocNo         = gridData.refDocNo;
                        //selectGridData.refDocLineNo     = gridData.refDocLineNo;

                        chkCnt = chkCnt + 1;
                    }else{
                        chkCnt = chkCnt + 1;
                        dms.notification.warning("<spring:message code='global.info.required.selectOne'/>");
                        return false;
                    }
                }
            });
            if(chkCnt  === 0 ){
                // 선택값이 없습니다.
                dms.notification.warning("<spring:message code='global.info.unselected' />");
                return false;
            }

            if(selectedVal.statCd === '10' || selectedVal.statCd === '30' || selectedVal.statCd === '40' || dms.string.isEmpty(selectedVal.statCd)){
                //반품가능 상태가 아닙니다.(10:출고대기, null:등록중, 30:반품등록, 40:반품)
                dms.notification.warning("<spring:message code='sal.info.itemReturn.possibleState.accessoryItemSales' />");

                return false;
            }

           /*  rows.each(function(index, row) {
                gridData = grid.dataSource.at(index);
                if(selectGridData.goodsCd == gridData.goodsCd
                        && selectGridData.giStrgeCd == gridData.giStrgeCd
                        && (gridData.statCd != "20")){
                    avlbReturnQty += Math.abs(gridData.goodsCnt)*-1;
                 }
            }); */
            rows.each(function(index, row) {
                gridData = grid.dataSource.at(index);
                if(selectGridData.goodsCd == gridData.goodsCd
                        && selectGridData.giStrgeCd == gridData.giStrgeCd
                        && (gridData.statCd != "20")
                        && selectGridData.seq == gridData.refDocLineNo
                ){

                    avlbReturnQty += Math.abs(gridData.goodsCnt)*-1;
                }
            });

console.log("avlbReturnQty="+avlbReturnQty)
            selectGridData.avlbReturnQty  += avlbReturnQty;

            if(selectGridData.avlbReturnQty <= 0 ){
                // 해당 부품 반품수량이 초과되었습니다.
                dms.notification.warning("<spring:message code='par.lbl.itemReturnCompleteMsg' />");
                return;
            }
            if(chkCnt === 1){
                fnAccessoryItemStockOutReturnPopupWindow(selectGridData);
            }
        }
    });

  //버튼 - 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            var dlrCd           = $("#dlrCd").val(),
                goodsContractNo = $("#goodsContractNo").val();
            openAccessoryItemSearchPopup(dlrCd, goodsContractNo, $("#gridDetail").data("kendoExtGrid"));
        }
    });

    // 부품삭제 버튼
    $("#btnDelItem").kendoButton({
        click:function(e){

            var grid = $("#gridDetail").data("kendoExtGrid"),
                rows = grid.select();

            // checking.
            var isStatFlag = false;
            rows.each(function(index, row) {
                var item = grid.dataItem(row);
                if(item.statCd == "20" || item.statCd == "40"){
                    isStatFlag = true;
                }
            });
            if(isStatFlag){
                //처리상태가 출고/반납인 목록은 삭제 할 수 없습니다.
                dms.notification.warning("<spring:message code='sal.info.delete.impossibleState.accessoryItemSales' />");
                return false;
            }

            rows.each(function(index, row) {
                var l_rowData = grid.dataItem(row);
                delete existItemChkObj[l_rowData.goodsCd];
            });

            rows.each(function(index, row) {
                grid.removeRow(row);
            });

            calTotalAmt();
        }
    });

    // 저장 버튼
    $("#btnSave").kendoButton({

        click:function(e){
            var gridH  = $("#gridHead").data("kendoExtGrid");
            var grid  = $("#gridDetail").data("kendoExtGrid");
            var selectedVal = gridH.dataItem(gridH.select());
            var selectedValD = grid.dataItem(grid.select());

            if(selectedVal != null){

                var goodsRealAmt = 0;//판매합계금액
                var addPrenAmt   = Number(selectedVal.addPrenAmt);  //추가증정금액
                var pointAmt     = Number(selectedVal.pointAmt);    //이번사용금액
                var cupnAmt      = Number(selectedVal.cupnAmt);     //쿠폰 금액
                var custPayAmt   = Number(selectedVal.custPayAmt);  //고객납부금액

                var useTotAmt   = addPrenAmt + pointAmt + cupnAmt;     //포인트 사용금액
                var totAmt      = goodsRealAmt - useTotAmt;             //실고객 납부금앧
                var usePointAmt = goodsRealAmt - (pointAmt + cupnAmt);
                var realAmt = 0;

                $.each(grid.dataSource.data(), function(idx, dataItem){
                    //창고코드와 품목코드가 같고 용품판매품목상태가 반품대기(30), 반품(40)
                     if((dataItem.statCd == "30" || dataItem.statCd == "40")){
                         realAmt = Math.abs(dataItem.retlTotAmt)*-1;
                     }else{
                         realAmt = Math.abs(dataItem.retlTotAmt);
                     }
                    goodsRealAmt += Number(realAmt);
                });


                if(useTotAmt > 0 && useTotAmt > goodsRealAmt){
                  //Confirm 팝업 오픈
                    dms.window.confirm({
                        message:"<spring:message code='sal.info.cancCouponPointAmt' />"   //쿠폰,포인트금액 사용금액이 고객납부금액보다 큽니다. 쿠폰,포인트 사용을 취소 하시겠습니까?
                        ,width:300
                        ,confirmBtnText:"<spring:message code='global.btn.confirm' />"      //확인
                        ,cancelBtnText:"<spring:message code='global.btn.cancel' />"        //취소
                        ,callback:function(result){
                            if(result){

                                $("#cardNo").val(selectedVal.cardNo);
                                $("#membershipNo").val(selectedVal.membershipNo);
                                $("#cancCupnPubliNo").val(selectedVal.cupnPubliNo);
                                $("#cupnPubliNo").val("");
                                $("#pointVal").val("");//사용포인트
                                $("#pointAmt").val("");//사용금액
                                $("#pointSaveYn").val("Y");//포인트 저장여부
                                $("#cupnSaveYn").val("Y");//쿠폰 저장여부
                                $("#addPrenAmt").val("0");//추가 증정 삭제

                                saveAccessoryItemStock();
                            }else{
                                var readObj = {};
                                readObj.goodsContractNo = selectedVal.goodsContractNo;
                                $("#gridDetail").data("kendoExtGrid").dataSource.read(readObj);

                            }
                        }
                    });
                } else {
                    $("#cardNo").val(selectedVal.cardNo);
                    $("#membershipNo").val(selectedVal.membershipNo);
                    $("#cupnPubliNo").val(selectedVal.cupnPubliNo);
                    $("#cupnAmt").val(selectedVal.cupnAmt);
                    $("#cancCupnPubliNo").val("");
                    $("#pointVal").val(selectedVal.pointVal);//사용포인트
                    $("#pointAmt").val(selectedVal.pointAmt);//사용금액
                    $("#addPrenAmt").val(selectedVal.addPrenAmt);//추가 증정 삭제
                    saveAccessoryItemStock();
                }
            }else{
                dms.notification.warning("<spring:message code='global.info.unselected' />");
                return;
            }
        }
    });

    //저장
    saveAccessoryItemStock = function(){

        //용품판매품목상태를 체크하여 용품판매문서상태를 조정하여 준다.
        //1.전체출고 : 용품판매품목상태가 출고(20),반품(40)만 포함
        //2.부분출고 : 용품판매품목상태가 출고대기(10) 또는 반품대기(30) 와  출고(20) 또는 반품(40)이 함께 포함
        documentStatChange();
//console.log("saveAccessoryItemStock contractStatCd="+$("#contractStatCd").val())
        var saveList      = [],
            grid          = $("#gridDetail").data("kendoExtGrid"),
            rows          = grid.tbody.find("tr"),
            header;

        header = {
                goodsContractNo :$("#goodsContractNo").val()
              , goodsTp         :$("#goodsTp").val()
              , contractCustNo  :$("#contractCustNo").val()
              , contractCustNm  :$("#contractCustNm").val()
              , contractCustTp:$("#contractCustTp").val()
              , vinNo           :$("#vinNo").val()
              , custPayAmt      :$("#custPayAmt").data("kendoExtNumericTextBox").value()
              , saleContractNo  :$("#saleContractNo").val()
              , contractStatCd  :$("#contractStatCd").val()
              , carBrandCd      :$("#carBrandCd").val()
              , goodsAmt        :$("#goodsAmt").data("kendoExtNumericTextBox").value()
              , goodsRealAmt    :$("#goodsRealAmt").data("kendoExtNumericTextBox").value()
              , prenAmt         :$("#prenAmt").data("kendoExtNumericTextBox").value()
              , addPrenAmt      :$("#addPrenAmt").data("kendoExtNumericTextBox").value()
              , updtDtStr       :$("#updtDtStr").val()
              , cardNo          :$("#cardNo").val()
              , membershipNo    :$("#membershipNo").val()
              , cancCupnPubliNo :$("#cancCupnPubliNo").val()
              , cupnPubliNo     :$("#cupnPubliNo").val()
              , cupnAmt          :$("#cupnAmt").val()
              , pointVal        :$("#pointVal").val()
              , pointAmt        :$("#pointAmt").val()
              , addPrenAmt      :$("#addPrenAmt").val()
              , pointSaveYn     :$("#pointSaveYn").val()
              , cupnSaveYn      :$("#cupnSaveYn").val()
        };
        var saveData = grid.getCUDData("insertList", "updateList", "deleteList"),
            insertListLeng = saveData.insertList.length;
        saveData.accessoryItemSalesVO = header;

        $.ajax({
            url:"<c:url value='/sal/acc/itemSales/multiAccessoryItemSales.do' />"
           ,data:kendo.stringify(saveData)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           //,async:false
           ,error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }
           ,success:function(result) {
               // 용품판매 조회.
               //selectGoodsContract($("#goodsContractNo").val());
               var gridHead = $("#gridHead").data("kendoExtGrid");
               var selectedVal = gridHead.dataItem(gridHead.select());

               if(selectedVal != null){
                   gridRow = gridHead.select().index();
                   selectedGoodsContractNo =  selectedVal.goodsContractNo;
               }
               $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
               gridHead.dataSource.read();

               dms.notification.success("<spring:message code='sal.lbl.ordNo' var='goodsContractNo' /><spring:message code='global.info.modifySuccessParam' arguments='${goodsContractNo}'/>");
           }
            ,beforeSend: function(xhr){
                dms.loading.show($("#resizableContainer"));
            }
            ,complete: function(xhr,status){
                dms.loading.hide($("#resizableContainer"));
            }
       });
    };

    // 확정 버튼
    $("#btnCnfm").kendoButton({
        click:function(e){

          //용품판매품목상태를 체크하여 용품판매문서상태를 조정하여 준다.
            //1.전체출고 : 용품판매품목상태가 출고(20),반품(40)만 포함
            //2.부분출고 : 용품판매품목상태가 출고대기(10) 또는 반품대기(30) 와  출고(20) 또는 반품(40)이 함께 포함
            documentStatChange();
//console.log("btnCnfm contractStatCd="+$("#contractStatCd").val())

            var grid           = $("#gridDetail").data("kendoExtGrid"),
                rows           = grid.tbody.find("tr"),
                saveData       = grid.getCUDData("insertList", "updateList", "deleteList"),
                insertListLeng = saveData.insertList.length,
                updateListLeng = saveData.updateList.length,
                deleteListLeng = saveData.deleteList.length,
                modifyLeng     = insertListLeng + updateListLeng + deleteListLeng,
                saveList       = [],
                chkRow,
                header;

            if(modifyLeng > 0){

                dms.notification.warning("<spring:message code='par.info.cnfmModifyChkMsg'/>");
                saveList = [];
                return false;
            }

            header = {
                  goodsContractNo :$("#goodsContractNo").val()
                , goodsTp         :$("#goodsTp").val()
                , contractCustNo  :$("#contractCustNo").val()
                , contractCustNm  :$("#contractCustNm").val()
                , contractCustTp:$("#contractCustTp").val()
                , vinNo           :$("#vinNo").val()
                , custPayAmt      :$("#custPayAmt").data("kendoExtNumericTextBox").value()
                , saleContractNo  :$("#saleContractNo").val()
                , contractStatCd  :$("#contractStatCd").val()
                , carBrandCd      :$("#carBrandCd").val()
                , goodsAmt        :$("#goodsAmt").data("kendoExtNumericTextBox").value()
                , goodsRealAmt    :$("#goodsRealAmt").data("kendoExtNumericTextBox").value()
                , prenAmt         :$("#prenAmt").data("kendoExtNumericTextBox").value()
                , addPrenAmt      :$("#addPrenAmt").data("kendoExtNumericTextBox").value()
                , updtDtStr       :$("#updtDtStr").val()
            };

//            console.log('header:',header);
            rows.each(function(index, row) {
                var gridData = grid.dataSource.at(index);
                chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                if(chkRow === true){
                    if(!dms.string.isEmpty(gridData.goodsCd)){
                        if(dms.string.isEmpty(gridData.goodsCnt) || gridData.goodsCnt == 0){
                            // 수량을 입력하십시오
                            dms.notification.warning("<spring:message code='sal.lbl.qty' var='qty' /><spring:message code='global.info.confirmMsgParam' arguments='${qty}'/>");
                            saveList = [];
                            return false;
                        }
/*
                        if(dms.string.isEmpty(gridData.retlPrc) || gridData.retlPrc == 0){
                            // 단가를 입력하십시오.
                            dms.notification.warning("<spring:message code='sal.lbl.cost' var='cost' /><spring:message code='global.info.confirmMsgParam' arguments='${cost}'/>");
                            saveList = [];
                            return false;
                        }

 */
                        if(dms.string.isEmpty(gridData.goodsCd)){
                            // 부품을 선택하십시오
                            dms.notification.warning("<spring:message code='sal.lbl.goodsCd' var='goodsCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${goodsCd}'/>");
                            saveList = [];
                            return false;
                        }

                        if(gridData.statCd !== '10' && gridData.statCd !== '30'){
                            // 상태를 확인해주세요
                            dms.notification.warning("<spring:message code='sal.lbl.statNm' var='statCd' /><spring:message code='global.info.confirmMsgParam' arguments='${statCd}'/>");
                            saveList = [];
                            return false;
                        }

                        /*
                        if(dms.string.isEmpty(gridData.giLocCd)){
                            // 로케이션을 선택하십시오
                            dms.notification.warning("<spring:message code='par.lbl.locationCd' var='locCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${locCd}'/>");
                            saveList = [];
                            return false;
                        }
                        */

                        if(gridData.statCd === '10'){
                            if(Number(gridData.goodsCnt) > Number(gridData.avlbStockQty)){
                                // 가용재고보다 클 수 없음.
                                dms.notification.warning("<spring:message code='par.lbl.avlbStockQty' var='avlbStockQty' /><spring:message code='sal.lbl.qty' var='qty' /><spring:message code='global.err.chkGreateParam' arguments='${qty},${avlbStockQty}'/>");
                                saveList = [];
                                return false;
                            }
                        }

                        saveList.push(gridData);
                    }
                }
            });

            if(saveList.length > 0){
                var data ={
                       "accessoryItemSalesVO":header
                      ,"accessoryItemSalesItemList":saveList
                    };

                dms.loading.show();
                $.ajax({
                    url:"<c:url value='/sal/acc/itemSales/applySalesCnfm.do' />"
                   ,data:kendo.stringify(data)
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   //,async:false
                   ,success:function(result) {
                       dms.loading.hide();
                       // 용품판매 조회.
                       //selectGoodsContract($("#goodsContractNo").val());
                       btnView('20');
                       var gridHead = $("#gridHead").data("kendoExtGrid");
                       var selectedVal = gridHead.dataItem(gridHead.select());

                       gridRow = gridHead.select().index();
                       if(selectedVal != null){
                           selectedGoodsContractNo =  selectedVal.goodsContractNo;
                       }
                       $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
                       gridHead.dataSource.read();

                       dms.notification.success("<spring:message code='sal.btn.itemOut' var='salBtnItemOut' /><spring:message code='global.info.cnfmSuccessParam' arguments='${salBtnItemOut}'/>");
                   }
                   ,error:function(jqXHR,status,error) {
                       dms.loading.hide();
                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   }

               });
            }
        }
    });
    // 인쇄
    $("#btnPrint").kendoButton({
        click:function(e){
            // ready message

            var grid = $("#gridHead").data("kendoExtGrid");
            if(grid.select().length < 1){
                //목록을 1건만 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.title.list' var='globalTitleList' /><spring:message code='global.info.isSelectChk' arguments='${globalTitleList}, 1' />");
                return;
            }

            var row = grid.dataItem(grid.select());
             parent._createOrReloadTabMenu("<spring:message code='sal.title.giPrintDoc' />", "<c:url value='/ReportServer?reportlet=sale/selectAccessoryStockOutPrintMain.cpt'/>&sDlrCd="+row.dlrCd+"&sGoodsContractNo="+row.goodsContractNo);
        }
    });

    /**
     * grid 단가&수량
     */
     changeAmtEditor = function(container, options) {


         //input.attr("name", options.field);
         var pValue;
         var goodsCnt =  Number(options.model.goodsCnt).toFixed(0);;
         if(options.field === 'goodsCnt'){
             if(goodsCnt  > 999){
                 options.model.set("goodsCnt",999);
             }
             options.model.set("goodsCnt",goodsCnt);

             if(options.model.dcRate === 0){
                 options.model.set("totAmt",     (Number(options.model.retlPrc) + Number(options.model.eqipCostAmt)) );

                 options.model.set("dcAmt",      0);
                 options.model.set("saleAmt",    options.model.retlPrc);
                 options.model.set("taxDdctPrc", Number(options.model.retlPrc)/vatCd);
                 options.model.set("retlTotAmt", Number(options.model.retlPrc)  * goodsCnt);
             }else{
                 //totAmt   = (options.model.retlPrc * pValue) ;
                 var dcAmt    = Number(options.model.retlPrc) * (Number(options.model.dcRate)/100); //dcAmt는 할인 단가임.
                 var saleAmt  = Number(options.model.retlPrc) - dcAmt;
                 var totAmt   = (saleAmt * goodsCnt)   + Number(options.model.eqipCostAmt);

                 options.model.set("dcAmt",      dcAmt);
                 options.model.set("saleAmt",    saleAmt);
                 options.model.set("taxDdctPrc", options.model.retlPrc/vatCd);
                 options.model.set("retlTotAmt", saleAmt  * goodsCnt);
                 options.model.set("totAmt",     Number(totAmt));
             };
             calTotalAmt();
             $("#gridDetail").data("kendoExtGrid").refresh();
         }

     };


/*      changeAmtEditor = function(container, options) {

        var input = $("<input/>"),
             pValue,
             totAmt,
             dcAmt,
             saleAmt,
             orgRateValue;

         input.attr("name", options.field);

         input.change(function(){
             orgRateValue   = options.model.dcRate;

             if(options.field === 'goodsCnt'){
                 if($(this).val() > 999){
                     $(this).val(999);
                 }
                 pValue = Number($(this).val()).toFixed(0);
                 $(this).val(pValue);
                 if(options.model.dcRate === 0){
                     options.model.set("totAmt",     (Number(options.model.retlPrc) * pValue)+ Number(options.model.eqipCostAmt));
                     options.model.set("dcAmt",      0);
                     options.model.set("saleAmt",    options.model.retlPrc);
                     options.model.set("taxDdctPrc", Number(options.model.retlPrc)/vatCd);
                     options.model.set("retlTotAmt", Number(options.model.retlPrc)  * pValue);
                 }else{
                     //totAmt   = (options.model.retlPrc * pValue) ;
                     dcAmt    = Number(options.model.retlPrc) * (Number(options.model.dcRate)/100); //dcAmt는 할인 단가임.
                     saleAmt  = Number(options.model.retlPrc) - dcAmt;
                     totAmt   = (saleAmt * pValue)   + Number(options.model.eqipCostAmt);

                     options.model.set("dcAmt",      dcAmt);
                     options.model.set("saleAmt",    saleAmt);
                     options.model.set("taxDdctPrc", options.model.retlPrc/vatCd);
                     options.model.set("retlTotAmt", saleAmt  * pValue);
                     options.model.set("totAmt",     totAmt);
                 }
             }else if(options.field === 'dcRate'){
                 pValue =  Number($(this).val());
                 if(pValue === 0){
                     options.model.set("totAmt",     (Number(options.model.retlPrc) * Number(options.model.goodsCnt)) + Number(options.model.eqipCostAmt));
                     options.model.set("dcAmt",      0);
                     options.model.set("saleAmt",    options.model.retlPrc);
                     options.model.set("taxDdctPrc", Number(options.model.retlPrc)/vatCd);
                     options.model.set("retlTotAmt", Number(options.model.retlPrc)  * Number(options.model.goodsCnt));
                 }else{
                     if(pValue >= 100){
                         dms.notification.error("<spring:message code='par.lbl.dcRate' var='dcRate' /><spring:message code='global.err.chkGreateParam' arguments='${dcRate},100'/>");
                         options.model.set('dcRate', Number(orgRateValue));
                     }else{
                         dcAmt     = Number(options.model.retlPrc) * (pValue/100);
                         saleAmt   = Number(options.model.retlPrc) - dcAmt;
                         totAmt    = (saleAmt * Number(options.model.goodsCnt))  + Number(options.model.eqipCostAmt);

                         options.model.set("totAmt",      totAmt);
                         options.model.set("dcAmt",       dcAmt);
                         options.model.set("saleAmt",     saleAmt);
                         options.model.set("taxDdctPrc",  Number(options.model.retlPrc)/vatCd);
                         options.model.set("retlTotAmt",  saleAmt  * Number(options.model.goodsCnt));
                     }
                 }
             }else if(options.field === 'retlPrc'){
                 pValue =  Number($(this).val());
                 if(options.model.dcRate === 0){
                     options.model.set("totAmt",     (pValue * Number(options.model.goodsCnt))+ Number(options.model.eqipCostAmt));
                     options.model.set("dcAmt",      0);
                     options.model.set("saleAmt",    pValue);
                     options.model.set("taxDdctPrc", pValue/vatCd);
                     options.model.set("retlTotAmt", pValue  * Number(options.model.goodsCnt));
                 }else{
                     dcAmt     = pValue * (Number(options.model.dcRate)/100);
                     saleAmt   = pValue - dcAmt;
                     totAmt    = (saleAmt * Number(options.model.goodsCnt)) + Number(options.model.eqipCostAmt);

                     options.model.set("totAmt",     totAmt);
                     options.model.set("dcAmt",      dcAmt);
                     options.model.set("saleAmt",    saleAmt);
                     options.model.set("taxDdctPrc", pValue/vatCd);
                     options.model.set("retlTotAmt", saleAmt  * options.model.goodsCnt);
                 }
             }
         });

         input.blur(function(){

             calTotalAmt();

          });

         input.appendTo(container);
         input.kendoExtNumericTextBox({min:0,spinners:false});
     };

      */

    // 용품판매헤더 그리드
    $("#gridHead").kendoExtGrid({
        gridId:"G-PAR-0221-165001"
       ,dataSource:{
            transport:{
                read:{
                     url:"<c:url value='/sal/acc/itemSales/selectAccessoryItemSales.do' />"
                }
              , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {},
                            sContractStatCdList = $("#sContractStatCd").data("kendoExtMultiSelectDropDownList").value();

                        if(dms.string.isEmpty(sContractStatCdList[0])){

                            sContractStatCdList.splice(0,1);
                        }

                        if(sContractStatCdList.length === 0){
                            for(var i = 0; i < contractStatCdList.length; i = i + 1){
                                sContractStatCdList.push(contractStatCdList[i].cmmCd);
                            }
                        }
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"]          = options.page;
                        params["firstIndex"]         = options.skip;
                        params["lastIndex"]          = options.skip + options.take;
                        params["sort"]               = options.sort;

                        params["sGoodsTp"]           = $("#sGoodsTp").data("kendoExtDropDownList").value();
                        params["sGoodsContractNo"]   = $("#sGoodsContractNo").val();
                        params["sContractStatCdList"]= sContractStatCdList;
                        params["sStartRegDt"]        = $("#sStartRegDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndRegDt"]          = $("#sEndRegDt").data("kendoExtMaskedDatePicker").value();
                        params["sStartRealDlDt"]     = $("#sStartRealDlDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndRealDlDt"]       = $("#sEndRealDlDt").data("kendoExtMaskedDatePicker").value();
                        params["sStartExpcGiEndDt"]  = $("#sStartExpcGiEndDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndExpcGiEndDt"]    = $("#sEndExpcGiEndDt").data("kendoExtMaskedDatePicker").value();
                        params["sStartReturnDt"]     = $("#sStartReturnDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndReturnDt"]       = $("#sEndReturnDt").data("kendoExtMaskedDatePicker").value();

                        params["sContractCustNo"]    = $("#sContractCustNo").val();
                        params["sContractCustNm"]    = $("#sContractCustNm").val();
                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                 data:"data"
                ,total:"total"
                ,model:{
                   id:"goodsContractNo"
                  ,fields:{
                          goodsContractNo   :{ type:"string" }
                        , goodsTp           :{ type:"string" }
                        , contractCustNo    :{ type:"string" }
                        , contractCustNm    :{ type:"string" }
                        , pconCustNo        :{ type:"string" }
                        , telNo             :{ type:"string" }
                        , carBrandCd        :{ type:"string" }
                        , carlineCd         :{ type:"string" }
                        , modelCd           :{ type:"string" }
                        , ocnCd             :{ type:"string" }
                        , extColorCd        :{ type:"string" }
                        , intColorCd        :{ type:"string" }
                        , vinNo             :{ type:"string" }
                        , carRegNo          :{ type:"string" }
                        , saleContractNo    :{ type:"string" }
                        , eqipPrsnId        :{ type:"string" }
                        , contractCustTp    :{ type:"string" }
                        , contractStatCd    :{ type:"string" }
                        , dcLvlCd           :{ type:"string" }
                        , dcApproveYn       :{ type:"string" }
                        , regDt             :{ type:"date"   }
                        , goodsContractDt   :{ type:"date"   }
                        , expcGiEndDt       :{ type:"date"   }
                        , realDlDt          :{ type:"date"   }
                        , dcApproveDt       :{ type:"date"   }
                        , returnDt          :{ type:"date"   }
                        , goodsAmt          :{ type:"number" }
                        , prenAmt           :{ type:"number" }
                        , goodsRealAmt      :{ type:"number" }
                        , addPrenAmt        :{ type:"number" }
                        , custPayAmt        :{ type:"number" }
                        , goodsCnt          :{ type:"number" }
                        , updtDtStr         :{ type:"string" }
                    }
                }
            }
        }
        ,height:353
        ,selectable:"row"
        ,scrollable :true
        ,sortable   :false
        ,autoBind   :false
        ,filterable :false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,pageable:{
            refresh:false
           ,pageSize:100
           ,buttonCount:3
           ,input:false
        }
        ,editable:false
        ,change:function(e){
            var selectedItem = this.dataItem(this.select()),
            readObj = {};

            //console.log('selectedItem:',selectedItem);
            selectGridHeadObj = selectedItem;
            if( selectedItem != null && selectedItem != 'undefined'){
                initHiddenForm();
                //$("#etcGrDocNo").val('');
                $("#dlrCd").val(selectedItem.dlrCd);
                $("#goodsContractNo").val(selectedItem.goodsContractNo);
                $("#contractStatCd").val(selectedItem.contractStatCd);
                $("#goodsTp").val(selectedItem.goodsTp);
                $("#contractCustNo").val(selectedItem.contractCustNo);
                $("#contractCustNm").val(selectedItem.contractCustNm);
                $("#contractCustTp").val(selectedItem.contractCustTp);
                $("#vinNo").val(selectedItem.vinNo);
                $("#custPayAmt").val(selectedItem.custPayAmt);
                $("#saleContractNo").val(selectedItem.saleContractNo);
                $("#carBrandCd").val(selectedItem.carBrandCd);
                $("#goodsAmt").val(selectedItem.goodsAmt);
                $("#goodsRealAmt").val(selectedItem.goodsRealAmt);
                $("#prenAmt").val(selectedItem.prenAmt);
                $("#addPrenAmt").val(selectedItem.addPrenAmt);
                $("#updtDtStr").val(selectedItem.updtDtStr);
                $("#cupnPubliNo").val(selectedItem.cupnPubliNo);
                $("#membershipNo").val(selectedItem.membershipNo);
                $("#cardNo").val(selectedItem.cardNo);
                $("#pointVal").val(selectedItem.pointVal);
                $("#pointAmt").val(selectedItem.pointAmt);

                $("#gridDetail").data("kendoExtGrid").dataSource.read();
                //readObj.goodsContractNo = selectedItem.goodsContractNo;
                //$("#gridDetail").data("kendoExtGrid").dataSource.read(readObj);

                btnView(selectedItem.contractStatCd);
            }
        }
        ,dataBound: function(e) {
            var selectedVal =  e.sender.dataItem(e.sender.tbody.find("tr")[gridRow]);
            if(selectedVal != null){
                if(selectedGoodsContractNo == selectedVal.goodsContractNo){
                    e.sender.select(e.sender.tbody.find("tr")[gridRow]);
                }
            }
        }
        ,columns:[
             {field:"goodsTp",title:"<spring:message code='global.lbl.wrkTp' />",width:80//업무유형
                ,attributes:{ "class":"ac"}
                ,template:'#= changeGoodsTp(goodsTp)#'
             }
            ,{field:"goodsContractNo",title:"<spring:message code='sal.lbl.ordNo' />",width:160}//오더번호
            ,{field:"contractStatCd",title:"<spring:message code='sal.lbl.statNm' />",attributes:{ "class":"ac"},width:90   //상태
                 ,template:function(dataItem){
                     var contractStatCdNm = changeContractStatCd(dms.string.strNvl(dataItem.contractStatCd));
                     if(dataItem.contractStatCd == "10"){
                         return "<span class='txt_label bg_green'>" + contractStatCdNm + "</span>";
                     }else if(dataItem.contractStatCd == "20"){
                         return "<span class='txt_label bg_yellow'>" + contractStatCdNm + "</span>";
                     }else if(dataItem.contractStatCd == "30"){
                         return "<span class='txt_label bg_orange'>" + contractStatCdNm + "</span>";
                     }else if(dataItem.contractStatCd == "40"){
                         return "<span class='txt_label bg_blue'>" + contractStatCdNm + "</span>";
                     }else if(dataItem.contractStatCd == "50"){
                         return "<span class='txt_label bg_red'>" + contractStatCdNm + "</span>";
                     }else if(dataItem.contractStatCd == "60"){
                         return "<span class='txt_label bg_purple'>" + contractStatCdNm + "</span>";
                     }
                     return contractStatCdNm;
                 }
                 ,sortable:false
             }
            ,{field:"contractCustNm",title:"<spring:message code='global.lbl.custNm' />",width:140,sortable:false}   //계약고객명
            ,{field:"regDt",title:"<spring:message code='sal.lbl.orderDate' />",width:130,attributes:{ "class":"ac"} //판매일자(오더일자)
                 ,format:"{0:<dms:configValue code='dateFormat' />}"
             }
            ,{field:"realDlDt",title:"<spring:message code='sal.lbl.realDlsDt' />", width:130, attributes:{ "class":"ac"}//완성일자
                 ,format:"{0:<dms:configValue code='dateFormat' />}"
             }
            ,{field:"returnDt", title:"<spring:message code='sal.lbl.returnDt' />", width:130, attributes:{ "class":"ac"}//반품일자
                 ,format:"{0:<dms:configValue code='dateFormat' />}"
             }
            ,{field:"goodsCnt", title:"<spring:message code='global.lbl.reqQty' />", width:100 ,attributes:{ "class":"ar"},format:"{0:n2}"}//요청수량
            ,{field:"carlineCd", title:"<spring:message code='global.lbl.carlineCd' />", width:100}                    //차종
            ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", width:150, attributes:{"class":"ac"}} //VIN
            ,{field:"telNo", title:"<spring:message code='sal.lbl.telNo' />", width:100}                               //고객전화번호
            ,{field:"carRegNo", title:"<spring:message code='global.lbl.carNo' />", width:100}                         //차량번호
        ]
    });

    // 용품판매품목 그리드
    $("#gridDetail").kendoExtGrid({
        gridId:"G-PAR-0221-165002"
       ,dataSource:{
            transport:{
                read:{
                     url:"<c:url value='/sal/acc/itemSales/selectAccessoryItemStockOutItemByKey.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        // 용품판매 검색조건 코드.
                        //params["sGoodsContractNo"] = options.goodsContractNo;
                        params["sGoodsContractNo"] = $("#goodsContractNo").val();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                 data:function (result){
                     var dataLen = result.data.length,
                         itemList = [],
                         header;

                     existItemChkObj = {};

                     for(var i = 0; i < dataLen; i = i + 1){

                         var goodsCnt = 0;
                         if(result.data[i].statCd == "40") goodsCnt = Number(result.data[i].goodsCnt)*-1;
                         else if(result.data[i].statCd == "30")goodsCnt = 0;
                         else goodsCnt = Number(result.data[i].goodsCnt);
                         if(existItemChkObj.hasOwnProperty(result.data[i].goodsCd)){
                             //existItemChkObj[result.data[i].goodsCd][result.data[i].giStrgeCd] = result.data[i].goodsNm;
                             existItemChkObj[result.data[i].goodsCd][result.data[i].giStrgeCd] += Number(goodsCnt);
                         }else{

                             itemList.push(result.data[i].goodsCd);
                             existItemChkObj[result.data[i].goodsCd] = {};
                             //existItemChkObj[result.data[i].goodsCd][result.data[i].giStrgeCd] = result.data[i].goodsNm;
                             existItemChkObj[result.data[i].goodsCd][result.data[i].giStrgeCd] = Number(goodsCnt);

                         }
                     }

                     return result.data;
                 }
                ,total:"total"
                ,model:{
                   id:"goodsContractNo"
                  ,fields:{
                          dlrCd             :{ type:"string" , editable:false }
                        , goodsContractNo   :{ type:"string" , editable:false }
                        , seq               :{ type:"number" , editable:false }
                        , goodsCd           :{ type:"string" , editable:false }
                        , goodsNm           :{ type:"string" }
                        , goodsUnitCd       :{ type:"string" }
                        , statCd            :{ type:"string" , editable:false }
                        , goodsCnt          :{ type:"number" }
                        , preReturnQty      :{ type:"number" , editable:false }
                        , pkgItemCd         :{ type:"string" , editable:false }
                        , giStrgeCd         :{ type:"string" , editable:false }
                        , retlPrc           :{ type:"number" }
                        , totAmt            :{ type:"number" }
                        , statCd            :{ type:"string" , editable:false }
                        , dcRate            :{ type:"number" }
                        , saleAmt           :{ type:"number" }
                        , dcAmt             :{ type:"number" }
                        , eqipCostAmt       :{ type:"number" , editable:false }
                        , taxDdctPrc        :{ type:"number" }
                        , eqipPrsnId        :{ type:"string" , editable:false }
                        , expcGiEndDt       :{ type:"date"   , editable:false }
                        , expcEqipDt        :{ type:"date"   , editable:false }
                        , realDlDt          :{ type:"date"   , editable:false }
                        , eqipEndDt         :{ type:"date"   , editable:false }
                        , returnDt          :{ type:"date"   , editable:false }
                        , avlbStockQty      :{ type:"number" , editable:false }
                        , retlTotAmt        :{ type:"number" }
                    }
                }
            }
        }
        ,height:303
        ,selectable:"multiple, row"
        ,scrollable :true
        ,sortable   :false
        ,autoBind   :false
        ,filterable :false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,pageable:false
        ,sort:function(e){
           //var ds = $("#gridDetail").data("kendoExtGrid").dataSource;
            //ds.sort({field:e.sort.field, dir:e.sort.dir});
         }
        ,edit:function(e){
            var eles = e.container.find("input"),
                grid = this,
                rows = e.sender.select(),
                selectedItem = e.sender.dataItem(rows[0]),
                input = e.container.find(".k-input"),
                contractStatCd = $("#sContractStatCd").data("kendoExtMultiSelectDropDownList").value(),
                itemList     = [],
                pVal,
                orgVal,
                dcAmt,
                lineDisabled,
                giStatCd,
                fieldName = grid.columns[e.container.index()].field;

            if(selectedItem == null){
                giStatCd = null;
            }else{
                giStatCd = selectedItem.giStatCd;
            }

            if(fieldName === "saleAmt" ||fieldName === "goodsNm" ||fieldName === "goodsUnitCd" ||fieldName === "totAmt"
               ||fieldName === "totAmt"||fieldName === "taxDdctPrc"||fieldName === "dcAmt"||fieldName === "retlTotAmt"){
                 this.closeCell();
            }
            if(fieldName === "chk"){
                this.closeCell();
            }
            if(fieldName === "goodsCd"){
                this.closeCell();
            }
            if(selectedItem != null ){
                if(fieldName === "goodsCnt"){
                    if(!(selectedItem.statCd === '10' )){ //출고요청 및 반품등록 시 에만 수정 가능
                        this.closeCell();
                    }else{
                        $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                    }
                }
                if(fieldName === "retlPrc"){
                    /* if((selectedItem.statCd != '10')){ //출고요청 시 에만 수정 가능
                        this.closeCell();
                    }else{
                        $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                    } */
                    this.closeCell();
                }
                if(fieldName === "dcRate"){
                    this.closeCell();
                }
            }else{
                this.closeCell();
            }
        }
        ,change:function(e){
            var rows = e.sender.tbody.find("tr");
            rows.each(function(index, row) {
                var item = e.sender.dataItem(row)
                  , chk = changeStatCd(item.statCd, item.goodsCnt, item.preReturnQty );

                if( chk == "disabled"){
                    $(this).removeClass("k-state-selected");
                }else{
                    if($(this).hasClass("k-state-selected")){
                        $(this).find(".grid-checkbox-item").prop("checked", true);
                    }else{
                        $(this).find(".grid-checkbox-item").prop("checked", false);
                    }
                }
            });
        }
        , columns:[
              {field:"chk" ,title:"&nbsp;" ,width:30 ,attributes:{"class":"ac"}
                 ,headerTemplate:"<input type='checkbox' class='grid-checkAll'/>"
                 ,sortable:false
                 ,template:"<input type='checkbox' data-uid='#= uid #' #= changeStatCd(statCd,goodsCnt,preReturnQty)# class='grid-checkbox-item' data-chk=false/>"
              }
            , {field:"statCd",title:"<spring:message code='sal.lbl.statNm' />", attributes:{ "class":"ac"}, width:90//부품판매상태
                 ,template:function(dataItem){
                    var statCdNm = changeItemStatCd(dms.string.strNvl(dataItem.statCd));
                     if(dataItem.statCd == "10"){ //출고대기
                         return "<span class='txt_label bg_green'>" + statCdNm + "</span>";
                     }else if(dataItem.statCd == "20"){ //출고
                         return "<span class='txt_label bg_blue'>" + statCdNm + "</span>";
                     }else if(dataItem.statCd == "30"){//반품대기
                         return "<span class='txt_label bg_orange'>" + statCdNm + "</span>";
                     }else if(dataItem.statCd == "40"){//반품
                         return "<span class='txt_label bg_red'>" + statCdNm + "</span>";
                     }
                     return statCdNm;
                 }
                 ,sortable:false
              }
             ,{field:"goodsCd", title:"<spring:message code='sal.lbl.goodsCd' />", width:140}   //부품번호
             ,{field:"goodsNm", title:"<spring:message code='sal.lbl.goodsNm' />", width:200}   //부품명
             ,{field:"strgeNm" ,title:"<spring:message code='sal.lbl.strgeCd' /> " ,attributes:{"class":"al"}   ,width:120}
             ,{field:"goodsCnt", title:"<spring:message code='sal.lbl.qty' />", width:60, attributes:{ "class":"ar"}
                 //,editor:changeAmtEditor
                 ,format:"{0:n0}"//수량
                 ,template:function(dataItem){
                     var spanObj = 0;
                     if(dataItem.goodsCnt != null){

                         if(dataItem.statCd === '30'||dataItem.statCd === '40'){
                             spanObj = Number(dataItem.goodsCnt) * -1;
                         }else{
                             spanObj = dataItem.goodsCnt;
                         }
                     }
                     return spanObj;
                  }
                  ,editor:function(container, options) {
                     $('<input name="goodsCnt" data-bind="value:' + options.field + '" maxlength="4" />')
                     .appendTo(container)
                     .kendoExtNumericTextBox({
                        format:"n0"
                        ,min:0
                        ,max:999
                        ,restrictDecimals: true
                        ,spinners:false
                        ,change: function(){
                            changeAmtEditor(container, options)
                        }
                     });
                 }
              }
            ,{field:"retlPrc", title:"<spring:message code='sal.lbl.costCh' />", width:120, attributes:{ "class":"ar" }                     //단가(세금포함)
                 //,editor:changeAmtEditor
                 ,format:"{0:n2}"
              }
            ,{field:"taxDdctPrc", title:"<spring:message code='sal.lbl.costNon' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}"}//단가(세금제외)
            ,{field:"dcRate", title:"<spring:message code='sal.lbl.upgrdRate' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}" //D/C Rate
                 //,editor:changeAmtEditor
                 ,template:function(dataItem){
                     var spanObj = "";
                     if(dataItem.statCd === '30'||dataItem.statCd === '40'){
                         spanObj = Number(dataItem.dcRate) * -1;
                     }else{
                         spanObj = dataItem.dcRate;
                     }
                     return (spanObj).toFixed(2) + "%";;
                }
              }
             ,{field:"totAmt", title:"<spring:message code='global.lbl.salePriceCost01' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}"
                 ,template:function(dataItem){
                     var spanObj = "";
                     if(dataItem.statCd === '30'||dataItem.statCd === '40'){
                         spanObj = Number(dataItem.saleAmt * dataItem.goodsCnt + dataItem.eqipCostAmt) *-1;
                     }else{
                         spanObj = dataItem.saleAmt * dataItem.goodsCnt + dataItem.eqipCostAmt;
                     }

                     return dms.string.addThousandSeparatorCommas(Number(spanObj).toFixed(2));;
                  }
              }//소매가
            , {field:"avlbStockQty" ,title:"<spring:message code='par.lbl.realAvlbStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n0}" ,width:80}
            , {field:"eqipCostAmt", title:"<spring:message code='sal.lbl.eqipCost' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}" }    //설치비용
            , {field:"retlTotAmt" ,title:" " ,attributes:{"class":"ar"} ,format:"{0:n0}" ,width:80,hidden:true}
            , {field:"refDocNo" ,title:" " ,attributes:{"class":"ar"}   ,width:80,hidden:true}
            , {field:"refDocLineNo" ,title:" " ,attributes:{"class":"ar"} ,format:"{0:n0}" ,width:80,hidden:true}
        ]
    });

    $("#gridDetail .k-grid-content").on("change","input.grid-checkbox-item",function(e){
        var grid = $("#gridDetail").data("kendoExtGrid"),
            dataItem = grid.dataItem($(e.target).closest("tr")),
            row = grid.tbody.find("tr[data-uid='" + dataItem.uid + "']");
        if ($(this).is(":checked")) {
            grid.select(row);
        } else {
            $(e.currentTarget).closest("tr").removeClass("k-state-selected");
            $(row).removeClass("k-state-selected");
        }
    });

    // 판매상태에 따른 체크
    changeStatCd = function(pStatCd,pGoodsCnt,pPreReturnQty ){
        var returnVal = "";

        if(pStatCd === '20'){
           if(Number(pPreReturnQty) >= Number(pGoodsCnt)){
              returnVal = 'disabled';
          }
        }else if(pStatCd === '40'){
            returnVal = 'disabled';
        }
        return returnVal;
    };


    // 단위
    changeUnitCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = unitCdObj[val];
        }
        return returnVal;
    };

    // 창고
     changeStrgeCd = function(val){
         var returnVal = "";
         if(val != null && val != ""){
             returnVal = giStrgeTpObj[val];
         }
         return returnVal;
     };

    // 판매상태
     changeItemStatCd = function(val){
         var returnVal = "";
         if(val != null && val != ""){
             returnVal = itemStatCdObj[val];
         }
         return returnVal;
     };

    // 판매계약상태
     changeContractStatCd = function(val){
         var returnVal = "";
         if(val != null && val != ""){
             returnVal = contractStatCdObj[val];
         }
         return returnVal;
     };

    // 업무유형
     changeGoodsTp = function(val){
         var returnVal = "";
         if(val != null && val != ""){
             returnVal = goodsTpObj[val];
         }
         return returnVal;
     };

    initPage();
});


// 부품판매 정보 조회.
function selectGoodsContract(pGoodsContractNo){
   var readObj = {};
   readObj.goodsContractNo = pGoodsContractNo;

   $.ajax({
       url:"<c:url value='/sal/acc/itemSales/selectAccessoryItemSalesByKey.do' />",
       data:JSON.stringify({ sGoodsContractNo:pGoodsContractNo}),
       type:"POST",
       dataType:"json",
       contentType:"application/json",
       error:function(jqXHR,status,error) {
           dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
       }

   }).done(function(result) {
       $("#dlrCd").val(result.dlrCd);
       $("#goodsContractNo").val(result.goodsContractNo);
       $("#contractStatCd").val(result.contractStatCd);
       $("#goodsTp").val(result.goodsTp);
       $("#contractCustNo").val(result.contractCustNo);
       $("#contractCustTp").val(result.contractCustTp);
       $("#custPayAmt").data("kendoExtNumericTextBox").value(result.custPayAmt);
       $("#saleContractNo").val(result.saleContractNo);
       $("#carBrandCd").val(result.carBrandCd);
       $("#goodsAmt").data("kendoExtNumericTextBox").value(result.goodsAmt);
       $("#goodsRealAmt").data("kendoExtNumericTextBox").value(result.goodsRealAmt);
       $("#prenAmt").data("kendoExtNumericTextBox").value(result.prenAmt);
       $("#addPrenAmt").data("kendoExtNumericTextBox").value(result.addPrenAmt);
       $("#updtDtStr").val(result.updtDtStr);

       $("#gridHead").data("kendoExtGrid").dataSource.read();
       $("#gridDetail").data("kendoExtGrid").dataSource.read(readObj);

   });

}

function initPage(){
    var minDate = new Date(searchBfDt),
        maxDate = new Date(toDt),
        toYY,
        toMM,
        toDD,
        frYY,
        frMM,
        frDD;

   if(!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])){
       return false;
   }

   // 품목 정보 Reset
   //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
   partsJs.validate.groupObjAllDataInit();

   $("#gridHead").data("kendoExtGrid").dataSource.data([]);
   $("#gridDetail").data("kendoExtGrid").dataSource.data([]);

   //$("#sContractStatCd").data("kendoExtMultiSelectDropDownList").enable(false);

    existItemChkObj   = {};
    selectGridHeadObj = {};

    frYY = minDate.getFullYear();
    frMM = minDate.getMonth();
    frDD = minDate.getDate();

    toYY = maxDate.getFullYear();
    toMM = maxDate.getMonth();
    toDD = maxDate.getDate();

    $("#sStartRegDt").data("kendoExtMaskedDatePicker").value(searchBfDt);
    $("#sEndRegDt").data("kendoExtMaskedDatePicker").value(toDt);

    $("#sStartRegDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
    $("#sEndRegDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));


    $("#form").get(0).reset();
    btnView(); //초기화 시 버튼 구성
}

function initHiddenForm(){

    gridRow = 0;
    $("#form").get(0).reset();
}

function btnView(pStat){

    if(pStat === "10"){//요청 상태 인경우
        $("#btnReturn").data("kendoButton").enable(false);
        $("#btnSave").data("kendoButton").enable(true);
        $("#btnCnfm").data("kendoButton").enable(true);
        $("#sGoodsTp").data("kendoExtDropDownList").enable(false);

        $("#btnAdd").data("kendoButton").enable(true);
        $("#btnDelItem").data("kendoButton").enable(true);

    }else if(pStat === "20"){ //부분출고
        $("#btnReturn").data("kendoButton").enable(true);
        $("#btnSave").data("kendoButton").enable(true);
        $("#btnCnfm").data("kendoButton").enable(true);
        $("#sGoodsTp").data("kendoExtDropDownList").enable(false);

        $("#btnAdd").data("kendoButton").enable(true);
        $("#btnDelItem").data("kendoButton").enable(true);

    }else if(pStat === "30"){ //전체출고
        $("#btnReturn").data("kendoButton").enable(true);
        $("#btnSave").data("kendoButton").enable(true);
        $("#btnCnfm").data("kendoButton").enable(true);
        $("#sGoodsTp").data("kendoExtDropDownList").enable(false);

        $("#btnAdd").data("kendoButton").enable(true);
        $("#btnDelItem").data("kendoButton").enable(true);

    }else if( pStat === "40"){ //완성
        $("#btnReturn").data("kendoButton").enable(false);
        $("#btnSave").data("kendoButton").enable(false);
        $("#btnCnfm").data("kendoButton").enable(false);
        $("#sGoodsTp").data("kendoExtDropDownList").enable(false);

        $("#btnAdd").data("kendoButton").enable(false);
        $("#btnDelItem").data("kendoButton").enable(false);
    }else{ //취소
        $("#btnReturn").data("kendoButton").enable(false);
        $("#btnSave").data("kendoButton").enable(false);
        $("#btnCnfm").data("kendoButton").enable(false);
        $("#sGoodsTp").data("kendoExtDropDownList").enable(false);

        $("#btnAdd").data("kendoButton").enable(false);
        $("#btnDelItem").data("kendoButton").enable(false);
    }
}

function calTotalAmt(){
    var rows         = $("#gridDetail").data("kendoExtGrid").tbody.find("tr"),
        custPayAmt   = 0,
        goodsRealAmt = 0,
        prenAmt      = 0;

    //  금액 계산
    rows.each(function(index, row) {

       data = $("#gridDetail").data("kendoExtGrid").dataItem(rows[index]);

        if(data.statCd === '30' || data.statCd === '40'){
            //custPayAmt   = custPayAmt - Number(data.saleAmt);
            goodsRealAmt = goodsRealAmt - Number(data.totAmt);
            prenAmt      = prenAmt - (Number(data.dcAmt) * Number(Math.abs(data.goodsCnt)));
        }else{
            //custPayAmt    = custPayAmt + Number(data.saleAmt);
            goodsRealAmt  = goodsRealAmt + Number(data.totAmt);
            prenAmt       = prenAmt + (Number(data.dcAmt) * Number(data.goodsCnt));
        }

    });

    custPayAmt = Math.max(Number(goodsRealAmt) - Number($("#addPrenAmt").data("kendoExtNumericTextBox").value()), 0);
    $("#custPayAmt").data("kendoExtNumericTextBox").value(custPayAmt);
    $("#goodsRealAmt").data("kendoExtNumericTextBox").value(goodsRealAmt);
    $("#prenAmt").data("kendoExtNumericTextBox").value(prenAmt);

}

// 판매리스트 팝업 열기 함수.
function selectGoodsContractListPopupWindow(){


    popupWindow = dms.window.popup({
        windowId:"goodsContractListPopup"
        ,title:"<spring:message code='sal.lbl.ordNo' />"   // 판매번호
        ,width :780
        ,height:420
        ,content:{
            url:"<c:url value='/sal/cmm/selectAccessoryItemSaleMngSearchPopup.do'/>"
            ,data:{
                  "type":"null"
                , "autoBind":false
                //, "goodsTp":$("#sGoodsTp").data("kendoExtDropDownList").value()
                , "selectable":"single"
                , "callbackFunc":function(data){
                    if(data.length === 1)
                    {
                        $("#sGoodsContractNo").val(data[0].goodsContractNo);
                        selectGoodsContract(data[0].goodsContractNo);
                    }
                    $("#goodsContractListPopup").data("kendoWindow").close();
                }
            }
        }
    });
}

// 판매반품 팝업 열기 함수.
function fnAccessoryItemStockOutReturnPopupWindow(pSelectedLine){

    dms.window.popup({
        windowId:"setAccessoryItemStockOutReturnPopup"
        ,title:"<spring:message code='par.btn.innerReturn' />"   // 반품
        ,width :340
        ,height:180
        ,content:{
            url:"<c:url value='/sal/acc/itemSales/setAccessoryItemStockOutReturnPopup.do'/>"
            ,data:{
                  "goodsCnt":pSelectedLine.goodsCnt
                , "avlbReturnQty":pSelectedLine.avlbReturnQty
                , "goodsCd":pSelectedLine.goodsCd
                , "goodsNm":pSelectedLine.goodsNm
                , "callbackFunc":function(returnQty){
                        //console.log('setPartsSaleOrdReturnPopupWindow:',data);

                        var mdfDcAmt   = 0,
                            mdfSaleAmt = 0,
                            mdfDcRate  = pSelectedLine.dcRate,
                            mdfEqipCostAmt = 0;
                        var eqipCostAmtYn = true; //설치비용 반품유무
                        var grid = $("#gridDetail").data("kendoExtGrid");
                        var rows = grid.select();
                        var rtnAbleQty = 0;
                        var rtnQty = 0; //반품 수량

                        $.each(grid.dataSource.data(), function(idx, dataItem){

                            if(pSelectedLine.goodsCd == dataItem.goodsCd
                                    && pSelectedLine.giStrgeCd == dataItem.giStrgeCd
                                    && (dataItem.statCd != "20")){

                                  rtnQty += Math.abs(dataItem.goodsCnt)*-1;

                                  if(Math.abs(dataItem.eqipCostAmt) > 0 ){
                                      eqipCostAmtYn = false;
                                  }
                             }
                        });

                        rtnAbleQty = pSelectedLine.goodsCnt + rtnQty;

                       /*  if(Number(pSelectedLine.avlbReturnQty) === Number(pSelectedLine.goodsCnt)){
                            if(Number(pSelectedLine.eqipCostAmt) > 0){
                                mdfEqipCostAmt = pSelectedLine.eqipCostAmt;
                            }
                        } */

                      //마지막  반품 시에만 반품금액에 설치비용을 합친다.
                        if(Number(rtnAbleQty) === Number(returnQty)){
                            if(Number(pSelectedLine.eqipCostAmt) > 0 && eqipCostAmtYn){
                                mdfEqipCostAmt = pSelectedLine.eqipCostAmt ;
                            }
                        }

                        $("#gridDetail").data("kendoExtGrid").dataSource.add({
                            dlrCd:pSelectedLine.dlrCd                  //딜러코드
                           ,goodsContractNo:""                         //용품계약번호
                           ,goodsCd:pSelectedLine.goodsCd              //용품코드
                           ,goodsNm:pSelectedLine.goodsNm              //용품명
                           ,carlineCd:pSelectedLine.carlineCd          //차종
                           ,goodsCnt:returnQty                         //수량
                           ,goodsUnitCd:pSelectedLine.goodsUnitCd      //단위
                           ,retlPrc:pSelectedLine.retlPrc              //단가
                           ,dcRate:pSelectedLine.dcRate                //우대율
                           ,dcAmt:pSelectedLine.dcAmt                  //우대금액
                           ,saleAmt:pSelectedLine.saleAmt              //실제판매가
                           ,retlTotAmt:Number(returnQty) * Number(pSelectedLine.saleAmt)       //판매금액
                           ,expcEqipDt:""                              //설치예정일
                           ,expcGiEndDt:""                             //설치완료일
                           ,eqipCostAmt:mdfEqipCostAmt                 //설치비용
                           ,eqipPrsnId:""                              //설치담당
                           ,realDlDt:""                                //출고일
                           ,totAmt:(Number(returnQty) * Number(pSelectedLine.saleAmt)) + mdfEqipCostAmt  //금액
                           ,pkgItemCd:pSelectedLine.pkgItemCd          //패키지품목코드
                           ,giStrgeCd:pSelectedLine.giStrgeCd          //출고창고
                           ,eqipEndDt:""                               //설치완료일
                           ,returnDt:""                                //반품일
                           ,statCd:"30"                                //처리상태
                           ,preReturnQty:0                             //기반품수량
                           ,seq:""                                     //순번
                           ,orgRetlPrc:pSelectedLine.orgRetlPrc        //단가(소매가)
                           ,taxDdctPrc:pSelectedLine.retlPrc/vatCd      //단가(소매가) 세금제외외
                           ,refDocNo:pSelectedLine.goodsContractNo
                           ,refDocLineNo:pSelectedLine.seq
                       });

                    $("#setAccessoryItemStockOutReturnPopup").data("kendoWindow").close();
                    calTotalAmt();
                }
            }
        }
    });
}

//상세정보 팝업 화면에서 용품조회 팝업 출력
function openAccessoryItemSearchPopup(pDlrCd, pGoodsContractNo, grid){
    dms.window.popup({
        windowId:"accessoryItemSearchPopup"
        ,title:"<spring:message code='sal.title.goodsSearch' />"
        //,width:900
        //,height:450
        ,content:{
            url:"<c:url value='/sal/acc/itemSales/selectAccessoryItemSearchPopup.do'/>"
            ,data:{
                "type":null
                ,"autoBind":true
                ,"selectable":"multiple"
                ,"callbackFunc":function(data, type){

                    var existItem = true;
                    //용품패키지
                    if(type == "package"){
                        var pkgItemCd = "";
                        var itemData = {};

                        if(data.length > 0 && isPackage(grid, data[0].pkgItemCd)){
                            // 동일한 패키지가 존재합니다.
                            dms.notification.info("<spring:message code='sal.info.IsPackageMsg'/>");
                            existItem = false;
                            return false;
                        }

                        for(var i=0; i<data.length; i++){
                            itemData = {};
                            itemData["dlrCd"] = $("#dlrCd").val();
                            itemData["goodsContractNo"] = "";
                            itemData["statCd"] = "10";
                            itemData["goodsCd"] = data[i].itemCd;
                            itemData["goodsNm"] = data[i].itemNm;
                            itemData["goodsCnt"] = 1;
                            itemData["goodsUnitCd"] = dms.string.strNvl(data[i].stockUnitCd) != "" ? data[i].stockUnitCd:data[i].itemUnitCd ;
                            itemData["retlPrc"] = Number(data[i].itemPrc);
                            itemData["dcRate"] = Number(data[i].pkgDetlDcRate);
                            itemData["dcAmt"] = Number(data[i].pkgDetlDcAmt);
                            itemData["saleAmt"] = Number(data[i].pkgDetlDcTotAmt);
                            itemData["retlTotAmt"] = Number(data[i].pkgDetlDcTotAmt);
                            itemData["expcEqipDt"] = "";
                            itemData["expcGiEndDt"] = "";
                            itemData["eqipCostAmt"] = 0 ;
                            itemData["eqipPrsnId"] = "";
                            itemData["realDlDt"] = "";
                            itemData["totAmt"] = Number(data[i].pkgDetlDcTotAmt);
                            itemData["pkgItemCd"] = data[i].pkgItemCd;
                            itemData["grStrgeCd"] = "";
                            itemData["giStrgeCd"] = data[i].strgeCd;
                            itemData["eqipEndDt"] = "";
                            itemData["returnDt"] = "";
                            itemData["preReturnQty"] = 0;
                            itemData["seq"] = "";
                            itemData["orgRetlPrc"] = Number(data[i].itemPrc);
                            itemData["taxDdctPrc"] = Number(data[i].itemPrc)/vatCd;
                            itemData["avlbStockQty"] = Number(data[i].avlbStockQty);
                            itemData["dirty"] = true;
                            grid.dataSource.insert(i, itemData);
                        }

                    //용품
                    }else{
                        $.each(data, function(idx, item){
                            if(existItemChkObj.hasOwnProperty(item.itemCd)){
                                if(existItemChkObj[item.itemCd].hasOwnProperty(item.strgeCd) &&
                                    existItemChkObj[item.itemCd][item.strgeCd] > 0
                                ){
                                    //이미 등록되어있는 부품입니다.
                                    var itemInfo = item.itemCd + '[' + item.itemNm + ']'+ '[' + item.strgeCd + ']';
                                    dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                                    existItem = false;
                                    return false;
                                }else{
                                    //existItemChkObj[item.itemCd][item.strgeCd] = item.itemNm;
                                    existItemChkObj[item.itemCd][item.strgeCd] = 1;

                                    grid.dataSource.add({
                                        dlrCd:$("#dlrCd").val()                    //딜러코드
                                       ,goodsContractNo:""  //용품계약번호
                                       ,goodsCd:item.itemCd                        //용품코드
                                       ,goodsNm:item.itemNm                        //용품명
                                       ,carlineCd:""                               //차종
                                       ,goodsCnt:1                                 //수량
                                       ,goodsUnitCd:item.stockUnitCd               //단위
                                       ,retlPrc:item.retlPrc                       //단가
                                       ,dcRate:0                                   //우대율
                                       ,dcAmt:0                                    //우대금액
                                       ,saleAmt:item.retlPrc                       //실제판매가
                                       ,retlTotAmt:item.retlPrc                    //용품총가격
                                       ,expcEqipDt:""                              //설치예정일
                                       ,expcGiEndDt:""                             //설치완료일
                                       ,eqipCostAmt:item.etc2                      //설치비용
                                       ,eqipPrsnId:""                              //설치담당
                                       ,realDlDt:""                                //출고일
                                       ,totAmt:item.retlPrc+item.etc2              //금액
                                       ,pkgItemCd:""                               //패키지품목코드
                                       ,giStrgeCd:item.strgeCd                     //출고창고
                                       ,eqipEndDt:""                               //설치완료일
                                       ,returnDt:""                                //반품일
                                       ,statCd:"10"                                //처리상태
                                       ,preReturnQty:0                             //기반품수량
                                       ,seq:""                                     //순번
                                       ,orgRetlPrc:item.retlPrc                    //단가(소매가)
                                       ,taxDdctPrc:item.retlPrc/vatCd               //단가(소매가) 세금제외외
                                       ,avlbStockQty:item.avlbStockQty             //가용재고
                                   });
                                }

                            }else{
                                existItemChkObj[item.itemCd] = {};
                                //existItemChkObj[item.itemCd][item.strgeCd] = item.itemNm;
                                existItemChkObj[item.itemCd][item.strgeCd] = 1;

                                grid.dataSource.add({
                                    dlrCd:$("#dlrCd").val()                    //딜러코드
                                   ,goodsContractNo:""  //용품계약번호
                                   ,goodsCd:item.itemCd                        //용품코드
                                   ,goodsNm:item.itemNm                        //용품명
                                   ,carlineCd:""                               //차종
                                   ,goodsCnt:1                                 //수량
                                   ,goodsUnitCd:item.stockUnitCd               //단위
                                   ,retlPrc:item.retlPrc                       //단가
                                   ,dcRate:0                                   //우대율
                                   ,dcAmt:0                                    //우대금액
                                   ,saleAmt:item.retlPrc                       //실제판매가
                                   ,retlTotAmt:item.retlPrc                    //용품총가격
                                   ,expcEqipDt:""                              //설치예정일
                                   ,expcGiEndDt:""                             //설치완료일
                                   ,eqipCostAmt:item.etc2                      //설치비용
                                   ,eqipPrsnId:""                              //설치담당
                                   ,realDlDt:""                                //출고일
                                   ,totAmt:item.retlPrc+item.etc2              //금액
                                   ,pkgItemCd:""                               //패키지품목코드
                                   ,giStrgeCd:item.strgeCd                     //출고창고
                                   ,eqipEndDt:""                               //설치완료일
                                   ,returnDt:""                                //반품일
                                   ,statCd:"10"                                //처리상태
                                   ,preReturnQty:0                             //기반품수량
                                   ,seq:""                                     //순번
                                   ,orgRetlPrc:item.retlPrc                    //단가(소매가)
                                   ,taxDdctPrc:item.retlPrc/vatCd               //단가(소매가) 세금제외외
                                   ,avlbStockQty:item.avlbStockQty             //가용재고
                               });
                            }

                        });
                    }

                    if(existItem){
                        $("#accessoryItemSearchPopup").data("kendoWindow").close();
                        calTotalAmt();
                    }
                }
            }
        }
    });
}

// 중복패키지 검색
function isPackage(grid, pkg){
    var isPackageFlag = false;
    var rows = grid.tbody.find("tr");
    $.each(rows, function(index, row) {
        var rowItem = grid.dataItem(row);
        if(pkg == rowItem.pkgItemCd){
            isPackageFlag = true;
        }
    });
    return isPackageFlag;
}

function fnChkDateValue(e){

    var  elmt  = e.sender.element[0],
         id    = elmt.id,
         toYY,
         toMM,
         toDD,
         frYY,
         frMM,
         frDD;

    if(this.value() == null){
        if(id === 'sStartExpcGiEndDt'){
            var minDate = new Date(searchBfDt);
            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();
            $("#sStartExpcGiEndDt").data("kendoExtMaskedDatePicker").value(searchBfDt);
            $("#sEndExpcGiEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'sEndExpcGiEndDt'){
            var maxDate = new Date(toDt);
            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();

            $("#sEndExpcGiEndDt").data("kendoExtMaskedDatePicker").value(toDt);
            $("#sStartExpcGiEndDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }else if(id === 'sStartRegDt'){
            var minDate = new Date(searchBfDt);
            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();
            $("#sStartRegDt").data("kendoExtMaskedDatePicker").value(searchBfDt);
            $("#sEndRegDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'sEndRegDt'){
            var maxDate = new Date(toDt);
            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();

            $("#sEndRegDt").data("kendoExtMaskedDatePicker").value(toDt);
            $("#sStartRegDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }else if(id === 'sStartRealDlDt'){
            var minDate = new Date(searchBfDt);
            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();
            $("#sStartRealDlDt").data("kendoExtMaskedDatePicker").value(searchBfDt);
            $("#sEndRealDlDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'sEndRealDlDt'){
            var maxDate = new Date(toDt);
            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();

            $("#sEndRealDlDt").data("kendoExtMaskedDatePicker").value(toDt);
            $("#sStartRealDlDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }else if(id === 'sStartReturnDt'){
            var minDate = new Date(searchBfDt);
            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();
            $("#sStartReturnDt").data("kendoExtMaskedDatePicker").value(searchBfDt);
            $("#sEndReturnDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'sEndReturnDt'){
            var maxDate = new Date(toDt);
            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();

            $("#sEndReturnDt").data("kendoExtMaskedDatePicker").value(toDt);
            $("#sStartReturnDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }
    }else{
        if(id === 'sStartExpcGiEndDt'){
            frYY = this.value().getFullYear();
            frMM = this.value().getMonth();
            frDD = this.value().getDate();
            $("#sEndExpcGiEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'sEndExpcGiEndDt'){
            toYY = this.value().getFullYear();
            toMM = this.value().getMonth();
            toDD = this.value().getDate();
            $("#sStartExpcGiEndDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }else if(id === 'sStartRegDt'){
            frYY = this.value().getFullYear();
            frMM = this.value().getMonth();
            frDD = this.value().getDate();
            $("#sEndRegDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'sEndRegDt'){
            toYY = this.value().getFullYear();
            toMM = this.value().getMonth();
            toDD = this.value().getDate();
            $("#sStartRegDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }else if(id === 'sStartRealDlDt'){
            frYY = this.value().getFullYear();
            frMM = this.value().getMonth();
            frDD = this.value().getDate();
            $("#sEndRealDlDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'sEndRealDlDt'){
            toYY = this.value().getFullYear();
            toMM = this.value().getMonth();
            toDD = this.value().getDate();
            $("#sStartRealDlDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }else if(id === 'sStartReturnDt'){
            frYY = this.value().getFullYear();
            frMM = this.value().getMonth();
            frDD = this.value().getDate();
            $("#sEndReturnDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'sEndReturnDt'){
            toYY = this.value().getFullYear();
            toMM = this.value().getMonth();
            toDD = this.value().getDate();
            $("#sStartReturnDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }
    }


 }

 //고객조회 팝업 출력
 function openCustomerSearchPopup(custNm, callbackFunc){
     popupWindow = dms.window.popup({
         windowId:"customerSearchPopup"
         , title:"<spring:message code='global.title.custSearch' />"
         , modal:true
         , content:{
             url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
             , data:{
                 "autoBind":true
                 , "custNm":custNm
                 , "callBackTp":"BTN_CREATE"
                 , "closeYn":"Y"
                 , "type":null
                 , "callbackFunc":function(data){
                     if(data.length >= 1) {
                         callbackFunc(data);
                     }
                     //popupWindow.close();

                     if(data.callBackTp == "BTN_CREATE" ){
                         window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custReg' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoRegMain.do' />", "VIEW-D-10623");
                     }
                 }
             }
         }
     });
 }



//용품판매품목상태를 체크하여 용품판매문서상태를 조정하여 준다.
//1.전체출고 : 용품판매품목상태가 출고(20),반품(40)만 포함
//2.부분출고 : 용품판매품목상태가 출고대기(10) 또는 반품대기(30) 와  출고(20) 또는 반품(40)이 함께 포함
function documentStatChange(){
   var gridHead = $("#gridHead").data("kendoExtGrid");
   var grid = $("#gridDetail").data("kendoExtGrid");

   var selectedVal = gridHead.dataItem(gridHead.select());
   var items = grid.dataSource.data();

       var releaseWaitCnt = 0; //출고대기수
       var releaseCnt = 0;     //출고수
       var returnWaitCnt = 0;  //반품대기수
       var returnCnt = 0;      //반품수

       var goodsCnt = 0;

       var goodItemCnt = grid.dataSource.data().length;

       $.each(grid.dataSource.data(), function(idx, dataItem){

           if(dataItem.statCd == "10"){//출고대기(10)
               releaseWaitCnt += dataItem.goodsCnt;
               goodsCnt += dataItem.goodsCnt;
           }else if(dataItem.statCd == "20"){//출고(20)
               releaseCnt += dataItem.goodsCnt;
               goodsCnt += dataItem.goodsCnt;
           }else if(dataItem.statCd == "30"){//반품대기(30)
               returnWaitCnt += Math.abs(dataItem.goodsCnt)*-1;;
               goodsCnt += Math.abs(dataItem.goodsCnt)*-1;
           }else if(dataItem.statCd == "40"){//반품(40)
               returnCnt += Math.abs(dataItem.goodsCnt)*-1;;
               goodsCnt += Math.abs(dataItem.goodsCnt)*-1;
           }
       });

  // console.log("[goodsCnt="+goodsCnt+"]"+"[releaseWaitCnt="+releaseWaitCnt+"]"+"[releaseCnt="+releaseCnt+"]"+"[returnWaitCnt="+returnWaitCnt+"]"+"[returnCnt="+returnCnt+"]");
       if(goodItemCnt > 0 ){
           if( (releaseWaitCnt+ returnWaitCnt == 0 && ( releaseCnt + returnWaitCnt + returnCnt > 0) )  && goodsCnt > 0   ){  //전체출고
               $("#contractStatCd").val("30");
//           }else if( (releaseWaitCnt > 0 && ( releaseCnt + returnWaitCnt + returnCnt == 0 )) ){
           }else if( (  ( releaseCnt + returnCnt == 0 )) ){
               $("#contractStatCd").val("10");                  //출고대기
           }else{
               $("#contractStatCd").val("20");                  //부분출고
           }
       }else{
           $("#contractStatCd").val("10");                  //출고대기
       }
//console.log("[contractStatCd="+$("#contractStatCd").val()+"]");

}

</script>
<!-- //script -->


<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<!-- 부품판매출고 -->
<div id="resizableContainer">
    <section class="group" id="partsSaleOrdSection">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="par.lbl.custInfo" /><!-- 고객 정보 --></h1> --%>
            <div class="btn_left">
            <dms:access viewId="VIEW-D-11812" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnInit" name="btnInit" class="btn_m btn_reset"><spring:message code="par.btn.init" /></button><!-- 초기화 -->
            </dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11811" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSave" class="btn_m"><spring:message code="par.btn.save" /></button><!-- 저장 -->
            </dms:access>
            <dms:access viewId="VIEW-D-11810" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnCnfm" class="btn_m"><spring:message code="par.btn.partMarPrcSale" /></button><!--부품판매출고 -->
            </dms:access>
            <dms:access viewId="VIEW-D-11809" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnReturn" class="btn_m"><spring:message code="par.btn.partsSaleReturn" /></button><!--부품판매반품 -->
            </dms:access>
            <dms:access viewId="VIEW-D-11803" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnCancel" class="btn_m btn_cancel hidden"><spring:message code="par.btn.cancel" /></button><!--취소  -->
            </dms:access>
            <dms:access viewId="VIEW-D-11808" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnPrint" class="btn_m"><spring:message code="par.btn.receivePrint" /></button><!--인쇄 -->
            </dms:access>
            </div>
        </div>

        <div class="table_form form_width_70per" id="custForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:17%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col style="width:10%;">
                    <col style="width:14%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.custTp" /></span><!-- 고객유형 --></th>
                        <td class="required_area">
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="custTp" data-type="combo" class="form_comboBox" />
                                </div>
                                <div class="date_right">
                                    <label class="label_check"><input type="checkbox" id="instantCust" class="form_check" data-type="checkbox"/><spring:message code="par.lbl.instantCust" /></label>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpCstCd" /></span><!-- 거래처코드 --></th>
                        <td class="required_area">
                            <div class="form_search">
                                <input type="text" id="custCd" class="form_input form_readonly" readonly />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpCstNm" /></span><!-- 거래처명 --></th>
                        <td class="required_area">
                            <input type="text" id="custNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.prsnHpNo" /><!-- 연락처 --></th>
                        <td>
                            <input id="custTelNo" type="text" class="form_input" />
                        </td>
                    </tr>
                    <tr class="hidden">
                        <th scope="row"><spring:message code="par.lbl.carOwner" /></th>
                        <td>
                            <input id="carOwner" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.prsnTelNo" /><!-- 고정전화 --></th>
                        <td>
                            <input id="custHpNo" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.prsnTelNo" /><!-- 고정전화 --></th>
                        <td>
                            <input id="bpTelNo" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.prsnHpNo" /><!-- 핸드폰 --></th>
                        <td>
                            <input id="bpHpNo" type="text" class="form_input" />
                        </td>
                    </tr>
                    <tr class="hidden">
                        <th scope="row"><spring:message code="par.lbl.partsSaleBuyer" /><!-- 구매자 --></th>
                        <td>
                            <input id="partsSaleBuyer" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.certNo" /><!-- 증서번호 --></th>
                        <td>
                            <input id="certNo" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.prsnTelNo" /><!-- 고정전화 --></th>
                        <td>
                            <input id="certTelNo" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.prsnHpNo" /><!-- 핸드폰 --></th>
                        <td>
                            <input id="certHpNo" type="text" class="form_input" />
                        </td>
                    </tr>
                    <tr class="hidden">
                        <th scope="row"><spring:message code="par.lbl.carNo" /><!-- 차량번호 --></th>
                        <td>
                            <input id="carNo" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.vinNo" /><!-- VIN --></th>
                        <td>
                            <input id="vinNo" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.brandNm" /><!-- 브랜드명 --></th>
                        <td>
                            <input id="brandNm" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                        <td>
                            <input id="carLine" type="text" class="form_input" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.partsSaleRemark" /><!--판매비고 --></th>
                        <td colspan="5">
                            <input id="remark" type="text" value="" class="form_input" />
                            <input id="updtDtStr" type="text" class="form_input hidden" />
                        </td>
                         <th scope="row"><spring:message code="par.lbl.carNo" /><!-- 차량번호 --></th>
                        <td>
                            <input id="carRegNo" type="text" class="form_input" />
                        </td>
                    </tr>
                    <tr class="hidden">
                        <th scope="row"><spring:message code="par.lbl.dcRate" /><!-- 할인율 --></th>
                        <td>
                            <input id="dcRate" data-type="number" class="form_numeric" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.totAmtBefDc" /><!-- 할인전총액 --></th>
                        <td>
                            <input id="dcBefTotAmt" name="dcBefTotAmt" data-type="number" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totAmtBefDc" />" />
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.dcAmt" /><!-- 할인가격 --></th>
                        <td>
                            <input id="dcAmt" name="dcAmt" data-type="number" class="form_numeric" readonly data-name="<spring:message code="sal.lbl.dcAmt" />" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.totAmt" /><!-- 총액 --></th>
                        <td>
                            <input id="totAmt" name="totAmt" data-type="number" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totAmt" />" />
                            <input id="vatAmt" name="vatAmt" data-type="number" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totAmt" />" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_form form_width_70per mt10" id="searchForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:17%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col style="width:10%;">
                    <col style="width:14%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.partsSaleNo" /><!-- 판매오더번호 --></th>
                        <td>
                            <div class="form_search">
                                <input id="parSaleOrdNo" class="form_input form_readonly" readonly />
                                <a id="searchParSaleOrdNo"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.partsSalePrcTp" /><!-- 판매유형 --></th>
                        <td>
                            <input id="saleTp" name="saleTp" type="text" data-type="combo" required data-name="<spring:message code="par.lbl.saleType" />" class="form_comboBox" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.partsSalePrsn" /></span><!-- 담당자 --></th>
                        <td class="required_area">
                            <div class="form_search">
                                <input type="text" id="salePrsnId" name="salePrsnId" class="form_input hidden" required data-name="<spring:message code="par.lbl.prsNm" />" readonly />
                                <input type="text" id="salePrsnNm" name="salePrsnNm" class="form_input form_readonly" required data-name="<spring:message code="par.lbl.prsNm" />" readonly />
                                <a id="searchSalePrsnId"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.partsSaleStat" /><!-- 상태 --></th>
                        <td>
                            <input id="ordStatCd" type="text" data-type="combo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.parSaleCnt" /><!-- 품목수 --></th>
                        <td class="readonly_area">
                            <input id="itemCnt" data-type="number" class="form_numeric" readonly />
                            <input id="calcDocNo" class="form_input hidden" readonly />
                        </td>
                        <th scope="row"><spring:message code='par.lbl.parSaleQty' /></th><!-- 판매수량 -->
                        <td class="readonly_area">
                            <input id="itemQty" data-type="number" class="form_numeric"  readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.partsSaleDt" /><!-- 부품판매일자 --></th>
                        <td class="readonly_area">
                            <input id="ordDt" type="text" class="form_datepicker" data-type="maskDate" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.parSaleAmt" /><!--판매금액 --></th>
                        <td class="readonly_area">
                            <input id="itemAmt" data-type="number" class="form_numeric" readonly />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11807" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnExcelUpload" name="btnExcelUpload" class="btn_s btn_add btn_s_min5" ><spring:message code="par.btn.excelUpload" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11806" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnPackage" name="btnPackage" class="btn_s btn_add btn_s_min5"><spring:message code="par.btn.pakage" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11805" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnAdd" name="btnAdd" class="btn_s btn_add btn_s_min5"><spring:message code="par.btn.add" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11804" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnDelItem" name="btnDelItem" class="btn_s btn_del btn_s_min5"><spring:message code="par.btn.del" /></button>
            </dms:access>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div class="table_grid">
            <!-- 부품판매 그리드 -->
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>
    <!-- //부품판매 -->

<!-- script -->
<script>
    var toDt                = "${toDt}",
        pParSalesOrdNo      = "${pParSalesOrdNo}",
        pEstimateDocNo      = "${pEstimateDocNo}",
        sessionUsrId        = "${usrId}",
        sessionUsrNm        = "${usrNm}",
        gVatCd              = Number("${vatCd}"),
        gCrud               = "C",
        custTpList          = [],
        ordStatCdList       = [],
        saleTpList          = [],
        giStrgeTpList       = [],
        saleTpObj           = {},
        giStrgeTpObj        = {},
        giStatCdObj         = {},
        unitCdObj           = {},
        prcTpObj            = {},
        tempGrid            = {},
        itemDstinCdObj      = {},
        popItemObj          = {},
        locationObj         = {},
        locationListObj     = {},
        selectShareStockGiItemPopupWindow,
        userSearchPopupWin,
        customerAllSearchPopupWin,
        workPackagePopup,
        popupWindow,
        changeAmtEditor,
        changePrcTp,
        changeUnitCd,
        changeItemDstinCd,
        partsSaleOrdListPopupWindow;

        if(dms.string.isEmpty(gVatCd)){
            console.log('gVatCd 값 없음!');
            //gVatCd = .16;
            gVatCd = .13;
        }
        console.log('gVatCd:',gVatCd);

        locationObj[' '] = "";
        custTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${custTpList}" varStatus="status">
            custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        ordStatCdList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${ordStatCdList}" varStatus="status">
            if("${obj.useYn}" === 'Y'){
                ordStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            }
            if("${obj.cmmCd}" === '01'){
                giStatCdObj["${obj.cmmCd}"] = "登记";
            }else if("${obj.cmmCd}" === '07'){
                giStatCdObj["${obj.cmmCd}"] = "退货";
            }else{
                giStatCdObj["${obj.cmmCd}"] = "出库";
            }
        </c:forEach>

        saleTpObj[' '] = "";
        <c:forEach var="obj" items="${saleTpList}" varStatus="status">
            if(3 > Number("${obj.cmmCd}")){
                saleTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
                saleTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
            }
        </c:forEach>
        	console.log(saleTpObj);

        itemDstinCdObj[' '] = "";
        <c:forEach var="obj" items="${itemDstinList}" varStatus="status">
            itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        unitCdObj[' '] = "";
        <c:forEach var="obj" items="${unitCdList}" varStatus="status">
            unitCdObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>

        <c:forEach var="obj" items="${prcTpList}" varStatus="status">
            prcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        giStrgeTpObj[' '] = "";
        <c:forEach var="obj" items="${storageList}" varStatus="status">
            giStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
            giStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
        </c:forEach>

    $(document).ready(function() {

        //고객유형선택
        $("#custTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:custTpList
            ,index:0
        });
        //오더상태선택
        $("#ordStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:ordStatCdList
            ,index:0
        });
        //판매유형
        $("#saleTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:saleTpList
            ,index:0
        });
        //오더일
        $("#ordDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //판매건수
        $("#itemCnt").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });
        //판매수량
        $("#itemQty").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });
        //판매금액
        $("#itemAmt").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });
        //D/C Rate
        $("#dcRate").kendoExtNumericTextBox({
            format:"n0"
            ,spinners:false
        });
        //할인전 총계
        $("#dcBefTotAmt").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });
        //세금 총계
        $("#vatAmt").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });
        //할인금액
        $("#dcAmt").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });
        //총계
        $("#totAmt").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });
        //custTelNo
        $("#custTelNo").kendoMaskedTextBox({
            mask:"00000000000"
            , promptChar:" "
        });
        //Hp
        $("#custHpNo").kendoMaskedTextBox({
            mask:"00000000000"
            , promptChar:" "
        });
        //bpTelNo
        $("#bpTelNo").kendoMaskedTextBox({
            mask:"00000000000"
            , promptChar:" "
        });
        //bpHpNo
        $("#bpHpNo").kendoMaskedTextBox({
            mask:"00000000000"
            , promptChar:" "
        });
        //certTelNo
        $("#certTelNo").kendoMaskedTextBox({
            mask:"00000000000"
            , promptChar:" "
        });
        //certHpNo
        $("#certHpNo").kendoMaskedTextBox({
            mask:"00000000000"
            , promptChar:" "
        });
        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                pParSalesOrdNo = ''; //판매현황 화면에서 넘어온 판매번호 삭제.
                pEstimateDocNo = ''; //견적 화면에서 넘어온 견적번호 삭제.
                gCrud      = "C";

                initPage();
            }
        });

        $("#searchSalePrsnId").on('click', salePrsnSearchPopup);
        $("#searchSaId").on('click', saSearchPopup);

        $("#searchCustCd").on('click', custSearchPopup);

        $("#custTp").on('change', fnChangeCustTp);

        $("#instantCust").on('change', fnChangeIntantCust);

        $("#searchParSaleOrdNo").on('click', selectPartsSaleOrdListPopupWindow);

        $(document).on("click", ".grid-checkAll", function(e){
            var grid = $("#grid").data("kendoExtGrid"),
                checked = $(this).is(":checked"),
                rows = grid.tbody.find("tr"),
                gridData,
                lineDisabled;

            if(checked){
                rows.each(function(index, row) {
                    gridData = grid.dataSource.at(index);
                    lineDisabled = $(this).find(".grid-checkbox-item").prop("disabled");
                    if(!lineDisabled){
                        if(gridData.giStatCd !== '02'){
                            grid.select($(this));
                            $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                        }
                    }
                });
            }else{
                grid.clearSelection();

                rows.each(function(index, row) {
                    lineDisabled = $(this).find(".grid-checkbox-item").prop("disabled");
                    gridData = grid.dataSource.at(index);
                    if(!lineDisabled){
                        //if(gridData.giStatCd !== '02'){
                            $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
                        //}
                    }
                });
            }
        });
        //엑셀 업로드
        $("#btnExcelUpload").kendoButton({
            click:function(e) {
                partsSaleOrdExcelUploadPopupWin = dms.window.popup({
                    title:"<spring:message code='par.title.partsSaleOrdExcelUpload' />"
                    ,windowId:"partsSaleOrdExcelUploadPopupWin"
                    ,width : 680
                    ,height: 340
                    ,content:{
                        url:"<c:url value='/par/cmm/selectPartsSaleOrdExcelUploadPopup.do'/>"
                        ,data:{
                            "prcTp": $("#saleTp").data("kendoExtDropDownList").value()
                            ,"callbackFunc":function(data){

                                var dataLen      = data.length,
                                    gridData     = $("#grid").data("kendoExtGrid"),
                                    popItemData  = {},
                                    itemList     = [],
                                    tDate,
                                    rows;

                                //for(var i = 0; i < dataLen; i = i + 1){
                                //    itemList.push(data[i].itemCd);
                                //}

                                //fnSetLocCdObj(itemList);

                                for(var i = 0; i < dataLen; i = i + 1){
                                    //내용
                                    /*
                                    if(dms.string.isEmpty(data[i].excelDcRate)||data[i].excelDcRate === 0){
                                        popItemData.dcRate         = 0;
                                        popItemData.amt            = data[i].excelQty * data[i].prc;//data[i].amt;
                                        popItemData.dcAmt          = 0;
                                        popItemData.taxAmt         = (data[i].excelQty * data[i].prc) - ((data[i].excelQty * data[i].prc)/( 1 + gVatCd ));
                                        popItemData.taxDdctAmt     = (data[i].excelQty * data[i].prc)/( 1 + gVatCd );
                                    }else{
                                        popItemData.dcRate         = data[i].excelDcRate;
                                        popItemData.amt            = (data[i].excelQty * data[i].prc) - ((data[i].excelQty * data[i].prc) * (data[i].excelDcRate/100));
                                        popItemData.dcAmt          = (data[i].excelQty * data[i].prc) * (data[i].excelDcRate/100);
                                        popItemData.taxAmt         = ((data[i].excelQty * data[i].prc) - (popItemData.dcAmt)) - ((data[i].excelQty * data[i].prc) - (popItemData.dcAmt))/( 1 + gVatCd );
                                        popItemData.taxDdctAmt     = ((data[i].excelQty * data[i].prc) - (popItemData.dcAmt))/( 1 + gVatCd );
                                    }
                                    */
                                    if(dms.string.isEmpty(data[i].excelDcRate)){
                                        popItemData.dcRate         = 0;
                                    }else{
                                        popItemData.dcRate         = data[i].excelDcRate;
                                    }
                                    popItemData.amt            = data[i].excelQty * data[i].prc;//data[i].amt;
                                    popItemData.dcAmt          = 0;
                                    popItemData.taxAmt         = (data[i].excelQty * data[i].prc) - ((data[i].excelQty * data[i].prc)/( 1 + gVatCd ));
                                    popItemData.taxDdctAmt     = (data[i].excelQty * data[i].prc)/( 1 + gVatCd );

                                    popItemData.itemDstinCd    = data[i].itemDstinCd;
                                    popItemData.itemCd         = data[i].itemCd;
                                    popItemData.itemNm         = data[i].itemNm;
                                    popItemData.printItemNm    = data[i].itemNm;
                                    popItemData.unitCd         = data[i].unitCd;
                                    popItemData.ordQty         = data[i].excelQty;
                                    //popItemData.ordQty         = data[i].ordQty;
                                    popItemData.prc            = data[i].prc;

                                    popItemData.partCost       = data[i].excelQty * data[i].prc;
                                    popItemData.prcTp          = data[i].prcTp;
                                    popItemData.saleTp         = data[i].saleTp;
                                    //popItemData.dcRate         = data[i].dcRate;
                                    popItemData.stockQty       = data[i].stockQty;
                                    popItemData.avlbStockQty   = data[i].avlbStockQty;
                                    popItemData.resvStockQty   = data[i].resvStockQty;
                                    popItemData.borrowQty      = data[i].borrowQty;
                                    popItemData.rentQty        = data[i].rentQty;
                                    popItemData.giStrgeCd      = data[i].giStrgeCd;
                                    popItemData.giStatCd       = '';
                                    popItemData.preReturnQty   = null;
                                    popItemData.giLocCd        = data[i].giLocCd;
                                    popItemData.movingAvgPrc   = data[i].movingAvgPrc;
                                    popItemData.movingAvgTaxDdctPrc     = data[i].movingAvgTaxDdctPrc;
                                    popItemData.movingAvgAmt            = Math.round(Number(data[i].movingAvgPrc) * Number(data[i].excelQty) * 100)/100;
                                    popItemData.movingAvgTaxDdctAmt     = Math.round(Number(data[i].movingAvgTaxDdctPrc) * Number(data[i].excelQty) * 100)/100;;
                                    /*
                                    if(!dms.string.isEmpty(locationListObj[data[i].itemCd])){
                                        if(!dms.string.isEmpty(locationListObj[data[i].itemCd][data[i].giStrgeCd])){
                                          popItemData.giLocCd = locationListObj[data[i].itemCd][data[i].giStrgeCd][0].cmmCd;
                                        }else{
                                            popItemData.giLocCd = '';
                                        }
                                    }else{
                                        popItemData.giLocCd = '';
                                    }
                                    */

                                    if(popItemObj.hasOwnProperty(data[i].itemCd)){
                                        if(popItemObj[data[i].itemCd].hasOwnProperty(data[i].giStrgeCd)){
                                            //이미 등록되어있는 부품입니다.
                                            //var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']' + '[' + giStrgeTpObj[data[i].giStrgeCd] + ']';
                                            //dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                                            gridData.dataSource.add(popItemData);
                                        }else{
                                            popItemObj[data[i].itemCd][data[i].giStrgeCd] = data[i].itemNm;
                                            gridData.dataSource.add(popItemData);
                                        }
                                    }else{
                                        popItemObj[data[i].itemCd] = {};
                                        popItemObj[data[i].itemCd][data[i].giStrgeCd] = data[i].itemNm;
                                        gridData.dataSource.add(popItemData);
                                    }
                                }

                                gridData.select(gridData.tbody.find(">tr"));
                                partsSaleOrdExcelUploadPopupWin.close();
                            }
                        }
                    }
                });
            }
        });
        //패키지 버튼
        $("#btnPackage").kendoButton({
            click:function(e){
                selectWorkPackagePopupWindow();
            }
        });
        // 인쇄
        $("#btnPrint").kendoButton({
            click:function(e){
                // ready message
                parent._createOrReloadTabMenu("<spring:message code='par.title.giPrintDoc' />", "<c:url value='/ReportServer?reportlet=par/selectPartsSaleOrdPrintMain.cpt'/>&sDlrCd=${dlrCd}&sParSaleOrdNo="+$("#parSaleOrdNo").val());
            }
        });
        // 반품
        $("#btnReturn").kendoButton({
            click:function(e){
                var grid           = $("#grid").data("kendoExtGrid"),
                    rows           = grid.tbody.find("tr"),
                    ordStatCd      = $("#ordStatCd").data("kendoExtDropDownList").value(),
                    chkCnt         = 0,
                    selectGridData = {},
                    gridData,
                    chkRow;


                if(rows.length  == 0 ){
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

                if(ordStatCd === '01' || ordStatCd === '03' || ordStatCd === '07' || dms.string.isEmpty(ordStatCd)){
                    //반품가능 상태가 아닙니다.(01:등록, null:등록중, 03:취소, 07:반환)
                    dms.notification.warning("<spring:message code='par.btn.innerReturn' var='returnPartsSale' /><spring:message code='par.err.paramNotAvailable' arguments='${returnPartsSale}'/>");

                    return false;
                }

                rows.each(function(index, row) {
                    gridData = grid.dataSource.at(index);
                    chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");
                    if(chkRow === true){
                        if(chkCnt === 0){
                            selectGridData.endQty       = gridData.endQty;
                            selectGridData.preReturnQty = gridData.preReturnQty;
                            selectGridData.returnId     = $("#salePrsnId").val();
                            chkCnt = chkCnt + 1;
                        }else{
                            chkCnt = chkCnt + 1;
                            dms.notification.warning("<spring:message code='global.info.required.selectOne'/>");
                            return false;
                        }
                    }
                });

                if(chkCnt === 1){
                    //정산서 번호 있는 경우(정산진행 중) 반품 불가.
                    if(!dms.string.isEmpty($('#calcDocNo').val())){
                        dms.notification.warning("<spring:message code='ser.lbl.partCalc' var='partCalc' /><spring:message code='par.lbl.partsSaleNo' var='partsSaleNo' /><spring:message code='par.btn.calcCancel' var='calcCancel' /><spring:message code='global.info.reTryInfo' arguments='${partCalc},${partsSaleNo},${calcCancel}' />");
                        return false;
                    }else{
                        fnPartsSaleOrdReturnPopupWindow(selectGridData);
                    }
                }else if(chkCnt === 0){
                     // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

            }
        });

      //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {

                if(dms.string.isEmpty($("#saleTp").data("kendoExtDropDownList").value())){
                    //판매유형은 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.saleType' var='saleType' /><spring:message code='global.info.required.field' arguments='${saleType}'/>");
                    return false;
                }

                selectItemSalePrcPopupWindow();
            }
        });


        $("#btnDelItem").kendoButton({
            click:function(e){



                //삭제 팝업 호출.
                $("#messageId").html("<spring:message code='par.info.delYn' />");//삭제 메시지.
                conformKendoWindow.content( $(".msgDiv").html());
                conformKendoWindow.open();
                $(".yes, .no").click(function(){
                    if($(this).hasClass("yes")){
                        conformKendoWindow.close();

                        var grid = $("#grid").data("kendoExtGrid"),
                        rows = grid.select(),
                        deletePkgObj = {},
                        deleteRowLst = [],
                        pkgYn = false,
                        rowDelYn = false,
                        items = grid.dataSource.view(),
                        length = items.length,
                        removeList = [];
                        rowsAll = $("#grid").data("kendoExtGrid").tbody.find("tr");

                        rows.each(function(index, row) {
                            var l_rowData = grid.dataItem(row);
                            //등록상태인 품목만 삭제가능
                            if(dms.string.isEmpty(l_rowData.giStatCd) || l_rowData.giStatCd === '01'){
                                delete popItemObj[l_rowData.itemCd][l_rowData.giStrgeCd];
                                //삭제부품 담기.
                                removeList[l_rowData.uid] = true;
                            }else{
                                if(l_rowData.giStatCd === '07'){
                                    dms.notification.warning("<spring:message code='par.btn.partsSaleReturn' var='partsSaleReturn' /><spring:message code='global.err.delete' arguments='${partsSaleReturn}'/>");
                                    return false;
                                }else{
                                    dms.notification.warning("<spring:message code='par.lbl.saleEndItem' var='saleEndItem' /><spring:message code='global.err.delete' arguments='${saleEndItem}'/>");
                                    return false;

                                }
                            }

                        });

                        //grid dataSource Deleting.
                        for (i = length-1; i>=0; i--) {
                            var item = items[i];
                            if(removeList[item.uid]){
                                grid.dataSource.remove(item);
                            }
                        }

                    }
                    conformKendoWindow.close();
                }).end();

            }
        });

        // 취소 버튼
        $("#btnCancel").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    header;


                header = {
                        parSaleOrdNo    :$('#parSaleOrdNo').val()
                       ,custCd          :$('#custCd').val()
                       ,updtDtStr       :$("#updtDtStr").val()
                };

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);

                        saveList.push(gridData);
                });

                if(saveList.length > 0){
                    var data ={
                           "partsSaleOrdVO":header
                          ,"partsSaleOrdItemList":saveList
                        };

                    $.ajax({
                        url:"<c:url value='/par/ism/issue/cancelPartsSaleOrd.do' />"
                       ,data:kendo.stringify(data)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,async:true
                       ,success:function(result) {

                           if (result === true) {
                               dms.notification.success("<spring:message code='par.lbl.partsSaleNo' var='parSaleOrdNo' /><spring:message code='global.info.delSuccessParam' arguments='${parSaleOrdNo}'/>");

                               // 부품판매 조회.
                               selectPartsSaleOrd($('#parSaleOrdNo').val());
                           } else {
                               if(result === 0){
                                   dms.notification.error("<spring:message code='par.lbl.partsSaleNo' var='parSaleOrdNo' /><spring:message code='global.err.delFailedParam' arguments='${parSaleOrdNo}'/>");
                               }
                           }
                       }
                        ,beforeSend:function(){
                            dms.loading.show($("#partsSaleOrdSection"));
                        }
                        ,complete:function(){
                            dms.loading.hide($("#partsSaleOrdSection"));
                        }
                       ,error:function(jqXHR,status,error) {
                           dms.loading.hide($("#partsSaleOrdSection"));
                           dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                       }

                   });
                }
            }
        });

     // 저장 버튼
        $("#btnSave").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    chkCalcAmt,
                    header;

                fnSetAmtInfo();

                header = {
                        saleTp          :$("#saleTp").data("kendoExtDropDownList").value()
                      , custTp          :$("#custTp").data("kendoExtDropDownList").value()
                      , custCd          :$("#custCd").val()
                      , custNm          :$("#custNm").val()
                      , custTelNo       :$("#custTelNo").data("kendoMaskedTextBox").value()
                      , salePrsnId      :$("#salePrsnId").val()
                      , saId            :$("#saId").val()
                      , dcRate          :$("#dcRate").data("kendoExtNumericTextBox").value()
                      , dcBefTotAmt     :$("#dcBefTotAmt").data("kendoExtNumericTextBox").value()
                      , dcAmt           :$("#dcAmt").data("kendoExtNumericTextBox").value()
                      , totAmt          :$("#totAmt").data("kendoExtNumericTextBox").value()
                      , vatAmt          :$("#vatAmt").data("kendoExtNumericTextBox").value()
                      , remark          :$("#remark").val()
                      , updtDtStr       :$("#updtDtStr").val()
                      ,carRegNo	        :$("#carRegNo").val()
                };


                if(gCrud === "C"){
                    if(rows.length  == 0 ){
                        // 선택값이 없습니다.
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }

                    rows.each(function(index, row) {
                        var gridData = grid.dataSource.at(index);

                        if(!dms.string.isEmpty(gridData.itemCd)){
                            if(dms.string.isEmpty(gridData.ordQty) || gridData.ordQty == 0){
                                // 수량을 입력하십시오
                                dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.confirmMsgParam' arguments='${qty}'/>");
                                saveList = [];
                                return false;
                            }

                            chkCalcAmt = Math.round(Number(gridData.prc) * Number(gridData.ordQty) * 100)/100;

                            /***판매단가 '0'이어도 판매 가능하도록...딜러요청사항
                            if(dms.string.isEmpty(gridData.prc) || gridData.prc == 0){
                                // 단가를 입력하십시오.
                                dms.notification.warning("<spring:message code='par.lbl.prc' var='prc' /><spring:message code='global.info.confirmMsgParam' arguments='${prc}'/>");
                                saveList = [];
                                return false;
                            }
                            */

                            if(Math.abs(Number(chkCalcAmt) - Number(gridData.amt)) > 0.5 ){
                                // 금액을 확인해주세요.
                                dms.notification.warning("<spring:message code='par.lbl.amt' var='amt' /><spring:message code='global.info.confirmMsgParam' arguments='${amt}'/>");
                                saveList = [];
                                return false;
                            }

                            if(dms.string.isEmpty(gridData.itemCd)){
                                // 부품을 선택하십시오
                                dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCd}'/>");
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
                            if(Number(gridData.ordQty) > Number(gridData.avlbStockQty)){
                                // 가용재고보다 클 수 없음.
                                dms.notification.warning("<spring:message code='par.lbl.avlbStockQty' var='avlbStockQty' /><spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.err.chkGreateParam' arguments='${qty},${avlbStockQty}'/>");
                                saveList = [];
                                return false;
                            }

                            saveList.push(gridData);
                        }
                    });

                    if(saveList.length > 0){
                        var data ={
                               "partsSaleOrdVO":header
                              ,"partsSaleOrdItemList":saveList
                            };

                        $.ajax({
                             url:"<c:url value='/par/ism/issue/createPartsSaleOrd.do' />"
                            ,data:kendo.stringify(data)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:true
                            ,success:function(result) {

                                if (result.resultYn == true) {
                                    dms.notification.success("<spring:message code='par.lbl.partsSaleNo' var='parSaleOrdNo' /><spring:message code='global.info.regSuccessParam' arguments='${parSaleOrdNo}'/>");

                                    pParSalesOrdNo = result.parSaleOrdNo;
                                    $('#parSaleOrdNo').val(result.parSaleOrdNo);
                                    $("#ordStatCd").data("kendoExtDropDownList").value(result.ordStatCd);
                                    // 부품판매 조회.
                                    selectPartsSaleOrd(pParSalesOrdNo);

                                } else {

                                    if(result === 0){
                                        dms.notification.error("<spring:message code='par.lbl.partsSaleNo' var='parSaleOrdNo' /><spring:message code='global.err.regFailedParam' arguments='${parSaleOrdNo}'/>");
                                    }
                                }
                            }
                            ,beforeSend:function(){
                                dms.loading.show($("#partsSaleOrdSection"));
                            }
                            ,complete:function(){
                                dms.loading.hide($("#partsSaleOrdSection"));
                            }
                           ,error:function(jqXHR,status,error) {
                                dms.loading.hide($("#partsSaleOrdSection"));
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }

                        });
                    }
                }else if(gCrud === "U"){
                    var saveData = grid.getCUDData("insertList", "updateList", "deleteList"),
                        insertListLeng = saveData.insertList.length;


                    for(var i = insertListLeng-1; i >= 0; i = i - 1){
                        if(dms.string.isEmpty(saveData.insertList[i].itemCd)){
                            saveData.insertList.splice(i,1);
                        }
                    }

                    header.parSaleOrdNo = $('#parSaleOrdNo').val();

                    saveData.partsSaleOrdVO = header;


                    $.ajax({
                        url:"<c:url value='/par/ism/issue/multiPartsSaleOrds.do' />"
                       ,data:kendo.stringify(saveData)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,async:true
                       ,success:function(result) {

                           if (result === true) {
                               dms.notification.success("<spring:message code='par.lbl.partsSaleNo' var='parSaleOrdNo' /><spring:message code='global.info.modifySuccessParam' arguments='${parSaleOrdNo}'/>");

                               // 부품판매 조회.
                               selectPartsSaleOrd(pParSalesOrdNo);

                           } else {
                               if(result === 0){
                                   dms.notification.error("<spring:message code='par.lbl.partsSaleNo' var='parSaleOrdNo' /><spring:message code='global.err.modifyFailedParam' arguments='${parSaleOrdNo}'/>");
                               }
                           }
                       }
                        ,beforeSend:function(){
                            dms.loading.show($("#partsSaleOrdSection"));
                        }
                        ,complete:function(){
                            dms.loading.hide($("#partsSaleOrdSection"));
                        }
                       ,error:function(jqXHR,status,error) {
                           dms.loading.hide($("#partsSaleOrdSection"));
                           dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                       }

                   });

                }else{
                   alert('CRUD정보가 없습니다.');
                }
              }
        });

        // 확정 버튼
        $("#btnCnfm").kendoButton({
            click:function(e){

                var grid           = $("#grid").data("kendoExtGrid"),
                    rows           = grid.tbody.find("tr"),
                    saveData       = grid.getCUDData("insertList", "updateList", "deleteList"),
                    insertListLeng = saveData.insertList.length,
                    updateListLeng = saveData.updateList.length,
                    deleteListLeng = saveData.deleteList.length,
                    modifyLeng     = insertListLeng + deleteListLeng,
                    saveList       = [],
                    chkRow,
                    header,
                    chkCalcAmt;
                    //calcAmt;

                fnSetAmtInfo();

                if(modifyLeng > 0){

                    dms.notification.warning("<spring:message code='par.info.cnfmModifyChkMsg'/>");
                    saveList = [];
                    return false;
                }

                header = {
                        parSaleOrdNo    :$('#parSaleOrdNo').val()
                      , ordDt           :$("#ordDt").data("kendoExtMaskedDatePicker").value()
                      , saleTp          :$("#saleTp").data("kendoExtDropDownList").value()
                      , custTp          :$("#custTp").data("kendoExtDropDownList").value()
                      , custCd          :$("#custCd").val()
                      , custNm          :$("#custNm").val()
                      , custTelNo       :$("#custTelNo").data("kendoMaskedTextBox").value()
                      , salePrsnId      :$("#salePrsnId").val()
                      , saId            :$("#saId").val()
                      , dcRate          :$("#dcRate").data("kendoExtNumericTextBox").value()
                      , dcBefTotAmt     :$("#dcBefTotAmt").data("kendoExtNumericTextBox").value()
                      , dcAmt           :$("#dcAmt").data("kendoExtNumericTextBox").value()
                      , totAmt          :$("#totAmt").data("kendoExtNumericTextBox").value()
                      , vatAmt          :$("#vatAmt").data("kendoExtNumericTextBox").value()
                      , ordStatCd       :$("#ordStatCd").data("kendoExtDropDownList").value()
                      , remark          :$("#remark").val()
                      , updtDtStr       :$("#updtDtStr").val()
                };

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);
                    chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                    if(chkRow === true){
                        if(!dms.string.isEmpty(gridData.itemCd)){
                            if(dms.string.isEmpty(gridData.ordQty) || gridData.ordQty == 0){
                                // 수량을 입력하십시오
                                dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.confirmMsgParam' arguments='${qty}'/>");
                                saveList = [];
                                return false;
                            }

                            /****판매단가 0으로 입력해도 판매 허용되도록 딜러요청.
                            if(dms.string.isEmpty(gridData.prc) || gridData.prc == 0){
                                // 단가를 입력하십시오.
                                dms.notification.warning("<spring:message code='par.lbl.prc' var='prc' /><spring:message code='global.info.confirmMsgParam' arguments='${prc}'/>");
                                saveList = [];
                                return false;
                            }
                            */

                            if(dms.string.isEmpty(gridData.itemCd)){
                                // 부품을 선택하십시오
                                dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCd}'/>");
                                saveList = [];
                                return false;
                            }

                            if(gridData.giStatCd !== '01'){
                                //품목상태를 확인해주세요
                                dms.notification.warning("<spring:message code='par.lbl.partsSaleStat' var='partsSaleStat' /><spring:message code='global.info.confirmMsgParam' arguments='${partsSaleStat}'/>");
                                saveList = [];
                                return false;
                            }

                            //calcAmt = Number((gridData.ordQty * gridData.prc).toFixed(2));
                            chkCalcAmt = Math.round(Number(gridData.prc) * Number(gridData.ordQty) * 100)/100;
                            if( Math.round(Number(gridData.amt) * 100)/100 != Number(chkCalcAmt)){
                                // 판매금액을 확인해주세요 (수량 * 단가 != 금액이 다를 때)
                                dms.notification.warning("<spring:message code='par.lbl.partsSaleAmt' var='partsSaleAmt' /><spring:message code='global.info.confirmMsgParam' arguments='${partsSaleAmt}'/>");
                                saveList = [];
                                return false;
                            }


                            if(Number(gridData.ordQty) > Number(gridData.avlbStockQty)){
                                // 가용재고보다 클 수 없음.
                                dms.notification.warning("<spring:message code='par.lbl.avlbStockQty' var='avlbStockQty' /><spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.err.chkGreateParam' arguments='${qty},${avlbStockQty}'/>");
                                saveList = [];
                                return false;
                            }

                            saveList.push(gridData);
                        }
                    }
                });

                if(saveList.length > 0){
                    var data ={
                           "partsSaleOrdVO":header
                          ,"partsSaleOrdItemList":saveList
                        };

                    $.ajax({
                        url:"<c:url value='/par/ism/issue/cnfmPartsItemSaleOrd.do' />"
                        //url:"<c:url value='/par/ism/issue/cnfmPartsSaleOrd.do' />"
                       ,data:kendo.stringify(data)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,async:true
                       ,success:function(result) {

                           if (result === true) {
                               dms.notification.success("<spring:message code='par.lbl.partsSaleNo' var='parSaleOrdNo' /><spring:message code='global.info.cnfmSuccessParam' arguments='${parSaleOrdNo}'/>");

                               // 부품판매 조회.
                               selectPartsSaleOrd(pParSalesOrdNo);

                           } else {
                               if(result === 0){
                                   dms.notification.error("<spring:message code='par.lbl.partsSaleNo' var='parSaleOrdNo' /><spring:message code='global.info.cnfmFailedParam' arguments='${parSaleOrdNo}'/>");
                               }
                           }
                       }
                        ,beforeSend:function(){
                            dms.loading.show($("#partsSaleOrdSection"));
                        }
                        ,complete:function(){
                            dms.loading.hide($("#partsSaleOrdSection"));
                        }
                       ,error:function(jqXHR,status,error) {
                           dms.loading.hide($("#partsSaleOrdSection"));
                           dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                       }

                   });
                }else{
                    if(chkRow === false){
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                    }
                    return false;
                }
            }
        });


        /**
         * grid 단가&수량
         */
         changeAmtEditor = function(container, options) {

             var input = $("<input/>"),
                 pValue;

             input.attr("name", options.field);

             input.appendTo(container);

             if(options.field === 'ordQty' || options.field === 'returnQty') {
                 input.kendoExtNumericTextBox({
                     format: "n2"
                     ,decimals:2
                     ,restrictDecimals: true
                     ,min:0
                     ,spinners:false
                 });
             } else {
                 input.kendoExtNumericTextBox({
                     format: "n2"
                     ,decimals:2
                     ,restrictDecimals: true
                     ,min:0
                     ,spinners:false
                 });
             }
         };

         /**
          * grid 출고창고 DropDownList
          */
          giStrgeCdDropDownEditor = function(container, options) {
              var strgeCd    = options.model.giStrgeCd,
                  giStatCd   = options.model.giStatCd;

             if(dms.string.isEmpty(giStatCd) || giStatCd === '01'){
                  $('<input data-bind="value:' + options.field + '"  />')
                  .appendTo(container)
                  .kendoExtDropDownList({
                      dataTextField: "cmmCdNm"
                     ,dataValueField:"cmmCd"
                     ,dataSource:  giStrgeTpList
                     ,change:function(e){
                         options.model.set('giLocCd','');
                      }
                  });
              }
          };
         /**
          * grid 출고Location DropDownList
          */
          giLocCdDropDownEditor = function(container, options) {

              var itemCd     = options.model.itemCd,
                  strgeCd    = options.model.giStrgeCd,
                  giStatCd   = options.model.giStatCd;

              if(dms.string.isEmpty(giStatCd) || giStatCd === '01'){
                  if(!dms.string.isEmpty(locationListObj[itemCd])){
                      $('<input data-bind="value:' + options.field + '"  />')
                      .appendTo(container)
                      .kendoExtDropDownList({
                          dataTextField: "cmmCdNm"
                         ,dataValueField:"cmmCd"
                         ,dataSource:  locationListObj[itemCd][strgeCd]
                         ,change:function(e){
                             $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                          }
                      });
                  }
              }

          };

         /**
          * grid 판매우형 DropDownList
          */
          saleTpDropDownEditor = function(container, options) {

              $('<input data-bind="value:' + options.field + '"  />')
              .appendTo(container)
              .kendoExtDropDownList({
                  dataTextField: "cmmCdNm"
                 ,dataValueField:"cmmCd"
                 ,dataSource:  saleTpList
              });
          };

        // 부품판매등록 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0323-151202"
           ,dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/ism/issue/selectPartsSaleOrdItemByKey.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            // 판매현황 검색조건 코드.
                            params["sParSaleOrdNo"] = $("#parSaleOrdNo").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                     data:function (result){
                         var dataLen = result.data.length,
                             itemList = [],
                             header;

                         popItemObj = {};

                         for(var i = 0; i < dataLen; i = i + 1){
                             if(popItemObj.hasOwnProperty(result.data[i].itemCd)){
                                 popItemObj[result.data[i].itemCd][result.data[i].giStrgeCd] = result.data[i].itemNm;
                             }else{
                                 popItemObj[result.data[i].itemCd] = {};
                                 popItemObj[result.data[i].itemCd][result.data[i].giStrgeCd] = result.data[i].itemNm;
                             }
                         }

                         return result.data;
                     }
                    ,total:"total"
                    ,model:{
                       id:"parSaleOrdNo"
                      ,fields:{
                              parSaleOrdNo      :{ type:"string" , editable:false }
                            , parSaleOrdLineNo  :{ type:"number" , editable:false }
                            , saleTp            :{ type:"string" }
                            , itemDstinCd       :{ type:"string" , editable:false } //품목구분
                            , itemCd            :{ type:"string" , editable:false }
                            , itemNm            :{ type:"string" }
                            , pkgItemCd         :{ type:"string" , editable:false }
                            , pkgItemNm         :{ type:"string"}
                            , printItemNm       :{ type:"string" }
                            , unitCd            :{ type:"string" }
                            , ordQty            :{ type:"number" }
                            , cancQty           :{ type:"number" , editable:false }
                            , returnQty         :{ type:"number" }
                            , preReturnQty      :{ type:"number" , editable:false }
                            , prcTp             :{ type:"string" , editable:false }
                            , giStrgeCd         :{ type:"string" }
                            , giLocCd           :{ type:"string" }
                            , prc               :{ type:"number" }
                            , amt               :{ type:"number" }
                            , dcAmt             :{ type:"number" }
                            , partCost          :{ type:"number" }
                            , taxAmt            :{ type:"number" }
                            , taxDdctAmt        :{ type:"number" }
                            , dcRate            :{ type:"number" }
                            , stockQty          :{ type:"number", editable:false }
                            , avlbStockQty      :{ type:"number", editable:false }
                            , resvStockQty      :{ type:"number", editable:false }
                            , borrowQty         :{ type:"number", editable:false }
                            , rentQty           :{ type:"number", editable:false }
                            , salePrsnId        :{ type:"string" , editable:false }
                            , salePrsnNm        :{ type:"string" , editable:false }
                            , giDt              :{ type:"date"   , editable:false }
                            , giTime            :{ type:"string" , editable:false }
                            , giStatCd          :{ type:"string" , editable:false }
                            , cancId            :{ type:"string" , editable:false }
                            , cancNm            :{ type:"string" , editable:false }
                            , cancDt            :{ type:"date"   , editable:false }
                            , cancTime          :{ type:"string" , editable:false }
                            , returnId          :{ type:"string" , editable:false }
                            , returnNm          :{ type:"string" , editable:false }
                            , returnDt          :{ type:"date"   , editable:false }
                            , returnTime        :{ type:"string" , editable:false }
                            , eqipExpcDt        :{ type:"date"   , editable:false }
                            , receiveDt         :{ type:"string" , editable:false }
                            , returnDocNo       :{ type:"string" , editable:false }
                            , movingAvgPrc       :{ type:"number", editable: false } //이동평균단가
                            , movingAvgTaxDdctPrc:{ type:"number", editable: false } //이동평균단가(세금제외)
                            , movingAvgAmt       :{ type:"number"} //이동평균금액
                            , movingAvgTaxDdctAmt:{ type:"number"} //이동평균금액(세금제외)
                        }
                    }
                }
            }
            , height:353
            , selectable :"multiple"
            , scrollable :true
            , sortable   :false
            , autoBind   :false
            , filterable:false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , pageable:false
            , edit:function(e){
                var eles = e.container.find("input"),
                    grid = this,
                    rows = e.sender.select(),
                    selectedItem = e.sender.dataItem(rows[0]),
                    input = e.container.find(".k-input"),
                    ordStatCd = $("#ordStatCd").data("kendoExtDropDownList").value(),
                    itemList     = [],
                    pVal,
                    orgVal,
                    amt,
                    dcAmt,
                    partCost,
                    orgReturnValue,
                    orgRateValue,
                    lineDisabled,
                    giStatCd,
                    fieldName = grid.columns[e.container.index()].field;

                if(dms.string.isEmpty(selectedItem)){
                    giStatCd = null;
                }else{
                    giStatCd = selectedItem.giStatCd;
                }

                orgReturnValue = selectedItem.returnQty;
                orgRateValue   = selectedItem.dcRate;

                if(fieldName === "amt" ||fieldName === "partCost" ||fieldName === "itemNm"||fieldName === "itemDstinCd"||fieldName === "unitCd"||fieldName === "prcTp"||fieldName === "avlbStockQty"||fieldName === "giLocCd"
                   ||fieldName === "pkgItemCd"||fieldName === "pkgItemNm"||fieldName === "taxAmt"||fieldName === "saleTp"||fieldName === "taxDdctAmt"||fieldName === "dcAmt"||fieldName === "giStatCd"||fieldName === "giStrgeCd"){
                     this.closeCell();
                }else if(fieldName === "chk" ||fieldName === "movingAvgPrc"||fieldName === "movingAvgTaxDdctPrc"||fieldName === "movingAvgAmt"||fieldName === "movingAvgTaxDdctAmt"){
                    this.closeCell();
                }else if(fieldName === "itemCd"){
                    this.closeCell();
                }else if(fieldName === "ordQty"){
                    if(!(giStatCd === '01'||dms.string.isEmpty(giStatCd))){ //등록 시 에만 수정 가능
                        this.closeCell();
                    }else{
                        if(giStatCd === '07'){ //반품 라인 수정 불가
                            this.closeCell();
                        }else{
                            $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                            input.blur(function(){
                                stopEvent(e);
                                pValue  =  $(this).val();
                                selectedItem.set("amt",        selectedItem.prc * pValue);
                                selectedItem.set("dcAmt",      0);
                                selectedItem.set("partCost",   selectedItem.prc * pValue);
                                selectedItem.set("taxAmt",     (selectedItem.prc * pValue) - ((selectedItem.prc * pValue)/( 1 + gVatCd )));
                                selectedItem.set("taxDdctAmt", (selectedItem.prc * pValue)/( 1 + gVatCd ));
                                selectedItem.set("movingAvgAmt",     Math.round(Number(selectedItem.movingAvgPrc) * Number(pValue) * 100)/100) ;
                                selectedItem.set("movingAvgTaxDdctAmt", Math.round(Number(selectedItem.movingAvgTaxDdctPrc) * Number(pValue) * 100)/100) ;

                            });

                            input.change(function(){
                                stopEvent(e);
                                pValue  =  $(this).val();
                                selectedItem.set("amt",        selectedItem.prc * pValue);
                                selectedItem.set("dcAmt",      0);
                                selectedItem.set("partCost",   selectedItem.prc * pValue);
                                selectedItem.set("taxAmt",     (selectedItem.prc * pValue) - ((selectedItem.prc * pValue)/( 1 + gVatCd )));
                                selectedItem.set("taxDdctAmt", (selectedItem.prc * pValue)/( 1 + gVatCd ));
                                selectedItem.set("movingAvgAmt",     Math.round(Number(selectedItem.movingAvgPrc) * Number(pValue) * 100)/100) ;
                                selectedItem.set("movingAvgTaxDdctAmt", Math.round(Number(selectedItem.movingAvgTaxDdctPrc) * Number(pValue) * 100)/100) ;
                            });
                            fnSetAmtInfo();

                        }
                    }
                }else if(fieldName === "prc"){
                    if(!(giStatCd === '01'||dms.string.isEmpty(giStatCd))){ //등록 시 에만 수정 가능
                        this.closeCell();
                    }else{
                        if(giStatCd === '07'){ //반품 라인 수정 불가
                            this.closeCell();
                        }else{
                            $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);

                            input.blur(function(){
                                stopEvent(e);
                                pValue =  selectedItem.prc;
                                selectedItem.set("amt",        pValue * selectedItem.ordQty);
                                selectedItem.set("dcAmt",      0);
                                selectedItem.set("partCost",   pValue * selectedItem.ordQty);
                                selectedItem.set("taxAmt",     (pValue * selectedItem.ordQty) - ((pValue * selectedItem.ordQty)/( 1 + gVatCd )));
                                selectedItem.set("taxDdctAmt", (pValue * selectedItem.ordQty)/( 1 + gVatCd ));

                            });

                            input.change(function(){
                                stopEvent(e);
                                pValue =  selectedItem.prc;
                                selectedItem.set("amt",        pValue * selectedItem.ordQty);
                                selectedItem.set("dcAmt",      0);
                                selectedItem.set("partCost",   pValue * selectedItem.ordQty);
                                selectedItem.set("taxAmt",     (pValue * selectedItem.ordQty) - ((pValue * selectedItem.ordQty)/( 1 + gVatCd )));
                                selectedItem.set("taxDdctAmt", (pValue * selectedItem.ordQty)/( 1 + gVatCd ));

                            });
                            fnSetAmtInfo();

                        }
                    }
                }else if(fieldName === "dcRate"){
                    if(!(giStatCd === '01'||dms.string.isEmpty(giStatCd))){ //등록 시 에만 수정 가능
                        this.closeCell();
                    }else{
                        if(giStatCd === '07'){ //반품 라인 수정 불가
                            this.closeCell();
                        }else{
                            $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);

                            input.blur(function(){
                                stopEvent(e);
                                pValue =  selectedItem.dcRate;
                                selectedItem.set("amt",        selectedItem.prc * selectedItem.ordQty);
                                selectedItem.set("dcAmt",      0);
                                selectedItem.set("partCost",   selectedItem.prc * selectedItem.ordQty);
                                selectedItem.set("taxAmt",     (selectedItem.prc * selectedItem.ordQty) - ((selectedItem.prc * selectedItem.ordQty)/( 1 + gVatCd )));
                                selectedItem.set("taxDdctAmt", (selectedItem.prc * selectedItem.ordQty)/( 1 + gVatCd ));

                            });

                            input.change(function(){
                                stopEvent(e);
                                pValue =  selectedItem.dcRate;
                                selectedItem.set("amt",        selectedItem.prc * selectedItem.ordQty);
                                selectedItem.set("dcAmt",      0);
                                selectedItem.set("partCost",   selectedItem.prc * selectedItem.ordQty);
                                selectedItem.set("taxAmt",     (selectedItem.prc * selectedItem.ordQty) - ((selectedItem.prc * selectedItem.ordQty)/( 1 + gVatCd )));
                                selectedItem.set("taxDdctAmt", (selectedItem.prc * selectedItem.ordQty)/( 1 + gVatCd ));

                            });
                            fnSetAmtInfo();
                        }
                    }
                }else if(fieldName === "returnQty"){
                    if(dms.string.isEmpty(ordStatCd)||ordStatCd === '01'||ordStatCd === '03'||ordStatCd === '05'){//등록,수납,취소 시 수정 불가
                        this.closeCell();
                    }else{
                        if(giStatCd === '07'){ //반품 라인 수정 불가
                            this.closeCell();
                        }else{
                            $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);

                            input.blur(function(){
                                stopEvent(e);
                                if((Number(selectedItem.returnQty) + Number(selectedItem.preReturnQty) ) > Number(selectedItem.ordQty)){
                                    dms.notification.error("<spring:message code='par.lbl.returnQty' var='returnQty' /><spring:message code='par.lbl.giQty' var='giQty' /><spring:message code='global.err.chkGreateParam' arguments='${returnQty},${giQty}'/>");
                                    selectedItem.set('returnQty', Number(orgReturnValue));

                                }
                            });

                            input.change(function(){
                                stopEvent(e);
                                if((Number(selectedItem.returnQty) + Number(selectedItem.preReturnQty) ) > Number(selectedItem.ordQty)){
                                    dms.notification.error("<spring:message code='par.lbl.returnQty' var='returnQty' /><spring:message code='par.lbl.giQty' var='giQty' /><spring:message code='global.err.chkGreateParam' arguments='${returnQty},${giQty}'/>");
                                    selectedItem.set('returnQty', Number(orgReturnValue));

                                }
                            });
                            fnSetAmtInfo();

                        }
                    }
                }

             }
            , columns:[
                  {
                      field:"chk" ,title:"&nbsp;" ,width:30 ,attributes:{"class":"ac"}
                     ,headerTemplate:"<input type='checkbox' class='grid-checkAll'/>"
                     ,sortable:false
                     ,template:"<input type='checkbox' data-uid='#= uid #' #= changeStatCd(giStatCd,ordQty,preReturnQty)# class='grid-checkbox-item' data-chk=false/>"
                  }
                , {   //부품판매상태
                      title:"<spring:message code='par.lbl.partsSaleStat' />"
                     ,field:"giStatCd"
                     ,attributes:{ "class":"ac"}
                     ,width:90
                     ,template:'#= changeGiStatCd(giStatCd)#'
                     ,sortable:false
                  }
                 ,{   //판매현황번호
                      title:"<spring:message code='par.lbl.partsSaleNo' />"
                     ,field:"parSaleOrdNo"
                     ,width:120
                     ,hidden:true
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"parSaleOrdLineNo"
                     ,width:30
                     ,hidden:true
                  }
                , {   //판매유형
                      title     :"<spring:message code='par.lbl.saleType'  />"
                     ,field     :"saleTp"
                     ,width     :80
                     ,editor    :saleTpDropDownEditor
                     ,template  :'#= changeSaleTp(saleTp)#'
                     ,attributes:{ "style":"text-align:left"}
                     ,hidden:true
                  }
                , {   //품목구분
                      title     :"<spring:message code='par.lbl.itemDstinCd'  />"
                     ,field     :"itemDstinCd"
                     ,width     :80
                     ,template  :'#= changeItemDstinCd(itemDstinCd)#'
                     ,attributes:{ "style":"text-align:left"}
                  }
                , {   //패키지
                      title:"<spring:message code='par.lbl.package' />"
                     ,field:"pkgItemCd"
                     ,width:100
                     ,hidden:true
                  }
                , {   //패키지명
                      title:"<spring:message code='par.lbl.package' />"
                     ,field:"pkgItemNm"
                     ,width:100
                  }
                , {   //부품번호
                      title:"<spring:message code='par.lbl.itemCd' />"
                     ,field:"itemCd"
                     ,width:140
                  }
                , {   //부품명
                      title:"<spring:message code='par.lbl.itemNm' />"
                     ,field:"itemNm"
                     ,width:200
                  }
                , {   //부품명
                      title:"<spring:message code='par.lbl.printItemNm' />"
                     ,field:"printItemNm"
                     ,width:200
                  }
                , {   //단위
                      title:"<spring:message code='par.lbl.unitNm' />"
                     ,field:"unitCd"
                     ,width:80
                     ,attributes:{ "class":"ac"}
                     ,template:'#= changeUnitCd(unitCd)#'
                  }
                , {   //수량
                      title:"<spring:message code='par.lbl.partsSaleQty' />"
                     ,field:"ordQty"
                     ,width:60
                     ,attributes:{ "class":"ar"}
                     ,editor:changeAmtEditor
                     ,format:"{0:n2}"
                  }
                , {   //단가유형
                      title:"<spring:message code='par.lbl.prcTp' />"
                     ,field:"prcTp"
                     ,width:80
                     ,attributes:{ "class":"ac"}
                     ,template:'#= changePrcTp(prcTp)#'
                     ,hidden:true
                  }
                , {   //단가
                      title:"<spring:message code='par.lbl.partsSalePrc' />"
                     ,field:"prc"
                     ,width:120
                     ,attributes:{ "class":"ar"}
                     ,editor:changeAmtEditor
                     ,format:"{0:n2}"
                  }
                , {   //금액
                      title:"<spring:message code='par.lbl.partsSaleAmt' />"
                     ,field:"partCost"
                     ,width:120
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,hidden:true
                  }
                , {//이동단가
                    field      :"movingAvgPrc"
                   ,title      :"<spring:message code='par.lbl.movingAvgPrc' />"
                   ,attributes :{"class":"ar"}
                   ,format     :"{0:n2}"
                   ,width      :100
                }
                , {//이동단가(세금제외)
                    field      :"movingAvgTaxDdctPrc"
                   ,title      :"<spring:message code='par.lbl.movingAvgPrc' />(<spring:message code='par.lbl.taxSprt' />)"
                   ,attributes :{"class":"ar"}
                   ,format     :"{0:n2}"
                   ,width      :100
                }
                , {//이동금액
                    field      :"movingAvgAmt"
                   ,title      :"<spring:message code='par.lbl.movingAvgCost' />"
                   ,attributes :{"class":"ar"}
                   ,format     :"{0:n2}"
                   ,width      :100
                }
                , {//이동금액(세금제외)
                    field      :"movingAvgTaxDdctAmt"
                   ,title      :"<spring:message code='par.lbl.movingAvgCost' />(<spring:message code='par.lbl.taxSprt' />)"
                   ,attributes :{"class":"ar"}
                   ,format     :"{0:n2}"
                   ,width      :100
                }
                , {   //D/C Rate
                      title:"<spring:message code='par.lbl.cstDcRate' />"
                     ,field:"dcRate"
                     ,width:60
                     ,attributes:{ "class":"ar"}
                     ,editor:changeAmtEditor
                     ,format:"{0:n0}"
                     ,template:function(dataItem){
                         var spanObj = "";
                             spanObj = dataItem.dcRate + "%";

                         return spanObj;
                      }
                     ,hidden:true
                  }
                , {   //할인금액
                      title:"<spring:message code='par.lbl.cstDcAmt' />"
                     ,field:"dcAmt"
                     ,width:90
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,hidden:true
                  }
                , {   //할인금액(세금포함)
                      title:"<spring:message code='par.lbl.cstDcAmt' />"
                     ,field:"taxAmt"
                     ,width:90
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,hidden:true
                  }
                , {   //부품비용
                      //title:"<spring:message code='par.lbl.partSaleCost' />"
                      title:"<spring:message code='par.lbl.partsSaleAmt' />"
                     ,field:"amt"
                     ,width:90
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                  }
                , {   //결제유형
                     _field:"cstPayTp"
                     ,title:"<spring:message code='par.lbl.cstPayTp' />"
                     ,width:90
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,hidden:true
                  }
                , {   //지불자코드
                     _field:"payerCd"
                     ,title:"<spring:message code='par.lbl.payerCd' />"
                     ,width:90
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,hidden:true
                  }
                , {   //지불자
                     _field:"payer"
                     ,title:"<spring:message code='par.lbl.payer' />"
                     ,width:90
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,hidden:true
                  }
                , {   //재고상태
                     _field:"stockStat"
                     ,title:"<spring:message code='par.lbl.stockStat' />"
                     ,width:90
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,hidden:true
                  }
                , {   //금액(세금제외)
                      title:"<spring:message code='par.lbl.amtTax' />"
                     ,field:"taxDdctAmt"
                     ,width:120
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,hidden:true
                  }
                , {field:"stockQty" ,title:"<spring:message code='par.lbl.docStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}
                , {field:"avlbStockQty" ,title:"<spring:message code='par.lbl.realAvlbStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80}
                , {field:"resvStockQty" ,title:"<spring:message code='par.lbl.readyQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//예류수량
                , {field:"rentQty" ,title:"<spring:message code='par.lbl.avlbOutQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//차출수량
                , {field:"borrowQty" ,title:"<spring:message code='par.lbl.borrowItemQty' />",attributes:{"class":"ar"}  ,format:"{0:n2}" ,decimal:2 ,width:80}//차입수량
                , {   //전송자
                     _field:"sender"
                     ,title:"<spring:message code='par.lbl.sender' />"
                     ,width:80
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n0}"
                     ,hidden:true
                  }
                , {   //수령상태
                     _field:"reseiveStat"
                     ,title:"<spring:message code='par.lbl.reseiveStat' />"
                     ,width:80
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n0}"
                     ,hidden:true
                  }
                , {   //수령인
                      title:"<spring:message code='par.lbl.receiver' />"
                     ,field:"receiveId"
                     ,width:80
                     ,hidden:true
                  }
                 ,{   title:"<spring:message code='par.lbl.receiveCnfmDt'/>"
                     ,field:"receiveDt"
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,width:80
                     ,hidden:true
                  }
                 ,{
                     _field:"receiveCnfmNo"
                     ,title:"<spring:message code='par.lbl.receiveCnfmNo' />"
                     ,attributes:{ "class":"ac"}
                     ,width:80
                     ,hidden:true
                  }
                , {   //출고창고
                      title:"<spring:message code='par.lbl.giStrgeCd' />"
                     ,field:"giStrgeCd"
                     ,width:100
                     //,editor:giStrgeCdDropDownEditor
                     ,template:'#= changeStrgeCd(giStrgeCd)#'
                     ,sortable:false
                  }
                , {   //로케이션
                      title:"<spring:message code='par.lbl.locationCd' />"
                     ,field:"giLocCd"
                     ,width:140
                     //,editor:giLocCdDropDownEditor
                     //,template:'#= changeGiLocCd(giStrgeCd, giLocCd)#'
                     ,sortable:false
                  }
                , {   //취소수량
                      title:"<spring:message code='global.lbl.cancQty' />"
                     ,field:"cancQty"
                     ,width:80
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n0}"
                     ,hidden:true
                  }
                , {   //취소일자
                      title:"<spring:message code='global.lbl.cancDt' />"
                     ,field:"cancDt"
                     ,width:90
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "class":"ac"}
                     ,hidden:true
                  }
                , {   //취소시간
                      title:"<spring:message code='par.lbl.cancTime' />"
                     ,field:"cancTime"
                     ,attributes:{ "class":"ac"}
                     ,width:80
                     ,hidden:true
                  }
                , {   //취소인
                      title:"<spring:message code='par.lbl.cancer' />"
                     ,field:"cancId"
                     ,width:80
                     ,hidden:true
                  }
                , {   //취소인
                      title:"<spring:message code='par.lbl.cancer' />"
                     ,field:"cancNm"
                     ,width:80
                     ,hidden:true
                  }
                , {   //반품수량
                      title:"<spring:message code='par.lbl.returnPartsQty' />"
                     ,field:"returnQty"
                     ,width:60
                     ,attributes:{ "class":"ar"}
                     ,editor:changeAmtEditor
                     ,format:"{0:n2}"
                     ,hidden:true
                  }
                , {   //반품인
                      title:"<spring:message code='par.lbl.partsSaleReturner' />"
                     ,field:"returnId"
                     ,width:80
                     ,hidden:true
                  }
                , {   //반품인
                      title:"<spring:message code='par.lbl.returner' />"
                     ,field:"returnNm"
                     ,width:80
                     ,hidden:true
                  }
                , {   //기반품수량
                      title:"<spring:message code='par.lbl.preReturnPartsQty' />"
                     ,field:"preReturnQty"
                     ,width:80
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                  }
                , {   //반품일
                      title:"<spring:message code='par.lbl.returnTime' />"
                     ,field:"returnDt"
                     ,width:90
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "class":"ac"}
                     ,hidden:true
                  }
                , {   //반품시간
                      title:"<spring:message code='par.lbl.returnTime' />"
                     ,field:"returnTime"
                     ,attributes:{ "class":"ac"}
                     ,width:80
                     ,hidden:true
                  }
                , {   //반품번호
                      title:"<spring:message code='par.lbl.partsSaleReturnNo' />"
                     ,field:"returnDocNo"
                     ,width:120
                     ,hidden:true
                  }
                , {   //설치예정일
                      title:"<spring:message code='par.lbl.eqipExpcDt' />"
                     ,field:"eqipExpcDt"
                     ,width:100
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "class":"ac"}
                     ,hidden:true
                  }
            ]
        });

        $("#grid .k-grid-content").on("change","input.grid-checkbox-item",function(e){
            var grid = $("#grid").data("kendoExtGrid"),
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
        changeStatCd = function(pStatCd,pOrdQty,pPreReturnQty){
            var returnVal = "";
            if(pStatCd === '07'){
                returnVal = 'disabled';
            }else{
                if(Number(pPreReturnQty) >= Number(pOrdQty)){
                    returnVal = 'disabled';
                }
            }
            return returnVal;
        };

        //가격유형
        changePrcTp = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(prcTpObj[val])){
                    returnVal = prcTpObj[val];
                }
            }
            return returnVal;
        };

        // 단위
        changeUnitCd = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(unitCdObj[val])){
                    returnVal = unitCdObj[val];
                }
            }
            return returnVal;
        };

         // 판매
         changeSaleTp = function(val){
             var returnVal = "";
             if(!dms.string.isEmpty(val)){
                 if(!dms.string.isEmpty(saleTpObj[val])){
                     returnVal = saleTpObj[val];
                 }
             }
             return returnVal;
         };

         // 부품유형
         changeItemDstinCd = function(val){
             var returnVal = "";
             if(!dms.string.isEmpty(val)){
                 if(!dms.string.isEmpty(itemDstinCdObj[val])){
                     returnVal = itemDstinCdObj[val];
                 }
             }
             return returnVal;
         };

        // 창고
         changeStrgeCd = function(val){
             var returnVal = "";
             if(!dms.string.isEmpty(val)){
                 if(!dms.string.isEmpty(giStrgeTpObj[val])){
                     returnVal = giStrgeTpObj[val];
                 }
             }
             return returnVal;
         };

        // 판매상태
         changeGiStatCd = function(val){
             var returnVal = "";
             if(!dms.string.isEmpty(val)){
                 if(!dms.string.isEmpty(giStatCdObj[val])){
                     returnVal = giStatCdObj[val];
                 }
             }
             return returnVal;
         };

         // 로케이션
         changeGiLocCd = function(strgeCd, locCd){
             var returnVal = "";
             if(locCd != null && locCd != ""){
                 if(dms.string.isEmpty(locationObj[strgeCd])){
                     returnVal = '';
                 }else{
                     if(dms.string.isEmpty(locationObj[strgeCd][locCd])){
                         returnVal = '';
                     }else{
                         returnVal = locationObj[strgeCd][locCd];
                     }
                 }
             }else{
                 returnVal = '';
             }

             return returnVal;
         };

        initPage();
    });

    function fnChangeCustTp(e){
        $('#custCd').val('');
        $('#custNm').val('');
        $("#custTelNo").data("kendoMaskedTextBox").value('');
        //2018-11-20 update by weiyongjie 客户类型改变时 清空旧值 start
        $('#carRegNo').val('');
       //2018-11-20 update by weiyongjie 客户类型改变时 清空旧值 end
        fnInstantCustChk(false);
    }

    function fnChangeIntantCust(e){

        fnInstantCustChk($('#instantCust').prop("checked"));
    }

    function fnInstantCustChk(pCheck){

        if(pCheck === true){
            $('#custCd').val('guest');
            $('#custNm').val('');
            $("#custTelNo").data("kendoMaskedTextBox").value('');
            $("#custTp").data("kendoExtDropDownList").value('01');
            $("#custNm").removeAttr('readonly');
            $("#custNm").removeClass("form_readonly");
        }else{
            $('#instantCust').prop("checked",false);
            $('#custCd').val('');
            $('#custNm').val('');
            $("#custTelNo").data("kendoMaskedTextBox").value('');
            $("#custNm").attr('readonly','true');
            $("#custNm").addClass("form_readonly");

        }
    }

   // 부품판매 정보 조회.
   function selectPartsSaleOrd(pParSalesOrdNo){

       $.ajax({
           url:"<c:url value='/par/ism/issue/selectPartsSaleOrdByKey.do' />",
           data:JSON.stringify({ sParSaleOrdNo:pParSalesOrdNo}),
           type:"POST",
           dataType:"json",
           contentType:"application/json",
           error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }

       }).done(function(result) {

               var ordStatCd;

               if (!partsJs.validate.getAllPluginObjInfo($("#custForm")[0])) {
                   return false;
               }
               partsJs.validate.groupObjAllDataSet(result);

               if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
                   return false;
               }

               partsJs.validate.groupObjAllDataSet(result);

               ordStatCd = $("#ordStatCd").data("kendoExtDropDownList").value();

               $("#grid").data("kendoExtGrid").dataSource.read();

               $("#instantCust").prop( "disabled", true );

               $("#searchCustCd").prop( "disabled", true );
               $("#searchCustCd").addClass("form_readonly")
               if($('#custCd').val() !== 'guest'){
                   $("#custNm").attr('readonly','true');
                   $("#custNm").addClass("form_readonly");
               }else{
                   $("#custNm").removeAttr('readonly');
                   $("#custNm").removeClass("form_readonly");
               }

               gCrud = "U";

               btnView(ordStatCd);

        });
    }

    //부품판매 정보 조회.
    function selectEstimateDocNo(pEstimateDocNo){

       $.ajax({
           url:"<c:url value='/par/ism/issue/selectPartsSaleOrdByEstimateKey.do' />",
           data:JSON.stringify({ estimateDocNo:pEstimateDocNo}),
           type:"POST",
           dataType:"json",
           contentType:"application/json",
           error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }

       }).done(function(result) {

               var ordStatCd;

               partsJs.validate.groupObjAllDataSet(result);

               ordStatCd = $("#ordStatCd").data("kendoExtDropDownList").value();
               if(result.custCd === 'guest'){
                   $('#instantCust').prop("checked",true);
               }else{
                   $('#instantCust').prop("checked",false);
               }

               $.ajax({
                   url:"<c:url value='/par/ism/issue/selectPartsSaleOrdItemByEstimateKey.do' />",
                   data:JSON.stringify({ estimateDocNo:pEstimateDocNo}),
                   type:"POST",
                   dataType:"json",
                   contentType:"application/json",
                   error:function(jqXHR,status,error) {
                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   }

               }).done(function(result) {

                   var dataLen      = result.data.length,
                       gridData     = $("#grid").data("kendoExtGrid"),
                       estmItemData = {},
                       itemList     = [],
                       tDate,
                       amt,
                       dcAmt,
                       partCost,
                       taxAmt,
                       taxDdctAmt,
                       rows;

                   if(dataLen > 0){
                       $("#dcRate").closest(".k-numerictextbox").addClass("form_readonly");
                       $("#dcRate").data("kendoExtNumericTextBox").enable(false);
                       $("#saleTp").data("kendoExtDropDownList").enable(false);
                   }

                   for(var i = 0; i < dataLen; i = i + 1){
                       dcAmt      = 0;
                       taxAmt     = 0;
                       taxDdctAmt = 0;

                       amt        = result.data[i].prc * result.data[i].ordQty;
                       partCost   = result.data[i].prc * result.data[i].ordQty;
                       dcAmt      = 0;
                       taxAmt     = (amt) - (amt/( 1 + gVatCd ));
                       taxDdctAmt = amt/( 1 + gVatCd );

                       estmItemData.itemDstinCd    = '02';
                       estmItemData.itemCd         = result.data[i].itemCd;
                       estmItemData.itemNm         = result.data[i].itemNm;
                       estmItemData.printItemNm    = result.data[i].itemNm;
                       estmItemData.unitCd         = result.data[i].unitCd;
                       estmItemData.ordQty         = result.data[i].ordQty;
                       estmItemData.prc            = result.data[i].prc;
                       estmItemData.amt            = amt;
                       estmItemData.dcAmt          = dcAmt;
                       estmItemData.partCost       = partCost;
                       estmItemData.taxAmt         = taxAmt;
                       estmItemData.taxDdctAmt     = taxDdctAmt;
                       estmItemData.prcTp          = $("#saleTp").data("kendoExtDropDownList").value();
                       estmItemData.saleTp         = $("#saleTp").data("kendoExtDropDownList").value();
                       estmItemData.dcRate         = result.data[i].dcRate;
                       estmItemData.stockQty       = result.data[i].stockQty;
                       estmItemData.avlbStockQty   = result.data[i].avlbStockQty;
                       estmItemData.resvStockQty   = result.data[i].resvStockQty;
                       estmItemData.borrowQty      = result.data[i].borrowQty;
                       estmItemData.rentQty        = result.data[i].rentQty;
                       estmItemData.giStrgeCd      = result.data[i].giStrgeCd;
                       estmItemData.giLocCd        = result.data[i].giLocCd;
                       estmItemData.giStatCd       = '';
                       estmItemData.preReturnQty   = null;

                       if(popItemObj.hasOwnProperty(result.data[i].itemCd)){
                           if(popItemObj[result.data[i].itemCd].hasOwnProperty(result.data[i].giStrgeCd)){
                               //이미 등록되어있는 부품입니다.
                               //var itemInfo = result.data[i].itemCd + '[' + result.data[i].itemNm + ']' + '[' + giStrgeTpObj[result.data[i].giStrgeCd] + ']';
                               //dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                               gridData.dataSource.add(estmItemData);
                           }else{
                               popItemObj[result.data[i].itemCd][result.data[i].giStrgeCd] = result.data[i].itemNm;
                               gridData.dataSource.add(estmItemData);
                           }
                       }else{
                           popItemObj[result.data[i].itemCd] = {};
                           popItemObj[result.data[i].itemCd][result.data[i].giStrgeCd] = result.data[i].itemNm;
                           gridData.dataSource.add(estmItemData);
                       }
                   }

                   gridData.select(gridData.tbody.find(">tr"));

                   fnSetAmtInfo();

               });

               gCrud = "C";

               btnView(ordStatCd);

        });
    }
    //부품 팝업 열기 함수.
    function selectItemSalePrcPopupWindow(){

        selectShareStockGiItemPopupWindow = dms.window.popup({
            windowId:"ItemMasterPopup"
            ,title:"<spring:message code='par.title.partSearch' />"
            ,width:900
            ,height:550
            ,content:{
                url:"<c:url value='/par/cmm/selectShareStockGiItemPopup.do'/>"
                ,data:{
                    "type":""
                    ,"autoBind":true
                    ,"prcTp":$("#saleTp").data("kendoExtDropDownList").value()
                    ,"itemDstinCd":'02'
                    ,"selectable":"multiple"
                    ,"callbackFunc":function(data){

                       var dataLen      = data.length,
                           gridData     = $("#grid").data("kendoExtGrid"),
                           popItemData  = {},
                           itemList     = [],
                           tDate,
                           amt,
                           dcAmt,
                           partCost,
                           taxAmt,
                           taxDdctAmt,
                           movingAvgAmt,
                           movingAvgTaxDdctAmt,
                           dcRate    = $("#dcRate").data("kendoExtNumericTextBox").value(),
                           grid      = $("#grid").data("kendoExtGrid"),
                           rows      = grid.tbody.find("tr"),
                           rowLeng   = rows.length,
                           cell;

                       if(dataLen > 0){
                           $("#dcRate").closest(".k-numerictextbox").addClass("form_readonly");
                           $("#dcRate").data("kendoExtNumericTextBox").enable(false);
                           $("#saleTp").data("kendoExtDropDownList").enable(false);
                       }

                       //for(var i = 0; i < dataLen; i = i + 1){
                       //    itemList.push(data[i].itemCd);
                       //}
                       //fnSetLocCdObj(itemList);

                       for(var i = 0; i < dataLen; i = i + 1){
                           dcAmt = 0;

                           /*
                           if(dms.string.isEmpty(dcRate)|| dcRate === 0){
                               amt        = Number(data[i].giQty) * Number(data[i].salePrcAmt);
                               partCost   = Number(data[i].giQty) * Number(data[i].salePrcAmt);
                               dcAmt      = 0;
                               taxAmt     = (Number(data[i].giQty) * Number(data[i].salePrcAmt)) - ((Number(data[i].giQty) * Number(data[i].salePrcAmt))/( 1 + gVatCd ));
                               taxDdctAmt = (Number(data[i].giQty) * Number(data[i].salePrcAmt))/( 1 + gVatCd );
                               //taxAmt     = (Number(data[i].giQty) * Number(data[i].salePrcAmt)) * gVatCd;
                               //taxDdctAmt = (Number(data[i].giQty) * Number(data[i].salePrcAmt)) - ((Number(data[i].giQty) * Number(data[i].salePrcAmt)) * gVatCd);
                           }else{
                               amt        = (Number(data[i].giQty) * Number(data[i].salePrcAmt)) - ((Number(data[i].giQty) * Number(data[i].salePrcAmt)) * (dcRate/100));
                               partCost   = (Number(data[i].giQty) * Number(data[i].salePrcAmt));
                               dcAmt      = (Number(data[i].giQty) * Number(data[i].salePrcAmt)) * (dcRate/100);
                               taxAmt     = amt - amt/( 1 + gVatCd );
                               taxDdctAmt = amt/( 1 + gVatCd );
                           }
                           */
                           amt        = Number(data[i].giQty) * Number(data[i].salePrcAmt);
                           partCost   = Number(data[i].giQty) * Number(data[i].salePrcAmt);
                           dcAmt      = 0;
                           taxAmt     = (Number(data[i].giQty) * Number(data[i].salePrcAmt)) - ((Number(data[i].giQty) * Number(data[i].salePrcAmt))/( 1 + gVatCd ));
                           taxDdctAmt = (Number(data[i].giQty) * Number(data[i].salePrcAmt))/( 1 + gVatCd );
                           movingAvgAmt        = Math.round(Number(data[i].movingAvgPrc) * Number(data[i].giQty) * 100)/100 ;
                           movingAvgTaxDdctAmt = Math.round(Number(data[i].movingAvgTaxDdctPrc) * Number(data[i].giQty) * 100)/100 ;

                           popItemData.itemDstinCd    = '02';
                           popItemData.itemCd         = data[i].itemCd;
                           popItemData.itemNm         = data[i].itemNm;
                           popItemData.printItemNm    = data[i].itemNm;
                           popItemData.unitCd         = data[i].stockUnitCd;
                           popItemData.ordQty         = data[i].giQty;
                           popItemData.prc            = data[i].salePrcAmt;
                           popItemData.amt            = amt;
                           popItemData.taxAmt         = taxAmt;
                           popItemData.taxDdctAmt     = taxDdctAmt;
                           popItemData.dcAmt          = dcAmt;
                           popItemData.partCost       = partCost;
                           popItemData.movingAvgPrc   = data[i].movingAvgPrc;
                           popItemData.movingAvgTaxDdctPrc     = data[i].movingAvgTaxDdctPrc;
                           popItemData.movingAvgAmt            = movingAvgAmt;
                           popItemData.movingAvgTaxDdctAmt     = movingAvgTaxDdctAmt;
                           popItemData.prcTp          = $("#saleTp").data("kendoExtDropDownList").value();
                           popItemData.saleTp         = $("#saleTp").data("kendoExtDropDownList").value();
                           popItemData.dcRate         = dcRate;
                           popItemData.stockQty       = data[i].stockQty;
                           popItemData.avlbStockQty   = data[i].avlbStockQty;
                           popItemData.resvStockQty   = data[i].resvStockQty;
                           popItemData.borrowQty      = data[i].borrowQty;
                           popItemData.rentQty        = data[i].rentQty;
                           popItemData.giStrgeCd      = data[i].giStrgeCd;
                           popItemData.giStatCd       = '01';
                           popItemData.preReturnQty   = null;
                           popItemData.giLocCd        = data[i].giLocCd;

                           /*
                           if(!dms.string.isEmpty(locationListObj[data[i].itemCd])){
                               if(!dms.string.isEmpty(locationListObj[data[i].itemCd][data[i].giStrgeCd])){
                                 popItemData.giLocCd = locationListObj[data[i].itemCd][data[i].giStrgeCd][0].cmmCd;
                               }else{
                                   popItemData.giLocCd = '';
                               }
                           }else{
                               popItemData.giLocCd = '';
                           }
                           */

                           if(popItemObj.hasOwnProperty(data[i].itemCd)){
                               if(popItemObj[data[i].itemCd].hasOwnProperty(data[i].giStrgeCd)){
                                   //이미 등록되어있는 부품입니다.
                                   //var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']'+ '[' + giStrgeTpObj[data[i].giStrgeCd] + ']';
                                   //dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                                   gridData.dataSource.add(popItemData);
                               }else{
                                   popItemObj[data[i].itemCd][data[i].giStrgeCd] = data[i].itemNm;
                                   gridData.dataSource.add(popItemData);
                               }
                           }else{
                               popItemObj[data[i].itemCd] = {};
                               popItemObj[data[i].itemCd][data[i].giStrgeCd] = data[i].itemNm;
                               gridData.dataSource.add(popItemData);
                           }
                       }

                       //gridData.select(gridData.tbody.find(">tr"));
                       selectShareStockGiItemPopupWindow.close();

                       fnSetAmtInfo();

                       grid.editCell(grid.tbody.find("tr:eq("+rowLeng+") td:eq(10)"));

                       $("#btnSave").data("kendoButton").enable(true);
                   }
               }
           }
        });
    }

    function initPage(){

        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if(!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])){
            return false;
        }

       // 품목 정보 Reset
       //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
       partsJs.validate.groupObjAllDataInit();

       if(!partsJs.validate.getAllPluginObjInfo($("#custForm")[0])){
           return false;
       }

       // 품목 정보 Reset
       //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
       partsJs.validate.groupObjAllDataInit();

       $("#grid").data("kendoExtGrid").dataSource.data([]);

       $("#ordStatCd").data("kendoExtDropDownList").enable(false);

       $("#dcBefTotAmt").closest(".k-numerictextbox").addClass("form_readonly");
       $("#dcBefTotAmt").data("kendoExtNumericTextBox").enable(false);
       $("#dcAmt").closest(".k-numerictextbox").addClass("form_readonly");
       $("#dcAmt").data("kendoExtNumericTextBox").enable(false);
       $("#totAmt").closest(".k-numerictextbox").addClass("form_readonly");
       $("#totAmt").data("kendoExtNumericTextBox").enable(false);

       $("#itemCnt").closest(".k-numerictextbox").addClass("form_readonly");
       $("#itemCnt").data("kendoExtNumericTextBox").enable(false);
       $("#itemQty").closest(".k-numerictextbox").addClass("form_readonly");
       $("#itemQty").data("kendoExtNumericTextBox").enable(false);
       $("#itemAmt").closest(".k-numerictextbox").addClass("form_readonly");
       $("#itemAmt").data("kendoExtNumericTextBox").enable(false);

       $("#dcRate").closest(".k-numerictextbox").removeClass("form_readonly");
       $("#dcRate").data("kendoExtNumericTextBox").enable(true);
       $("#saleTp").data("kendoExtDropDownList").enable(true);
       $("#instantCust").prop( "disabled", false );
       $("#custNm").removeAttr('readonly');
       $("#custNm").removeClass("form_readonly")
       $("#searchCustCd").prop( "disabled", false );
       $("#searchCustCd").removeClass("form_readonly")
       $("#saleTp").data("kendoExtDropDownList").value('01');

       $("#salePrsnId").val(sessionUsrId);
       $("#salePrsnNm").val(sessionUsrNm);

        $("#dcRate").data("kendoExtNumericTextBox").value(0);
        locationObj = {};

        popItemObj = {};

        btnView(); //초기화 시 버튼 구성

        //판매현황 관리에서 넘어온 경우
        if(!dms.string.isEmpty(pParSalesOrdNo)){
           selectPartsSaleOrd(pParSalesOrdNo);
        }

        //견적 관리에서 넘어온 경우
        if(!dms.string.isEmpty(pEstimateDocNo)){
            selectEstimateDocNo(pEstimateDocNo);
        }
    }

    function btnView(pStat){

        if(dms.string.isEmpty(pStat)){//신규 등록 시
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnCnfm").data("kendoButton").enable(false);
            $("#btnReturn").data("kendoButton").enable(false);
            $("#btnPrint").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#custTp").data("kendoExtDropDownList").enable(true);
            $("#saleTp").data("kendoExtDropDownList").enable(true);

            $("#btnPackage").data("kendoButton").enable(true);
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDelItem").data("kendoButton").enable(true);
            $("#btnExcelUpload").data("kendoButton").enable(true);

        }else if(pStat === "01"){//등록 상태 인경우
            $("#btnReturn").data("kendoButton").enable(false);
            $("#btnPrint").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnCnfm").data("kendoButton").enable(true);
            $("#btnCancel").data("kendoButton").enable(true);
            $("#custTp").data("kendoExtDropDownList").enable(false);
            $("#saleTp").data("kendoExtDropDownList").enable(false);

            $("#btnPackage").data("kendoButton").enable(true);
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDelItem").data("kendoButton").enable(true);
            $("#btnExcelUpload").data("kendoButton").enable(true);

        }else if(pStat === "02"){ //확정 상태 인경우
            $("#btnReturn").data("kendoButton").enable(true);
            $("#btnPrint").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnCnfm").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#custTp").data("kendoExtDropDownList").enable(false);
            $("#saleTp").data("kendoExtDropDownList").enable(false);

            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDelItem").data("kendoButton").enable(true);
            $("#btnPackage").data("kendoButton").enable(false);
            $("#btnExcelUpload").data("kendoButton").enable(false);

        }else if(pStat === "04"){ //정산 상태 인경우
            $("#btnReturn").data("kendoButton").enable(false);
            $("#btnPrint").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnCnfm").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#custTp").data("kendoExtDropDownList").enable(false);
            $("#saleTp").data("kendoExtDropDownList").enable(false);

            $("#btnAdd").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);
            $("#btnPackage").data("kendoButton").enable(false);
            $("#btnExcelUpload").data("kendoButton").enable(false);

        }else if(pStat === "05"){ //수납 상태 인경우
            $("#btnReturn").data("kendoButton").enable(false);
            $("#btnPrint").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnCnfm").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#custTp").data("kendoExtDropDownList").enable(false);
            $("#saleTp").data("kendoExtDropDownList").enable(false);

            $("#btnAdd").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);
            $("#btnPackage").data("kendoButton").enable(false);
            $("#btnExcelUpload").data("kendoButton").enable(false);

        }else if( pStat === "03" || pStat === "07"){ //그 외(취소 및 반품)
            $("#btnReturn").data("kendoButton").enable(false);
            $("#btnPrint").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnCnfm").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#custTp").data("kendoExtDropDownList").enable(false);
            $("#saleTp").data("kendoExtDropDownList").enable(false);

            $("#btnAdd").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);
            $("#btnPackage").data("kendoButton").enable(false);
            $("#btnExcelUpload").data("kendoButton").enable(false);
        }
    }

    function saSearchPopup() {

        userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                ,data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#saId").val(data[0].usrId);
                            $("#saNm").val(data[0].usrNm);
                        }
                        userSearchPopupWin.close();
                    }
                }
            }
        });
    }

    function salePrsnSearchPopup() {
        userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"
            ,width : 840
            ,height: 500
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                ,data:{
                    "autoBind":true
                    ,"usrNm":""
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#salePrsnId").val(data[0].usrId);
                            $("#salePrsnNm").val(data[0].usrNm);
                        }
                        userSearchPopupWin.close();
                    }
                }
            }
        });
    }
    //selectVenderMasterPopupWindow popup Func
    function custSearchPopup() {
        if(dms.string.isEmpty($("#custTp").data("kendoExtDropDownList").value())){
            //고객유형은 필수 입력 사항입니다.
            dms.notification.warning("<spring:message code='par.lbl.custTp' var='custTp' /><spring:message code='global.info.required.field' arguments='${custTp}'/>");
            return false;
        }

        if($("#custTp").data("kendoExtDropDownList").value() === '01'){
            selectCustSearchPopupWindow();
        }else if($("#custTp").data("kendoExtDropDownList").value() === '02'){
            selectVenderMasterPopupWindow();
        }
        fnInstantCustChk(false);
    }
    //selectVenderMasterPopupWindow popup Func
    function selectVenderMasterPopupWindow(){

        customerAllSearchPopupWin = dms.window.popup({
            windowId:"customerAllSearchPopupWin"
            ,title:"<spring:message code = 'par.title.venderCstSelect'/>"
            ,width:800
            ,height:400
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectCustomerMasterAllPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"callbackFunc":function(data){
                        $("#custCd").val(data[0].bpCd);
                        $("#custNm").val(data[0].bpNm);
                        $("#custNm").attr('readonly','true');
                        $("#custNm").addClass("form_readonly");
                        console.log(data);
                        if( data[0].prcTp != null && data[0].prcTp != "" ) {
                        	  $("#saleTp").data("kendoExtDropDownList").value(data[0].prcTp);
                        }
                        customerAllSearchPopupWin.close();
                    }
                }
            }
        });
    }
    //selectCustSearchPopupWindow popup Func
    function selectCustSearchPopupWindow(){

        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='par.title.custSearch' />"
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "callbackFunc":function(data){

                        if(data.length >= 1) {

                            $("#custCd").val(data[0].custNo);
                            $("#custNm").val(data[0].custNm);
                            $("#custTelNo").data("kendoMaskedTextBox").value(data[0].hpNo);
                            $("#carRegNo").val(data["carRegNo"]);
                            $("#custNm").attr('readonly','true');
                            $("#custNm").addClass("form_readonly");

                        }
                    }
                }
            }
        });
    }

    var selectIssueWorkPackagePopup;
    function selectWorkPackagePopupWindow(){

        selectIssueWorkPackagePopup = dms.window.popup({
            windowId:"selectIssueWorkPackagePopup"
            ,width:820
            ,height:350
            ,title:"<spring:message code='par.title.packageSelect' />"
            ,content:{
                url:"<c:url value='/par/cmm/selectIssuePackageWorkPopup.do'/>"
                ,data:{
                    "autoBind":true
                    ,"pkgTp":'02'
                    ,"itemDstinCd":'04'
                    ,"selectable":"multiple"
                    ,"callbackFunc":function(parData, lbrData){

                        var gridData = $("#grid").data("kendoExtGrid"),
                        popItemData = {},
                        itemList = [],
                        tDate,
                        amt,
                        dcAmt,
                        partCost,
                        taxAmt,
                        taxDdctAmt,
                        movingAvgAmt,
                        movingAvgTaxDdctAmt,
                        dcRate = $("#dcRate").data("kendoExtNumericTextBox").value(),
                        rows;

                        if(parData.length > 0) {

                            $.each(parData, function(idx, data){

                                dcAmt = 0;
                                amt        = data.itemAmt;
                                partCost   = data.itemAmt;
                                dcAmt      = 0;
                                taxAmt     = data.itemAmt - ((data.itemAmt)/( 1 + gVatCd ));
                                taxDdctAmt = Math.round(Number((data.itemAmt)/( 1 + gVatCd ))  * 100)/100 ;
                                movingAvgAmt     = Math.round(Number(data.movingAvgPrc) * Number(data.itemQty) * 100)/100 ;
                                movingAvgTaxDdctAmt = Math.round(Number(data.movingAvgTaxDdctPrc) * Number(data.itemQty) * 100)/100 ;

                                popItemData.itemDstinCd    = '02';
                                popItemData.itemCd         = data.itemCd;
                                popItemData.itemNm         = data.itemNm;
                                popItemData.printItemNm    = data.itemNm;
                                popItemData.unitCd         = data.itemUnitCd;
                                popItemData.ordQty         = data.itemQty;
                                popItemData.prc            = data.itemPrc;

                                popItemData.amt            = amt;
                                popItemData.dcAmt          = dcAmt;
                                popItemData.partCost       = partCost;
                                popItemData.taxAmt         = taxAmt;
                                popItemData.taxDdctAmt     = taxDdctAmt;
                                popItemData.movingAvgPrc   = data.movingAvgPrc;
                                popItemData.movingAvgTaxDdctPrc     = data.movingAvgTaxDdctPrc;
                                popItemData.movingAvgAmt         = movingAvgAmt;
                                popItemData.movingAvgTaxDdctAmt     = movingAvgTaxDdctAmt;
                                popItemData.prcTp          = $("#saleTp").data("kendoExtDropDownList").value();
                                popItemData.saleTp         = $("#saleTp").data("kendoExtDropDownList").value();

                                popItemData.dcRate         = 0;
                                popItemData.stockQty       = data.strgeStockQty;
                                popItemData.avlbStockQty   = data.avlbStockQty;
                                popItemData.resvStockQty   = data.resvStockQty;
                                popItemData.borrowQty      = data.borrowQty;
                                popItemData.rentQty        = data.rentQty;
                                popItemData.pkgItemCd      = data.pkgItemCd;
                                popItemData.pkgItemNm      = data.pkgItemNm;
                                popItemData.giStrgeCd      = data.giStrgeCd;
                                popItemData.giLocCd        = data.giLocCd;
                                popItemData.giStatCd       = "01";
                                popItemData.preReturnQty   = null;

                                if(popItemObj.hasOwnProperty(data.itemCd)){
                                    if(popItemObj[data.itemCd].hasOwnProperty(data.giStrgeCd)){
                                        //이미 등록되어있는 부품입니다.
                                        //var itemInfo = data.itemCd + '[' + data.itemNm + ']' + '[' + giStrgeTpObj[data.giStrgeCd] + ']';
                                        //dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                                        gridData.dataSource.add(popItemData);
                                    }else{
                                        popItemObj[data.itemCd][data.giStrgeCd] = data.itemNm;
                                        gridData.dataSource.add(popItemData);
                                    }
                                }else{
                                    popItemObj[data.itemCd] = {};
                                    popItemObj[data.itemCd][data.giStrgeCd] = data.itemNm;
                                    gridData.dataSource.add(popItemData);
                                }

                            });

                            $("#dcRate").closest(".k-numerictextbox").addClass("form_readonly");
                            $("#dcRate").data("kendoExtNumericTextBox").enable(false);
                            $("#saleTp").data("kendoExtDropDownList").enable(false);

                            fnSetAmtInfo();

                            selectIssueWorkPackagePopup.close();
                        }
                    }
                }
            }
        });

    }

    // 판매리스트 팝업 열기 함수.
    function selectPartsSaleOrdListPopupWindow(){

        partsSaleOrdListPopupWindow = dms.window.popup({
            windowId:"partsSaleOrdListPopup"
            ,title:"<spring:message code='par.lbl.partsSaleNo' />"   // 판매번호
            ,width :780
            ,height:420
            ,content:{
                url:"<c:url value='/par/cmm/selectPartsSaleOrdListPopup.do'/>"
                ,data:{
                      "type":"custom1"
                    , "autoBind":false
                    , "custCd":$("#custCd").val()
                    , "custNm":$("#custNm").val()
                    , "custTp":$("#custTp").data("kendoExtDropDownList").value()
                    , "instantCust":$('#instantCust').prop("checked")
                    , "selectable":"single"
                    , "callbackFunc":function(data){
                        if(data.length === 1)
                        {
                            pParSalesOrdNo = data[0].parSaleOrdNo;
                            selectPartsSaleOrd(data[0].parSaleOrdNo);
                        }
                        partsSaleOrdListPopupWindow.close();
                    }
                }
            }
        });
    }

    // 판매반품 팝업 열기 함수.
    function fnPartsSaleOrdReturnPopupWindow(pSelectedLine){

        setPartsSaleOrdReturnPopupWindow = dms.window.popup({
            windowId:"setPartsSaleOrdReturnPopup"
            ,title:"<spring:message code='par.btn.innerReturn' />"   // 반품
            ,width :340
            ,height:180
            ,content:{
                url:"<c:url value='/par/cmm/setPartsSaleOrdReturnPopup.do'/>"
                ,data:{
                      "endQty":pSelectedLine.endQty
                    , "preReturnQty":pSelectedLine.preReturnQty
                    , "returnId":''
                    , "callbackFunc":function(data){

                            var saveList      = [],
                                grid          = $("#grid").data("kendoExtGrid"),
                                rows          = grid.tbody.find("tr"),
                                ordStatCd     = $("#ordStatCd").data("kendoExtDropDownList").value(),
                                gridData,
                                chkRow,
                                header;

                            fnSetAmtInfo();

                            header = {
                                    parSaleOrdNo    :$("#parSaleOrdNo").val()
                                  , saleTp          :$("#saleTp").data("kendoExtDropDownList").value()
                                  , custTp          :$("#custTp").data("kendoExtDropDownList").value()
                                  , custCd          :$("#custCd").val()
                                  , custNm          :$("#custNm").val()
                                  , custTelNo       :$("#custTelNo").data("kendoMaskedTextBox").value()
                                  , salePrsnId      :data.returnNm
                                  , saId            :$("#saId").val()
                                  , dcRate          :$("#dcRate").data("kendoExtNumericTextBox").value()
                                  , dcBefTotAmt     :$("#dcBefTotAmt").data("kendoExtNumericTextBox").value()
                                  , dcAmt           :$("#dcAmt").data("kendoExtNumericTextBox").value()
                                  , totAmt          :$("#totAmt").data("kendoExtNumericTextBox").value()
                                  , vatAmt          :$("#vatAmt").data("kendoExtNumericTextBox").value()
                                  , remark          :$("#remark").val()
                                  , updtDtStr       :$("#updtDtStr").val()
                            };

                            if(rows.length  == 0 ){
                                // 선택값이 없습니다.
                                dms.notification.warning("<spring:message code='global.info.unselected' />");
                                return false;
                            }

                            rows.each(function(index, row) {
                                gridData = grid.dataSource.at(index);
                                chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                                if(chkRow === true){
                                    if(dms.string.isEmpty(data.returnQty) || data.returnQty == 0){
                                        // 수량을 입력하십시오
                                        dms.notification.warning("<spring:message code='par.lbl.returnQty' var='returnQty' /><spring:message code='global.info.confirmMsgParam' arguments='${returnQty}'/>");
                                        saveList = [];
                                        return false;
                                    }

                                    gridData.returnQty = data.returnQty;
                                    saveList.push(gridData);
                                }
                            });

                            if(saveList.length === 1){
                                var data ={
                                       "partsSaleOrdVO":header
                                      ,"partsSaleOrdItemList":saveList
                                    };

                                $.ajax({
                                     url:"<c:url value='/par/ism/issue/returnPartsSaleOrd.do' />"
                                    ,data:kendo.stringify(data)
                                    ,type:'POST'
                                    ,dataType:'json'
                                    ,contentType:'application/json'
                                    ,async:true
                                    ,success:function(result) {

                                        if (result.resultYn == true) {
                                            dms.notification.success("<spring:message code='par.lbl.partsSaleNo' var='parSaleOrdNo' /><spring:message code='global.info.regSuccessParam' arguments='${parSaleOrdNo}'/>");

                                            pParSalesOrdNo = result.parSaleOrdNo;
                                            $('#parSaleOrdNo').val(result.parSaleOrdNo);
                                            $("#ordStatCd").data("kendoExtDropDownList").value(result.ordStatCd);
                                            // 부품판매 조회.
                                            selectPartsSaleOrd(pParSalesOrdNo);

                                        } else {
                                            if(result === 0){
                                                dms.notification.error("<spring:message code='par.lbl.partsSaleNo' var='parSaleOrdNo' /><spring:message code='global.err.regFailedParam' arguments='${parSaleOrdNo}'/>");
                                            }
                                        }
                                    }
                                    ,beforeSend:function(){
                                        dms.loading.show($("#partsSaleOrdSection"));
                                    }
                                    ,complete:function(){
                                        dms.loading.hide($("#partsSaleOrdSection"));
                                    }
                                   ,error:function(jqXHR,status,error) {
                                       dms.loading.hide($("#partsSaleOrdSection"));
                                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                    }

                                });
                            }else{
                                dms.notification.warning("<spring:message code='global.info.required.selectOne'/>");
                                return false;
                            }
                        setPartsSaleOrdReturnPopupWindow.close();
                    }
                }
            }
        });
    }



    function fnSetAmtInfo(){
        var grid        = $("#grid").data("kendoExtGrid"),
            rows        = grid.tbody.find("tr"),
            totalAmt    = 0,
            dcBefAmt    = 0,
            dcAmt       = 0,
            vatAmt      = 0,
            itemCnt     = 0,
            itemQty     = 0,
            itemAmt     = 0,
            gridData;

        rows.each(function(index, row) {
            gridData = grid.dataItem(rows[index]);

            /*
            if(gridData.dcRate === 0){
                dcBefAmt = dcBefAmt + gridData.amt;
                totalAmt = totalAmt + gridData.amt;
                dcAmt    = 0;
            }else{
                dcBefAmt = dcBefAmt + (gridData.prc * gridData.ordQty);
                totalAmt = totalAmt + gridData.amt;
                dcAmt    = dcAmt + gridData.dcAmt;

            }
            */

            dcBefAmt = dcBefAmt + gridData.amt;
            totalAmt = totalAmt + gridData.amt;
            dcAmt    = 0;

            vatAmt = vatAmt + gridData.taxAmt;
            itemCnt = itemCnt + 1;
            itemQty = Number(itemQty) + Number(gridData.ordQty);
            itemAmt = Number(itemAmt) + Number(gridData.amt);

        });

        $("#dcBefTotAmt").data("kendoExtNumericTextBox").value(dcBefAmt);
        $("#dcAmt").data("kendoExtNumericTextBox").value(dcAmt);
        $("#totAmt").data("kendoExtNumericTextBox").value(totalAmt);
        $("#vatAmt").data("kendoExtNumericTextBox").value(vatAmt);

        $("#itemCnt").data("kendoExtNumericTextBox").value(itemCnt);
        $("#itemQty").data("kendoExtNumericTextBox").value(itemQty);
        $("#itemAmt").data("kendoExtNumericTextBox").value(itemAmt);

    }

    function fnAddRow(i){
        $('#grid').data('kendoExtGrid').dataSource.insert(0, {
            "parSaleOrdNo"      :''
           ,"parSaleOrdLineNo"  :''
           ,"itemDstinCd"       :'02'
           ,"itemCd"            :''
           ,"itemNm"            :''
           ,"printItemNm"       :''
           ,"unitCd"            :''
           ,"giStrgeCd"         :''
           ,"giLocCd"           :''
           ,"saleTp"            :$("#saleTp").data("kendoExtDropDownList").value()
           ,"ordQty"            :0
           ,"prcTp"             :$("#saleTp").data("kendoExtDropDownList").value()
           ,"prc"               :0
           ,"dcRate"            :$("#dcRate").data("kendoExtNumericTextBox").value()
           ,"amt"               :0
           ,"dcAmt"             :0
           ,"partCost"          :0
           ,"taxAmt"            :0
           ,"taxDdctAmt"        :0
           ,"avlbStockQty"      :0
           ,"eqipExpcDt"        :''
        });
    }

    function stopEvent(evnt){
        evnt = evnt?evnt:window.event;

        if(evnt.stopPropagation){
            evnt.stopPropagation();
        }else{
            evnt.cancelBubble = true;
        }
    }
</script>
<!-- //script -->


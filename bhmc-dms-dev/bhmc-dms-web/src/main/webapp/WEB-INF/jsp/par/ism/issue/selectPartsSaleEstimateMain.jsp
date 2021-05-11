<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<div id="resizableContainer">
    <section class="group" id="screenSection">
        <div class="header_area">
            <div class="btn_left">
                <dms:access viewId="VIEW-D-11826" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                </dms:access>
            </div>
            <div class="btn_right">
                <dms:access viewId="VIEW-D-11825" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnMovePartsSale" name="btnMovePartsSale" class="btn_m btn_link"><spring:message code="par.menu.partSale" /><!-- 부품판매 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11824" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnPrint" name="btnPrint" class="btn_m"><spring:message code="par.btn.receivePrint" /></button><!--인쇄 -->
                </dms:access>
                <dms:access viewId="VIEW-D-11823" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnSave" name="btnSave" class="btn_m btn_save"><spring:message code="par.btn.salePriceCreate" /><!-- 생성 --></button>
                </dms:access>
            </div>
        </div>

        <div class="table_form form_width_70per" id="searchForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.custTp" /><!-- 고객유형 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="custTp" data-type="combo" class="form_comboBox">
                                </div>
                                <div class="date_right">
                                    <label class="label_check ml5"><input type="checkbox" id="instantCust" class="form_check" data-type="checkbox"/><spring:message code="par.lbl.instantCust" /></label>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.saleType" /><!-- 판매유형 --></span></th>
                        <td class="required_area">
                            <input id="saleTp" name="saleTp" type="text" data-type="combo" required data-name="<spring:message code="par.lbl.saleType" />" class="form_comboBox"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.estimateDocNo" /><!-- 판매견적번호 --></th>
                        <td>
                            <div class="form_search">
                                <input id="estimateDocNo" class="form_input" />
                                <a id="searchEstimateDocNo"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.statNm" /><!-- 상태 --></th>
                        <td>
                            <input id="statCd" type="text" data-type="combo" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.custNm" /><!-- 고객 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="custNm" class="form_input" />
                                <input type="text" id="custNo" class="form_input hidden" />
                                <a id="searchCustNo"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.estimateDt" /><!-- 견적일 --></th>
                        <td class="readonly_area">
                            <input id="estimateDt" type="text" class="form_datepicker" data-type="maskDate" readonly>
                        </td>
                        <th scope="row"><spring:message code="par.title.venderTel" /><!-- 연락처 --></th>
                        <td>
                            <input id=custTelNo type="text" class="form_input">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.prsNm" /><!-- 담당자 --></span></th>
                        <td class="required_area">
                            <div class="form_search">
                                <input type="text" id="salePrsnId" name="salePrsnId" class="form_input hidden" required data-name="<spring:message code="par.lbl.prsNm" />" readonly />
                                <input type="text" id="salePrsnNm" name="salePrsnNm" class="form_input form_readonly" required data-name="<spring:message code="par.lbl.prsNm" />" readonly />
                                <a id="searchSalePrsnId"><!-- 검색 --></a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.carNo" /><!-- 차량번호 --></th>
                        <td>
                            <input id="carRegNo" data-type="text" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.vin" /><!-- VIN --></th>
                        <td>
                            <input id="vinNo" data-type="text" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.dcEstimateRate" /><!-- 견적할인율 --></th>
                        <td>
                            <input id="dcRate" data-type="number" class="form_numeric">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.remark" /><!--비고 --></th>
                        <td>
                            <input id="remark" type="text" value="" class="form_input">
                            <input id="updtDtStr" type="text" class="form_input hidden" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.parSaleCnt" /><!-- 품목수 --></th>
                        <td class="readonly_area">
                            <input id="itemCnt" data-type="number" class="form_numeric" readonly />
                        </td>
                        <th scope="row"><spring:message code='par.lbl.parSaleQty' /></th><!-- 판매수량 -->
                        <td class="readonly_area">
                            <input id="itemQty" data-type="number" class="form_numeric"  readonly />
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
            <dms:access viewId="VIEW-D-11822" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnPackage" name="btnPackage" class="btn_s btn_add btn_s_min5"><spring:message code="par.btn.pakage" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11821" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnAdd" name="btnAdd" class="btn_s btn_add btn_s_min5"><spring:message code="par.btn.add" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11820" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnDelItem" name="btnDelItem" class="btn_s btn_del btn_s_min5"><spring:message code="par.btn.del" /></button>
            </dms:access>
                <button type="button" id="btnAddSVC" name="btnAddSVC" class="btn_s btn_add btn_s_min5 hidden">Item Search For Service</button>
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

    <div class="hidden">
        <!-- 판매고문 -->
        <div class="form_search">
            <input type="hidden" id="saId" />
            <input type="text" id="saNm"  class="form_input form_readonly" readonly />
            <a id="searchSaId"><!-- 검색 --></a>
        </div>
        <!-- 할인전총액 -->
        <input id="dcBefTotAmt" name="dcBefTotAmt" data-type="number" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totAmtBefDc" />"/>
        <!-- 할인가격 -->
        <input id="dcAmt" name="dcAmt" data-type="number" class="form_numeric" readonly data-name="<spring:message code="sal.lbl.dcAmt" />"/>
        <!-- 총액 -->
        <input id="totAmt" name="totAmt" data-type="number" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totAmt" />"/>
        <input id="vatAmt" name="vatAmt" data-type="number" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totAmt" />" />
    </div>

<!-- script -->
<script>
    var toDt = "${toDt}",
        pEstimateDocNo = "${pEstimateDocNo}",
        sessionUsrId = "${usrId}",
        sessionUsrNm = "${usrNm}",
        gVatCd = Number("${vatCd}"),
        gCrud = "C",
        custTpList = [],
        statCdList = [],
        saleTpList = [],
        giStrgeTpList = [],
        saleTpObj = {},
        giStrgeTpObj = {},
        unitCdObj = {},
        prcTpObj = {},
        tempGrid = {},
        itemDstinCdObj = {},
        popItemObj = {},
        locationObj = {},
        locationListObj = {},
        selectShareStockGiItemPopupWindow,
        selectStockGiItemForServicePopupWindow,
        userSearchPopupWin,
        customerSearchPopupWin,
        workPackagePopup,
        popupWindow,
        changeAmtEditor,
        changePrcTp,
        changeUnitCd,
        changeItemDstinCd,
        estimateListPopupWindow;

    locationObj[' '] = "";
    custTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${custTpList}" varStatus="status">
        custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    statCdList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${statCdList}" varStatus="status">
        statCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    saleTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    saleTpObj[' '] = "";
    <c:forEach var="obj" items="${saleTpList}" varStatus="status">
        saleTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        saleTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

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

    if(dms.string.isEmpty(gVatCd)){
        console.log('gVatCd 값 없음!');
       // gVatCd = .16;
        gVatCd = .13;
    }
    console.log('gVatCd:',gVatCd);

    $(document).ready(function() {
        var validator = $("#searchForm").kendoExtValidator().data("kendoExtValidator");

        //고객유형선택
        $("#custTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:custTpList
            ,index:0
        });

        //상태선택
        $("#statCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:statCdList
            ,index:0
        });

        //판매유형
        $("#saleTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:saleTpList
            ,index:0
        });

        //견적일
        $("#estimateDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        //D/C Rate
        $("#dcRate").kendoExtNumericTextBox({
            format:"n0"
            ,spinners:false
        });

        //세금 총계
        $("#vatAmt").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });

        //할인전 총계
        $("#dcBefTotAmt").kendoExtNumericTextBox({
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

        // 연락처
        $("#custTelNo").kendoMaskedTextBox({
            mask:"00000000000"
            ,promptChar:"_"
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

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                pEstimateDocNo = ''; //판매현황 화면에서 넘어온 판매번호 삭제.
                gCrud = "C";
                initPage();
            }
        });

        $("#searchSalePrsnId").on('click', salePrsnSearchPopup);
        $("#searchSaId").on('click', saSearchPopup);
        $("#searchCustNo").on('click', custSearchPopup);
        $("#custTp").on('change', fnChangeCustTp);
        $("#instantCust").on('change', fnChangeIntantCust);
        $("#searchEstimateDocNo").on('click', fnEstimateListPopupWindow);
        $("#estimateDocNo").on('keypress', selectEstimateDocNoKey);

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
                parent._createOrReloadTabMenu("<spring:message code='par.title.estimatePrint' />", "<c:url value='/ReportServer?reportlet=par/selectPartsSaleEstimatePrintMain.cpt'/>&sDlrCd=${dlrCd}&sEstimateDocNo="+$("#estimateDocNo").val());
            }
        });

        $("#btnMovePartsSale").kendoButton({
            click:function(e){
                if(dms.string.isEmpty($("#estimateDocNo").val())){
                    return false;
                }

                parent._createOrReloadTabMenu('<spring:message code="par.menu.partMarPrcSale" />'
                ,"<c:url value='/par/ism/issue/selectPartsSaleOrdMain.do'/>?pEstimateDocNo=" +$("#estimateDocNo").val(), "VIEW-D-10236");
            }
        });

        //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e){
                if(dms.string.isEmpty($("#saleTp").data("kendoExtDropDownList").value())){
                    //판매유형은 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.saleType' var='saleType' /><spring:message code='global.info.required.field' arguments='${saleType}'/>");
                    return false;
                }
                selectItemSalePrcPopupWindow();
            }
        });

        //버튼 - 추가(서비스용)
        $("#btnAddSVC").kendoButton({
            click:function(e) {
                if(dms.string.isEmpty($("#saleTp").data("kendoExtDropDownList").value())){
                    //판매유형은 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.saleType' var='saleType' /><spring:message code='global.info.required.field' arguments='${saleType}'/>");
                    return false;
                }
                selectServiceItemSalePrcPopupWindow();
            }
        });

        // 부품삭제 버튼
        $("#btnDelItem").kendoButton({
            click:function(e){
                var grid = $("#grid").data("kendoExtGrid"),
                    rows = grid.select(),
                    deleteRowLst = [],
                    rowsAll = $("#grid").data("kendoExtGrid").tbody.find("tr");

                rows.each(function(index, row) {
                    var l_rowData = grid.dataItem(row);
                    delete popItemObj[l_rowData.itemCd][l_rowData.giStrgeCd];
                    deleteRowLst.push(row);
                });

                if(deleteRowLst.length){
                    //삭제 팝업 호출.
                    $("#messageId").html("<spring:message code='par.info.delYn' />");//삭제 메시지 적용.
                    conformKendoWindow.content( $(".msgDiv").html());
                    conformKendoWindow.open();
                    $(".yes, .no").click(function(){
                        if($(this).hasClass("yes")){
                            conformKendoWindow.close();

                            /* 패키지 부품 및 부품 삭제 시작. */
                            for(var i = 0, dLen = deleteRowLst.length; i < dLen; i = i + 1){
                                grid.removeRow(deleteRowLst[i]);
                            }

                            fnSetAmtInfo();
                        }
                        conformKendoWindow.close();
                    }).end();
                }
            }
        });

        // 저장 버튼
        $("#btnSave").kendoButton({
            click:function(e){
                var saveList = [],
                    grid= $("#grid").data("kendoExtGrid"),
                    rows = grid.tbody.find("tr"),
                    lCrud = '',
                    paramUrl = '',
                    header;

                fnSetAmtInfo();

                if (!validator.validate()) {
                     return false;
                }

                header = {
                    saleTp:$("#saleTp").data("kendoExtDropDownList").value()
                    ,custTp:$("#custTp").data("kendoExtDropDownList").value()
                    ,custNo:$("#custNo").val()
                    ,custNm:$("#custNm").val()
                    ,custTelNo:$("#custTelNo").data("kendoMaskedTextBox").value()
                    ,salePrsnId:$("#salePrsnId").val()
                    ,saId:$("#saId").val()
                    ,dcRate:$("#dcRate").data("kendoExtNumericTextBox").value()
                    ,dcBefTotAmt:$("#dcBefTotAmt").data("kendoExtNumericTextBox").value()
                    ,dcAmt:$("#dcAmt").data("kendoExtNumericTextBox").value()
                    ,totAmt:$("#totAmt").data("kendoExtNumericTextBox").value()
                    ,vatAmt:$("#vatAmt").data("kendoExtNumericTextBox").value()
                    ,remark:$("#remark").val()
                    ,updtDtStr:$("#updtDtStr").val()
                    ,vinNo:$("#vinNo").val()
                    ,carRegNo:$("#carRegNo").val()
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
                            if(dms.string.isEmpty(gridData.estimateQty) || gridData.estimateQty == 0){
                                // 수량을 입력하십시오
                                dms.notification.warning("<spring:message code='par.lbl.estimateQty' var='estimateQty' /><spring:message code='global.info.confirmMsgParam' arguments='${estimateQty}'/>");
                                saveList = [];
                                return false;
                            }

                            /*
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

                            if(Number(gridData.estimateQty) > Number(gridData.avlbStockQty)){
                                // 가용재고보다 클 수 없음.
                                dms.notification.warning("<spring:message code='par.lbl.avlbStockQty' var='avlbStockQty' /><spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.err.chkGreateParam' arguments='${qty},${avlbStockQty}'/>");
                                saveList = [];
                                return false;
                            }

                            saveList.push(gridData);
                        }
                    });

                    if(saveList.length > 0){
                        var data = {
                            "partsSaleEstimateVO":header
                            ,"partsSaleEstimateItemList":saveList
                        };

                        $.ajax({
                            url:"<c:url value='/par/ism/issue/createPartsSaleEstimate.do' />"
                            ,data:kendo.stringify(data)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:true
                            ,success:function(result){
                                if(result.resultYn == true){
                                    dms.notification.success("<spring:message code='par.lbl.estimateDocNo' var='estimateDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${estimateDocNo}'/>");

                                    pEstimateDocNo = result.estimateDocNo;
                                    $('#estimateDocNo').val(result.estimateDocNo);
                                    $("#statCd").data("kendoExtDropDownList").value(result.statCd);
                                    // 부품판매 조회.
                                    selectPartsSaleEstimate(pEstimateDocNo);
                                }else{
                                    if(result === 0){
                                        dms.notification.error("<spring:message code='par.lbl.estimateDocNo' var='estimateDocNo' /><spring:message code='global.err.regFailedParam' arguments='${estimateDocNo}'/>");
                                    }
                                }
                            }
                            ,beforeSend:function(){
                                dms.loading.show($("#screenSection"));
                            }
                            ,complete:function(){
                                dms.loading.hide($("#screenSection"));
                            }
                            ,error:function(jqXHR,status,error){
                                dms.loading.hide($("#screenSection"));
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

                    header.estimateDocNo = $('#estimateDocNo').val();
                    saveData.partsSaleEstimateVO = header;

                    $.ajax({
                        url:"<c:url value='/par/ism/issue/multiPartsSaleEstimates.do' />"
                        ,data:kendo.stringify(saveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:true
                        ,success:function(result){
                           if(result === true){
                               dms.notification.success("<spring:message code='par.lbl.estimateDocNo' var='estimateDocNo' /><spring:message code='global.info.modifySuccessParam' arguments='${estimateDocNo}'/>");

                               // 부품판매 조회.
                               selectPartsSaleEstimate($("#estimateDocNo").val());
                           }else{
                               if(result === 0){
                                   dms.notification.error("<spring:message code='par.lbl.estimateDocNo' var='estimateDocNo' /><spring:message code='global.err.modifyFailedParam' arguments='${estimateDocNo}'/>");
                               }
                           }
                        }
                        ,beforeSend:function(){
                            dms.loading.show($("#screenSection"));
                        }
                        ,complete:function(){
                            dms.loading.hide($("#screenSection"));
                        }
                        ,error:function(jqXHR,status,error){
                            dms.loading.hide($("#screenSection"));
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                    });
                }
            }
        });

        /**
         * grid 단가&수량
         */
        changeAmtEditor = function(container, options){
            var input = $("<input/>"),
                amt,
                dcAmt,
                pValue;

            input.attr("name", options.field);

            input.change(function(){
                orgRateValue = options.model.dcRate;
                if(orgRateValue == null){
                    orgRateValue = 0;
                }

                if(options.field === 'estimateQty'){
                    pValue = $(this).val();
                    if(options.model.dcRate === 0){
                        options.model.set("amt", options.model.prc * pValue);
                        options.model.set("dcAmt", 0);
                        options.model.set("taxAmt", (options.model.prc * pValue) - ((options.model.prc * pValue)/( 1 + gVatCd )));
                        options.model.set("taxDdctAmt", (options.model.prc * pValue)/( 1 + gVatCd ));

                    }else{
                        amt = (options.model.prc * pValue) - (options.model.prc * pValue * (options.model.dcRate/100));
                        dcAmt = (options.model.prc * pValue * (options.model.dcRate/100));

                        options.model.set("amt", amt);
                        options.model.set("dcAmt", dcAmt);
                        options.model.set("taxAmt", amt - amt/( 1 + gVatCd ));
                        options.model.set("taxDdctAmt", amt/( 1 + gVatCd ));
                    }
                }else if(options.field === 'dcRate'){
                    pValue = $(this).val();
                    if(pValue === 0){
                        options.model.set("amt", options.model.prc * options.model.estimateQty);
                        options.model.set("dcAmt", 0);
                        options.model.set("taxAmt", (options.model.prc * options.model.estimateQty) - ((options.model.prc * options.model.estimateQty)/( 1 + gVatCd )));
                        options.model.set("taxDdctAmt", (options.model.prc * options.model.estimateQty)/( 1 + gVatCd ));
                    }else{
                        if(pValue >= 100){
                            dms.notification.error("<spring:message code='par.lbl.dcEstimateRate' var='dcRate' /><spring:message code='global.err.chkGreateParam' arguments='${dcRate},100'/>");
                            options.model.set('dcRate', Number(orgRateValue));
                        }else{
                            amt = (options.model.prc * options.model.estimateQty) - (options.model.prc * options.model.estimateQty * (pValue/100));
                            dcAmt = (options.model.prc * options.model.estimateQty * (pValue/100));
                            options.model.set("amt", amt);
                            options.model.set("dcAmt", dcAmt);
                            options.model.set("taxAmt", amt - amt/( 1 + gVatCd ));
                            options.model.set("taxDdctAmt", amt/( 1 + gVatCd ));
                        }
                    }
                }else if(options.field === 'prc'){
                    pValue = $(this).val();
                    if(options.model.dcRate === 0){
                        options.model.set("amt", pValue * options.model.estimateQty);
                        options.model.set("dcAmt", 0);
                        options.model.set("taxAmt", (pValue * options.model.estimateQty) - ((pValue * options.model.estimateQty)/( 1 + gVatCd )));
                        options.model.set("taxDdctAmt", (pValue * options.model.estimateQty)/( 1 + gVatCd ));
                    }else{
                        amt = (pValue * options.model.estimateQty) - (pValue * options.model.estimateQty * (options.model.dcRate/100));
                        dcAmt = (pValue * options.model.estimateQty * (options.model.dcRate/100));

                        options.model.set("amt", amt);
                        options.model.set("dcAmt", dcAmt);
                        options.model.set("taxAmt", amt - amt/( 1 + gVatCd ));
                        options.model.set("taxDdctAmt", amt/( 1 + gVatCd ));
                    }
                }

                fnSetAmtInfo();
            });

            input.appendTo(container);
            if(options.field === 'estimateQty'){
                input.kendoExtNumericTextBox({
                    format:"n2"
                    ,decimals:2
                    ,restrictDecimals:true
                    ,min:0
                    ,spinners:false
                });
            }else{
                input.kendoExtNumericTextBox({
                    format:"n2"
                    ,decimals:2
                    ,restrictDecimals:true
                    ,min:0
                    ,spinners:false
                });
            }
        };

        /**
         * grid 출고창고 DropDownList
         */
        giStrgeCdDropDownEditor = function(container, options){
            $('<input data-bind="value:' + options.field + '"  />')
            .appendTo(container)
            .kendoExtDropDownList({
                dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:giStrgeTpList
                ,change:function(e){
                    options.model.set('giLocCd','');
                }
            });
        };

        /**
         * grid 출고Location DropDownList
         */
        giLocCdDropDownEditor = function(container, options){
            var itemCd = options.model.itemCd,
                strgeCd = options.model.giStrgeCd;

            if(!dms.string.isEmpty(locationListObj[itemCd])){
                $('<input data-bind="value:' + options.field + '"  />')
                .appendTo(container)
                .kendoExtDropDownList({
                    dataTextField:"cmmCdNm"
                    ,dataValueField:"cmmCd"
                    ,dataSource:locationListObj[itemCd][strgeCd]
                    ,change:function(e){
                        $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                    }
                });
            }
        };

        /**
         * grid 판매우형 DropDownList
         */
        saleTpDropDownEditor = function(container, options){
            $('<input data-bind="value:' + options.field + '"  />')
            .appendTo(container)
            .kendoExtDropDownList({
                dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:saleTpList
            });
        };

        // 부품판매등록 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0323-131201"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issue/selectPartsSaleEstimateItemByKey.do' />"
                    }
                    ,parameterMap:function(options, operation){
                        if(operation === "read"){
                            var params = {};

                            // 판매현황 검색조건 코드.
                            params["sEstimateDocNo"] = $("#estimateDocNo").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function(result){
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
                        id:"estimateDocNo"
                        ,fields:{
                            estimateDocNo:{type:"string", editable:false}
                            ,estimateDocLineNo:{type:"number", editable:false}
                            ,saleTp:{type:"string"}
                            ,itemDstinCd:{type:"string", editable:false} //품목구분
                            ,itemCd:{type:"string", editable:false}
                            ,itemNm:{type:"string"}
                            ,pkgItemCd:{type:"string", editable:false}
                            ,pkgItemNm:{type:"string"}
                            ,unitCd:{type:"string"}
                            ,estimateQty:{type:"number"}
                            ,prcTp:{type:"string", editable:false}
                            ,giStrgeCd:{type:"string"}
                            ,giLocCd:{type:"string"}
                            ,prc:{type:"number"}
                            ,amt:{type:"number"}
                            ,dcAmt:{type:"number"}
                            ,taxAmt:{type:"number"}
                            ,taxDdctAmt:{type:"number"}
                            ,dcRate:{type:"number", validation:{required:true}}
                            ,stockQty:{type:"number", editable:false}
                            ,avlbStockQty:{type:"number", editable:false}
                            ,resvStockQty:{type:"number", editable:false}
                            ,borrowQty:{type:"number", editable:false}
                            ,rentQty:{type:"number", editable:false}
                            ,eqipExpcDt:{type:"date", editable:false}
                        }
                    }
                }
            }
            ,height:353
            ,selectable:"multiple"
            ,scrollable:true
            ,sortable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true //빈컬럼 적용. default:false
            ,multiSelectWithCheckbox:true
            ,pageable:false
            ,edit:function(e){
                var eles = e.container.find("input"),
                    grid = this,
                    rows = e.sender.select(),
                    selectedItem = e.sender.dataItem(rows[0]),
                    input = e.container.find(".k-input"),
                    itemList = [],
                    pVal,
                    orgVal,
                    dcAmt,
                    dcSaleAmt,
                    fieldName = grid.columns[e.container.index()].field;

                if(fieldName === "amt" ||fieldName === "itemNm"||fieldName === "itemDstinCd"||fieldName === "unitCd"||fieldName === "prcTp"||fieldName === "avlbStockQty"||fieldName === "giLocCd"
                   ||fieldName === "pkgItemCd"||fieldName === "pkgItemNm"||fieldName === "saleQty"||fieldName === "taxAmt"||fieldName === "taxDdctAmt"||fieldName === "dcAmt"||fieldName === "estimateDocNo"||fieldName === "giStrgeCd"){
                    this.closeCell();
                }else if(fieldName === "itemCd"){
                    pVal = input.val();
                    orgVal = input.val();

                    input.keyup(function(){
                        pVal = input.val();
                    });

                    input.blur(function(){
                        if(orgVal !== pVal){
                            if(popItemObj.hasOwnProperty(pVal)){
                                //이미 등록되어있는 부품입니다.
                                var itemInfo = pVal;
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");

                                e.model.set('itemCd', orgVal);

                                return false;
                            }

                            $.ajax({
                                url:"<c:url value='/par/pmm/itemMaster/selectSalePrcItemByKey.do' />"
                                ,data:kendo.stringify({sItemCd:pVal, sPrcTp:$("#saleTp").data("kendoExtDropDownList").value()})
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,async:true
                                ,success:function(result){
                                    if(result.total === 1){
                                        $("#dcRate").closest(".k-numerictextbox").addClass("form_readonly");
                                        $("#dcRate").data("kendoExtNumericTextBox").enable(false);
                                        $("#saleTp").data("kendoExtDropDownList").enable(false);

                                        dcAmt = 0;
                                        dcSaleAmt = 0;

                                        if(dcRate === 0){
                                            dcAmt = result.data[0].salePrcAmt;
                                            dcSaleAmt = 0;
                                            taxAmt = result.data[0].salePrcAmt  - (result.data[0].salePrcAmt/( 1 + gVatCd ));
                                            taxDdctAmt = result.data[0].salePrcAmt/( 1 + gVatCd );
                                        }else{
                                            dcAmt = result.data[0].salePrcAmt - (result.data[0].salePrcAmt * (dcRate/100));
                                            dcSaleAmt = result.data[0].salePrcAmt * (dcRate/100);
                                            taxAmt = dcAmt - dcAmt/( 1 + gVatCd );
                                            taxDdctAmt = dcAmt/( 1 + gVatCd );
                                        }

                                        e.model.set('itemDstinCd', '02');
                                        e.model.set('itemCd', result.data[0].itemCd);
                                        e.model.set('itemNm', result.data[0].itemNm);
                                        e.model.set('unitCd', result.data[0].stockUnitCd);
                                        e.model.set('estimateQty', 1);
                                        e.model.set('prc', dcAmt);
                                        e.model.set('amt', dcAmt);
                                        e.model.set('dcAmt', dcSaleAmt);
                                        e.model.set('taxAmt', taxAmt);
                                        e.model.set('taxDdctAmt', taxDdctAmt);
                                        e.model.set('prcTp', $("#saleTp").data("kendoExtDropDownList").value());
                                        e.model.set('dcRate', $("#dcRate").data("kendoExtNumericTextBox").value());
                                        e.model.set('stockQty', result.data[0].stockQty);
                                        e.model.set('avlbStockQty', result.data[0].avlbStockQty);
                                        e.model.set('resvStockQty', result.data[0].resvStockQty);
                                        e.model.set('borrowQty', result.data[0].borrowQty);
                                        e.model.set('rentQty', result.data[0].rentQty);
                                        e.model.set('giStrgeCd', result.data[0].giStrgeCd);
                                        e.model.set('giLocCd', result.data[0].giLocCd);

                                        delete popItemObj[orgVal];

                                        popItemObj[pVal] = pVal;

                                        fnSetAmtInfo();
                                    }else{
                                        dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                                        e.model.set('itemCd', orgVal);
                                    }
                                }
                                ,beforeSend:function(){
                                    dms.loading.show($("#screenSection"));
                                }
                                ,complete:function(){
                                    dms.loading.hide($("#screenSection"));
                                }
                                ,error:function(jqXHR,status,error){
                                    dms.loading.hide($("#screenSection"));
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                    e.model.set('itemCd', orgVal);
                                }
                            });
                        }
                    });
                }
            }
            ,dataBound:function(e){
                fnSetAmtInfo();
            }
            ,columns:[
                {field:"estimateDocNo", title:"<spring:message code='par.lbl.estimateDocNo' />", width:140}//판매현황번호
                ,{field:"estimateDocLineNo", title:"<spring:message code='par.lbl.lineNm' />", width:30, hidden:true}//Line
                ,{field:"saleTp", title:"<spring:message code='par.lbl.saleType' />", width:80, editor:saleTpDropDownEditor, template:'#= changeSaleTp(saleTp)#'}//판매유형
                ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.itemDstinCd' />", width:80, template:'#= changeItemDstinCd(itemDstinCd)#'}//품목구분
                ,{field:"pkgItemCd", title:"<spring:message code='par.lbl.package' />", width:100, hidden:true}//패키지
                ,{field:"pkgItemNm", title:"<spring:message code='par.lbl.package' />", width:100}//패키지명
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:140}//부품번호
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:200}//부품명
                ,{field:"estimateQty", title:"<spring:message code='par.lbl.estimateQty' />", width:60, attributes:{"class":"ar"}, editor:changeAmtEditor, format:"{0:n2}"}//수량
                ,{field:"unitCd", title:"<spring:message code='par.lbl.unitNm' />", width:80, attributes:{"style":"text-align:center"}, template:'#= changeUnitCd(unitCd)#', hidden:true}//단위
                ,{field:"prcTp", title:"<spring:message code='par.lbl.prcTp' />", width:80, attributes:{"style":"text-align:center"}, template:'#= changePrcTp(prcTp)#', hidden:true}//단가유형
                ,{field:"prc", title:"<spring:message code='par.lbl.salePrice' />", width:120, attributes:{"class":"ar"}, editor:changeAmtEditor, format:"{0:n2}"}//단가
                ,{field:"dcRate", title:"<spring:message code='par.lbl.dcEstimateRate' />", width:60, attributes:{"class":"ar"}, editor:changeAmtEditor, format:"{0:n0}"
                    ,template:function(dataItem){
                        var spanObj = "";
                        spanObj = dataItem.dcRate + "%";
                        return spanObj;
                    }
                }//D/C Rate
                ,{field:"taxDdctAmt", title:"<spring:message code='par.lbl.amtTax' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}"}//금액(세금제외)
                ,{field:"amt", title:"<spring:message code='par.lbl.amt' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}"}//금액
                ,{field:"dcAmt", title:"<spring:message code='par.lbl.cstDcAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}//세액
                ,{field:"taxAmt", title:"<spring:message code='par.lbl.vatAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}", hidden:true}//세액
                ,{field:"stockQty" ,title:"<spring:message code='par.lbl.docStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2, width:80}
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty' />", width:60, attributes:{"class":"ar"}, format:"{0:n2}"}//가용수량
                ,{field:"resvStockQty", title:"<spring:message code='par.lbl.readyQty' />", attributes:{"class":"ar"}, format:"{0:n2}", decimal:2, width:80}//예류수량
                ,{field:"rentQty", title:"<spring:message code='par.lbl.avlbOutQty' />", attributes:{"class":"ar"}, format:"{0:n2}", decimal:2, width:80}//차출수량
                ,{field:"borrowQty", title:"<spring:message code='par.lbl.borrowItemQty' />", attributes:{"class":"ar"}, format:"{0:n2}", decimal:2, width:80}//차입수량
                ,{field:"giStrgeCd", title:"<spring:message code='par.lbl.giStrgeCd' />", width:100, template:'#= changeStrgeCd(giStrgeCd)#', sortable:false}//출고창고
                ,{field:"giLocCd", title:"<spring:message code='par.lbl.locationCd' />", width:140, sortable:false}//로케이션
                ,{field:"eqipExpcDt", title:"<spring:message code='par.lbl.eqipExpcDt' />", width:100, format:"{0:<dms:configValue code='dateFormat' />}", attributes:{"style":"text-align:center"}, hidden:true}//설치예정일
            ]
        });

        // 가격유형
        changePrcTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = prcTpObj[val];
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

        // 판매
        changeSaleTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = saleTpObj[val];
            }
            return returnVal;
        };

        // 부품유형
        changeItemDstinCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = itemDstinCdObj[val];
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
        $("#custNo").val('');
        $("#custNm").val('');
        $("#custTelNo").data("kendoMaskedTextBox").value('');
        fnInstantCustChk(false);
    }

    function fnChangeIntantCust(e){
        fnInstantCustChk($("#instantCust").prop("checked"));
    }

    function fnInstantCustChk(pCheck){
        if(pCheck === true){
            $("#custNo").val('guest');
            $("#custTelNo").data("kendoMaskedTextBox").value('');
            $("#custTp").data("kendoExtDropDownList").value('01');
        }else{
            $("#instantCust").prop("checked",false);
            $("#custTelNo").data("kendoMaskedTextBox").value('');
        }
    }


    //부품 팝업 열기 함수.
    function selectItemSalePrcPopupWindow(){
        selectShareStockGiItemPopupWindow = dms.window.popup({
            windowId:"ItemMasterPopup"
            ,width:900
            ,height:550
            ,title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
            ,content:{
                url:"<c:url value='/par/cmm/selectShareStockGiItemPopup.do'/>"
                ,data:{
                    "type":""
                    ,"autoBind":true
                    ,"prcTp":$("#saleTp").data("kendoExtDropDownList").value()
                    ,"itemDstinCd":'02'
                    ,"itemCd":''
                    ,"selectable":"multiple"
                    ,"callbackFunc":function(data){
                        var dataLen = data.length,
                            gridData = $("#grid").data("kendoExtGrid"),
                            popItemData = {},
                            itemList = [],
                            tDate,
                            dcPrc,
                            amt,
                            dcAmt,
                            taxAmt,
                            taxDdctAmt,
                            dcRate = $("#dcRate").data("kendoExtNumericTextBox").value(),
                            rows;

                        if(dataLen > 0){
                            $("#dcRate").closest(".k-numerictextbox").addClass("form_readonly");
                            $("#dcRate").data("kendoExtNumericTextBox").enable(false);
                            $("#saleTp").data("kendoExtDropDownList").enable(false);
                        }

                        for(var i = 0; i < dataLen; i = i + 1){
                            dcAmt = 0;

                            if(dcRate === 0){
                                amt = Number(data[i].giQty) * Number(data[i].salePrcAmt);
                                dcAmt = 0;
                                taxAmt = (Number(data[i].giQty) * Number(data[i].salePrcAmt)) - ((Number(data[i].giQty) * Number(data[i].salePrcAmt))/( 1 + gVatCd ));
                                taxDdctAmt = (Number(data[i].giQty) * Number(data[i].salePrcAmt))/( 1 + gVatCd );
                            }else{
                                amt = (Number(data[i].giQty) * Number(data[i].salePrcAmt)) - ((Number(data[i].giQty) * Number(data[i].salePrcAmt)) * (dcRate/100));
                                dcAmt = (Number(data[i].giQty) * Number(data[i].salePrcAmt)) * (dcRate/100);
                                taxAmt = amt - amt/( 1 + gVatCd );
                                taxDdctAmt = amt/( 1 + gVatCd );
                            }

                            popItemData.itemDstinCd    = '02';
                            popItemData.itemCd = data[i].itemCd;
                            popItemData.itemNm = data[i].itemNm;
                            popItemData.unitCd = data[i].stockUnitCd;
                            popItemData.estimateQty = data[i].giQty;
                            popItemData.prc = data[i].salePrcAmt;
                            popItemData.amt = amt;
                            popItemData.dcAmt = dcAmt;
                            popItemData.taxAmt = taxAmt;
                            popItemData.taxDdctAmt = taxDdctAmt;
                            popItemData.prcTp = $("#saleTp").data("kendoExtDropDownList").value();
                            popItemData.saleTp = $("#saleTp").data("kendoExtDropDownList").value();
                            popItemData.dcRate = dcRate;
                            popItemData.stockQty = data[i].stockQty;
                            popItemData.avlbStockQty = data[i].avlbStockQty;
                            popItemData.resvStockQty = data[i].resvStockQty;
                            popItemData.borrowQty = data[i].borrowQty;
                            popItemData.rentQty = data[i].rentQty;
                            popItemData.giStrgeCd = data[i].giStrgeCd;
                            popItemData.giLocCd = data[i].giLocCd;

                            if(popItemObj.hasOwnProperty(data[i].itemCd)){
                                if(popItemObj[data[i].itemCd].hasOwnProperty(data[i].giStrgeCd)){
                                    //이미 등록되어있는 부품입니다.
                                    var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']'+ '[' + data[i].giStrgeCd + ']';
                                    dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
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
                        selectShareStockGiItemPopupWindow.close();

                        fnSetAmtInfo();
                    }
                }
            }
        });
    }

    //부품(서비스용) 팝업 열기 함수.
    function selectServiceItemSalePrcPopupWindow(){
        selectStockGiItemForServicePopupWindow = dms.window.popup({
            windowId:"ItemMasterPopup"
            ,width:900
            ,height:550
            ,title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
            ,content:{
                url:"<c:url value='/par/cmm/selectStockGiItemForServicePopup.do'/>"
                ,data:{
                    "type":""
                    ,"autoBind":true
                    ,"prcTp":$("#saleTp").data("kendoExtDropDownList").value()
                    ,"itemDstinCd":'02'
                    ,"itemCd":''
                    ,"selectable":"multiple"
                    ,"callbackFunc":function(data){
                        var dataLen = data.length,
                            gridData = $("#grid").data("kendoExtGrid"),
                            popItemData = {},
                            itemList = [],
                            tDate,
                            dcPrc,
                            amt,
                            dcAmt,
                            taxAmt,
                            taxDdctAmt,
                            dcRate = $("#dcRate").data("kendoExtNumericTextBox").value(),
                            rows;

                        if(dataLen > 0){
                            $("#dcRate").closest(".k-numerictextbox").addClass("form_readonly");
                            $("#dcRate").data("kendoExtNumericTextBox").enable(false);
                            $("#saleTp").data("kendoExtDropDownList").enable(false);
                        }

                        selectStockGiItemForServicePopupWindow.close();
                    }
                }
            }
        });
    }

    function initPage(){
        //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        $("#grid").data("kendoExtGrid").dataSource.data([]);

        $("#statCd").data("kendoExtDropDownList").enable(false);
        $("#dcBefTotAmt").closest(".k-numerictextbox").addClass("form_readonly");
        $("#dcBefTotAmt").data("kendoExtNumericTextBox").enable(false);
        $("#dcAmt").closest(".k-numerictextbox").addClass("form_readonly");
        $("#dcAmt").data("kendoExtNumericTextBox").enable(false);
        $("#totAmt").closest(".k-numerictextbox").addClass("form_readonly");
        $("#totAmt").data("kendoExtNumericTextBox").enable(false);

        $("#dcRate").closest(".k-numerictextbox").removeClass("form_readonly");
        $("#dcRate").data("kendoExtNumericTextBox").enable(true);
        $("#saleTp").data("kendoExtDropDownList").enable(true);
        $("#saleTp").data("kendoExtDropDownList").value('01');

        $("#salePrsnId").val(sessionUsrId);
        $("#salePrsnNm").val(sessionUsrNm);

        $("#dcRate").data("kendoExtNumericTextBox").value(0);
        locationObj = {};
        popItemObj = {};

        btnView(); //초기화 시 버튼 구성

        //판매현황 관리에서 넘어온 경우
        if(!dms.string.isEmpty(pEstimateDocNo)){
            selectPartsSaleEstimate(pEstimateDocNo);
        }
    }

    function saSearchPopup(){
        userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
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

    function salePrsnSearchPopup(){
        userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                ,data:{
                    "autoBind":false
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

    function custSearchPopup(){
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

    function selectVenderMasterPopupWindow(){
        customerSearchPopupWin = dms.window.popup({
            windowId:"customerSearchPopupWin"
            ,title:"<spring:message code = 'par.title.venderCstSelect'/>"
            ,width:800
            ,height:400
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectCustomerMasterPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":true
                    ,"bpNm":$("#custNm").val()
                    ,"callbackFunc":function(data){
                        $("#custNo").val(data[0].bpCd);
                        $("#custNm").val(data[0].bpNm);

                        customerSearchPopupWin.close();
                    }
                }
            }
        });
    }

    function selectCustSearchPopupWindow(){
        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            ,title:"<spring:message code='par.title.custSearch' />"   // 고객 조회
            ,content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                ,data:{
                    "autoBind":true
                    ,"custNm":$("#custNm").val()
                    ,"closeYn":"N"
                    ,"type":null
                    ,"callbackFunc":function(data){
                        if(data.length >= 1) {
                            $("#custNo").val(data[0].custNo);
                            $("#custNm").val(data[0].custNm);
                            $("#custTelNo").data("kendoMaskedTextBox").value(data[0].hpNo);
                            $("#vinNo").val(data.vinNo);
                            $("#carRegNo").val(data.carRegNo);

                            popupWindow.close();
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
                            dcPrc,
                            amt,
                            dcAmt,
                            taxAmt,
                            taxDdctAmt,
                            dcRate = $("#dcRate").data("kendoExtNumericTextBox").value(),
                            itemAmt,
                            itemQty,
                            rows;

                        if(parData.length > 0) {
                            $.each(parData, function(idx, data){

                                dcAmt = 0;
                                //패키지 할인율
                                dcRate = data.pkgDetlDcRate;
                                //패키지 부품금액 : 패키지 부품가격
                                itemAmt = data.itemPrc;
                                //수량
                                itemQty = data.itemQty;

                                amt = (itemAmt * itemQty) - ((itemAmt * itemQty) * (dcRate/100));
                                dcAmt = (itemAmt * itemQty) * (dcRate/100);
                                taxAmt = amt - ((amt)/ ( 1 + gVatCd ));
                                taxDdctAmt = (amt)/ ( 1 + gVatCd );

                                //패키지 코드 : 02
                                popItemData.itemDstinCd = '02';
                                popItemData.itemCd = data.itemCd;
                                popItemData.itemNm = data.itemNm;
                                popItemData.unitCd = data.itemUnitCd;
                                popItemData.estimateQty = data.itemQty;
                                popItemData.prc = data.itemPrc;
                                popItemData.amt = data.pkgDetlDcTotAmt;
                                popItemData.dcAmt = data.pkgDetlDcAmt;
                                popItemData.taxAmt = data.pkgDetlDcTotAmt - ((data.pkgDetlDcTotAmt)/( 1 + gVatCd ));
                                popItemData.taxDdctAmt = data.pkgDetlDcTotAmt/( 1 + gVatCd );
                                popItemData.prcTp = $("#saleTp").data("kendoExtDropDownList").value();
                                popItemData.saleTp = $("#saleTp").data("kendoExtDropDownList").value();
                                popItemData.dcRate = data.pkgDetlDcRate;
                                popItemData.stockQty = data.strgeStockQty;
                                popItemData.avlbStockQty = data.avlbStockQty;
                                popItemData.resvStockQty = data.resvStockQty;
                                popItemData.borrowQty = data.borrowQty;
                                popItemData.rentQty = data.rentQty;
                                popItemData.pkgItemCd = data.pkgItemCd;
                                popItemData.pkgItemNm = data.pkgItemNm;
                                popItemData.giStrgeCd = data.giStrgeCd;
                                popItemData.giLocCd = data.giLocCd;

                                if(popItemObj.hasOwnProperty(data.itemCd)){
                                    if(popItemObj[data.itemCd].hasOwnProperty(data.giStrgeCd)){
                                        //이미 등록되어있는 부품입니다.
                                        var itemInfo = data.itemCd + '[' + data.itemNm + ']'+ '[' + data.giStrgeCd + ']';
                                        dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
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

    function fnSetLocCdObj(pItemList){
        var header = {
            sItemCdLst:pItemList
        };

        $.ajax({
            url:"<c:url value='/par/pmm/binlocation/selectBinLocationMasterByItemCd.do' />"
            ,data:kendo.stringify(header)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,async:false
            ,success:function(result){
                if(result.total > 0){
                    for(var i = 0, dataLen = result.data.length; i < dataLen; i = i + 1 ){
                        if(locationListObj.hasOwnProperty(result.data[i].itemCd)){
                            if(locationListObj.hasOwnProperty(result.data[i].strgeCd)){
                                locationListObj[result.data[i].itemCd][result.data[i].strgeCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                            }else{
                                locationListObj[result.data[i].itemCd][result.data[i].strgeCd] = [];
                                locationListObj[result.data[i].itemCd][result.data[i].strgeCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                            }
                        }else{
                            locationListObj[result.data[i].itemCd] = {};
                            locationListObj[result.data[i].itemCd][result.data[i].strgeCd] = [];
                            locationListObj[result.data[i].itemCd][result.data[i].strgeCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                        }
                        if(!locationObj.hasOwnProperty(result.data[i].strgeCd)){
                            locationObj[result.data[i].strgeCd] = {};
                            locationObj[result.data[i].strgeCd][result.data[i].locCd] = result.data[i].locCd;
                        }else{
                            if(!locationObj[result.data[i].strgeCd].hasOwnProperty(result.data[i].locCd)){
                                locationObj[result.data[i].strgeCd][result.data[i].locCd] = result.data[i].locCd;
                            }
                        }
                    }
                }
            }
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                return false;
            }
        });
    }

    function fnSetAmtInfo(){
        var grid = $("#grid").data("kendoExtGrid"),
            rows = grid.tbody.find("tr"),
            totalAmt = 0,
            dcBefAmt = 0,
            dcAmt = 0,
            vatAmt = 0,
            itemCnt = 0,
            itemQty = 0,
            itemAmt = 0,
            gridData;

        rows.each(function(index, row){
            gridData = grid.dataSource.at(index);

            if(gridData.dcRate === 0){
                dcBefAmt = dcBefAmt + gridData.amt;
                totalAmt = totalAmt + gridData.amt;
                dcAmt = 0;
            }else{
                dcBefAmt = dcBefAmt + (gridData.prc * gridData.estimateQty);
                totalAmt = totalAmt + gridData.amt;
                dcAmt    = dcAmt + gridData.dcAmt;
            }
            itemCnt = itemCnt + 1;
            itemQty = Number(itemQty) + Number(gridData.estimateQty);
            vatAmt = vatAmt + gridData.taxAmt;
        });
        $("#dcBefTotAmt").data("kendoExtNumericTextBox").value(dcBefAmt);
        $("#dcAmt").data("kendoExtNumericTextBox").value(dcAmt);
        $("#totAmt").data("kendoExtNumericTextBox").value(totalAmt);
        $("#vatAmt").data("kendoExtNumericTextBox").value(vatAmt);
        $("#itemCnt").data("kendoExtNumericTextBox").value(itemCnt);
        $("#itemQty").data("kendoExtNumericTextBox").value(itemQty);
        $("#itemAmt").data("kendoExtNumericTextBox").value(totalAmt);
    }

    // 견적리스트 팝업 열기 함수.
    function fnEstimateListPopupWindow(){
        estimateListPopupWindow = dms.window.popup({
            windowId:"estimateListPopup"
            ,title:"<spring:message code='par.menu.partSaleEstimate' />"   // 견적정보
            ,width:800
            ,height:380
            ,content:{
                url:"<c:url value='/par/cmm/selectEstimateListPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"custNo":$("#custNo").val()
                    ,"custNm":$("#custNm").val()
                    ,"custTp":$("#custTp").data("kendoExtDropDownList").value()
                    ,"estimateDocNo":$("#estimateDocNo").val()
                    ,"selectable":"single"
                    ,"callbackFunc":function(data){
                        if(data.length === 1)
                        {
                            selectPartsSaleEstimate(data[0].estimateDocNo);
                        }
                        estimateListPopupWindow.close();
                    }
                }
            }
        });
    }

    // 부품판매 정보 조회.
    function selectPartsSaleEstimate(pEstimateDocNo){
        $.ajax({
            url:"<c:url value='/par/ism/issue/selectPartsSaleEstimateByKey.do' />",
            data:JSON.stringify({ sEstimateDocNo:pEstimateDocNo}),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
        }).done(function(result){

                var statCd;
                partsJs.validate.groupObjAllDataSet(result);

                statCd = $("#statCd").data("kendoExtDropDownList").value();

                if(result.custNo === 'guest'){
                    $('#instantCust').prop("checked",true);
                }else{
                    $('#instantCust').prop("checked",false);
                }

                $("#grid").data("kendoExtGrid").dataSource.read();

                gCrud = "U";
                btnView(statCd);
        });
    }

    // 견적번호로 견적건 조회 함수.
    function selectEstimateDocNoKey(e){
        if(e.keyCode === 13){
            $.ajax({
                url:"<c:url value='/par/ism/issue/selectPartsSaleEstimateByKey.do' />",
                data:JSON.stringify({ sEstimateDocNo:$("#estimateDocNo").val()}),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error) {
                    fnEstimateListPopupWindow();
                }
            }).done(function(result) {
                    var statCd;

                    partsJs.validate.groupObjAllDataSet(result);

                    statCd = $("#statCd").data("kendoExtDropDownList").value();

                    $("#grid").data("kendoExtGrid").dataSource.read();
                    $("#grid").data("kendoExtGrid").dataSource._destroyed = [];

                    gCrud = "U";
                    btnView(statCd);
            });
        }
    }

    function btnView(pStat){
        if(dms.string.isEmpty(pStat)){ //신규 등록 시
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnPrint").data("kendoButton").enable(false);
            $("#custTp").data("kendoExtDropDownList").enable(true);
            $("#saleTp").data("kendoExtDropDownList").enable(true);

            $("#btnPackage").data("kendoButton").enable(true);
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDelItem").data("kendoButton").enable(true);
            $("#btnMovePartsSale").data("kendoButton").enable(false);
        }else if(pStat === "01"){ //등록 상태 인경우
            $("#btnPrint").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(true);
            $("#custTp").data("kendoExtDropDownList").enable(false);
            $("#saleTp").data("kendoExtDropDownList").enable(false);

            $("#btnPackage").data("kendoButton").enable(true);
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDelItem").data("kendoButton").enable(true);
            $("#btnMovePartsSale").data("kendoButton").enable(true);
        }else if(pStat === "02"){ //확정 상태 인경우
            $("#btnPrint").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(false);
            $("#custTp").data("kendoExtDropDownList").enable(false);
            $("#saleTp").data("kendoExtDropDownList").enable(false);

            $("#btnAdd").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);
            $("#btnPackage").data("kendoButton").enable(false);
            $("#btnMovePartsSale").data("kendoButton").enable(true);
        }else{ //그 외(취소)
            $("#btnPrint").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnSend").data("kendoButton").enable(false);
            $("#custTp").data("kendoExtDropDownList").enable(false);
            $("#saleTp").data("kendoExtDropDownList").enable(false);

            $("#btnPackage").data("kendoButton").enable(false);
            $("#btnAdd").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);
            $("#btnMovePartsSale").data("kendoButton").enable(false);
        }
    }

    function fnAddRow(i){
        $('#grid').data('kendoExtGrid').dataSource.insert(0, {
            "estimateDocNo":''
            ,"estimateDocLineNo":''
            ,"itemDstinCd":'02'
            ,"itemCd":''
            ,"itemNm":''
            ,"unitCd":''
            ,"giStrgeCd":''
            ,"giLocCd":''
            ,"saleTp":$("#saleTp").data("kendoExtDropDownList").value()
            ,"estimateQty":0
            ,"prcTp":$("#saleTp").data("kendoExtDropDownList").value()
            ,"prc":0
            ,"dcRate":$("#dcRate").data("kendoExtNumericTextBox").value()
            ,"amt":0
            ,"avlbStockQty":0
            ,"eqipExpcDt":''
        });
    }
</script>
<!-- //script -->
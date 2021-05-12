<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 기타출고정보 -->
    <section class="group" id='screenSection'>
        <div class="header_area">
            <div class="btn_left">
    			<dms:access viewId="VIEW-D-11916" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnInit" name="btnInit" class="btn_m btn_reset btn_m_min"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
    			</dms:access>
            </div>
            <div class="btn_right">
                <dms:access viewId="VIEW-D-11915" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnSave" name="btnSave" class="btn_m"><spring:message code="par.btn.lossGiSave" /><!-- 손실출고저장 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11914" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnConf" name="btnConf" class="btn_m hidden"><spring:message code="par.lbl.confirm" /><!-- 확정 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11913" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnCancel" name="btnCancel" class="btn_m btn_cancel hidden"><spring:message code="par.btn.cancel" /><!--취소  --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11912" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnPrint" name="btnPrint" class="btn_m btn_print"><spring:message code="par.btn.print" /> <!-- 인쇄 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11911" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnSearch" name="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
                </dms:access>
            </div>
        </div>
        <!-- 탭메뉴 전체 영역 -->
        <div id="tabstrip" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li id="CQ" class="k-state-active"><spring:message code="par.title.stockOutOverageReal" /><!-- 실사손익출고 --></li>
                <li id="RD"><spring:message code="par.title.stockOutOverage" /><!-- 손익출고 --></li>
            </ul>

            <div>
                <div class="table_form form_width_70per" id="searchForm" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:17%;">
                            <col style="width:8%;">
                            <col style="width:19%;">
                            <col style="width:8%;">
                            <col style="width:16%;">
                            <col style="width:8%;">
                            <col style="width:16%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.stockDdDoc" /><!-- 재고실사문서 --></th>
                                <td>
                                    <div class="form_search">
                                        <input type="text" id="sStockDdDocNo" class="form_input" readonly />
                                        <a id="searchStockDdDocNo"><!-- 검색 --></a>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="par.lbl.investigationConfDt" /><!-- 실사확인일자 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input type="text" id="sRegDtFr" class="form_datepicker" data-type="maskDate"/>
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input type="text" id="sRegDtTo" class="form_datepicker" data-type="maskDate"/>
                                        </div>
                                    </div>
                                    <input type="hidden" id="tabTp" value="01">
                                </td>
                                <th scope="row"><spring:message code="par.lbl.investigationPrsId" /><!-- 실사담당자 --></th>
                                <td>
                                    <input type="text" id="sPrsnNm"  class="form_input">
                                </td>
                                <th scope="row"><spring:message code="par.lbl.stockLockYn" /><!-- 재고통제여부 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="sStockLockYn" readonly class="form_comboBox" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="hgrid" class="grid"></div>
                </div>

                <div class="table_form form_width_70per mt10" id="selectForm" >
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
                                <th scope="row"><spring:message code="par.lbl.stockDdDoc" /><!-- 재고실사문서 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="stockDdDocNo"  class="form_input" readonly>
                                </td>
                                <th scope="row"><spring:message code="par.lbl.stockPlusTp" /><!-- 손익유형 --></th>
                                <td class="readonly_area">
                                    <input id="ddGrGiType"  class="form_input" readonly>
                                </td>
                                <th scope="row"><spring:message code="par.lbl.stockPlusDt" /><!-- 손익일자 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="ddGiDt"  class="form_datepicker" readonly />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.stockPlusCheckMan" /><!-- 손익확인자 --></th>
                                <td class="readonly_area">
                                    <input type="text" id="ddGiRegUsrId"  class="form_input" readonly>
                                    <input id="updtDtStr" type="text" class="form_input hidden" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="dgrid" class="grid"></div>
                </div>

            </div>
            <div>
                <div class="table_form form_width_70per" id="etcForm">
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
                                <th scope="row"><spring:message code="par.lbl.giDocNo" /><!-- 출고문서번호 --></th>
                                <td>
                                    <div class="form_search">
                                        <input type="text" id="etcGiDocNo" class="form_input form_readonly" readonly>
                                        <a id="searchEtcGiDocNo"><!-- 검색 --></a>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="par.lbl.totalQty" /><!-- 수량총계 --></th>
                                <td>
                                    <input id="totQty" name="totAmt" data-type="number" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totalQty" />"/>
                                </td>
                                <th scope="row"><spring:message code="par.lbl.totAmt" /><!-- 금액총계 --></th>
                                <td>
                                    <input id="totAmt" name="totAmt" data-type="number" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totAmt" />"/>
                                    <input id="bpCd" class="form_input form_required form_readonly hidden" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="par.lbl.remark" /><!--비고 --></span></th>
                                <td colspan="7">
                                    <input id="remark" type="text" value="" class="form_input">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- 그리드 기능 버튼 시작 -->
                <div class="header_area">
                    <div class="btn_right">
					<dms:access viewId="VIEW-D-11910" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_s btn_add btn_s_min5"  id="btnAdd"><spring:message           code="par.btn.add" /></button>
					</dms:access>
					<dms:access viewId="VIEW-D-11909" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_s btn_del btn_s_min5"  id="btnDelItem"><spring:message       code="par.btn.del" /></button>
					</dms:access>
                    </div>
                </div>
                <!-- 그리드 기능 버튼 종료 -->

                <div class="table_grid">
                    <!-- 부품기타출고 그리드 -->
                    <div id="grid" class="grid"></div>
                </div>
          </div>
    </section>
    <!-- //부품기타출고 -->
<!-- script -->
<script>
    var toDt = "${toDt}",
        sevenDtBf = "${sevenDtBf}",
        pEtcGiDocNo = "${pEtcGiDocNo}",
        mvtTpChkObj = {},
        mvtTpList = [],
        docStatList = [],
        docStatObj = {},
        strgeTpObj = {},
        strgeTpList = [],
        unitCdObj = {},
        strgeTpObj = {},
        strgeTpList = [],
        dtTpList = [],
        locationListObj = {},
        locationObj = {},
        giReasonCdObj = {},
        giReasonCdList = [],
        popItemObj = {},
        mvtTp = "43",
        selectedTabId,
        selectShareStockGiItemPopupWindow,
        issueEtcListPopupWindow,
        changeAmtEditor,
        changeUnitCd,
        changeItemDstinCd,
        searchItemPopupWindow,
        userSearchPopupWin,
        investigationListPopupWindow;

        mvtTpChkObj["43"] = '';
        mvtTpChkObj["45"] = '';
        locationObj[' '] = "";

    <c:forEach var="obj" items="${mvtTpList}" varStatus="status">
        if(mvtTpChkObj.hasOwnProperty("${obj.cmmCd}")){
            mvtTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        }
    </c:forEach>

    unitCdObj[' '] = "";
    <c:forEach var="obj" items="${unitCdList}" varStatus="status">
        unitCdObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
    </c:forEach>

    strgeTpObj[' '] = "";
    strgeTpList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${storageList}" varStatus="status">
        strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
        strgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
    </c:forEach>

    giReasonCdObj[' '] = "";
    <c:forEach var="obj" items="${giReasonCdList}" varStatus="status">
        giReasonCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        giReasonCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    docStatList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
    docStatObj[' '] = "";
    <c:forEach var="obj" items="${docStatList}" varStatus="status">
        docStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        docStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    $(document).ready(function() {
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e){
                selectedTabId = e.item.id;

                if(selectedTabId == "CQ"){
                    $("#tabTp").val("01");
                    mvtTp = "43";
                    $("#btnCancel").hide();
                }else{
                    $("#tabTp").val("02");
                    mvtTp = "45";
                    $("#btnCancel").show();
                }
            }
        });

        //조회조건-등록일 From
        $("#sRegDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
         });

        //조회조건-등록일 To
        $("#sRegDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
         });

        //실사 등록일
        $("#ddGiDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        //조회조건-상태
        $("#sStockLockYn").kendoExtDropDownList({
            dataSource:""
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
        });

        //총계
        $("#totAmt").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });

        //총수량
        $("#totQty").kendoExtNumericTextBox({
            format:"n0"
            ,spinners:false
        });

        $("#searchStockDdDocNo").on('click', selectInvestigationListPopupWindow);
        $("#searchPiMngUsrId").on('click', userSearchPopup);
        $("#searchEtcGiDocNo").on('click', selectIssueEtcListPopupWindow);

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                pEtcGiDocNo = ''; //기타출고현황 화면에서 넘어온 기타출고번호 삭제.
                initPage();
            }
        });

        //조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#hgrid").data("kendoExtGrid").dataSource.read();
            }
        });

        //인쇄
        $("#btnPrint").kendoButton({
            enable:true
            ,click:function(e){
                if(selectedTabId == "CQ" || dms.string.isEmpty(selectedTabId)){
                    if($("#stockDdDocNo").val() === null || $("#stockDdDocNo").val() === ''){
                        dms.notification.warning("<spring:message code='par.lbl.stockDdDoc' var='stockDdDocNoMsg' /><spring:message code='global.info.check.field' arguments='${stockDdDocNoMsg}' />");
                    }else{
                        parent._createOrReloadTabMenu("<spring:message code='par.menu.stockOutShortageReal'/>", "<c:url value='/ReportServer?reportlet=par/selectIssueEtcStockAdjustMain.cpt'/>&sDlrCd=${dlrCd}&sStockDdDocNo="+$("#stockDdDocNo").val()+"&sRegUsrNm=${regUsrNm}","VIEW-D-13211", true);
                    }
                }else if(selectedTabId == "RD"){
                    if($("#etcGiDocNo").val() === null || $("#etcGiDocNo").val() === ''){
                        dms.notification.warning("<spring:message code='par.lbl.giDocNo' var='etcGiDocNoMsg' /><spring:message code='global.info.check.field' arguments='${etcGiDocNoMsg}' />");
                    }else{
                        parent._createOrReloadTabMenu("<spring:message code='par.title.stockOutOverage'/>", "<c:url value='/ReportServer?reportlet=par/selectIssueEtcMain.cpt'/>&sDlrCd=${dlrCd}&sEtcGiDocNo="+$("#etcGiDocNo").val()+"&sRegUsrNm=${regUsrNm}","VIEW-D-13211", true);//새로운 화면 ID : 13220
                    }
                }
            }
        });

        //기타출고현황
        $("#btnLinkEtcIssueList").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready'/>");
            }
        });

        //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {
                selectItemSalePrcPopupWindow();
            }
        });

        // 부품삭제 버튼
        $("#btnDelItem").kendoButton({
            click:function(e){
                var grid = $("#grid").data("kendoExtGrid"),
                    rows = grid.select();

                rows.each(function(index, row){
                    var l_rowData = grid.dataItem(row);
                    delete popItemObj[l_rowData.itemCd][l_rowData.strgeCd];
                });

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
                fnSetAmtInfo();
            }
        });

        //취소
        $("#btnCancel").kendoButton({
            click:function(e){
                var saveList = [],
                    grid = $("#grid").data("kendoExtGrid"),
                    rows = grid.tbody.find("tr"),
                    mvtTp,
                    header;

                if($("#tabTp").val() === '01'){
                    mvtTp = "43";
                }else{
                    mvtTp = "45";
                }

                header = {
                    etcGiDocNo:$("#etcGiDocNo").val()
                    ,bpCd:$("#bpCd").val()
                    ,mvtTp:mvtTp
                    ,updtDtStr:$("#updtDtStr").val()
                };

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);
                    delete gridData["giDt"];
                    saveList.push(gridData);
                });

                if(saveList.length > 0){
                    var data = {
                        "issueEtcVO":header
                        ,"issueEtcItemList":saveList
                    };

                    $.ajax({
                        url:"<c:url value='/par/ism/issue/cancelIssueEtc.do' />"
                        ,data:kendo.stringify(data)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:true
                        ,success:function(result){
                            if(result === true){
                                dms.notification.success("<spring:message code='par.lbl.etcGiDocNo' var='etcGiDocNo' /><spring:message code='global.info.delSuccessParam' arguments='${etcGiDocNo}'/>");

                                $("#btnCancel").data("kendoButton").enable(false);
                                $("#btnSave").data("kendoButton").enable(false);
                                $("#btnAdd").data("kendoButton").enable(false);
                                $("#btnDelItem").data("kendoButton").enable(false);

                                // 부품기타출고 조회.
                                selectEtcIssue($('#etcGiDocNo').val());
                            }else{
                                if(result === 0){
                                    dms.notification.error("<spring:message code='par.lbl.etcGiDocNo' var='etcGiDocNo' /><spring:message code='global.err.delFailedParam' arguments='${etcGiDocNo}'/>");
                                }
                            }
                        }
                        ,beforeSend:function(){
                            dms.loading.show($("#screenSection"));
                        }
                        ,complete:function(){
                            dms.loading.hide($("#screenSection"));
                        }
                        ,error:function(jqXHR,status,error) {
                            dms.loading.hide($("#screenSection"));
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                    });
                }
            }
        });

        // 저장 버튼
        $("#btnSave").kendoButton({
            click:function(e){
                var saveList = [],
                    grid,
                    rows,
                    lCrud,
                    paramUrl,
                    chkCalcAmt,
                    header;

                //실사손실출고
                if($("#tabTp").val() === '01'){
                    grid = $("#dgrid").data("kendoExtGrid");
                    rows = grid.tbody.find("tr");

                    header = {
                        mvtTp:"43"//실사출고
                        ,remark:""
                        ,updtDtStr:$("#updtDtStr").val()
                        ,refDocNo:$("#stockDdDocNo").val()
                    };
                }else{
                    grid = $("#grid").data("kendoExtGrid");
                    rows = grid.tbody.find("tr");

                    if(dms.string.isEmpty($("#remark").val())){
                        dms.notification.warning("<spring:message code='par.lbl.remark' var='remark' /><spring:message code='global.info.required.field' arguments='${remark}'/>");
                        return false;
                    }

                    header = {
                        mvtTp:"45"//손실출고
                        ,remark:$("#remark").val()
                        ,updtDtStr:$("#updtDtStr").val()
                    };
                }

                if(rows.length  < 1 ){
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

                rows.each(function(index, row){
                    var gridData = grid.dataSource.at(index);

                    if(!dms.string.isEmpty(gridData.itemCd)){
                        if(mvtTp !== '43'){
                            if(dms.string.isEmpty(gridData.prc) || gridData.prc == 0){
                                // 단가를 입력하십시오. (2018.04.03 실사손실출고 일때만 단가 0(=이평가0)인것도 출고 가능하도록 수정.)
                                dms.notification.warning("<spring:message code='par.lbl.prc' var='prc' /><spring:message code='global.info.confirmMsgParam' arguments='${prc}'/>");
                                saveList = [];
                                return false;
                            }

                            chkCalcAmt = Math.round(Number(gridData.prc) * Number(gridData.qty) * 100)/100;

                            if(Math.abs(Number(chkCalcAmt) - Number(gridData.amt)) > 0.5 ){
                             // 금액을 확인해주세요.
                                dms.notification.warning("<spring:message code='par.lbl.amt' var='amt' /><spring:message code='global.info.confirmMsgParam' arguments='${amt}'/>");
                                saveList = [];
                                return false;
                            }
                        }

                        if(dms.string.isEmpty(gridData.itemCd)){
                            // 부품을 선택하십시오
                            dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCd}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty(gridData.qty) || gridData.qty == 0){
                            // 수량을 입력하십시오.
                            dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.chkSelectItemMsg' arguments='${qty}'/>");
                            saveList = [];
                            return false;
                        }
                        saveList.push(gridData);
                    }
                });

                if(saveList.length > 0){
                    var data = {
                        "issueEtcVO":header
                        ,"issueEtcItemList":saveList
                    };

                    $.ajax({
                        url:"<c:url value='/par/ism/issue/createIssueEtc.do' />"
                        ,data:kendo.stringify(data)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:true
                        ,success:function(result) {
                            if (result.resultYn == true){
                                dms.notification.success("<spring:message code='par.lbl.stockOutShortage' var='stockOutShortage' /><spring:message code='global.info.cnfmSuccessParam' arguments='${stockOutShortage}'/>");
                                if($("#tabTp").val()=='01'){
                                    $('#ddGrGiType').val('盘亏');//실사
                                    $('#ddGiDt').data("kendoExtMaskedDatePicker").value(toDt);
                                    $('#ddGiRegUsrId').val(result.regUsrID);
                                }else{
                                    $('#ddGrGiType').val('');
                                    $('#ddGiDt').data("kendoExtMaskedDatePicker").value('');
                                    $('#ddGiRegUsrId').val('');
                                    pEtcGiDocNo = result.etcGiDocNo;
                                    $('#etcGiDocNo').val(result.etcGiDocNo);
                                    // 부품기타출고 조회.
                                    selectEtcIssue(pEtcGiDocNo);
                                }

                                $("#btnCancel").data("kendoButton").enable(true);
                                $("#btnAdd").data("kendoButton").enable(false);
                                $("#btnDelItem").data("kendoButton").enable(false);
                                $("#btnSave").data("kendoButton").enable(false);
                            }else{
                                if(result === 0){
                                    dms.notification.error("<spring:message code='par.lbl.etcGiDocNo' var='etcGiDocNo' /><spring:message code='global.err.regFailedParam' arguments='${etcGiDocNo}'/>");
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
                pValue;

            input.attr("name", options.field);

            input.keyup(function(){
                pValue = Number($(this).val());

                if(options.field === 'prc'){
                    options.model.set("amt", Math.round(Number(pValue) * Number(options.model.qty) * 100)/100);
                    options.model.set("taxAmt", (Math.round(Number(pValue) * Number(options.model.qty) * 100)/100) *  0);
                    options.model.set("taxDdctAmt", (Math.round(Number(pValue) * Number(options.model.qty) * 100)/100) - ((Math.round(Number(pValue) * Number(options.model.qty) * 100)/100) *  0));
                    options.model.set("taxDdctPrc", (pValue) - (options.model.prc *  0));
                    options.model.set("dcRate", 0);
                }else if(options.field === 'qty'){
                    options.model.set("amt", Math.round(Number(options.model.prc) * Number(pValue) * 100)/100);
                    options.model.set("taxAmt", (Math.round(Number(options.model.prc) * Number(pValue) * 100)/100) *  0);
                    options.model.set("taxDdctAmt", (Math.round(Number(options.model.prc) * Number(pValue) * 100)/100) - ((Math.round(Number(options.model.prc) * Number(pValue) * 100)/100) *  0));
                    options.model.set("taxDdctPrc", (options.model.prc) - (pValue *  0));
                    options.model.set("dcRate", 0);
                }
            });

            input.blur(function(){
                fnSetAmtInfo();
            });

            input.appendTo(container);
            input.kendoExtNumericTextBox({
                format:"n2"
                ,decimals:2
                ,restrictDecimals:true
                ,min:0
                ,spinners:false
            });
        };

        /**
         * grid 출고창고 DropDownList
         */
        giStrgeCdDropDownEditor = function(container, options){
            $('<input data-bind="value:' + options.field + '"  />')
            .appendTo(container)
            .kendoExtDropDownList({
                dataTextField: "cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:  strgeTpList
                ,change:function(e){
                    options.model.set('locCd','');
                    $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                }
            });
        };

        giLocCdDropDownEditor = function(container, options){
            var itemCd = options.model.itemCd,
                strgeCd = options.model.strgeCd;

            if(!dms.string.isEmpty(locationListObj[itemCd])){
                $('<input data-bind="value:' + options.field + '"  />')
                .appendTo(container)
                .kendoExtDropDownList({
                    dataTextField: "cmmCdNm"
                    ,dataValueField:"cmmCd"
                    ,dataSource:locationListObj[itemCd][strgeCd]
                    ,change:function(e){
                        $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                    }
                });
            }
        };

        //실사문서 그리드 세팅
        $("#hgrid").kendoExtGrid({
            gridId:"G-PAR-0808-161502"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/investigation/selectInvestigationListGrid.do' />"
                    }
                    ,parameterMap:function(options, operation){
                        if(operation === "read"){
                            var params = {};

                            params["sort"]               = options.sort;
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;

                            params["sPrsnNm"]              = $("#sPrsnNm").val();
                            params["sStockDdDocNo"]        = $("#sStockDdDocNo").val();
                            params["sRegDtFr"]             = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sRegDtTo"]             = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sDocStatCd"]           = "END";
                            params["sDdGi"]                = "Y";

                            return kendo.stringify(params);

                        }
                    }
                }
                ,schema:{
                    data:function(result){
                        return result.data;
                    }
                    ,model:{
                        id:"InvestigationList"
                        ,fields:{
                            rnum:{type:"string"} //No
                            ,move:{type:"string"} //바로가기
                            ,dlrcd:{type:"string"} //딜러코드
                            ,docStatCd:{type:"string"} //문서상태코드
                            ,stockDdDocNo:{type:"string"} //재고실사문서번호
                            ,regDt:{type:"date"} //등록일
                            ,approveReqDt:{type:"date"} //승인요청일자
                            ,endDt:{type:"date"} //완료일자
                            ,prsnId:{type:"string"} //담당자
                            ,stockLockYn:{type:"string"} //재고통제여부
                            ,remark:{type:"string"} //비고
                            ,signOpnCont:{type:"string"} //결재의견
                            ,updtDtStr:{type:"string"}
                        }
                    }
                }
            }
            ,height:173
            ,selectable:"row"
            ,scrollable:true
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,editable:false
            ,change:function(e){
                var selectedVal = this.dataItem(this.select());

                //재고실사문서 정보 SEARCHING DATA SETTING
                $("#stockDdDocNo").val(selectedVal.stockDdDocNo); //재고실사문서
                $("#updtDtStr").val(selectedVal.updtDtStr);
                //재고실사문서 정보 조회
                $("#dgrid").data("kendoExtGrid").dataSource.read();
                $("#btnSave").data("kendoButton").enable(true);
            }
            ,columns:[
                {field:"rnum" ,title:"<spring:message code='par.lbl.line' />" ,attributes:{"class":"ac"} ,sortable:false ,width:50}
                ,{field:"dlrCd" ,title:"<spring:message code='par.lbl.dlrCd' />" ,attributes:{"class":"ac"} ,hidden:true ,width:100}
                ,{field:"stockDdDocNo" ,title:"<spring:message code='par.lbl.stockDdDoc' />" ,attributes:{"class":"ac"} ,width:120}//재고실사문서
                ,{field:"regDt" ,title:"<spring:message code='par.lbl.investigationConfDt' />" ,attributes:{"class":"ac"} ,format:"{0:<dms:configValue code='dateFormat' />}" ,width:100}//등록일
                ,{field:"prsnId" ,title:"<spring:message code='par.lbl.investigationPrsId' />" ,attributes:{"class":"ac"} ,width:100,hidden:true}//담당자
                ,{field:"prsnNm" ,title:"<spring:message code='par.lbl.investigationPrsId' />" ,attributes:{"class":"al"} ,width:100}//담당자
                ,{field:"stockLockYn" ,title:"<spring:message code='par.lbl.stockLockYn' />" ,attributes:{"class":"ac"} ,width:100}//재고통제여부
                ,{field:"stockQty" ,title:"<spring:message code='par.lbl.realStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//재고수량(장부수량)
                ,{field:"stockPrice" ,title:"<spring:message code='par.lbl.stockPrice' />" ,width:100 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimals:2}//금액
                ,{field:"docStatCd" ,title:"<spring:message code='par.lbl.statNm' />" ,attributes:{"class":"ac"} ,width:120 ,template:'#= changeDocStatCd(docStatCd)#'}//상태
                ,{field:"updtDtStr" ,title:" " ,width:100 ,attributes:{ "style":"text-align:right"} ,hidden:true}//수정일시
            ]
        });

        // 부품기타출고등록 그리드
        $("#dgrid").kendoExtGrid({
            gridId:"G-PAR-0519-173304"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/investigation/selectInvestigationForIssueByKey.do' />"
                    }
                    ,parameterMap:function(options, operation){
                        if(operation === "read"){
                            var params = {};

                            // 재고실사대상 검색조건 코드.
                            params["sStockDdDocNo"] = $("#stockDdDocNo").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function (result){
                        if(result.total === 0){
                            return false;
                        }
                        var dataLen  = result.data.length,
                            itemList = [];

                        popItemObj = {};

                        for(var i = 0; i < dataLen; i = i + 1){
                            if(popItemObj.hasOwnProperty(result.data[i].itemCd)){
                                popItemObj[result.data[i].itemCd][result.data[i].strgeCd] = result.data[i].itemNm;
                            }else{
                                popItemObj[result.data[i].itemCd] = {};
                                popItemObj[result.data[i].itemCd][result.data[i].strgeCd] = result.data[i].itemNm;
                            }
                        }
                        return result.data;
                    }
                    ,total:"total"
                    ,model:{
                        id:"etcGiDocNo"
                        ,fields:{
                            etcGiDocNo:{type:"string", editable:false}
                            ,etcGiDocLineNo:{type:"number", editable:false}
                            ,refDocNo:{type:"string", editable:false}
                            ,refDocLineNo:{type:"number", editable:false}
                            ,itemCd:{type:"string"}
                            ,itemNm:{type:"string"}
                            ,unitCd:{type:"string"}
                            ,qty:{type:"number"}
                            ,strgeCd:{type:"string"}
                            ,locCd:{type:"string"}
                            ,movingAvgPrc:{type:"number"}
                            ,prc:{type:"number"}
                            ,amt:{type:"number"}
                            ,taxAmt:{type:"number"}
                            ,regUsrId:{type:"string", editable:false}
                            ,giDt:{type:"date", editable:false}
                            ,giTime:{type:"string", editable:false}
                            ,cancQty:{type:"number", editable:false}
                            ,cancDt:{type:"date", editable:false}
                            ,cancTime:{type:"string", editable:false}
                            ,cancId:{type:"string", editable:false}
                            ,dcRate:{type:"number"}
                            ,taxDdctPrc:{type:"number"}
                            ,taxDdctAmt:{type:"number"}
                            ,giReasonCd:{type:"string"}
                            ,avlbStockQty:{type:"number"}
                            ,stockQty:{type:"number"}
                            ,resvStockQty:{type:"number"}
                            ,rentQty:{type:"number"}
                            ,borrowQty:{type:"number"}
                        }
                    }
                }
            }
            ,selectable :"multiple"
            ,height:242
            ,scrollable :true
            ,sortable   :false
            ,autoBind   :false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,multiSelectWithCheckbox:false
            ,pageable:false
            ,edit:function(e){
                var eles = e.container.find("input"),
                    grid = this,
                    rows = e.sender.select(),
                    selectedItem = e.sender.dataItem(rows[0]),
                    input = e.container.find(".k-input"),
                    mvtTp = mvtTp,
                    itemList = [],
                    fieldName = grid.columns[e.container.index()].field,
                    pVal,
                    orgVal;

                if(fieldName === "amt"||fieldName === "itemNm"||fieldName === "prc"||fieldName === "locCd"||fieldName === "movingAvgPrc"||fieldName === "avlbStockQty"||fieldName === "unitCd"
                        ||fieldName === "stockQty"||fieldName === "resvStockQty"||fieldName === "rentQty"||fieldName === "borrowQty"){
                    this.closeCell();
                }else if(fieldName === "qty"||fieldName === "strgeCd"){
                    if(mvtTp !== '45'){
                        this.closeCell();
                    }
                }else if(fieldName === "itemCd"){
                    if(mvtTp !== '45'){
                        this.closeCell();
                    }
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
                                ,data:kendo.stringify({sItemCd:pVal, sPrcTp:'01'})
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,async:false
                                ,success:function(result){
                                    if(result.total === 1){
                                        e.model.set('itemCd', result.data[0].itemCd);
                                        e.model.set('itemNm', result.data[0].itemNm);
                                        e.model.set('unitCd', result.data[0].stockUnitCd);
                                        e.model.set('qty', 1);
                                        e.model.set('prc', result.data[0].movingAvgPrc);
                                        e.model.set('amt', result.data[0].movingAvgPrc);
                                        e.model.set('avlbStockQty', result.data[0].avlbStockQty);
                                        e.model.set('strgeCd', '');
                                        e.model.set('movingAvgPrc', result.data[0].movingAvgPrc);
                                        e.model.set('dcRate', 0);
                                        e.model.set('taxAmt', result.data[0].movingAvgPrc * 0);
                                        e.model.set('taxDdctPrc', result.data[0].movingAvgPrc - (result.data[0].movingAvgPrc * 0));
                                        e.model.set('taxDdctAmt', result.data[0].movingAvgPrc - (result.data[0].movingAvgPrc * 0));
                                        e.model.set('stockQty', result.data[0].stockQty);
                                        e.model.set('avlbStockQty', result.data[0].avlbStockQty);
                                        e.model.set('resvStockQty', result.data[0].resvStockQty);
                                        e.model.set('borrowQty', result.data[0].borrowQty);
                                        e.model.set('rentQty', result.data[0].rentQty);

                                        delete popItemObj[orgVal];

                                        popItemObj[pVal] = pVal;
                                    }else{
                                        dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                                        e.model.set('itemCd', orgVal);
                                    }
                                }
                                ,error:function(jqXHR,status,error){
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                    e.model.set('itemCd', orgVal);
                                }
                            });
                        }
                    });
                }
            }
            ,columns:[
                {field:"etcGiDocNo", title:"<spring:message code='par.lbl.giDocNo' />", width:120, hidden:true}//기타출고현황번호
                ,{field:"etcGiDocLineNo", title:"<spring:message code='par.lbl.lineNm' />", width:60, hidden:true}//Line
                ,{field:"refDocNo", title:"<spring:message code='par.lbl.etcGrDocNo' />", width:120, hidden:true}//참조문서
                ,{field:"refDocLineNo", title:"<spring:message code='par.lbl.lineNm' />", width:60, hidden:true}//Line
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:100}//부품번호
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:180}//부품명
                ,{field:"strgeCd", title:"<spring:message code='par.lbl.strgeCd' />", width:120, editor:giStrgeCdDropDownEditor, template:'#= changeStrgeCd(strgeCd)#', sortable:false}//출고창고
                ,{field:"locCd", title:"<spring:message code='par.lbl.locationCd' />", width:140, sortable:false}//로케이션
                ,{field:"unitCd", title:"<spring:message code='par.lbl.unitNm' />", width:80, attributes:{"style":"text-align:center"}, template:'#= changeUnitCd(unitCd)#'}//단위
                ,{field:"qty", title:"<spring:message code='par.lbl.lossGiQty' />", width:100, attributes:{"class":"ar"}, editor:changeAmtEditor, format:"{0:n2}", decimal:2}//수량
                ,{field:"movingAvgPrc", title:"<spring:message code='par.lbl.stockCost' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}", decimals:2}//단가
                ,{field:"amt", title:"<spring:message code='par.lbl.movingAvgCost' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}", decimals:2}//금액
                ,{field:"prc", title:"<spring:message code='par.lbl.stockOutPrice' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}", decimals:2}//배상단가
                ,{field:"amt", title:"<spring:message code='par.lbl.stockOutAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}", decimals:2}//배상금액
                ,{field:"stockQty", title:"<spring:message code='par.lbl.docStockQty' />", attributes:{"class":"ar"}, format:"{0:n2}" ,width:80}
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty' />", attributes:{"class":"ar"}, format:"{0:n2}", width:70}//가용재고
                ,{field:"resvStockQty", title:"<spring:message code='par.lbl.readyQty' />", attributes:{"class":"ar"}, format:"{0:n2}", width:80}//예류수량
                ,{field:"rentQty", title:"<spring:message code='par.lbl.avlbOutQty' />", attributes:{"class":"ar"}, format:"{0:n2}", width:80}//차출수량
                ,{field:"borrowQty", title:"<spring:message code='par.lbl.borrowItemQty' />", attributes:{"class":"ar"} ,format:"{0:n2}", width:80}//차입수량
                ,{field:"movingAvgPrc", title:"<spring:message code='par.lbl.movingAvgPrc' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}", decimals:2, hidden:true}//이동평균단가
                ,{field:"taxAmt", title:"<spring:message code='par.lbl.vatAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}", hidden:true}//세액
                ,{field:"giReasonCd", title:"<spring:message code='par.lbl.giReasonCd' />", width:100, sortable:false, hidden:true}//출고사유
                ,{field:"giDt", title:"<spring:message code='global.lbl.giDt' />", width:160, format:"{0:<dms:configValue code='dateFormat' />}", attributes:{"style":"text-align:center"}, hidden:true}//출고일
                ,{field:"giTime", title:"<spring:message code='par.lbl.receiveTime' />", width:80, attributes:{"style":"text-align:center"}, hidden:true}//출고시간
                ,{field:"regUsrId", title:"<spring:message code='ser.lbl.outUser' />", width:80, hidden:true}//출고인
                ,{field:"cancQty", title:"<spring:message code='par.lbl.cancQty' />", width:60, attributes:{"class":"ar"}, format:"{0:n2}", decimal:2, hidden:true}//취소수량
                ,{field:"cancDt", title:"<spring:message code='par.lbl.cancDt' />", width:140, format:"{0:<dms:configValue code='dateFormat' />}", attributes:{"style":"text-align:center"}, hidden:true}//취소일
                ,{field:"cancTime", title:"<spring:message code='par.lbl.cancTime' />", attributes:{"style":"text-align:center"}, width:80, hidden:true}//취소시간
                ,{field:"cancId", title:"<spring:message code='par.lbl.cancer' />", width:80, hidden:true}//반품인
                ,{field:"dcRate", title:"<spring:message code='par.lbl.dcRate' />", width:60, attributes:{"class":"ar"}, format:"{0:n2}", hidden:true}//D/C Rate
                ,{field:"taxDdctPrc", title:"<spring:message code='par.lbl.taxDdctPrc' />", width:80, attributes:{ "class":"ar"}, format:"{0:n2}", hidden:true}//출고단가(세금미포함)
                ,{field:"taxDdctAmt", title:"<spring:message code='par.lbl.amtTax' />", width:80, attributes:{ "class":"ar"}, format:"{0:n2}", hidden:true}//출고금액(세금미포함)
            ]
        });

        // 부품기타출고등록 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0519-173305"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/investigation/selectInvestigationForIssueByKey.do' />"
                    }
                    ,parameterMap:function(options, operation){
                        if(operation === "read"){
                            var params = {};

                            //재고실사대상 검색조건 코드.
                            params["sStockDdDocNo"] = $("#sStockDdDocNo").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function(result){
                        if(result.total === 0){
                            dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                            return false;
                        }
                        var dataLen  = result.data.length,
                            itemList = [];

                        popItemObj = {};

                        for(var i = 0; i < dataLen; i = i + 1){
                            if(popItemObj.hasOwnProperty(result.data[i].itemCd)){
                                popItemObj[result.data[i].itemCd][result.data[i].strgeCd] = result.data[i].itemNm;
                            }else{
                                popItemObj[result.data[i].itemCd] = {};
                                popItemObj[result.data[i].itemCd][result.data[i].strgeCd] = result.data[i].itemNm;
                            }
                        }

                        return result.data;
                    }
                    ,total:"total"
                    ,model:{
                        id:"etcGiDocNo"
                        ,fields:{
                            etcGiDocNo:{type:"string", editable:false}
                            ,etcGiDocLineNo:{type:"number", editable:false}
                            ,refDocNo:{type:"string", editable:false}
                            ,refDocLineNo:{type:"number", editable:false}
                            ,itemCd:{type:"string",editable:false}
                            ,itemNm:{type:"string"}
                            ,unitCd:{type:"string"}
                            ,qty:{type:"number" }
                            ,strgeCd:{type:"string"}
                            ,locCd:{type:"string"}
                            ,prc:{type:"number"}
                            ,amt:{type:"number"}
                            ,taxAmt:{type:"number"}
                            ,regUsrId:{type:"string", editable:false}
                            ,regUsrNm:{type:"string", editable:false}
                            ,giDt:{type:"date", editable:false}
                            ,giTime:{type:"string", editable:false}
                            ,cancQty:{type:"number", editable:false}
                            ,cancDt:{type:"date", editable:false}
                            ,cancTime:{type:"string", editable:false}
                            ,cancId:{type:"string", editable:false}
                            ,dcRate:{type:"number"}
                            ,taxDdctPrc:{type:"number"}
                            ,taxDdctAmt:{type:"number"}
                            ,giReasonCd:{type:"string"}
                            ,avlbStockQty:{type:"number"}
                            ,stockQty:{type:"number"}
                            ,resvStockQty:{type:"number"}
                            ,rentQty:{type:"number"}
                            ,borrowQty:{type:"number"}
                        }
                    }
                }
            }
            ,selectable:"multiple"
            ,scrollable:true
            ,sortable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,multiSelectWithCheckbox:false
            ,pageable:false
            ,height:449
            ,edit:function(e){
                var eles = e.container.find("input"),
                    grid = this,
                    rows = e.sender.select(),
                    selectedItem = e.sender.dataItem(rows[0]),
                    input = e.container.find(".k-input"),
                    mvtTp = mvtTp,
                    itemList = [],
                    fieldName = grid.columns[e.container.index()].field,
                    pVal,
                    orgVal;

                if(fieldName === "amt"||fieldName === "itemNm"||fieldName === "locCd"||fieldName === "strgeCd"||fieldName === "movingAvgPrc"||fieldName === "avlbStockQty"||fieldName === "unitCd"
                        ||fieldName === "stockQty"||fieldName === "resvStockQty"||fieldName === "rentQty"||fieldName === "borrowQty"||fieldName === "itemCd"){
                    this.closeCell();
                }else if(fieldName === "qty"||fieldName === "prc"){
                    if(!dms.string.isEmpty(selectedItem.etcGiDocNo)){
                        this.closeCell();
                    }
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
                                ,data:kendo.stringify({sItemCd:pVal, sPrcTp:'01'})
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,async:false
                                ,success:function(result){
                                    if(result.total === 1){
                                        e.model.set('itemCd', result.data[0].itemCd);
                                        e.model.set('itemNm', result.data[0].itemNm);
                                        e.model.set('unitCd', result.data[0].stockUnitCd);
                                        e.model.set('qty', 1);
                                        e.model.set('prc', result.data[0].movingAvgPrc);
                                        e.model.set('amt', result.data[0].movingAvgPrc);
                                        e.model.set('avlbStockQty', result.data[0].avlbStockQty);
                                        e.model.set('strgeCd', '');
                                        e.model.set('movingAvgPrc', result.data[0].movingAvgPrc);
                                        e.model.set('dcRate', 0);
                                        e.model.set('taxAmt', result.data[0].movingAvgPrc * 0);
                                        e.model.set('taxDdctPrc', result.data[0].movingAvgPrc - (result.data[0].movingAvgPrc * 0));
                                        e.model.set('taxDdctAmt', result.data[0].movingAvgPrc - (result.data[0].movingAvgPrc * 0));
                                        e.model.set('stockQty', result.data[0].stockQty);
                                        e.model.set('avlbStockQty', result.data[0].avlbStockQty);
                                        e.model.set('resvStockQty', result.data[0].resvStockQty);
                                        e.model.set('borrowQty', result.data[0].borrowQty);
                                        e.model.set('rentQty', result.data[0].rentQty);

                                        delete popItemObj[orgVal];

                                        popItemObj[pVal] = pVal;

                                    }else{
                                        dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                                        e.model.set('itemCd', orgVal);
                                    }
                                }
                                ,error:function(jqXHR,status,error){
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                    e.model.set('itemCd', orgVal);
                                }
                            });
                        }
                    });
                }else if(fieldName === "giReasonCd"){
                    input.blur(function(){
                        pVal = input.val();
                        pValLength = input.val().length;
                        if(pValLength > 200){
                            //사유가 200글자 넘으면 200글자만 잘라서 들어가고 경고메세지 띄움
                            //텍스트 {0} 글자 이상 작성할 수 없습니다.
                            dms.notification.warning("<spring:message code='crm.info.mgsLimitInfo' arguments='200'/>");
                            e.model.set('giReasonCd', pVal.substr(0,200));

                            return false;
                        }
                    });
                }
            }
            ,columns:[
                {field:"etcGiDocNo", title:"<spring:message code='par.lbl.giDocNo' />", width:120}//기타출고현황번호
                ,{field:"etcGiDocLineNo", title:"<spring:message code='par.lbl.lineNm' />", width:60, hidden:true}//Line
                ,{field:"refDocNo", title:"<spring:message code='par.lbl.etcGrDocNo' />", width:120, hidden:true}//참조문서
                ,{field:"refDocLineNo", title:"<spring:message code='par.lbl.lineNm' />", width:60, hidden:true}//Line
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:100}//부품번호
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:180}//부품명
                ,{field:"qty", title:"<spring:message code='par.lbl.qty' />", width:60, attributes:{"class":"ar"}, editor:changeAmtEditor, format:"{0:n2}", decimals:2}//수량
                ,{field:"prc", title:"<spring:message code='par.lbl.prc' />", width:80, attributes:{"class":"ar"}, editor:changeAmtEditor, format:"{0:n2}", decimals:2}//단가
                ,{field:"unitCd", title:"<spring:message code='par.lbl.unitNm' />", width:80, attributes:{"style":"text-align:center"}, template:'#= changeUnitCd(unitCd)#', hidden:true}//단위
                ,{field:"strgeCd", title:"<spring:message code='par.lbl.giStrgeCd' />", width:120, editor:giStrgeCdDropDownEditor, template:'#= changeStrgeCd(strgeCd)#', sortable:false}//출고창고
                ,{field:"locCd", title:"<spring:message code='par.lbl.locationCd' />", width:140, sortable:false}//로케이션
                ,{field:"amt", title:"<spring:message code='global.lbl.amt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}", decimals:2}//금액
                ,{field:"stockQty", title:"<spring:message code='par.lbl.docStockQty' />", attributes:{"class":"ar"}, format:"{0:n2}", width:80}
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty' />", attributes:{"class":"ar"}, format:"{0:n2}", width:70 }                //가용재고
                ,{field:"resvStockQty", title:"<spring:message code='par.lbl.readyQty' />", attributes:{"class":"ar"}, format:"{0:n2}", width:80}//예류수량
                ,{field:"rentQty", title:"<spring:message code='par.lbl.avlbOutQty' />", attributes:{"class":"ar"}, format:"{0:n2}", width:80}//차출수량
                ,{field:"borrowQty", title:"<spring:message code='par.lbl.borrowItemQty' />", attributes:{"class":"ar"}, format:"{0:n2}", width:80}//차입수량
                ,{field:"movingAvgPrc", title:"<spring:message code='par.lbl.movingAvgPrc' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}", decimals:2, hidden:true}//이동평균단가
                ,{field:"taxAmt", title:"<spring:message code='par.lbl.vatAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}", hidden:true}//세액
                ,{field:"giReasonCd", title:"<spring:message code='par.lbl.giReasonCd' />", width:100, sortable:false}//출고사유
                ,{field:"giDt", title:"<spring:message code='global.lbl.giDt' />", width:160, attributes:{"style":"text-align:center"}, format:"{0:<dms:configValue code='dateFormat' />}"}//출고일
                ,{field:"giTime", title:"<spring:message code='par.lbl.receiveTime' />", attributes:{"style":"text-align:center"}, hidden:true, width:80}//출고시간
                ,{field:"regUsrId", title:"<spring:message code='ser.lbl.outUser' />", width:80, hidden:true}//출고인
                ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.outUser' />", width:80}//출고인
                ,{field:"cancQty", title:"<spring:message code='par.lbl.cancQty' />", width:60, attributes:{"class":"ar"}, format:"{0:n2}", decimal:2}//취소수량
                ,{field:"cancDt", title:"<spring:message code='par.lbl.cancDt' />", width:140, format:"{0:<dms:configValue code='dateFormat' />}", attributes:{"style":"text-align:center"}}//취소일
                ,{field:"cancTime", title:"<spring:message code='par.lbl.cancTime' />", attributes:{ "style":"text-align:center"}, width:80, hidden:true}//취소시간
                ,{field:"cancId", title:"<spring:message code='par.lbl.cancer' />", width:80}//반품인
                ,{field:"dcRate", title:"<spring:message code='par.lbl.dcRate' />", width:60, attributes:{"class":"ar"}, format:"{0:n2}", hidden:true}//D/C Rate
                ,{field:"taxDdctPrc", title:"<spring:message code='par.lbl.taxDdctPrc' />", width:80, attributes:{ "class":"ar"}, format:"{0:n2}", hidden:true}//출고단가(세금미포함)
                ,{field:"taxDdctAmt", title:"<spring:message code='par.lbl.amtTax' />", width:80, attributes:{ "class":"ar"}, format:"{0:n2}", hidden:true}//출고금액(세금미포함)
            ]
        });

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
                returnVal = strgeTpObj[val];
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

        //문서 상태 그리드 콤보
        changeDocStatCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = docStatObj[val];
            }
            return returnVal;
        };

        //ABC CLASS 그리드 콤보
        changeAbcInd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = abcIndObj[val];
            }
            return returnVal;
        };

        //품목 상태 그리드 콤보
        changeItemStatCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = itemStatObj[val];
            }
            return returnVal;
        };

        // 재고통제여부 그리드 콤보
        changeStockLockYn = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = stockLockYnObj[val];
            }
            return returnVal;
        };
        initPage();
    });

    // 부품기타출고 정보 조회.
    function selectEtcIssue(pEtcGiDocNo){
        $.ajax({
            url:"<c:url value='/par/ism/issue/selectIssueEtcByKey.do' />",
            data:JSON.stringify({ sEtcGiDocNo:pEtcGiDocNo}),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
        }).done(function(result){
            partsJs.validate.groupObjAllDataSet(result);

            $.ajax({
                url:"<c:url value='/par/ism/issue/selectIssueEtcItemByKey.do' />",
                data:JSON.stringify({ sEtcGiDocNo:pEtcGiDocNo}),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
            }).done(function(result){
                var datalen = result.data.length;

                $("#grid").data("kendoExtGrid").dataSource.data([]);
                $("#grid").data("kendoExtGrid").dataSource.data(result.data);
                $("#hgrid").data("kendoExtGrid").dataSource.read();
                $("#dgrid").data("kendoExtGrid").dataSource.read();

                fnSetAmtInfo();
            });
        });
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
                    ,"prcTp":'01'
                    ,"itemDstinCd":'02'
                    ,"itemCd":''
                    ,"selectable":"multiple"
                    ,"callbackFunc":function(data){
                        var dataLen = data.length,
                            gridData = $("#grid").data("kendoExtGrid"),
                            popItemData = {},
                            itemList = [],
                            giStrgeCd,
                            tDate,
                            rows;

                        for(var i = 0; i < dataLen; i = i + 1){
                            if(dms.string.isEmpty(data[i].giStrgeCd)){
                                giStrgeCd = ' ';
                            }else{
                                giStrgeCd = data[i].giStrgeCd;
                            }
                            popItemData.prc = data[i].movingAvgPrc;
                            popItemData.amt = Number(data[i].giQty) * Number(data[i].movingAvgPrc);
                            popItemData.itemCd = data[i].itemCd;
                            popItemData.itemNm = data[i].itemNm;
                            popItemData.unitCd = data[i].stockUnitCd;
                            popItemData.qty = data[i].giQty;
                            popItemData.strgeCd = giStrgeCd;
                            popItemData.locCd = '';
                            popItemData.movingAvgPrc = data[i].movingAvgPrc;
                            popItemData.dcRate = 0;
                            popItemData.taxDdctPrc = data[i].movingAvgPrc - (data[i].movingAvgPrc * 0);
                            popItemData.taxAmt = (Number(data[i].giQty) * Number(data[i].movingAvgPrc)) * 0;
                            popItemData.taxDdctAmt = Number(data[i].giQty) * Number(data[i].movingAvgPrc) - ((Number(data[i].giQty) * Number(data[i].movingAvgPrc)) * 0);
                            popItemData.giReasonCd = '';
                            popItemData.etcGiDocNo = '';
                            popItemData.etcGiDocLineNo = null;
                            popItemData.avlbStockQty = data[i].avlbStockQty;
                            popItemData.locCd = data[i].giLocCd;
                            popItemData.stockQty = data[i].stockQty;
                            popItemData.avlbStockQty = data[i].avlbStockQty;
                            popItemData.resvStockQty = data[i].resvStockQty;
                            popItemData.borrowQty = data[i].borrowQty;
                            popItemData.rentQty = data[i].rentQty;

                            if(popItemObj.hasOwnProperty(data[i].itemCd)){
                                if(popItemObj[data[i].itemCd].hasOwnProperty(data[i].giStrgeCd)){
                                    //이미 등록되어있는 부품입니다.
                                    var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']'+ '[' + strgeTpObj[data[i].giStrgeCd] + ']';
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

    function initPage(){
        var grid = $("#grid").data("kendoExtGrid"),
            minDate = new Date(sevenDtBf),
            maxDate = new Date(toDt),
            toYY,
            toMM,
            toDD,
            frYY,
            frMM,
            frDD;

        //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if(!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])){
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        if(!partsJs.validate.getAllPluginObjInfo($("#selectForm")[0])){
            return false;
        }

        partsJs.validate.groupObjAllDataInit();

        if(!partsJs.validate.getAllPluginObjInfo($("#etcForm")[0])){
            return false;
        }

        partsJs.validate.groupObjAllDataInit();

        $("#hgrid").data("kendoExtGrid").dataSource.data([]);
        $("#dgrid").data("kendoExtGrid").dataSource.data([]);
        $("#grid").data("kendoExtGrid").dataSource.data([]);

        $("#btnSave").data("kendoButton").enable(true);
        $("#btnAdd").data("kendoButton").enable(true);
        $("#btnDelItem").data("kendoButton").enable(true);
        $("#btnCancel").data("kendoButton").enable(false);

        var tabStrip = $("#tabstrip").getKendoExtTabStrip();
        if(selectedTabId == "CQ" || dms.string.isEmpty(selectedTabId)){
            $("#tabTp").val("01");
            $("#btnCancel").hide();
        }else{
            $("#tabTp").val("02");
            $("#btnCancel").show();
        }

        frYY = minDate.getFullYear();
        frMM = minDate.getMonth();
        frDD = minDate.getDate();

        toYY = maxDate.getFullYear();
        toMM = maxDate.getMonth();
        toDD = maxDate.getDate();

        $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
        $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

        $("#totQty").closest(".k-numerictextbox").addClass("form_readonly");
        $("#totQty").data("kendoExtNumericTextBox").enable(false);
        $("#totAmt").closest(".k-numerictextbox").addClass("form_readonly");
        $("#totAmt").data("kendoExtNumericTextBox").enable(false);

        popItemObj = {};
    }

    function fnSetAmtInfo(){
        var grid = $("#grid").data("kendoExtGrid"),
            rows = grid.tbody.find("tr"),
            totalAmt = 0,
            totalQty = 0,
            gridData;

        rows.each(function(index, row){
            gridData = grid.dataSource.at(index);
            totalAmt = totalAmt + (gridData.prc * gridData.qty);
            totalQty = totalQty + gridData.qty;
        });
        $("#totQty").data("kendoExtNumericTextBox").value(totalQty);
        $("#totAmt").data("kendoExtNumericTextBox").value(totalAmt);
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

    // 손실 및 실사출고리스트 팝업 열기 함수.
    function selectIssueEtcListPopupWindow(){
        issueEtcListPopupWindow = dms.window.popup({
            windowId:"issueEtcStockAdjustListPopup"
            ,title:"<spring:message code='par.title.etcIssueInfo' />"   // 기타출고정보
            ,width:840
            ,height:400
            ,content:{
                url:"<c:url value='/par/cmm/selectIssueEtcListPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"mvtTp":mvtTp
                    ,"statCd":"02"
                    ,"bpCd":$("#bpCd").val()
                    ,"bpCdNm":$("#bpNm").val()
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#btnCancel").data("kendoButton").enable(true);
                            $("#btnAdd").data("kendoButton").enable(false);
                            $("#btnDelItem").data("kendoButton").enable(false);
                            $("#btnSave").data("kendoButton").enable(false);
                            $("#etcGiDocNo").val(data[0].etcGiDocNo);
                            pEtcGiDocNo = data[0].etcGiDocNo;
                            selectEtcIssue(pEtcGiDocNo);
                        }
                        issueEtcListPopupWindow.close();
                    }
                }
            }
        });
    }

    // 재고실사리스트 팝업 열기 함수.
    function selectInvestigationListPopupWindow(){
        investigationListPopupWindow = dms.window.popup({
            windowId:"investigationListPopup"
            ,title:"<spring:message code='par.title.stockDDDocInfo' />"   // 재고실사정보
            ,width : 840
            ,height: 390
            ,content:{
                url:"<c:url value='/par/cmm/selectInvestigationListPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"docStatCd":"END"
                    ,"callbackFunc":function(data){
                        //문서번호 및 그리드 초기화.
                        $("#btnInit").click();

                        if(data.length > 0){
                            if(data[0].docStatCd == "END"){//심사완료 문서 조회.
                                $("#stockDdDocNo").val(data[0].stockDdDocNo);
                                $("#sStockDdDocNo").val(data[0].stockDdDocNo);
                                $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(data[0].regDt);
                                $("#btnCancel").data("kendoButton").enable(false);
                                $("#btnSave").data("kendoButton").enable(true);
                                $("#btnAdd").data("kendoButton").enable(true);
                                $("#btnDelItem").data("kendoButton").enable(true);
                                $("#hgrid").data("kendoExtGrid").dataSource.read();
                                $("#dgrid").data("kendoExtGrid").dataSource.read();
                            }else{
                                dms.notification.success("<spring:message code='par.info.docSelectUsrMsg' />");
                            }
                        }
                        investigationListPopupWindow.close();
                    }
                }
            }
        });
    }

    function userSearchPopup(){
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
                            $("#piMngUsrId").val(data[0].usrId);
                            $("#piMngUsrNm").val(data[0].usrNm);
                        }
                        userSearchPopupWin.close();
                    }
                }
            }
        });
    }

    function fnChangeMvtTp(e){
        initPage();

        if(mvtTp === '43'){
            $("#btnAdd").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);
            $("#searchStockDdDocNo").show();
            $("#searchEtcGiDocNo").hide();
        }else if(mvtTp === '45'){
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDelItem").data("kendoButton").enable(true);
            $("#searchStockDdDocNo").hide();
            $("#searchEtcGiDocNo").show();
        }
    }

    function fnAddRow(i){
        $('#grid').data('kendoExtGrid').dataSource.insert(0, {
            "etcGiDocNo":''
            ,"etcGiDocLineNo":null
            ,"refDocNo":''
            ,"refDocLineNo":null
            ,"itemCd":''
            ,"itemNm":''
            ,"unitCd":''
            ,"qty":0
            ,"giReasonCd":''
            ,"strgeCd":''
            ,"locCd":''
            ,"prc":0
            ,"amt":0
            ,"avlbStockQty":0
        });
    }

    function fnChkDateValue(e){
        var elmt = e.sender.element[0],
            id = elmt.id,
            toYY,
            toMM,
            toDD,
            frYY,
            frMM,
            frDD;

        if(this.value() == null){
            if(id === 'sRegDtFr'){
                var minDate = new Date(sevenDtBf);
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sRegDtTo'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();
                $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }else{
            if(id === 'sRegDtFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sRegDtTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }
    }
</script>
<!-- //script -->
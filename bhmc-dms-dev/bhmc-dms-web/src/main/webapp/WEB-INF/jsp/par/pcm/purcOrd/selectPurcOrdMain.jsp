<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<!-- 구매오더 -->
<div id="resizableContainer">
    <section class="group" id="purcOrdSection">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="par.title.partOrderSave" /></h1> --%>
            <div class="btn_left">
                <dms:access viewId="VIEW-D-11555" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_reset btn_m_min" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                </dms:access>
            </div>
            <div class="btn_right">
                <dms:access viewId="VIEW-D-11554" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnSave" class="btn_m btn_save btn_m_min"><spring:message code="par.btn.save" /><!-- 저장(신청) --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11553" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnSend" class="btn_m btn_save btn_m_min"><spring:message code="par.btn.ordSend" /></button><!--오더신청(전송)  -->
                </dms:access>
                <dms:access viewId="VIEW-D-11552" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnCancel" class="btn_m btn_cancel btn_m_min"><spring:message code="par.btn.ordCancel" /></button><!--오더취소  -->
                </dms:access>
                <dms:access viewId="VIEW-D-11551" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnPrint" class="btn_m btn_print"><spring:message code="par.btn.orderPrint" /><!--출력  --></button>
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
                    <col>
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.purcOrdTp" /><!-- 오더유형 --></span></th>
                    <td>
                        <input id="purcOrdTp" data-type="combo" class="form_comboBox" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.trsfTp" /><!-- 운송유형 --></span></th>
                    <td>
                        <input id="trsfTp" data-type="combo" class="form_comboBox" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.spyrCd" /><!-- 공급처 --></span></th>
                    <td>
                        <div class="form_search">
                            <input type="text" id="bpCd" name="bpCd" class="form_input hidden" data-name="<spring:message code="par.lbl.bpCd" />" />
                            <input type="text" id="bpNm" class="form_input form_readonly" readonly/>
                            <input id="bpTp" name="bpTp" class="form_input hidden" data-name="<spring:message code="par.lbl.custTp" />" />
                            <a id="searchCustCd" class="form_readonly"><!-- 검색 --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.regPdcCd" /><!--신청PDC --></th>
                    <td>
                        <input id="pdcCd" data-type="combo" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                    <td>
                        <div class="form_search">
                            <input id="purcOrdNo" class="form_input" />
                            <a id="searchPurcOrdNo"><!-- 검색 --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.ordRegId" /><!-- 구매신청자 --></th>
                    <td>
                        <input id="regUsrNm" class="form_input form_readonly" readonly />
                        <input id="regUsrId" class="form_input form_readonly hidden" readonly />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.ordRegDt" /><!-- 구매생성일 --></th>
                    <td class="readonly_area">
                        <input id="purcRegDt" type="text" value="" class="form_datepicker" data-type="date" readonly>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.purcSendDt" /><!-- 구매신청일 --></th>
                    <td class="readonly_area">
                        <input id="sendDt" type="text" value="" class="form_datepicker" data-type="date" readonly>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.itemQtyCnt" /><!-- 품목수 --></th>
                    <td class="readonly_area">
                        <input id="purcParCnt" data-type="number" class="form_numeric"  readonly>
                    </td>
                    <th scope="row"><spring:message code='par.lbl.itemQty' /></th>
                    <td class="readonly_area">
                        <input id="purcParQty" data-type="number" class="form_numeric"  readonly>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.ordTotAmt" /><!--금액합계 --></th>
                    <td class="readonly_area">
                        <div class="form_float">
                            <div class="date_left">
                                <input id="totTaxDdctAmt" data-type="number" class="form_numeric" readonly/>
                                <span class="txt_from">/</span>
                            </div>
                            <div class="date_right">
                                <input id="totPurcAmt" data-type="number" class="form_numeric" readonly/>
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.purcOrdStatCd" /><!-- 구매오더상태 --></th>
                    <td>
                        <input id="purcOrdStatCd" type="text" data-type="combo" class="form_comboBox" />
                    </td>
                </tr>
                <tr class="hidden">
                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></th>
                    <td>
                        <input type="text" id="sItemCd" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                    <td>
                        <input type="text" id="sItemNm" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='par.lbl.purcOrcPrice' /></th>
                    <td>
                        <input id="sPurcPrice" class="form_numeric ar" />
                    </td>
                    <th scope="row"><spring:message code='par.lbl.purcAmt' /></th>
                    <td>
                        <input id="sPurcAmt" class="form_numeric ar" />
                    </td>
                </tr>
                <tr class="hidden">
                    <th scope="row"><spring:message code="par.lbl.avlbAmt" /><!-- 가용금액 --></th>
                    <td class="readonly_area">
                        <input id="advanceReceived" class="form_numeric" readonly />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.remark" /><!--비고 --></th>
                    <td colspan="3">
                        <input id="remark" type="text" value="" class="form_input">
                        <input id="updtDtStr" type="text" class="form_input" />
                        <input id="purcParAmt" data-type="number" class="form_numeric" readonly/>
                    </td>
                    <th/>
                    <td/>
                </tr>
                <!-- 2019-5-9 Add CO-PACK下拉框  by Zhang QH-->
                <tr>
                    <th scope="row"><span><spring:message code="par.lbl.coPack" /></span></th>
                    <td>
                        <input id="coPack" type="text" class="form_input" onKeyup="this.value=this.value.replace(/[^A-Z0-9]/g,'');" maxlength="2"/>
                    </td>
                </tr>
                <!-- 2019-5-9 Add CO-PACK下拉框  by Zhang QH-->
                </tbody>
            </table>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
                <dms:access viewId="VIEW-D-11550" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_add btn_s_min5" id="btnCopyPurcOrd"><spring:message code="par.btn.copyPurcOrd" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11549" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_add btn_s_min5" id="btnAddPurcReq"><spring:message code="par.btn.addPurcReq" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11548" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_add btn_s_min5 hidden" id="btnRecommOrd"><spring:message code="par.btn.recommOrd" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11547" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_file btn_s_min5" id="btnExcelUpload"><spring:message code="par.btn.excelUpload" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11546" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_add btn_s_min5" id="btnAdd"><spring:message code="par.btn.add" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11545" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s btn_del btn_s_min5" id="btnDelItem"><spring:message code="par.btn.del" /></button>
                </dms:access>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div class="table_grid">
            <!-- 구매오더 그리드 -->
            <div id="grid" class="resizable_grid"></div>
        </div>

    </section>
    <!-- liuxueying update 控制订单重复提交 start -->
    <input type="hidden" id="subOrderToken" value="${subOrderToken}"/>
    <!-- liuxueying update 控制订单重复提交 end -->
</div>
<!-- //구매오더 -->



<!-- script -->
<script>

    var initBpCd            = "${bpCd}",
        initBpNm            = "${bpNm}",
        initBpTp            = "${bpTp}",
        pPurcOrdNo          = "${pPurcOrdNo}",
        pBpCd               = "${pBpCd}",
        pBpNm               = "${pBpNm}",
        pItemDistinCd       = "${pItemDistinCd}",
        calcAmt             = "${calcAmt}",
        balAmt              = "${balAmt}",
        advancedAmt         = 0,
        dlDistCd            = "${dlDistCd}",
        lmtAmt              = "${lmtAmt}",
        gVatCd              = Number("${vatCd}"),
        useAmt              = Number("${useAmt}"),
        dpstAmt             = Number("${dpstAmt}"),
        cmcGnlDcRate,
        cmcDcRate,
        gnlDcRate,
        cmcEmgcDcRate,
        gCrud               = "C",
        gExistYn            = "N",
        rowNumber           = 0,
        gGridItemCdOrgVal,
        bpTpList            = [],
        purcOrdTpList       = [],
        purcOrdTpObj        = {},
        trsfTpList          = [],
        purcOrdStatList     = [],
        pdcList             = [],
        purcOrdStatObj      = {},
        purcUnitList        = [],
        purcUnitObj         = {},
        prcTpList           = [],
        prcTpObj            = {},
        grStrgeTpList       = [],
        grStrgeTpObj        = {},
        purcItemTpList      = [],
        purcItemTpObj       = {},
        existItemChkObj     = {},
        checkdIds           = {},
        ammendCodeList      = [],
        ammendCodeObj       = {},
        parSpecCdList       = [],
        parSpecCdObj        = {},
        parSpecArr          = [],
        sucCdObj            = {},
        sucCdList           = [],
        nonAvailSuc,
        partsInfoExcelUploadPopupWin,
        itemCdAutoCompleteEditor,
        itemByBpCdPopupWindow,
        prevPurcOrdPopupWindow,
        purcReqPopupWindow,
        purcCostSgstPopupWindow,
        purcOrdListPopupWindow,
        chkAdvanceReceivedPopupWindow,
        searchTrsfTp,
        transObj;


    //初始化CO-PACK下拉列表值
    var coPackList = [
        {"cmmCd":" ", "cmmCdNm":" ", "useYn":"Y"},
        {"cmmCd":"A1", "cmmCdNm":"A1", "useYn":"Y"},
        {"cmmCd":"A2", "cmmCdNm":"A2", "useYn":"Y"},
        {"cmmCd":"A3", "cmmCdNm":"A3", "useYn":"Y"},
        {"cmmCd":"A4", "cmmCdNm":"A4", "useYn":"Y"},
        {"cmmCd":"A5", "cmmCdNm":"A5", "useYn":"Y"},
        {"cmmCd":"A6", "cmmCdNm":"A6", "useYn":"Y"},
        {"cmmCd":"A7", "cmmCdNm":"A7", "useYn":"Y"},
        {"cmmCd":"A8", "cmmCdNm":"A8", "useYn":"Y"},
        {"cmmCd":"A9", "cmmCdNm":"A9", "useYn":"Y"},
        {"cmmCd":"A10", "cmmCdNm":"A10", "useYn":"Y"},
        {"cmmCd":"B1", "cmmCdNm":"B1", "useYn":"Y"},
        {"cmmCd":"B2", "cmmCdNm":"B2", "useYn":"Y"},
        {"cmmCd":"B3", "cmmCdNm":"B3", "useYn":"Y"},
        {"cmmCd":"B4", "cmmCdNm":"B4", "useYn":"Y"},
        {"cmmCd":"B5", "cmmCdNm":"B5", "useYn":"Y"},
        {"cmmCd":"B6", "cmmCdNm":"B6", "useYn":"Y"},
        {"cmmCd":"B7", "cmmCdNm":"B7", "useYn":"Y"},
        {"cmmCd":"B8", "cmmCdNm":"B8", "useYn":"Y"},
        {"cmmCd":"B9", "cmmCdNm":"B9", "useYn":"Y"}
    ];


    if(!dms.string.isEmpty("${cmcGnlDcRate}")){
        cmcGnlDcRate = Number("${cmcGnlDcRate}");
    }

    if(dms.string.isEmpty(gVatCd)){
        console.log('gVatCd 값 없음!');
        //gVatCd = .16;
        gVatCd = .13;
    }
    console.log('gVatCd:',gVatCd);

    if(!dms.string.isEmpty("${cmcDcRate}")){
        cmcDcRate = Number("${cmcDcRate}");
    }

    if(!dms.string.isEmpty("${gnlDcRate}")){
        gnlDcRate = Number("${gnlDcRate}");
    }

    if(!dms.string.isEmpty("${cmcEmgcDcRate}")){
        cmcEmgcDcRate = Number("${cmcEmgcDcRate}");
    }

    bpTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${bpTpList}" varStatus="status">
    bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //trsfTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${pdcList}" varStatus="status">
    pdcList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //trsfTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${trsfTpList}" varStatus="status">
    trsfTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    purcItemTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${purcItemTpList}" varStatus="status">
    purcItemTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    purcItemTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    prcTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${prcTpList}" varStatus="status">
    prcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}", "parSpecCd":"${obj.remark1}"});
    prcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
    purcOrdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}", "parSpecCd":"${obj.remark1}"});
    purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    parSpecCdObj["${obj.cmmCd}"] = {};
    if("${obj.remark1}".length > 0){
        parSpecArr = "${obj.remark1}".split('');
        for(i in parSpecArr){
            parSpecCdObj["${obj.cmmCd}"][parSpecArr[i]] = parSpecArr[i];
        }
        parSpecCdObj["${obj.cmmCd}"]['specTpArr'] =  parSpecArr;
    }
    parSpecCdObj["${obj.cmmCd}"]['specTp'] = "${obj.remark1}";
    </c:forEach>

    <c:forEach var="obj" items="${purcOrdStatList}" varStatus="status">
    if("${obj.useYn}" !=='N' ){
        purcOrdStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }
    purcOrdStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${purcUnit}" varStatus="status">
    purcUnitList.push({cmmCd:"${obj.unitExtCd}", cmmCdNm:"${obj.unitExtCd}"});
    purcUnitObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
    </c:forEach>

    grStrgeTpObj[' '] = "";
    <c:forEach var="obj" items="${storageList}" varStatus="status">
    grStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
    grStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
    </c:forEach>

    //편수코드 선택
    ammendCodeList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    ammendCodeObj[""] = "";
    <c:forEach var="obj" items="${ammendCodeList}" varStatus="status">
    ammendCodeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ammendCodeObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${sucCdList}" varStatus="status">
    if("${obj.useYn}" !=='N' && "${obj.remark1}" ==='N'){  //사용가능 SUC코드 중 사용 불가인 부품 거르기 위함.(remark1이 'N'인 경우 사용 할 수 없는 부품임.)
        //SUC_CD가 'AO' 인 부품은 제외. AO부품은 AO부품끼리만 오더가능
        if("${obj.cmmCd}" !== "AO"){
            sucCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            sucCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
            if(dms.string.isEmpty(nonAvailSuc)){
                nonAvailSuc  = 'SUC:' + "${obj.cmmCd}" + '[' + "${obj.cmmCdNm}" + ']';
            }else{
                nonAvailSuc  = nonAvailSuc + "," + "${obj.cmmCd}" + '[' + "${obj.cmmCdNm}" + ']';
            }
        }
    }
    </c:forEach>

    $(document).ready(function() {
        advancedAmt = Number(balAmt) - Number(calcAmt);  //선수금 계산금액

        if(advancedAmt < lmtAmt){
            fnChkAdvanceReceivedPopupWindow(advancedAmt, lmtAmt);
        }

        //PDC선택
        $("#pdcCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:pdcList
            ,index:0
        });

        //오더유형선택
        $("#purcOrdTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:purcOrdTpList
            ,optionLabel:" "
            ,index:0
        });


        //coPack
        /*$("#coPack").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:coPackList
            // ,optionLabel:" "
            ,index:0
        });*/

        //운송선택
        $("#trsfTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:trsfTpList
            ,optionLabel:" "
            ,index:0
        });

        //구매오더상태선택
        $("#purcOrdStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:purcOrdStatList
            ,optionLabel:" "
            ,index:0
        });
        //sPurcPrice
        $("#sPurcPrice").kendoExtNumericTextBox({
            format:"n0"
            ,decimals:2
            ,spinners:false
            ,value:0
        });
        //sPurcAmt
        $("#sPurcAmt").kendoExtNumericTextBox({
            format:"n0"
            ,decimals:2
            ,spinners:false
            ,value:0
        });

        $("#totTaxDdctAmt").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });

        $("#totPurcAmt").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });

        $("#purcParCnt").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });

        $("#purcParQty").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });

        $("#purcParAmt").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });

        //가용금액
        $("#avlbAmt").kendoExtNumericTextBox({
            format:"n0"
            ,spinners:false
        });

        //선수금
        $("#advanceReceived").kendoExtNumericTextBox({
            format:"n0"
            ,spinners:false
        });

        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);
        $("#searchPurcOrdNo").on('click', selectPurcOrdListPopupWindow);
        $("#purcOrdNo").on('keypress', selectPurcOrdNoKey);
        $("#purcOrdTp").on('change', fnChangePurcOrdTp);


        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                pPurcOrdNo = ''; //구매등록 관리 화면에서 넘어온 구매번호 삭제.
                pBpCd = ''; //구매등록 관리 화면에서 넘어온 공급처 삭제.
                pBpNm = ''; //구매등록 관리 화면에서 넘어온 공급처 삭제.
                gCrud = "C";
                initPage();
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        // 저장 버튼
        $("#btnSave").kendoButton({
            click:function(e){
                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    reqStrMesg    = "<spring:message code='global.info.required.field' />",
                    selectStrMesg = "<spring:message code='global.info.chkSelectItemMsg' />",
                    lPurcOrdTp    = $("#purcOrdTp").data("kendoExtDropDownList").value(),
                    lCrud         = '',
                    paramUrl      = '',
                    purcReqNoList  = [],
                    purcReqQtyList = [],
                    minPurcItemInfo,
                    lChkAOSucObj    = {},
                    lFirstCnt       = 0,
                    header;

                header = {
                    purcOrdTp       :lPurcOrdTp
                    , trsfTp          :$("#trsfTp").data("kendoExtDropDownList").value()
                    , purcOrdNo       :$("#purcOrdNo").val()
                    , purcOrdStatCd   :$("#purcOrdStatCd").data("kendoExtDropDownList").value()
                    , bpCd            :$("#bpCd").val()
                    , bpTp            :$("#bpTp").val()
                    , totPurcAmt      :$("#totPurcAmt").data("kendoExtNumericTextBox").value()
                    , remark          :$("#remark").val()
                    , updtDtStr       :$("#updtDtStr").val()
                    , coPack          :$("#coPack").val()
                };

                if(dms.string.isEmpty(lPurcOrdTp)){
                    //구매오더 유형은 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.purcOrdTp' var='purcOrdTp' /><spring:message code='global.info.required.field' arguments='${purcOrdTp}'/>");
                    return false;
                }
                if(dms.string.isEmpty($("#trsfTp").data("kendoExtDropDownList").value())){
                    //운송유형은 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.trsfTp' var='trsfTp' /><spring:message code='global.info.required.field' arguments='${trsfTp}'/>");
                    return false;
                }
                if(dms.string.isEmpty($("#bpCd").val())){
                    //거래처정보는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.required.field' arguments='${bpCd}'/>");
                    return false;
                }

                if(gCrud === "C"){
                    if(rows.length  == 0 ){
                        // 선택값이 없습니다.
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }

                    rows.each(function(index, row) {
                        var gridData = grid.dataSource.at(index);

                        if(!dms.string.isEmpty(gridData.itemCd)){
                            lFirstCnt = lFirstCnt + 1;

                            if(lFirstCnt === 1){
                                lChkAOSucObj['ONE'] = gridData.sucCd;
                            }else{
                                //첫라인의 SUC가 'AO'인 경우 모든 라인이 'AO'여야함.
                                if(lChkAOSucObj['ONE'] === 'AO'){
                                    if(gridData.sucCd !== lChkAOSucObj['ONE']){
                                        dms.notification.warning("<spring:message code='par.info.sucAoOrder' />");
                                        saveList = [];
                                        return false;
                                    }

                                    //첫라인의 SUC가 'AO'아닌 경우 1라인이라도 'AO'가 존재할 수 없음.
                                }else{
                                    if(gridData.sucCd === 'AO'){
                                        dms.notification.warning("<spring:message code='par.info.sucAoOrder' />");
                                        saveList = [];
                                        return false;
                                    }
                                }
                            }


                            if(dms.string.isEmpty(gridData.purcQty) || gridData.purcQty == 0){
                                // 수량을 입력하십시오
                                dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.confirmMsgParam' arguments='${qty}'/>");
                                saveList = [];
                                return false;
                            }

                            if(dms.string.isEmpty(gridData.grStrgeCd)){
                                // 입고창고를 선택하십시오
                                dms.notification.warning("<spring:message code='par.lbl.grStrgeCd' var='grStrgeCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${grStrgeCd}'/>");
                                saveList = [];
                                return false;
                            }

                            if(Number(gridData.minPurcQty) > Number(gridData.purcQty)){
                                dms.notification.warning("<spring:message code='par.lbl.purcQty' var='purcQty' /><spring:message code='par.lbl.minPurcQty' var='minPurcQty' /><spring:message code='par.info.itemReqZeroCntMsg' arguments='[" + gridData.itemCd + "] ${purcQty},${minPurcQty}'/>");
                                saveList = [];
                                return false;
                            }


                            if((Number(gridData.purcQty) % Number(gridData.minPurcQty)) !== 0){
                                //구매수량은 최소포장수량의 배수입니다.
                                dms.notification.warning("[" + gridData.itemCd + "] <spring:message code='par.info.purcOrdMinPackMsg' />");
                                saveList = [];
                                return false;
                            }

                            if(!dms.string.isEmpty(gridData.purcReqNo)){
                                purcReqNoList     = gridData.purcReqNo.split(',');
                                purcReqQtyList    = String(gridData.purcReqLineNo).split(',');
                                if(purcReqNoList.length === 1){
                                    if(dms.string.isEmpty(purcReqNoList[0])){
                                        purcReqNoList = [];
                                        purcReqQtyList = [];
                                    }
                                }else if(purcReqNoList.length === 0){
                                    purcReqNoList = [];
                                    purcReqQtyList = [];
                                }

                                gridData.purcReqNoList = purcReqNoList;
                                gridData.purcReqQtyList = purcReqQtyList;

                            }

                            if(!dms.string.isEmpty(lPurcOrdTp) && !dms.string.isEmpty(parSpecCdObj[lPurcOrdTp])){
                                if(!dms.string.isEmpty(parSpecCdObj[lPurcOrdTp]['specTp'])){
                                    if(!dms.string.isEmpty(gridData.parSpecCd)){
                                        if(!parSpecCdObj[lPurcOrdTp].hasOwnProperty(gridData.parSpecCd)){
                                            dms.notification.warning("<spring:message code='par.lbl.purcOrdTp' var='purcOrdTp' /><spring:message code='par.lbl.parSpecCd' var='parSpecCd' /><spring:message code='par.info.paramDiffMsg' arguments='${purcOrdTp},${parSpecCd},"+gridData.itemCd+"'/>");
                                            saveList = [];
                                            return false;
                                        }
                                    }
                                }
                            }
                            saveList.push(gridData);
                        }
                    });

                    if(saveList.length > 0){
                        var data ={
                            "purcOrdVO":header
                            ,"purcOrdItemList":saveList
                        };

                        $.ajax({
                            url:"<c:url value='/par/pcm/purcOrd/insertPurcOrd.do' />"
                            ,data:kendo.stringify(data)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:true
                            ,success:function(result) {
                                if (result.resultYn == true) {
                                    //update by lyy 2018-11-09 采购订单提交后加载页面数据前再次提交修复 start
                                    gCrud = "U";
                                    //update by lyy 2018-11-09 采购订单提交后加载页面数据前再次提交修复 end
                                    dms.notification.success("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.info.regSuccessParam' arguments='${purcOrd}'/>");

                                    pPurcOrdNo = result.purcOrdNo;
                                    // 구매오더 조회.
                                    selectPurcOrd(pPurcOrdNo);

                                } else {
                                    if(result === 0){
                                        dms.notification.error("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.err.regFailedParam' arguments='${purcOrd}'/>");
                                    }
                                }
                            }
                            ,beforeSend:function(){
                                dms.loading.show($("#purcOrdSection"));
                            }
                            ,complete:function(){
                                //update by lyy 2018-11-09 采购订单提交后加载页面数据前再次提交修复 start
                                gCrud = "U";
                                //update by lyy 2018-11-09 采购订单提交后加载页面数据前再次提交修复 end
                                dms.loading.hide($("#purcOrdSection"));
                            }
                            ,error:function(jqXHR,status,error) {
                                dms.loading.hide($("#purcOrdSection"));
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }
                        });
                    }
                }else if(gCrud === "U"){
                    var saveData       = grid.getCUDData("insertList", "updateList", "deleteList",["orgPurcPrc"]),
                        insertListLeng = saveData.insertList.length,
                        updateListLeng = saveData.updateList.length,
                        deleteListLeng = saveData.deleteList.length,
                        validCnt       = 0;

                    /******************************************************
                     행추가 된 경우 부품번호가 없으면 빈라인이라 판단 저장에서 제외한다.
                     *******************************************************/
                    for(var i = insertListLeng-1; i >= 0; i = i - 1){
                        if(dms.string.isEmpty(saveData.insertList[i].itemCd)){
                            saveData.insertList.splice(i,1);
                        }else{
                            if(!dms.string.isEmpty(saveData.insertList[i].purcReqNo)){
                                purcReqNoList     = saveData.insertList[i].purcReqNo.split(',');
                                purcReqQtyList    = String(saveData.insertList[i].purcReqLineNo).split(',');
                                if(purcReqNoList.length === 1){
                                    if(dms.string.isEmpty(purcReqNoList[0])){
                                        purcReqNoList     = [];
                                        purcReqQtyList = [];
                                    }
                                }else if(purcReqNoList.length === 0){
                                    purcReqNoList     = [];
                                    purcReqQtyList = [];
                                }

                                saveData.insertList[i].purcReqNoList = purcReqNoList;
                                saveData.insertList[i].purcReqQtyList = purcReqQtyList;
                            }
                        }
                    }

                    /******************************************************
                     행삭제 된 경우
                     *******************************************************/
                    for(var i = deleteListLeng-1; i >= 0; i = i - 1){
                        if(!dms.string.isEmpty(saveData.deleteList[i].purcReqNo)){
                            purcReqNoList     = saveData.deleteList[i].purcReqNo.split(',');
                            purcReqQtyList    = String(saveData.deleteList[i].purcReqLineNo).split(',');
                            if(purcReqNoList.length === 1){
                                if(dms.string.isEmpty(purcReqNoList[0])){
                                    purcReqNoList     = [];
                                    purcReqQtyList    = [];
                                }
                            }else if(purcReqNoList.length === 0){
                                purcReqNoList     = [];
                                purcReqQtyList    = [];
                            }

                            saveData.deleteList[i].purcReqNoList     = purcReqNoList;
                            saveData.deleteList[i].purcReqQtyList = purcReqQtyList;
                        }
                    }

                    rows.each(function(index, row) {
                        var gridData = grid.dataSource.at(index);

                        if(!dms.string.isEmpty(gridData.itemCd)){//아이템 코드가 비었는가

                            lFirstCnt = lFirstCnt + 1;

                            if(lFirstCnt === 1){
                                lChkAOSucObj['ONE'] = gridData.sucCd;
                            }else{
                                //첫라인의 SUC가 'AO'인 경우 모든 라인이 'AO'여야함.
                                if(lChkAOSucObj['ONE'] === 'AO'){
                                    if(gridData.sucCd !== lChkAOSucObj['ONE']){
                                        dms.notification.warning("<spring:message code='par.info.sucAoOrder' />");
                                        saveList = [];
                                        validCnt = 1;
                                        return false;
                                    }

                                    //첫라인의 SUC가 'AO'아닌 경우 1라인이라도 'AO'가 존재할 수 없음.
                                }else{
                                    if(gridData.sucCd === 'AO'){
                                        dms.notification.warning("<spring:message code='par.info.sucAoOrder' />");
                                        saveList = [];
                                        validCnt = 1;
                                        return false;
                                    }
                                }
                            }

                            if(!dms.string.isEmpty(lPurcOrdTp) && !dms.string.isEmpty(parSpecCdObj[lPurcOrdTp])){//구매오더유형이 체크
                                if(!dms.string.isEmpty(parSpecCdObj[lPurcOrdTp]['specTp'])){
                                    if(!dms.string.isEmpty(gridData.parSpecCd)){
                                        if(!parSpecCdObj[lPurcOrdTp].hasOwnProperty(gridData.parSpecCd)){
                                            dms.notification.warning("<spring:message code='par.lbl.purcOrdTp' var='purcOrdTp' /><spring:message code='par.lbl.parSpecCd' var='parSpecCd' /><spring:message code='par.info.paramDiffMsg' arguments='${purcOrdTp},${parSpecCd},"+gridData.itemCd+"'/>");
                                            saveList = [];
                                            validCnt = 1;
                                            return false;
                                        }
                                    }
                                }
                            }
                        }
                        if((Number(gridData.purcQty) % Number(gridData.minPurcQty)) !== 0){
                            //구매수량은 최소포장수량의 배수입니다.
                            dms.notification.warning("[" + gridData.itemCd + "] <spring:message code='par.info.purcOrdMinPackMsg' />");
                            saveList = [];
                            validCnt = 1;
                            return false;
                        }
                    });

                    saveData.purcOrdVO = header;

                    if(validCnt === 0){
                        if (grid.cudDataLength == 0){
                            $.ajax({
                                url:"<c:url value='/par/pcm/purcOrd/updatePurcOrd.do' />"
                                ,data:kendo.stringify(header)
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,async:true
                                ,success:function(result){
                                    if (result === 1){
                                        dms.notification.success("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.info.modifySuccessParam' arguments='${purcOrd}'/>");
                                        // 구매오더 조회.
                                        selectPurcOrd(pPurcOrdNo);
                                    }else{
                                        if(result === 0){
                                            dms.notification.error("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.err.modifyFailedParam' arguments='${purcOrd}'/>");
                                        }
                                    }
                                }
                                ,beforeSend:function(){
                                    dms.loading.show($("#purcOrdSection"));
                                }
                                ,complete:function(){
                                    dms.loading.hide($("#purcOrdSection"));
                                }
                                ,error:function(jqXHR,status,error) {
                                    dms.loading.hide($("#purcOrdSection"));
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }
                            });
                        }else{
                            $.ajax({
                                url:"<c:url value='/par/pcm/purcOrd/multiPurcOrds.do' />"
                                ,data:kendo.stringify(saveData)
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,async:true
                                ,success:function(result){
                                    if(result === true){
                                        dms.notification.success("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.info.modifySuccessParam' arguments='${purcOrd}'/>");
                                        // 구매오더 조회.
                                        selectPurcOrd(pPurcOrdNo);
                                    }else{
                                        if(result === 0){
                                            dms.notification.error("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.err.modifyFailedParam' arguments='${purcOrd}'/>");
                                        }
                                    }
                                }
                                ,beforeSend:function(){
                                    dms.loading.show($("#purcOrdSection"));
                                }
                                ,complete:function(){
                                    dms.loading.hide($("#purcOrdSection"));
                                }
                                ,error:function(jqXHR,status,error) {
                                    dms.loading.hide($("#purcOrdSection"));
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }
                            });
                        }
                    }
                }else{
                    console.log('CRUD정보가 없습니다.');
                }
            }
        });


        // 취소 버튼
        $("#btnCancel").kendoButton({
            click:function(e){

                var saveList        = [],
                    grid            = $("#grid").data("kendoExtGrid"),
                    rows            = grid.tbody.find("tr"),
                    lCrud           = '',
                    paramUrl        = '',
                    header;

                if(dms.string.isEmpty($("#purcOrdNo").val())){
                    //구매번호가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.purcOrdNo' var='purcOrdNo' /><spring:message code='global.info.emptyParamInfo' arguments='${purcOrdNo}'/>");
                    return false;
                }
                if(dms.string.isEmpty($("#purcOrdStatCd").data("kendoExtDropDownList").value())){
                    //구매오더 상태 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.purcItemStatCd' var='purcItemStatCd' /><spring:message code='global.info.emptyParamInfo' arguments='${purcItemStatCd}'/>");
                    return false;
                }

                header = {
                    purcOrdTp       :$("#purcOrdTp").data("kendoExtDropDownList").value()
                    , trsfTp          :$("#trsfTp").data("kendoExtDropDownList").value()
                    , bpCd            :$("#bpCd").val()
                    , bpTp            :$("#bpTp").val()
                    , purcOrdNo       :$("#purcOrdNo").val()
                    , purcOrdStatCd   :$("#purcOrdStatCd").data("kendoExtDropDownList").value()
                    , remark          :$("#remark").val()
                    , updtDtStr       :$("#updtDtStr").val()
                };

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index),
                        purcReqNoList     = [],
                        purcReqQtyList = [];

                    if(!dms.string.isEmpty(gridData.itemCd)){

                        if(!dms.string.isEmpty(gridData.purcReqNo)){
                            purcReqNoList     = gridData.purcReqNo.split(',');
                            purcReqQtyList    = String(gridData.purcReqLineNo).split(',');
                            if(purcReqNoList.length === 1){
                                if(dms.string.isEmpty(purcReqNoList[0])){
                                    purcReqNoList = [];
                                    purcReqQtyList = [];
                                }
                            }else if(purcReqNoList.length === 0){
                                purcReqNoList = [];
                                purcReqQtyList = [];
                            }

                            gridData.purcReqNoList = purcReqNoList;
                            gridData.purcReqQtyList = purcReqQtyList;

                        }

                        saveList.push(gridData);
                    }
                });

                if(saveList.length > 0){
                    var data ={
                        "purcOrdVO":header
                        ,"purcOrdItemList":saveList
                    };

                    $.ajax({
                        url:"<c:url value='/par/pcm/purcOrd/cancelPurcOrd.do' />"
                        ,data:kendo.stringify(data)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:true
                        ,success:function(result) {

                            if (result === 1) {

                                //취소 완료 되었습니다.
                                dms.notification.success("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.info.cancelSuccessParam' arguments='${purcOrd}'/>");

                                selectPurcOrd(pPurcOrdNo);

                            } else {
                                if(result === 0){
                                    //취소 실패하였습니다.
                                    dms.notification.error("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.err.cancelFailedParam' arguments='${purcOrd}'/>");
                                }
                            }
                        }
                        ,beforeSend:function(){
                            dms.loading.show($("#purcOrdSection"));
                        }
                        ,complete:function(){
                            dms.loading.hide($("#purcOrdSection"));
                        }
                        ,error:function(jqXHR,status,error) {
                            dms.loading.hide($("#purcOrdSection"));
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }

                    });
                }
            }
        });

        // 출력 버튼
        $("#btnPrint").kendoButton({
            enable:false
            ,click:function(e){
                parent._createOrReloadTabMenu("<spring:message code='par.title.orderReqPrint'/>", "<c:url value='/ReportServer?reportlet=par/selectPurcOrdPrintMain.cpt'/>&sDlrCd=${dlrCd}&sPurcOrdNo="+$("#purcOrdNo").val(),"VIEW-D-13133", true);
            }
        });

        // 구매오더 복사 버튼
        $("#btnCopyPurcOrd").kendoButton({
            click:function(e){
                var bpCd = $("#bpCd").val();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }
                selectPrevPurcOrdPopupWindow();
            }
        });

        // 구매요청 추가 버튼
        $("#btnAddPurcReq").kendoButton({
            click:function(e){
                var bpCd = $("#bpCd").val();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }
                selectPurcReqPopupWindow();
            }
        });

        // 추천오더 버튼
        $("#btnRecommOrd").kendoButton({
            click:function(e){

                var bpCd = $("#bpCd").val();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }
                selectPurcCostSgstPopupWindow();
            }
        });

        //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {

                var bpCd          = $("#bpCd").val();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }
                selectItemPopupWindow();
            }
        });

        // 부품삭제 버튼
        $("#btnDelItem").kendoButton({
            click:function(e){
                //삭제 팝업 호출.
                $("#messageId").html("<spring:message code='par.info.delYn' />");
                conformKendoWindow.content( $(".msgDiv").html());
                conformKendoWindow.open();
                $(".yes, .no").click(function(){
                    if($(this).hasClass("yes")){
                        conformKendoWindow.close();

                        var grid = $("#grid").data("kendoExtGrid"),
                            rows = grid.select();


                        rows.each(function(index, row) {
                            var l_rowData = grid.dataItem(row);
                            delete existItemChkObj[l_rowData.itemCd];
                        });

                        rows.each(function(index, row) {
                            grid.removeRow(row);
                        });

                        calTotalAmt();
                    }
                    conformKendoWindow.close();
                }).end();
            }
        });

        // 엑셀 업로드
        $("#btnExcelUpload").kendoButton({
            click:function(e) {
                partsInfoExcelUploadPopupWin = dms.window.popup({
                    title:"<spring:message code='par.title.purcOrdExcelUpload' />"
                    ,windowId:"partsInfoExcelUploadPopupWin"
                    ,width : 680
                    ,height: 340
                    ,content:{
                        url:"<c:url value='/par/pcm/cmm/selectPartsInfoExcelUploadPopup.do'/>"
                        ,data:{
                            "bpTp": $("#bpTp").val()
                            ,"callbackFunc":function(data){

                                var dataLen      = data.length,
                                    gridData     = $("#grid").data("kendoExtGrid"),
                                    lPurcOrdTp   = $("#purcOrdTp").data("kendoExtDropDownList").value(),
                                    popItemData  = {},
                                    lPurcPrc     = 0,
                                    duplicationItemInfo,
                                    diffTypeItemInfo,
                                    nonAvailItemInfo,
                                    tDate;

                                for(var i = 0; i < dataLen; i = i + 1){

                                    lPurcPrc = 0;

                                    tDate = new Date();

                                    lPurcPrc = fnSetPurcPrcApplyDcRate(data[i].purcPrc);

                                    if(dms.string.isEmpty(data[i].purcLeadHm)){
                                        data[i].purcLeadHm = 0;
                                    }

                                    if(dms.string.isEmpty(data[i].minPurcQty) || Number(data[i].minPurcQty) === 0){
                                        popItemData.minPurcQty = 1;
                                    }else{
                                        popItemData.minPurcQty     = data[i].minPurcQty;                        //최소구매수량
                                    }

                                    if(!dms.string.isEmpty(lPurcOrdTp) && !dms.string.isEmpty(parSpecCdObj[lPurcOrdTp])){
                                        if(!dms.string.isEmpty(parSpecCdObj[lPurcOrdTp]['specTp'])){
                                            if(!dms.string.isEmpty(data[i].parSpecCd)){
                                                if(!parSpecCdObj[lPurcOrdTp].hasOwnProperty(data[i].parSpecCd)){
                                                    if(dms.string.isEmpty(diffTypeItemInfo)){

                                                        diffTypeItemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                                    }else{

                                                        diffTypeItemInfo = diffTypeItemInfo + ', ' + data[i].itemCd + '[' + data[i].itemNm + ']';
                                                    }
                                                    continue;
                                                }
                                            }
                                        }
                                    }

                                    if(!dms.string.isEmpty(data[i].sucCd)){
                                        if(sucCdObj.hasOwnProperty(data[i].sucCd)){
                                            if(dms.string.isEmpty(nonAvailItemInfo)){
                                                nonAvailItemInfo = "<spring:message code='par.info.sucCdItemMsg' arguments='[" + data[i].itemCd + "],["+data[i].sucCd+"]'/>  <br>";//"配件 [" + data[i].itemCd + "] 供应代码为 [" + data[i].sucCd + "] 所以不能提报 <br>";
                                            }else{
                                                nonAvailItemInfo = nonAvailItemInfo + "<spring:message code='par.info.sucCdItemMsg' arguments='[" + data[i].itemCd + "],["+data[i].sucCd+"]'/>  <br>";
                                            }

                                            continue;
                                        }
                                    }

                                    tDate.setDate(tDate.getDate() + Number(data[i].purcLeadHm));
                                    popItemData.dlrCd          = data[i].dlrCd;
                                    popItemData.purcItemTp     = "03";
                                    popItemData.purcItemStatCd = "01";
                                    popItemData.grStrgeCd      = data[i].grStrgeCd;
                                    popItemData.itemCd         = data[i].itemCd;
                                    popItemData.itemNm         = data[i].itemNm;
                                    popItemData.purcUnitCd     = data[i].purcUnitCd;
                                    //popItemData.purcQty        = data[i].purcQty;
                                    popItemData.purcQty        = data[i].purcExcelQty;
                                    popItemData.purcReqQty     = 0;
                                    popItemData.purcPrc        = lPurcPrc;
                                    popItemData.purcAmt        = lPurcPrc * data[i].purcExcelQty;
                                    popItemData.taxDdctPrc     = lPurcPrc / ( 1 + gVatCd ) ;
                                    popItemData.taxDdctAmt     = lPurcPrc * (data[i].purcExcelQty / ( 1 + gVatCd )) ;
                                    //popItemData.taxDdctPrc  = data[i].purcPrc - (data[i].purcPrc * gVatCd) ;
                                    //popItemData.taxDdctAmt  = data[i].purcAmt - (data[i].purcAmt * gVatCd);
                                    popItemData.prcTp          = "01";  //구매가
                                    popItemData.delYn          = "N";
                                    popItemData.grEndYn        = "N";
                                    popItemData.purcReqDt      = tDate;
                                    //popItemData.minPackQty     = data[i].minPackQty;                        //최소포장수량
                                    popItemData.resvStockQty   = data[i].resvStockQty;
                                    popItemData.avlbStockQty   = data[i].avlbStockQty;
                                    popItemData.stockQty       = data[i].stockQty;
                                    popItemData.borrowQty      = data[i].borrowQty;
                                    popItemData.rentQty        = data[i].rentQty;
                                    popItemData.editCd         = '';
                                    popItemData.parSpecCd      = data[i].parSpecCd;
                                    popItemData.sucCd          = data[i].sucCd;
                                    popItemData.orgPurcPrc     = data[i].purcPrc;

                                    if(existItemChkObj.hasOwnProperty(data[i].itemCd)){
                                        //이미 등록되어있는 부품입니다.
                                        if(dms.string.isEmpty(duplicationItemInfo)){

                                            duplicationItemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                        }else{

                                            duplicationItemInfo = duplicationItemInfo + ', ' + data[i].itemCd + '[' + data[i].itemNm + ']';
                                        }

                                    }else{
                                        existItemChkObj[data[i].itemCd] = data[i].itemNm;
                                        gridData.dataSource.add(popItemData);
                                    }
                                }

                                if(!dms.string.isEmpty(diffTypeItemInfo)){
                                    dms.notification.warning("<spring:message code='par.lbl.purcOrdTp' var='purcOrdTp' /><spring:message code='par.lbl.parSpecCd' var='parSpecCd' /><spring:message code='par.info.paramDiffMsg' arguments='${purcOrdTp},${parSpecCd},"+diffTypeItemInfo+"'/>");
                                }

                                if(!dms.string.isEmpty(duplicationItemInfo)){
                                    dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + duplicationItemInfo + "'/>");
                                }

                                if(!dms.string.isEmpty(nonAvailItemInfo)){
                                    dms.notification.warning(nonAvailItemInfo);
                                }


                                gridData.select(gridData.tbody.find(">tr"));

                                partsInfoExcelUploadPopupWin.close();

                                calTotalAmt();
                            }
                        }
                    }
                });
            }
        });

        // 전송 버튼
        $("#btnSend").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    saveData      = grid.getCUDData("insertList", "updateList", "deleteList"),
                    lPurcOrdTp    = $("#purcOrdTp").data("kendoExtDropDownList").value(),
                    lCrud         = '',
                    paramUrl      = '',
                    validationYn  = 'Y',
                    lChkAOSucObj  = {},
                    lFirstCnt     = 0,
                    chkRow,
                    header;

                if(dms.string.isEmpty($("#purcOrdNo").val())){
                    //구매번호가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.purcOrdNo' var='purcOrdNo' /><spring:message code='global.info.emptyParamInfo' arguments='${purcOrdNo}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#purcOrdStatCd").data("kendoExtDropDownList").value())){
                    //구매오더 상태 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.purcItemStatCd' var='purcItemStatCd' /><spring:message code='global.info.emptyParamInfo' arguments='${purcItemStatCd}'/>");
                    return false;
                }

                if($("#bpTp").val() !== '01' || pItemDistinCd === '07'){//로컬업체인 경우 && 공구 구매시 전송이 아닌 확정임.


                    if($("#purcOrdStatCd").data("kendoExtDropDownList").value() !== '01'){
                        //확정 실패하였습니다..
                        dms.notification.warning("<spring:message code='par.lbl.purcOrdNo' var='purcOrdNo' /><spring:message code='global.info.cnfmFailedParam'  arguments='${purcOrdNo}'/>");
                        return false;
                    }

                    header = {
                        purcOrdTp       : lPurcOrdTp
                        , trsfTp          :$("#trsfTp").data("kendoExtDropDownList").value()
                        , bpCd            :$("#bpCd").val()
                        , bpTp            :$("#bpTp").val()
                        , purcOrdNo       :$("#purcOrdNo").val()
                        , purcOrdStatCd   :$("#purcOrdStatCd").data("kendoExtDropDownList").value()
                        , remark          :$("#remark").val()
                        , updtDtStr       :$("#updtDtStr").val()
                    };

                    saveData.purcOrdVO = header;

                    if (grid.cudDataLength == 0) {
                        $.ajax({
                            url:"<c:url value='/par/pcm/purcOrd/confirmPurcOrd.do' />"
                            ,data:kendo.stringify(header)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:true
                            ,success:function(result) {
                                if (result === true) {
                                    dms.notification.success("<spring:message code='par.lbl.purcOrdNo' var='purcOrdNo' /><spring:message code='global.info.cnfmSuccessParam' arguments='${purcOrdNo}'/>");

                                    // 구매오더 조회.
                                    selectPurcOrd(pPurcOrdNo);

                                } else {
                                    if(result === 0){
                                        dms.notification.error("<spring:message code='par.lbl.purcOrdNo' var='purcOrdNo' /><spring:message code='global.info.cnfmFailedParam' arguments='${purcOrdNo}'/>");
                                    }
                                }
                            }
                            ,beforeSend:function(){
                                dms.loading.show($("#purcOrdSection"));
                            }
                            ,complete:function(){
                                dms.loading.hide($("#purcOrdSection"));
                            }
                            ,error:function(jqXHR,status,error) {
                                dms.loading.hide($("#purcOrdSection"));
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }

                        });
                    }else{
                        if (grid.gridValidation()) {

                            $.ajax({
                                url:"<c:url value='/par/pcm/purcOrd/multiConfirmPurcOrd.do' />"
                                ,data:kendo.stringify(saveData)
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,async:true
                                ,success:function(result) {
                                    if (result === true) {
                                        dms.notification.success("<spring:message code='par.lbl.purcOrdNo' var='purcOrdNo' /><spring:message code='global.info.cnfmSuccessParam' arguments='${purcOrdNo}'/>");

                                        // 부품판매 조회.
                                        selectPurcOrd(pPurcOrdNo);

                                    } else {
                                        if(result === 0){
                                            dms.notification.error("<spring:message code='par.lbl.purcOrdNo' var='purcOrdNo' /><spring:message code='global.info.cnfmFailedParam' arguments='${purcOrdNo}'/>");
                                        }
                                    }
                                }
                                ,beforeSend:function(){
                                    dms.loading.show($("#purcOrdSection"));
                                }
                                ,complete:function(){
                                    dms.loading.hide($("#purcOrdSection"));
                                }
                                ,error:function(jqXHR,status,error) {
                                    dms.loading.hide($("#purcOrdSection"));
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }

                            });
                        }
                    }
                }else{
                    if($("#purcOrdStatCd").data("kendoExtDropDownList").value() !== '01'){
                        //등록 상태에서만 전송가능합니다.
                        dms.notification.warning("<spring:message code='par.info.sendStatMsg' />");
                        return false;
                    }

                    if(saveData.insertList.length > 0){
                        //등록라인 전송 실패하였습니다.
                        dms.notification.error("<spring:message code='global.info.isSaveRun'/>");
                        return false;
                    }
                    if(saveData.updateList.length > 0){
                        //수정라인 전송 실패하였습니다.
                        dms.notification.error("<spring:message code='global.info.isSaveRun'/>");
                        return false;
                    }
                    if(saveData.deleteList.length > 0){
                        //삭제라인 전송 실패하였습니다.
                        dms.notification.error("<spring:message code='global.info.isSaveRun'/>");
                        return false;
                    }

                    header = {
                        purcOrdTp       :lPurcOrdTp
                        , trsfTp          :$("#trsfTp").data("kendoExtDropDownList").value()
                        , bpCd            :$("#bpCd").val()
                        , purcOrdNo       :$("#purcOrdNo").val()
                        , purcOrdStatCd   :'02'
                        , remark          :$("#remark").val()
                        , purcParAmt      :$("#purcParAmt").data("kendoExtNumericTextBox").value()
                        , updtDtStr       :$("#updtDtStr").val()
                        , coPack          :$("#coPack").val()
                    };

                    if(rows.length  == 0 ){
                        // 선택값이 없습니다.
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }

                    rows.each(function(index, row) {
                        var gridData = grid.dataSource.at(index),
                            selectItem;
                        chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                        saveList.push(gridData);

                        if(chkRow === true){
                            lFirstCnt = lFirstCnt + 1;
                            if(!dms.string.isEmpty(lPurcOrdTp) && !dms.string.isEmpty(parSpecCdObj[lPurcOrdTp])){
                                if(!dms.string.isEmpty(parSpecCdObj[lPurcOrdTp]['specTp'])){
                                    if(!dms.string.isEmpty(gridData.parSpecCd)){
                                        if(!parSpecCdObj[lPurcOrdTp].hasOwnProperty(gridData.parSpecCd)){
                                            selectItem = gridData.itemCd;
                                            dms.notification.warning("<spring:message code='par.lbl.purcOrdTp' var='purcOrdTp' /><spring:message code='par.lbl.parSpecCd' var='parSpecCd' /><spring:message code='par.info.paramDiffMsg' arguments='${purcOrdTp},${parSpecCd},"+selectItem+"'/>");
                                            saveList = [];
                                            validationYn = 'N';
                                            return false;
                                        }
                                    }
                                }
                            }

                            if(lFirstCnt === 1){
                                lChkAOSucObj['ONE'] = gridData.sucCd;
                            }else{
                                //첫라인의 SUC가 'AO'인 경우 모든 라인이 'AO'여야함.
                                if(lChkAOSucObj['ONE'] === 'AO'){
                                    if(gridData.sucCd !== lChkAOSucObj['ONE']){
                                        dms.notification.warning("<spring:message code='par.info.sucAoOrder' />");
                                        saveList = [];
                                        validationYn = 'N';
                                        return false;
                                    }

                                    //첫라인의 SUC가 'AO'아닌 경우 1라인이라도 'AO'가 존재할 수 없음.
                                }else{
                                    if(gridData.sucCd === 'AO'){
                                        dms.notification.warning("<spring:message code='par.info.sucAoOrder' />");
                                        saveList = [];
                                        validationYn = 'N';
                                        return false;
                                    }
                                }
                            }
                        }else{
                            saveList = [];
                            return false;
                        }

                    });

                    if((saveList.length === rows.length) && (saveList.length > 0)){
                        var data ={
                            "purcOrdVO":header
                            ,"purcOrdItemList":saveList
                            ,"subOrderToken"  :$("#subOrderToken").val()
                        };

                        $("#btnSave").data("kendoButton").enable(false);
                        $("#btnCancel").data("kendoButton").enable(false);
                        $("#btnSend").data("kendoButton").enable(false);
                        $.ajax({
                            url:"<c:url value='/par/pcm/purcOrd/sendPurcOrd.do' />"
                            ,data:kendo.stringify(data)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:true
                            ,success:function(data) {
                                result = parseInt(data.code);
                                if (result === -1111) {
                                    dms.notification.error("订单重复提交");
                                }else{
                                    $("#subOrderToken").val(data.subOrderToken);
                                    if (result === 1) {
                                        //전송 완료 되었습니다.
                                        dms.notification.success("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.info.sendSuccessParam' arguments='${purcOrd}'/>");
                                        selectPurcOrd(pPurcOrdNo);
                                    }else if (result === -2222) {
                                        //전송 실패하였습니다.
                                        dms.notification.error("<spring:message code='global.err.amosCreateFailedParam'/>");
                                    }else if (result === -999) {
                                        //전송 실패하였습니다.
                                        dms.notification.error("<spring:message code='par.lbl.thisMonthOrdCntPerType' var='thisMonthOrdCntPerType' /><spring:message code='crm.info.maxInfoChk' arguments='${thisMonthOrdCntPerType},[36个]'/>");
                                    } else {
                                        if(result === 0){
                                            //전송 실패하였습니다.
                                            dms.notification.error("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.err.sendFailedParam' arguments='${purcOrd}'/>");
                                        }
                                    }
                                }
                            }
                            ,beforeSend:function(){
                                dms.loading.show($("#purcOrdSection"));
                            }
                            ,complete:function(){
                                dms.loading.hide($("#purcOrdSection"));
                            }
                            ,error:function(jqXHR,status,error) {
                                dms.loading.hide($("#purcOrdSection"));
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }

                        });

                    }else{
                        if(validationYn === 'Y'){
                            dms.notification.warning("<spring:message code='par.info.allCheckConfirm' />");
                        }
                    }
                }
            }
        });

        // 구매등록일자
        $("#purcRegDt").kendoDatePicker({
            format:"<dms:configValue code='dateFormat' />"
        });

        // 구매전송일자
        $("#sendDt").kendoDatePicker({
            format:"<dms:configValue code='dateFormat' />"
        });
        $("#purcOrdStatCd").data("kendoExtDropDownList").enable(false);

        /**
         * grid 구매단가
         */
        changePurcAmtEditor = function(container, options) {
            var input = $("<input/>"),
                pValue;

            input.attr("name", options.field);

            input.appendTo(container);
            input.kendoExtNumericTextBox({
                format: "n2"
                ,decimals:2
                ,restrictDecimals: true
                ,min:0
                ,spinners:false
            });
        };

        /**
         * grid 구매수량
         */
        changePurcQtyEditor = function(container, options) {
            var input = $("<input/>"),
                pValue;

            input.attr("name", options.field);

            input.blur(function(){
                if(options.model.purcQty > 9999){
                    dms.notification.info("<spring:message code='par.lbl.purcQty' var='purcQty' /><spring:message code='global.err.chkGreateParam' arguments='${purcQty},9999' />");
                    options.model.set("purcQty", 9999);
                }
            });

            input.appendTo(container);
            input.kendoExtNumericTextBox({
                format: "n0"
                ,decimals:0
                ,restrictDecimals: true
                ,min:0
                ,spinners:false
            });
        };


        /**
         * grid 입고창고 DropDownList
         */
        grStrgeCdDropDownEditor = function(container, options) {

            var purcItemTp  = options.model.purcItemTp;

            if(purcItemTp !== '01'){
                $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField: "cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:  grStrgeTpList
                    });
            }
        };

        /**
         * grid 부품번호 AutoComplete
         */
        itemCdAutoCompleteEditor = function(container, options) {

            gGridItemCdOrgVal = options.model.itemCd;

            $('<input id="gItemCd" data-bind="value:' + options.field + '" />')
                .appendTo(container)
                .kendoAutoComplete({
                    minLength:3
                    ,dataTextField:"itemCd"
                    ,dataSource:{
                        serverFiltering:true
                        ,transport:{
                            read:{
                                url:"<c:url value='/par/pmm/itemMaster/selectPurcPrcItemsForSuggest.do' />"
                                ,dataType:"json"
                                ,type:"POST"
                                ,contentType:"application/json"
                            }
                            ,parameterMap:function(options, operation)
                            {
                                if (operation === "read") {
                                    return kendo.stringify({
                                        "sItemCd"           :$("#gItemCd").data("kendoAutoComplete").value()//options.filter.filters[0].value
                                        ,"recordCountPerPage":10
                                        ,"sBpCd"             :$("#bpCd").val()
                                    });
                                }
                            }
                        }
                        ,schema:{
                            data:"data"
                            ,total:"total"
                        }
                    }
                    ,select:function(e) {
                        var tDate,
                            pVal,
                            grid           = $("#grid").data("kendoExtGrid"),
                            selectDataItem = {},
                            popItemData    = {},
                            currentRowIndex,
                            currentSelection = grid.select(),
                            sender = e.sender,
                            cellToEdit;

                        pVal   = e.item[0].textContent;
                        selectDataItem = this.dataItem(e.item.index());//e.sender.dataSource._data[e.item[0].getAttribute('data-offset-index')];

                        if(gGridItemCdOrgVal !== pVal){

                            if(existItemChkObj.hasOwnProperty(pVal)){
                                //이미 등록되어있는 부품입니다.
                                var itemInfo = pVal;
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");

                                currentSelection.each(function () {
                                    currentRowIndex = $(this).closest("tr").index();
                                });

                                if(currentSelection.length > 0){
                                    cellToEdit = grid.content.find("tr:eq("+ currentRowIndex +") td:eq(3)");
                                    grid.editCell(cellToEdit);
                                }


                                e.preventDefault();
                                $("#gItemCd").data("kendoAutoComplete").value(gGridItemCdOrgVal);


                                return false;
                            }

                            tDate = new Date();

                            if(dms.string.isEmpty(options.model.purcLeadHm)){
                                options.model.purcLeadHm = 0;
                            }

                            tDate.setDate(tDate.getDate() + Number(options.model.purcLeadHm));

                            if(dms.string.isEmpty($("#purcOrdNo").val())){
                                options.model.set('purcOrdNo', '');
                            }else{
                                options.model.set('purcOrdNo', $("#purcOrdNo").val());
                            }


                            /*
                            //options.model.set('purcOrdLineNo', '0000');
                            options.model.set('dlrCd', selectDataItem.dlrCd);
                            options.model.set('purcItemStatCd', '01');
                            options.model.set('purcItemTp', '03');
                            options.model.set('itemCd', selectDataItem.itemCd);
                            options.model.set('itemNm', selectDataItem.itemNm);
                            options.model.set('purcUnitCd', selectDataItem.stockUnitCd);
                            options.model.set('purcQty', 1);
                            options.model.set('resvStockQty', 0);
                            options.model.set('purcReqQty', 0);
                            options.model.set('purcPrc', selectDataItem.purcPrc);
                            options.model.set('purcAmt', selectDataItem.purcPrc);
                            options.model.set('taxDdctPrc', selectDataItem.purcPrc - (selectDataItem.purcPrc * gVatCd));
                            options.model.set('taxDdctAmt', selectDataItem.purcPrc - (selectDataItem.purcPrc * gVatCd));
                            options.model.set('prcTp', selectDataItem.prcTp);
                            options.model.set('purcReqNo', '');
                            options.model.set('purcReqLineNo', 0);
                            options.model.set('purcReqRegUsrId', '');
                            options.model.set('purcReqDt', tDate);
                            options.model.set('grStrgeCd', selectDataItem.grStrgeCd);
                            options.model.set('delYn', 'N');
                            options.model.set('grEndYn', 'N');
                            options.model.set('minPurcQty', selectDataItem.minPurcQty);
                            options.model.set('avlbStockQty', selectDataItem.avlbStockQty);
                            options.model.set('stockQty', selectDataItem.stockQty);
                            options.model.set('borrowQty', selectDataItem.borrowQty);
                            options.model.set('rentQty', selectDataItem.rentQty);

                            delete existItemChkObj[gGridItemCdOrgVal];

                            existItemChkObj[pVal] = pVal;
                            */

                            $.ajax({
                                url:"<c:url value='/par/pmm/itemMaster/selectPurcPrcItemByKey.do' />"
                                ,data:kendo.stringify({sItemCd:pVal, sBpCd:$("#bpCd").val()})
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,async:false
                                ,success:function(result) {
                                    var lPurcPrc = 0;

                                    if (result.total === 1) {

                                        lPurcPrc = fnSetPurcPrcApplyDcRate(result.data[0].purcPrc);

                                        tDate = new Date();

                                        if(dms.string.isEmpty(result.data[0].purcLeadHm)){
                                            result.data[0].purcLeadHm = 0;
                                        }

                                        tDate.setDate(tDate.getDate() + Number(result.data[0].purcLeadHm));

                                        if(dms.string.isEmpty($("#purcOrdNo").val())){
                                            options.model.set('purcOrdNo', '');
                                        }else{
                                            options.model.set('purcOrdNo', $("#purcOrdNo").val());
                                        }

                                        //options.model.set('purcOrdLineNo', '0000');
                                        options.model.set('dlrCd', result.data[0].dlrCd);
                                        options.model.set('purcItemStatCd', '01');
                                        options.model.set('purcItemTp', '03');
                                        options.model.set('itemCd', result.data[0].itemCd);
                                        options.model.set('itemNm', result.data[0].itemNm);
                                        options.model.set('purcUnitCd', result.data[0].stockUnitCd);
                                        options.model.set('purcQty', 1);
                                        options.model.set('resvStockQty', 0);
                                        options.model.set('purcReqQty', 0);
                                        options.model.set('purcPrc', lPurcPrc);
                                        options.model.set('purcAmt', lPurcPrc);
                                        options.model.set('taxDdctPrc', lPurcPrc / ( 1 + gVatCd ));
                                        options.model.set('taxDdctAmt', lPurcPrc / ( 1 + gVatCd ));
                                        //options.model.set('taxDdctPrc', result.data[0].purcPrc - (result.data[0].purcPrc * gVatCd));
                                        //options.model.set('taxDdctAmt', result.data[0].purcPrc - (result.data[0].purcPrc * gVatCd));
                                        options.model.set('prcTp', result.data[0].prcTp);
                                        options.model.set('purcReqNo', '');
                                        options.model.set('purcReqLineNo', 0);
                                        options.model.set('purcReqRegUsrId', '');
                                        options.model.set('purcReqDt', tDate);
                                        options.model.set('grStrgeCd', result.data[0].grStrgeCd);
                                        options.model.set('delYn', 'N');
                                        options.model.set('grEndYn', 'N');
                                        options.model.set('parSpecCd', result.data[0].parSpecCd);
                                        options.model.set('sucCd', result.data[0].sucCd);
                                        options.model.set('orgPurcPrc', result.data[0].purcPrc);

                                        delete existItemChkObj[gGridItemCdOrgVal];

                                        existItemChkObj[pVal] = pVal;

                                        currentSelection.each(function () {
                                            currentRowIndex = $(this).closest("tr").index();
                                        });

                                        //if(currentSelection.length > 0){
                                        //e.preventDefault();
                                        //cellToEdit = grid.content.find("tr:eq("+ currentRowIndex +") td:eq(11)");
                                        //grid.editCell(cellToEdit);
                                        //}

                                    } else {
                                        dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                                        options.model.set('itemCd', gGridItemCdOrgVal);
                                    }
                                }
                                ,error:function(jqXHR,status,error) {
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                    options.model.set('itemCd', gGridItemCdOrgVal);
                                }

                            });
                        }
                    }
                    ,dataBound:function(e) {

                    }
                    ,change:function(e) {
                        //e.preventDefault();

                        var tDate,
                            pVal,
                            grid           = $("#grid").data("kendoExtGrid"),
                            selectDataItem = {},
                            currentRowIndex,
                            currentSelection = grid.select(),
                            sender = e.sender,
                            cellToEdit;

                        pVal   = e.sender.element[0].value;

                        if(gGridItemCdOrgVal !== pVal){
                            if(existItemChkObj.hasOwnProperty(pVal)){

                                //이미 등록되어있는 부품입니다.
                                var itemInfo = pVal;
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");

                                currentSelection.each(function () {
                                    currentRowIndex = $(this).closest("tr").index();
                                });


                                if(currentSelection.length > 0){

                                    gExistYn = 'Y';
                                    cellToEdit = grid.content.find("tr:eq("+ currentRowIndex +") td:eq(3)");
                                    //grid.editCell(cellToEdit);
                                }
                                e.preventDefault();
                                $("#gItemCd").data("kendoAutoComplete").value(gGridItemCdOrgVal);

                                return false;
                            }


                            $.ajax({
                                url:"<c:url value='/par/pmm/itemMaster/selectPurcPrcItemByKey.do' />"
                                ,data:kendo.stringify({sItemCd:pVal, sBpCd:$("#bpCd").val()})
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,async:false
                                ,success:function(result) {

                                    var lPurcPrc = 0;

                                    if (result.total === 1) {

                                        lPurcPrc = fnSetPurcPrcApplyDcRate(result.data[0].purcPrc);

                                        tDate = new Date();

                                        if(dms.string.isEmpty(result.data[0].purcLeadHm)){
                                            result.data[0].purcLeadHm = 0;
                                        }

                                        tDate.setDate(tDate.getDate() + Number(result.data[0].purcLeadHm));

                                        if(dms.string.isEmpty($("#purcOrdNo").val())){
                                            options.model.set('purcOrdNo', '');
                                        }else{
                                            options.model.set('purcOrdNo', $("#purcOrdNo").val());
                                        }

                                        //options.model.set('purcOrdLineNo', '0000');
                                        options.model.set('dlrCd', result.data[0].dlrCd);
                                        options.model.set('purcItemStatCd', '01');
                                        options.model.set('purcItemTp', '03');
                                        options.model.set('itemCd', result.data[0].itemCd);
                                        options.model.set('itemNm', result.data[0].itemNm);
                                        options.model.set('purcUnitCd', result.data[0].stockUnitCd);
                                        options.model.set('purcQty', result.data[0].minPurcQty);
                                        options.model.set('resvStockQty', 0);
                                        options.model.set('purcReqQty', 0);
                                        options.model.set('purcPrc', lPurcPrc);
                                        options.model.set('purcAmt', lPurcPrc);
                                        options.model.set('taxDdctPrc', lPurcPrc / ( 1 + gVatCd ));
                                        options.model.set('taxDdctAmt', lPurcPrc / ( 1 + gVatCd ));
                                        options.model.set('prcTp', result.data[0].prcTp);
                                        options.model.set('purcReqNo', '');
                                        options.model.set('purcReqLineNo', 0);
                                        options.model.set('purcReqRegUsrId', '');
                                        options.model.set('purcReqDt', tDate);
                                        options.model.set('grStrgeCd', result.data[0].grStrgeCd);
                                        options.model.set('delYn', 'N');
                                        options.model.set('grEndYn', 'N');
                                        options.model.set('minPurcQty', result.data[0].minPurcQty);
                                        options.model.set('avlbStockQty', result.data[0].avlbStockQty);
                                        options.model.set('stockQty', result.data[0].stockQty);
                                        options.model.set('borrowQty', result.data[0].borrowQty);
                                        options.model.set('rentQty', result.data[0].rentQty);
                                        options.model.set('parSpecCd', result.data[0].parSpecCd);
                                        options.model.set('sucCd', result.data[0].sucCd);
                                        options.model.set('orgPurcPrc', result.data[0].purcPrc);

                                        delete existItemChkObj[gGridItemCdOrgVal];

                                        existItemChkObj[pVal] = pVal;

                                    } else {
                                        dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                                        options.model.set('itemCd', gGridItemCdOrgVal);
                                    }
                                }
                                ,error:function(jqXHR,status,error) {
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                    options.model.set('itemCd', gGridItemCdOrgVal);
                                }

                            });
                        }
                    }
                });
        };
        // 구매등록 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-1102-111859"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdItemByKey.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            // 구매오더 검색조건 코드.
                            params["sPurcOrdNo"] = $("#purcOrdNo").val();
                            params["sort"] = options.sort;

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function (result){
                        var dataLen = result.data.length;
                        for(var i = 0; i < dataLen; i = i + 1){
                            existItemChkObj[result.data[i].itemCd] = result.data[i].itemNm;
                        }

                        return result.data;
                    }
                    ,total:"total"
                    ,model:{
                        id:"purcOrdNo"
                        ,fields:{
                            dlrCd          :{ type:"string" , validation:{required:true} }
                            , rnum           :{ type:"number" , editable:false}
                            , purcOrdNo      :{ type:"string" }
                            , purcOrdLineNo  :{ type:"string" , editable:false}
                            , purcItemStatCd :{ type:"string" }
                            , purcItemTp     :{ type:"string"}
                            , itemCd         :{ type:"string"}
                            , itemNm         :{ type:"string"}
                            , purcUnitCd     :{ type:"string"}
                            , purcQty        :{ type:"number" }
                            , cancQty        :{ type:"number" }
                            , resvStockQty   :{ type:"number" }
                            , purcReqQty     :{ type:"number" }
                            , prcTp          :{ type:"string"}
                            , taxDdctPrc     :{ type:"number" }
                            , taxDdctAmt     :{ type:"number"}
                            , purcPrc        :{ type:"number" }
                            , purcAmt        :{ type:"number"}
                            , minPackQty     :{ type:"number"}
                            , minPurcQty     :{ type:"number"}
                            , avlbStockQty   :{ type:"number"}
                            , borrowQty      :{ type:"number"}
                            , rentQty        :{ type:"number"}
                            , stockQty       :{ type:"number"}
                            , purcReqNo      :{ type:"string"}
                            , purcReqLineNo  :{ type:"string"}
                            , grStrgeCd      :{ type:"string" }
                            , purcReqDt      :{ type:"date"   }
                            , delYn          :{ type:"string"}
                            , grEndYn        :{ type:"string"}
                            , purcReqRegUsrId:{ type:"string"}
                            , regUsrId       :{ type:"string"}
                            , purcRegDttmStr :{ type:"string"}
                            , purcSendDttmStr:{ type:"string"}
                            , editCd         :{ type:"string"}
                            , orgPurcPrc     :{ type:"number"}
                            , parSpecCd      :{ type:"string" , editable:false}
                            , sucCd          :{ type:"string" , editable:false}
                        }
                    }
                }
            }
            , selectable:"multiple"
            , scrollable:true
            , autoBind:false
            , multiSelectWithCheckbox:true
            , pageable:false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , filterable:false
            , edit:function(e){
                var eles         = e.container.find("input"),
                    grid         = this,
                    selectRows   = e.sender.select(),
                    selectedItem = e.sender.dataItem(selectRows[0]),
                    input        = e.container.find(".k-input"),
                    rows,
                    pValue,
                    tDate,
                    lPurcPrc  = 0,
                    fieldName = grid.columns[e.container.index()].field;

                if(fieldName === "resvStockQty"||fieldName === "purcAmt"||fieldName === "purcItemStatCd"||fieldName === "purcItemTp"
                    ||fieldName === "purcReqRegUsrId"||fieldName === "taxDdctAmt"||fieldName === "editCd"||fieldName === "sucCd"
                    ||fieldName === "minPurcQty"||fieldName === "rentQty"||fieldName === "avlbStockQty"||fieldName === "stockQty"||fieldName === "borrowQty"||fieldName === "rnum"){
                    this.closeCell();
                }else if(fieldName === "purcPrc"){

                    //공구구매 시 BMP여도 상관없이 단가입력가능
                    if(pItemDistinCd !== '07' && $("#bpTp").val() === '01'){
                        this.closeCell();
                    }else{
                        input.change(function(){
                            //input.blur(function(){
                            rows = e.sender.select(),
                                selectedItem = e.sender.dataItem(rows[0]);

                            pValue = selectedItem.purcPrc;

                            selectedItem.set("purcAmt", selectedItem.purcQty * pValue);
                            selectedItem.set("taxDdctPrc", pValue / ( 1 + gVatCd ));
                            selectedItem.set("taxDdctAmt", selectedItem.purcQty * (pValue / ( 1 + gVatCd )));

                            selectedItem.set("purcPrc", pValue);

                            calTotalAmt();
                        });
                    }

                }else if(fieldName === "taxDdctPrc"){
                    //10:BMP구매단가(세금제외)에서 Tab으로 이동된 경우(그리드 순서가 수정된 경우 수정해야함.)
                    if(input.prevObject.context.cellIndex = 11){

                        var rows = e.sender.tbody.children(),
                            currentRowIndex,
                            currentSelection = grid.select(),
                            sender = e.sender,
                            cellToEdit;

                        currentSelection.each(function () {
                            currentRowIndex = $(this).closest("tr").index();
                        });


                        if(rows.length > 0){
                            cellToEdit = sender.content.find("tr:eq("+ currentRowIndex +") td:eq(11)");
                            sender.editCell(cellToEdit);
                        }else{
                            this.closeCell();
                        }

                    }else{
                        this.closeCell();
                    }

                }else if(fieldName === "purcOrdLineNo"){

                    //5:부품번호에서 Back Tab으로 이동된 경우(그리드 순서가 수정된 경우 수정해야함.)
                    if(input.prevObject.context.cellIndex = 3){

                        if(!dms.string.isEmpty(e.sender._current.prevObject)){
                            //if(!dms.string.isEmpty(e.sender._current.prevObject[0].innerText)){
                            var rows = e.sender.tbody.children(),
                                currentRowIndex,
                                previousRowIndex,
                                currentSelection = grid.select(),
                                sender = e.sender,
                                cellToEdit;

                            currentSelection.each(function () {
                                currentRowIndex = $(this).closest("tr").index();
                            });

                            if(currentRowIndex === 0){
                                previousRowIndex = 0;
                            }else{
                                previousRowIndex = currentRowIndex - 1;
                            }

                            if(rows.length > 0){

                                if(previousRowIndex === 0 && currentRowIndex === 0){
                                    cellToEdit = sender.content.find("tr:eq("+ previousRowIndex +") td:eq(3)");
                                }else{
                                    cellToEdit = sender.content.find("tr:eq("+ previousRowIndex +") td:eq(11)");
                                    sender.content.find("tr:eq("+ previousRowIndex +")").addClass("k-state-selected");
                                    sender.content.find("tr:eq("+ currentRowIndex +")").removeClass("k-state-selected");
                                }
                                sender.editCell(cellToEdit);

                            }
                            //}
                        }

                    }
                }else if(fieldName === "itemCd"){
                    this.closeCell();
                    if(!dms.string.isEmpty(selectedItem)){
                        if(!dms.string.isEmpty(selectedItem.purcOrdNo)){
                            this.closeCell();
                        }
                    }

                }else if(fieldName === "itemNm"){
                    var rows = e.sender.tbody.children(),
                        currentRowIndex,
                        currentSelection = grid.select(),
                        sender = e.sender,
                        cellToEdit;

                    currentSelection.each(function () {
                        currentRowIndex = $(this).closest("tr").index();
                    });

                    if(gExistYn !== 'Y'){

                        //5:부품번호에서 Tab으로 이동된 경우(그리드 순서가 수정된 경우 수정해야함.)
                        if(input.prevObject.context.cellIndex = 6){

                            if(!dms.string.isEmpty(e.sender._current.prevObject)){
                                if(!dms.string.isEmpty(e.sender._current.prevObject[0].innerText)){

                                    if(rows.length > 0){

                                        cellToEdit = sender.content.find("tr:eq("+ currentRowIndex +") td:eq(11)");
                                        sender.editCell(cellToEdit);
                                    }
                                }else{

                                    cellToEdit = sender.content.find("tr:eq("+ currentRowIndex +") td:eq(3)");
                                    sender.editCell(cellToEdit);
                                }
                            }else{

                                cellToEdit = sender.content.find("tr:eq("+ currentRowIndex +") td:eq(3)");
                                sender.editCell(cellToEdit);
                            }

                        }else{
                            this.closeCell();
                        }
                    }else{
                        this.closeCell();
                        selectedItem.set("itemCd", gGridItemCdOrgVal);   // 부품번호
                        cellToEdit = sender.content.find("tr:eq("+ currentRowIndex +") td:eq(3)");
                        sender.editCell(cellToEdit);
                        gExistYn = 'N';
                        gGridItemCdOrgVal = '';
                        sender.content.find("tr:eq("+ currentRowIndex +")").addClass("k-state-selected");
                    }

                }else if(fieldName === "purcUnitCd"){

                    //15:수량에서 Back Tab으로 이동된 경우(그리드 순서가 수정된 경우 수정해야함.)
                    if(input.prevObject.context.cellIndex = 11){

                        if(!dms.string.isEmpty(e.sender._current.prevObject)){
                            //if(!dms.string.isEmpty(e.sender._current.prevObject[0].innerText)){
                            var rows = e.sender.tbody.children(),
                                currentRowIndex,
                                currentSelection = grid.select(),
                                sender = e.sender,
                                cellToEdit;

                            currentSelection.each(function () {
                                currentRowIndex = $(this).closest("tr").index();
                            });


                            if(rows.length > 0){
                                cellToEdit = sender.content.find("tr:eq("+ currentRowIndex +") td:eq(3)");
                                sender.editCell(cellToEdit);
                            }else{
                                this.closeCell();
                            }
                            //}
                        }else{
                            this.closeCell();
                        }

                    }else{
                        this.closeCell();
                    }
                }else if(fieldName === "purcQty"){

                    //input.change(function(){
                    input.blur(function(){
                        rows = e.sender.select(),
                            selectedItem = e.sender.dataItem(rows[0]);

                        if(pItemDistinCd !== '07' && $("#bpTp").val() === '01' ){
                            //TODO : [InBoShim] 최소포장수량  정수가 아니면틀리면 메시지 처리.
                            var purcQty    = selectedItem.purcQty;
                            var minPurcQty = selectedItem.minPurcQty;
                            var minPackQty = selectedItem.minPackQty;
                            var itemCd = selectedItem.itemCd;

                            //최소구매수량이 없거나 0이면 구매요청수량 그대로 입력함.
                            if(minPurcQty > 1){

                                if(purcQty < minPurcQty){
                                    purcQty    = minPurcQty;
                                }else{
                                    var ordPackQty = purcQty / minPurcQty;
                                    var checkPack = /^[0-9]{1,}$/.test(ordPackQty);

                                    if(checkPack === false || ordPackQty === 0){
                                        //구매수량은 최소포장수량의 배수입니다.
                                        dms.notification.info("["+itemCd+"] "+"<spring:message code='par.info.purcOrdMinPackMsg' />");
                                    }
                                }
                            }
                            /*
                            if(minPurcQty  > 0){ //최소구매수량이 0 보다 큰 경우에만 의미
                                var ordPackQty = purcQty / minPurcQty;
                                var checkPack = /^[0-9]{1,}$/.test(ordPackQty);

                                if(checkPack === false || ordPackQty === 0){
                                    dms.notification.info("["+itemCd+"] "+"<spring:message code='par.lbl.purcQty' var='purcQty' /><spring:message code='par.lbl.minPackQty' var='minPackQty' /><spring:message code='par.info.purcOrdCheckMsg' arguments='${purcQty},${minPackQty}' />");
                               }
                           }
                           */

                            pValue = Math.floor( purcQty);

                        }else{
                            pValue = Math.floor( selectedItem.purcQty);
                        }


                        selectedItem.set("purcAmt", selectedItem.purcPrc * pValue);
                        selectedItem.set("taxDdctPrc", selectedItem.purcPrc / ( 1 + gVatCd ));
                        selectedItem.set("taxDdctAmt", pValue * (selectedItem.purcPrc / ( 1 + gVatCd )));

                        selectedItem.set("purcQty", pValue);

                        calTotalAmt();



                    });

                }else if(fieldName === "cancQty"){
                    this.closeCell();
                    //15:구매수량에서 Tab으로 이동된 경우(그리드 순서가 수정된 경우 수정해야함.)
                    /*
                    if(input.prevObject.context.cellIndex = 11){

                        var rows = e.sender.tbody.children(),
                            currentRowIndex,
                            currentSelection = grid.select(),
                            sender = e.sender,
                            cellToEdit,
                            nextRowIndex;

                        currentSelection.each(function () {
                            currentRowIndex = $(this).closest("tr").index();
                        })

                        nextRowIndex = currentRowIndex + 1;

                        if(rows.length -1  === currentRowIndex){
                            fnAddRow(rows.length);
                            cellToEdit = sender.content.find("tr:eq("+ nextRowIndex +") td:eq(3)");
                        }else{
                            var nextRow = sender.content.find("tr:eq("+ nextRowIndex +") td:eq(3)");

                            if(dms.string.isEmpty(nextRow[0].textContent)){
                                //다음행의 품번이 없을 경우 품번으로 포커스
                                cellToEdit = sender.content.find("tr:eq("+ nextRowIndex +") td:eq(3)");
                            }else{
                                //다음행의 품번이 있을 경우 품번으로 포커스
                                cellToEdit = sender.content.find("tr:eq("+ nextRowIndex +") td:eq(11)");
                            }
                        }
                        sender.editCell(cellToEdit);
                        sender.content.find("tr:eq("+ nextRowIndex +")").addClass("k-state-selected");
                        sender.content.find("tr:eq("+ currentRowIndex +")").removeClass("k-state-selected");
                    }
                   */
                }

            }
            ,dataBound:function(e){
                rowNumber = 0;
            }
            , columns:[
                {title:"<spring:message code='par.lbl.no' />" ,field:"purcOrdLineNo" ,width:60,hidden:true}//Line
                ,{title:"<spring:message code='par.lbl.no' />", field:"rnum",width:40 ,attributes:{ "class":"ar"}
                    ,template  :"#= ++rowNumber #"
                }
                ,{title:"<spring:message code='par.lbl.itemCd' />" ,field:"itemCd" ,width:140
                    ,editor:itemCdAutoCompleteEditor
                }//부품번호
                ,{title:"<spring:message code='par.lbl.itemNm' />" ,field:"itemNm" ,width:200}//부품명
                ,{title:"<spring:message code='par.lbl.sucCd' />" ,field:"sucCd" ,width:60}
                ,{title:"<spring:message code='par.lbl.purcQty' />" ,field:"purcQty" ,width:60 ,attributes:{ "class":"ar"},format:"{0:n0}" ,decimal:0
                    ,editor:changePurcQtyEditor
                }//구매수량
                ,{title:"<spring:message code='par.lbl.purcOrcPrice' />",field:"purcPrc" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}",decimals:2
                    ,editor:changePurcAmtEditor
                }
                ,{title:"<spring:message code='par.lbl.purcPriceTax' />" ,field:"taxDdctPrc" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}
                ,{title:"<spring:message code='par.lbl.purcIncTaxAmt' />" ,field:"purcAmt" ,width:130 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}
                ,{title:"<spring:message code='par.lbl.purcAmt' />" ,field:"taxDdctAmt" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}
                ,{title:"<spring:message code='par.lbl.minPackQty' />" ,field:"minPurcQty" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n0}"}
                ,{title:"<spring:message code='par.lbl.minOrdQty' />" ,_field:"_minOrdQty",width:120 ,attributes:{ "class":"ar"} ,format:"{0:n0}", value:0
                    ,template:'0'
                }
                ,{title:"<spring:message code='par.lbl.purcOrdUnitNm' />" ,field:"purcUnitCd" ,width:80 ,attributes:{ "class":"ar"}
                    ,template:'#= changePurcUnit(purcUnitCd)#'
                }//단위
                ,{title:"<spring:message code='par.lbl.cancQty' />" ,field:"cancQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n0}" ,decimal:0}//취소수량
                ,{title:"<spring:message code='par.lbl.grStrgeCd' />" ,field:"grStrgeCd" ,width:100
                    ,editor:grStrgeCdDropDownEditor
                    ,template:'#= changeGrStrgeCd(grStrgeCd)#'
                    ,hidden:true
                }//입고창고
                ,{title:"<spring:message code='par.lbl.strgeStockQty' />" ,field:"stockQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//재고수량
                ,{title:"<spring:message code='par.lbl.avlbStockQty' />" ,field:"avlbStockQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//가용수량
                ,{title:"<spring:message code='par.lbl.realResvStockQty' />" ,field:"resvStockQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//예약수량
                ,{title:"<spring:message code='par.lbl.purcOrcRentQty' />" ,field:"rentQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//대여수량
                ,{title:"<spring:message code='par.lbl.borrowItemQty' />" ,field:"borrowQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//차입수량
                , {   //오더생성일시
                    title:"<spring:message code='par.lbl.ordCreateDttm' />"
                    ,field:"purcRegDttmStr"
                    ,width:140
                    ,attributes:{ "class":"ac"}
                }
                , {   //오더발송일시
                    title:"<spring:message code='par.lbl.ordSendDttm' />"
                    ,field:"purcSendDttmStr"
                    ,attributes:{ "class":"ac"}
                    ,width:140
                }
                ,{title:"<spring:message code='par.lbl.purcReqNo' />" ,field:"purcReqNo" ,width:200,hidden:true}//요청번호
                ,{title:"<spring:message code='par.lbl.no' />" ,field:"purcReqLineNo" ,width:200,hidden:true}//요청라인번호
                ,{//편수코드
                    field      :"editCd"
                    ,title     :"<spring:message code='par.lbl.amendCode' />"
                    ,width     :140
                    ,template  :'#= changeEditCd(editCd)#'
                }
                ,{title:"<spring:message code='par.lbl.parSpecCd' />" ,field:"parSpecCd" ,width:60,hidden:true}
                ,{title:"<spring:message code='par.lbl.purcOrcPrice' />" ,field:"orgPurcPrc" ,width:60,hidden:true}
            ]
        });

        // 입고 창고
        changeGrStrgeCd = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(grStrgeTpObj[val])){
                    returnVal = grStrgeTpObj[val];
                }
            }
            return returnVal;
        };

        // 생성유형
        changePurcItemTp = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(purcItemTpObj[val])){
                    returnVal = purcItemTpObj[val];
                }
            }
            return returnVal;
        };

        // 가격유형
        changePrcTp = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(prcTpObj[val])){
                    returnVal = prcTpObj[val];
                }
            }
            return returnVal;
        };

        // 구매단위
        changePurcUnit = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(purcUnitObj[val])){
                    returnVal = purcUnitObj[val];
                }
            }
            return returnVal;
        };

        // 구매상태
        changePurcOrdStat = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(purcOrdStatObj[val])){
                    returnVal = purcOrdStatObj[val];
                }
            }
            return returnVal;
        };

        //편수코드
        changeEditCd = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(!dms.string.isEmpty(ammendCodeObj[val])){
                    returnVal = ammendCodeObj[val];
                }
            }
            return returnVal;
        };

        initPage();
    });

    // 구매 정보 조회.
    function selectPurcOrd(pPurcOrdNo){

        //update by lyy 2018-11-09 采购订单提交后加载页面数据前再次提交修复 start
        $.ajax({
            url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdByKey.do' />",
            data:JSON.stringify({ sPurcOrdNo:pPurcOrdNo}),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            },beforeSend:function(){
                dms.loading.show($("#purcOrdSection"));
            }
            ,complete:function(){
                dms.loading.hide($("#purcOrdSection"));
            }
            ,error:function(jqXHR,status,error) {
                dms.loading.hide($("#purcOrdSection"));
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            //update by lyy 2018-11-09 采购订单提交后加载页面数据前再次提交修复 end
        }).done(function(result) {

            var ordStatCd;

            partsJs.validate.groupObjAllDataSet(result);

            ordStatCd = $("#purcOrdStatCd").data("kendoExtDropDownList").value();
            $("#grid").data("kendoExtGrid").dataSource._destroyed = [];
            $("#grid").data("kendoExtGrid").dataSource.data([]);    //2018.09.11 멀티저장 클릭 방지
            $("#grid").data("kendoExtGrid").dataSource.read();

            searchTrsfTp =  $("#trsfTp").data("kendoExtDropDownList").value();
            gCrud = "U";

            btnView(ordStatCd);
        });
    }

    // 구매 복사 적용.
    /*
    function selectCopyPurcOrd(pPurcOrdNo){

        $.ajax({
            url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdItemByKey.do' />",
            data:JSON.stringify({ sPurcOrdNo:pPurcOrdNo}),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }

        }).done(function(result) {



        });
    }
    */

    //부품 팝업 열기 함수.
    function selectItemPopupWindow(){
        var lParSpecArr;

        if(dms.string.isEmpty($("#purcOrdTp").data("kendoExtDropDownList").value())){
            lParSpecArr = '';
        }else{

            lParSpecArr = parSpecCdObj[$("#purcOrdTp").data("kendoExtDropDownList").value()]['specTpArr'];

            if(dms.string.isEmpty(lParSpecArr)){
                lParSpecArr = '';
            }else{
                lParSpecArr = lParSpecArr.join();
            }
        }


        itemByBpCdPopupWindow = dms.window.popup({
            windowId:"ItemMasterPopup"
            , title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
            , width:860
            , height:550
            , modal:true
            , content:{
                url:"<c:url value='/par/cmm/selectItemPopupForPurcOrd.do'/>"
                , data:{
                    "type":""
                    , "autoBind":false
                    , "bpCd":$("#bpCd").val()
                    , "bpNm":$("#bpNm").val()
                    , "bpTp":$("#bpTp").val()
                    , "itemDstinCd": pItemDistinCd
                    , "purcTp": lParSpecArr
                    , "selectable":"multiple"
                    , "callbackFunc":function(data){

                        var dataLen      = data.length,
                            gridData     = $("#grid").data("kendoExtGrid"),
                            lPurcOrdTp   = $("#purcOrdTp").data("kendoExtDropDownList").value(),
                            popItemData  = {},
                            lPurcPrc     = 0,
                            lPrcApplyDcRate,
                            tDate,
                            selectItem,
                            nonAvailItemInfo,
                            rows;


                        for(var i = 0; i < dataLen; i = i + 1){

                            lPurcPrc = 0;

                            lPurcPrc = fnSetPurcPrcApplyDcRate(data[i].purcPrc);
                            //lPurcPrc = data[i].purcPrc;
                            tDate = new Date();
                            if(dms.string.isEmpty(data[i].purcLeadHm)){
                                data[i].purcLeadHm = 0;
                            }

                            tDate.setDate(tDate.getDate() + Number(data[i].purcLeadHm));

                            if(!dms.string.isEmpty(lPurcOrdTp) && !dms.string.isEmpty(parSpecCdObj[lPurcOrdTp])){
                                if(!dms.string.isEmpty(parSpecCdObj[lPurcOrdTp]['specTp'])){
                                    if(!dms.string.isEmpty(data[i].parSpecCd)){
                                        if(!parSpecCdObj[lPurcOrdTp].hasOwnProperty(data[i].parSpecCd)){
                                            selectItem = data[i].itemCd;
                                            //par.lbl.purcOrdTp purcOrdTpObj[$("#purcOrdTp").data("kendoExtDropDownList").value()]
                                            //par.btn.save
                                            dms.notification.warning("<spring:message code='par.lbl.purcOrdTp' var='purcOrdTp' /><spring:message code='par.lbl.parSpecCd' var='parSpecCd' /><spring:message code='par.info.paramDiffMsg' arguments='${purcOrdTp},${parSpecCd},"+selectItem+"'/>");
                                            continue;
                                        }
                                    }/*else{
                                        selectItem = data[i].itemCd;
                                        //par.lbl.purcOrdTp purcOrdTpObj[$("#purcOrdTp").data("kendoExtDropDownList").value()]
                                        //par.btn.save
                                        dms.notification.warning("<spring:message code='par.lbl.purcOrdTp' var='purcOrdTp' /><spring:message code='par.lbl.parSpecCd' var='parSpecCd' /><spring:message code='par.info.paramDiffMsg' arguments='${purcOrdTp},${parSpecCd},"+selectItem+"'/>");
                                        continue;
                                    }*/
                                }
                            }

                            if(!dms.string.isEmpty(data[i].sucCd)){
                                if(sucCdObj.hasOwnProperty(data[i].sucCd)){
                                    if(dms.string.isEmpty(nonAvailItemInfo)){
                                        nonAvailItemInfo = "<spring:message code='par.info.sucCdItemMsg' arguments='[" + data[i].itemCd + "],["+data[i].sucCd+"]'/>  <br>";//"配件 [" + data[i].itemCd + "] 供应代码为 [" + data[i].sucCd + "] 所以不能提报 <br>";
                                    }else{
                                        nonAvailItemInfo = nonAvailItemInfo + "<spring:message code='par.info.sucCdItemMsg' arguments='[" + data[i].itemCd + "],["+data[i].sucCd+"]'/>  <br>";
                                    }

                                    continue;
                                }
                            }

                            //팝업에서 구매수량을 입력할수 있도록 하여, 삭제 예정
                            /* var vMinPurcQty = 1;
                            if($("#bpTp").val() === '01' ){

                                if(dms.string.isEmpty(data[i].minPurcQty) || Number(data[i].minPurcQty) === 0){
                                    vMinPurcQty = 1;
                                }else{
                                    vMinPurcQty = data[i].minPurcQty;
                                }
                            } */

                            popItemData.dlrCd          = data[i].dlrCd;
                            popItemData.purcItemTp     = "03";
                            popItemData.purcItemStatCd = "01";
                            if(dms.string.isEmpty(data[i].grStrgeCd)){
                                //popItemData.grStrgeCd      = grStrgeTpList[0].cmmCd;
                                popItemData.grStrgeCd      = 'WHP1';
                            }else{
                                popItemData.grStrgeCd      = data[i].grStrgeCd;
                            }
                            popItemData.itemCd         = data[i].itemCd;
                            popItemData.itemNm         = data[i].itemNm;
                            popItemData.purcUnitCd     = data[i].stockUnitCd;
                            popItemData.purcQty        = data[i].purcQty;
                            popItemData.resvStockQty   = data[i].resvStockQty;
                            popItemData.purcReqQty     = 0;
                            popItemData.purcPrc        = lPurcPrc;
                            popItemData.purcAmt        = (data[i].purcQty * lPurcPrc);
                            popItemData.taxDdctPrc     = lPurcPrc / ( 1 + gVatCd );
                            popItemData.taxDdctAmt     = data[i].purcQty * (lPurcPrc / ( 1 + gVatCd ));
                            popItemData.prcTp          = "01";  //구매가
                            popItemData.delYn          = "N";
                            popItemData.grEndYn        = "N";
                            popItemData.purcReqDt      = tDate;
                            if(dms.string.isEmpty(data[i].minPurcQty) || Number(data[i].minPurcQty) === 0){
                                popItemData.minPurcQty = 1;
                            }else{
                                popItemData.minPurcQty     = data[i].minPurcQty;                        //최소구매수량
                            }
                            popItemData.minPackQty     = data[i].minPackQty;
                            popItemData.avlbStockQty   = data[i].avlbStockQty;
                            popItemData.stockQty       = data[i].stockQty;
                            popItemData.borrowQty      = data[i].borrowQty;
                            popItemData.rentQty        = data[i].rentQty;
                            popItemData.editCd         = '';
                            popItemData.parSpecCd      = data[i].parSpecCd;
                            popItemData.sucCd          = data[i].sucCd;
                            popItemData.orgPurcPrc     = data[i].purcPrc;

                            if(existItemChkObj.hasOwnProperty(data[i].itemCd)){
                                //이미 등록되어있는 부품입니다.
                                var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                            }else{
                                existItemChkObj[data[i].itemCd] = data[i].itemNm;
                                gridData.dataSource.add(popItemData);
                            }
                        }

                        if(!dms.string.isEmpty(nonAvailItemInfo)){
                            dms.notification.warning(nonAvailItemInfo);
                        }

                        gridData.select(gridData.tbody.find(">tr"));
                        itemByBpCdPopupWindow.close();

                        calTotalAmt();
                    }
                }
            }
        });
    }

    //구매오더 복사 팝업 열기 함수.
    function selectPrevPurcOrdPopupWindow(){

        prevPurcOrdPopupWindow = dms.window.popup({
            windowId:"PrevPurcOrdPopup"
            , title:"<spring:message code='par.title.purcOrdCopy' />"   // 구매오더 복사
            , width:860
            , height:520
            , content:{
                url:"<c:url value='/par/cmm/selectPrevPurcOrdPopup.do'/>"
                , data:{
                    "type":""
                    , "autoBind":false
                    , "bpCd":$("#bpCd").val()
                    , "bpNm":$("#bpNm").val()
                    ,"itemDstinCd":pItemDistinCd
                    , "selectable":"single"
                    , "callbackFunc":function(data){


                        var dataLen      = data.length,
                            gridData     = $("#grid").data("kendoExtGrid"),
                            lPurcOrdTp   = $("#purcOrdTp").data("kendoExtDropDownList").value(),
                            popPrevData  = {},
                            lPurcPrc     = 0,
                            nonAvailItemInfo,
                            selectItem,
                            tDate;

                        for(var i = 0; i < dataLen; i = i + 1){
                            tDate = new Date();

                            lPurcPrc = 0;

                            lPurcPrc = fnSetPurcPrcApplyDcRate(data[i].purcPrc);

                            if(dms.string.isEmpty(data[i].purcLeadHm)){
                                data[i].purcLeadHm = 0;
                            }

                            tDate.setDate(tDate.getDate() + Number(data[i].purcLeadHm));

                            if(!dms.string.isEmpty(lPurcOrdTp) && !dms.string.isEmpty(parSpecCdObj[lPurcOrdTp])){
                                if(!dms.string.isEmpty(parSpecCdObj[lPurcOrdTp]['specTp'])){
                                    if(!dms.string.isEmpty(data[i].parSpecCd)){
                                        if(!parSpecCdObj[lPurcOrdTp].hasOwnProperty(data[i].parSpecCd)){
                                            selectItem = data[i].itemCd;
                                            //par.lbl.purcOrdTp purcOrdTpObj[$("#purcOrdTp").data("kendoExtDropDownList").value()]
                                            //par.btn.save
                                            dms.notification.warning("<spring:message code='par.lbl.purcOrdTp' var='purcOrdTp' /><spring:message code='par.lbl.parSpecCd' var='parSpecCd' /><spring:message code='par.info.paramDiffMsg' arguments='${purcOrdTp},${parSpecCd},"+selectItem+"'/>");
                                            continue;
                                        }
                                    }/*else{
                                        selectItem = data[i].itemCd;
                                        //par.lbl.purcOrdTp purcOrdTpObj[$("#purcOrdTp").data("kendoExtDropDownList").value()]
                                        //par.btn.save
                                        dms.notification.warning("<spring:message code='par.lbl.purcOrdTp' var='purcOrdTp' /><spring:message code='par.lbl.parSpecCd' var='parSpecCd' /><spring:message code='par.info.paramDiffMsg' arguments='${purcOrdTp},${parSpecCd},"+selectItem+"'/>");
                                        continue;
                                    }*/
                                }
                            }

                            if(!dms.string.isEmpty(data[i].sucCd)){
                                if(sucCdObj.hasOwnProperty(data[i].sucCd)){
                                    if(dms.string.isEmpty(nonAvailItemInfo)){
                                        nonAvailItemInfo = "<spring:message code='par.info.sucCdItemMsg' arguments='[" + data[i].itemCd + "],["+data[i].sucCd+"]'/>  <br>";//"配件 [" + data[i].itemCd + "] 供应代码为 [" + data[i].sucCd + "] 所以不能提报 <br>";
                                    }else{
                                        nonAvailItemInfo = nonAvailItemInfo + "<spring:message code='par.info.sucCdItemMsg' arguments='[" + data[i].itemCd + "],["+data[i].sucCd+"]'/>  <br>";
                                    }

                                    continue;
                                }
                            }

                            popPrevData.dlrCd          = data[i].dlrCd;
                            popPrevData.purcItemTp     = "03";
                            popPrevData.purcItemStatCd = "01";
                            if(dms.string.isEmpty(data[i].grStrgeCd)){
                                //popPrevData.grStrgeCd      = grStrgeTpList[0].cmmCd;
                                popPrevData.grStrgeCd      = 'WHP1';
                            }else{
                                popPrevData.grStrgeCd      = data[i].grStrgeCd;
                            }

                            if(dms.string.isEmpty(data[i].minPurcQty) || Number(data[i].minPurcQty) === 0){
                                popPrevData.minPurcQty = 1;
                            }else{
                                popPrevData.minPurcQty = data[i].minPurcQty;
                            }
                            popPrevData.itemCd         = data[i].itemCd;
                            popPrevData.itemNm         = data[i].itemNm;
                            popPrevData.purcUnitCd     = data[i].purcUnitCd;
                            popPrevData.purcQty        = data[i].purcQty;
                            popPrevData.resvStockQty   = data[i].resvStockQty;
                            popPrevData.purcReqQty     = 0;
                            popPrevData.purcPrc        = lPurcPrc;
                            popPrevData.purcAmt        = lPurcPrc * data[i].purcQty;
                            popPrevData.taxDdctPrc     = (lPurcPrc / ( 1 + gVatCd )).toFixed(2);
                            popPrevData.taxDdctAmt     = (lPurcPrc * (data[i].purcQty / ( 1 + gVatCd ))).toFixed(2);
                            popPrevData.prcTp          = data[i].prcTp;
                            popPrevData.delYn          = "N";
                            popPrevData.grEndYn        = "N";
                            popPrevData.purcReqDt      = tDate;
                            popPrevData.avlbStockQty   = data[i].avlbStockQty;
                            popPrevData.stockQty       = data[i].stockQty;
                            popPrevData.borrowQty      = data[i].borrowQty;
                            popPrevData.rentQty        = data[i].rentQty;
                            popPrevData.editCd         = '';
                            popPrevData.parSpecCd      = data[i].parSpecCd;
                            popPrevData.sucCd          = data[i].sucCd;
                            popPrevData.orgPurcPrc     = data[i].purcPrc;

                            if(existItemChkObj.hasOwnProperty(data[i].itemCd)){
                                //이미 등록되어있는 부품입니다.
                                var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                            }else{
                                existItemChkObj[data[i].itemCd] = data[i].itemNm;
                                gridData.dataSource.add(popPrevData);
                            }
                        }

                        if(!dms.string.isEmpty(nonAvailItemInfo)){
                            dms.notification.warning(nonAvailItemInfo);
                        }

                        prevPurcOrdPopupWindow.close();

                        calTotalAmt();

                    }
                }
            }
        });
    }

    //구매요청 추가 팝업 열기 함수.
    function selectPurcReqPopupWindow(){

        purcReqPopupWindow = dms.window.popup({
            windowId:"PurcReqPopup"
            , title:"<spring:message code='par.title.addPurcReq' />"   // 구매요청 추가
            ,width:840
            ,height:420
            , content:{
                url:"<c:url value='/par/cmm/selectPurcReqPopup.do'/>"
                , data:{
                    "type":""
                    , "autoBind":false
                    , "bpCd":$("#bpCd").val()
                    , "bpNm":$("#bpNm").val()
                    , "bpTp":$("#bpTp").val()
                    ,"itemDstinCd":pItemDistinCd
                    , "selectable":"single"
                    , "callbackFunc":function(data){

                        var dataLen        = data.length,
                            gridData       = $("#grid").data("kendoExtGrid"),
                            lPurcOrdTp     = $("#purcOrdTp").data("kendoExtDropDownList").value(),
                            popItemData    = {},
                            saveList       = [],
                            purcReqNoList  = [],
                            existReqObj    = {},
                            lMinPurc       = 0,
                            lPurcPrc       = 0,
                            nonAvailItemInfo,
                            selectItem,
                            //purcReqObj     = {},
                            //purcReqObjLst  = [],
                            tDate;



                        for(var i = 0; i < dataLen; i = i + 1){

                            if(existItemChkObj.hasOwnProperty(data[i].itemCd)){
                                //이미 등록되어있는 부품입니다.
                                var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                            }else{
                                //purcReqObj = {};

                                if(!dms.string.isEmpty(lPurcOrdTp) && !dms.string.isEmpty(parSpecCdObj[lPurcOrdTp])){
                                    if(!dms.string.isEmpty(parSpecCdObj[lPurcOrdTp]['specTp'])){
                                        if(!dms.string.isEmpty(data[i].parSpecCd)){
                                            if(!parSpecCdObj[lPurcOrdTp].hasOwnProperty(data[i].parSpecCd)){
                                                selectItem = data[i].itemCd;
                                                //par.lbl.purcOrdTp purcOrdTpObj[$("#purcOrdTp").data("kendoExtDropDownList").value()]
                                                //par.btn.save
                                                dms.notification.warning("<spring:message code='par.lbl.purcOrdTp' var='purcOrdTp' /><spring:message code='par.lbl.parSpecCd' var='parSpecCd' /><spring:message code='par.info.paramDiffMsg' arguments='${purcOrdTp},${parSpecCd},"+selectItem+"'/>");
                                                continue;
                                            }
                                        }/*else{
                                            selectItem = data[i].itemCd;
                                            //par.lbl.purcOrdTp purcOrdTpObj[$("#purcOrdTp").data("kendoExtDropDownList").value()]
                                            //par.btn.save
                                            dms.notification.warning("<spring:message code='par.lbl.purcOrdTp' var='purcOrdTp' /><spring:message code='par.lbl.parSpecCd' var='parSpecCd' /><spring:message code='par.info.paramDiffMsg' arguments='${purcOrdTp},${parSpecCd},"+selectItem+"'/>");
                                            continue;
                                        }*/
                                    }
                                }

                                if(!dms.string.isEmpty(data[i].sucCd)){
                                    if(sucCdObj.hasOwnProperty(data[i].sucCd)){
                                        if(dms.string.isEmpty(nonAvailItemInfo)){
                                            nonAvailItemInfo = "<spring:message code='par.info.sucCdItemMsg' arguments='[" + data[i].itemCd + "],["+data[i].sucCd+"]'/>  <br>";//"配件 [" + data[i].itemCd + "] 供应代码为 [" + data[i].sucCd + "] 所以不能提报 <br>";
                                        }else{
                                            nonAvailItemInfo = nonAvailItemInfo + "<spring:message code='par.info.sucCdItemMsg' arguments='[" + data[i].itemCd + "],["+data[i].sucCd+"]'/>  <br>";
                                        }

                                        continue;
                                    }
                                }

                                lPurcPrc = 0;

                                lPurcPrc = fnSetPurcPrcApplyDcRate(data[i].purcPrc);

                                tDate = new Date();
                                if(dms.string.isEmpty(data[i].purcLeadHm)){
                                    data[i].purcLeadHm = 0;
                                }

                                tDate.setDate(tDate.getDate() + Number(data[i].purcLeadHm));

                                /*
                                if(dms.string.isEmpty(data[i].grStrgeCd)){
                                    //purcReqObj.grStrgeCd      = grStrgeTpList[0].cmmCd;
                                    purcReqObj.grStrgeCd      = 'WHP1';
                                }else{
                                    purcReqObj.grStrgeCd      = data[i].grStrgeCd;
                                }
                                purcReqObj.itemCd         = data[i].itemCd;

                                purcReqObj.purcReqNo      = data[i].purcReqNo;
                                purcReqObj.purcReqLineNo  = data[i].purcReqLineNo;
                                purcReqObj.purcReqQty     = data[i].purcReqQty;
                                purcReqObj.bpCd           = $("#bpCd").val();
                                */

                                if(existReqObj.hasOwnProperty(data[i].itemCd)){

                                    existReqObj[data[i].itemCd].purcQty        = existReqObj[data[i].itemCd].purcQty + data[i].purcReqQty;
                                    existReqObj[data[i].itemCd].purcReqQty     = existReqObj[data[i].itemCd].purcReqQty + data[i].purcReqQty;
                                    existReqObj[data[i].itemCd].purcReqNo      = existReqObj[data[i].itemCd].purcReqNo + ',' + data[i].purcReqNo;
                                    existReqObj[data[i].itemCd].purcReqLineNo  = existReqObj[data[i].itemCd].purcReqQty + ',' + data[i].purcReqQty;
                                }else{
                                    popItemData = {};

                                    popItemData.dlrCd          = data[i].dlrCd;
                                    popItemData.purcItemTp     = "01";
                                    popItemData.purcItemStatCd = "01";
                                    if(dms.string.isEmpty(data[i].grStrgeCd)){
                                        //popItemData.grStrgeCd      = grStrgeTpList[0].cmmCd;
                                        popItemData.grStrgeCd      = 'WHP1';
                                    }else{
                                        popItemData.grStrgeCd      = data[i].grStrgeCd;
                                    }

                                    if(dms.string.isEmpty(data[i].minPurcQty) || Number(data[i].minPurcQty) === 0){
                                        popItemData.minPurcQty = 1;
                                    }else{
                                        popItemData.minPurcQty     = data[i].minPurcQty;
                                    }
                                    popItemData.itemCd         = data[i].itemCd;
                                    popItemData.itemNm         = data[i].itemNm;
                                    popItemData.purcUnitCd     = data[i].purcReqUnitCd;
                                    popItemData.purcQty        = data[i].purcReqQty;
                                    popItemData.resvStockQty   = data[i].resvStockQty;
                                    popItemData.purcReqQty     = data[i].purcReqQty;
                                    popItemData.purcPrc        = lPurcPrc;
                                    popItemData.purcAmt        = data[i].purcReqQty * lPurcPrc;
                                    popItemData.taxDdctPrc     = lPurcPrc / ( 1 + gVatCd );
                                    popItemData.taxDdctAmt     = data[i].purcReqQty * (lPurcPrc / ( 1 + gVatCd ));
                                    popItemData.purcReqNo      = data[i].purcReqNo;
                                    popItemData.purcReqLineNo  = data[i].purcReqQty; //구매요청라인번호에 구매수량리스트를 넣을것임.
                                    //popItemData.purcReqLineNo  = data[i].purcReqLineNo;
                                    popItemData.prcTp          = "01";  //구매가
                                    popItemData.delYn          = "N";
                                    popItemData.grEndYn        = "N";
                                    popItemData.regUsrId       = data[i].regUsrId;
                                    popItemData.purcReqDt      = tDate;
                                    popItemData.avlbStockQty   = data[i].avlbStockQty;
                                    popItemData.stockQty       = data[i].stockQty;
                                    popItemData.borrowQty      = data[i].borrowQty;
                                    popItemData.rentQty        = data[i].rentQty;
                                    popItemData.editCd         = '';
                                    popItemData.parSpecCd      = data[i].parSpecCd;
                                    popItemData.sucCd          = data[i].sucCd;
                                    popItemData.orgPurcPrc     = data[i].purcPrc;

                                    existReqObj[data[i].itemCd] = popItemData;
                                }

                                //saveList.push(purcReqObj);
                            }

                        }

                        if(!dms.string.isEmpty(nonAvailItemInfo)){
                            dms.notification.warning(nonAvailItemInfo);
                        }

                        for(var key in existReqObj){

                            if($("#bpTp").val() === '01' ){
                                //최소구매수량이 없거나 0이면 구매요청수량 그대로 입력함.
                                if(existReqObj[key].minPurcQty > 1){

                                    if(existReqObj[key].purcQty < existReqObj[key].minPurcQty){
                                        existReqObj[key].purcQty    = existReqObj[key].minPurcQty;
                                        existReqObj[key].purcAmt    = existReqObj[key].minPurcQty * existReqObj[key].purcPrc;
                                        existReqObj[key].taxDdctAmt = existReqObj[key].minPurcQty * ( existReqObj[key].purcPrc / ( 1 + gVatCd ) );
                                    }else{
                                        lMinPurc = Math.ceil(existReqObj[key].purcQty/existReqObj[key].minPurcQty);
                                        existReqObj[key].purcQty    = existReqObj[key].minPurcQty * lMinPurc;
                                        existReqObj[key].purcAmt    = (existReqObj[key].minPurcQty * lMinPurc) * existReqObj[key].purcPrc;
                                        existReqObj[key].taxDdctAmt = existReqObj[key].minPurcQty * lMinPurc * (existReqObj[key].purcPrc / ( 1 + gVatCd ));
                                    }
                                }else{
                                    existReqObj[key].purcAmt    = existReqObj[key].purcQty * existReqObj[key].purcPrc;
                                    existReqObj[key].taxDdctAmt = existReqObj[key].purcQty * (existReqObj[key].purcPrc / ( 1 + gVatCd ));
                                }
                            }else{
                                existReqObj[key].purcAmt    = existReqObj[key].purcQty * existReqObj[key].purcPrc;
                                existReqObj[key].taxDdctAmt = existReqObj[key].purcQty * (existReqObj[key].purcPrc / ( 1 + gVatCd ));
                            }


                            existItemChkObj[existReqObj[key].itemCd] = existReqObj[key].itemNm;

                            gridData.dataSource.add(existReqObj[key]);
                        }


                        /*
                        if(saveList.length > 0){
                            data ={
                                    "purcRqstItemList":saveList
                            };

                            $.ajax({
                                url:"<c:url value='/par/pcm/purcRqst/updatePurcRqstCnfmByPurcOrd.do' />"
                               ,data:kendo.stringify(saveList)
                               ,type:'POST'
                               ,dataType:'json'
                               ,contentType:'application/json'
                               ,async:false
                               ,success:function(result) {
                                   var lMinPurc = 0;
                                   if (result === true) {
                                       for(var key in existReqObj){
                                           if($("#bpTp").val() === '01' ){
                                               //최소구매수량이 없거나 0이면 구매요청수량 그대로 입력함.
                                               if(existReqObj[key].minPurcQty > 1){

                                                   if(existReqObj[key].purcQty < existReqObj[key].minPurcQty){
                                                       existReqObj[key].purcQty    = existReqObj[key].minPurcQty;
                                                       existReqObj[key].purcAmt    = existReqObj[key].minPurcQty * existReqObj[key].purcPrc;
                                                       existReqObj[key].taxDdctAmt = existReqObj[key].minPurcQty * (existReqObj[key].purcPrc / ( 1 + gVatCd ));
                                                   }else{
                                                       lMinPurc = Math.ceil(existReqObj[key].purcQty/existReqObj[key].minPurcQty);
                                                       existReqObj[key].purcQty    = existReqObj[key].minPurcQty * lMinPurc;
                                                       existReqObj[key].purcAmt    = (existReqObj[key].minPurcQty * lMinPurc) * existReqObj[key].purcPrc;
                                                       existReqObj[key].taxDdctAmt = (existReqObj[key].minPurcQty * lMinPurc) * (existReqObj[key].purcPrc / ( 1 + gVatCd ));
                                                   }
                                               }else{
                                                   existReqObj[key].purcAmt    = existReqObj[key].purcQty * existReqObj[key].purcPrc;
                                                   existReqObj[key].taxDdctAmt = existReqObj[key].purcQty * (existReqObj[key].purcPrc / ( 1 + gVatCd ));
                                               }
                                           }else{
                                               existReqObj[key].purcAmt    = existReqObj[key].purcQty * existReqObj[key].purcPrc;
                                               existReqObj[key].taxDdctAmt = existReqObj[key].purcQty * (existReqObj[key].purcPrc / ( 1 + gVatCd ));
                                           }


                                           gridData.dataSource.add(existReqObj[key]);
                                       }

                                   } else {
                                       if(result === 0){
                                           dms.notification.error("<spring:message code='par.lbl.purcOrd' var='purcOrd' /><spring:message code='global.err.regFailedParam' arguments='${purcOrd}'/>");
                                       }
                                   }

                               }
                               ,error:function(jqXHR,status,error) {
                                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                               }

                           });
                        }
                        */

                        gridData.select(gridData.tbody.find(">tr"));

                        purcReqPopupWindow.close();

                        calTotalAmt();

                    }
                }
            }
        });
    }

    //구매제시 팝업 열기 함수.
    function selectPurcCostSgstPopupWindow(){

        purcCostSgstPopupWindow = dms.window.popup({
            windowId:"PurcCostSgstPopup"
            , title:"<spring:message code='par.title.addPurcCostSgst' />"   // 구매제시 추가
            , width:740
            , height:400
            , content:{
                url:"<c:url value='/par/cmm/selectPurcCostSgstPopup.do'/>"
                , data:{
                    "type":""
                    , "autoBind":false
                    , "bpCd":$("#bpCd").val()
                    , "bpNm":$("#bpNm").val()
                    , "bpTp":$("#bpTp").val()
                    ,"itemDstinCd":pItemDistinCd
                    , "selectable":"single"
                    , "callbackFunc":function(data){



                        var dataLen      = data.length,
                            gridData     = $("#grid").data("kendoExtGrid"),
                            lPurcOrdTp   = $("#purcOrdTp").data("kendoExtDropDownList").value(),
                            popPrevData  = {},
                            lPurcPrc     = 0,
                            nonAvailItemInfo,
                            selectItem,
                            tDate;

                        for(var i = 0; i < dataLen; i = i + 1){
                            tDate = new Date();

                            lPurcPrc = 0;
                            lPurcPrc = fnSetPurcPrcApplyDcRate(data[i].purcPrc);

                            if(dms.string.isEmpty(data[i].purcLeadHm)){
                                data[i].purcLeadHm = 0;
                            }

                            tDate.setDate(tDate.getDate() + Number(data[i].purcLeadHm));

                            if(!dms.string.isEmpty(lPurcOrdTp) && !dms.string.isEmpty(parSpecCdObj[lPurcOrdTp])){
                                if(!dms.string.isEmpty(parSpecCdObj[lPurcOrdTp]['specTp'])){
                                    if(!dms.string.isEmpty(data[i].parSpecCd)){
                                        if(!parSpecCdObj[lPurcOrdTp].hasOwnProperty(data[i].parSpecCd)){
                                            selectItem = data[i].itemCd;
                                            //par.lbl.purcOrdTp purcOrdTpObj[$("#purcOrdTp").data("kendoExtDropDownList").value()]
                                            //par.btn.save
                                            dms.notification.warning("<spring:message code='par.lbl.purcOrdTp' var='purcOrdTp' /><spring:message code='par.lbl.parSpecCd' var='parSpecCd' /><spring:message code='par.info.paramDiffMsg' arguments='${purcOrdTp},${parSpecCd},"+selectItem+"'/>");
                                            continue;
                                        }
                                    }/*else{
                                        selectItem = data[i].itemCd;
                                        //par.lbl.purcOrdTp purcOrdTpObj[$("#purcOrdTp").data("kendoExtDropDownList").value()]
                                        //par.btn.save
                                        dms.notification.warning("<spring:message code='par.lbl.purcOrdTp' var='purcOrdTp' /><spring:message code='par.lbl.parSpecCd' var='parSpecCd' /><spring:message code='par.info.paramDiffMsg' arguments='${purcOrdTp},${parSpecCd},"+selectItem+"'/>");
                                        continue;
                                    }*/
                                }
                            }

                            if(!dms.string.isEmpty(data[i].sucCd)){
                                if(sucCdObj.hasOwnProperty(data[i].sucCd)){
                                    if(dms.string.isEmpty(nonAvailItemInfo)){
                                        nonAvailItemInfo = "<spring:message code='par.info.sucCdItemMsg' arguments='[" + data[i].itemCd + "],["+data[i].sucCd+"]'/>  <br>";//"配件 [" + data[i].itemCd + "] 供应代码为 [" + data[i].sucCd + "] 所以不能提报 <br>";
                                    }else{
                                        nonAvailItemInfo = nonAvailItemInfo + "<spring:message code='par.info.sucCdItemMsg' arguments='[" + data[i].itemCd + "],["+data[i].sucCd+"]'/>  <br>";
                                    }

                                    continue;
                                }
                            }

                            popPrevData.dlrCd          = data[i].dlrCd;
                            popPrevData.purcItemTp     = "02";
                            popPrevData.purcItemStatCd = "01";
                            if(dms.string.isEmpty(data[i].grStrgeCd)){
                                //popPrevData.grStrgeCd      = grStrgeTpList[0].cmmCd;
                                popPrevData.grStrgeCd      = 'WHP1';
                            }else{
                                popPrevData.grStrgeCd      = data[i].grStrgeCd;
                            }

                            if(dms.string.isEmpty(data[i].minPurcQty) || Number(data[i].minPurcQty) === 0){
                                popPrevData.minPurcQty = 1;
                            }else{
                                popPrevData.minPurcQty     = data[i].minPurcQty;
                            }

                            popPrevData.itemCd         = data[i].itemCd;
                            popPrevData.itemNm         = data[i].itemNm;
                            popPrevData.purcUnitCd     = data[i].unitCd;
                            popPrevData.purcQty        = data[i].purcSgstQty;
                            popPrevData.resvStockQty   = data[i].resvStockQty;
                            popPrevData.purcReqQty     = 0;
                            popPrevData.purcPrc        = lPurcPrc;
                            popPrevData.purcAmt        = data[i].purcSgstQty * lPurcPrc;
                            popPrevData.taxDdctPrc     = lPurcPrc / ( 1 + gVatCd );
                            popPrevData.taxDdctAmt     = data[i].purcSgstQty * (lPurcPrc / ( 1 + gVatCd ));
                            popPrevData.prcTp          = '01';
                            popPrevData.delYn          = "N";
                            popPrevData.grEndYn        = "N";
                            popPrevData.purcReqDt      = tDate;
                            popPrevData.avlbStockQty   = data[i].avlbStockQty;
                            popPrevData.stockQty       = data[i].stockQty;
                            popPrevData.borrowQty      = data[i].borrowQty;
                            popPrevData.rentQty        = data[i].rentQty;
                            popPrevData.editCd         = '';
                            popPrevData.parSpecCd      = data[i].parSpecCd;
                            popPrevData.sucCd          = data[i].sucCd;
                            popPrevData.orgPurcPrc     = data[i].purcPrc;


                            if(existItemChkObj.hasOwnProperty(data[i].itemCd)){
                                //이미 등록되어있는 부품입니다.
                                var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                            }else{
                                existItemChkObj[data[i].itemCd] = data[i].itemNm;
                                gridData.dataSource.add(popPrevData);
                            }
                        }

                        if(!dms.string.isEmpty(nonAvailItemInfo)){
                            dms.notification.warning(nonAvailItemInfo);
                        }

                        gridData.select(gridData.tbody.find(">tr"));

                        purcCostSgstPopupWindow.close();

                        calTotalAmt();

                    }
                }
            }
        });
    }

    var venderSearchPopupWin;
    function selectVenderMasterPopupWindow(){
        var bpTp;

        //공구구매등록인 경우(BMP도 로컬임.)
        if(pItemDistinCd === '07'){
            bpTp = '03';
        }else{
            bpTp = '';
            return false;
        }

        venderSearchPopupWin = dms.window.popup({
            windowId:"venderSearchPopupWin"
            ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
            ,width:840
            ,height:400
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                ,data:{
                    "type"     :"custom1"
                    ,"autoBind":false
                    ,"bpCd"    :''
                    ,"bpNm"    :''
                    ,"bpTp"    :bpTp
                    ,"callbackFunc":function(data){

                        var ordStat = $("#purcOrdStatCd").data("kendoExtDropDownList").value();
                        gCrud      = "C";

                        if(dms.string.isEmpty(ordStat)){
                            $("#bpCd").val(data[0].bpCd);
                            $("#bpNm").val(data[0].bpNm);
                            $("#bpTp").val(data[0].bpTp);
                            $("#grid").data("kendoExtGrid").dataSource.data([]);
                            existItemChkObj = {};
                        }else{
                            initBpCd = data[0].bpCd;
                            initBpNm = data[0].bpNm;
                            initBpTp = data[0].bpTp;
                            pPurcOrdNo = '';
                            initPage();
                        }

                        venderSearchPopupWin.close();

                    }
                }
            }
        });
    }

    // 구매리스트 팝업 열기 함수.
    function selectPurcOrdListPopupWindow(){
        //TODO : [InBoShim] 업체코드 유효성 주석.
        /* if(dms.string.isEmpty($("#bpCd").val())){
            // 딜러를 선택하십시오
            dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
            saveList = [];
            return false;
        } */

        purcOrdListPopupWindow = dms.window.popup({
            windowId:"purcOrdListPopup"
            ,title:"<spring:message code='par.title.purcOrdInfo' />"//구매오더정보
            ,width : 800
            ,height: 400
            ,content:{
                url:"<c:url value='/par/cmm/selectPurcOrdListPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    , "autoBind":false
                    , "bpCd":$("#bpCd").val()
                    , "bpNm":$("#bpNm").val()
                    , "purcOrdStatCd":'01'
                    ,"itemDstinCd":pItemDistinCd
                    , "selectable":"single"
                    , "callbackFunc":function(data){
                        if(data.length === 1)
                        {
                            pPurcOrdNo = data[0].purcOrdNo;
                            selectPurcOrd(data[0].purcOrdNo);
                        }
                        purcOrdListPopupWindow.close();
                    }
                }
            }
        });
    }

    // 구매번호로 구매건 조회 함수.
    function selectPurcOrdNoKey(e){

        //TODO : [InBoShim] 업체코드 유효성 주석.
        /* if(dms.string.isEmpty($("#bpCd").val())){
            // 딜러를 선택하십시오
            dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
            saveList = [];
            return false;
        } */

        if(e.keyCode === 13){

            $.ajax({
                url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdByKey.do' />",
                data:JSON.stringify({ sPurcOrdNo:$("#purcOrdNo").val()}),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error) {
                    selectPurcOrdListPopupWindow();
                }

            }).done(function(result) {

                var ordStatCd;


                partsJs.validate.groupObjAllDataSet(result);

                ordStatCd = $("#purcOrdStatCd").data("kendoExtDropDownList").value();

                $("#grid").data("kendoExtGrid").dataSource.read();

                $("#grid").data("kendoExtGrid").dataSource._destroyed = [];

                searchTrsfTp =  $("#trsfTp").data("kendoExtDropDownList").value();

                gCrud = "U";

                btnView(ordStatCd);

            });
        }

    }

    //선수금 체크 팝업
    function fnChkAdvanceReceivedPopupWindow(pCalcAmt, pLmtAmt){

        chkAdvanceReceivedPopupWindow = dms.window.popup({
            windowId:"chkAdvanceReceivedPopup"
            ,title  :"<spring:message code = 'par.title.chkAdvanceReceived'/>"   // 선수금체크
            ,width  :380
            ,height :80
            ,content:{
                url:"<c:url value='/par/cmm/chkAdvanceReceivedPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"calcAmt":pCalcAmt
                    ,"lmtAmt":pLmtAmt
                    ,"callbackFunc":function(data){
                    }
                }
            }
        });
    }

    function initPage(){
        //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
        //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        $("#grid").data("kendoExtGrid").dataSource.data([]);

        existItemChkObj = {};

        $("#totPurcAmt").closest(".k-numerictextbox").addClass("form_readonly");
        $("#totPurcAmt").data("kendoExtNumericTextBox").enable(false);
        $("#totTaxDdctAmt").closest(".k-numerictextbox").addClass("form_readonly");
        $("#totTaxDdctAmt").data("kendoExtNumericTextBox").enable(false);

        $("#advanceReceived").data("kendoExtNumericTextBox").value(advancedAmt);
        $("#pdcCd").data("kendoExtDropDownList").value(dlDistCd);
        $("#pdcCd").data("kendoExtDropDownList").enable(false);
        gExistYn = 'N';
        gGridItemCdOrgVal = '';

        //구매오더 관리에서 넘어온 경우
        if(!dms.string.isEmpty(pPurcOrdNo)){
            selectPurcOrd(pPurcOrdNo);
        }

        if(pItemDistinCd === '07'){//공구구매 구분.
            $("#grid thead [data-field=itemCd]").text("<spring:message code='par.lbl.toolCd' />");
            $("#grid thead [data-field=itemNm]").text("<spring:message code='par.lbl.toolNm' />");
            $("#searchCustCd").attr("readonly", false);
            $("#searchCustCd").removeClass("form_readonly");

            $("#purcOrdTp").data("kendoExtDropDownList").value("K");//EPC Order

        }else{

            $("#bpCd").val(initBpCd);  //공급업체 기본셋팅
            $("#bpNm").val(initBpNm);  //공급업체 기본셋팅
            $("#bpTp").val(initBpTp);  //고객유형 기본셋팅
            $("#searchCustCd").attr("readonly", true);
            $("#searchCustCd").addClass("form_readonly");
        }

        btnView(); //초기화 시 버튼 구성

    }

    function btnView(pStat){

        if(dms.string.isEmpty(pStat)){ //신규 등록 시

            $("#btnSave").data("kendoButton").enable(true);
            $("#btnSend").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#purcOrdTp").data("kendoExtDropDownList").enable(true);
            $("#trsfTp").data("kendoExtDropDownList").enable(true);

            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDelItem").data("kendoButton").enable(true);
            $("#btnExcelUpload").data("kendoButton").enable(true);
            $("#btnCopyPurcOrd").data("kendoButton").enable(true);
            $("#btnPrint").data("kendoButton").enable(false);

            if($("#bpTp").val() === '01' ){
                $("#btnAddPurcReq").data("kendoButton").enable(true);
                $("#btnRecommOrd").data("kendoButton").enable(true);
            }else{
                $("#btnAddPurcReq").data("kendoButton").enable(false);
                $("#btnRecommOrd").data("kendoButton").enable(false);
            }


        }else if(pStat === "01"){ //등록 상태 인경우

            $("#btnSave").data("kendoButton").enable(true);
            $("#btnCancel").data("kendoButton").enable(true);
            $("#purcOrdTp").data("kendoExtDropDownList").enable(false);
            $("#trsfTp").data("kendoExtDropDownList").enable(true);

            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDelItem").data("kendoButton").enable(true);
            $("#btnExcelUpload").data("kendoButton").enable(true);
            $("#btnCopyPurcOrd").data("kendoButton").enable(true);

            if($("#bpTp").val() !== '01'){ //로컬구매인 경우
                $("#btnSend").data("kendoButton").enable(true);

                $("#btnAddPurcReq").data("kendoButton").enable(false);
                $("#btnRecommOrd").data("kendoButton").enable(false);
            }else{
                $("#btnSend").data("kendoButton").enable(true);

                $("#btnAddPurcReq").data("kendoButton").enable(true);
                $("#btnRecommOrd").data("kendoButton").enable(true);
            }

            //공구구매등록인 경우(BMP도 로컬임.)
            if(pItemDistinCd === '07'){
                $("#btnSend").data("kendoButton").enable(true);
            }

            $("#btnPrint").data("kendoButton").enable(true);

        }else{ //그 외

            $("#btnSave").data("kendoButton").enable(false);
            $("#btnSend").data("kendoButton").enable(false);
            $("#purcOrdTp").data("kendoExtDropDownList").enable(false);
            $("#trsfTp").data("kendoExtDropDownList").enable(false);

            $("#btnAdd").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);
            $("#btnExcelUpload").data("kendoButton").enable(false);
            $("#btnCopyPurcOrd").data("kendoButton").enable(false);
            $("#btnAddPurcReq").data("kendoButton").enable(false);
            $("#btnRecommOrd").data("kendoButton").enable(false);
            $("#btnPrint").data("kendoButton").enable(true);

            if($("#bpTp").val() !== '01'){ //로컬구매인 경우
                $("#btnCancel").data("kendoButton").enable(true);
            }else{
                $("#btnCancel").data("kendoButton").enable(false);
            }

            //공구구매등록인 경우(BMP도 로컬임.)
            if(pItemDistinCd === '07'){
                $("#btnCancel").data("kendoButton").enable(true);
            }
        }

        //공구구매등록인 경우
        if(pItemDistinCd === '07'){

            $("#btnSend").hide();
            $("#btnExcelUpload").hide();
            $("#btnCopyPurcOrd").hide();
            $("#btnAddPurcReq").hide();
            $("#btnRecommOrd").hide();

        }
    }

    //Total 계산
    function calTotalAmt(){
        var rows = $("#grid").data("kendoExtGrid").tbody.find("tr"),
            totTaxDdctAmt = 0,
            totPurcAmt = 0;

        //금액 계산
        if(rows.length === 0){
            $("#totTaxDdctAmt").data("kendoExtNumericTextBox").value(0);
            $("#totPurcAmt").data("kendoExtNumericTextBox").value(0);
        }else{
            rows.each(function(index, row) {

                data = $("#grid").data("kendoExtGrid").dataItem(rows[index]);

                if(data.purcQty != null && data.purcPrc != null){
                    totTaxDdctAmt += Number(data.taxDdctAmt);
                    totPurcAmt += data.purcAmt;
                }

                $("#totTaxDdctAmt").data("kendoExtNumericTextBox").value(totTaxDdctAmt);
                $("#totPurcAmt").data("kendoExtNumericTextBox").value(totPurcAmt);
            });
        }
    }

    /*
    function fnCheckPurcVOR(e){
      //초긴급 오더인 경우 실제금액보다 구매금액 큰 경우 메세지 알림.(저장과 무관함)
        if($("#purcOrdTp").data("kendoExtDropDownList").value() === "V"){
            if(useAmt < $("#totPurcAmt").data("kendoExtNumericTextBox").value()){
                alert("实际金额");
            }
        }
    }
    */

    $(document).on("click", ".grid-checkAll", function(e){
        var grid = $("#grid").data("kendoExtGrid");
        var checked = $(this).is(":checked");
        var rows = grid.tbody.find("tr");

        if(checked){
            rows.each(function(index, row) {
                grid.select($(this));
                $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
            });



        }else{
            grid.clearSelection();

            rows.each(function(index, row) {
                $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
            });
        }
    });

    function fnAddRow(i){
        $('#grid').data('kendoExtGrid').dataSource.insert(i, {
            "dlrCd"         :''
            ,"purcItemTp"    :'03'
            ,"purcItemStatCd":'01'
            ,"grStrgeCd"     :''
            ,"itemCd"        :''
            ,"itemNm"        :''
            ,"purcUnitCd"    :''
            ,"purcQty"       :0
            ,"resvStockQty"  :0
            ,"purcReqQty"    :0
            ,"purcPrc"       :0
            ,"purcAmt"       :0
            ,"taxDdctPrc":0
            ,"taxDdctAmt":0
            ,"prcTp"         :'01'
            ,"delYn"         :'N'
            ,"grEndYn"       :'N'
            ,"purcReqDt"     :''
            ,"minPurcQty"    :0
            ,"avlbStockQty"  :0
            ,"borrowQty"     :0
            ,"rentQty"       :0
            ,"stockQty"      :0
        });
    }

    function fnSetPurcPrcApplyDcRate(pPrc){
        var lPurcTp   = $("#purcOrdTp").data("kendoExtDropDownList").value(),
            lDcRate   = 0,
            returnPrc = 0;

        //VOR인 경우
        if(lPurcTp === "V"){
            lDcRate = cmcGnlDcRate;
            //긴급인 경우
        }else if(lPurcTp === "E"){
            lDcRate = cmcDcRate;
        }else{
            lDcRate = gnlDcRate;
        }

        if(Number(pPrc) > 0){
            if(!dms.string.isEmpty(lDcRate) && Number(lDcRate) > 0){
                returnPrc = Number(pPrc) * 2 * (1 - (lDcRate/100));
            }else if(Number(lDcRate) === 0){  //lDcRate가 0이면 200%
                returnPrc = Number(pPrc) * 2;
            }else if(dms.string.isEmpty(lDcRate)){  //lDcRate가 null이면 100%
                returnPrc = Number(pPrc);
            }

        }

        return returnPrc;
    }

    function fnChangePurcOrdTp(e){
        var grid      = $("#grid").data("kendoExtGrid"),
            rows      = grid.tbody.find("tr"),
            lPurcTp   = $("#purcOrdTp").data("kendoExtDropDownList").value(),
            lDcRate   = 0,
            returnPrc = 0,
            dataItem,
            gridData;

        //VOR인 경우
        if(lPurcTp === "V"){
            lDcRate = cmcGnlDcRate;
            //긴급인 경우
        }else if(lPurcTp === "E"){
            lDcRate = cmcDcRate;
        }else{
            lDcRate = gnlDcRate;
        }


        rows.each(function(index, row) {
            dataItem = grid.dataSource.data()[index];
            gridData = grid.dataSource.at(index)

            if(Number(gridData.orgPurcPrc) > 0){
                if(!dms.string.isEmpty(lDcRate) && Number(lDcRate) > 0){
                    returnPrc = Number(gridData.orgPurcPrc) * 2 * (1 - (lDcRate/100));
                    dataItem.set('purcPrc',    returnPrc);
                    dataItem.set('purcAmt',    (gridData.purcQty * returnPrc));
                    dataItem.set('taxDdctPrc', returnPrc / ( 1 + gVatCd ));
                    dataItem.set('taxDdctAmt', gridData.purcQty * (returnPrc / ( 1 + gVatCd )));
                }else if(Number(lDcRate) === 0){  //lDcRate가 0이면 200%
                    returnPrc = Number(gridData.orgPurcPrc) * 2;
                    dataItem.set('purcPrc',    returnPrc);
                    dataItem.set('purcAmt',    (gridData.purcQty * returnPrc));
                    dataItem.set('taxDdctPrc', returnPrc / ( 1 + gVatCd ));
                    dataItem.set('taxDdctAmt', gridData.purcQty * (returnPrc / ( 1 + gVatCd )));
                }else if(dms.string.isEmpty(lDcRate)){  //lDcRate가 null이면 100%
                    returnPrc = Number(gridData.orgPurcPrc);
                    dataItem.set('purcPrc',    returnPrc);
                    dataItem.set('purcAmt',    (gridData.purcQty * returnPrc));
                    dataItem.set('taxDdctPrc', returnPrc / ( 1 + gVatCd ));
                    dataItem.set('taxDdctAmt', gridData.purcQty * (returnPrc / ( 1 + gVatCd )));
                }

            }
        });
    }

</script>
<!-- //script -->


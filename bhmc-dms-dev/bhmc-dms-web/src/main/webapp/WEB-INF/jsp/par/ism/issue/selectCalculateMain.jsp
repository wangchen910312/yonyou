<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

    <!-- 配件销售结算 -->
<div id="resizableContainer">
    <div class="content_v1">
        <section class="group">
            <div class="header_area">
                <div class="btn_left">
                <dms:access viewId="VIEW-D-11819" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                </dms:access>
                </div>
                <div class="btn_right">
                <dms:access viewId="VIEW-D-11817" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnReturn" class="btn_m"><spring:message code="par.btn.partsSaleReturn" /></button><!--부품판매반품 -->
                </dms:access>
                <dms:access viewId="VIEW-D-11816" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m" id="btnCalc"><spring:message code="par.btn.save" /><!-- 저장 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11815" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m" id="btnCalcConfirm"><spring:message code="par.btn.calcConfirm" /><!-- 확인 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11818" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnCancel" class="btn_m btn_cancel"><spring:message code="par.btn.calcCancel" /></button><!--취소  -->
                </dms:access>
                <dms:access viewId="VIEW-D-11814" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnPrint" class="btn_m"><spring:message code="par.btn.receivePrint" /></button><!--인쇄 -->
                </dms:access>
                <dms:access viewId="VIEW-D-11813" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message  code="par.btn.search" /><!-- 조회 --></button>
                </dms:access>
                </div>
            </div>
            <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="searchForm">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:8%;">
                        <col style="width:17%;">
                        <col style="width:8%;">
                        <col style="width:17%;">
                        <col style="width:8%;">
                        <col style="width:17%;">
                        <col style="width:8%;">
                        <col style="width:17%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.partsSaleNo" /><!-- 판매오더번호 --></th>
                            <td>
                                <input id="sParSaleOrdNo" class="form_input">
                                <input id="calcDocNo" class="form_input form_readonly hidden" readonly />
                                <input id="parSaleOrdNo" class="form_input form_readonly hidden" readonly />
                                <input id="calcStatCd" class="form_input form_readonly hidden" readonly />
                                <input id="ordStatCd" class="form_input form_readonly hidden" readonly />
                            </td>
                            <th scope="row"><spring:message code="par.lbl.partsSalePrcTp" /><!-- 판매유형 --></th>
                            <td>
                                <input id="sSaleTp" type="text" data-type="combo" class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code="par.lbl.partsSalePrsn" /><!-- 담당자 --></th>
                            <td>
                                <div class="form_search">
                                    <input type="text" id="sSaId" class="form_input hidden" />
                                    <input type="text" id="sSaNm" class="form_input" />
                                    <a id="searchSaId"><!-- 검색 --></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="par.lbl.partsSaleStat" /><!-- 상태 --></th>
                            <td>
                                <input id="sOrdStatCd" type="text" data-type="multicombo" class="form_comboBox" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.parSaleCnt" /><!-- 품목수 --></th>
                            <td>
                                <div class="form_float">
                                <div class="date_left">
                                    <input id="sItemCntFr" class="form_numeric ar"  data-type="number" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sItemCntTo" class="form_numeric ar"  data-type="number" />
                                </div>
                            </td>
                            <th scope="row"><spring:message code="par.lbl.prsnHpNo" /><!-- 핸드폰 --></th>
                            <td>
                                <input id="sCustTelNo"  type="text" class="form_input" />
                                <input id="sItemQty" data-type="number" class="form_numeric hidden" />
                            </td>
                            <th scope="row"><spring:message code="par.lbl.partsSaleDt" /><!-- 부품판매일자 --></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sOrdDtFr" class="form_datepicker" data-type="maskDate" />
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sOrdDtTo" class="form_datepicker" data-type="maskDate" />
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="par.lbl.parSaleAmt" /><!--판매금액 --></th>
                            <td>
                                <div class="form_float" >
                                    <div class="date_left">
                                        <input id="sItemAmtFr" class="form_numeric ar" data-type="number" />
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sItemAmtTo" class="form_numeric ar" data-type="number" />
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.custTp" /><!-- 고객유형 --></th>
                            <td>
                                <input id=sCustTpView data-type="combo" class="form_comboBox" />
                                <input id=sCustTp data-type="combo" class="form_comboBox hidden" />
                            </td>
                            <th scope="row"><spring:message code="par.lbl.bpCstCd" /><!-- 거래처코드 --></th>
                            <td>
                                <div class="form_search">
                                    <input type="text" id="sCustCd" class="form_input" />
                                    <input type="text" id="custCd" class="form_input hidden" />
                                    <input type="text" id="custNm" class="form_input hidden" />

                                    <input type="text" id="carOwnerId" class="form_input hidden" />
                                    <input type="text" id="vinNo" class="form_input hidden" />
                                    <input type="text" id="driverNm" class="form_input hidden" />
                                    <input type="text" id="membershipNo" class="form_input hidden" />
                                    <input type="text" id="roDocNo" class="form_input hidden" />
                                    <input type="text" id="carlineCd" class="form_input hidden" />
                                    <input type="text" id="bmMembershipNo" class="form_input hidden" />
                                    <input type="text" id="bmLastPointVal" class="form_input hidden" />
                                    <input type="text" id="bmPointScale" class="form_input hidden" />
                                    <input type="text" id="etcBmPointUseAmt" class="form_input hidden" />
                                    <input type="text" id="bmMaxConsumInte" class="form_input hidden" />
                                    <input type="text" id="bmRegDt" class="form_input hidden" />
                                    <input type="text" id="bmGradeCd" class="form_input hidden" />
                                    <input type="text" id="bmGradeNm" class="form_input hidden" />
                                    <input type="text" id="carOwnerNm" class="form_input hidden" />
                                    <input type="text" id="dlrPointCardNo" class="form_input hidden" />
                                    <input type="text" id="lastPointVal" class="form_input hidden" />
                                    <input type="text" id="gradeCd" class="form_input hidden" />
                                    <input type="text" id="gradeNm" class="form_input hidden" />
                                    <input type="text" id="memberJoinDt" class="form_input hidden" />
                                    <input type="text" id="pointExchgScale" class="form_input hidden" />
                                    <input type="text" id="occrPoint" class="form_input hidden" />
                                    <input type="text" id="membershipPointUseMaxPoint" class="form_input hidden" />
                                    <input type="text" id="dlrRealTotAmt" class="form_input hidden" />
                                    <input type="text" id="serLbrDcRate" class="form_input hidden" />
                                    <input type="text" id="serParDcRate" class="form_input hidden" />
                                    <input type="text" id="serDlrLbrDcRate" class="form_numeric hidden" />
                                    <input type="text" id="serDlrParDcRate" class="form_numeric hidden" />
                                    <input type="text" id="serDlrTotDcRate" class="form_numeric hidden" />
                                    <input type="text" id="serBmLbrDcRate" class="form_numeric hidden" />
                                    <input type="text" id="serBmParDcRate" class="form_numeric hidden" />
                                    <input type="text" id="serBmTotDcRate" class="form_numeric hidden" />
                                    <input type="hidden" id="etcDcCd" name="etcDcCd" data-json-obj="true" />
                                    <input type="hidden" id="etcDcTp" name="etcDcCd" data-json-obj="true" />
                                    <input type="hidden" id="etcDcSeq" name="etcDcSeq" data-json-obj="true"  />
                                    <input type="hidden" id="totCustPaymAmt" name="totCustPaymAmt" data-json-obj="true"  />
                                    <input id="parDcRate" data-type="number" class="form_numeric hidden" readonly />
                                    <input id="compareParCalcAmt" data-type="number" class="form_numeric hidden" readonly />
                                    <input type="text" id="updtDtStr" class="form_input hidden" />

                                    <a id="searchCustCd"><!-- 검색 --></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="par.lbl.bpCstNm" /><!-- 거래처명 --></th>
                            <td>
                                <input type="text" id="sCustNm" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code="par.lbl.calcNo" /><!-- 정산서번호 --></th>
                            <td>
                                <input id="sCalcDocNo" class="form_input" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="table_grid mt5">
            <!-- 그리드1 -->
                <div id="gridHeader" class="grid"></div>
            <!-- 그리드1 -->
            </div>

            <div class="table_grid mt5">
                <div id="gridDetail" class="grid"></div>
            </div>
        </section>
        <!-- //配件销售结算 -->

        <div class="header_area">
            <div class="btn_right">
                <button type="button" id="calAdd" class="btn_m hidden" disabled><spring:message code="ser.btn.seperate" /></button>
                <button type="button" id="wonUnitCut" class="btn_m"><spring:message code="ser.lbl.interSett" /><!-- 정산절사 --></button>
                <button type="button" id="demicalPointCut" class="btn_m"><spring:message code='ser.lbl.settClZero' /><!-- 정산제로 --></button>
                <button type="button" id="dcRole" class="btn_m"><spring:message code="ser.lbl.dcRole" /><!-- 할인권한 --></button>
            </div>
        </div>

        <section class="group">
            <!-- 비용 -->
            <div style="height:55px;">
                <div class="table_list table_list_v1 mt5"  id="dataForm">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:11%;">
                            <col style="width:11%;">
                            <col style="width:11%;">
                            <col style="width:11%;">
                            <col style="width:11%;">
                            <col style="width:11%;">
                            <col style="width:11%;">
                            <col style="width:11%;">
                            <col style="width:12%;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col"><spring:message code="ser.lbl.calcCost" /></th><!--정산비용  -->
                                <th scope="col"><spring:message code="global.lbl.calcAmt" /></th><!--정산금액  -->
                                <th scope="col"><spring:message code="ser.lbl.dcRate" /></th><!--할인율(%)  -->
                                <th scope="col"><spring:message code="ser.lbl.dcAmt" /></th><!--할인금액  -->
                                <th scope="col"><spring:message code="ser.lbl.whDcAmt" /></th><!--할인후금액  -->
                                <th scope="col">BM<spring:message code="ser.lbl.pointUseAmt" /></th><!--BM포인트사용금액  -->
                                <th scope="col"><spring:message code="par.lbl.dlrPointUseAmt" /></th><!--회원포인트사용금액  -->
                                <th scope="col"><spring:message code="ser.lbl.etcSaleAmt" /></th><!--기타혜택금액  -->
                                <th scope="col"><spring:message code="ser.lbl.finalCalcAmt" /></th><!--최종정산금액  -->
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.calcParSubCamt" /></th><!--부품비소계  -->
                                <td class="ar"><input id="parCalcAmt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                                <td class="ar"><input id="viewParDcRate" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                                <td class="ar"><input id="parDcAmt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                                <td class="ar"><input id="parWhDcAmt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                                <td class="ar"><input id="parBmPointUseAmt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                                <td class="ar"><input id="pointTotAmt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                                <td class="ar"><input id="parEtcDcAmt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                                <td class="ar"><input id="parCalcSumAmt" data-type="number" min="0" class="form_numeric ar form_readonly" readonly/></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="table_grid mt5">
                <div id="calcGrid" class="grid"></div>
            </div>
        </section>

        <!-- 우측 메뉴 -->
        <c:import url="/WEB-INF/jsp/ser/cmm/kanbanInfo/selectKanbanCustInfo.jsp" />
        <!-- //우측 메뉴 -->
    </div>
</div>

<!-- script -->
<script>
var toDt                = "${toDt}",
    sevenDtBf           = "${sevenDtBf}",
    custTpList          = [],
    custTpObj           = {},
    giStrgeTpList       = [],
    giStrgeTpObj        = {},
    unitCdObj           = {},
    locationObj         = {},
    locationListObj     = {},
    paymTpCdList        = [],
    paymTpCdArr         = {},
    paymMthCdList       = [],
    paymMthCdMap        = {},
    paymPridCdList      = [],
    paymPridCdMap       = {},
    ordStatCdList       = [],
    ordStatCdObj        = {},
    ordItemStatCdObj    = {},
    ordStatChkObj       = {},
    rcptTpCdList        = [],
    rcptTpCdMap         = {},
    saleTpList          = [],
    saleTpObj           = {},
    dcData              = {},
    changeCalGridObj    = {},
    returnObj           = {},
    cnclCalcObj         = {},
    parDcPermTpList     = [],
    selectOrgPartsSaleDcRate,
    loginUsrId          = "${loginUsrId}",
    linkParSaleOrdNo    = "${pSendParSalesOrdNo}",
    changeAmtEditor,
    selectPartsSaleDcRate,
    wonUnitCutSetValue,
    demicalPointCutValue,
    demicalPointCutCdNm,
    customerSearchPopupWin,
    dcSearchPopup,
    popupWindow,
    getDlrMemberGradeCdMap,
    bmCupnCancel,
    setBmCupnData,
    dealerCancel,
    setDlrPointData,
    dcCancel,
    setEtcDcAmt,
    setCardPointSet,
    getDlrMemberGradeCdMap,
    getBmMemberGradeCdMap,
    dlrMemberGradeCdList,
    dlrMemberGradeCdMap,
    bmMemberGradeCdList,
    bmMemberGradeCdMap,
    setBmPointData,
    bmCancel,
    changeUnitCd,
    g_viewDcRate,
    preFixId;

    locationObj[' '] = "";

    custTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${custTpList}" varStatus="status">
        custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        custTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    custTpList.push({"cmmCd":"03", "cmmCdNm":"一次性客户", "useYn":"Y"});

    unitCdObj[' '] = "";
    <c:forEach var="obj" items="${unitCdList}" varStatus="status">
        unitCdObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
    </c:forEach>

    giStrgeTpObj[' '] = "";
    <c:forEach var="obj" items="${storageList}" varStatus="status">
        giStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        giStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
    </c:forEach>

  //공통코드:결제유형
    <c:forEach var="obj" items="${paymTpCdList}">
        paymTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    paymTpCdArr  = dms.data.arrayToMap(paymTpCdList, function(obj){return obj.cmmCd});

  //지불방식 Array
    <c:forEach var="obj" items="${paymMthCdList}">
    paymMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //지불방식 Map
    paymMthCdMap = dms.data.arrayToMap(paymMthCdList, function(obj){ return obj.cmmCd; });
    paymMthCdMap[""] = "<spring:message code='global.btn.select' />";

    <c:forEach var="obj" items="${paymPridCdList}">
        paymPridCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        paymPridCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

  //영수증유형 Array
    rcptTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${rcptTpCdList}">
    rcptTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //영수증유형 Map
    rcptTpCdMap = dms.data.arrayToMap(rcptTpCdList, function(obj){ return obj.cmmCd; });

    //정산절사 Array
    <c:forEach var="obj" items="${wonUnitCutCdList}">
        if('default' === "${obj.remark10}"){
            wonUnitCutSetValue = "${obj.cmmCd}";
        }
    </c:forEach>

    //정산제로 Array
    <c:forEach var="obj" items="${demicalPointCutCdList}">
        if('default' === "${obj.remark10}"){
            demicalPointCutValue = "${obj.cmmCd}";
            demicalPointCutCdNm = "${obj.cmmCdNm}";
        }
    </c:forEach>

    ordStatChkObj["02"] = '';
    ordStatChkObj["04"] = '';
    ordStatChkObj["05"] = '';
    ordStatChkObj["07"] = '';
    ordStatCdList.push({"cmmCd":" ", "cmmCdNm":"选择取消", "useYn":""});
    <c:forEach var="obj" items="${ordStatCdList}" varStatus="status">
        if(ordStatChkObj.hasOwnProperty("${obj.cmmCd}")){
            if("${obj.cmmCd}" === '07'){
                ordStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"<spring:message code='sal.menu.receiveReturn' />", "useYn":"${obj.useYn}"});
            }else{
                ordStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            }
        }

        if("${obj.cmmCd}" === '01'){
            ordStatCdObj["${obj.cmmCd}"] = "<spring:message code='par.btn.create' />";//"登记";
        }else if("${obj.cmmCd}" === '02'){
            ordStatCdObj["${obj.cmmCd}"] = "<spring:message code='par.lbl.confirm' />";//"确认";
        }else if("${obj.cmmCd}" === '05'){
            ordStatCdObj["${obj.cmmCd}"] = "<spring:message code='sal.btn.pay' />";//"付款";
        }else if("${obj.cmmCd}" === '07'){
            ordStatCdObj["${obj.cmmCd}"] = "<spring:message code='sal.menu.receiveReturn' />";//"退货";
        }else{
            ordStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        }
        if("${obj.cmmCd}" === '01'){
            ordItemStatCdObj["${obj.cmmCd}"] = "<spring:message code='par.btn.create' />";//"登记";
        }else if("${obj.cmmCd}" === '07'){
            ordItemStatCdObj["${obj.cmmCd}"] = "<spring:message code='sal.menu.receiveReturn' />";//"退货";
        }else{
            ordItemStatCdObj["${obj.cmmCd}"] = "<spring:message code='par.lbl.issue' />";//"出库";
        }
    </c:forEach>

    saleTpObj[' '] = "";
    saleTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${saleTpList}" varStatus="status">
        if(3 > Number("${obj.cmmCd}")){
            saleTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        }
        saleTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    /** 블루멤버쉽 등급 **/
    bmMemberGradeCdList = [];
    <c:forEach var="obj" items="${bmMemberGradeCdList}">
       bmMemberGradeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    bmMemberGradeCdMap = dms.data.arrayToMap(bmMemberGradeCdList, function(obj){return obj.cmmCd;});

  //딜러멤버쉽 등급 코드
    getDlrMemberGradeCdMap = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(dlrMemberGradeCdMap[val] != undefined)
            returnVal = dlrMemberGradeCdMap[val].cmmCdNm;
        }
        return returnVal;
    };

  //블루멤버쉽 등급 코드
    getBmMemberGradeCdMap = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(bmMemberGradeCdMap[val] != undefined)
            returnVal = bmMemberGradeCdMap[val].cmmCdNm;
        }
        return returnVal;
    };

    //할인구분 대상Array
    <c:forEach var="obj" items="${dcPermTpList}">
    parDcPermTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "remark1":"${obj.remark1}", "useYn":"${obj.useYn}"});
    </c:forEach>

    $(document).ready(function() {
        //고객유형선택
        $("#sCustTpView").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:custTpList
            ,index:0
        });

        //고객유형선택
        $("#sCustTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:custTpList
            ,index:0
        });

      //오더상태선택
        $("#sOrdStatCd").kendoExtMultiSelectDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:ordStatCdList
            ,dataBound:function(){
                var current = this.value();
                this._savedOld = current.slice(0);
            }
            ,select:function(e){
                var selectOrdStatCd = e.dataItem.cmmCd;

                if(dms.string.isEmpty(selectOrdStatCd)){
                    $("#sOrdStatCd").data("kendoExtMultiSelectDropDownList").refresh();
                    $("#sOrdStatCd").data("kendoExtMultiSelectDropDownList").value([]);
                }

            }
        });

        //판매유형
        $("#sSaleTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:saleTpList
            ,index:0
        });

        //오더일
        $("#sOrdDtFr").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //오더일
        $("#sOrdDtTo").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#parCalcAmt").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });

        $("#compareParCalcAmt").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });

        //할인률
        $("#parDcRate").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });

        //할인률
        $("#viewParDcRate").kendoExtNumericTextBox({
            format:"n0"
           ,spinners:false
        });

        $("#parDcAmt").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });

        $("#parWhDcAmt").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });

        $("#parEtcDcAmt").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });

        $("#parCalcSumAmt").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });

        $("#parBmPointUseAmt").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });

        $("#pointTotAmt").kendoExtNumericTextBox({
            format:"n2"
           ,spinners:false
        });

        //판매건수
        $("#sItemCntFr").kendoExtNumericTextBox({
            format:"n0"
           ,spinners:false
        });

        //판매건수
        $("#sItemCntTo").kendoExtNumericTextBox({
            format:"n0"
           ,spinners:false
        });

        //판매수량
        $("#sItemQty").kendoExtNumericTextBox({
            format:"n0"
           ,spinners:false
        });

        /***** 판매금액시작 *****/
        $("#sItemAmtFr").kendoExtNumericTextBox({
            format:"n2"                // n0:###,###, n2:###,###.##
           ,decimals:2                // 소숫점
           ,spinners:false             // 증,감 화살표
        });

        /***** 판매금액종료 *****/
        $("#sItemAmtTo").kendoExtNumericTextBox({
            format:"n2"                // n0:###,###, n2:###,###.##
           ,decimals:2                // 소숫점
           ,spinners:false             // 증,감 화살표
        });

        //sCustTelNo
        $("#sCustTelNo").kendoMaskedTextBox({
            mask:"00000000000"
            , promptChar:" "
        });

        /**현재주행거리, 누적주행거리, 정비예정주행거리**/
        $("#serDlrLbrDcRate, #serDlrParDcRate, #serDlrTotDcRate, #serBmLbrDcRate, #serBmParDcRate, #serBmTotDcRate").kendoExtNumericTextBox({
           min:0
          ,format:"n0" //"{0:##,###}"
          ,spinners:false             // 증,감 화살표
        });

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){

                linkParSaleOrdNo = '';

                initPage();
            }
        });

        //인쇄
        $("#btnPrint").kendoButton({
            click:function(e){
                if(dms.string.isEmpty($("#calcDocNo").val())){
                    //부품정산번호를 선택하십시오
                    dms.notification.warning("<spring:message code='par.lbl.calcNo' var='calcDocNo' /><spring:message code='par.info.itemInsertNotMsg' arguments='${calcDocNo}'/>");
                    return false;
                }
                //부품판매정산서 : 정비정산서 일치화
                var urlInfo = "<c:url value='/ReportServer?reportlet=par/selectCalculatePrintMain.cpt'/>&sDlrCd=${dlrCd}&sParSaleOrdNo="+$("#parSaleOrdNo").val()+"&sCalcDocNo="+$("#calcDocNo").val()+"&sTelShowYn=N";
                parent._createOrReloadTabMenu("<spring:message code='par.title.saleCalculatePrintDoc' />", urlInfo, "VIEW-D-13097",true);

            }
        });

        /*
        //딜러멤버쉽 등급 코드
        getDlrMemberGradeCdMap = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                if(dlrMemberGradeCdMap[val] != undefined)
                returnVal = dlrMemberGradeCdMap[val].cmmCdNm;
            }
            return returnVal;
        };
        */

        $("#searchCustCd").on('click', custSearchPopup);
        $("#searchSaId").on('click', saSearchPopup);

        $("#sCustTpView").on('change', fnChangeCustTp);

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#gridHeader").data("kendoExtGrid").dataSource.read();
            }
        });

     // 정산 버튼
        $("#btnCalc").kendoButton({
            click:function(e){
                fnCalcConfirm('04');
            }
        });

        // 정산 확정 버튼
        $("#btnCalcConfirm").kendoButton({
            click:function(e){
                fnCalcConfirm('00');

            }
        });

       // 분리 팝업
        $("#calAdd").kendoButton({
            click:function(e)
            {
                var calcGrid = $("#calcGrid").data("kendoExtGrid"),
                    selectedVal = calcGrid.dataItem(calcGrid.select()),
                    calcData = calcGrid.dataItem("tr:eq(0)"),
                    calcAmt = Number(calcData.calcAmt);

                if(selectedVal==null||selectedVal==""){  //
                    // dms.notification.info("<spring:message code='ser.btn.returnCalc' var='returnCalc' /><spring:message code='global.info.required.preprocess' arguments='${returnCalc}' />");
                     dms.notification.info("<spring:message code='global.info.selectEmptyRowMsg'  />");
                     return;
                }


                // 공임 팝업 열기 함수.
                calcAddPopup = dms.window.popup({
                    windowId:"calcAddPopup"
                    ,height:200
                    ,width:500
                    //,modal:true
                    ,title:"<spring:message code='ser.lbl.seperate' />"
                    ,content:{
                        url:"<c:url value='/ser/cal/calculate/selectCalculatePopup.do'/>"
                        ,data:{
                             "roTp":'01'
                            ,"selectedVal":selectedVal
                            ,"dlrCd":"${dlrCd}"
                            ,"dlrNm":"${dlrNm}"
                            ,"custNm":$("#custNm").val()
                            ,"custNo":$("#custCd").val()
                            ,"callbackFunc":function(calcData){

                                var calcGrid = $("#calcGrid").data("kendoExtGrid");
                                var rowData = calcGrid.dataItem("tr:eq(0)");

                                calcGrid.dataSource.add(calcData);
                                rowData.set("paymAmt", Number(rowData.paymAmt - calcData.paymAmt).toFixed(2));
                                rowData.set("calcAmt", Number(rowData.calcAmt - calcData.calcAmt).toFixed(2));

                            }
                        }
                    }
                });
            }
            ,enable:false
        });

        // 반품
        $("#btnReturn").kendoButton({
            click:function(e){
                var grid           = $("#gridDetail").data("kendoExtGrid"),
                    rows           = grid.tbody.find("tr"),
                    ordStatCd      = $("#ordStatCd").val(),//$("#calcStatCd").val(),
                    chkCnt         = 0,
                    selectGridData = {},
                    saveList       = [],
                    saveData       = {},
                    gridData,
                    header;


                dms.window.confirm({
                    message:"<spring:message code='par.btn.returnCnfm' var='returnCnfm' /><spring:message code='global.info.cnfrmMessage' arguments='${returnCnfm}'/>"
                   ,title :"<spring:message code='global.lbl.info' />"
                   ,callback:function(result){
                        if(result){


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
                                saveData = {};

                                //반품수량이 존재해야만 반품실행
                                if((gridData.giStatCd !== '07') && (gridData.itemQty - gridData.returnQty) > 0){
                                    //gridData.returnQty = gridData.itemQty - gridData.returnQty;

                                    saveData.parSaleOrdNo = gridData.parSaleOrdNo;
                                    saveData.parSaleOrdLineNo = gridData.parSaleOrdLineNo;
                                    saveData.returnQty = gridData.itemQty - gridData.returnQty;
                                    saveData.preReturnQty = gridData.returnQty;
                                    saveData.ordQty = gridData.itemQty;
                                    saveData.dcRate = gridData.dcRate;
                                    saveData.prc = gridData.itemPrc;
                                    saveData.giLocCd = gridData.giLocCd;
                                    saveData.itemCd = gridData.itemCd;
                                    saveData.unitCd = gridData.calcUnitCd;
                                    saveData.giStrgeCd = gridData.giStrgeCd;

                                    saveList.push(saveData);
                                }
                            });

                            if(saveList.length > 0){
                                var data ={
                                       "partsSaleOrdVO":returnObj
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

                                            $("#gridDetail").data("kendoExtGrid").dataSource.read();
                                            $("#ordStatCd").val(result.ordStatCd);
                                            $("#gridHeader").data("kendoExtGrid").dataSource.read();

                                        } else {
                                            if(result === 0){
                                                dms.notification.error("<spring:message code='par.lbl.partsSaleNo' var='parSaleOrdNo' /><spring:message code='global.err.regFailedParam' arguments='${parSaleOrdNo}'/>");
                                            }
                                        }
                                    }
                                    ,beforeSend:function(){
                                        dms.loading.show($("#resizableContainer"));
                                    }
                                    ,complete:function(){
                                        dms.loading.hide($("#resizableContainer"));
                                    }
                                    ,error:function(jqXHR,status,error) {
                                        dms.loading.hide($("#resizableContainer"));
                                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                    }

                                });
                            }else{
                                dms.notification.warning("<spring:message code='global.info.required.selectOne'/>");
                                return false;
                            }
                        }else{
                            //취소버튼 클릭 로직
                            return false;
                        }
                   }
                });
            }
        });

        //정산 취소 버튼
        $("#btnCancel").kendoButton({
            click:function(e){
                var data = [],
                    chkPartsSaleOrd  = {};

                cnclCalcObj.calcDt = kendo.parseDate(cnclCalcObj.calcDt);
                cnclCalcObj.serParDstinCd = 'PAR';
                delete cnclCalcObj.regDt;
                delete cnclCalcObj.updtDt;
                data.push(cnclCalcObj);

                chkPartsSaleOrd = {
                    parSaleOrdNo    :$('#parSaleOrdNo').val()
                   ,updtDtStr       :$("#updtDtStr").val()
                };
                if(!dms.string.isEmpty(cnclCalcObj.roDocNo)){
                    $.ajax({
                        url:"<c:url value='/par/ism/issue/fnChkPartsSaleOrdNoUpdateSomebody.do' />"
                        ,data:JSON.stringify(chkPartsSaleOrd)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            if (result === true) {
                                $.ajax({
                                    url:"<c:url value='/ser/cal/calculate/multiCalculateCancel.do' />"
                                    ,data:JSON.stringify(data)
                                    ,type:'POST'
                                    ,dataType:'json'
                                    ,contentType:'application/json'
                                    ,error:function(jqXHR, status, error){
                                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                    }
                                    ,success:function(result, textStatus){
                                        var  jsonObj = {};

                                        $("#ordStatCd").val('02');
                                        $("#calcStatCd").val('');
                                        $("#calcDocNo").val('');
                                        $("#etcDcTp").val('');
                                        $("#etcDcCd").val('');
                                        $("#etcDcSeq").val(0);
                                        $("#parEtcDcAmt").data("kendoExtNumericTextBox").value(0.00);

                                        $("#gridHeader").data("kendoExtGrid").dataSource.read();
                                        $("#gridDetail").data("kendoExtGrid").dataSource.read();
                                        $("#calcGrid").data("kendoExtGrid").dataSource.read();

                                        dms.notification.success("<spring:message code='global.info.success'/>");

                                        btnControll('02');

                                        jsonObj  = {};
                                        jsonObj.parDcRate = 0;
                                        jsonObj.parDcAmt  = 0;
                                        dcData = jsonObj;

                                        $("#parDcAmt").data("kendoExtNumericTextBox").value(0.00);

                                        setDcData(jsonObj);

                                        if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
                                            return false;
                                        }

                                        partsJs.validate.groupObjAllDataInit();

                                        if (!partsJs.validate.getAllPluginObjInfo($("#dataForm")[0])) {
                                            return false;
                                        }
                                        partsJs.validate.groupObjAllDataInit();
                                    }
                                    ,beforeSend:function(xhr){
                                        dms.loading.show($("#resizableContainer"));
                                    }
                                    ,complete:function(xhr,status){
                                        dms.loading.hide($("#resizableContainer"));
                                    }
                                });
                            }
                        }
                    });
                }else{
                    dms.notification.info("<spring:message code='ser.info.cancelNoData' />");
                }
            }
        });

     // 할인권한
        $("#dcRole").kendoButton({
            click:function(e) {
                dcSearchPopup = dms.window.popup({
                    windowId:"dcSearchWin"
                    , title:"优惠权限"
                    , content:{
                        url:"<c:url value='/ser/cmm/popup/selectDcRatePopup.do'/>"
                        , data:{
                             "dcTp":"01"
                             ,"custNo" : $("#carOwnerId").val()
                             ,"remark" : 'S' //할인권한 SA제외
                             ,"callbackFunc":function(jsonObj) {
                                 //고객만 할인
                                 var lEtcDcTp = $("#etcDcTp").val(),
                                     lEtcDcCd = $("#etcDcCd").val(),
                                     lEtcDcSeq = $("#etcDcSeq").val(),
                                     lParEtcDcAmt = $("#parEtcDcAmt").data("kendoExtNumericTextBox").value();

                                 dcCancel();

                                if(jsonObj!=null){
                                    dcData = jsonObj;

                                    var partsGrid        = $("#gridDetail").data("kendoExtGrid"),
                                        partsRows        = partsGrid.tbody.find("tr"),
                                        dataItem,
                                        partsGridData;           //저장 시 returnQty 삭제하기 위해 사용


                                        partsRows.each(function(index, row) {
                                            dataItem = partsGrid.dataSource.data()[index];
                                            partsGridData = partsGrid.dataSource.at(index);

                                            if(partsGridData.giStatCd !== '07'){
                                                if(jsonObj.dcTp === '02'){
                                                    dataItem.set('dcRate', Number(jsonObj.parDcRate));
                                                    dataItem.set('dcAmt', partsGridData.itemPrc * partsGridData.itemQty * (Number(jsonObj.parDcRate)/100));
                                                    dataItem.set('expcParAmt', (partsGridData.itemPrc * partsGridData.itemQty) - (partsGridData.itemPrc * partsGridData.itemQty * (Number(jsonObj.parDcRate)/100)));
                                                }else if(jsonObj.dcTp === '01'){
                                                    dataItem.set('dcRate', (Number(jsonObj.parDcAmt)/(partsGridData.itemPrc * partsGridData.itemQty))*100);
                                                    dataItem.set('dcAmt', Number(jsonObj.parDcAmt));
                                                    dataItem.set('expcParAmt', (partsGridData.itemPrc * partsGridData.itemQty) - (Number(jsonObj.parDcAmt)));
                                                }
                                            }

                                        });

                                        setDcData(jsonObj);

                                        //할인 권한 선택 시 기타 할인이 금액 인 경우 유지한다.
                                        if(lEtcDcTp === '01'){
                                            $("#etcDcTp").val(lEtcDcTp);
                                            $("#etcDcCd").val(lEtcDcCd);
                                            $("#etcDcSeq").val(lEtcDcSeq);
                                            $("#parEtcDcAmt").data("kendoExtNumericTextBox").value(lParEtcDcAmt);
                                        }

                                }else {
                                    jsonObj  = {};
                                    jsonObj.parDcRate = 0;
                                    jsonObj.parDcAmt  = 0;
                                    jsonObj.dcTp      = '02';
                                    dcData = jsonObj;

                                    var partsGrid        = $("#gridDetail").data("kendoExtGrid"),
                                        partsRows        = partsGrid.tbody.find("tr"),
                                        dataItem,
                                        partsGridData;           //저장 시 returnQty 삭제하기 위해 사용

                                        partsRows.each(function(index, row) {
                                            dataItem = partsGrid.dataSource.data()[index];
                                            partsGridData = partsGrid.dataSource.at(index);

                                            if(partsGridData.giStatCd !== '07'){
                                                dataItem.set('dcRate', 0);
                                                dataItem.set('dcAmt', 0);
                                                dataItem.set('expcParAmt', partsGridData.itemPrc * partsGridData.itemQty);
                                            }

                                        });

                                        setDcData(jsonObj);

                                      //할인 권한 선택 시 기타 할인이 금액 인 경우 유지한다.
                                        if(lEtcDcTp === '01'){
                                            $("#etcDcTp").val(lEtcDcTp);
                                            $("#etcDcCd").val(lEtcDcCd);
                                            $("#etcDcSeq").val(lEtcDcSeq);
                                            $("#parEtcDcAmt").data("kendoExtNumericTextBox").value(lParEtcDcAmt);
                                        }
                                        dcSearchPopup.close();
                                }
                            }
                        }
                    }
                    ,height:400
                });
            }
        });

     // 정산절사
        $("#wonUnitCut").kendoButton({
            click:function(e) {
                var grid    = $("#calcGrid").data("kendoExtGrid"),
                    rowData = grid.dataItem("tr:eq(0)"),
                    paymAmt,
                    calcAmt,
                    wonUnitCutAmt;

                if(rowData != null){
                    calcAmt = Number($("#parCalcSumAmt").data("kendoExtNumericTextBox").value());//Number(rowData.paymAmt);
                    if(wonUnitCutSetValue === "01") {
                        paymAmt = Number(Math.round(calcAmt));
                        wonUnitCutAmt = Number((paymAmt - calcAmt).toFixed(2));
                    } else if(wonUnitCutSetValue === "02") {
                        paymAmt = Number(Math.ceil(calcAmt));
                        wonUnitCutAmt = Number((paymAmt - calcAmt).toFixed(2));
                    } else if(wonUnitCutSetValue === "03") {
                        paymAmt = Number(Math.floor(calcAmt));
                        wonUnitCutAmt = Number(paymAmt - calcAmt).toFixed(2);
                    }


                    rowData.set("wonUnitCutAmt", wonUnitCutAmt);
                    rowData.set("paymAmt", paymAmt);
                } else {
                    dms.notification.success("<spring:message code='ser.info.noWonUnitCutAmt'/>");
                }

            }
            ,enable:false
        });

     // 정산제로
        $("#demicalPointCut").kendoButton({
            click:function(e) {
                var grid = $("#calcGrid").data("kendoExtGrid"),
                    rowData = grid.dataItem("tr:eq(0)");

                if(rowData != null){
                    pointCutPopup = dms.window.popup({
                        windowId:"pointCutPopup"
                        ,title:"<spring:message code='ser.lbl.settClZero' />"
                        ,height:150
                        ,width:500
                        ,content:{
                            url:"<c:url value='/ser/cmm/popup/selectPointCutPopup.do'/>"
                            ,data:{
                                "selectable":"single"
                                ,"rowData":rowData
                                ,"demicalPoint":demicalPointCutValue
                                ,"demicalPointCutCdNm":demicalPointCutCdNm
                                ,"callbackFunc":function(data){
                                    if(Number(data.paymAmt) >= 0){
                                        rowData.set("demicPointCutAmt", data.demicPointCutAmt);
                                        rowData.set("paymAmt", data.paymAmt);
                                    }else{
                                        dms.notification.info("<spring:message code='ser.lbl.calcZeroAmt' var='calcZeroAmt' /><spring:message code='ser.lbl.arCd' var='arCd' /><spring:message code='global.err.chkGreateParam' arguments='${calcZeroAmt}, ${arCd}' />");
                                    }
                                    pointCutPopup.close();
                                }
                            }
                        }
                    });
                } else {
                    dms.notification.success("<spring:message code='ser.info.noDemicalPointCut'/>");
                }
            }
            ,enable:false
        });

         // BM쿠폰 셋팅
        setBmCupnData = function(){

          //bmCancel();

            var grid = $("#bmCupnGrid").data("kendoExtGrid"),
                rowData = grid.dataItem(grid.select()),
                calcGrid = $("#calcGrid").data("kendoExtGrid"),
                calcData = calcGrid.dataSource.data(),
                parBmPointUseAmt = $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value(),
                reduceCost,
                paymAmt;

            reduceCost = Number(rowData.reduceCost).toFixed(1);

            if(calcData != null){
                $.each(calcData, function(i,data){

                    if(data.paymTp == "04"){
                         paymAmt = Number(data.paymAmt - reduceCost);
                        if(paymAmt < 0) {
                            $("#etcBmPointUseAmt").val(Number(data.paymAmt));
                            reduceCost = Number(data.paymAmt);
                        } else {
                            $("#etcBmPointUseAmt").val(Number(reduceCost));
                        }


                        $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value( Number(parBmPointUseAmt) + Number(reduceCost));
                        fnLastCalcAmt();   // 최종정산금액 계산
                        data.calcAmt = (Number(data.calcAmt) - Number(reduceCost)).toFixed(2);
                        data.wonUnitCutAmt = 0;
                        data.demicPointCutAmt = 0;
                        data.paymAmt = data.calcAmt;
                    }
                });
                calcGrid.refresh();
            } else {
                $("#etcBmPointUseAmt").val(Number(reduceCost));
                fnLastCalcAmt();   // 최종정산금액 계산
            }
        };

        // BM쿠폰 취소
        bmCupnCancel = function(){
            var bmCupnAmt        = $("#etcBmPointUseAmt").val(),
                parBmPointUseAmt = $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value(),
                cancelBmCupnAmt  = Number(parBmPointUseAmt) - Number(bmCupnAmt),
                calcData         = $("#calcGrid").data("kendoExtGrid").dataSource.data();

            $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value(cancelBmCupnAmt);
            fnLastCalcAmt();


            $.each(calcData, function(i,data){
                if(data.paymTp == "04"){
                    data.calcAmt = (Number(data.calcAmt) + Number(bmCupnAmt)).toFixed(2);
                    data.wonUnitCutAmt = 0;
                    data.demicPointCutAmt = 0;
                    data.paymAmt = data.calcAmt;
                    data.dcPermNm = "";
                    data.dcPermCd = "";
                }
            });
            $("#calcGrid").data("kendoExtGrid").refresh();
            $("#etcBmPointUseAmt").val(0.0);
        };

     // 딜러포인트 취소
        dealerCancel = function(){
            var pointTotAmt = $("#pointTotAmt").data("kendoExtNumericTextBox").value(),
                dlrPointGrid   = $("#dlrPointGrid").data("kendoExtGrid"),
                dlrRowData     = dlrPointGrid.dataItem("tr:eq(0)"),
                calcData       = $("#calcGrid").data("kendoExtGrid").dataSource.data();

            $("#pointTotAmt").data("kendoExtNumericTextBox").value(0.00);
            dlrRowData.set("occrPointVal", 0);
            dlrRowData.set("dlrUseAmt", 0);
            $("#occrPoint").val(0.00);
            fnLastCalcAmt();



            $.each(calcData, function(i,data){
                if(data.paymTp == "04"){
                    data.calcAmt = (Number(data.calcAmt) + Number(pointTotAmt)).toFixed(2);
                    data.wonUnitCutAmt = 0;
                    data.demicPointCutAmt = 0;
                    data.paymAmt = data.calcAmt;
                    data.dcPermNm = "";
                    data.dcPermCd = "";
                }
            });
            $("#calcGrid").data("kendoExtGrid").refresh();
        };

        //딜러포인트 적용
        setDlrPointData = function(){
            var grid = $("#dlrPointGrid").data("kendoExtGrid"),
                rowData = grid.dataItem("tr:eq(0)"),
                calcGrid = $("#calcGrid").data("kendoExtGrid"),
                calcData = calcGrid.dataSource.data(),
                wonUnitCutAmt,
                demicPointCutAmt,
                occrPointVal,
                paymAmt;

            if(calcData != null){
                $.each(calcData, function(i,v){
                    if(calcData[i].paymTp == "04"){
                        occrPointVal = rowData.dlrUseAmt;
                        paymAmt = Number(calcData[i].paymAmt) - Number(occrPointVal);

                        if(paymAmt < 0) {
                            rowData.set("occrPointVal", 0);
                            dms.notification.info("<spring:message code='ser.lbl.pointUseAmt' var='pointUseAmt' /><spring:message code='ser.lbl.finalCalcAmt' var='finalCalcAmt' /><spring:message code='ser.info.chkMax' arguments='${pointUseAmt}, ${finalCalcAmt}' />");
                        } else {
                            $("#pointTotAmt").data("kendoExtNumericTextBox").value(Number(occrPointVal));
                            $("#occrPoint").val(Number(rowData.occrPointVal));
                            fnLastCalcAmt();   // 최종정산금액 계산
                            if(dms.string.isEmpty(calcData[i].wonUnitCutAmt)){
                                wonUnitCutAmt = 0;
                            }else{
                                wonUnitCutAmt = calcData[i].wonUnitCutAmt;

                            }
                            if(dms.string.isEmpty(calcData[i].demicPointCutAmt)){
                                demicPointCutAmt = 0;
                            }else{
                                demicPointCutAmt = calcData[i].demicPointCutAmt;

                            }
                            calcData[i].calcAmt = Number($("#parCalcSumAmt").data("kendoExtNumericTextBox").value()).toFixed(2);
                            calcData[i].wonUnitCutAmt = 0;
                            calcData[i].demicPointCutAmt = 0;
                            calcData[i].paymAmt = Number($("#parCalcSumAmt").data("kendoExtNumericTextBox").value()).toFixed(2);
                        }
                    }
                });
                calcGrid.refresh();
            } else {
                $("#pointTotAmt").data("kendoExtNumericTextBox").value(Number(occrPointVal));
                fnLastCalcAmt();   // 최종정산금액 계산
            }

        };

       // BM포인트 셋팅
        setBmPointData = function(){

            bmCancel('N');

            var grid             = $("#bmPointGrid").data("kendoExtGrid"),
                rowData          = grid.dataItem("tr:eq(0)"),
                cosumePoints     = rowData.consumePoints * Number($("#bmPointScale").val()).toFixed(1),
                calcGrid         = $("#calcGrid").data("kendoExtGrid"),
                parBmPointUseAmt = $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value(),
                calcData         = calcGrid.dataSource.data(),
                paymAmt;

            if(calcData != null){
                $.each(calcData, function(i,data){

                    if(data.paymTp == "04"){
                         paymAmt = Number(data.paymAmt - cosumePoints);

                        if(paymAmt < 0) {
                            rowData.set("consumePoints", 0);
                            dms.notification.info("<spring:message code='ser.lbl.pointUseAmt' var='pointUseAmt' /><spring:message code='ser.lbl.finalCalcAmt' var='finalCalcAmt' /><spring:message code='ser.info.chkMax' arguments='${pointUseAmt}, ${finalCalcAmt}' />");
                        } else {
                            $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value(Number(parBmPointUseAmt) + Number(cosumePoints));
                            fnLastCalcAmt();   // 최종정산금액 계산
                            data.calcAmt = (Number(data.calcAmt) - Number(cosumePoints)).toFixed(2);
                            data.wonUnitCutAmt = 0;
                            data.demicPointCutAmt = 0;
                            data.paymAmt = data.calcAmt;
                        }
                    }
                });
                calcGrid.refresh();
            } else {
                $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value(Number(cosumePoints));
                fnLastCalcAmt();   // 최종정산금액 계산
            }
        };

     // 블루멤버스 취소setDlrPointData
        bmCancel = function(pType){
            var bmCupnAmt = $("#etcBmPointUseAmt").val(),
                parBmPointUseAmt = $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value(),
                cancelBmPointTotAmt = Number(parBmPointUseAmt) - Number(bmCupnAmt),
                bmPointGrid = $("#bmPointGrid").data("kendoExtGrid"),
                bmRowData = bmPointGrid.dataItem("tr:eq(0)"),
                calcData = $("#calcGrid").data("kendoExtGrid").dataSource.data();

            $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value(Number(bmCupnAmt));
            if(pType !== 'N'){
                bmRowData.set("consumePoints", 0);
                bmRowData.set("bmUseAmt", 0);
            }
            fnLastCalcAmt();


            $.each(calcData, function(i,data){
                if(data.paymTp == "04"){
                    data.calcAmt = (Number(data.calcAmt) + Number(cancelBmPointTotAmt)).toFixed(2);
                    data.wonUnitCutAmt = 0;
                    data.demicPointCutAmt = 0;
                    data.paymAmt = data.calcAmt;
                    data.dcPermNm = "";
                    data.dcPermCd = "";
                }
            });
            $("#calcGrid").data("kendoExtGrid").refresh();
        };

     // 기타할인
        setEtcDcAmt = function() {
            var grid           = $("#dcGrid").data("kendoExtGrid"),
                rowData        = grid.dataItem(grid.select()),
                calcGrid       = $("#calcGrid").data("kendoExtGrid"),
                calcData       = calcGrid.dataSource.data(),
                parCalcSumAmt  = $("#parCalcSumAmt").data("kendoExtNumericTextBox").value(),
                parTotAmt,
                parEtcDcAmt;

            if(rowData != null){
                if(rowData.dcPermTp == "02" && (rowData.totCnt - rowData.useCnt) <= 0){
                    dms.notification.info("<spring:message code='ser.info.dcCntNotUse'/>");
                    return false;
                }

                //할인율인경우
                if(rowData.dcTp === '02'){

                    dcCancel();

                    $("#etcDcTp").val(rowData.dcTp);
                    $("#etcDcCd").val(rowData.dcCd);
                    $("#etcDcSeq").val(rowData.dcSeq);

                    dcData = {
                        parDcRate : rowData.subDcAmt
                       ,parDcAmt  : 0
                       ,dcTp      : rowData.dcTp
                    };

                    var partsGrid        = $("#gridDetail").data("kendoExtGrid"),
                        partsRows        = partsGrid.tbody.find("tr"),
                        dataItem,
                        partsGridData;           //저장 시 returnQty 삭제하기 위해 사용

                        partsRows.each(function(index, row) {
                            dataItem = partsGrid.dataSource.data()[index];
                            partsGridData = partsGrid.dataSource.at(index);

                            if(partsGridData.giStatCd !== '07'){
                                dataItem.set('dcRate', Number(dcData.parDcRate));
                                dataItem.set('dcAmt', partsGridData.itemPrc * partsGridData.itemQty * (Number(dcData.parDcRate)/100));
                                dataItem.set('expcParAmt', (partsGridData.itemPrc * partsGridData.itemQty) - (partsGridData.itemPrc * partsGridData.itemQty * (Number(dcData.parDcRate)/100)));
                            }
                        });

                    setDcData(dcData);
                //할인금액인 경우
                }else{

                    $("#etcDcTp").val(rowData.dcTp);
                    $("#etcDcCd").val(rowData.dcCd);
                    $("#etcDcSeq").val(rowData.dcSeq);

                    parTotAmt = Number(parCalcSumAmt) - Number(rowData.subDcAmt);

                    parEtcDcAmt = 0;

                    if(parTotAmt < 0){
                        parEtcDcAmt = Number(parCalcSumAmt).toFixed(2);
                    } else {
                        parEtcDcAmt = Number(rowData.subDcAmt).toFixed(2);
                    }

                    $("#parEtcDcAmt").data("kendoExtNumericTextBox").value(Number(parEtcDcAmt));

                    fnLastCalcAmt();

                    $.each(calcData, function(i,data){
                        if(data.paymTp == "04"){
                            data.calcAmt = (Number(data.calcAmt) - Number(parEtcDcAmt)).toFixed(2);
                            data.wonUnitCutAmt = 0;
                            data.demicPointCutAmt = 0;
                            data.paymAmt = data.calcAmt;
                        }
                    });

                    calcGrid.refresh();
                }
            }
        };

        // 기타할인 초기화
        dcCancel = function() {
            var dcGrid      = $("#dcGrid").data("kendoExtGrid"),
                partsGrid   = $("#gridDetail").data("kendoExtGrid"),
                partsRows   = partsGrid.tbody.find("tr"),
                rowData     = dcGrid.dataItem(dcGrid.select()),
                calcData    = $("#calcGrid").data("kendoExtGrid").dataSource.data(),
                jsonObj     = {},
                dataItem,
                partsGridData;           //저장 시 returnQty 삭제하기 위해 사용

            jsonObj.parDcRate = 0;
            jsonObj.parDcAmt  = 0;
            dcData = jsonObj;

            $("#etcDcTp").val("");
            $("#etcDcCd").val("");
            $("#etcDcSeq").val(0);
            $("#parEtcDcAmt").data("kendoExtNumericTextBox").value(0.00);

            partsRows.each(function(index, row) {
                dataItem = partsGrid.dataSource.data()[index];
                partsGridData = partsGrid.dataSource.at(index);

                if(partsGridData.giStatCd !== '07'){
                    dataItem.set('dcRate', 0);
                    dataItem.set('dcAmt', 0);
                    dataItem.set('expcParAmt', partsGridData.itemPrc * partsGridData.itemQty);
                }

            });

            setDcData(dcData);
        };

        /************************************************************
                그리드 설정
        *************************************************************/
        $("#gridHeader").kendoExtGrid({
            gridId:"G-PAR-0519-185101"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issue/selectPartsSaleOrds.do' />"
                        , dataType:"json"
                        , type:"POST"
                        , contentType:"application/json;"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                sOrdStatCdLst = $("#sOrdStatCd").data("kendoExtMultiSelectDropDownList").value();

                            if(dms.string.isEmpty(sOrdStatCdLst[0])){

                                sOrdStatCdLst.splice(0,1);
                            }

                            if(sOrdStatCdLst.length === 0){
                                sOrdStatCdLst = ['02', '04', '05'];
                            }

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 부품판매 검색조건 코드.
                            params["sCustTp"]            = $("#sCustTp").data("kendoExtDropDownList").value();
                            params["sParSaleOrdNo"]      = $("#sParSaleOrdNo").val();
                            params["sOrdStatLst"]        = sOrdStatCdLst;
                            params["sSaleTp"]            = $("#sSaleTp").data("kendoExtDropDownList").value();
                            params["sCustCd"]            = $("#sCustCd").val();
                            params["sCustNm"]            = $("#sCustNm").val();
                            params["sSaNm"]              = $("#sSaNm").val();
                            params["sOrdDtFr"]           = $("#sOrdDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sOrdDtTo"]           = $("#sOrdDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sItemCntFr"]         = $("#sItemCntFr").data("kendoExtNumericTextBox").value();
                            params["sItemCntTo"]         = $("#sItemCntTo").data("kendoExtNumericTextBox").value();
                            params["sItemQty"]           = $("#sItemQty").data("kendoExtNumericTextBox").value();
                            params["sItemAmtFr"]         = $("#sItemAmtFr").data("kendoExtNumericTextBox").value();
                            params["sItemAmtTo"]         = $("#sItemAmtTo").data("kendoExtNumericTextBox").value();
                            params["sCustTelNo"]         = $("#sCustTelNo").data("kendoMaskedTextBox").value();
                            params["sCalcDocNo"]         = $("#sCalcDocNo").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:true
                ,schema:{
                    data:"data"
                    , total:"total"
                    , model:{
                        id:"parSaleOrdNo"
                        , fields:{
                              dlrCd         :{ type:"string" }
                            , ordDt         :{ type:"date" }
                            , calcDt        :{ type:"date"  }
                            , custTp        :{ type:"string" }
                            , custCd        :{ type:"string" }
                            , custNm        :{ type:"string" }
                            , salePrsnId    :{ type:"string" }
                            , saId          :{ type:"string" }
                            , parSaleOrdNo  :{ type:"string" }
                            , saleTp        :{ type:"string" }
                            , salePrsnNm    :{ type:"string" }
                            , ordStatCd     :{ type:"string" }
                            , calcDocNo     :{ type:"string" }
                            , custTelNo     :{ type:"string" }
                            , remark        :{ type:"string" }
                            , calcStatCd    :{ type:"string" }
                            , dcBefTotAmt   :{ type:"number" }
                            , dcAmt         :{ type:"number" }
                            , totAmt        :{ type:"number" }
                            , dcRate        :{ type:"number" }
                            , vatAmt        :{ type:"number" }
                            , itemCnt       :{ type:"number" }
                            , itemQty       :{ type:"number" }
                            , itemAmt       :{ type:"number" }
                            , parBmPointUseAmt  :{ type:"number" }
                            , pointTotAmt    :{ type:"number" }
                            , parEtcDcAmt       :{ type:"number" }
                            , parCalcSumAmt     :{ type:"number" }
                            , parDcRate         :{ type:"number" }
                            , parDcAmt          :{ type:"number" }
                            , parCalcAmt        :{ type:"number" }
                            , updtDtStr     :{ type:"string" }
                            , etcDcCd       :{ type:"string" }
                            , etcDcTp       :{ type:"string" }
                        }
                    }
                }
            }
            ,selectable:"row"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,sortable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,height:220
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());
                //부품판매정산헤더 변경
                gridHeaderChanged(selectedItem);
            }
            ,dataBound:function(e) {
                var rows = e.sender.tbody.children(),
                    rowLen = rows.length;
                if(rowLen === 1 && !dms.string.isEmpty(linkParSaleOrdNo)){
                    $.each(rows, function(idx, row){
                        var row = $(rows[idx]);
                        var dataItem = e.sender.dataItem(row);

                        if( dataItem != null && dataItem != 'undefined'){
                            if(dataItem.parSaleOrdNo == linkParSaleOrdNo){
                                e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                                //부품판매정산헤더 변경

                                gridHeaderChanged(dataItem);
                            }
                        }
                    });
                }

            }
            ,columns:[
                 {field:"dlrCd"
                     ,title:"<spring:message code='par.lbl.dlrCd' />"
                     ,width:105
                     ,hidden:true}  //딜러 코드
                ,{field:"ordDt"
                     ,title     :"<spring:message code='par.lbl.partsSaleOrdDt' />"
                     ,attributes:{"class":"ar"}
                     ,format    :"{0:<dms:configValue code='dateFormat' />}"
                     ,width     :90}
                ,{field:"parSaleOrdNo"
                     ,title:"<spring:message code='par.lbl.partsSaleNo' />"
                     ,width:160}//부품판매번호
                 ,{field:"ordStatCd"
                     ,title:"<spring:message code='par.lbl.partsSaleStat' />"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:100
                     ,template:function(dataItem){

                         var spanObj = "";

                         switch(dataItem.ordStatCd)
                         {
                             case "02":// 완료

                                 spanObj = "<span class='txt_label bg_blue'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                 break;

                             case "03":// 취소

                                 spanObj = "<span class='txt_label bg_red'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                 break;

                             case "04":// 정산

                                 spanObj = "<span class='txt_label bg_yellow'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                 break;

                             case "05":// 수납

                                 spanObj = "<span class='txt_label bg_orange'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                 break;

                             case "07":// 반품

                                 spanObj = "<span class='txt_label bg_red'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                 break;

                             default: // 등록

                                 spanObj = "<span class='txt_label bg_gray'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                 break;
                         }

                         return spanObj;
                     }
                }                //상태
                ,{field:"calcDocNo"
                     ,title:"<spring:message code='par.lbl.calcNo' />"
                     ,width:160}//정산번호
                ,{field:"custTp"
                     ,title:"<spring:message code='par.lbl.custTp' />"
                     ,template:'#= changeCustTp(custTp)#'
                     ,width:100 }  //고객유형
                ,{field:"custNm"
                     ,title:"<spring:message code='par.lbl.bpCst' />"
                     ,width:140 }  //고객명
                ,{field:"custTelNo"
                     ,title:"<spring:message code='par.title.venderTel' />"
                     ,width:120}//고객전화번호
                ,{field:"custCd"
                     ,title:"<spring:message code='par.lbl.custCd' />"
                     ,width:105
                     }  //고객 코드
                ,{field:"salePrsnNm"
                     ,title:"<spring:message code='par.lbl.partsSalePrsn' />"
                     ,width:140 }  //판매담당자
                ,{field:"salePrsnId"
                     ,title:"<spring:message code='par.lbl.partsSalePrsn' />"
                     ,width:140
                     ,hidden     :true}  //판매담당자
                ,{field:"saleTp"
                     ,title:"<spring:message code='par.lbl.partsSalePrcTp' />"
                     ,template:'#= changeSaleTp(saleTp)#'
                     ,width:100 }  //판매유형
                ,{field:"itemCnt"
                    ,title:"<spring:message code='par.lbl.parSaleCnt' />"
                    ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                 }      //건수
                ,{field:"itemQty"
                    ,title:"<spring:message code='par.lbl.parSaleQty' />"
                    ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                 }      //건수
                ,{field      :"dcBefTotAmt"
                     ,title      :"<spring:message code='par.lbl.totAmtBefDc' />"
                     ,attributes :{"class":"ar"}
                     ,format     :"{0:n2}"
                     ,decimal    :0
                     ,width      :80}//총금액
                ,{field      :"dcAmt"
                     ,title      :"<spring:message code='sal.lbl.dcAmt' />"
                     ,attributes :{"class":"ar"}
                     ,format     :"{0:n2}"
                     ,decimal    :0
                     ,width      :80}//할인금액
                ,{field      :"totAmt"
                     ,title      :"<spring:message code='par.lbl.totAmt' />"
                     ,attributes :{"class":"ar"}
                     ,format     :"{0:n2}"
                     ,decimal    :0
                     ,width      :80}//총액
                ,{field      :"vatAmt"
                     ,title      :"<spring:message code='par.lbl.totAmt' />"
                     ,attributes :{"class":"ar"}
                     ,format     :"{0:n2}"
                     ,decimal    :0
                     ,width      :80
                     ,hidden     :true}//세액
                 ,{field:"calcDt"
                     ,title:"<spring:message code='par.lbl.calcDt' />"
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:90 }                //정산일
                ,{field      :"dcRate"
                     ,title      :"<spring:message code='par.lbl.dcRate' />"
                     ,attributes :{"class":"ar"}
                     ,format     :"{0:n2}"
                     ,decimal    :0
                     ,width      :80
                     ,hidden     :true}//할인율
                ,{field      :"calcStatCd"       ,hidden     :true}//정산상태
                ,{field      :"parBmPointUseAmt" ,hidden     :true}//블루멤버쉽사용금액
                ,{field      :"pointTotAmt"   ,hidden     :true}//딜러포인트사용금액
                ,{field      :"parEtcDcAmt"      ,hidden     :true}//기타할인율 금액
                ,{field      :"parCalcSumAmt"    ,hidden     :true}//정산 총 합계금액
                ,{field      :"parDcRate"        ,hidden     :true}//부품할인율(정산정보)
                ,{field      :"parDcAmt"         ,hidden     :true}//부품할인금액(정산정보)
                ,{field      :"parCalcAmt"       ,hidden     :true}//부품정산금액
                ,{field      :"remark"
                     ,title      :"<spring:message code='par.lbl.remark' />"
                     ,format     :"{0:n2}"
                     ,decimal    :0
                     ,width      :80
                     ,hidden     :true}//비고
                ,{field      :"updtDtStr", hidden:true}//수정일시
                ,{field      :"etcDcCd", hidden:true}//기타할인번호
                ,{field      :"etcDcTp", hidden:true}//기타할인유형
            ]
        });

        //  고객유형
        changeCustTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = custTpObj[val];
            }
            return returnVal;
        };

        //  판매유형
        changeSaleTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = saleTpObj[val];
            }
            return returnVal;
        };

        /**
         * grid 단가&수량
         */
         changeAmtEditor = function(container, options) {

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
         * grid 할인율
         */
         changeDcRateEditor = function(container, options) {

             var input = $("<input/>"),
                 orgVal,
                 pValue,
                 compDcRate,
                 succYn = 'Y',
                 grid     = $("#gridDetail").data("kendoExtGrid"),
                 rowIndex = grid.items().index(grid.select()),
                 dataItem = grid.dataSource.at(rowIndex);


             input.attr("name", options.field);
             orgVal = input.val();

             //브라우저가 ie인 경우
             if(dms.browser.isMsie()){
                 input.keydown(function(e){
                     e = (e) ? e : window.event; // check if e is defined
                     var kc = (e) ? e.which : e.keyCode; // assign keyCode
                     if (kc == 13) {
                         //enter was pressed
                         var params       = {},
                         sDcPermTpLst = [],
                         parDcPermTpLen,
                         j = 0;

                     pValue =  $(this).val();
                     parDcPermTpLen = parDcPermTpList.length;
                     for(var i = 0; i < parDcPermTpLen; i = i + 1){
                         if('S' != parDcPermTpList[i].remark1){
                               sDcPermTpLst[j] = parDcPermTpList[i].cmmCd;
                               j = j + 1;
                         }
                     }

                     params["sCustNo"]      = $("#carOwnerId").val();
                     params["sDcUseYn"]     = "Y";
                     params["sDcDstinCd"]   = "PEM";
                     params["sDcPermTpLst"] = sDcPermTpLst;
                     params["sToday"] = new Date("${sysDate}");

                     $.ajax({
                         url:"<c:url value='/ser/svi/dcMaster/selectParMaxDcRate.do' />"
                         ,data:JSON.stringify(params)
                         ,async : false
                         ,type:'POST'
                         ,dataType:'json'
                         ,contentType:'application/json'
                         ,error:function(jqXHR, status, error){
                             dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                         }
                         ,success:function(result, textStatus){
                             if(result.total === 0){
                                 dms.notification.warning("<spring:message code='ser.lbl.dcRole' var='dcRole' /><spring:message code='global.info.emptyParamInfo' arguments='${dcRole}'/>");
                                 succYn = 'N';
                                 setDcData(dcData);
                             }else{
                                 if(options.field === 'dcRate'){
                                     compDcRate = pValue;
                                 }else{
                                     compDcRate = (Number(pValue)/(options.model.itemPrc * options.model.itemQty)) * 100 ;
                                 }
                                 if(Number(compDcRate) > Number(result.data[0].parDcRate)){
                                     dms.notification.warning("<spring:message code='ser.lbl.dcRole' var='dcRole' /><spring:message code='global.lbl.parDcRate' var='parDcRate' /><spring:message code='sal.info.maxInfoChk' arguments='${dcRole},${parDcRate}'/>");
                                     succYn = 'N';
                                     setDcData(dcData);
                                 }else{
                                     if(options.field === 'dcRate'){
                                         if(pValue === 0){
                                             options.model.set("dcAmt",      0);
                                             options.model.set("expcParAmt", options.model.itemPrc * options.model.itemQty);
                                         }else{

                                             if(Number(pValue) > 100){
                                                 dms.notification.info("<spring:message code='par.lbl.cstDcRate' var='cstDcRate' /><spring:message code='sal.info.maxInfoChk' arguments='${cstDcRate},100' />");
                                                 succYn = 'N';
                                             }else{
                                                 succYn = 'Y';
                                                 options.model.set("dcAmt",      options.model.itemPrc * options.model.itemQty * (pValue/100));
                                                 options.model.set("expcParAmt", (options.model.itemPrc * options.model.itemQty) - (options.model.itemPrc * options.model.itemQty * (pValue/100)));
                                             }
                                         }

                                     }else if(options.field === 'dcAmt'){
                                         if(pValue === 0){
                                             options.model.set("dcRate",      0);
                                             options.model.set("expcParAmt", options.model.itemPrc * options.model.itemQty);
                                         }else{
                                             if(Number(pValue) > Number(options.model.partCost)){
                                                 dms.notification.info("<spring:message code='par.lbl.cstDcAmt' var='cstDcAmt' /><spring:message code='par.lbl.partsSaleAmt' var='partsSaleAmt' /><spring:message code='sal.info.maxInfoChk' arguments='${cstDcAmt},${partsSaleAmt}' />");
                                                 succYn = 'N';
                                             }else{
                                                 succYn = 'Y';
                                                 options.model.set("dcRate",     ((Number(pValue)/(options.model.itemPrc * options.model.itemQty)) * 100).toFixed(2) );
                                                 options.model.set("expcParAmt", (options.model.itemPrc * options.model.itemQty) - (Number(pValue)));
                                             }
                                         }

                                     }
                                 }
                             }
                             setDcData(dcData);
                         }
                     });
                     }
                 })
             }

             input.change(function(){
                 var params       = {},
                     sDcPermTpLst = [],
                     parDcPermTpLen,
                     j = 0;

                 pValue =  $(this).val();
                 parDcPermTpLen = parDcPermTpList.length;
                 for(var i = 0; i < parDcPermTpLen; i = i + 1){
                     if('S' != parDcPermTpList[i].remark1){
                           sDcPermTpLst[j] = parDcPermTpList[i].cmmCd;
                           j = j + 1;
                     }
                 }

                 params["sCustNo"]      = $("#carOwnerId").val();
                 params["sDcUseYn"]     = "Y";
                 params["sDcDstinCd"]   = "PEM";
                 params["sDcPermTpLst"] = sDcPermTpLst;
                 params["sToday"] = new Date("${sysDate}");

                 $.ajax({
                     url:"<c:url value='/ser/svi/dcMaster/selectParMaxDcRate.do' />"
                     ,data:JSON.stringify(params)
                     ,async : false
                     ,type:'POST'
                     ,dataType:'json'
                     ,contentType:'application/json'
                     ,error:function(jqXHR, status, error){
                         dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                     }
                     ,success:function(result, textStatus){
                         if(result.total === 0){
                             dms.notification.warning("<spring:message code='ser.lbl.dcRole' var='dcRole' /><spring:message code='global.info.emptyParamInfo' arguments='${dcRole}'/>");
                             succYn = 'N';
                             setDcData(dcData);
                         }else{
                             if(options.field === 'dcRate'){
                                 compDcRate = pValue;
                             }else{
                                 compDcRate = (Number(pValue)/(options.model.itemPrc * options.model.itemQty)) * 100 ;
                             }
                             if(Number(compDcRate) > Number(result.data[0].parDcRate)){
                                 dms.notification.warning("<spring:message code='ser.lbl.dcRole' var='dcRole' /><spring:message code='global.lbl.parDcRate' var='parDcRate' /><spring:message code='sal.info.maxInfoChk' arguments='${dcRole},${parDcRate}'/>");
                                 succYn = 'N';
                                 setDcData(dcData);
                             }else{
                                 if(options.field === 'dcRate'){
                                     if(pValue === 0){
                                         options.model.set("dcAmt",      0);
                                         options.model.set("expcParAmt", options.model.itemPrc * options.model.itemQty);
                                     }else{

                                         if(Number(pValue) > 100){
                                             dms.notification.info("<spring:message code='par.lbl.cstDcRate' var='cstDcRate' /><spring:message code='sal.info.maxInfoChk' arguments='${cstDcRate},100' />");
                                             succYn = 'N';
                                         }else{
                                             succYn = 'Y';
                                             options.model.set("dcAmt",      options.model.itemPrc * options.model.itemQty * (pValue/100));
                                             options.model.set("expcParAmt", (options.model.itemPrc * options.model.itemQty) - (options.model.itemPrc * options.model.itemQty * (pValue/100)));
                                         }
                                     }

                                 }else if(options.field === 'dcAmt'){
                                     if(pValue === 0){
                                         options.model.set("dcRate",      0);
                                         options.model.set("expcParAmt", options.model.itemPrc * options.model.itemQty);
                                     }else{
                                         if(Number(pValue) > Number(options.model.partCost)){
                                             dms.notification.info("<spring:message code='par.lbl.cstDcAmt' var='cstDcAmt' /><spring:message code='par.lbl.partsSaleAmt' var='partsSaleAmt' /><spring:message code='sal.info.maxInfoChk' arguments='${cstDcAmt},${partsSaleAmt}' />");
                                             succYn = 'N';
                                         }else{
                                             succYn = 'Y';
                                             options.model.set("dcRate",     ((Number(pValue)/(options.model.itemPrc * options.model.itemQty)) * 100).toFixed(2) );
                                             options.model.set("expcParAmt", (options.model.itemPrc * options.model.itemQty) - (Number(pValue)));
                                         }
                                     }

                                 }
                             }
                         }
                         setDcData(dcData);
                     }
                 });

             });

             input.blur(function(){
                 if(succYn === 'N'){
                     options.model.set("dcRate",      0);
                     options.model.set("dcAmt",       0);
                     options.model.set("expcParAmt", options.model.itemPrc * options.model.itemQty);
                 }
                 setDcData(dcData);
             });

             input.appendTo(container);
             input.kendoExtNumericTextBox({
                 format: "n2"
                 ,decimals:2
                 ,restrictDecimals: true
                 ,min:0
                 ,spinners:false
             });
         };

        $("#gridDetail").kendoExtGrid({
             gridId:"G-PAR-0519-185004"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issue/selectPartsSaleOrdCalcItemByKey.do' />"
                        , dataType:"json"
                        , type:"POST"
                        , async:false
                        , contentType:"application/json;"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params  = {};

                            params["sParSaleOrdNo"]  = $("#parSaleOrdNo").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function (result){

                        var dataLen = result.data.length;
                        for(var i = 0; i < dataLen; i = i + 1 ){
                            g_viewDcRate = result.data[i].dcRate;

                            if(g_viewDcRate !== result.data[i].dcRate){
                                g_viewDcRate = 0;
                            }
                        }
                        return result.data;
                    }
                    , total:"total"
                    , model:{
                         id:"itemCd"
                        ,fields:{
                              dlrCd             :{ type:"string", editable:false }
                            , itemCd            :{ type:"string", editable:false } //부번
                            , itemNm            :{ type:"string", editable:false } //품명
                            , pkgItemCd         :{ type:"string", editable:false } //부번
                            , pkgItemNm         :{ type:"string", editable:false } //품명
                            , itemQty           :{ type:"number", editable:false } //판매수량
                            , returnQty         :{ type:"number", editable:false } //반품수량
                            , itemPrc           :{ type:"number", editable:false } //판매단가
                            , roTp              :{ type:"string", editable:false } //RO 유형
                            , paymTp            :{ type:"string", editable:false } //결제 유형
                            , paymUsrNm         :{ type:"string", editable:false } //결제자
                            , calcUnitCd        :{ type:"string", editable:false } //단위
                            , expcParAmt        :{ type:"number" } //부품비용
                            , dcRate            :{ type:"number", editable:true } //할인율
                            , dcAmt             :{ type:"number" } //할인금액
                            , partCost          :{ type:"number", editable:false } //금액
                            , giStrgeCd         :{ type:"string", editable:false } //창고
                            , giStatCd          :{ type:"string", editable:false } //상ㅌㅐ
                            , movingAvgPrc      :{ type:"number", editable:false }
                            , movingAvgTaxDdctPrc:{ type:"number", editable:false }
                            , movingAvgAmt      :{ type:"number", editable:false }
                            , movingAvgTaxDdctAmt:{ type:"number", editable:false }
                          }
                    }
                }
            }
            ,selectable:"multiple"
            ,autoBind:false
            ,edit:function(e){
                var eles = e.container.find("input"),
                    grid = this,
                    rows = e.sender.select(),
                    selectedItem = e.sender.dataItem(rows[0]),
                    ordStatCd = $("#ordStatCd").val(),
                    input = e.container.find(".k-input"),
                    pVal,
                    orgVal,
                    tDate,
                    fieldName = grid.columns[e.container.index()].field;


                if(fieldName === "dcRate"){
                    if(ordStatCd !== '02'){
                        this.closeCell();
                    }else{
                        if(selectedItem.giStatCd === '07'){
                            this.closeCell();
                        }
                    }
                }else if(fieldName === "dcAmt"){
                    if(ordStatCd !== '02'){
                        this.closeCell();
                    }else{
                        if(selectedItem.giStatCd === '07'){
                            this.closeCell();
                        }
                    }
                }else if(fieldName === "expcParAmt"){
                    this.closeCell();
                }
             }
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,pageable:false
            ,scrollable :true
            ,sortable:false
            ,height:130
            ,columns:[
                 {//딜러코드
                      title     :"<spring:message code='par.lbl.dlrCd' />"
                     ,field     :"dlrCd"
                     ,width     :80
                     ,hidden    :true
                  }
                , {   //부품판매상태
                     title:"<spring:message code='par.lbl.partsSaleStat' />"
                    ,field:"giStatCd"
                    ,attributes:{ "style":"text-align:center"}
                    ,width:90
                    //,template:'#= changeGiStatCd(giStatCd)#'
                    ,template:function(dataItem){

                        var spanObj = "";
                        switch(dataItem.giStatCd)
                        {
                            case "01":// 등록

                                spanObj = "<span class='txt_label bg_gray'>"+ordItemStatCdObj[dataItem.giStatCd]+"</span>";

                                break;

                            case "07":// 반품

                                spanObj = "<span class='txt_label bg_red'>"+ordItemStatCdObj[dataItem.giStatCd]+"</span>";

                                break;

                            default: // 판매완료

                                spanObj = "<span class='txt_label bg_blue'>"+ordItemStatCdObj[dataItem.giStatCd]+"</span>";

                                break;
                        }

                        return spanObj;
                    }
                    ,sortable:false
                  }
                 ,{//부품번호
                      field     :"itemCd"
                     ,title     :"<spring:message code='par.lbl.itemCd' />"
                     ,width     :100
                  }
                 ,{   //패키지
                     title:"<spring:message code='par.lbl.package' />"
                    ,field:"pkgItemCd"
                    ,width:100
                    ,hidden:true
                  }
                 ,{   //패키지명
                     title:"<spring:message code='par.lbl.package' />"
                    ,field:"pkgItemNm"
                    ,width:100
                  }
                 ,{//부품명
                      field     :"itemNm"
                     ,title     :"<spring:message code='par.lbl.itemNm' />"
                     ,width     :200
                   }
                 ,{field:"giTp", title:"<spring:message code='global.lbl.giTp' />", width:70,hidden:true}
                 ,{//수량
                     field      :"itemQty"
                    ,title      :"<spring:message code='par.lbl.qty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,decimal    :0
                    ,width      :80
                 }
                 ,{//반품수량
                     field      :"returnQty"
                    ,title      :"<spring:message code='par.lbl.preReturnPartsQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,decimal    :0
                    ,width      :80
                 }
                 ,{//금액
                     field      :"itemPrc"
                    ,title      :"<spring:message code='par.lbl.partsSalePrc' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :80
                 }
                 ,{field:"partCost", title:"<spring:message code='par.lbl.partsSaleAmt' />", width:90,format:"{0:n2}", attributes:{"class":"ar"}}// 예정부품대
                 ,{field:"movingAvgPrc" ,title:"<spring:message code='par.lbl.stockCost' />" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120}//입고이동평균단가
                 ,{field:"movingAvgTaxDdctPrc" ,title:"<spring:message code='par.lbl.stockCost' />(<spring:message code='par.lbl.taxSprt' />)" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120}//입고이동평균단가(세금제외)
                 ,{field:"movingAvgAmt" ,title:"<spring:message code='par.lbl.movingAvgCost' />" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120}//입고이동평균단가
                 ,{field:"movingAvgTaxDdctAmt" ,title:"<spring:message code='par.lbl.movingAvgCost' />(<spring:message code='par.lbl.taxSprt' />)" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120}//입고이동평균단가(세금제외)
                 ,{field:"dcRate", title:"<spring:message code='par.lbl.cstDcRate' />", width:60, attributes:{"class":"ar"}
                    ,format:"{0:n0}"
                    ,editor:changeDcRateEditor
                    ,template:function(dataItem){
                        var spanObj = "";
                            spanObj = dataItem.dcRate + "%";

                        return spanObj;
                    }
                 }                     // 할인율
                 ,{field:"dcAmt",title:"<spring:message code='par.lbl.cstDcAmt' />",width:90
                    ,attributes:{ "class":"ar"} ,format:"{0:n2}"
                    ,editor:changeDcRateEditor}//할인금액
                 ,{field:"expcParAmt",title:"<spring:message code='par.lbl.partSaleCost' />"
                    ,width:90,attributes:{ "class":"ar"},format:"{0:n2}"}//부품비용
                 ,{field:"paymTp", title:"<spring:message code='ser.lbl.payTp' />", width:70
                     ,template:"#=paymTpCdGrid(paymTp)#"
                 }   // 결제유형
                 ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payerNm' />", width:70}                        // 결제자
                 , {//단위
                     field      :"calcUnitCd"
                    ,title      :"<spring:message code='par.lbl.unitNm' />"
                    ,attributes :{"class":"ac"}
                    ,template   :'#= changeUnitCd(calcUnitCd)#'
                    ,width      :80
                    ,hidden    :true
                 }
                 , {//창고
                     field      :"giStrgeCd"
                    ,title      :"<spring:message code='par.lbl.giStrgeCd' />"
                    ,template   :'#= changeStrgeCd(giStrgeCd)#'
                    ,width      :100
                    ,hidden    :true
                 }
            ]
        });

        $("#calcGrid").kendoExtGrid({
             gridId:"G-PAR-0817-152303"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/cal/calculate/selectCalculateDetails.do' />"
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sCalcDocNo"] = $("#calcDocNo").val();

                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    /*data:function (result){
                        var dataLen;
                        if(dms.string.isEmpty(result.data)){
                            $("#parCalcAmt").data("kendoExtNumericTextBox").value(0);
                            $("#parDcRate").data("kendoExtNumericTextBox").value(0);
                            $("#parDcAmt").data("kendoExtNumericTextBox").value(0);
                            $("#parEtcDcAmt").data("kendoExtNumericTextBox").value(0);
                            $("#parCalcSumAmt").data("kendoExtNumericTextBox").value(0);
                        }else{
                            dataLen = result.data.length;

                            for(var i = 0; i < dataLen; i = i + 1){
                                popItemObj[result.data[i].itemCd] = result.data[i].itemNm;
                                $("#parCalcAmt").data("kendoExtNumericTextBox").value(result.data[i].parAmt);
                                $("#parDcRate").data("kendoExtNumericTextBox").value((Number(result.data[i].parAmt - result.data[i].paymAmt)/Number(result.data[i].parAmt)).toFixed(2));
                                $("#parDcAmt").data("kendoExtNumericTextBox").value(result.data[i].parAmt - result.data[i].paymAmt);
                                $("#parEtcDcAmt").data("kendoExtNumericTextBox").value(0);
                                $("#parCalcSumAmt").data("kendoExtNumericTextBox").value(result.data[i].paymAmt);
                            }

                        }
                        return result.data;
                    },*/
                   model:{
                        id:"rnum"
                        ,fields:{
                             rnum              :{type:"number", editable:false}
                            ,calcDocNo         :{type:"string", editable:false}
                            ,paymTp            :{type:"string", editable:false}
                            ,parAmt            :{type:"number"}
                            ,paymPrid          :{type:"string"}
                            ,paymMthCd         :{type:"string"}
                            ,paymAmt           :{type:"number"}
                            ,calcAmt           :{type:"number"}
                            ,preAmt            :{type:"number"}
                            ,balAmt            :{type:"number"}
                            ,rcptTp            :{type:"string"}
                            ,paymCd            :{type:"string" , editable:false}
                            ,paymUsrNm         :{type:"string" , editable:false}
                            ,wonUnitCutAmt     :{type:"number"}
                            ,demicPointCutAmt  :{type:"number"}
                            ,cupnAmt           :{type:"number"}
                            ,dcPermCd          :{type:"string"}
                            ,dcPermNm          :{type:"string", editable:false}
                            ,paymRemark        :{type:"string"}
                        }
                    }
                }
            }
            ,height:91
            ,pageable:false
            ,autoBind:false
            ,sortable:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,filterable:false                 // 필터링 기능 사용안함
            ,selectable:"row"
            ,edit:function(e){
                var fieldName = e.container.find("input").attr("name");
                /* if(fieldName == "paymAmt") {
                    this.closeCell();
                } */

                var numberFieldName = $(e.container.find("input")[1]).attr("name");
                if(numberFieldName == "wonUnitCutAmt" || numberFieldName == "demicPointCutAmt" || numberFieldName == "balAmt" || numberFieldName == "calcAmt") {
                    this.closeCell();
                }

                var fieldName2 = $(e.container.find("input")[1]).attr("data-bind");
                var grid = $("#calcGrid").data("kendoExtGrid");
                var rowData = grid.dataItem(grid.select());

                if(fieldName2 == "value:cupnAmt"){
                    rowData.set("paymAmt", rowData.paymAmt + rowData.cupnAmt);
                } else if(fieldName2 == "value:preAmt") {
                    rowData.set("paymAmt", rowData.paymAmt + rowData.preAmt);
                } else if(fieldName2 == "value:balAmt") {
                    rowData.set("paymAmt", rowData.paymAmt + rowData.balAmt);
                }
            }
            ,change:function(e){
                var statusYn = (status == undefined) ? false : ( ($("#roTp").val() == "02") ? false : true );

                var grid = $("#calcGrid").data("kendoExtGrid");
                var selectedVal = grid.dataItem(grid.select());

                var roTp = $("#roTp").val();
                var enableYn = false;

                if($("#ordStatCd").val() === '04'){//정산확정인 경우 버튼 사용 불가
                    enableYn = false;
                }else {
                    if( roTp == "02"){
                        if(selectedVal.paymTp == "01"){
                            enableYn = false;
                        }else{
                            enableYn = true;
                        }
                    }else {
                        enableYn = true;
                    }
                }
                //$("#demicalPointCut").data("kendoButton").enable(true);
                //$("#wonUnitCut").data("kendoButton").enable(true);
                //$("#calAdd").data("kendoButton").enable(true);

                $("#calAdd").data("kendoButton").enable(true);
                $("#wonUnitCut").data("kendoButton").enable(enableYn);
                $("#demicalPointCut").data("kendoButton").enable(enableYn);
                $("#dcRole").data("kendoButton").enable(enableYn);
            }
            ,columns:[
                {field:"paymTp", title:"<spring:message code='ser.lbl.payWay' />", width:70
                    ,template:"#=paymTpCdGrid(paymTp)#"
                    ,editor:function(container, options){
                        $('<input required name="paymTp" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            valuePrimitive:true
                            ,dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:paymTpCdList
                        });
                    }
                }          // 지불유형
                ,{field:"paymCd", title:"<spring:message code='ser.lbl.payerCd' />", width:100}       // 지불자코드
                ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payer' />", width:100}       // 지불자
                ,{field:"paymPrid", title:"<spring:message code='ser.lbl.payTerm' />", width:90
                        ,template:"#=paymPridCdGrid(paymPrid)#"
                        ,editor:function(container, options){
                            $('<input required name="paymPrid" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                valuePrimitive:true
                                ,dataTextField:"cmmCdNm"
                                ,dataValueField:"cmmCd"
                                ,dataSource:paymPridCdList
                            });
                        }
                    }       // 지불기한
                ,{field:"parAmt", title:"<spring:message code='ser.lbl.arItemAmt' />", width:90, attributes:{"class":"ar"} , hidden:true}       // 발생부품비
                ,{field:"calcAmt", title:"<spring:message code='ser.lbl.finalCalcAmt' />", width:90, attributes:{"class":"ar"}}       // 발생금액
                ,{field:"wonUnitCutAmt", title:"<spring:message code='ser.lbl.interSettAmt' />", width:80, attributes:{"class":"ar"}
                 }//정산절사
                ,{field:"demicPointCutAmt", title:"<spring:message code='ser.lbl.calcZeroAmt' />", width:80, attributes:{"class":"ar"}
                 }//정산제로
                ,{field:"paymAmt", title:"<spring:message code='ser.lbl.arCd' />", width:90, attributes:{"class":"ar"}
                        ,template:function(data){
                            var paymAmt = 0;
                            if(data.paymAmt != null){
                                paymAmt = data.paymAmt;
                            }
                            return dms.string.addThousandSeparatorCommas(paymAmt);
                        }
                        ,editor:changeAmtEditor
                    }       // 발생금액  title:"最终结算金额"
                ,{field:"paymMthCd", title:"<spring:message code='ser.lbl.expcPayMethod' />", width:70
                    ,template:"#=paymMthCdGrid(paymMthCd)#"
                    ,editor:function(container, options){
                        if($("#ordStatCd").val() !== '04'){
                            $('<input required name="paymMthCd" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                valuePrimitive:true
                                ,dataTextField:"cmmCdNm"
                                ,dataValueField:"cmmCd"
                                ,dataSource:paymMthCdList
                                ,optionLabel:"<spring:message code='global.btn.select' />"
                                ,index:0
                            });
                        }
                    }
                }    // 지불방식
                ,{field:"etcAmt", title:"<spring:message code='ser.lbl.arOtherAmt' />", width:90, attributes:{"class":"ar"} , hidden:true}       // 발생기타비
                ,{field:"rcptTp", title:"<spring:message code='ser.lbl.expcInvoiceTp' />", width:80
                    ,template:"#=rcptTpCdGrid(rcptTp)#"
                    ,editor:function(container, options){
                        $('<input required name="rcptTp" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            valuePrimitive:true
                            ,dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:rcptTpCdList
                            ,optionLabel:"<spring:message code='global.btn.select' />"
                            ,index:0
                        });
                    }
                }//영수증유형
                ,{field:"preAmt", title:"<spring:message code='ser.lbl.preDoUseAmt' />", width:80, attributes:{"class":"ar"}, hidden:true
                }//선수금 금액 사용
                ,{field:"balAmt", title:"<spring:message code='ser.lbl.advance' />", width:80, attributes:{"class":"ar"}, hidden:true
                }//선불금금액
                ,{field:"dcPermNm", title:"<spring:message code='ser.lbl.dcAuthor' />", width:80, attributes:{"class":"ac"}, hidden:true
                }//할인권한
                ,{field:"dcPermCd", hidden: true}//할인권한
                ,{field:"paymRemark", title:"<spring:message code='ser.lbl.payBigo' />", width:90}    // 지불비고
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
     // 판매상태
        changeGiStatCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = ordItemStatCdObj[val];
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
        changeGiLocCd = function(giLocCd){
            var returnVal = "";
            if(giLocCd != null && giLocCd != ""){
                returnVal = locationObj[giLocCd];
            }
            return returnVal;
        };

       // 결제유형
        paymTpCdGrid = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = paymTpCdArr[val].cmmCdNm;
            }
            return returnVal;
        };

        // 지불방식
        paymMthCdGrid = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                returnVal = paymMthCdMap[val].cmmCdNm;
            }else{
                returnVal = paymMthCdMap[""];
            }
            return returnVal;
        };

        // 결제기간
        paymPridCdGrid = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(paymPridCdMap[val])){
                returnVal = paymPridCdMap[val];
            }
            return returnVal;
        };

        // 영수증유형
        rcptTpCdGrid = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = rcptTpCdMap[val].cmmCdNm;
            }
            return returnVal;
        };

        // 가격 변경
        changeExpcAmt = function(){

            var parAmt = 0;
            var lbrAmt = 0;
            var grid = $("#gridDetail").data("kendoExtGrid");
            var rowData = grid.dataItem(grid.select());
            var gridData = grid.dataSource.data();


            if(rowData != null){
                var itemPrc = Number(rowData.itemPrc);
                var itemQty = Number(rowData.itemQty);
                rowData.set("expcParAmt", itemPrc*itemQty);
            }

            $.each(gridData, function(index, item){
                parAmt += Number(item.expcParAmt);
            });

            $("#parCalcAmt").data("kendoExtNumericTextBox").value(dms.string.addThousandSeparatorCommas(parAmt.toFixed(2)));
            $("#parCalcSumAmt").data("kendoExtNumericTextBox").value(dms.string.addThousandSeparatorCommas(parAmt.toFixed(2)));
            //$("#calcTotAmt").data("kendoExtNumericTextBox").value(dms.string.addThousandSeparatorCommas((lbrAmt+parAmt).toFixed(2)));
        };

        initPage();
    });

    function fnChangeCustTp(e){
        $('#sCustCd').val('');
        $('#sCustNm').val('');

        if(e.target.value === '03'){
            $('#sCustCd').val('guest');
            $("#sCustTp").data("kendoExtDropDownList").value('01');
        }else{
            $("#sCustTp").data("kendoExtDropDownList").value(e.target.value);
        }
    }


    function custSearchPopup() {
        if(dms.string.isEmpty($("#sCustTpView").data("kendoExtDropDownList").value())){
            //고객유형은 필수 입력 사항입니다.
            dms.notification.warning("<spring:message code='par.lbl.custTp' var='custTp' /><spring:message code='global.info.required.field' arguments='${custTp}'/>");
            return false;
        }

        if($("#sCustTpView").data("kendoExtDropDownList").value() === '01'){
            selectCustSearchPopupWindow();
        }else if($("#sCustTpView").data("kendoExtDropDownList").value() === '02'){
            selectVenderMasterPopupWindow();
        }
    }

    function selectVenderMasterPopupWindow(){

        customerSearchPopupWin = dms.window.popup({
            windowId:"customerSearchPopupWin"
            ,title:"<spring:message code = 'par.title.venderCstSelect'/>"   // 고객 조회
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectCustomerMasterPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"callbackFunc":function(data){
                        $("#sCustCd").val(data[0].bpCd);
                        $("#sCustNm").val(data[0].bpNm);

                        customerSearchPopupWin.close();
                    }
                }
            }
        });
    }

    function selectCustSearchPopupWindow(){

        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='par.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {

                            $("#sCustCd").val(data[0].custNo);
                            $("#sCustNm").val(data[0].custNm);

                            popupWindow.close();

                        }
                    }
                }
            }
        });
    }

    function saSearchPopup() {

        userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#sSaId").val(data[0].usrId);
                            $("#sSaNm").val(data[0].usrNm);

                        }
                        userSearchPopupWin.close();
                    }
                }
            }

        });
    }

    function initPage(){
        var minDate = new Date(sevenDtBf),
            maxDate = new Date(toDt),
            toYY,
            toMM,
            toDD,
            frYY,
            frMM,
            frDD;
        //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
        //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
        //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#dataForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        $("#gridHeader").data("kendoExtGrid").dataSource.data([]);
        $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
        $("#calcGrid").data("kendoExtGrid").dataSource.data([]);

        popItemObj = {};
        returnObj  = {};


        frYY = minDate.getFullYear();
        frMM = minDate.getMonth();
        frDD = minDate.getDate();

        toYY = maxDate.getFullYear();
        toMM = maxDate.getMonth();
        toDD = maxDate.getDate();
        //$("#sGiDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        //$("#sGiDtTo").data("kendoExtMaskedDatePicker").value(toDt);

        //$("#sGiDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        //$("#sGiDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));


        $("#demicalPointCut").data("kendoButton").enable(false);
        $("#wonUnitCut").data("kendoButton").enable(false);
        $("#dcRole").data("kendoButton").enable(false);
        $("#calAdd").data("kendoButton").enable(false);
		//20210113 update by tjx 不在显示蓝缤相关的积分查询部分，只保留自店会员部分
        //$("#bmPointGrid").data("kendoExtGrid").dataSource.data([{blueMembershipNo:"", bmMemberTp:"", consumeType:"0", consumePoints:"", mLevel:"", bmUsePurpose:""}]);
        $("#dlrPointGrid").data("kendoExtGrid").dataSource.data([{memberTp:"", membershipNo:"", gradeCd:"", lastPointVal:"", occrPointVal:"", cardNo:"", dlrUseAmt:"", dlrUsePurpose:""}]);
        $("#bmCupnGrid").data("kendoExtGrid").dataSource.data([{cardType:"", cardNo:"", couponBeginDate:"", couponEndDate:""}]);
        $("#dcGrid").data("kendoExtGrid").dataSource.data([]);
        $("#cardListGrid").data("kendoExtGrid").dataSource.data([]);

        selectOrgPartsSaleDcRate = 0;
        loginUsrId = "${loginUsrId}";

        $("#bmpDiv").hide();
        $("#slide-in-share").height(140);

        $("#bmCupnDiv").hide();
        $("#slide-in-share1").height(190);
        $("#slide-in-share4").hide();

        if(!dms.string.isEmpty(linkParSaleOrdNo)){
            $("#sParSaleOrdNo").val(linkParSaleOrdNo);
            $("#parSaleOrdNo").val(linkParSaleOrdNo);
            $("#btnSearch").click();
        }else{
            $("#sOrdDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
            $("#sOrdDtTo").data("kendoExtMaskedDatePicker").value(toDt);

            $("#sOrdDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            $("#sOrdDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

            btnControll();
        }

    }

    function setDcData(jsonObj){
        var datas         = $("#calcGrid").data("kendoExtGrid").dataSource.data(),
            partDatas     = $("#gridDetail").data("kendoExtGrid").dataSource.data(),
            parCalcSumAmt = $("#parCalcSumAmt").data("kendoExtNumericTextBox").value(),
            parCamt       = 0,
            parTotAmt     = 0,
            parCalAmt     = 0,
            dcCalRate     = 0,
            dcCalAmt      = 0,
            parTotAmtSum  = 0,
            parCalAmtSum  = 0,
            dcCalAmtSum   = 0,
            dcRateTot     = 0,
            viewDcRate    = 0,
            parDcRate,
            parDcAmt,
            wonUnitCutAmt,
            demicPointCutAmt,
            dcTp;

        if(dms.string.isEmpty(jsonObj.dcTp)){
            jsonObj  = {};
            jsonObj.parDcRate = 0;
            jsonObj.parDcAmt  = 0;
            jsonObj.dcTp      = '01';
        }
        //dcRoleCancel();

        dcTp          =  jsonObj.dcTp;
        parDcRate     = Number(jsonObj.parDcRate);
        parDcAmt      = Number(jsonObj.parDcAmt);

        $.each(partDatas,function(i,v){

             if(i === 0){
                 viewDcRate = partDatas[0].dcRate;
             }
            if(dcTp == "01"){

                parCalAmt = Number((partDatas[i].itemPrc * partDatas[i].itemQty));
                dcCalAmt  = Number(((partDatas[i].itemPrc * partDatas[i].itemQty) - partDatas[i].expcParAmt));
                parTotAmt = Number(partDatas[i].expcParAmt);

            }else if(dcTp == "02"){

                parCalAmt = Number((partDatas[i].itemPrc * partDatas[i].itemQty));
                parTotAmt = Number(partDatas[i].expcParAmt);
                dcCalAmt  = Number(((partDatas[i].itemPrc * partDatas[i].itemQty) - partDatas[i].expcParAmt));

            }
            parCalAmtSum = Number(parCalAmtSum) + Number(parCalAmt);
            parTotAmtSum = Number(parTotAmtSum) + Number(parTotAmt);
            dcCalAmtSum  = Number(dcCalAmtSum)  + Number(dcCalAmt);

            dcRateTot = (Number(dcCalAmtSum)/Number(parCalAmtSum)).toFixed(2);

            if(partDatas[i].giStatCd !== '07'){
                if(Number(viewDcRate) !== Number(partDatas[i].dcRate)){
                    viewDcRate = '';
                }
            }
        });

        $("#parCalcAmt").data("kendoExtNumericTextBox").value(parCalAmtSum);
        $("#parDcAmt").data("kendoExtNumericTextBox").value(dcCalAmtSum);
        $("#parDcRate").data("kendoExtNumericTextBox").value(dcRateTot);

        $("#viewParDcRate").data("kendoExtNumericTextBox").value(viewDcRate);
        $("#parWhDcAmt").data("kendoExtNumericTextBox").value(parTotAmtSum);

        fnLastCalcAmt();

        $.each(datas,function(i,v){
            if(datas[i].paymTp == "04"){

                if(dms.string.isEmpty(datas[i].wonUnitCutAmt)){
                    wonUnitCutAmt = 0;
                }else{
                    wonUnitCutAmt = datas[i].wonUnitCutAmt;
                }
                if(dms.string.isEmpty(datas[i].demicPointCutAmt)){
                    demicPointCutAmt = 0;
                }else{
                    demicPointCutAmt = datas[i].demicPointCutAmt;
                }

                datas[i].calcAmt = Number($("#parCalcSumAmt").data("kendoExtNumericTextBox").value()).toFixed(2);
                datas[i].wonUnitCutAmt = 0;
                datas[i].demicPointCutAmt = 0;
                datas[i].paymAmt = Number($("#parCalcSumAmt").data("kendoExtNumericTextBox").value()).toFixed(2);

                datas[i].dcPermNm = "";
                datas[i].dcPermCd = "";

            }
        });

         $("#calcGrid").data("kendoExtGrid").refresh();
    }

    function dcRoleCancel(){
        var partsGrid = $("#gridDetail").data("kendoExtGrid"),
        partsRows = partsGrid.tbody.find("tr"),
        parDcAmt = $("#parDcAmt").data("kendoExtNumericTextBox").value(),
        dataItem,
        jsonObj,
        partsGridData;//저장 시 returnQty 삭제하기 위해 사용

        jsonObj  = {};
        jsonObj.parDcRate = 0;
        jsonObj.parDcAmt  = 0;
        dcData = jsonObj;

        partsRows.each(function(index, row) {
            dataItem = partsGrid.dataSource.data()[index];
            partsGridData = partsGrid.dataSource.at(index);

            if(partsGridData.giStatCd !== '07'){
                dataItem.set('dcRate', 0);
                dataItem.set('dcAmt',  0);
                dataItem.set('expcParAmt', (partsGridData.itemPrc * partsGridData.itemQty));
            }
        });

        $("#parDcAmt").data("kendoExtNumericTextBox").value(0.00);

        setDcData(jsonObj);

    };

    function fnLastCalcAmt(){

        var parWhDcAmt = $("#parWhDcAmt").data("kendoExtNumericTextBox").value(),
        parBmPointUseAmt = $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value(),
        pointTotAmt = $("#pointTotAmt").data("kendoExtNumericTextBox").value(),
        parEtcDcAmt = $("#parEtcDcAmt").data("kendoExtNumericTextBox").value();

        $("#parCalcSumAmt").data("kendoExtNumericTextBox").value(Number(parWhDcAmt - parEtcDcAmt - parBmPointUseAmt - pointTotAmt));
    };

    function btnControll(status){

        var statusYn = (status == undefined) ? false : true;

        if(status == "01"){
            $("#wonUnitCut").data("kendoButton").enable(false);
            $("#demicalPointCut").data("kendoButton").enable(false);
            $("#dcRole").data("kendoButton").enable(false);
            $("#calAdd").data("kendoButton").enable(false);
            $("#btnCalc").data("kendoButton").enable(true);
            $("#btnCalcConfirm").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnReturn").data("kendoButton").enable(false);
        } else if(status == "02"){
            $("#wonUnitCut").data("kendoButton").enable(true);//정산절사
            $("#demicalPointCut").data("kendoButton").enable(true);//정산제로
            $("#dcRole").data("kendoButton").enable(true); //할인권한
            $("#calAdd").data("kendoButton").enable(true); //분리
            $("#btnCalc").data("kendoButton").enable(true);
            $("#btnCalcConfirm").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnReturn").data("kendoButton").enable(true);
        } else if(status == "03"){
            $("#wonUnitCut").data("kendoButton").enable(true);
            $("#demicalPointCut").data("kendoButton").enable(true);
            $("#dcRole").data("kendoButton").enable(true);
            $("#calAdd").data("kendoButton").enable(true);
            $("#btnCalc").data("kendoButton").enable(true);
            $("#btnCalcConfirm").data("kendoButton").enable(true);
            $("#btnCancel").data("kendoButton").enable(true);
            $("#btnReturn").data("kendoButton").enable(false);
        } else if(status == "04"){
            $("#wonUnitCut").data("kendoButton").enable(false);
            $("#demicalPointCut").data("kendoButton").enable(false);
            $("#dcRole").data("kendoButton").enable(false);
            $("#calAdd").data("kendoButton").enable(false);
            $("#btnCalc").data("kendoButton").enable(false);
            $("#btnCalcConfirm").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(true);
            $("#btnReturn").data("kendoButton").enable(false);
        } else if(status == "05"){
            $("#wonUnitCut").data("kendoButton").enable(false);
            $("#demicalPointCut").data("kendoButton").enable(false);
            $("#dcRole").data("kendoButton").enable(false);
            $("#calAdd").data("kendoButton").enable(false);
            $("#btnCalc").data("kendoButton").enable(false);
            $("#btnCalcConfirm").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnReturn").data("kendoButton").enable(false);
        } else if(status == "07"){  //전체반품건
            $("#wonUnitCut").data("kendoButton").enable(false);
            $("#demicalPointCut").data("kendoButton").enable(false);
            $("#dcRole").data("kendoButton").enable(false);
            $("#calAdd").data("kendoButton").enable(false);
            $("#btnCalc").data("kendoButton").enable(false);
            $("#btnCalcConfirm").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnReturn").data("kendoButton").enable(false);
        } else {
            $("#wonUnitCut").data("kendoButton").enable(false);
            $("#demicalPointCut").data("kendoButton").enable(false);
            $("#dcRole").data("kendoButton").enable(false);
            $("#calAdd").data("kendoButton").enable(false);
            $("#btnCalc").data("kendoButton").enable(true);
            $("#btnCalcConfirm").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnReturn").data("kendoButton").enable(false);
        }

        $("#dealerSet").data("kendoButton").enable(statusYn);
        $("#dealerCancel").data("kendoButton").enable(statusYn);
        //$("#bmSet").data("kendoButton").enable(statusYn);
        //$("#bmCancel").data("kendoButton").enable(statusYn);
        $("#bmSet").data("kendoButton").enable(false);
        $("#bmCancel").data("kendoButton").enable(false);
        $("#dcSet").data("kendoButton").enable(statusYn);
        $("#dcCancel").data("kendoButton").enable(statusYn);
    };

    function fnCalcConfirm(status){

      //dms.notification.warning("<spring:message code='global.info.ready' />");
        var partsGrid        = $("#gridDetail").data("kendoExtGrid"),
            calcGrid         = $("#calcGrid").data("kendoExtGrid"),
            rows             = calcGrid.tbody.find("tr"),
            partsRows        = partsGrid.tbody.find("tr"), //저장 시 returnQty 삭제하기 위해 사용
            ordStatCd        = $("#ordStatCd").val(),//$("#calcStatCd").val(),
            newCalculateData = [],
            chkPartsSaleOrd  = {},
            partsData        = [],   //저장 시 returnQty 삭제하기 위해 사용
            partsGridData,           //저장 시 returnQty 삭제하기 위해 사용
            partSaveData,
            partsRowData,
            gridData,
            rowData;


        partSaveData = partsGrid.dataSource.data();

        if(rows.length  == 0 ){
            // 선택값이 없습니다.
            dms.notification.warning("<spring:message code='global.info.unselected' />");
            return false;
        }

        if(ordStatCd === '01' || ordStatCd === '03' || ordStatCd === '07' || dms.string.isEmpty(ordStatCd)){
            //정산 가능 상태가 아닙니다.(01:등록, null:등록중, 03:취소, 07:반환)
            dms.notification.warning("<spring:message code='ser.lbl.calc' var='calc' /><spring:message code='par.err.paramNotAvailable' arguments='${calc}'/>");

            return false;
        }

        var finalPaymAmt = 0;
        var wonUnitCutAmt = 0;
        var demicPointCutAmt = 0;
        var parCalcAmt = 0;  //정산시 판매 총금액
        var compareParCalcAmt = 0;  //수정된 판매 총금액
        var paymAmt = 0;

        compareParCalcAmt =  $("#compareParCalcAmt").data("kendoExtNumericTextBox").value();
        parCalcAmt = $("#parCalcAmt").data("kendoExtNumericTextBox").value();

        //정산 시 등록된 정산금액과 그 후 판매추가 및 반품으로 금액 변경할 경우, 취소하여 다시 정산하기 위함
        if(status === '00'){
            if(Number(compareParCalcAmt) !== Number(parCalcAmt)){
                dms.notification.info("<spring:message code='ser.info.notTotCalculate'/>");
                return false;
            }
        }else{
          //정산 확정 전 재 저장 시 신규 판매금액으로 재 셋팅한다.
            if(!dms.string.isEmpty($("#calcDocNo").val()) && (Number(compareParCalcAmt) !== Number(parCalcAmt))){
                $("#parCalcAmt").data("kendoExtNumericTextBox").value(compareParCalcAmt);

                $("#parDcRate").data("kendoExtNumericTextBox").value((Number(returnObj.dcAmt)/Number(compareParCalcAmt)).toFixed(2));
                $("#parDcAmt").data("kendoExtNumericTextBox").value(returnObj.dcAmt);
                $("#parEtcDcAmt").data("kendoExtNumericTextBox").value(0);
                $("#parCalcSumAmt").data("kendoExtNumericTextBox").value(returnObj.totAmt);
                $("#parWhDcAmt").data("kendoExtNumericTextBox").value(returnObj.totAmt);

                $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value(0);//selectedItem.parBmPointUseAmt);
                $("#pointTotAmt").data("kendoExtNumericTextBox").value(0);//selectedItem.pointTotAmt);


                $("#calcGrid").data("kendoExtGrid").dataSource.data([]);
                changeCalGridObj = {
                     "paymTp"            :'04'
                    ,"paymCd"            :returnObj.custCd
                    ,"paymUsrNm"         :returnObj.custNm
                    ,"paymPrid"          :'01'
                    ,"parAmt"            :returnObj.dcBefTotAmt
                    ,"paymAmt"           :returnObj.totAmt
                    ,"calcAmt"           :returnObj.totAmt
                    ,"paymRemark"        :''
                    ,"paymMthCd"         :''
                    ,"rcptTp"            :''
                    ,"wonUnitCutAmt"     :0
                    ,"demicPointCutAmt"  :0
                 };
                $('#calcGrid').data('kendoExtGrid').dataSource.insert(0, changeCalGridObj);
            }

        }

        rows.each(function(index, row) {
            gridData = calcGrid.dataSource.at(index);

            wonUnitCutAmt = gridData.wonUnitCutAmt;
            demicPointCutAmt = gridData.demicPointCutAmt;
            paymAmt = gridData.paymAmt;

            if(dms.string.isEmpty(wonUnitCutAmt)){
                wonUnitCutAmt = 0;
            }
            if(dms.string.isEmpty(demicPointCutAmt)){
                demicPointCutAmt = 0;
            }
            if(dms.string.isEmpty(paymAmt)){
                paymAmt = 0;
            }

            newCalculateData.push(gridData);
            finalPaymAmt += (Number(paymAmt) - Number(wonUnitCutAmt) + Number(demicPointCutAmt));
        });

        partsRows.each(function(index, row) {
            partsGridData = partsGrid.dataSource.at(index);

            if(partsGridData.giStatCd !== '07'){
                partsRowData = {};
                partsRowData.docNo      = partsGridData.calcDocNo;
                partsRowData.itemCd     = partsGridData.itemCd;
                partsRowData.itemNm     = partsGridData.itemNm;
                partsRowData.paymTp     = partsGridData.paymTp;
                partsRowData.paymUsrNm  = partsGridData.paymUsrNm;
                partsRowData.calcUnitCd = partsGridData.calcUnitCd;
                partsRowData.itemTotAmt = partsGridData.expcParAmt;
                partsRowData.itemQty    = partsGridData.itemQty - partsGridData.returnQty;
                partsRowData.itemPrc    = partsGridData.itemPrc;
                partsRowData.dcRate     = partsGridData.dcRate;
                partsRowData.dcAmt      = partsGridData.dcAmt;
                partsRowData.giStrgeCd  = partsGridData.giStrgeCd;
                partsRowData.roTp       = partsGridData.roTp;

                partsData.push(partsRowData);
            }
        });


        var formParam = {};

        formParam.roTp             = '01';
        formParam.serParDstinCd    = 'PAR';
        formParam.roDocNo          = $("#parSaleOrdNo").val();
        formParam.parCalcAmt       = Number($("#parCalcAmt").data("kendoExtNumericTextBox").value());
        formParam.parDcRate        = Number($("#parDcRate").data("kendoExtNumericTextBox").value());
        formParam.parDcAmt         = Number($("#parDcAmt").data("kendoExtNumericTextBox").value());
        //formParam.parWhDcAmt       = Number($("#parWhDcAmt").data("kendoExtNumericTextBox").value());
        formParam.parBmPointUseAmt = Number($("#parBmPointUseAmt").data("kendoExtNumericTextBox").value());
        formParam.pointTotAmt      = Number($("#pointTotAmt").data("kendoExtNumericTextBox").value());
        formParam.parEtcDcAmt      = Number($("#parEtcDcAmt").data("kendoExtNumericTextBox").value());
        formParam.parCalcSumAmt    = Number($("#parCalcSumAmt").data("kendoExtNumericTextBox").value());
        formParam.calcStatCd       = status;
        formParam.calcDocNo        = $("#calcDocNo").val();
        formParam.etcDcCd          = $("#etcDcCd").val();

        if(Number(finalPaymAmt) != Number(formParam.parCalcSumAmt)){
            dms.notification.info("<spring:message code='ser.info.notTotCalculate'/>");
            return false;
        }


        bmSaveParam.consumePointsCost = $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value();
        bmSaveParam.totalCost         = $("#parCalcSumAmt").data("kendoExtNumericTextBox").value();

        var dlrPointGrid = $("#dlrPointGrid").data("kendoExtGrid");
        var dlrPointGridData = dlrPointGrid.dataSource.at(0);

        // form 데이터 및 그리드 변경 데이터 세팅

        var cardPointUseParam = {
            membershipNo:dlrPointGridData.membershipNo
            ,cardNo:dlrPointGridData.cardNo
            ,pointCd:"20"
            ,occrPointVal:Number($("#occrPoint").val())
            ,occrPointCost:$("#pointTotAmt").data("kendoExtNumericTextBox").value()
            ,useTp:'04'  //부품
            ,useNum:$("#roDocNo").val()
            ,srcSub1:$("#calcDocNo").val()
        };

        var param = $.extend(
           {"calculateVO":formParam}
           ,{"membershipPointHisVO": cardPointUseParam}
           ,{"servicePartListVO":partsData}
           ,{"calculateDetailSaveVO":newCalculateData}
           ,{"blueMembershipJoinVO":bmSaveParam()}
           /*
           ,{"serviceLaborListVO":null}
           ,{"trobleDescVO":null}
           ,{"custDemandListVO":[]}
           ,{"etcIssueListVO":[]}
           ,{"lbrSuggestListVO":[]}
           ,{"cardPointHisVO":null}*/
        );


        chkPartsSaleOrd = {
            parSaleOrdNo    :$('#parSaleOrdNo').val()
           ,updtDtStr       :$("#updtDtStr").val()
        };

        $.ajax({
            url:"<c:url value='/par/ism/issue/fnChkPartsSaleOrdNoUpdateSomebody.do' />"
            ,data:JSON.stringify(chkPartsSaleOrd)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,success:function(result, textStatus){
                if (result === true) {
                    console.log('param:',param);
                    $.ajax({
                        url:"<c:url value='/ser/cal/calculate/multiCalculate.do' />"
                        ,data:JSON.stringify(param)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.loading.hide($("#resizableContainer"));
                        }
                        ,success:function(result, textStatus){

                             $("#calcDocNo").val(result.calcDocNo);

                            if(!dms.string.isEmpty($("#calcDocNo").val())){

                                $.ajax({
                                     url:"<c:url value='/par/ism/issue/selectPartsSaleOrdByKey.do' />"
                                    ,data:JSON.stringify({ sParSaleOrdNo:$("#parSaleOrdNo").val()})
                                    ,type:'POST'
                                    ,dataType:'json'
                                    ,contentType:'application/json'
                                    ,success:function(result, textStatus){
                                        $("#demicalPointCut").data("kendoButton").enable(true);
                                        $("#calAdd").data("kendoButton").enable(true);
                                        $("#wonUnitCut").data("kendoButton").enable(true);
                                        $("#dcRole").data("kendoButton").enable(true);

                                        $("#compareParCalcAmt").data("kendoExtNumericTextBox").value($("#parCalcAmt").data("kendoExtNumericTextBox").value());

                                        $("#gridHeader").data("kendoExtGrid").dataSource.read();
                                        $("#gridDetail").data("kendoExtGrid").dataSource.read();
                                        $("#calcGrid").data("kendoExtGrid").dataSource.read();
                                        $("#updtDtStr").val(result.updtDtStr);

                                        dms.notification.success("<spring:message code='global.info.success'/>");

                                        if(status === '04'){
                                            btnControll('03');
                                        }else if(status === '00'){
                                            btnControll('04');
                                        }

                                        //취소 대상 정산 정보 조회
                                        $.ajax({
                                             url:"<c:url value='/ser/cal/calculate/selectCalculatePartByKey.do' />"
                                            ,data:JSON.stringify({sCalcDocNo:$("#calcDocNo").val()})//$("#vinNo").val()})
                                            ,type:'POST'
                                            ,dataType:'json'
                                            ,contentType:'application/json'
                                            ,error:function(jqXHR, status, error) {
                                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                            }
                                            ,success:function(result, textStatus){
                                                cnclCalcObj = result;
                                                cnclCalcObj.roStatCd = result.calcStatCd;
                                            }
                                        });
                                    }
                                    ,beforeSend:function(){
                                        dms.loading.show($("#resizableContainer"));
                                    }
                                    ,complete:function(){
                                        dms.loading.hide($("#resizableContainer"));
                                    }
                                });

                            }

                        }
                        ,beforeSend:function(){
                            dms.loading.show($("#resizableContainer"));
                        }
                        ,complete:function(){
                            dms.loading.hide($("#resizableContainer"));
                        }
                    });
                }

            }
            ,error:function(jqXHR, status, error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
        });
    };

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
            if(id === 'sOrdDtFr'){
                var minDate = new Date(sevenDtBf);
                    frYY = minDate.getFullYear();
                    frMM = minDate.getMonth();
                    frDD = minDate.getDate();
                    $("#sOrdDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                    $("#sOrdDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sOrdDtTo'){
                var maxDate = new Date(toDt);
                    toYY = maxDate.getFullYear();
                    toMM = maxDate.getMonth();
                    toDD = maxDate.getDate();

                    $("#sOrdDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                    $("#sOrdDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }else{
            if(id === 'sOrdDtFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sOrdDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sOrdDtTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sOrdDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }
    }

    /* 부품판매정산헤더 변경 이벤트*/
    function gridHeaderChanged(selectedItem){

        var partDatas,
            viewDcRate    = 0;

        if( selectedItem != null && selectedItem != 'undefined'){
            $("#parSaleOrdNo").val(selectedItem.parSaleOrdNo);
            $("#roDocNo").val(selectedItem.parSaleOrdNo);
            $("#gridDetail").data("kendoExtGrid").dataSource.read();

            partDatas     = $("#gridDetail").data("kendoExtGrid").dataSource.data();

            $("#ordStatCd").val(selectedItem.ordStatCd);
            $("#calcStatCd").val(selectedItem.calcStatCd);
            $("#driverNm").val(selectedItem.custNm);
            $("#carOwnerNm").val(selectedItem.custNm);
            $("#carOwnerId").val(selectedItem.custCd);
            $("#updtDtStr").val(selectedItem.updtDtStr);
            selectOrgPartsSaleDcRate = selectedItem.dcRate;

            $.each(partDatas,function(i,v){

                if(i === 0){
                    viewDcRate = partDatas[0].dcRate;
                }

               if(partDatas[i].giStatCd !== '07'){
                   if(Number(viewDcRate) !== Number(partDatas[i].dcRate)){
                       viewDcRate = '';
                   }
               }
           });

            $("#viewParDcRate").data("kendoExtNumericTextBox").value(viewDcRate);

            dcData = {};

            returnObj = {
                    parSaleOrdNo    :selectedItem.parSaleOrdNo
                  , saleTp          :selectedItem.saleTp
                  , custTp          :selectedItem.custTp
                  , custCd          :selectedItem.custCd
                  , custNm          :selectedItem.custNm
                  , custTelNo       :selectedItem.custTelNo
                  , salePrsnId      :selectedItem.salePrsnId
                  , saId            :selectedItem.saId
                  , dcRate          :selectedItem.dcRate
                  , dcBefTotAmt     :selectedItem.dcBefTotAmt
                  , dcAmt           :selectedItem.dcAmt
                  , totAmt          :selectedItem.totAmt
                  , vatAmt          :selectedItem.vatAmt
                  , remark          :selectedItem.remark
                  , updtDtStr       :selectedItem.updtDtStr
            };


            if(dms.string.isEmpty(selectedItem.calcDocNo)){

                $("#calcDocNo").val('');
                $("#parCalcAmt").data("kendoExtNumericTextBox").value(selectedItem.dcBefTotAmt);
                $("#parDcRate").data("kendoExtNumericTextBox").value((Number(selectedItem.dcAmt)/Number(selectedItem.dcBefTotAmt)).toFixed(2));
                $("#parDcAmt").data("kendoExtNumericTextBox").value(selectedItem.dcAmt);
                $("#parEtcDcAmt").data("kendoExtNumericTextBox").value(0);
                $("#parCalcSumAmt").data("kendoExtNumericTextBox").value(selectedItem.totAmt);
                $("#parWhDcAmt").data("kendoExtNumericTextBox").value(selectedItem.totAmt);
                //$("#viewParDcRate").data("kendoExtNumericTextBox").value(((Number(selectedItem.dcAmt)/Number(selectedItem.dcBefTotAmt)) * 100).toFixed(2));

                $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value(0);//selectedItem.parBmPointUseAmt);
                $("#pointTotAmt").data("kendoExtNumericTextBox").value(0);//selectedItem.pointTotAmt);

                $("#calcGrid").data("kendoExtGrid").dataSource.data([]);
                changeCalGridObj = {
                     "paymTp"            :'04'
                    ,"paymCd"            :selectedItem.custCd
                    ,"paymUsrNm"         :selectedItem.custNm
                    ,"paymPrid"          :'01'
                    ,"parAmt"            :selectedItem.dcBefTotAmt
                    ,"paymAmt"           :selectedItem.totAmt
                    ,"calcAmt"           :selectedItem.totAmt
                    ,"paymRemark"        :''
                    ,"paymMthCd"         :''
                    ,"rcptTp"            :''
                    ,"wonUnitCutAmt"     :0
                    ,"demicPointCutAmt"  :0
                 };
                $('#calcGrid').data('kendoExtGrid').dataSource.insert(0, changeCalGridObj);

                if(selectedItem.ordStatCd === '05'){ //마이그레이션으로 수납 상태 적용한 데이터.(정산번호 없는 수납.)
                    btnControll("05");
                }else{
                    btnControll("02");//정산 전
                }
            }else{
                $("#calcDocNo").val(selectedItem.calcDocNo);
                $("#calcGrid").data("kendoExtGrid").dataSource.read();

                $("#parCalcAmt").data("kendoExtNumericTextBox").value(selectedItem.parCalcAmt);
                $("#compareParCalcAmt").data("kendoExtNumericTextBox").value(selectedItem.dcBefTotAmt);

                $("#parDcRate").data("kendoExtNumericTextBox").value(Number(selectedItem.parDcRate).toFixed(2));
                //$("#viewParDcRate").data("kendoExtNumericTextBox").value(Number(selectedItem.parDcRate * 100).toFixed(2));
                $("#parDcAmt").data("kendoExtNumericTextBox").value(selectedItem.dcAmt);
                //$("#parDcAmt").data("kendoExtNumericTextBox").value(selectedItem.parDcAmt);

                $("#parEtcDcAmt").data("kendoExtNumericTextBox").value(selectedItem.parEtcDcAmt);
                $("#parCalcSumAmt").data("kendoExtNumericTextBox").value(Number(selectedItem.parCalcSumAmt));
                //$("#parCalcSumAmt").data("kendoExtNumericTextBox").value(selectedItem.totAmt);
                $("#parWhDcAmt").data("kendoExtNumericTextBox").value(selectedItem.totAmt);
                //$("#parWhDcAmt").data("kendoExtNumericTextBox").value(Number(selectedItem.parCalcAmt)- Number(selectedItem.parDcAmt));
                $("#etcDcCd").val(selectedItem.etcDcCd);
                $("#etcDcTp").val(selectedItem.etcDcTp);

                $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value(selectedItem.parBmPointUseAmt);
                $("#pointTotAmt").data("kendoExtNumericTextBox").value(selectedItem.pointTotAmt);

                    //취소 대상 정산 정보 조회
                    $.ajax({
                         url:"<c:url value='/ser/cal/calculate/selectCalculatePartByKey.do' />"
                        ,data:JSON.stringify({sCalcDocNo:selectedItem.calcDocNo})//$("#vinNo").val()})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            cnclCalcObj = result;
                            cnclCalcObj.roStatCd = result.calcStatCd;
                        }
                    });

                if(selectedItem.ordStatCd === '02'){
                    btnControll('03');//정산 저장만 진행 시
                }else{
                    btnControll(selectedItem.ordStatCd);//정산 후
                }
            }
            $("#custCd").val(selectedItem.custCd);
            $("#custNm").val(selectedItem.custNm);

            loginUsrId = selectedItem.salePrsnId;
            if(selectedItem.custCd !== 'guest'){
                    $.ajax({
                        url:"<c:url value='/ser/cmm/vehOfCustInfo/selectDealerMemberShipInfo.do' />"
                        ,data:JSON.stringify({sCustNo:selectedItem.custCd, sVinNo:''})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(result, textStatus){
                            if(dms.string.strNvl(result.membershipNo) != ""){
                                dlrMemberGradeCdList = [];
                                $.each(result.membershipGradeMngList, function(idx, obj){
                                    dlrMemberGradeCdList.push({"cmmCd":this.gradeSeq, "cmmCdNm":this.gradeNm});

                                    if(result.gradeCd = this.gradeSeq){
                                        $("#serLbrDcRate").val(this.serLbrDcRate);
                                        $("#serParDcRate").val(this.serParDcRate);
                                        $("#serDlrLbrDcRate").data("kendoExtNumericTextBox").value(this.serLbrDcRate);
                                        $("#serDlrParDcRate").data("kendoExtNumericTextBox").value(this.serParDcRate);
                                        $("#serDlrTotDcRate").data("kendoExtNumericTextBox").value(this.serTotDcRate);
                                    }
                                });
                                dlrMemberGradeCdMap = dms.data.arrayToMap(dlrMemberGradeCdList, function(obj){return obj.cmmCd;});

                                $("#membershipNo").val(result.membershipNo);
                                $("#gradeCd").val(result.gradeCd);
                                $("#gradeNm").val(result.gradeNm);
                                $("#lastPointVal").val(result.lastPointVal);
                                $("#dlrPointCardNo").val(result.cardNo);
                                $("#memberJoinDt").val(result.regDt);
                                $("#pointExchgScale").val(result.pointExchgScale);
                                $("#membershipPointUseMaxPoint").val(result.membershipPointUseMaxPoint);
                                $("#dlrRealTotAmt").val(result.realTotAmt);
                                setMemberShipInfo();

                            }else{
                                $("#dlrPointGrid").data("kendoExtGrid").dataSource.data([{ gradeNm:"", cardNo:"", dlrUsePurpose:"" }]);
                            }
                        }
                    });

            }else{
                $("#bmPointGrid").data("kendoExtGrid").dataSource.data([{consumeType:"0", consumePoints:"", mLevel:"", bmUsePurpose:""}]);
                $("#bmCupnGrid").data("kendoExtGrid").dataSource.data([{cardNo:"", couponBeginDate:"", couponEndDate:"" , bmCupnTp:""}]);
                $("#dlrPointGrid").data("kendoExtGrid").dataSource.data([{ gradeNm:"", cardNo:"", dlrUsePurpose:"",occrPointVal:0 }]);
            }

            fn_setNumberTextTitle();
        }
    }

    function fn_setNumberTextTitle(){
        var parCalcAmt       =  $("#parCalcAmt").data("kendoExtNumericTextBox"),
            viewParDcRate    =  $("#viewParDcRate").data("kendoExtNumericTextBox"),
            parDcAmt         =  $("#parDcAmt").data("kendoExtNumericTextBox"),
            parWhDcAmt       =  $("#parWhDcAmt").data("kendoExtNumericTextBox"),
            parBmPointUseAmt =  $("#parBmPointUseAmt").data("kendoExtNumericTextBox"),
            pointTotAmt      =  $("#pointTotAmt").data("kendoExtNumericTextBox"),
            parEtcDcAmt      =  $("#parEtcDcAmt").data("kendoExtNumericTextBox"),
            parCalcSumAmt    =  $("#parCalcSumAmt").data("kendoExtNumericTextBox");

            parCalcAmt.wrapper.find(".k-formatted-value").attr("title", parCalcAmt.value());
            viewParDcRate.wrapper.find(".k-formatted-value").attr("title", viewParDcRate.value());
            parDcAmt.wrapper.find(".k-formatted-value").attr("title", parDcAmt.value());
            parWhDcAmt.wrapper.find(".k-formatted-value").attr("title", parWhDcAmt.value());
            parBmPointUseAmt.wrapper.find(".k-formatted-value").attr("title", parBmPointUseAmt.value());
            pointTotAmt.wrapper.find(".k-formatted-value").attr("title", pointTotAmt.value());
            parEtcDcAmt.wrapper.find(".k-formatted-value").attr("title", parEtcDcAmt.value());
            parCalcSumAmt.wrapper.find(".k-formatted-value").attr("title", parCalcSumAmt.value());
    }
</script>
<!-- //script -->


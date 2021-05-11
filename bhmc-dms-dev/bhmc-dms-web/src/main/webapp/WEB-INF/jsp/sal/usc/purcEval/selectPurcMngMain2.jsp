<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/jquery.ajax-cross-origin.min.js' />"></script>
<%-- var permBtnReset = "disabled";
<dms:access viewId="VIEW-000476-01" hasPermission="WRITE" var="permBtnReset">
permBtnReset = "enabled";
</dms:access> --%>

<!-- 중고차매입관리 -->
<div id="resizableContainer">
    <section class="group"> <!-- 조회 조건 타이틀 시작 -->
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.usedCarBuy" /></h1>
            <!-- 중고차매입관리 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-D-11002" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_modify" id="btnViewDetail"><spring:message code='global.btn.detail' /></button><!-- 상세 -->
                </dms:access>
                <dms:access viewId="VIEW-D-11001" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m " id="btnSamplePrint"><spring:message code="sal.lbl.formatExam" /></button><!-- 양식출력(매입계약서) -->
                </dms:access>
                <dms:access viewId="VIEW-D-11000" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m " id="btnConfirm"><spring:message code="sal.btn.purcConfirm" /></button><!-- 성공 -->
                </dms:access>
                <dms:access viewId="VIEW-D-10999" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m " id="btnReject"><spring:message code="global.btn.reject" /></button><!-- 거절 -->
                </dms:access>
                <dms:access viewId="VIEW-D-10418"
                    hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_new" id="btnReset">
                        <spring:message code="global.btn.new" />
                    </button>
                    <!-- 신규 -->
                </dms:access>
                <dms:access viewId="VIEW-D-10998"
                    hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch">
                        <spring:message code="global.btn.search" />
                    </button>
                    <!-- 조회 -->
                </dms:access>
            </div>
        </div>
        <!-- 조회 조건 타이틀 종료 --><!-- 조회 조건 시작 -->
        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width: 8%;">
                    <col style="width: 17%;">
                    <col style="width: 8%;">
                    <col style="width: 17%;">
                    <col style="width: 8%;">
                    <col style="width: 17%;">
                    <col style="width: 8%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.carNo' /></th><!-- 차량번호 -->
                        <td>
                            <input id="sPlatNo" type="text" class="form_input">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                        <td>
                            <input id="sCarlineCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.vinNum' /></th><!-- VIN NO -->
                        <td>
                            <input id="sVinNo" type="text" class="form_input">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.carRegDt' /></th><!-- 등록일자 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sPurcRegStartDt" type="text" class="form_datepicker ac"> <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sPurcRegEndDt" type="text" class="form_datepicker ac">
                                </div>
                            </div>
                       </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.customer' /></th><!-- 고객 -->
                        <td>
                            <div class="form_float">
                                <div class="form_left">
                                    <div class="form_search">
                                        <input id="vContractCustNm" class="form_input">
                                            <a href="javascript:bf_searchCustomer();"><spring:message code='global.lbl.search' /></a>
                                        <!-- 검색 -->
                                        <input id="sContractCustNm" type="hidden" />
                                    </div>
                                </div>
                                <div class="form_right">
                                    <input id="sContractCustNo" readonly class="form_input form_readonly">
                                </div>
                            </div>
                       </td>
                       <th scope="row" class="bor_none"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 조회 조건 종료 --> <!-- 그리드 시작 -->
        <div class="table_grid mt10">
            <div id="grid" class="resizable_grid"></div>
        </div>
        <!-- 그리드 종료 -->

        <!-- 상세페이지  팝업 시작-->
        <section id="purcMngWindow" class="pop_wrap">
            <!-- 탭메뉴 전체 영역 -->
            <div class="tab_area" id="tabstrip">

                <!-- 탭메뉴 -->
                <ul>
                    <li class="k-state-active" id="carInfo"><spring:message code="ser.title.carInfo" /></li><!-- 차량정보 -->
                    <li id="evalInfo"><spring:message code="sal.lbl.evaluationInfo" /></li><!-- 평가정보 -->
                </ul>
                <!-- //탭메뉴 -->

                <span class="btn_right_absolute">
                    <dms:access viewId="VIEW-D-10997" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_s btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                    </dms:access>
                </span>

                <div class="viewPurcEval">
                    <form id="detailPurcForm" name="detailPurcForm" method="POST" action="/">
                        <div class="table_form">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width: 9%;">
                                    <col style="width: 21%;">
                                    <col style="width: 9%;">
                                    <col style="width: 15%;">
                                    <col style="width: 9%;">
                                    <col style="width: 15%;">
                                    <col style="width: 9%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <input id="popupOpenYn" name="popupOpenYn" type="hidden" value="N" />
                                        <th scope="row"><spring:message code='sal.lbl.documentNo' /><!-- 매입번호 -->
                                        </th>
                                        <td>
                                            <input id="dlrCd" name="dlrCd" type="hidden" data-json-obj="true">
                                            <input id="purcNo" name="purcNo" type="text" class="form_input form_readonly" readonly data-json-obj="true">
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.carRegDt' /><!-- 등록일자 -->
                                        </th>
                                        <td>
                                            <input id="purcRegDt" name="purcRegDt" type="text" disabled class="form_datepicker form_disabled" data-json-obj="true">
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.prsNm' /></th><!-- 담당자 -->
                                        <td>
                                            <input id="regUsrNm" class="form_input form_readonly" readonly />
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.statNm' /><!-- 상태 --></th>
                                        <td>
                                            <input id="purcStatCd" class="form_comboBox form_disabled" disabled/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <span class="bu_required"><spring:message code="global.lbl.custNm" /></span><!-- 고객명 -->
                                        </th>
                                        <td>
                                            <div class="form_float">
                                                <div class="form_left">
                                                    <div class="form_search" id="purcCustSearch">
                                                        <input id="purcCustNm" name="purcCustNm" type="text" class="form_input onKey_down" placeholder="<spring:message code='par.lbl.custNm' />" onchange="fnOnChange(this.id,this.value);" maxlength="30" />
                                                            <a href="#;" onclick="javascript:purcCustPopupWindow();"><spring:message code="global.lbl.custSearch" /></a><!-- 고객조회 -->
                                                    </div>
                                                </div>
                                                <div class="form_right">
                                                    <input id="purcCustNo" name="purcCustNo" type="text" readonly class="form_input form_readonly" data-json-obj="true">
                                                </div>
                                            </div></td>
                                        <th scope="row"><spring:message code='sal.lbl.telNumber' /></th><!-- 연락처 -->
                                        <td>
                                            <input id="telNo1" name="telNo1" type="text" class="form_input" data-json-obj="true" maxlength="20" />
                                        </td>
                                        <th scope="row">
                                            <span class="bu_required"><spring:message code='sal.lbl.purcTotAmt' /></span><!-- 매입총금액 -->
                                        </th>
                                        <td>
                                            <input id="purcTotAmt" name="purcTotAmt" type="number" min="0" max="" class="form_numeric ar" data-json-obj="true" maxlength="13" />
                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.evaluationPrsn' /></th><!-- 평가사 EVAL_PRSN_NM -->
                                        <td>
                                            <input id="evalPrsnNmView" name="evalPrsnNmView" type="text" class="form_input" data-json-obj="true" maxlength="30" />
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.salesAdvisor' /></th><!-- 판매고문 SALE_RGST_EMP -->
                                        <td>
                                            <input id="saleRgstEmp" name="saleRgstEmp" type="text"class="form_comboBox" data-json-obj="true" maxlength="30" />
                                        </td>
                                        <th scope="row"><spring:message code='lbl.sal.exchangeVehicle' /></th><!-- 치환 -->
                                        <td>
                                            <label class="label_check ml5">
                                                <!-- <input id="resultType1" name="resultType1" type="checkbox" class="form_check" onclick="funChkReqType(this.id)" data-json-obj="true" /> -->
                                                <input id="exchY" name="exchYn" type="radio" value="Y" checked="checked" class="form_check"/>
                                            </label>
                                        </td>
                                        <th scope="row"><spring:message code='lbl.sal.scrabVehicle' /></th><!-- 폐기 -->
                                        <td>
                                            <label class="label_check ml5">
                                                <!-- <input id="resultType2" name="resultType2" type="checkbox" class="form_check" onclick="funChkReqType(this.id)" data-json-obj="true" /> -->
                                                <input id="exchN" name="exchYn" type="radio" value="N" class="form_check">
                                            </label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code='ser.title.carInfo' /></h2><!-- 차량정보 -->
                        </div>
                        <div class="table_form">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width: 9%;">
                                    <col style="width: 21%;">
                                    <col style="width: 9%;">
                                    <col style="width: 15%;">
                                    <col style="width: 9%;">
                                    <col style="width: 15%;">
                                    <col style="width: 9%;">
                                    <col>
                                <tbody>
                                    <tr>
                                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.vinNo" /></span></th><!-- VIN NO -->
                                        <td class="required_area">
                                            <div class="form_search" id="searchVinNo">
                                                <input id="vinNo" name="vinNo" type="text" class="form_input onKey_down" placeholder="<spring:message code='global.lbl.vinNum' />" onchange="fnOnChange(this.id,this.value);" data-json-obj="true" maxlength="17">
                                                    <a href="javascript:;" onclick="javascript:vehiclePopupWindow();"><spring:message code='global.lbl.search' /></a>
                                                <!-- 검색 -->
                                            </div>
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                                        <td>
                                            <input id="carlineCd" name="carlineCd" class="form_comboBox" data-json-obj="true">
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                                        <td>
                                            <input id="modelCd" name="modelCd" class="form_comboBox" data-json-obj="true">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                                        <td>
                                            <input id="extColorCd" name="extColorCd" class="form_comboBox" data-json-obj="true">
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.contractNo' /></th><!-- 계약번호 -->
                                        <td>
                                            <div class="form_search" id="searchContractNo">
                                                <input id="contractNo" name="contractNo" type="text" readonly class="form_input form_readonly onKey_down" data-json-obj="true">
                                                <a href="javascript:;" onclick="javascript:contractNoPopupWindow();"><spring:message code='global.lbl.search' /></a>
                                                <!-- 검색 -->
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.runDist' /></th><!-- 마일리지(주행거리) -->
                                        <td>
                                            <input id="carRunDistVal" name="carRunDistVal" type="number" min="0" max="" class="form_numeric ar" data-json-obj="true">
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.fuelType' /></th><!-- 연료구분 -->
                                        <td>
                                            <input id="fuelCd" name="fuelCd" class="form_comboBox" data-json-obj="true">
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.carDrvMth' /></th><!-- 구동방식 -->
                                        <td>
                                            <input id="drvMthCd" name="drvMthCd" class="form_comboBox" data-json-obj="true">
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.carDispQty' /></th><!-- CC -->
                                        <td>
                                            <input id="carDispQty" name="carDispQty" type="number" min="0" max="" class="form_numeric ar" data-json-obj="true" maxlength="4">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.brand' /></th><!-- 브랜드 -->
                                        <td>
                                            <div class="form_float">
                                                <div>
                                                    <input id="carBrandCd" name="carBrandCd" class="form_comboBox" data-json-obj="true"/>
                                                </div>
                                            </div>
                                        </td>
                                        <th scope="row"><spring:message code="sal.lbl.purposeOfUse" /></th><!-- 사용용도 -->
                                        <td>
                                            <input id="pcDstinCd" name="pcDstinCd" class="form_comboBox"data-json-obj="true">
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.madeYyMm' /></th><!-- 제조년월 -->
                                        <td>
                                            <input id="manufactYyMmDt" name="manufactYyMmDt" type="text" class="form_datepicker" data-json-obj="true" />
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.vehicleInspecDt' /></th><!-- 차량검증일자 -->
                                        <td>
                                            <input id="vehicleInspecDt" name="vehicleInspecDt" type="text" class="form_datepicker" data-json-obj="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.purcAmt' /></span></th><!-- 매입가격 -->
                                        <td>
                                            <div class="form_float">
                                                <div class="date_left" style="width: 50%">
                                                    <input id="evalAmtFr" name="evalAmtFr" type="number" min="0" max="" class="form_numeric ar" data-json-obj="true"/>
                                                    <span class="txt_from">~</span>
                                                </div>
                                                <div class="date_right" style="width: 40%">
                                                    <input id="evalAmtTo" name="evalAmtTo" type="number" min="0" max="" class="form_numeric ar" data-json-obj="true" />
                                                </div>
                                            </div>
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.exchAmt' /></th><!-- 치환가격 -->
                                        <td>
                                            <input id="exchAmt" name="exchAmt" type="number" min="0" max="" class="form_numeric ar" data-json-obj="true" maxlength="13"/>
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.recomSaleAmt' /></th><!-- 추천판매가격 -->
                                        <td>
                                            <input id="recomSaleAmt" name="recomSaleAmt" type="number" min="0" max="" class="form_numeric ar" data-json-obj="true" maxlength="13"/>
                                        </td>
                                    <tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.retlDt' /></th><!-- 소매일자 -->
                                        <td>
                                            <input id="retlDt" name="retlDt" type="text" class="form_datepicker" data-json-obj="true">
                                        </td>
                                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.relCustInfo" /></span></th><!-- 연계인 -->
                                        <td>
                                            <input id="lastOwnerNm" name="lastOwnerNm" class="form_input" data-json-obj="true" maxlength="20"/>
                                        </td>
                                        <th scope="row"><spring:message code="sal.lbl.relCustInfoTelNo" /></th><!-- 연계인전화번호 -->
                                        <td>
                                            <input id="lastOwnerTel" name="lastOwnerTel" class="form_input" data-json-obj="true" maxlength="20"/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="table_form mt10">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width: 9%;">
                                    <col style="width: 21%;">
                                    <col style="width: 9%;">
                                    <col style="width: 15%;">
                                    <col style="width: 9%;">
                                    <col style="width: 15%;">
                                    <col style="width: 9%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.noSaleYn' /></th><!-- 번호판여부 -->
                                        <td>
                                            <label class="label_check ml5">
                                                <input id="noSaleYn" name="noSaleYn" type="checkbox" value="Y" class="form_check" data-json-obj="true" />
                                            </label>
                                        </td>
                                        <th scope="row"><spring:message code='ser.lbl.carRegNo' /></th><!-- 번호판번호 -->
                                        <td>
                                            <input id="platNo" name="platNo" type="text" class="form_input" data-json-obj="true" maxlength="20"/>
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.carRegAmt' /></th><!-- 번호판가격 -->
                                        <td>
                                            <input id="platAmt" name="platAmt" type="number" min="0" max="" class="form_numeric ar" data-json-obj="true" maxlength="13"/>
                                        </td>
                                        <th scope="row"></th>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="table_form mt10">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width: 10%;">
                                    <col style="width: 20%;">
                                    <col style="width: 10%;">
                                    <col style="width: 14%;">
                                    <col style="width: 10%;">
                                    <col style="width: 14%;">
                                    <col style="width: 10%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.fceIncPrid' /></th><!-- 교통사고강제보험 유효기간 -->
                                        <td>
                                            <input id="fceIncPrid" name="fceIncPrid" type="text" class="form_datepicker form_required ac" data-json-obj="true"/>
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.carTaxPrid' /></th><!-- 차배세유효기간 -->
                                        <td>
                                            <input id="carTaxPrid" name="carTaxPrid" type="text" class="form_datepicker form_required ac" data-json-obj="true"/>
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.yyTestPrid' /></th><!-- 년검사 유효기간 -->
                                        <td>
                                            <input id="yyTestPrid" name="yyTestPrid" type="text" class="form_datepicker form_required ac " data-json-obj="true"/>
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.cmcIncPrid' /></th><!-- 상업보험 유효기간 -->
                                        <td>
                                            <input id="cmcIncPrid" name="cmcIncPrid" type="text" class="form_datepicker ac " data-json-obj="true"/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>

                <div class="viewPurcEval">
                    <div class="header_area">
                        <h2 class="title_basic"><spring:message code='sal.lbl.evaluationInfo' /></h2><!-- 평가정보 -->
                    </div>
                    <form id="detailEvalForm" name="detailEvalForm" method="POST" action="/">
                        <div class="table_form">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width: 10%;">
                                    <col style="width: 15%;">
                                    <col style="width: 10%;">
                                    <col style="width: 15%;">
                                    <col style="width: 10%;">
                                    <col style="width: 15%;">
                                    <col style="width: 10%;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.evaluationWay' /></th><!-- 평가방법 -->
                                        <td id="btnEvalMth">
                                            <ul class="tabmenu disabled" id="tabBtnMath">
                                                <input type="hidden" id="evalMthCd" name="evalMthCd" value="M" data-json-obj="true" />
                                                <li id="btnSelf" >
                                                    <dms:access viewId="VIEW-D-10996" hasPermission="${dms:getPermissionMask('READ')}">
                                                        <button type="button" onclick="fnPurcWayClick('A');" id="btnSelf1" disabled>
                                                            <spring:message code='global.lbl.ourCompany' />
                                                        </button>
                                                    </dms:access>
                                                </li>
                                                <!-- 본인 -->
                                                <li id="btnProxy" class="on">
                                                    <dms:access viewId="VIEW-D-10995" hasPermission="${dms:getPermissionMask('READ')}">
                                                        <button type="button" onclick="fnPurcWayClick('M');" id="btnProxy1" disabled>
                                                            <spring:message code='global.lbl.execution' />
                                                        </button>
                                                    </dms:access>
                                                </li>
                                                <!-- 대행 -->
                                            </ul>
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.evaluationPerson' /></th><!-- 평가담당자 -->
                                        <td>
                                            <input id="evalPrsnNm" name="evalPrsnNm" type="text" class="form_input form_disabled" disabled data-json-obj="true" maxlength="20"/>
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.evalScheDt' /></th><!-- 평가일자 -->
                                        <td>
                                            <input id="evalDt" name="evalDt" class="form_datepicker ac" data-json-obj="true">
                                        </td>
                                        <td></td>
                                        <td>
                                            <dms:access viewId="VIEW-D-10994" hasPermission="${dms:getPermissionMask('READ')}">
                                                <button id="btnVehicleEvalImageSub" type="button" class="btn_xs">
                                                    <spring:message code='sal.btn.vehicleEvalImage' /><!-- 명세서 -->
                                                </button>
                                            </dms:access>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.custHopeAmt' /></th><!-- 고객희망가격 -->
                                        <td>
                                            <input id="custHopeAmt" name="custHopeAmt" type="number" min="0" max="" value="0" class="form_numeric ar" data-json-obj="true" maxlength="13"/>
                                            <input id="newFlag" name="newFlag" type="hidden">
                                        </td>
                                        <th scope="row"><spring:message code='sal.evalPersonAmt' /></th><!-- 평가가격 -->
                                        <td>
                                            <input id="evalAmt" name="evalAmt" type="number" min="0" max="" value="0" class="form_numeric ar" data-json-obj="true" maxlength="13"/>
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.lastAmt' /></th><!-- 최종판매가격 -->
                                        <td>
                                            <input id="lastAmt" name="lastAmt" type="number" min="0" max="" value="0" class="form_numeric ar" data-json-obj="true" maxlength="13"/>
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.carRegEvalAmt' /></th><!-- 번호판평가가격 -->
                                        <td>
                                            <input id="carRegAmt" name="carRegAmt" type="number" min="0" max="" value="0" class="form_numeric ar" data-json-obj="true" maxlength="13"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.evaluationRemark' /></th><!-- 평가의견 -->
                                        <td colspan="7">
                                            <input id="evalRemark" name="evalRemark" type="text" class="form_input form_disabled" disabled data-json-obj="true" rows="2" cols="30" maxlength="4000"/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </form>
                    <!-- 그리드 종료 -->
                </div>
            </div>
            <!-- 상세페이지  팝업 종료-->
        </section>
    </section>
    <!-- //수선시스템 - 차량정보 -->
</div>


<!-- script -->
<script type="text/javascript">
var carBrandCdMap = [];
var dlrCd = "${dlrCd}"; // 딜러
var usrId = "${usrId}"; // 신청인코드
var usrNm = "${usrNm}"; // 신청인명
var toDay = "${toDay}";
var purcStatCd = "";
var popupWindow;
var serverUrl = "https://tndms.bhmc.com.cn/bhmc-dms-web";

//차량
var carLineCdList = [];
 <c:forEach var="obj" items="${carLineCdInfo}">
     carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
 </c:forEach>

//중고차매입상태 Array
var purcStatCdDs = [];
<c:forEach var="obj" items="${purcStatCdList}">
    purcStatCdDs.push({"cmmCd" : "${obj.cmmCd}","cmmCdNm" : "${obj.cmmCdNm}","useYn" : "${obj.useYn}"});
</c:forEach>
//중고차매입상태 Map
var purcStatCdMap = dms.data.arrayToMap(purcStatCdDs, function(obj) {return obj.cmmCd;});

//사용용도(승/상용구분) Array
var pcDstinCdDs = [];
<c:forEach var="obj" items="${pcDstinCdList}">
    pcDstinCdDs.push({"cmmCd" : "${obj.cmmCd}","cmmCdNm" : "${obj.cmmCdNm}","useYn" : "${obj.useYn}"});
</c:forEach>
//사용용도(승/상용구분) Map
var pcDstinCdMap = dms.data.arrayToMap(pcDstinCdDs, function(obj) {return obj.cmmCd;});

//연료구분 Array
var fuelCdDs = [];
<c:forEach var="obj" items="${fuelCdList}">
    fuelCdDs.push({"cmmCd" : "${obj.cmmCd}","cmmCdNm" : "${obj.cmmCdNm}","useYn" : "${obj.useYn}"});
</c:forEach>
//연료구분 Map
var fuelCdMap = dms.data.arrayToMap(fuelCdDs, function(obj) {
    return obj.cmmCd;
});

//구동방식 Array
var drvMthCdDs = [];
<c:forEach var="obj" items="${drvMthCdList}">
    drvMthCdDs.push({"cmmCd" : "${obj.cmmCd}","cmmCdNm" : "${obj.cmmCdNm}","useYn" : "${obj.useYn}"});
</c:forEach>
//구동방식 Map
var drvMthCdMap = dms.data.arrayToMap(drvMthCdDs, function(obj) {
    return obj.cmmCd;
});

//차량상태코드 Array
var carStatCdDs = [];
<c:forEach var="obj" items="${carStatCdList}">
    carStatCdDs.push({"cmmCd" : "${obj.cmmCd}","cmmCdNm" : "${obj.cmmCdNm}","useYn" : "${obj.useYn}"});
</c:forEach>
//차량상태코드 Map
var carStatCdMap = dms.data.arrayToMap(carStatCdDs, function(obj) {
    return obj.cmmCd;
});

//경매구분 Array
var auctCdDs = [];
<c:forEach var="obj" items="${auctCdList}">
    auctCdDs.push({"cmmCd" : "${obj.cmmCd}","cmmCdNm" : "${obj.cmmCdNm}","useYn" : "${obj.useYn}"});
</c:forEach>
//중고차매입상태 Map
var auctCdMap = dms.data.arrayToMap(auctCdDs, function(obj) {
    return obj.cmmCd;
});

//차량인도여부 Array
var carDlYnDs = [];
<c:forEach var="obj" items="${carDlYnList}">
    carDlYnDs.push({"cmmCd" : "${obj.cmmCd}","cmmCdNm" : "${obj.cmmCdNm}","useYn" : "${obj.useYn}"});
</c:forEach>
//차량인도여부 Map
var carDlYnMap = dms.data.arrayToMap(carDlYnDs, function(obj) {return obj.cmmCd;});

//브랜드 COM019
var carBrandCdDs = [];
<c:forEach var="obj" items="${carBrandCdList}">
carBrandCdDs.push({"cmmCd" : "${obj.cmmCd}","cmmCdNm" : "${obj.cmmCdNm}","useYn" : "${obj.useYn}"});
</c:forEach>

//본사,타사구분
var corpCarDstinCdDs = [ {
       "cmmCd" : "01"
      ,"cmmCdNm" : "<spring:message code='sal.lbl.thisCompany' />"}
    ,{
      "cmmCd" : "02",
      "cmmCdNm" : "<spring:message code='sal.lbl.otherCompany' />"
} ];
var corpCarDstinCdMap = dms.data.arrayToMap(corpCarDstinCdDs,function(obj) {return obj.cmmCd;});

//금액구간
var saleEvalAmtDs = [];
<c:forEach var="obj" items="${saleEvalAmtList}">
    saleEvalAmtDs.push({"cmmCd" : "${obj.cmmCd}","cmmCdNm" : "${obj.cmmCdNm}","useYn" : "${obj.useYn}"});
</c:forEach>

// 판매고문
var selectSaleEmpDSList = [];
var selectSaleEmpDSObj = {};
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm : "[${obj.usrId}]${obj.usrNm}",saleEmpCd : "${obj.usrId}"});
    selectSaleEmpDSObj["${obj.usrId}"] = "[${obj.usrId}]${obj.usrNm}";
</c:forEach>


var popupEvCarWindow;
var popupWindow;



//조회조건:시작일-종료일 날짜 비교
function fnChkSearchDate (e) {
    if (dms.string.isEmpty(e.data.from.val())) {
        return;
    }
    if (dms.string.isEmpty(e.data.to.val())) {
        return;
    }

    var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
    var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
    if (startDt > endDt) {
        dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
        $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
        $(this).focus();
    }
}

$(document).ready(function() {

    /*
     * max 500으로 지정. 여백이 있는경우는 줄여야함
     */

    $("#purcMngWindow").kendoWindow({
        animation : false
        ,draggable : false
        ,modal : true
        ,resizable : false
        ,visible : false
        ,title : "<spring:message code='sal.lbl.detailSearch' />" // 상세정보
        ,width : "950px"
        ,height : "500px"
    }).data("kendoWindow");

    //조회조건 - START
    $("#sPurcRegStartDt").kendoExtMaskedDatePicker({
        format : "<dms:configValue code='dateFormat' />",
        dateValidMessage : "<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //조회조건 - END
    $("#sPurcRegEndDt").kendoExtMaskedDatePicker({
        format : "<dms:configValue code='dateFormat' />",
        dateValidMessage : "<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 조회조건 - 시작일, 종료일
    $("#sPurcRegStartDt").on('change', {from : $("#sPurcRegStartDt"),to : $("#sPurcRegEndDt")}, fnChkSearchDate);
    $("#sPurcRegEndDt").on('change', {from : $("#sPurcRegStartDt"),to : $("#sPurcRegEndDt")}, fnChkSearchDate);

    /**************************************** 검색조건 END **********************************************************/

    //차종
    $("#carlineCd").kendoExtDropDownList({
        dataTextField : "carlineNm"
        ,dataValueField : "carlineCd"
        ,dataSource : carLineCdList
        ,optionLabel : " " // 전체
        ,change : function(e) {
            var dataItem = this.dataItem(e.item);
            $("#modelCd").data("kendoExtDropDownList").setDataSource([]);
            $("#modelCd").data("kendoExtDropDownList").enable(true);


            $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#extColorCd").data("kendoExtDropDownList").enable(false);


            $("#vinNo").val("");
            if (dataItem.carlineCd == "") {
                $("#modelCd").data("kendoExtDropDownList").setDataSource([]);
                $("#modelCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax
                    .getJson({
                        url : "<c:url value='/sal/usc/purcEval/selectModel.do' />",
                        data : JSON.stringify({"carlineCd" : dataItem.carlineCd}),
                        async : false
                    });
            $("#modelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });

    // 모델
    $("#modelCd").kendoExtDropDownList({
        dataTextField : "modelNm"
        ,dataValueField : "modelCd"
        ,optionLabel : " " // 전체
        ,change : function(e) {
            var dataItem = this.dataItem(e.item);
            $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#extColorCd").data("kendoExtDropDownList").enable(true);


            $("#vinNo").val("");

            var responseJson = dms.ajax
                    .getJson({
                        url : "<c:url value='/sal/veh/vehicleMaster/selectExtColor.do' />",
                        data : JSON.stringify({"modelCd" : $("#modelCd").data("kendoExtDropDownList").value()}),
                        async : false
                    });
            $("#extColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#modelCd").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#extColorCd").kendoExtDropDownList({
        dataTextField : "extColorNm",
        dataValueField : "extColorCd",
        optionLabel : " " // 전체
        ,
        select : function(e) {

            $("#vinNo").val("");

        }
    });
    $("#extColorCd").data("kendoExtDropDownList")
            .enable(false);

    //중고차매입상태
    $("#purcStatCd").kendoExtDropDownList({
        dataTextField : "cmmCdNm",
        dataValueField : "cmmCd",
        dataSource : purcStatCdDs,
        optionLabel : " " // 전체
    });

    //사용용도(승/상용구분)
    $("#pcDstinCd").kendoExtDropDownList({
        dataTextField : "cmmCdNm",
        dataValueField : "cmmCd",
        dataSource : pcDstinCdDs,
        optionLabel : " " // 전체
    });

    //연료구분
    $("#fuelCd").kendoExtDropDownList({
        dataTextField : "cmmCdNm",
        dataValueField : "cmmCd",
        dataSource : fuelCdDs,
        optionLabel : " " // 전체
    });

    //구동방식
    $("#drvMthCd").kendoExtDropDownList({
        dataTextField : "cmmCdNm",
        dataValueField : "cmmCd",
        dataSource : drvMthCdDs,
        optionLabel : " " // 전체
    });

    //판매고문
    $("#saleRgstEmp").kendoExtDropDownList({
        dataTextField : "saleEmpNm",
        dataValueField : "saleEmpCd",
        dataSource : selectSaleEmpDSList,
        optionLabel : ""
    });


    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField : "carlineNm",
        dataValueField : "carlineCd",
        dataSource : carLineCdList,
        optionLabel : " "
    });

    $("#vinNo").bind("keyup", function() {
        $(this).val($(this).val().toUpperCase());
    });

    //제조사
    $("#carBrandCd").kendoExtDropDownList({
        dataTextField : "cmmCdNm",
        dataValueField : "cmmCd",
        dataSource : carBrandCdDs,
        suggest : true,
        filter : "startswith",
        change : function(e) {
            var dataItem = this.dataItem(e.item);
            var manufacturerid = dataItem.cmmCd;
            $.ajax({
                url : "<c:url value='/sal/usc/purcEval/selectCarLine.do'/>",
                data : JSON.stringify({carlineCd : manufacturerid}),
                type : "POST",
                dataType : "json",
                contentType : "application/json",
                async : false,
                success : function(data) {
                    var responseJson = JSON.parse(JSON.stringify(data));
                    carLineCdList = [];
                    $.each(responseJson.data,function(idx,obj) {
                        carLineCdList.push({
                                "carlineNm" : obj.carlineNm,
                                "carlineCd" : obj.carlineCd,
                                "useYn" : "Y"
                            });
                    });
                    $("#carlineCd").data("kendoExtDropDownList").setDataSource(carLineCdList);
                },
                error : function(jqXHR,status,error) {

                }
            });
        },
        index : 1
    //,optionLabel:" "  // 전체
    });

    /***** 매입총금액 *****/
    $("#purcTotAmt").kendoExtNumericTextBox({ // 구매가격
        format : "n2" // n0:###,###, n2:###,###.##
        ,decimals : 2 // 소숫점
        ,min : 0.00
        ,value : 0.00
        ,spinners : false
    // 증,감 화살표
    });

    /***** 배기량 ,주행거리,치환가,추천판매가,번호판가격,고객희망가격,평가가격,최종판매가격,매입가격시작,매입가격종료,번호판평가가격,추천판매가격,마일리지*****/
    $("#carDispQty,#carDispQty,#exchAmt,#pecomSaleAmt,#platAmt,#custHopeAmt,#evalAmt,#lastAmt,#evalAmtFr,#evalAmtTo,#carRegAmt,#recomSaleAmt,#carRunDistVal").kendoExtNumericTextBox({
         format : "n0" // n0:###,###, n2:###,###.##
        ,decimals : 0 // 소숫점
        ,min : 0
        ,value : 0
        ,spinners : false
    // 증,감 화살표
    });

    //평가일자
    $("#evalDt").kendoExtMaskedDatePicker({
        format : "{0:<dms:configValue code='dateFormat' />}",
        dateValidMessage : "<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />",
        enable : false
    });

    //등록일자
    $("#purcRegDt").kendoExtMaskedDatePicker({
        format : "{0:<dms:configValue code='dateFormat' />}",
        dateValidMessage : "<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    //,value:toDay
    });

    //제작년월,교통사고강제보험 유효기간,차배세유효기간,년검사 유효기간,상업보험 유효기간
    $("#manufactYyMmDt,#fceIncPrid,#carTaxPrid,#yyTestPrid,#cmcIncPrid").kendoExtMaskedDatePicker({
        start : "year",
        depth : "year",
        format : "yyyy-MM",
        dateValidMessage : "<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });


    //차량검증일자,소매일자
    $("#vehicleInspecDt,#retlDt").kendoExtMaskedDatePicker({
        format : "{0:<dms:configValue code='dateFormat' />}",
        dateValidMessage : "<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    //,value:toDay
    });


    /**************************************** 상세내역 END **********************************************************/

    // 상세정보
    $("#btnViewDetail").kendoButton({
        click : function(e) {

            var grid = $("#grid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            if (dms.string.isNotEmpty(selectedItem)) {

                viewDetail(selectedItem);

            } else {
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        },
        enable : false
    })

    /*****************************************************************************
     ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
     *******************************************************************************/
    // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
    $("#grid").on("dblclick","tr.k-state-selected",function(e) {

        var gridId = e.delegateTarget.id, grid = $("#" + gridId + "").data("kendoExtGrid"), selectedItem = grid.dataItem(grid.select());

        if (dms.string.isNotEmpty(selectedItem)) {

            viewDetail(selectedItem);

        } else {

            // {상세정보}을(를) 확인하여 주세요.
            dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
            return;
        }

    });




    //팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
    function viewPopup() {
      var win = $("#purcMngWindow").data("kendoWindow");
      win.center();
      win.open();
    }

    // 상세조회 후 팝업오픈
    viewDetail = function (selectedVal) {

        if (dms.string.isNotEmpty(selectedVal)) {
            // 팝업오픈;
            viewPopup();
            $("#tabstrip").data("kendoExtTabStrip").select(0);

            var purcStatCd = selectedVal.purcStatCd;

            $.ajax({
                url : "<c:url value='/sal/usc/purcEval/selectPurcEval.do' />"
               ,data : JSON.stringify({sPurcNo : selectedVal.purcNo})
               ,type : "POST"
               ,dataType : "json"
               ,contentType : "application/json"
               ,error : function(jqXHR,status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result, textStatus){
                    if(result != null){
                        //버튼 세팅
                        setButtonEnable(purcStatCd);
                        //중고차 정보 세팅
                        setPurcInfo(result.purcEvalDs);
                    }
                }
            });

        } else {
            // {상세정보}을(를) 확인하여 주세요.
            dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
            return;
        }
    };

    /*****************************************************************************
     ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
     *******************************************************************************/

    //버튼 - 양식출력(매입계약서)
    $("#btnSamplePrint").kendoButton({
        click : function(e) {
            //기능개발중입니다.
            dms.notification.warning("<spring:message code = 'sal.info.functionDeveloping'/>");
        },
        enable : false
    });

    //버튼 - 차량이미지 평가용
    $("#btnVehicleEvalImageSub").kendoButton({
        click : function(e) {
            selectEvCarPopupWindow();
        }
    });

    //버튼 - 고객조회
    $("#btnCustSearch").kendoButton({
        click : function(e) {
            window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />","<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />","VIEW-D-10272");
        }
    });

    //버튼 - 차량마스터조회
    $("#btnVehicleSearch").kendoButton({
        click : function(e) {
            var carId = "H00001073053";
            window.parent._createOrReloadTabMenu("<spring:message code='sal.lbl.carMaster' />","<c:url value='/sal/veh/vehicleMaster/selectVehicleMasterMain.do' />?sCarId="+ carId,"VIEW-D-10396");
        }
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click : function(e) {
            fnReset();
            $("#btnConfirm").data("kendoButton").enable(false);
            $("#btnReject").data("kendoButton").enable(false);
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 초기화
    $("#btnReset").kendoButton({
        click : function(e) {

            $('#grid').data('kendoExtGrid').clearSelection();

            viewPopup();
            fnReset();

            purcStatCd = '00';
            $("#newFlag").val('00');
            setButtonEnable("");

            $("#btnSave").data("kendoButton").enable(true);
        }
    });

    //팝업 저장 버튼 - 임시저장
    $("#btnSave").kendoButton({

        click : function(e) {
            var grid = $("#grid").data("kendoExtGrid");

            //고객명
            if (dms.string.isEmpty($("#purcCustNo").val())) {
                dms.notification.warning("<spring:message code='global.lbl.custNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#purcCustNm").focus();
                return false;
            }

            //vin_no
            if (dms.string.isEmpty($("#vinNo").val())) {
                dms.notification.warning("<spring:message code='global.lbl.vinNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#vinNo").focus();
                return false;
            }

            //최종소유자
            if (dms.string.isEmpty($("#purcCustNo").val())) {
                dms.notification.warning("<spring:message code='global.lbl.custNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#purcCustNm").focus();
                return false;
            }

            //연계인
            if (dms.string.isEmpty($("#lastOwnerNm").val())) {
                dms.notification.warning("<spring:message code='global.lbl.relCustInfo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#lastOwnerNm").focus();
                return false;
            }

            //매입금액구간시작
            if ($("#evalAmtFr").val() < 1) {
                dms.notification.warning("<spring:message code='sal.lbl.purcAmt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#evalAmtFr").focus();
                return false;
            }

            //매입금액구간종료
            if ($("#evalAmtTo").val() < 1) {
                dms.notification.warning("<spring:message code='sal.lbl.purcAmt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#evalAmtTo").focus();
                return false;
            }

            //매입가
            if ($("#purcTotAmt").val() < 1) {
                dms.notification.warning("<spring:message code='sal.lbl.purcTotAmt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#purcTotAmt").focus();
                return false;
            }

            var msg = "";
            if ( dms.string.isEmpty($("#purcNo").val())) {
                msg = "<spring:message code='global.lbl.newSave' var='newSave' /><spring:message code='global.info.cnfrmMsg' arguments='${newSave},' />";
            } else {
                msg = "<spring:message code='global.btn.tempSave' var='tmpSave' /><spring:message code='global.info.cnfrmMsg' arguments='${tmpSave},' />";
            }

            dms.window.confirm({message : msg,title : "<spring:message code='global.btn.save' />"
                ,callback : function(result) {
                    if (result) {

                        var param;

                        param = $("#detailPurcForm").serializeObject($("#detailPurcForm").serializeArrayInSelector("[data-json-obj='true']"));

                        param.purcRegDt = $("#purcRegDt").data("kendoExtMaskedDatePicker").value();
                        param.retlDt = $("#retlDt").data("kendoExtMaskedDatePicker").value();
                        param.vehicleInspecDt = $("#vehicleInspecDt").data("kendoExtMaskedDatePicker").value();

                        if ($("#evalMthCd").val() == "") {
                            param.evalMthCd = "A";
                        } else {
                            param.evalMthCd = $("#evalMthCd").val();
                        }
                        param.evalPrsnNm   = $("#evalPrsnNm").val();
                        param.evalDt       = $("#evalDt").data("kendoExtMaskedDatePicker").value();
                        param.evalRemark   = $("#evalRemark").val();
                        param.custHopeAmt  = $("#custHopeAmt").val();
                        param.carRegAmt    = $("#carRegAmt").val();
                        param.evalAmt      = $("#evalAmt").val();
                        param.lastAmt      = $("#lastAmt").val();

                        var exchYn = $('input[name="exchYn"]:checked').val();
                        param.exchYn       = exchYn;
                        if(exchYn == "Y"){
                            param.carStatCd    = "60";
                        }else{
                            param.carStatCd    = "99";
                        }
                        param.modelCd      = $("#modelCd").val();
                        param.extColorCd   = $("#extColorCd").val();


                        var noSaleYn       = ($("#noSaleYn").is(":checked")) ? "Y" : "N";
                        param.noSaleYn     = noSaleYn;

                        var purcStatCd = $("#purcStatCd").val();
                        if(dms.string.isEmpty(purcStatCd)){
                            purcStatCd = "01";
                        }
                        param.purcStatCd = purcStatCd;

                        saveUseCar(param);

                    } else {
                        return false;
                    }
                }
            });
        }
    });


    // 성공
    $("#btnConfirm").kendoButton({
        click : function(e) {

            var msg = "<spring:message code='sal.btn.purcConfirm' var='purcConfirm' /><spring:message code='global.info.cnfrmMsg' arguments='${purcConfirm},' />";
            dms.window.confirm({message : msg,title : "<spring:message code='sal.btn.purcConfirm' />"
                ,callback : function(result) {
                    if (result) {

                        var grid = $("#grid").data("kendoExtGrid");
                        var selectedVal = grid.dataItem(grid.select());
                        if(selectedVal != null ){

                            var param = {
                                    purcStatCd      : "04"
                                   ,vinNo           : selectedVal.vinNo
                                   ,purcNo          : selectedVal.purcNo
                                   ,carStatCd       : selectedVal.carStatCd
                                   ,custSaleCancDt  : selectedVal.custSaleCancDt
                                   ,carlineNm       : selectedVal.carlineNm
                                   ,carId           : selectedVal.carId
                            }
                            saveUseCar(param);
                        }
                    } else {
                        return false;
                    }
                }
            });
        },
        enable : false
    });


    // 반려
    $("#btnReject").kendoButton({

        click : function(e) {
            var msg = "<spring:message code='global.btn.reject' var='reject' /><spring:message code='global.info.cnfrmMsg' arguments='${reject},' />";
            dms.window.confirm({message : msg,title : "<spring:message code='global.btn.reject' />"
                ,callback : function(result) {
                    if (result) {

                        var grid = $("#grid").data("kendoExtGrid");
                        var selectedVal = grid.dataItem(grid.select());
                        if(selectedVal != null){

                            var param = {
                                    purcStatCd      : "05"
                                   ,vinNo           : selectedVal.vinNo
                                   ,purcNo          : selectedVal.purcNo
                                   ,carStatCd       : selectedVal.carStatCd
                            }

                            saveUseCar(param);
                        }

                    } else {
                        return false;
                    }
                }
            });
        },
        enable : false
    });


    //저장
    saveUseCar = function(param){

        $.ajax({
            url : "<c:url value='/sal/usc/purcEval/savePurcEvalMng.do' />",
            type : 'POST',
            dataType : 'json',
            contentType : 'application/json',
            data : JSON.stringify(param),
            error : function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            },
            success : function(data) {
                $("#purcMngWindow").data("kendoWindow").close();

                //버튼 세팅
                setButtonEnable(data.purcStatCd);
                //fnReset();
                //purcStatCd == '';
                $('#grid').data('kendoExtGrid').dataSource.page(1);
                // 저장이 완료되었습니다.
                dms.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
            }
        });

    };

    //명세서버튼
    $("#btnDetailList").kendoButton({
        click : function(e) {

            //개발진행 예정중입니다.
            dms.notification.warning("<spring:message code='global.info.developIng'/>");

        }
    });


    //초기화
    fnReset = function () {

        $("#detailPurcForm").get(0).reset();
        $("#detailEvalForm").get(0).reset();

        setButtonEnable("");
    }


    //적용방법 버튼
    fnPurcWayClick = function(gubun) {
      if (gubun == "A") {
          $("#btnSelf").attr("class", "on");
          $("#btnProxy").attr("class", "");
          $("#evalMthCd").val("A");
      } else if (gubun == "M") {
          $("#btnSelf").attr("class", "");
          $("#btnProxy").attr("class", "on");
          $("#evalMthCd").val("M");
      }
    }

    //차량정보
    setPurcInfo = function(result){


        $("#dlrCd").val(result.dlrCd);
        $("#purcNo").val(result.purcNo);

        $("#regUsrNm").val(result.regUsrNm);

        $("#purcCustNm").val(result.purcCustNm);
        $("#purcCustNo").val(result.purcCustNo);
        $("#telNo1").val(result.telNo1);
        $("#evalPrsnNmView").val(result.evalPrsnNmView);
        $("#vinNo").val(result.vinNo);
        $("#contractNo").val(result.contractNo);
        $("#lastOwnerNm").val(result.lastOwnerNm);
        $("#lastOwnerTel").val(result.lastOwnerTel);
        $("#evalPrsnNm").val(result.evalPrsnNm);
        $("#evalRemark").val(result.evalRemark);
        $("#platNo").val(result.platNo);
        $("input[name=exchYn]:radio:input[value="+result.exchYn+"]").prop("checked", true);
        $("#noSaleYn").prop("checked", (result.noSaleYn == "Y")? true : false );

        $("#purcStatCd").data("kendoExtDropDownList").value(result.purcStatCd);
        $("#drvMthCd").data("kendoExtDropDownList").value(result.drvMthCd);
        $("#carBrandCd").data("kendoExtDropDownList").value(result.carBrandCd);
        $("#pcDstinCd").data("kendoExtDropDownList").value(result.pcDstinCd);
        $("#saleRgstEmp").data("kendoExtDropDownList").value(result.saleRgstEmp);
        $("#fuelCd").data("kendoExtDropDownList").value(result.fuelCd);
        $("#carlineCd").data("kendoExtDropDownList").value(result.carlineCd);
        $("#modelCd").data("kendoExtDropDownList").value(result.modelCd);
        $("#extColorCd").data("kendoExtDropDownList").value(result.extColorCd);
        $("#extColorCd").data("kendoExtDropDownList").value(result.extColorCd);

        $("#retlDt").data("kendoExtMaskedDatePicker").value(result.retlDt);
        $("#fceIncPrid").data("kendoExtMaskedDatePicker").value( result.fceIncPrid );
        $("#carTaxPrid").data("kendoExtMaskedDatePicker").value(result.carTaxPrid);
        $("#yyTestPrid").data("kendoExtMaskedDatePicker").value(result.yyTestPrid);
        $("#cmcIncPrid").data("kendoExtMaskedDatePicker").value(result.cmcIncPrid);
        $("#purcRegDt").data("kendoExtMaskedDatePicker").value(result.purcRegDt);
        $("#manufactYyMmDt").data("kendoExtMaskedDatePicker").value(result.manufactYyMmDt);
        $("#vehicleInspecDt").data("kendoExtMaskedDatePicker").value(result.vehicleInspecDt);
        $("#evalDt").data("kendoExtMaskedDatePicker").value(result.evalDt);


        $("#carRunDistVal").data("kendoExtNumericTextBox").value(result.carRunDistVal);
        $("#purcTotAmt").data("kendoExtNumericTextBox").value(result.purcTotAmt);
        $("#carDispQty").data("kendoExtNumericTextBox").value(result.carDispQty);
        $("#evalAmtFr").data("kendoExtNumericTextBox").value(result.evalAmtFr);
        $("#evalAmtTo").data("kendoExtNumericTextBox").value(result.evalAmtTo);
        $("#exchAmt").data("kendoExtNumericTextBox").value(result.exchAmt);
        $("#recomSaleAmt").data("kendoExtNumericTextBox").value(result.recomSaleAmt);
        $("#custHopeAmt").data("kendoExtNumericTextBox").value(result.custHopeAmt);
        $("#lastAmt").data("kendoExtNumericTextBox").value(result.lastAmt);
        $("#evalAmt").data("kendoExtNumericTextBox").value(result.evalAmt);
        $("#carRegAmt").data("kendoExtNumericTextBox").value(result.carRegAmt);
        $("#platAmt").data("kendoExtNumericTextBox").value(result.platAmt);
    };


    setButtonEnable = function(purcStatCd){

        if(purcStatCd == "01" || purcStatCd == "02" ||  purcStatCd == ""){ //저장 , 평가요청

            //팝업 버튼
            $("#purcCustSearch").removeClass("form_search_disabled");
            $("#searchVinNo").removeClass("form_search_disabled");
            $("#searchContractNo").removeClass("form_search_disabled");


            $("#purcCustNm").prop("disabled", "").removeClass("form_disabled"); //고객명
            $("#btnCorpCarDstin").attr("disabled", "");

            $("#exchY").removeAttr("disabled");
            $("#exchN").removeAttr("disabled");

            $("#telNo1").prop("disabled", "").removeClass("form_disabled"); //연락처
            $("#purcTotAmt").data("kendoExtNumericTextBox").enable(true); //매입총금액
            $("#resultType1").prop("disabled", "").addClass("form_disabled"); //치환여부
            $("#resultType2").prop("disabled", "").addClass("form_disabled"); //치환여부
            $("#carBrandCd").data("kendoExtDropDownList").enable(true); //제조사
            $("#tabBtnComp").removeClass("disabled"); //본사/타사 구분버튼
            $("#evalAmtFr").data("kendoExtNumericTextBox").enable(true); //매입금액구간시작
            $("#evalAmtTo").data("kendoExtNumericTextBox").enable(true); //매입금액구간종료
            $("#carlineCd").data("kendoExtDropDownList").enable(true); //차종
            $("#carDispQty").data("kendoExtNumericTextBox").enable(true); //배기량
            $("#manufactYyMmDt").data("kendoExtMaskedDatePicker").enable(true); //제조년월
            $("#vehicleInspecDt").data("kendoExtMaskedDatePicker").enable(true); //차량검증일자
            $("#vinNo").prop("disabled", "").removeClass("form_disabled"); //VIN NO
            $("#pcDstinCd").data("kendoExtDropDownList").enable(true); //사용용도
            $("#carRunDistVal").data("kendoExtNumericTextBox").enable(true); //주행거리
            $("#fuelCd").data("kendoExtDropDownList").enable(true); //연료
            $("#drvMthCd").data("kendoExtDropDownList").enable(true); //구동방식
            $("#exchAmt").data("kendoExtNumericTextBox").enable(true); //치환가격
            $("#recomSaleAmt").data("kendoExtNumericTextBox").enable(true); //추천판매가격
            $("#retlDt").data("kendoExtMaskedDatePicker").enable(true); //소매일자
            $("#lastOwnerNm").prop("disabled", "").removeClass("form_disabled"); //최종소유자
            $("#noSaleYn").prop("disabled", "").removeClass("form_disabled"); //번호판여부
            $("#platNo").prop("disabled", "").removeClass("form_disabled"); //번호판번호
            $("#platAmt").data("kendoExtNumericTextBox").enable(true); //번호판가격
            $("#fceIncPrid").data("kendoExtMaskedDatePicker").enable(true); //교통사고강제보험 유효기간
            $("#carTaxPrid").data("kendoExtMaskedDatePicker").enable(true); //차배세유효기간
            $("#yyTestPrid").data("kendoExtMaskedDatePicker").enable(true); //년검사 유효기간
            $("#cmcIncPrid").data("kendoExtMaskedDatePicker").enable(true); //상업보험 유효기간
            $("#evalPrsnNmView").prop("disabled", "disabled").addClass("form_disabled"); //평가사
            $("#saleRgstEmp").data("kendoExtDropDownList").enable(true); //판매고문
            $("#lastOwnerTel").prop("disabled", "").removeClass("form_disabled"); //연계인전화번호
            //$("#auctInfoButton").hide();

            //평가정보
            $("#tabBtnMath").removeClass("disabled"); //본사/타사 구분버튼
            $("#btnSelf1").prop("disabled", "");
            $("#btnProxy1").prop("disabled", "");
            $("#evalPrsnNm").prop("disabled", "").removeClass("form_disabled"); //평가담당자
            $("#evalDt").data("kendoExtMaskedDatePicker").enable(true); //평가일자
            $("#evalRemark").prop("disabled", "").removeClass("form_disabled"); //평가의견
            $("#custHopeAmt").data("kendoExtNumericTextBox").enable(true); //고객희망가격
            $("#evalAmt").data("kendoExtNumericTextBox").enable(true); //평가가격
            $("#lastAmt").data("kendoExtNumericTextBox").enable(true); //최종판매가격
            $("#carRegAmt").data("kendoExtNumericTextBox").enable(true); //번호판평가가격
            //$("#auctInfoButton").show();
        }else {

            $("#purcCustSearch").addClass("form_search_disabled");
            $("#searchVinNo").addClass("form_search_disabled");
            $("#searchContractNo").addClass("form_search_disabled");


            $("#exchY").attr("disabled", "disabled");
            $("#exchN").attr("disabled", "disabled");

            $("#purcCustNm").prop("disabled", "disabled").addClass("form_disabled"); //고객명
            $("#btnCorpCarDstin").attr("disabled", "disabled");
            $("#telNo1").prop("disabled", "disabled").addClass("form_disabled"); //연락처
            $("#purcTotAmt").data("kendoExtNumericTextBox").enable(false); //매입총금액
            $("#resultType1").prop("disabled", "disabled").addClass("form_disabled"); //치환여부
            $("#resultType2").prop("disabled", "disabled").addClass("form_disabled"); //치환여부
            $("#carBrandCd").data("kendoExtDropDownList").enable(false); //제조사
            $("#tabBtnComp").addClass("disabled"); //본사/타사 구분버튼
            $("#evalAmtFr").data("kendoExtNumericTextBox").enable(false); //매입금액구간시작
            $("#evalAmtTo").data("kendoExtNumericTextBox").enable(false); //매입금액구간종료
            $("#carlineCd").data("kendoExtDropDownList").enable(false); //차종
            $("#carDispQty").data("kendoExtNumericTextBox").enable(false); //배기량
            $("#manufactYyMmDt").data("kendoExtMaskedDatePicker").enable(false); //제조년월
            $("#vehicleInspecDt").data("kendoExtMaskedDatePicker").enable(false); //차량검증일자
            $("#vinNo").prop("disabled", "disabled").addClass("form_disabled"); //VIN NO
            $("#pcDstinCd").data("kendoExtDropDownList").enable(false); //사용용도
            $("#carRunDistVal").data("kendoExtNumericTextBox").enable(false); //주행거리
            $("#fuelCd").data("kendoExtDropDownList").enable(false); //연료
            $("#drvMthCd").data("kendoExtDropDownList").enable(false); //구동방식
            $("#exchAmt").data("kendoExtNumericTextBox").enable(false); //치환가격
            $("#recomSaleAmt").data("kendoExtNumericTextBox").enable(false); //추천판매가격
            $("#retlDt").data("kendoExtMaskedDatePicker").enable(false); //소매일자
            $("#lastOwnerNm").prop("disabled", "disabled").addClass("form_disabled"); //최종소유자
            $("#noSaleYn").prop("disabled", "disabled").addClass("form_disabled"); //번호판여부
            $("#platNo").prop("disabled", "disabled").addClass("form_disabled"); //번호판번호
            $("#platAmt").data("kendoExtNumericTextBox").enable(false); //번호판가격
            $("#fceIncPrid").data("kendoExtMaskedDatePicker").enable(false); //교통사고강제보험 유효기간
            $("#carTaxPrid").data("kendoExtMaskedDatePicker").enable(false); //차배세유효기간
            $("#yyTestPrid").data("kendoExtMaskedDatePicker").enable(false); //년검사 유효기간
            $("#cmcIncPrid").data("kendoExtMaskedDatePicker").enable(false); //상업보험 유효기간
            $("#evalPrsnNmView").prop("disabled", "disabled").addClass("form_disabled"); //평가사
            $("#saleRgstEmp").data("kendoExtDropDownList").enable(false); //판매고문
            $("#lastOwnerTel").prop("disabled", "disabled").addClass("form_disabled"); //연계인전화번호

            //$("#auctInfoButton").hide();

            $("#tabBtnMath").addClass("disabled"); //본사/타사 구분버튼
            $("#btnSelf1").prop("disabled", "disabled")
            $("#btnProxy1").prop("disabled", "disabled")
            $("#evalPrsnNm").prop("disabled", "disabled").addClass("form_disabled"); //평가담당자
            $("#evalDt").data("kendoExtMaskedDatePicker").enable(false); //평가일자
            $("#evalRemark").prop("disabled", "disabled").addClass("form_disabled"); //평가의견
            $("#custHopeAmt").data("kendoExtNumericTextBox").enable(false); //고객희망가격
            $("#evalAmt").data("kendoExtNumericTextBox").enable(false); //평가가격
            $("#lastAmt").data("kendoExtNumericTextBox").enable(false); //최종판매가격
            $("#carRegAmt").data("kendoExtNumericTextBox").enable(false); //번호판평가가격
            //$("#auctInfoButton").hide();
        }

    };


    /**************************************** 버튼영역 END **********************************************************/

    // 탭
    selectTabId = "carInfo"; // 초기값:차량소유자
    $("#tabstrip").kendoExtTabStrip({
        animation : false,
        select : function(e) {
            selectTabId = e.item.id;
        }
    });


    fnOnChange = function(id, vl) {
        if (id == "sContractCustNm") {
            $("#sContractCustNo").val("");
        } else if (id == "purcCustNm") {
            $("#purcCustNo").val("");
        } else if (id == "vinNo") {
            $("#carlineCd").data("kendoExtDropDownList").value("");
            $("#modelCd").data("kendoExtDropDownList").value("");
            $("#extColorCd").data("kendoExtDropDownList").value("");
        }
    }

    // 고객명에서 ObKeyDown
    $(".onKey_down").keydown(function(e) {
        if (e.keyCode == 13) {
            if ($(this).val() != "") {
                if ($(this).attr("id") == 'sContractCustNm') {
                    sContractCustPopupWindow();
                } else if ($(this).attr("id") == 'purcCustNm') {
                    purcCustPopupWindow();
                } else if ($(this).attr("id") == 'vinNo') {
                    vehiclePopupWindow();
                }
            }
        }
    });

    //치환여부로 치환가격을 동기화한다
    /*
    $("#resultType1").change(function(e){
         if($("#resultType1").is(':checked')){
         var purcAmt = $("#purcAmt").val();
         $("#exchAmt").data("kendoExtNumericTextBox").value(purcAmt);
         }else{
         $("#exchAmt").data("kendoExtNumericTextBox").value(0);
         }
     }); */

    //치환여부로 치환가격을 동기화한다
    /*
    $("#purcAmt").keyup(function(e){
         if($("#resultType1").is(':checked')){
         $("#exchAmt").data("kendoExtNumericTextBox").value(this.value);
         }else{
         $("#exchAmt").data("kendoExtNumericTextBox").value(0);
         }
     }); */

    //추천판매가격과 최종가격을 동기화한다
    $("#recomSaleAmt").keyup(function(e) {
        $("#purcTotAmt").data("kendoExtNumericTextBox").value(this.value);
    });

    // 상세정보
    $("#btnViewDetail").kendoButton({

        click : function(e) {

            var grid = $("#grid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            if (dms.string.isNotEmpty(selectedItem)) {

                viewDetail(selectedItem);

            } else {

                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }

        },
        enable : false
    })

    // 고객생성 팝업
    openCreateCust = function() {

        custInfoRegPopup = dms.window.popup({
            windowId : "custInfoRegPopup",
            title : "<spring:message code='ser.lbl.custNew' />" //고객신규등록
            ,height : 390
            ,content : {
                url : "<c:url value='/sal/cmm/selectCustInfoCratePopup.do'/>",
                data : {
                    "vinNo" : "",
                    "carId" : "",
                    "isNew" : "new",
                    "preFixId" : "",
                    "callbackFunc" : function(data) {
                        getCustInfo(data);
                        custInfoRegPopup.close();
                    }//callback
                }
            }
        });
    }

    //고객명 event
    $("#vContractCustNm").blur(function(e) {
        cleanCustCheck();
    });

    // 고객명 enter event
    $("#vContractCustNm").keyup(function(e) {
        if (e.keyCode != 13) {
            cleanCustCheck();
        }
    });

    //고객명 변경시 고객정보 clean
    function cleanCustCheck() {
        if (dms.string.strNvl($("#vContractCustNm").val()) != dms.string.strNvl($("#sContractCustNm").val())) {
            $("#sContractCustNo").val('');
            $("#sContractCustNm").val('');
        }
    }

    //CRM 고객 조회
    bf_searchCustomer = function() {


        $.ajax({
            url:"<c:url value='/sal/svo/packageWork/selectPackageSalesWorkPopupContain.do' />",
            data:JSON.stringify(params),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function (detailData, textStatus){
                //detailSet(detailData.data[0]);

                if (detailData != null && detailData.total == 1) {
                    $("#sContractCustNo").val(detailData.data[0].custNo); // 고객코드
                    $("#sContractCustNm").val(detailData.data[0].custNm); // 고객명
                    $("#vContractCustNm").val(detailData.data[0].custNm); // 고객명
                } else {

                    popupWindow = dms.window.popup({
                        windowId : "customerSearchPopup",
                        title : "<spring:message code='global.title.custSearch' />" // 고객 조회
                        ,modal : true
                        //, draggable:false
                        ,content : {
                            url : "<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>",
                            data : {
                                "autoBind" : true,
                                "custNm" : $("#vContractCustNm").val(),
                                "type" : null,
                                "callbackFunc" : function(data) {
                                    if (data.length >= 1) {
                                        $("#sContractCustNo").val(data[0].custNo); // 고객코드
                                        $("#sContractCustNm").val(data[0].custNm); // 고객명
                                        $("#vContractCustNm").val(data[0].custNm); // 고객명
                                    }
                                    popupWindow.close();
                                }
                            }
                        }
                    });
                }

            }
        });

    };


  //그리드 설정
    $("#grid").kendoExtGrid({
        gridId : "G-SAL-2017-051918",
        dataSource : {
            transport : {
                read : {
                    url : "<c:url value='/sal/usc/purcEval/selectPurcMng.do' />"
                },
                parameterMap : function(
                        options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sPurcCustNo"] = $("#sContractCustNo").val(); // 매입고객번호
                        params["sPurcCustNm"] = $("#vContractCustNm").val(); // 매입고객이름

                        params["sVinNo"] = $("#sVinNo").val(); // VIN NO
                        params["sPurcRegStartDt"] = $("#sPurcRegStartDt").data('kendoExtMaskedDatePicker').value(); // 매입등록일자-시작일
                        params["sPurcRegEndDt"] = $("#sPurcRegEndDt").data('kendoExtMaskedDatePicker').value(); // 매입등록일자-종료일
                        params["sPlatNo"] = $("#sPlatNo").val(); // 차량등록번호
                        params["sCarlineCd"] = $("#sCarlineCd").val(); // 차종

                        return kendo.stringify(params);

                    } else if (operation !== "read"&& options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            },
            schema : {
                model : {
                    id : "purcNo",
                    fields : {
                        purcNo         : {type : "string"},
                        purcCustNm     : {type : "string"},
                        corpCarDstinCd : {type : "string"},
                        carBrandCd     : {type : "string"},
                        modelCd        : {type : "string"},
                        carDispQty     : {type : "string"},
                        ocnCd          : {type : "string"},
                        extColorNm     : {type : "string"},
                        intColorNm     : {type : "string"},
                        evalMthCd      : {type : "string"},
                        regDt          : {type : "date"},
                        evalDt         : {type : "date"},
                        evalAmtAll     : {type : "string"},
                        exchYn         : {type : "string"},
                        retlDt         : {type : "date"},
                        carlineNm      : {type : "string"},
                        platNo         : {type : "string"},
                        evalAmt        : {type : "number"},
                        purcAmt        : {type : "number"},
                        payTheDiff     : {type : "number"},
                        purcStatCd     : {type : "string"},
                        vinNo          : {type : "string"}
                    }
                }
            }
        },
        editable : false,
        change : function(e) {
            if (this.select().length != 0) {
                var selectedVal = this.dataItem(this.select());
                var purcNo = selectedVal.purcNo;

                if (dms.string.isNotEmpty(purcNo)) {
                    $("#btnViewDetail").data("kendoButton").enable(true);

                    if (selectedVal.purcStatCd == '01') {
                        $("#btnConfirm").data("kendoButton").enable(true);
                        $("#btnReject").data("kendoButton").enable(true);
                        $("#btnSave").data("kendoButton").enable(true);
                        //vehicleDisabled('N');
                        //evalDisabled('N');
                    } else if (selectedVal.purcStatCd == '02') {
                        $("#btnConfirm").data("kendoButton").enable(false);
                        $("#btnReject").data("kendoButton").enable(false);
                        $("#btnSave").data("kendoButton").enable(true);

                        //vehicleDisabled('N');
                        //evalDisabled('N');
                    } else if (selectedVal.purcStatCd == '03') {
                        $("#btnConfirm").data("kendoButton").enable(true);
                        $("#btnReject").data("kendoButton").enable(true);
                        $("#btnSave").data("kendoButton").enable(false);

                        //vehicleDisabled('Y');
                        //evalDisabled('Y');
                    } else {
                        $("#btnConfirm").data("kendoButton").enable(false);
                        $("#btnReject").data("kendoButton").enable(false);
                        $("#btnSave").data("kendoButton").enable(false);
                        //vehicleDisabled('Y');
                        //evalDisabled('Y');
                    }
                }
            }

        },
        dataBinding : function(e) {
            kendo.bind($("#viewModel"), {"purcDs" : [ {"purcNo" : ""} ]});
        }
        ,indvColumnVisible : true //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable : true //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip : true //Tooltip 적용, default:false
        ,columns : [
                 {field : "purcNo",title : "<spring:message code='sal.lbl.documentNo' />",width : 140,attributes : {"class" : "ac"}} //매입번호
                ,{field : "purcCustNm",title : "<spring:message code='par.lbl.custNm' />",width : 70,attributes : {"class" : "al"}} //고객명
                ,{field : "vinNo",title : "<spring:message code = 'global.lbl.vinNo'/>",width : 110,attributes : {"class" : "al"}} //VIN NO
                ,{field : "carBrandCd",title : "<spring:message code='sal.lbl.oldVhBrand' />",width : 80,attributes : {"class" : "ac"},//제조브랜드
                    template : "# if(carBrandCdMap[carBrandCd] != null) { # #= carBrandCdMap[carBrandCd].cmmCdNm# # }#"
                }
                ,{field : "carDispQty",title : "<spring:message code='global.lbl.carDispQty' />",width : 50,attributes : {"class" : "ar"}} //배기량
                ,{field : "carlineNm",title : "<spring:message code='global.lbl.carLine' />",width : 80,attributes : {"class" : "al"}} //차종
                ,{field : "modelNm",title : "<spring:message code='global.lbl.model' />",width : 120,attributes : {"class" : "al"}} //모델
                ,{field : "extColorNm",title : "<spring:message code='global.lbl.extColor' />",width : 80,attributes : {"class" : "al"}} //외장색
                ,{field : "platNo",title : "<spring:message code='global.lbl.carNo' />",width : 80,attributes : {"class" : "al"}} //차량번호
                ,{field : "evalAmt",title : "<spring:message code='sal.lbl.usrSbstAmt' />",width : 80,attributes : {"class" : "ar"},format : "{0:n2}"} //평가금액
                ,{field : "evalAmtAll",title : "<spring:message code='sal.lbl.purcAmt' />(万)",width : 80,attributes : {"class" : "ac"}} //매입가격
                ,{field : "payTheDiff",title : "<spring:message code='sal.lbl.payTheDifference' />",width : 80,attributes : {"class" : "ar"},format : "{0:n2}"} //차액
                ,{field : "regDt",title : "<spring:message code='global.lbl.carRegDt' />",width : 80,attributes : {"class" : "ac"}
                    ,format : "{0:<dms:configValue code='dateFormat' />}"
                } //등록일자
                ,{field : "evalDt",title : "<spring:message code='global.lbl.evalScheDt' />",width : 80,attributes : {"class" : "ac"},
                    format : "{0:<dms:configValue code='dateFormat' />}"
                } //평가일자
                ,{field : "exchYn",title : "<spring:message code='sal.lbl.uatcCarPurc' />",width : 50,attributes : {"class" : "ac"}} //치환여부
                ,{field : "purcStatCd",title : "<spring:message code='global.lbl.statNm' />",width : 70,attributes : {"class" : "ac"},
                    template : "# if(purcStatCdMap[purcStatCd] != null) { # #= purcStatCdMap[purcStatCd].cmmCdNm# # }#"
                } //상태
        ]
    });

  //상세팝업 - 고객조회
    purcCustPopupWindow = function() {

       //if($("#popupOpenYn").val() == 'Y') {
       if(!$($("#purcCustSearch")[0]).hasClass("form_search_disabled")){

            var custNm = $("#purcCustNm").val();

            popupWindow = dms.window.popup({
                windowId : "customerSearchPopupMain"
                ,title : "<spring:message code='global.title.custSearch' />" // 고객 조회
                ,height : "400px"
                ,width : "850px"
                ,content : {
                    url : "<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                   ,data : {
                        "autoBind" : false
                        ,"custNm" : custNm
                        ,"type" : null
                        ,"callBackTp" : "BTN_CREATE"
                        ,"callbackFunc" : function(data) {
                            if (data.length >= 1) {
                                if (dms.string.isNotEmpty(data[0].custNo)) {$("#purcCustNo").val(data[0].custNo);
                                    $("#purcCustNm").val(data[0].custNm);
                                    $("#telNo1").val(data[0].hpNo);
                                }
                                popupWindow.close();
                            }
                            if (data.callBackTp == "BTN_CREATE") {
                                openCreateCust();
                            }
                        }
                    }
                }
            });
        }
    }

    contractNoPopupWindow = function() {

        //if ($("#popupOpenYn").val() == 'Y') {
        if(!$($("#searchContractNo")[0]).hasClass("form_search_disabled")){

            popupWindow = dms.window.popup({
                windowId : "contractProgStsPopupWin" // 판매 - 계약조회
                ,title : "<spring:message code='sal.title.contractProg' />"
                ,height : "550px"
                ,width : "850px"
                ,content : {
                    url : "<c:url value='/sal/cmm/selectProgressStsPopup.do'/>"
                    ,data : {
                        "type" : null
                        ,"autoBind" : false
                        ,"callbackFunc" : function(data) {
                            if (data.length >= 1) {
                                if (dms.string.isNotEmpty(data[0].contractNo)) {
                                    if (Number(data[0].contractStatCd) <= 20) {
                                        $("#contractNo").val(data[0].contractNo);
                                    } else {
                                        dms.notification.info("<spring:message code='global.lbl.contractStat' var='globalLblContractStat' />"+
                                                               "<spring:message code='global.info.confirmMsgParam' arguments='${globalLblContractStat}' />");
                                    }
                                }

                                popupWindow.close();
                            }
                        }
                    }
                }
            });
        }
    }

    //상세팝업 - 차량조회
    vehiclePopupWindow = function() {

        //if ($("#popupOpenYn").val() == 'Y') {
        if(!$($("#searchVinNo")[0]).hasClass("form_search_disabled")){

            var dataInfo = {
                "vinNo" : $("#vinNo").val(),
                "carlineCd" : $("#carlineCd").val(),
                "carlineNm" : $("#carlineCd").data("kendoExtDropDownList").text(),
                "modelCd" : $("#modelCd").val(),
                "modelNm" : $("#modelCd").data("kendoExtDropDownList").text(),
                "extColorCd" : $("#extColorCd").val(),
                "extColorNm" : $("#extColorCd").data("kendoExtDropDownList").text(),
                "pageGubun" : "usedCar"
            }

            popupWindow = dms.window.popup({
                windowId : "vehicleMasterStsPopupWin" // 판매 - 차량마스터관리 조회 팝업
                ,title : "<spring:message code='global.title.vehicleMaster' />"
                ,height : "400px"
                ,width : "850px"
                ,draggable : false
                ,modal : true
                ,content : {
                    url : "<c:url value='/sal/cmm/selectVehicleMasterPopup.do'/>",
                    data : {
                        "type" : null
                        ,"autoBind" : true
                        ,"dataInfo" : dataInfo
                        ,"callbackFunc" : function(data) {
                            $("#vinNo").val(data[0].vinNo);

                            var carlineCd = $("#carlineCd").data("kendoExtDropDownList");

                            if (data[0].carlineCd != null
                                    && data[0].carlineCd != "") {
                                carlineCd.value(data[0].carlineCd); // 차종
                            }

                            var modelCd = $("#modelCd").data("kendoExtDropDownList");

                            if (data[0].modelCd != null
                                    && data[0].modelCd != "") {
                                modelCd.setDataSource([ {
                                    modelNm : data[0].modelCdNm,
                                    modelCd : data[0].modelCd
                                } ]);
                                modelCd.enable(true);
                                modelCd.value(data[0].modelCd); // 모델
                            } else {
                                $("#modelCd").data("kendoExtDropDownList").value("");
                            }

                            var extColorCd = $("#extColorCd").data("kendoExtDropDownList");

                            if (data[0].extColorCd != null
                                    && data[0].extColorCd != "") {
                                extColorCd.setDataSource([ {
                                    extColorNm : data[0].extColorCdNm,
                                    extColorCd : data[0].extColorCd
                                } ]);
                                extColorCd.enable(true);
                                extColorCd.value(data[0].extColorCd); // 외장색
                            } else {
                                $("#extColorCd").data("kendoExtDropDownList").value("");
                            }

                            if (data[0].modelCd != null
                                    && data[0].modelCd != "") {
                                modelCd.enable(false);
                            }
                            if (data[0].extColorCd != null
                                    && data[0].extColorCd != "") {
                                extColorCd.enable(false);
                            }
                        }
                    }
                }
            });
        }
    }

    //차량이미지 평가용
    selectEvCarPopupWindowSub = function() {
        popupEvCarWindow = dms.window.popup({
            windowId : "popupEvCarWindow"
            ,title : "<spring:message code = 'sal.lbl.vehicleEvalPic'/>" // 평가용 차량이미지
            ,draggable : true
            ,modal : true
            ,height : 600
            ,width : 1300
            ,content : {
                url : "<c:url value='/sal/usc/purcEval/selectEvalCarImage.do'/>",
                data : {
                    "dlrCd" : $("#dlrCd").val(),
                    "purcNo" : $("#purcNo").val(),
                    "callbackFunc" : function(data) {

                    }
                }
            }
        });
    }



    //차량이미지 평가용
    selectEvCarPopupWindow = function() {

        popupEvCarWindow = dms.window.popup({
             windowId:"popupEvCarWindow"
            ,title:"<spring:message code = 'sal.lbl.vehicleEvalPic'/>" // 평가용 차량이미지
            ,draggable:true
            ,modal:true
            ,height:600
            ,width:1300
            ,content : {
                url : "<c:url value='/sal/usc/purcEval/selectEvalCarImage.do'/>",
                data : {
                     "dlrCd" : $("#dlrCd").val()
                    ,"purcNo" : $("#purcNo").val()
                    ,"purcStatCd" : $("#purcStatCd").data("kendoExtDropDownList").value()
                    ,"callbackFunc" : function(data) {

                    }
                }
            }
        });
    }


    //검색조건 - 고객조회
    sContractCustPopupWindow = function () {
        var custNm = $("#sContractCustNm").val();

        popupWindow = dms.window.popup({

            windowId : "customerSearchPopupMain"
            ,title : "<spring:message code='global.title.custSearch' />" // 고객 조회
            ,content : {
                 url : "<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                ,data : {
                     "autoBind" : false
                    ,"custNm" : custNm
                    ,"type" : null
                    ,"callbackFunc" : function(data) {
                        if (data.length >= 1) {
                            if (dms.string.isNotEmpty(data[0].custNo)) {
                                $("#sContractCustNo").val(data[0].custNo);
                                $("#sContractCustNm").val(data[0].custNm);
                            }
                            popupWindow.close();

                        }
                    }
                }
            }
        });
    }

    funChkReqType = function(id) {
        if ($("#" + id).is(":checked") == false) {
            $("#" + id).prop("checked", false);
        } else {
            if (id == 'resultType1') {
                $("#resultType2").prop("checked", false);
            } else {
                $("#resultType1").prop("checked", false);
            }
        }
    }

});

</script>
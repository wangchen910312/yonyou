<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%-- var permBtnReset = "disabled";
<dms:access viewId="VIEW-000476-01" hasPermission="WRITE" var="permBtnReset">
permBtnReset = "enabled";
</dms:access> --%>


<!-- 중고차매입관리 -->
<div id="resizableContainer">
<section  class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.title.usedCarBuy" /></h1><!-- 중고차매입관리 -->
        <div class="btn_right">
            <button class="btn_m " id="btnViewDetail" ><spring:message code='global.btn.detail' /><!-- 상세 --></button>
            <button class="btn_m " id="btnSamplePrint">打印样式(收购合同书)</button><!-- 양식출력(매입계약서) -->
            <button class="btn_m " id="btnFinishEval"><spring:message code="sal.lbl.evalFinish" /></button><!-- 평가완료 -->

            <button class="btn_m " id="btnConfirm"><spring:message code="sal.btn.purcConfirm" /></button><!-- 성공 -->
            <button class="btn_m " id="btnReject"><spring:message code="global.btn.reject" /></button><!-- 거절 -->
            <button class="btn_m btn_new" id="btnReset"><spring:message code="global.btn.new" /></button><!-- 신규 -->
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->


    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:20%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.documentNo' /></th><!-- 매입번호 -->
                    <td>
                        <input id="sPurcNo" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.custNm" /></th> <!-- 고객명 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="sContractCustNm" name="sContractCustNm" type="text" class="form_input onKey_down" placeholder="<spring:message code='par.lbl.custNm' />" onchange="fnOnChange(this.id,this.value);" maxlength="30" />
                                    <a href="#;" onclick="javascript:sContractCustPopupWindow();" id="sContractCustSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sContractCustNo" type="text" readonly class="form_input form_readonly">
                            </div>
                       </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.vinNum' /></th><!-- VIN NO -->
                    <td>
                        <input id="sVinNo" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carRegDt' /></th><!-- 등록일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sPurcRegStartDt" type="text" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sPurcRegEndDt" type="text" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->


    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->




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
                <button class="btn_s " id="btnRequestEval"><spring:message code="sal.btn.requestEval" /></button><!-- 평가요청 -->
                <button class="btn_s " id="btnVehicleEvalImage"><spring:message code="sal.btn.vehicleEvalImage" /></button><!-- 차량이미지 평가용 -->
                <button class="btn_s " id="btnOtherSave"><spring:message code="sal.btn.infoCopyOtherSave" /></button><!-- 정보복사 신규생성 -->
                <!-- <button class="btn_s " id="btnCustSearch">客户查询</button> --><!-- 고객조회 -->
                <!-- <button class="btn_s " id="btnVehicleSearch">车辆住信息</button> --><!-- 차량마스터조회 -->
                <button class="btn_s btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
            </span>



            <div class="viewPurcEval">
            <form id="detailPurcForm" name="detailPurcForm" method="POST" action="/">
                <div class="table_form" >
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:9%;">
                            <col style="width:21%;">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr><input id="popupOpenYn" name="popupOpenYn" type="hidden" value="N" />
                                <th scope="row"><spring:message code='sal.lbl.documentNo' /><!-- 매입번호 --></th>
                                <td>
                                    <input id="dlrCd" name="dlrCd" type="hidden"  data-bind="value:dlrCd" data-json-obj="true">
                                    <input id="purcNo" name="purcNo" type="text" class="form_input form_readonly" readonly data-bind="value:purcNo" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.carRegDt' /><!-- 등록일자 --></th>
                                <td>
                                    <input id="purcRegDt" name="purcRegDt" type="text" disabled class="form_datepicker form_disabled" data-bind="value:purcRegDt" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.prsNm' /></th><!-- 담당자 -->
                                <td>
                                    <input id="regUsrNm" class="form_input form_readonly" readonly data-bind="value:regUsrNm"  >
                                </td>
                                <th scope="row"><spring:message code='global.lbl.statNm' /><!-- 상태 --></th>
                                <td>
                                    <input id="purcStatCd" class="form_comboBox form_disabled" disabled  data-bind="value:purcStatCd">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.custNm" /></span></th> <!-- 고객명 -->
                                <td>
                                    <div class="form_float">
                                        <div class="form_left">
                                            <div class="form_search" id="purcCustSearch">
                                                <input id="purcCustNm" name="purcCustNm" type="text" class="form_input onKey_down" data-bind="value:purcCustNm" placeholder="<spring:message code='par.lbl.custNm' />" onchange="fnOnChange(this.id,this.value);" maxlength="30" />
                                                <a href="#;" onclick="javascript:purcCustPopupWindow();" ><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                            </div>
                                        </div>
                                        <div class="form_right">
                                            <input id="purcCustNo" name="purcCustNo" type="text" readonly class="form_input form_readonly" data-bind="value:purcCustNo" data-json-obj="true">
                                        </div>
                                   </div>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.uatcCarPurc' /><!-- 치환여부 --></th>
                                <td >
                                    <label class="label_check ml5"><input id="exchYn" name="exchYn" type="checkbox" class="form_check"  data-bind="value:exchYn" data-json-obj="true"/></label>
                                    <!-- 신차계약번호 --><!-- <input id="contractNo" name="contractNo" class="form_comboBox" style="width:120px;" data-bind="value:contractNo" data-json-obj="true"> -->
                                    <button id="btnDetailList" type="button" class="btn_xs"><spring:message code='sal.btn.detailList' /><!-- 명세서 --></button>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.telNumber' /><!-- 연락처 --></th>
                                <td>
                                    <input id="telNo1" name="telNo1" type="text" class="form_input" data-bind="value:telNo1" data-json-obj="true">
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.purcTotAmt' /></span></th><!-- 매입총금액 -->
                                <td>
                                    <input id="purcTotAmt" name="purcTotAmt" type="number" min="0" max="" class="form_numeric ar" data-bind="value:purcTotAmt" data-json-obj="true">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='ser.title.carInfo' /><!-- 차량정보 --></h2>
                </div>

                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:9%;">
                            <col style="width:21%;">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.vinNo" /></th><!-- VIN NO -->
                                <td class="required_area">
                                    <div class="form_search" id="searchVinNo">
                                        <input id="vinNo" name="vinNo" type="text" class="form_input onKey_down" placeholder="<spring:message code='global.lbl.vinNum' />" onchange="fnOnChange(this.id,this.value);" data-bind="value:vinNo" data-json-obj="true" >
                                        <a href="javascript:;" onclick="javascript:vehiclePopupWindow();"><spring:message code='global.lbl.search' /></a><!-- 검색 -->
                                    </div>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.carLine' /><!-- 차종 --></th>
                                <td>
                                    <input id="carlineCd" name="carlineCd" class="form_comboBox" data-bind="value:carlineCd" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.model' /><!-- 모델 --></th>
                                <td>
                                    <input id="modelCd" name="modelCd" class="form_comboBox" data-bind="value:modelCd" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.ocn' /><!-- OCN --></th>
                                <td>
                                    <input id="ocnCd" name="ocnCd" class="form_comboBox" data-bind="value:ocnCd" data-json-obj="true">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.extColor' /><!-- 외장색 --></th>
                                <td>
                                    <input id="extColorCd" name="extColorCd" class="form_comboBox" data-bind="value:extColorCd" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.intColor' /><!-- 내장색 --></th>
                                <td>
                                    <input id="intColorCd" name="intColorCd" class="form_comboBox" data-bind="value:intColorCd" data-json-obj="true">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.runDist' /><!-- 마일리지(주행거리) --></th>
                                <td>
                                    <input id="carRunDistVal" name="carRunDistVal" type="number" min="0" max="" class="form_numeric ar" data-bind="value:carRunDistVal" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.fuelType' /><!-- 연료구분 --></th>
                                <td>
                                    <input id="fuelCd" name="fuelCd" class="form_comboBox" data-bind="value:fuelCd" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.carDrvMth' /><!-- 구동방식 --></th>
                                <td>
                                    <input  id="drvMthCd" name="drvMthCd" class="form_comboBox" data-bind="value:drvMthCd" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.carDispQty' /><!-- CC --></th>
                                <td>
                                    <input id="carDispQty" name="carDispQty" type="number" min="0" max="" class="form_numeric ar" data-bind="value:carDispQty" data-json-obj="true">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.factory' /><!-- 제조사 --> </th>
                                <td>
                                   <div class="form_float" >
                                        <div class="form_left" style="width:38%">
                                            <input id="carBrandCd" name="carBrandCd" class="form_comboBox" data-bind="value:carBrandCd" data-json-obj="true">
                                        </div>
                                        <div class="form_right" style="width:62%" >
                                            <ul class="tabmenu" id="tabBtnComp" ><input id="corpCarDstinCd" name="corpCarDstinCd" type="hidden" data-bind="value:corpCarDstinCd" data-json-obj="true" />
                                                <li id="btnThis" class="on"><button type="button" onclick="btnClick('01');" id="btnThis1"><spring:message code='sal.lbl.thisCompany' /></button></li><!-- 본사 -->
                                                <li id="btnOther" ><button type="button" onclick="btnClick('02');"  id="btnOther1" ><spring:message code='sal.lbl.otherCompany' /></button></li><!-- 기타회사 -->
                                            </ul>
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.purposeOfUse" /><!-- 사용용도 --></th>
                                <td>
                                    <input id="pcDstinCd" name="pcDstinCd" class="form_comboBox" data-bind="value:pcDstinCd" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.madeYyMm' /><!-- 제조년월 --></th>
                                <td>
                                    <input id="manufactYyMmDt" name="manufactYyMmDt" type="text" class="form_datepicker" data-bind="value:manufactYyMmDt" data-json-obj="true">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.purcAmt' /></span></th><!-- 매입가격 -->
                                <td>
                                    <input id="purcAmt" name="purcAmt" type="number" min="0" max=""  class="form_numeric ar" data-bind="value:purcAmt" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.exchAmt' /><!-- 치환가격 --></th>
                                <td>
                                    <input id="exchAmt" name="exchAmt" type="number" min="0" max=""  class="form_numeric ar" data-bind="value:exchAmt" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.recomSaleAmt' /><!-- 추천판매가격 --></th>
                                <td>
                                    <input id="recomSaleAmt" name="recomSaleAmt" type="number" min="0" max="" class="form_numeric ar" data-bind="value:recomSaleAmt" data-json-obj="true">
                                </td>
                            <tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.retlDt' /><!-- 소매일자 --></th>
                                <td>
                                    <input id="retlDt" name="retlDt" type="text" class="form_datepicker" data-bind="value:retlDt" data-json-obj="true">
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.lastOwnerNm" /></span></th><!-- 최종소유자 -->
                                <td>
                                    <input id="lastOwnerNm" name="lastOwnerNm" class="form_input" data-bind="value:lastOwnerNm" data-json-obj="true">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_form mt10">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:9%;">
                            <col style="width:21%;">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.noSaleYn' /><!-- 번호판여부 --></th>
                                <td>
                                    <label class="label_check ml5"><input id="noSaleYn" name="noSaleYn" type="checkbox" class="form_check" data-bind="value:noSaleYn" data-json-obj="true"/></label>
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.carRegNo' /><!-- 번호판번호 --></th>
                                <td>
                                    <input id="platNo" name="platNo" type="text" class="form_input" data-bind="value:platNo" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.carRegAmt' /><!-- 번호판가격 --></th>
                                <td>
                                    <input id="platAmt" name="platAmt" type="number" min="0" max="" class="form_numeric ar" data-bind="value:platAmt" data-json-obj="true">
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_form mt10">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:20%;">
                            <col style="width:10%;">
                            <col style="width:14%;">
                            <col style="width:10%;">
                            <col style="width:14%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.fceIncPrid' /><!-- 교통사고강제보험 유효기간 --></span></th>
                                <td>
                                    <input id="fceIncPrid" name="fceIncPrid" type="text" class="form_datepicker form_required" data-bind="value:fceIncPrid" data-json-obj="true">
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.carTaxPrid' /><!-- 차배세유효기간 --></span></th>
                                <td>
                                    <input id="carTaxPrid" name="carTaxPrid" type="text" class="form_datepicker form_required" data-bind="value:carTaxPrid" data-json-obj="true">
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.yyTestPrid' /><!-- 년검사 유효기간 --></span></th>
                                <td>
                                    <input id="yyTestPrid" name="yyTestPrid" type="text" class="form_datepicker form_required" data-bind="value:yyTestPrid" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.cmcIncPrid' /><!-- 상업보험 유효기간 --></th>
                                <td>
                                    <input id="cmcIncPrid" name="cmcIncPrid" type="text" class="form_datepicker" data-bind="value:cmcIncPrid" data-json-obj="true">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                </form>
            </div>

            <div class="viewPurcEval">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='sal.lbl.evaluationInfo' /><!-- 평가정보 --></h2>
                </div>
                <form id="detailEvalForm" name="detailEvalForm" method="POST" action="/">
                <div class="table_form">
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
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.evaluationWay' /><!-- 평가방법 --></th>
                                <td id="btnEvalMth">
                                    <ul class="tabmenu disabled" id="tabBtnMath" ><input type="hidden" id="evalMthCd" name="evalMthCd" data-bind="value:evalMthCd" data-json-obj="true" />
                                        <li id="btnSelf" class="on" ><button type="button" onclick="fnPurcWayClick('A');" id="btnSelf1" disabled><spring:message code='global.lbl.ourCompany' /></button></li><!-- 본인 -->
                                        <li id="btnProxy" ><button type="button" onclick="fnPurcWayClick('M');" id="btnProxy1" disabled><spring:message code='global.lbl.execution' /></button></li><!-- 대행 -->
                                    </ul>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.evaluationPerson' /><!-- 평가담당자 --></th>
                                <td>
                                    <input id="evalPrsnNm" name="evalPrsnNm" type="text" class="form_input form_disabled" disabled data-bind="value:evalPrsnNm" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.evalScheDt' /><!-- 평가일자 --></th>
                                <td>
                                    <input id="evalDt" name="evalDt" class="form_datepicker"  data-bind="value:evalDt" data-json-obj="true">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.evaluationRemark' /><!-- 평가의견 --></th>
                                <td colspan="5">
                                    <input id="evalRemark" name="evalRemark" type="text" class="form_input form_disabled" disabled data-bind="value:evalRemark" data-json-obj="true">
                                </td>
                                <%-- <th scope="row"><spring:message code='global.lbl.vinSts' /><!-- 차량상태 --></th>
                                <td>
                                    <input id="carStatCd" name="carStatCd" class="form_comboBox"  data-bind="value:carStatCd" data-json-obj="true">
                                </td> --%>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.custHopeAmt' /><!-- 고객희망가격 --></th>
                                <td>
                                    <input id="custHopeAmt" name="custHopeAmt" type="number" min="0" max=""  class="form_numeric ar"  data-bind="value:custHopeAmt" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='sal.evalPersonAmt' /><!-- 평가가격 --></th>
                                <td>
                                    <input id="evalAmt" name="evalAmt" type="number" min="0" max=""  class="form_numeric ar"  data-bind="value:evalAmt" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.lastAmt' /><!-- 최종판매가격 --></th>
                                <td>
                                    <input id="lastAmt" name="lastAmt" type="number" min="0" max=""  class="form_numeric ar"  data-bind="value:lastAmt" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.carRegEvalAmt' /><!-- 번호판평가가격 --></th>
                                <td>
                                    <input id="carRegAmt" name="carRegAmt" type="number" min="0" max=""  class="form_numeric ar"  data-bind="value:carRegAmt" data-json-obj="true">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                </form>



                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='sal.lbl.auctInfo' /></h2><!-- 경매정보 -->
                    <div class="btn_right" style="display:none;" id="auctInfoButton" >
                        <button class="btn_s btn_save" id="btnAuctSave"><spring:message code='global.btn.save' /></button><!-- 저장 -->
                        <button class="btn_s btn_add" id="btnAuctAdd"><spring:message code='global.btn.rowAdd' /></button><!-- 행추가 -->
                        <button class="btn_s btn_delete" id="btnAutcDel"><spring:message code='global.btn.rowDel' /></button><!-- 행삭제 -->
                        <button class="btn_s btn_cancel" id="btnAutcCancel"><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
                    </div>
                </div>
                <!-- 그리드 시작 -->
                <div class="table_grid mt10">
                    <div id="auctGrid"></div>
                </div>
                <!-- 그리드 종료 -->
            </div>

        </div>

    </section>
</form>
</section>
<!-- //수선시스템 - 차량정보 -->
</div>


<!-- script -->
<script type="text/javascript">
var dlrCd = "${dlrCd}";     // 딜러
var usrId = "${usrId}";     // 신청인코드
var usrNm = "${usrNm}";     // 신청인명
var toDay = "${toDay}";
var purcStatCd = "";
var popupWindow;


//차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>


//중고차매입상태 Array
var purcStatCdDs = [];
<c:forEach var="obj" items="${purcStatCdList}">
    purcStatCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//중고차매입상태 Map
var purcStatCdMap = dms.data.arrayToMap(purcStatCdDs, function(obj){ return obj.cmmCd; });


//사용용도(승/상용구분) Array
var pcDstinCdDs = [];
<c:forEach var="obj" items="${pcDstinCdList}">
    pcDstinCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//사용용도(승/상용구분) Map
var pcDstinCdMap = dms.data.arrayToMap(pcDstinCdDs, function(obj){ return obj.cmmCd; });


//연료구분 Array
var fuelCdDs = [];
<c:forEach var="obj" items="${fuelCdList}">
    fuelCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//연료구분 Map
var fuelCdMap = dms.data.arrayToMap(fuelCdDs, function(obj){ return obj.cmmCd; });


//구동방식 Array
var drvMthCdDs = [];
<c:forEach var="obj" items="${drvMthCdList}">
    drvMthCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//구동방식 Map
var drvMthCdMap = dms.data.arrayToMap(drvMthCdDs, function(obj){ return obj.cmmCd; });


//차량상태코드 Array
var carStatCdDs = [];
<c:forEach var="obj" items="${carStatCdList}">
    carStatCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//차량상태코드 Map
var carStatCdMap = dms.data.arrayToMap(carStatCdDs, function(obj){ return obj.cmmCd; });


//경매구분 Array
var auctCdDs = [];
<c:forEach var="obj" items="${auctCdList}">
    auctCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//중고차매입상태 Map
var auctCdMap = dms.data.arrayToMap(auctCdDs, function(obj){ return obj.cmmCd; });


//차량인도여부 Array
var carDlYnDs = [];
<c:forEach var="obj" items="${carDlYnList}">
    carDlYnDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//차량인도여부 Map
var carDlYnMap = dms.data.arrayToMap(carDlYnDs, function(obj){ return obj.cmmCd; });


//브랜드 COM019
var carBrandCdDs = [];
<c:forEach var="obj" items="${carBrandCdList}">
    carBrandCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var carBrandCdMap = dms.data.arrayToMap(carBrandCdDs, function(obj){ return obj.cmmCd; });


//본사,타사구분
var corpCarDstinCdDs = [{"cmmCd":"01","cmmCdNm":"<spring:message code='sal.lbl.thisCompany' />"},{"cmmCd":"02","cmmCdNm":"<spring:message code='sal.lbl.otherCompany' />"}];
var corpCarDstinCdMap = dms.data.arrayToMap(corpCarDstinCdDs, function(obj){ return obj.cmmCd; });

$(document).ready(function() {

    /*
     * max 500으로 지정. 여백이 있는경우는 줄여야함
     */

     $("#purcMngWindow").kendoWindow({
         animation:false
         ,draggable:false
         ,modal:true
         ,resizable:false
         ,visible:false
         ,title:"<spring:message code='sal.lbl.detailSearch' />"      // 상세정보
         ,width:"950px"
         ,height:"500px"
     }).data("kendoWindow");


    //등록일자 - 시작일
    var sStartDtPicker = $("#sPurcRegStartDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:function(){
            sEndDtPicker.min(kendo.parseDate(this.value(), "{0:<dms:configValue code='dateFormat' />}"));
        }
    }).data("kendoExtMaskedDatePicker");


    //등록일자 - 종료일
    var sEndDtPicker = $("#sPurcRegEndDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:function(){
            if(dms.string.isEmpty($("#sPurcRegStartDt").data("kendoDatePicker").value())){
                dms.notification.warning("<spring:message code='global.info.fromDate.input' />");
                this.value("");
                return;
            }else{
                sStartDtPicker.max(kendo.parseDate(this.value(), "{0:<dms:configValue code='dateFormat' />}"));
            }
        }
    }).data("kendoExtMaskedDatePicker");



    /**************************************** 검색조건 END **********************************************************/

    //차종
    $("#carlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#modelCd").data("kendoExtDropDownList").setDataSource([]);
           $("#modelCd").data("kendoExtDropDownList").enable(true);

           $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
           $("#ocnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

           $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#extColorCd").data("kendoExtDropDownList").enable(false);

           $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#intColorCd").data("kendoExtDropDownList").enable(false);

           $("#vinNo").val("");

           if(dataItem.carlineCd == ""){
               $("#modelCd").data("kendoExtDropDownList").setDataSource([]);
               $("#modelCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectModel.do' />"
               ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#modelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

       }
    });

    // 모델
    $("#modelCd").kendoExtDropDownList({
        dataTextField:"modelNm"
       ,dataValueField:"modelCd"
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#ocnCd").data("kendoExtDropDownList").enable(true);

           $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#extColorCd").data("kendoExtDropDownList").enable(false);

           $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#intColorCd").data("kendoExtDropDownList").enable(false);

           $("#vinNo").val("");

           if(dataItem.modelCd == ""){
               $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
               $("#ocnCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectOcn.do' />"
               ,data:JSON.stringify({"carlineCd":$("#carlineCd").val(), "modelCd":dataItem.modelCd})
               ,async:false
           });
           $("#ocnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#modelCd").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#ocnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#extColorCd").data("kendoExtDropDownList").enable(true);

            $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#intColorCd").data("kendoExtDropDownList").enable(false);

            $("#vinNo").val("");

            if(this.dataItem(e.item).ocnCd == ""){
                $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#extColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectExtColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#modelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#extColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#ocnCd").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#extColorCd").kendoExtDropDownList({
         dataTextField: "extColorNm"
        ,dataValueField:"extColorCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){

            $("#vinNo").val("");

            if(this.dataItem(e.item).extColorCd == ""){
                $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#intColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#intColorCd").data("kendoExtDropDownList").enable(true);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectIntColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#modelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#intColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#extColorCd").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#intColorCd").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,optionLabel:" "   // 전체
    });
    $("#intColorCd").data("kendoExtDropDownList").enable(false);


    //중고차매입상태
    $("#purcStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:purcStatCdDs
        ,optionLabel:" "  // 전체
    });

    //사용용도(승/상용구분)
    $("#pcDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:pcDstinCdDs
        ,optionLabel:" "  // 전체
    });

    //연료구분
    $("#fuelCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:fuelCdDs
        ,optionLabel:" "  // 전체
    });

    //구동방식
    $("#drvMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:drvMthCdDs
        ,optionLabel:" "  // 전체
    });

    //차량상태
/*     $("#carStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carStatCdDs
        ,optionLabel:" "  // 전체
    }); */


    //신차계약번호
/*     $("#contractNo").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:""
        ,optionLabel:" "  // 전체
    }); */


    //제조사
    $("#carBrandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carBrandCdDs
        ,optionLabel:" "  // 전체
    });



    /***** 매입총금액 *****/
    $("#purcTotAmt").kendoExtNumericTextBox({                    // 구매가격
        format:"n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });


    /***** 배기량 *****/
    $("#carDispQty").kendoExtNumericTextBox({                    // 구매가격
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });


    /***** 주행거리 *****/
    $("#carDispQty").kendoExtNumericTextBox({                    // 구매가격
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });


    /***** 매입가 *****/
    $("#purcAmt").kendoExtNumericTextBox({                    // 구매가격
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });



    /***** 치환가 *****/
    $("#exchAmt").kendoExtNumericTextBox({                    // 구매가격
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });



    /***** 추천판매가 *****/
    $("#pecomSaleAmt").kendoExtNumericTextBox({                    // 구매가격
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });


    /***** 번호판가격 *****/
    $("#platAmt").kendoExtNumericTextBox({                    // 구매가격
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    /***** 고객희망가격 *****/
    $("#custHopeAmt").kendoExtNumericTextBox({                    // 구매가격
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
       ,enable:false
    });

    /***** 평가가격 *****/
    $("#evalAmt").kendoExtNumericTextBox({                    // 구매가격
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
       ,enable:false
    });


    /***** 최종판매가격 *****/
    $("#lastAmt").kendoExtNumericTextBox({                    // 구매가격
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
       ,enable:false
    });


    /***** 번호판평가가격 *****/
    $("#carRegAmt").kendoExtNumericTextBox({                    // 구매가격
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
       ,enable:false
    });


    /***** 추천판매가격 *****/
    $("#recomSaleAmt").kendoExtNumericTextBox({                    // 구매가격
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });


    /***** 마일리지(주행거리) *****/
    $("#carRunDistVal").kendoExtNumericTextBox({                    // 구매가격
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });


    //평가일자
    $("#evalDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,enable:false
    });


    //등록일자
    $("#purcRegDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:toDay
    });


    //제작년월
    $("#manufactYyMmDt").kendoExtMaskedDatePicker({
         start:"year"
        ,depth:"year"
        ,format:"yyyy-MM"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });


    //교통사고강제보험 유효기간
    $("#fceIncPrid").kendoExtMaskedDatePicker({
         start:"year"
        ,depth:"year"
        ,format:"yyyy-MM"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });


    //차배세유효기간
    $("#carTaxPrid").kendoExtMaskedDatePicker({
         start:"year"
        ,depth:"year"
        ,format:"yyyy-MM"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //년검사 유효기간
    $("#yyTestPrid").kendoExtMaskedDatePicker({
         start:"year"
        ,depth:"year"
        ,format:"yyyy-MM"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //상업보험 유효기간
    $("#cmcIncPrid").kendoExtMaskedDatePicker({
         start:"year"
        ,depth:"year"
        ,format:"yyyy-MM"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });


    //소매일자
    $("#retlDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });


    /**************************************** 상세내역 END **********************************************************/

    // 상세정보
    $("#btnViewDetail").kendoButton({
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            if ( dms.string.isNotEmpty(selectedItem) ){

                viewDetail(selectedItem);

            } else {

                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
        , enable:false
    })



    /*****************************************************************************
     ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
     *******************************************************************************/
     // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
     $("#grid").on("dblclick", "tr.k-state-selected", function (e) {

         var gridId = e.delegateTarget.id
           , grid = $("#"+gridId+"").data("kendoExtGrid")
           , selectedItem = grid.dataItem(grid.select())
         ;

         if ( dms.string.isNotEmpty(selectedItem) ){

             viewDetail(selectedItem);

         } else {

             // {상세정보}을(를) 확인하여 주세요.
             dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
             return;
         }



     });


    // 상세조회 후 팝업오픈
    function viewDetail(selectedVal){

        if( dms.string.isNotEmpty(selectedVal) ){
            // 팝업오픈;
            viewPopup();

            var purcStatCd = selectedVal.purcStatCd;

            if(purcStatCd == '01'){
                $("#popupOpenYn").val("Y");
                $("#purcCustSearch").removeClass("form_search_disabled");
                $("#searchVinNo").removeClass("form_search_disabled");
            }else {
                $("#popupOpenYn").val("N");
                $("#purcCustSearch").addClass("form_search_disabled");
                $("#searchVinNo").addClass("form_search_disabled");
            }


            $.ajax({
                url:"<c:url value='/sal/usc/purcEval/selectPurcEval.do' />",
                data:JSON.stringify({sPurcNo:selectedVal.purcNo}),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }

            }).done(function(result) {

                var purcEvalDs = result["purcEvalDs"];
                kendo.bind($(".viewPurcEval"), purcEvalDs);



                //신청차량정보 세팅
                if(selectedVal.carlineCd != null &&  selectedVal.carlineCd != ""){
                    $("#carlineCd").data("kendoExtDropDownList").value(selectedVal.carlineCd); // 차종
                }

                if(selectedVal.modelCd != null &&  selectedVal.modelCd != ""){
                    var modelCd = $("#modelCd").data("kendoExtDropDownList");
                    modelCd.setDataSource([{modelNm:selectedVal.modelNm, modelCd:selectedVal.modelCd}]);
                    modelCd.enable(true);
                    modelCd.value(selectedVal.modelCd); // 모델
                }else {
                    $("#modelCd").data("kendoExtDropDownList").value("");
                }

                if(selectedVal.ocnCd != null &&  selectedVal.ocnCd != ""){
                    var ocnCd = $("#ocnCd").data("kendoExtDropDownList");
                    ocnCd.setDataSource([{ocnNm:selectedVal.ocnNm, ocnCd:selectedVal.ocnCd}]);
                    ocnCd.enable(true);
                    ocnCd.value(selectedVal.ocnCd); // OCN
                }else {
                    $("#ocnCd").data("kendoExtDropDownList").value("");
                }

                if(selectedVal.extColorCd != null &&  selectedVal.extColorCd != ""){
                    var extColorCd = $("#extColorCd").data("kendoExtDropDownList");
                    extColorCd.setDataSource([{extColorNm:selectedVal.extColorNm, extColorCd:selectedVal.extColorCd}]);
                    extColorCd.enable(true);
                    extColorCd.value(selectedVal.extColorCd); // 외장색
                }else {
                    $("#extColorCd").data("kendoExtDropDownList").value("");
                }

                if(selectedVal.intColorCd != null &&  selectedVal.intColorCd != ""){
                    var intColorCd = $("#intColorCd").data("kendoExtDropDownList");
                    intColorCd.setDataSource([{intColorNm:selectedVal.intColorNm, intColorCd:selectedVal.intColorCd}]);
                    intColorCd.enable(true);
                    intColorCd.value(selectedVal.intColorCd); // 내장색
                }else {
                    $("#intColorCd").data("kendoExtDropDownList").value("");
                }


                //모델,ocn,외장색,내장색 다시 disabled 해준다.
                if(selectedVal.modelCd != null &&  selectedVal.modelCd != ""){ modelCd.enable(false); }
                if(selectedVal.ocnCd != null &&  selectedVal.ocnCd != ""){ocnCd.enable(false);}
                if(selectedVal.extColorCd != null &&  selectedVal.extColorCd != ""){extColorCd.enable(false);}
                if(selectedVal.intColorCd != null &&  selectedVal.intColorCd != ""){intColorCd.enable(false);}

                if (selectedVal.exchYn == 'Y'){
                    $("#exchYn").prop("checked", true)
                }else {
                    $("#exchYn").prop("checked", false)
                };
                if (selectedVal.noSaleYn == 'Y'){
                    $("#noSaleYn").prop("checked", true)
                }else {
                    $("#noSaleYn").prop("checked", false)
                };

                $("#manufactYyMmDt").val(selectedVal.manufactYyMmDt);
                $("#fceIncPrid").val(selectedVal.fceIncPrid);
                $("#carTaxPrid").val(selectedVal.carTaxPrid);
                $("#yyTestPrid").val(selectedVal.yyTestPrid);
                $("#cmcIncPrid").val(selectedVal.cmcIncPrid);

                //자사차량구분
                if(selectedVal.corpCarDstinCd == '01'){//자사
                    $("#btnThis").attr("class", "on");
                    $("#btnOther").attr("class", "");
                }else if(selectedVal.corpCarDstinCd == '02'){//타사
                    $("#btnThis").attr("class", "");
                    $("#btnOther").attr("class", "on");
                }else {
                    $("#btnThis").attr("class", "");
                    $("#btnOther").attr("class", "");
                }


                //평가방법
                if(selectedVal.evalMthCd == 'A'){//본인
                    $("#btnSelf").attr("class", "on");
                    $("#btnProxy").attr("class", "");
                }else if(selectedVal.evalMthCd == 'M'){//대행
                    $("#btnSelf").attr("class", "");
                    $("#btnProxy").attr("class", "on");
                }


                $('#auctGrid').data('kendoExtGrid').dataSource.page(1);

            });


        } else {
            // {상세정보}을(를) 확인하여 주세요.
            dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
            return;
        }


    }


    /*****************************************************************************
    ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
    *******************************************************************************/



    //버튼 - 양식출력(매입계약서)
    $("#btnSamplePrint").kendoButton({
        click:function(e){
            //기능개발중입니다.
            dms.notification.warning("<spring:message code = 'sal.info.functionDeveloping'/>");
        }
        , enable:false
    });

    //버튼 - 차량이미지 평가용
    $("#btnVehicleEvalImage").kendoButton({
        click:function(e){
            //기능개발중입니다.
            //dms.notification.warning("<spring:message code = 'sal.info.functionDeveloping'/>");


            selectEvCarPopupWindow();
        }
    });

    //버튼 - 다른 이름으로 저장
    $("#btnOtherSave").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var selectIdx = grid.select().index();

            var msg = "<spring:message code='global.info.reallySaveSameData' />";
            if (confirm(msg) == false ){    //다른 이름으로 저장 하시겠습니까?
                return false;
            }

            var param = {};

            param.purcCustNo = $("#purcCustNo").val();                                              //매입번호
            param.telNo1 = $("#telNo1").val();                                                      //연락처
            param.purcTotAmt = $("#purcTotAmt").val();                                              //최종가격
            param.vinNo = $("#vinNo").val();                                                        //VIN NO
            param.carRunDistVal = $("#carRunDistVal").val();                                        //주행거리
            param.fuelCd = $("#fuelCd").data("kendoExtDropDownList").value();                          //연료구분
            param.drvMthCd = $("#drvMthCd").data("kendoExtDropDownList").value();                      //구동방식
            param.carDispQty = $("#carDispQty").val();                                              //배기량
            param.carBrandCd = $("#carBrandCd").data("kendoExtDropDownList").value();                  //제조사
            param.corpCarDstinCd = $("#corpCarDstinCd").val();                                      //본사,타사구분
            param.pcDstinCd = $("#pcDstinCd").data("kendoExtDropDownList").value();                    //사용용도
            param.manufactYyMmDt = $("#manufactYyMmDt").val();                                      //제조년월
            param.purcAmt = $("#purcAmt").data("kendoExtNumericTextBox").value();                      //매입가격
            param.exchAmt = $("#exchAmt").data("kendoExtNumericTextBox").value();                      //치환가격
            param.recomSaleAmt = $("#recomSaleAmt").data("kendoExtNumericTextBox").value();            //추천판매가격
            param.retlDt = $("#retlDt").data("kendoExtMaskedDatePicker").value();                   //소매일자
            param.lastOwnerNm = $("#lastOwnerNm").val();                                            //최종소유자
            param.platNo = $("#platNo").val();                                                      //차량등록번호
            param.platAmt = $("#platAmt").data("kendoExtNumericTextBox").value();                      //번호판가격
            param.fceIncPrid = $("#fceIncPrid").val();                                              //교통사고강제보험유효기간
            param.carTaxPrid = $("#carTaxPrid").val();                                              //차배세유효기간
            param.yyTestPrid = $("#yyTestPrid").val();                                              //년검사유효기간
            param.cmcIncPrid = $("#cmcIncPrid").val();                                              //상업보험유효기간

            param.purcRegDt = $("#purcRegDt").data("kendoExtMaskedDatePicker").value();

            param.stat = "P";
            param.purcStatCd = "01";
            param.carlineCd = $("#carlineCd").data("kendoExtDropDownList").value();
            param.modelCd = $("#modelCd").data("kendoExtDropDownList").value();
            param.ocnCd = $("#ocnCd").data("kendoExtDropDownList").value();
            param.extColorCd = $("#extColorCd").data("kendoExtDropDownList").value();
            param.intColorCd = $("#intColorCd").data("kendoExtDropDownList").value();
            param.gubun = "I";

            if($("#exchYn").is(":checked")){
                param.exchYn = 'Y';
            }else {
                param.exchYn = 'N';
            }

            if($("#noSaleYn").is(":checked")){
                param.noSaleYn = 'Y';
            }else {
                param.noSaleYn = 'N';
            }

            $.ajax({
                url:"<c:url value='/sal/usc/purcEval/savePurcEvalMng.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(param),
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
                },
                success:function(data){
                    $("#purcMngWindow").data("kendoWindow").close();
                    fnReset();
                    $('#auctGrid').data('kendoExtGrid').dataSource.data([]);
                    $('#grid').data('kendoExtGrid').dataSource.page(1);
                    // 저장이 완료되었습니다.
                    dms.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
                }
            });

        }
    });


    //버튼 - 고객조회
    $("#btnCustSearch").kendoButton({
        click:function(e){
            window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />",
                    "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />", "VIEW-D-10272");
        }
    });


    //버튼 - 차량마스터조회
    $("#btnVehicleSearch").kendoButton({
        click:function(e){
            window.parent._createOrReloadTabMenu("<spring:message code='sal.lbl.carMaster' />"
                    , "<c:url value='/sal/veh/vehicleMaster/selectVehicleMasterMain.do' />", "VIEW-D-10396");
        }
    });

    // 평가완료
    $("#btnFinishEval").kendoButton({
        click:function(e) {
            var saveData = {
                    dlrCd:$("#dlrCd").val()
                    ,purcNo    :$("#purcNo").val()
                    ,purcStatCd:"03"
                    ,stat      :"P"
                    ,gubun     :"U"
            };

            $.ajax({
                url:"<c:url value='/sal/usc/purcEval/savePurcEvalMng.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(saveData),
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
                },
                success:function(data){
                    // 저장이 완료되었습니다.
                    dms.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
                    $("#grid").data("kendoExtGrid").dataSource.read();
                }
            });
        }
        , enable:false
    });



    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            fnReset();
            $("#btnFinishEval").data("kendoButton").enable(false);
            $("#btnRequestEval").data("kendoButton").enable(false);
            $("#btnConfirm").data("kendoButton").enable(false);
            $("#btnReject").data("kendoButton").enable(false);

            $('#auctGrid').data('kendoExtGrid').dataSource.data([]);
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });



    //버튼 - 초기화
      $("#btnReset").kendoButton({
          click:function(e){
              viewPopup();
              fnReset();
              purcStatCd = '00';
              vehicleDisabled('N');
              evalDisabled('Y');
              $("#btnSave").data("kendoButton").enable(true);
              $("#btnOtherSave").data("kendoButton").enable(true);
              $("#btnRequestEval").data("kendoButton").enable(false);
              $('#auctGrid').data('kendoExtGrid').dataSource.data([]);
              $('#grid').data('kendoExtGrid').clearSelection();
          }
      });


    //버튼 - 임시저장
    $("#btnSave").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var selectIdx = grid.select().index();
            var data = grid.dataSource.view();
            var selectVal = data[selectIdx];


            //고객명
            if ( dms.string.isEmpty($("#purcCustNo").val()) ){
                dms.notification.warning("<spring:message code='global.lbl.custNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#purcCustNm").focus();
                return false;
            }


            //매입총금액
            if ( dms.string.isEmpty($("#purcTotAmt").val()) || $("#purcTotAmt").val() == 0){
                dms.notification.warning("<spring:message code='sal.lbl.purcTotAmt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#purcTotAmt").data("kendoExtNumericTextBox").focus();
                return false;
            }


            //매입금액
            if ( dms.string.isEmpty($("#purcAmt").val()) || $("#purcAmt").val() == 0 ){
                dms.notification.warning("<spring:message code='sal.lbl.purcAmt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#purcAmt").data("kendoExtNumericTextBox").focus();
                return false;
            }



            //최종소유자
            if ( dms.string.isEmpty($("#lastOwnerNm").val()) ){
                dms.notification.warning("<spring:message code='sal.lbl.lastOwnerNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#lastOwnerNm").focus();
                return false;
            }


            //교강보험유효기간
            if ( dms.string.isEmpty($("#fceIncPrid").val()) ){
                dms.notification.warning("<spring:message code='sal.lbl.fceIncPrid' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#fceIncPrid").focus();
                return false;
            }

            //차배세유효기간
            if ( dms.string.isEmpty($("#carTaxPrid").val()) ){
                dms.notification.warning("<spring:message code='sal.lbl.carTaxPrid' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#carTaxPrid").focus();
                return false;
            }

            //년검사유효기간
            if ( dms.string.isEmpty($("#yyTestPrid").val()) ){
                dms.notification.warning("<spring:message code='sal.lbl.yyTestPrid' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#yyTestPrid").focus();
                return false;
            }





            var msg = "";
            if(selectIdx ==  -1 ){
                msg = "<spring:message code='global.lbl.newSave' var='newSave' /><spring:message code='global.info.andMsg' arguments='${newSave},' />";
            }else {
                msg = "<spring:message code='global.btn.tempSave' var='tmpSave' /><spring:message code='global.info.andMsg' arguments='${tmpSave},' />";
            }

            if (confirm(msg) == false ){    //신규저장/임시저장 하시겠습니까?
                return false;
            }

            var param ;

            if( purcStatCd == "00" || selectVal.purcStatCd == '01' ){
                param = $("#detailPurcForm").serializeObject($("#detailPurcForm").serializeArrayInSelector("[data-json-obj='true']"));
                param.purcRegDt = $("#purcRegDt").data("kendoExtMaskedDatePicker").value();
                param.retlDt = $("#retlDt").data("kendoExtMaskedDatePicker").value();
                param.stat = "P";
                param.purcStatCd = "01";
                param.modelCd = $("#modelCd").data("kendoExtDropDownList").value();
                param.ocnCd = $("#ocnCd").data("kendoExtDropDownList").value();
                param.extColorCd = $("#extColorCd").data("kendoExtDropDownList").value();
                param.intColorCd = $("#intColorCd").data("kendoExtDropDownList").value();

                if($("#exchYn").is(":checked")){
                    param.exchYn = 'Y';
                }else {
                    param.exchYn = 'N';
                }

                if($("#noSaleYn").is(":checked")){
                    param.noSaleYn = 'Y';
                }else {
                    param.noSaleYn = 'N';
                }

                if(grid.select().index() == -1){
                    param.gubun = "I";
                }else {
                    param.gubun = "U";
                }
             }else {
                param = $("#detailEvalForm").serializeObject($("#detailEvalForm").serializeArrayInSelector("[data-json-obj='true']"));
                param.dlrCd = $("#dlrCd").val();
                param.purcNo = $("#purcNo").val();
                param.evalDt = $("#evalDt").data("kendoExtMaskedDatePicker").value();

                param.stat = "E";
                param.purcStatCd = "02";
                param.gubun = "U";
            }



            $.ajax({
                url:"<c:url value='/sal/usc/purcEval/savePurcEvalMng.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(param),
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
                },
                success:function(data){
                    $("#purcMngWindow").data("kendoWindow").close();
                    fnReset();
                    purcStatCd == '';
                    $('#auctGrid').data('kendoExtGrid').dataSource.data([]);
                    $('#grid').data('kendoExtGrid').dataSource.page(1);
                    // 저장이 완료되었습니다.
                    dms.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
                }
            });

        }
    });



    // 평가요청
    $("#btnRequestEval").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var selectIdx = grid.select().index();
            var data = grid.dataSource.view();
            var selectVal = data[selectIdx];

            if(selectIdx ==  -1 ){
                //평가요청할  데이터가 존재하지 않습니다.
                dms.notification.warning("<spring:message code='sal.btn.requestEval' var='req' /><spring:message code='global.info.notExistData' arguments='${req},' />");
                return false;
            }

            if(selectVal.purcStatCd == '02'){
                //이미 평가요청되였습니다.
                dms.notification.warning("<spring:message code='sal.info.requestedEval' />");
                return false;
            }else if(selectVal.purcStatCd == '03'){
                //평가완료되였습니다.
                dms.notification.warning("<spring:message code='sal.info.finishedEval' />");
                return false;
            }else if(selectVal.purcStatCd == '04'){
                //매입확정되였습니다.
                dms.notification.warning("<spring:message code='sal.info.confirmPurc' />");
                return false;
            }else if(selectVal.purcStatCd == '05'){
                //매입반려되였습니다.
                dms.notification.warning("<spring:message code='sal.info.rejectPurc' />");
                return false;
            }

            var msg = "<spring:message code='sal.btn.requestEval' var='requestEval' /><spring:message code='global.info.andMsg' arguments='${requestEval}' />";
            if (confirm(msg) == false ){    //평가요청 하시겠습니까?
                return false;
            }

            var saveData = {
                    dlrCd:selectVal.dlrCd
                    ,purcNo    :selectVal.purcNo
                    ,purcStatCd:"02"
                    ,stat      :"P"
                    ,gubun     :"U"
            };

            $.ajax({
                url:"<c:url value='/sal/usc/purcEval/savePurcEvalMng.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(saveData),
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
                },
                success:function(data){
                    fnReset();
                    $('#auctGrid').data('kendoExtGrid').dataSource.data([]);
                    $('#grid').data('kendoExtGrid').dataSource.page(1);
                    // 저장이 완료되었습니다.
                    dms.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
                }
            });
        }
        , enable:false
    });



    // 성공
    $("#btnConfirm").kendoButton({
        click:function(e) {

            var grid = $("#grid").data("kendoExtGrid");
            var selectIdx = grid.select().index();
            var data = grid.dataSource.view();
            var selectVal = data[selectIdx];

            var saveData = {
                    dlrCd:selectVal.dlrCd
                    ,purcNo    :selectVal.purcNo
                    ,purcStatCd:"04"
                    ,stat      :"P"
                    ,gubun     :'U'
            };

            $.ajax({
                url:"<c:url value='/sal/usc/purcEval/savePurcEvalMng.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(saveData),
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
                },
                success:function(data){
                    $("#grid").data("kendoExtGrid").dataSource.read();
                    // 저장이 완료되었습니다.
                    dms.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
                }
            });
        }
        , enable:false
    });




    // 반려
    $("#btnReject").kendoButton({
        click:function(e) {

            var grid = $("#grid").data("kendoExtGrid");
            var selectIdx = grid.select().index();
            var data = grid.dataSource.view();
            var selectVal = data[selectIdx];

            var saveData = {
                    dlrCd:selectVal.dlrCd
                    ,purcNo    :selectVal.purcNo
                    ,purcStatCd:"05"
                    ,stat      :"P"
                    ,gubun     :'U'
            };

            $.ajax({
                url:"<c:url value='/sal/usc/purcEval/savePurcEvalMng.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(saveData),
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
                },
                success:function(data){
                    $("#grid").data("kendoExtGrid").dataSource.read();
                    // 저장이 완료되었습니다.
                    dms.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
                }
            });
        }
        , enable:false
    });







    //경매이력그리드 - 추가
    $("#btnAuctAdd").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            if(grid.select().index() == -1){
                // 매입정보(을)를 선택하여 주세요.
                dms.notification.warning("<spring:message code='global.lbl.docNo' var='documentNo' /><spring:message code='global.info.check.field' arguments='${documentNo}' />");
                return false;
            }else {
                $('#auctGrid').data('kendoExtGrid').dataSource.insert(0, {
                     "dlrCd":$("#dlrCd").val()
                    ,"purcNo":$("#purcNo").val()
                    ,"seq":""
                    ,"auctCd":"01"
                    ,"auctAmt":0
                    ,"carDlYn":"N"
                    ,"remark":""
                });
            }
        }
    });



    //경매이력그리드  - 삭제
    $("#btnAutcDel").kendoButton({
        click:function(e) {
            var grid = $("#auctGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });


    //경매이력그리드 - 취소
    $("#btnAutcCancel").kendoButton({
        click:function(e) {
            $('#auctGrid').data('kendoExtGrid').cancelChanges();
        }
    });



    //경매이력그리드  - 저장
    $("#btnAuctSave").kendoButton({
        click:function(e) {

            var grid = $("#auctGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/sal/usc/purcEval/multiSaveAuctInfo.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {

                    }
                    ,success:function(jqXHR, textStatus) {
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        $("#auctGrid").data("kendoExtGrid").dataSource.read();
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");

            }

        }
    });



    //명세서버튼
    $("#btnDetailList").kendoButton({
        click:function(e) {

            //개발진행 예정중입니다.
            dms.notification.warning("<spring:message code='global.info.developIng'/>");

        }
    });


    /**************************************** 버튼영역 END **********************************************************/


    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-115605"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/usc/purcEval/selectPurcMng.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sPurcNo"] = $("#sPurcNo").val();                                                                 // 프로모션 유형
                        params["sPurcCustNo"] = $("#sContractCustNo").val();                                                     // 고객코드
                        params["sVinNo"] = $("#sVinNo").val();                                                                   // VIN NO
                        params["sPurcRegStartDt"] = $("#sPurcRegStartDt").data('kendoExtMaskedDatePicker').value();              // 프로모션기간-시작일
                        params["sPurcRegEndDt"] = $("#sPurcRegEndDt").data('kendoExtMaskedDatePicker').value();                  // 프로모션기간-종료일

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"purcNo"
                    ,fields:{
                        purcNo      :{type:"string"}
                        ,purcCustNm :{type:"string"}
                        ,corpCarDstinCd:{type:"string"}
                        ,carBrandCd :{type:"string"}
                        ,modelCd    :{type:"string"}
                        ,carDispQty :{type:"string"}
                        ,ocnCd      :{type:"string"}
                        ,extColorNm :{type:"string"}
                        ,intColorNm :{type:"string"}
                        ,evalMthCd  :{type:"string"}
                        ,purcRegDt  :{type:"date"}
                        ,evalDt     :{type:"date"}
                        ,evalAmt    :{type:"number"}
                        ,exchYn     :{type:"string"}
                        ,retlDt     :{type:"date"}
                    }
                }
            }
        }
        //,height:472
        //,pageable:false
        ,editable:false
        //,autoBind:false
        ,change:function(e) {

            if(this.select().length != 0){
                var selectedVal = this.dataItem(this.select());
                var purcNo = selectedVal.purcNo;
                if ( dms.string.isNotEmpty(purcNo) ) {
                    $("#btnViewDetail").data("kendoButton").enable(true);


                    if(selectedVal.purcStatCd == '01'){
                        $("#btnFinishEval").data("kendoButton").enable(false);
                        $("#btnRequestEval").data("kendoButton").enable(true);
                        $("#btnConfirm").data("kendoButton").enable(false);
                        $("#btnReject").data("kendoButton").enable(false);
                        $("#btnSave").data("kendoButton").enable(true);
                        $("#btnVehicleEvalImage").data("kendoButton").enable(false);

                        vehicleDisabled('N');
                        evalDisabled('Y');
                    }else if(selectedVal.purcStatCd == '02'){
                        $("#btnFinishEval").data("kendoButton").enable(true);
                        $("#btnRequestEval").data("kendoButton").enable(false);
                        $("#btnConfirm").data("kendoButton").enable(false);
                        $("#btnReject").data("kendoButton").enable(false);
                        $("#btnSave").data("kendoButton").enable(true);
                        $("#btnVehicleEvalImage").data("kendoButton").enable(true);

                        vehicleDisabled('Y');
                        evalDisabled('N');
                    }else if(selectedVal.purcStatCd == '03'){
                        $("#btnRequestEval").data("kendoButton").enable(false);
                        $("#btnConfirm").data("kendoButton").enable(true);
                        $("#btnReject").data("kendoButton").enable(true);
                        $("#btnSave").data("kendoButton").enable(false);
                        $("#btnFinishEval").data("kendoButton").enable(false);
                        $("#btnVehicleEvalImage").data("kendoButton").enable(false);

                        vehicleDisabled('Y');
                        evalDisabled('Y');
                    }else {
                        $("#btnRequestEval").data("kendoButton").enable(false);
                        $("#btnConfirm").data("kendoButton").enable(false);
                        $("#btnReject").data("kendoButton").enable(false);
                        $("#btnSave").data("kendoButton").enable(false);
                        $("#btnFinishEval").data("kendoButton").enable(false);
                        $("#btnVehicleEvalImage").data("kendoButton").enable(false);

                        vehicleDisabled('Y');
                        evalDisabled('Y');
                    }
                }
            }

        }
        ,dataBinding:function(e) {
            kendo.bind($("#viewModel"), {"purcDs":[{"purcNo":""}]});
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
             {field:"purcNo"          ,title:"<spring:message code='sal.lbl.documentNo' />"   ,width:140    ,attributes:{"class":"ac"}}  //매입번호
            ,{field:"purcCustNm"      ,title:"<spring:message code='par.lbl.custNm' />"       ,width:70     ,attributes:{"class":"ac"}}  //고객명
            ,{field:"corpCarDstinCd"  ,title:"<spring:message code='sal.lbl.corpCarYn' />"    ,width:100    ,attributes:{"class":"ac"}
                ,template:"# if(corpCarDstinCdMap[corpCarDstinCd] != null) { # #= corpCarDstinCdMap[corpCarDstinCd].cmmCdNm# # }#"
             }  //본회사여부
            ,{field:"carBrandCd"      ,title:"<spring:message code='sal.lbl.factory' />"      ,width:80     ,attributes:{"class":"ac"}
                ,template:"# if(carBrandCdMap[carBrandCd] != null) { # #= carBrandCdMap[carBrandCd].cmmCdNm# # }#"
             }  //제조브랜드
            ,{field:"carDispQty"      ,title:"<spring:message code='global.lbl.carDispQty' />",width:50     ,attributes:{"class":"ar"}}  //배기량
            ,{field:"modelNm"         ,title:"<spring:message code='global.lbl.model' />"     ,width:80     ,attributes:{"class":"al"}}  //모델
            ,{field:"ocnNm"           ,title:"<spring:message code='global.lbl.ocn' />"       ,width:100    ,attributes:{"class":"al"}}  //OCN
            ,{field:"extColorNm"      ,title:"<spring:message code='global.lbl.extColor' />"  ,width:80     ,attributes:{"class":"al"}}  //외장색
            ,{field:"intColorNm"      ,title:"<spring:message code='global.lbl.intColor' />"  ,width:80     ,attributes:{"class":"al"}}  //내장색
            ,{field:"evalMthCd"       ,title:"<spring:message code='sal.lbl.evalPlace' />"    ,width:80     ,attributes:{"class":"ac"}}  //평가처
            ,{field:"purcRegDt"       ,title:"<spring:message code='sal.lbl.purcRegDt' />"    ,width:80     ,attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}  //매입거래일자
            ,{field:"evalDt"          ,title:"<spring:message code='global.lbl.evalScheDt' />",width:80     ,attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}  //평가일자
            ,{field:"evalAmt"         ,title:"<spring:message code='sal.lbl.usrSbstAmt' />"   ,width:80     ,attributes:{"class":"ar"},format:"{0:##,###}"}  //평가금액
            ,{field:"exchYn"          ,title:"<spring:message code='sal.lbl.uatcCarPurc' />"  ,width:50     ,attributes:{"class":"ac"}}  //치환여부
            ,{field:"purcStatCd"      ,title:"<spring:message code='global.lbl.statNm' />"    ,width:70    ,attributes:{"class":"ac"}
                ,template:"# if(purcStatCdMap[purcStatCd] != null) { # #= purcStatCdMap[purcStatCd].cmmCdNm# # }#"
             }//상태
        ]
    });



    //그리드 설정
    $("#auctGrid").kendoExtGrid({
        gridId:"G-SAL-0721-115606"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/usc/purcEval/selectAuctInfo.do' />",
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        var grid = $("#grid").data("kendoExtGrid");
                        var selectIdx = grid.select().index();
                        var data = grid.dataSource.view();
                        var selectVal = data[selectIdx];


                        params["sDlrCd"] = selectVal.dlrCd;                         // 딜러
                        params["sPurcNo"] = selectVal.purcNo;                       // 매입번호


                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"auctPk",
                    fields:{
                         dlrCd :{type:"string"}
                        ,purcNo:{type:"string"}
                        ,seq:{type:"string"}
                        ,auctCd :{type:"string"}
                        ,auctPlaceNm:{type:"string"}
                        ,auctAmt:{type:"string"}
                        ,goodsDetlCont:{type:"string"}
                        ,carDlYn:{type:"string"}
                        ,scheConfirmDt:{type:"date"}
                        ,remark:{type:"string"}
                        ,regDt:{type:"date",editable:false}
                        ,updtDt:{type:"date"}
                    }
                }
            }
        }
        ,height:127
        ,pageable:false
        ,autoBind:false
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["auctPlaceNm","remark","scheConfirmDt","auctPlaceNm"]
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
             {field:"seq" ,hidden:true}
             ,{field:"regDt"
                 ,title:"<spring:message code='global.lbl.reqDt' />"
                 ,width:80
                 ,attributes:{"class":"ac"}
                 ,format:"{0:<dms:configValue code='dateFormat' />}"
             }//신청일자
             ,{field:"auctCd", title:"<spring:message code='sal.lbl.auctType' />", width:60
                 ,attributes:{"class":"ac"}
                 ,template:"# if(auctCdMap[auctCd] != null) { # #= auctCdMap[auctCd].cmmCdNm# # }#"
                 ,editor:function(container, options) {
                     $('<input required name="auctCd" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         autoBind:false
                         ,dataSource:auctCdDs
                         ,dataValueField:"cmmCd"
                         ,dataTextField:"cmmCdNm"
                     });
                     $('<span class="k-invalid-msg" data-for="auctCd"></span>').appendTo(container);
                 }
             }//경매구분
            ,{field:"auctPlaceNm",     title:"<spring:message code='sal.lbl.auctAddr' />",    width:120,  attributes:{"class":"al"}}  //경매처
            ,{field:"auctAmt",       title:"<spring:message code='sal.lbl.auctAmt' />",      width:70,  attributes:{"class":"ar"}} //경매가격
            ,{field:"goodsDetlCont",         title:"<spring:message code='sal.lbl.goods' />",        width:100,  attributes:{"class":"al"}} //용품내용
            ,{field:"carDlYn", title:"<spring:message code='sal.lbl.carDlYn' />", width:60
                ,attributes:{"class":"ac"}
                ,template:"# if(carDlYnMap[carDlYn] != null) { # #= carDlYnMap[carDlYn].cmmCdNm# # }#"
                ,editor:function(container, options) {
                    $('<input required name="carDlYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:carDlYnDs
                        ,dataValueField:"cmmCd"
                        ,dataTextField:"cmmCdNm"
                    });
                    $('<span class="k-invalid-msg" data-for="carDlYn"></span>').appendTo(container);
                }
            }//인도구분
            ,{field:"scheConfirmDt"
                ,title:"<spring:message code='sal.lbl.scheConfirmDt' />"
                ,width:80
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }//예상확정일자
            ,{field:"remark"
                ,title:"<spring:message code='par.lbl.remark' />"
                ,width:120
                ,attributes:{"class":"al"}
            }//비고
        ]
    });


    // 탭
    selectTabId = "carInfo";       // 초기값:차량소유자
    $("#tabstrip").kendoExtTabStrip({
        animation:false
       ,select:function(e) {
            selectTabId = e.item.id;
        }
    });

    $("#tabstrip").data("kendoExtTabStrip").select(0);


    fnOnChange = function(id,vl){
        if(id == "sContractCustNm"){
            $("#sContractCustNo").val("");
        }else if(id == "purcCustNm"){
            $("#purcCustNo").val("");
        }else if(id == "vinNo"){
            $("#carlineCd").data("kendoExtDropDownList").value("");
            $("#modelCd").data("kendoExtDropDownList").value("");
            $("#ocnCd").data("kendoExtDropDownList").value("");
            $("#extColorCd").data("kendoExtDropDownList").value("");
            $("#intColorCd").data("kendoExtDropDownList").value("");
        }


    }





    // 고객명에서 ObKeyDown
    $(".onKey_down").keydown(function(e){
        if (e.keyCode == 13) {
            if($(this).val() != "") {
                if($(this).attr("id") == 'sContractCustNm'){
                    sContractCustPopupWindow();
                }else if($(this).attr("id") == 'purcCustNm'){
                    purcCustPopupWindow();
                }else if($(this).attr("id") == 'vinNo'){
                    vehiclePopupWindow();
                }
            }
        }
    });


});



//팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
function viewPopup(){
    var win = $("#purcMngWindow").data("kendoWindow");
    win.center();
    win.open();
}




var popupEvCarWindow;

//차량이미지 평가용
function selectEvCarPopupWindow(){

  popupEvCarWindow = dms.window.popup({
      windowId:"popupEvCarWindow"
      ,title:"车图评价表"   // 평가용 차량이미지
      ,draggable:false
      ,modal:true
      ,height:600
      ,width:1300
      ,content:{
          url:"<c:url value='/sal/usc/purcEval/selectEvalCarImage.do' />"
          ,data:{
              "dlrCd":$("#dlrCd").val()
              ,"purcNo":$("#purcNo").val()
              ,"purcStatCd":$("#purcStatCd").data("kendoExtDropDownList").value()
              ,"callbackFunc":function(data){

              }
          }
      }
  });
}




//제조사
function btnClick(btn){
    if(btn == "01"){//본사
        $("#btnThis").attr("class", "on");
        $("#btnOther").attr("class", "");
        $("#corpCarDstinCd").val("01");
    }else if(btn == "02"){//타사
        $("#btnThis").attr("class", "");
        $("#btnOther").attr("class", "on");
        $("#corpCarDstinCd").val("02");
    }

}


//적용방법 버튼
function fnPurcWayClick(gubun){
    if(gubun == "A"){
        $("#btnSelf").attr("class", "on");
        $("#btnProxy").attr("class", "");
        $("#evalMthCd").val("A");
    }else if(gubun == "M"){
        $("#btnSelf").attr("class", "");
        $("#btnProxy").attr("class", "on");
        $("#evalMthCd").val("M");
    }
}


function fnReset(){

    $("#popupOpenYn").val("Y");
    $("#purcCustSearch").removeClass("form_search_disabled");
    $("#searchVinNo").removeClass("form_search_disabled");

    $("#dlrCd").val("");
    $("#purcNo").val("");
    $("#regUsrNm").val(usrNm);
    $("#purcCustNo").val("");
    $("#purcCustNm").val("");
    $("#purcStatCd").data("kendoExtDropDownList").value("");
    $("#telNo1").val("");
    $("#purcRegDt").data("kendoExtMaskedDatePicker").value(toDay);
    $("#purcTotAmt").data("kendoExtNumericTextBox").value("");
    $("#exchYn").prop("checked", false);
    //$("#contractNo").val("");
    $("#carBrandCd").data("kendoExtDropDownList").value("");
    $("#btnThis").attr("class", "on");
    $("#btnOther").attr("class", "");
    $("#carlineCd").data("kendoExtDropDownList").value("");
    $("#modelCd").data("kendoExtDropDownList").value("");
    $("#carDispQty").data("kendoExtNumericTextBox").value(0);
    $("#ocnCd").data("kendoExtDropDownList").value("");
    $("#extColorCd").data("kendoExtDropDownList").value("");
    $("#intColorCd").data("kendoExtDropDownList").value("");
    $("#manufactYyMmDt").val("");
    $("#vinNo").val("");
    $("#pcDstinCd").data("kendoExtDropDownList").value("");
    $("#carRunDistVal").data("kendoExtNumericTextBox").value(0);
    $("#fuelCd").data("kendoExtDropDownList").value("");
    $("#drvMthCd").data("kendoExtDropDownList").value("");
    $("#purcAmt").data("kendoExtNumericTextBox").value(0);
    $("#exchAmt").data("kendoExtNumericTextBox").value(0);
    $("#recomSaleAmt").data("kendoExtNumericTextBox").value(0);
    $("#noSaleYn").prop("checked", false);
    $("#platNo").val("");
    $("#platAmt").data("kendoExtNumericTextBox").value(0);
    $("#fceIncPrid").data("kendoExtMaskedDatePicker").value("");
    $("#carTaxPrid").data("kendoExtMaskedDatePicker").value("");
    $("#yyTestPrid").data("kendoExtMaskedDatePicker").value("");
    $("#cmcIncPrid").data("kendoExtMaskedDatePicker").value("");
    $("#retlDt").data("kendoExtMaskedDatePicker").value("");
    $("#btnSelf").attr("class", "on");
    $("#btnProxy").attr("class", "");
    $("#evalMthCd").val("");
    $("#evalPrsnNm").val("");
    $("#evalDt").data("kendoExtMaskedDatePicker").value("");
    $("#evalRemark").val("");
    //$("#carStatCd").data("kendoExtDropDownList").value("");
    $("#custHopeAmt").data("kendoExtNumericTextBox").value(0);
    $("#evalAmt").data("kendoExtNumericTextBox").value(0);
    $("#lastAmt").data("kendoExtNumericTextBox").value(0);
    $("#carRegAmt").data("kendoExtNumericTextBox").value(0);
    $("#lastOwnerNm").val("");

}




//검색조건 - 고객조회
function sContractCustPopupWindow(){
    var custNm = $("#sContractCustNm").val();

    popupWindow = dms.window.popup({
        windowId:"customerSearchPopupMain"
        , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
        , content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            , data:{
                "autoBind":true
                , "custNm":custNm
                , "type"  :null
                , "callbackFunc":function(data){
                    if (data.length >= 1) {
                        if ( dms.string.isNotEmpty(data[0].custNo) ) {
                            $("#sContractCustNo").val(data[0].custNo);
                            $("#sContractCustNm").val(data[0].custNm);
                        }

                        popupWindow.close();

                    }
                }
            }
        }
    })
}



//상세팝업 - 고객조회
function purcCustPopupWindow(){
    if($("#popupOpenYn").val() == 'Y'){
        var custNm = $("#purcCustNm").val();
        popupWindow = dms.window.popup({
            windowId:"customerSearchPopupMain"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , height: "400px"
            , width:"850px"
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "custNm":custNm
                    , "type"  :null
                    , "callbackFunc":function(data){
                        if (data.length >= 1) {
                            if ( dms.string.isNotEmpty(data[0].custNo) ) {
                                $("#purcCustNo").val(data[0].custNo);
                                $("#purcCustNm").val(data[0].custNm);
                                $("#telNo1").val(data[0].hpNo);
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
function vehiclePopupWindow(){
    if($("#popupOpenYn").val() == 'Y'){
        var dataInfo = {
                "vinNo":$("#vinNo").val()
                ,"carlineCd":$("#carlineCd").val()
                ,"carlineNm": $("#carlineCd").data("kendoExtDropDownList").text()
                ,"modelCd":$("#modelCd").val()
                ,"modelNm":$("#modelCd").data("kendoExtDropDownList").text()
                ,"ocnCd":$("#ocnCd").val()
                ,"ocnNm":$("#ocnCd").data("kendoExtDropDownList").text()
                ,"extColorCd":$("#extColorCd").val()
                ,"extColorNm":$("#extColorCd").data("kendoExtDropDownList").text()
                ,"intColorCd":$("#intColorCd").val()
                ,"intColorNm":$("#intColorCd").data("kendoExtDropDownList").text()
                ,"pageGubun":"usedCar"
         }


        popupWindow = dms.window.popup({
            windowId:"vehicleMasterStsPopupWin"    // 판매 - 차량마스터관리 조회 팝업
            ,title:"<spring:message code='global.title.vehicleMaster' />"
            ,height: "400px"
            ,width:"850px"
            ,draggable: false
            ,modal: true
            ,content:{
                url:"<c:url value='/sal/cmm/selectVehicleMasterPopup.do'/>"
                ,data: {
                    "type"  :null
                    ,"autoBind":true
                    ,"dataInfo" :　dataInfo
                    ,"callbackFunc":function(data){
                        $("#vinNo").val(data[0].vinNo);

                        var carlineCd = $("#carlineCd").data("kendoExtDropDownList");
                        if(data[0].carlineCd != null &&  data[0].carlineCd != ""){
                            carlineCd.value(data[0].carlineCd); // 차종
                        }

                        var modelCd = $("#modelCd").data("kendoExtDropDownList");
                        if(data[0].modelCd != null &&  data[0].modelCd != ""){
                            modelCd.setDataSource([{modelNm:data[0].modelCdNm, modelCd:data[0].modelCd}]);
                            modelCd.enable(true);
                            modelCd.value(data[0].modelCd); // 모델
                        }else {
                            $("#modelCd").data("kendoExtDropDownList").value("");
                        }

                        var ocnCd = $("#ocnCd").data("kendoExtDropDownList");
                        if(data[0].ocnCd != null &&  data[0].ocnCd != ""){
                            ocnCd.setDataSource([{ocnNm:data[0].ocnCdNm, ocnCd:data[0].ocnCd}]);
                            ocnCd.enable(true);
                            ocnCd.value(data[0].ocnCd); // OCN
                        }else {
                            $("#ocnCd").data("kendoExtDropDownList").value("");
                        }

                        var extColorCd = $("#extColorCd").data("kendoExtDropDownList");
                        if(data[0].extColorCd != null &&  data[0].extColorCd != ""){
                            extColorCd.setDataSource([{extColorNm:data[0].extColorCdNm, extColorCd:data[0].extColorCd}]);
                            extColorCd.enable(true);
                            extColorCd.value(data[0].extColorCd); // 외장색
                        }else {
                            $("#extColorCd").data("kendoExtDropDownList").value("");
                        }

                        var intColorCd = $("#intColorCd").data("kendoExtDropDownList");
                        if(data[0].intColorCd != null &&  data[0].intColorCd != ""){
                            intColorCd.setDataSource([{intColorNm:data[0].intColorCdNm, intColorCd:data[0].intColorCd}]);
                            intColorCd.enable(true);
                            intColorCd.value(data[0].intColorCd); // 내장색
                        }else {
                            $("#intColorCd").data("kendoExtDropDownList").value("");
                        }


                        //모델,ocn,외장색,내장색 다시 disabled 해준다.
                        //if(data[0].carlineCd != null && data[0].carlineCd != ""){ carlineCd.enable(false); }
                        if(data[0].modelCd != null && data[0].modelCd != ""){ modelCd.enable(false); }
                        if(data[0].ocnCd != null && data[0].ocnCd != ""){ocnCd.enable(false);}
                        if(data[0].extColorCd != null && data[0].extColorCd != ""){extColorCd.enable(false);}
                        if(data[0].intColorCd != null && data[0].intColorCd != ""){intColorCd.enable(false);}


                    }
                }
            }
        });
    }
}


    function vehicleDisabled(gubun){
        if( gubun == 'Y'){
            $("#purcCustNm").prop("disabled","disabled").addClass("form_disabled");         //고객명

            $("#btnCorpCarDstin").attr("disabled", "disabled");


            $("#telNo1").prop("disabled","disabled").addClass("form_disabled");         //연락처
            $("#purcTotAmt").data("kendoExtNumericTextBox").enable(false);                 //매입총금액
            $("#exchYn").prop("disabled","disabled").addClass("form_disabled");         //치환여부
            $("#carBrandCd").data("kendoExtDropDownList").enable(false);                   //제조사

            $("#tabBtnComp").addClass("disabled");                                      //본사/타사 구분버튼
            $("#btnThis1").prop("disabled","disabled")
            $("#btnOther1").prop("disabled","disabled")

            $("#carlineCd").data("kendoExtDropDownList").enable(false);                    //차종
            //$("#modelCd").data("kendoExtDropDownList").enable(false);                      //모델
            //$("#ocnCd").data("kendoExtDropDownList").enable(false);                        //OCN
            //$("#extColorCd").data("kendoExtDropDownList").enable(false);                   //외장색
            //$("#intColorCd").data("kendoExtDropDownList").enable(false);                   //내장색
            $("#carDispQty").data("kendoExtNumericTextBox").enable(false);                 //배기량
            $("#manufactYyMmDt").data("kendoExtMaskedDatePicker").enable(false);        //제조년월
            $("#vinNo").prop("disabled","disabled").addClass("form_disabled");          //VIN NO
            $("#pcDstinCd").data("kendoExtDropDownList").enable(false);                    //사용용도
            $("#carRunDistVal").data("kendoExtNumericTextBox").enable(false);              //주행거리
            $("#fuelCd").data("kendoExtDropDownList").enable(false);                       //연료
            $("#drvMthCd").data("kendoExtDropDownList").enable(false);                     //구동방식
            $("#purcAmt").data("kendoExtNumericTextBox").enable(false);                    //매입가격
            $("#exchAmt").data("kendoExtNumericTextBox").enable(false);                    //치환가격
            $("#recomSaleAmt").data("kendoExtNumericTextBox").enable(false);               //추천판매가격
            $("#retlDt").data("kendoExtMaskedDatePicker").enable(false);                //소매일자
            $("#lastOwnerNm").prop("disabled","disabled").addClass("form_disabled");    //최종소유자
            $("#noSaleYn").prop("disabled","disabled").addClass("form_disabled");       //번호판여부
            $("#platNo").prop("disabled","disabled").addClass("form_disabled");         //번호판번호
            $("#platAmt").data("kendoExtNumericTextBox").enable(false);                    //번호판가격
            $("#fceIncPrid").data("kendoExtMaskedDatePicker").enable(false);            //교통사고강제보험 유효기간
            $("#carTaxPrid").data("kendoExtMaskedDatePicker").enable(false);            //차배세유효기간
            $("#yyTestPrid").data("kendoExtMaskedDatePicker").enable(false);            //년검사 유효기간
            $("#cmcIncPrid").data("kendoExtMaskedDatePicker").enable(false);            //상업보험 유효기간

            $("#auctInfoButton").hide();
        }else{
            $("#purcCustNm").prop("disabled","").removeClass("form_disabled");              //고객명

            $("#btnCorpCarDstin").attr("disabled", "");


            $("#telNo1").prop("disabled","").removeClass("form_disabled");              //연락처
            $("#purcTotAmt").data("kendoExtNumericTextBox").enable(true);                  //매입총금액
            $("#exchYn").prop("disabled","").removeClass("form_disabled");              //치환여부
            $("#carBrandCd").data("kendoExtDropDownList").enable(true);                    //제조사

            $("#tabBtnComp").removeClass("disabled");                                   //본사/타사 구분버튼
            $("#btnThis1").prop("disabled","")
            $("#btnOther1").prop("disabled","")

            $("#carlineCd").data("kendoExtDropDownList").enable(true);                     //차종
            //$("#modelCd").data("kendoExtDropDownList").enable(true);                       //모델
            //$("#ocnCd").data("kendoExtDropDownList").enable(true);                         //OCN
            //$("#extColorCd").data("kendoExtDropDownList").enable(true);                    //외장색
            //$("#intColorCd").data("kendoExtDropDownList").enable(true);                    //내장색
            $("#carDispQty").data("kendoExtNumericTextBox").enable(true);                  //배기량
            $("#manufactYyMmDt").data("kendoExtMaskedDatePicker").enable(true);         //제조년월
            $("#vinNo").prop("disabled","").removeClass("form_disabled");               //VIN NO
            $("#pcDstinCd").data("kendoExtDropDownList").enable(true);                     //사용용도
            $("#carRunDistVal").data("kendoExtNumericTextBox").enable(true);               //주행거리
            $("#fuelCd").data("kendoExtDropDownList").enable(true);                        //연료
            $("#drvMthCd").data("kendoExtDropDownList").enable(true);                      //구동방식
            $("#purcAmt").data("kendoExtNumericTextBox").enable(true);                     //매입가격
            $("#exchAmt").data("kendoExtNumericTextBox").enable(true);                     //치환가격
            $("#recomSaleAmt").data("kendoExtNumericTextBox").enable(true);                //추천판매가격
            $("#retlDt").data("kendoExtMaskedDatePicker").enable(true);                 //소매일자
            $("#lastOwnerNm").prop("disabled","").removeClass("form_disabled");         //최종소유자
            $("#noSaleYn").prop("disabled","").removeClass("form_disabled");            //번호판여부
            $("#platNo").prop("disabled","").removeClass("form_disabled");              //번호판번호
            $("#platAmt").data("kendoExtNumericTextBox").enable(true);                     //번호판가격
            $("#fceIncPrid").data("kendoExtMaskedDatePicker").enable(true);             //교통사고강제보험 유효기간
            $("#carTaxPrid").data("kendoExtMaskedDatePicker").enable(true);             //차배세유효기간
            $("#yyTestPrid").data("kendoExtMaskedDatePicker").enable(true);             //년검사 유효기간
            $("#cmcIncPrid").data("kendoExtMaskedDatePicker").enable(true);             //상업보험 유효기간

            $("#auctInfoButton").hide();
        }
    }



    function evalDisabled(gubun){
            //평가정보
            if(gubun == 'Y'){
                $("#tabBtnMath").addClass("disabled");                                      //본사/타사 구분버튼
                $("#btnSelf1").prop("disabled","disabled")
                $("#btnProxy1").prop("disabled","disabled")


                $("#evalPrsnNm").prop("disabled","disabled").addClass("form_disabled");     //평가담당자
                $("#evalDt").data("kendoExtMaskedDatePicker").enable(false);                //평가일자
                $("#evalRemark").prop("disabled","disabled").addClass("form_disabled");     //평가의견
                //$("#carStatCd").data("kendoExtDropDownList").enable(false);                  //차량상태
                $("#custHopeAmt").data("kendoExtNumericTextBox").enable(false);                //고객희망가격
                $("#evalAmt").data("kendoExtNumericTextBox").enable(false);                    //평가가격
                $("#lastAmt").data("kendoExtNumericTextBox").enable(false);                    //최종판매가격
                $("#carRegAmt").data("kendoExtNumericTextBox").enable(false);                  //번호판평가가격

                $("#auctInfoButton").hide();
            }else{
                $("#tabBtnMath").removeClass("disabled");                                   //본사/타사 구분버튼
                $("#btnSelf1").prop("disabled","");
                $("#btnProxy1").prop("disabled","");
                $("#evalPrsnNm").prop("disabled","").removeClass("form_disabled");          //평가담당자
                $("#evalDt").data("kendoExtMaskedDatePicker").enable(true);                 //평가일자
                $("#evalRemark").prop("disabled","").removeClass("form_disabled");          //평가의견
                //$("#carStatCd").data("kendoExtDropDownList").enable(true);                   //차량상태
                $("#custHopeAmt").data("kendoExtNumericTextBox").enable(true);                 //고객희망가격
                $("#evalAmt").data("kendoExtNumericTextBox").enable(true);                     //평가가격
                $("#lastAmt").data("kendoExtNumericTextBox").enable(true);                     //최종판매가격
                $("#carRegAmt").data("kendoExtNumericTextBox").enable(true);                   //번호판평가가격

                $("#auctInfoButton").show();
            }

    }






</script>
<!-- //script -->
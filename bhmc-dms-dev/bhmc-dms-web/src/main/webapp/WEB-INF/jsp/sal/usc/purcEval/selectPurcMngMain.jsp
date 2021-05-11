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
                <button class="btn_m btn_print" id="btnSamplePrint"><spring:message code="sal.lbl.formatExam" /></button><!-- 양식출력(매입계약서) -->
                </dms:access>
                <dms:access viewId="VIEW-D-11000" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m " id="btnConfirm"><spring:message code="sal.btn.purcConfirm" /></button><!-- 성공 -->
                </dms:access>
                <dms:access viewId="VIEW-D-10999" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m " id="btnReject"><spring:message code="global.btn.reject" /></button><!-- 거절 -->
                </dms:access>
                <dms:access viewId="VIEW-D-13236" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m " id="purchaseCancel"><spring:message code="sal.btn.purchaseCancel" /></button><!-- 매입취소 -->
                </dms:access>
                <dms:access viewId="VIEW-D-10418" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_new" id="btnReset"><spring:message code="global.btn.new" /></button>
                    <!-- 신규 -->
                </dms:access>
                <dms:access viewId="VIEW-D-10998" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
                    <!-- 조회 -->
                </dms:access>
            </div>
        </div>
        <!-- 조회 조건 타이틀 종료 --><!-- 조회 조건 시작 -->
        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width: 9%;">
                    <col style="width: 15%;">
                    <col style="width: 9%;">
                    <col style="width: 15%;">
                    <col style="width: 9%;">
                    <col style="width: 15%;">
                    <col style="width: 9%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.brand" /></th><!-- 브랜드 -->
                        <td>
                            <input type="text" id="sCarBrandCd" class="form_comboBox">
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
                       <th scope="row"><spring:message code='global.lbl.carNo' /></th><!-- 차량번호 -->
                       <td>
                          <input id="sPlatNo" type="text" class="form_input">
                       </td>
                       <th scope="row"></th>
                       <td></td>
                       <th scope="row"></th>
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
            <!-- <div class="tab_area" id="tabstrip"> -->
<%--
                <span class="btn_right_absolute">
                    <dms:access viewId="VIEW-D-10997" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_s btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                    </dms:access>
                </span> --%>
                <div class="header_area">
                    <div class="btn_right">
                        <dms:access viewId="VIEW-D-10997" hasPermission="${dms:getPermissionMask('READ')}">
                            <button class="btn_s btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                        </dms:access>
                    </div>
                </div>

                <form id="detailPurcForm" name="detailPurcForm" method="POST" action="/">
                    <div class="viewPurcEval">
                        <div class="table_form">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width: 9%;">
                                    <col style="width: 15%;">
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
                                            <input id="purcTotAmt" name="purcTotAmt" type="number" value="0" min="0" max="" class="form_numeric ar" data-json-obj="true" maxlength="13" />
                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.salesAdvisor' /></th><!-- 판매고문 SALE_RGST_EMP -->
                                        <td>
                                            <input id="saleRgstEmp" name="saleRgstEmp" type="text"class="form_comboBox" data-json-obj="true" maxlength="30" />
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.buyTp' /></th><!-- 구입유형 -->
                                        <td>
                                            <input id="exchYn" name="exchYn" type="text"class="form_comboBox" value="" data-json-obj="true"  />
                                        </td>
                                        <th scope="row"></th>
                                        <td></td>
                                        <th scope="row"></th>
                                        <td></td>
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
                                   <col style="width: 15%;">
                                   <col style="width: 9%;">
                                   <col style="width: 15%;">
                                   <col style="width: 9%;">
                                   <col style="width: 15%;">
                                   <col style="width: 9%;">
                                   <col>
                                </colgroup>
                                    <tr>
                                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.vinNo" /></span></th><!-- VIN NO -->
                                        <td class="required_area">
                                           <input id="vinNo" name="vinNo" type="text" class="form_comboBox " placeholder="<spring:message code='global.lbl.vinNum' />" data-json-obj="true" maxlength="17">
                                            <%-- <div class="form_left" style="width:79%">
                                                 <input id="vinNo" name="vinNo" type="text" class="form_input onKey_down" placeholder="<spring:message code='global.lbl.vinNum' />" onchange="fnOnChange(this.id,this.value);" data-json-obj="true" maxlength="17">
                                             </div>
                                            <div class="form_right" style="width:21%;">
                                                    <button type="button" class="btn_s" id="btnVinInput"><spring:message code="sal.lbl.statInput" /></button>
                                            </div> --%>
                                        </td>
                                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.oldVhBrand' /></span></th><!-- 브랜드 -->
                                        <td>
                                            <div class="form_float">
                                                <div>
                                                    <input id="carBrandCd" name="carBrandCd" class="form_comboBox" data-json-obj="true"/>
                                                </div>
                                            </div>
                                        </td>
                                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.carLine' /></span></th><!-- 차종 -->
                                        <td>
                                            <input id="carlineCd" name="carlineCd" class="form_comboBox" data-json-obj="true">
                                        </td>
                                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.model' /></span></th><!-- 모델 -->
                                        <td>
                                            <input id="modelCd" name="modelCd" class="form_comboBox" data-json-obj="true">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                                        <td>
                                            <input id="extColorCd" name="extColorCd" class="form_comboBox" data-json-obj="true">
                                        </td>
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

                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="sal.lbl.purposeOfUse" /></th><!-- 사용용도 -->
                                        <td>
                                            <input id="pcDstinCd" name="pcDstinCd" class="form_comboBox"data-json-obj="true">
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.madeYyMm' /></th><!-- 제조년월 -->
                                        <td>
                                            <input id="manufactYyMmDt" name="manufactYyMmDt" type="text" class="form_datepicker" data-json-obj="true" />
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.carDispQty' /></th><!-- CC -->
                                        <td>
                                            <input type="text" id="carDispQty" name="carDispQty" min="0.0" max="" class="form_numeric ar" data-json-obj="true" maxlength="4">
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.vehicleInspecDt' /></th><!-- 차량검증일자 -->
                                        <td>
                                            <input id="vehicleInspecDt" name="vehicleInspecDt" type="text" class="form_datepicker" data-json-obj="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.custHopeAmt' /></th><!-- 고객희망가격 -->
                                        <td>
                                            <input id="custHopeAmt" name="custHopeAmt" type="number" min="0" max="" value="0" class="form_numeric ar" data-json-obj="true" maxlength="13"/>
                                            <input id="newFlag" name="newFlag" type="hidden">
                                        </td>
                                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.evalPersonAmt' /></span></th><!-- 평가가격 -->
                                        <td>
                                            <!-- <input id="evalAmt" name="evalAmt" type="number" min="0" max="" value="0" class="form_numeric ar" data-json-obj="true" maxlength="13"/> -->
                                            <div class="form_float">
                                                <div class="date_left" style="width:53%">
                                                    <input id="evalAmtFr" name="evalAmtFr" type="number" value="0" min="0" max="" class="form_numeric ar" data-json-obj="true"/>
                                                <span class="txt_from">~</span>
                                                </div>
                                                <div class="date_right" style="width:47%">
                                                    <input id="evalAmtTo" name="evalAmtTo" type="number" value="0" min="0" max="" class="form_numeric ar" data-json-obj="true" />
                                                </div>
                                            </div>
                                        </td>
                                        <th scope="row"><spring:message code='sal.lbl.buyAmt' /></th><!-- 구입가격 -->
                                        <td>
                                            <input id="lastAmt" name="lastAmt" type="number" min="0" max="" value="0" class="form_numeric ar" data-json-obj="true" maxlength="13"/>
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.contractNo' /></th><!-- 계약번호 -->
                                        <td>
                                            <%-- <div class="form_search" id="searchContractNo">
                                                <input id="contractNo" name="contractNo" type="text" readonly class="form_input form_readonly onKey_down" data-json-obj="true">
                                                <a href="javascript:;" onclick="javascript:contractNoPopupWindow();"><spring:message code='global.lbl.search' /></a>
                                                <!-- 검색 -->
                                            </div> --%>
                                            <input id="contractNo" name="contractNo" type="text" readonly class="form_input form_readonly" data-json-obj="true">
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.evaluationPerson' /></th><!-- 평가담당자 -->
                                        <td>
                                            <input id="evalPrsnNm" name="evalPrsnNm" type="text" class="form_input form_disabled" disabled data-json-obj="true" maxlength="20"/>
                                        </td>
                                        <th scope="row"><spring:message code='global.lbl.evalScheDt' /></th><!-- 평가일자 -->
                                        <td>
                                            <input id="evalDt" name="evalDt" class="form_datepicker ac" data-json-obj="true">
                                        </td>
                                        <th></th>
                                        <td>
                                            <dms:access viewId="VIEW-D-10994" hasPermission="${dms:getPermissionMask('READ')}">
                                                <button id="btnVehicleEvalImageSub" type="button" class="btn_xs">
                                                    <spring:message code='sal.btn.vehicleEvalImage' /><!-- 명세서 -->
                                                </button>
                                            </dms:access>
                                        </td>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.evaluationRemark' /></th><!-- 평가의견 -->
                                        <td colspan="7">
                                            <input id="evalRemark" name="evalRemark" type="text" class="form_input form_disabled" disabled data-json-obj="true" rows="2" cols="30" maxlength="4000"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='sal.lbl.retlDt' /></th><!-- 소매일자 -->
                                        <td>
                                            <input id="retlDt" name="retlDt" type="text" class="form_datepicker" data-json-obj="true">
                                        </td>
                                        <th scope="row"><spring:message code="global.lbl.relCustInfo" /></th><!-- 연계인 -->
                                        <td>
                                            <input id="lastOwnerNm" name="lastOwnerNm" class="form_input" data-json-obj="true" maxlength="20"/>
                                        </td>
                                        <th scope="row"><spring:message code="sal.lbl.relCustInfoTelNo" /></th><!-- 연계인전화번호 -->
                                        <td>
                                            <input id="lastOwnerTel" name="lastOwnerTel" class="form_input" data-json-obj="true" maxlength="20"/>
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
                                   <col style="width: 9%;">
                                   <col style="width: 15%;">
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
                                            <input id="platAmt" name="platAmt" type="number" min="0" max="" value="0"  class="form_numeric ar" data-json-obj="true" maxlength="13"/>
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
                                    <col style="width: 9%;">
                                    <col style="width: 15%;">
                                    <col style="width: 9%;">
                                    <col style="width: 15%;">
                                    <col style="width: 9%;">
                                    <col style="width: 15%;">
                                    <col style="width: 9%;">
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
                    </div>
                    <!-- 그리드 종료 -->
                    </form>
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

//중고차매입상태 Array
var purcStatCdDs = [];
<c:forEach var="obj" items="${purcStatCdList}">
    purcStatCdDs.push({"cmmCd" : "${obj.cmmCd}","cmmCdNm" : "${obj.cmmCdNm}","useYn" : "${obj.useYn}"});
</c:forEach>
//중고차매입상태 Map
var purcStatCdMap = dms.data.arrayToMap(purcStatCdDs, function(obj) {return obj.cmmCd;});

//중고차외장색상코드 SAL210
var purcExClrList = [];
<c:forEach var="obj" items="${purcExClrList}">
    purcExClrList.push({"cmmCd" : "${obj.cmmCd}","cmmCdNm" : "${obj.cmmCdNm}","useYn" : "${obj.useYn}"});
</c:forEach>
//중고차매입상태 Map
var purcExClMap = dms.data.arrayToMap(purcExClrList, function(obj) {return obj.cmmCd;});

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

//중고차브랜드
var usedCarBrandList = [{"carBrandCd":"", "carBrandNm":""}];
<c:forEach var="obj" items="${usedCarBrandList}">
usedCarBrandList.push({"carBrandCd":"${obj.carBrandCd}","carBrandNm":"${obj.carBrandNm}"});
</c:forEach>

//중고차사용용도 SAL213
var usedCarUsgeCdList = [{cmmCd:"" , cmmCdNm : "" , useYn:""}];
<c:forEach var="obj" items="${usedCarUsgeCdList}">
usedCarUsgeCdList.push({"cmmCd" : "${obj.cmmCd}","cmmCdNm" : "${obj.cmmCdNm}","useYn" : "${obj.useYn}"});
</c:forEach>
var usedCarUsgeCdMap = dms.data.arrayToMap(usedCarUsgeCdList , function(obj){return obj.cmmCd;});

//본사,타사구분
var corpCarDstinCdDs = [
    {"cmmCd" : "01" ,"cmmCdNm" : "<spring:message code='sal.lbl.thisCompany' />"}
    ,{"cmmCd" : "02", "cmmCdNm" : "<spring:message code='sal.lbl.otherCompany' />"}
];
var corpCarDstinCdMap = dms.data.arrayToMap(corpCarDstinCdDs,function(obj) {return obj.cmmCd;});

//금액구간
var saleEvalAmtDs = [];
<c:forEach var="obj" items="${saleEvalAmtList}">
    saleEvalAmtDs.push({"cmmCd" : "${obj.cmmCd}","cmmCdNm" : "${obj.cmmCdNm}","useYn" : "${obj.useYn}"});
</c:forEach>

// 판매고문
var selectSaleEmpDSList = [{saleEmpNm : " " , saleEmpCd:" "}];
var selectSaleEmpDSObj = {};
<c:forEach var="obj" items="${saleEmpDSInfo}">
selectSaleEmpDSList.push({saleEmpNm : "[${obj.usrId}]${obj.usrNm}",saleEmpCd : "${obj.usrId}"});
selectSaleEmpDSObj["${obj.usrId}"] = "[${obj.usrId}]${obj.usrNm}";
</c:forEach>

var popupEvCarWindow;
var popupWindow;
var custInfoRegPopup;

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
    /**중고차사용용도**/
    setUsedCarUsgeCdMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
           if(usedCarUsgeCdMap[value] != undefined)
            resultVal =  usedCarUsgeCdMap[value].cmmCdNm;
        }
        return resultVal;
    };

    /**중고차외장색장**/
    setPurcExClMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
           if(purcExClMap[value] != undefined)
            resultVal =  purcExClMap[value].cmmCdNm;
        }
        return resultVal;
    };

    /*
     * max 500으로 지정. 여백이 있는경우는 줄여야함
     */
    $("#purcMngWindow").kendoWindow({
        animation : false
        ,draggable : true
        ,modal : true
        ,resizable : false
        ,visible : false
        ,title : "<spring:message code='sal.lbl.detailSearch' />" // 상세정보
        ,width : "1100px"
        ,height : "500px"
    }).data("kendoWindow");

    isVailCheck = function(param){
        var regExp = /^[a-zA-Z0-9 -/]+$/g;
        var val = $("#vinNo").val();
        var rtn = regExp.test(val);

        return rtn;
    };


    var onlyNumAlpha = new RegExp("[^A-Z0-9]");
    $("#vinNo").keyup(function(e){
        var contents = $(this).val();
        if(onlyNumAlpha.test(contents)){
            $(this).val('');
        }
    });

    //조회조건 - START
    $("#sPurcRegStartDt").kendoExtMaskedDatePicker({
        format : "<dms:configValue code='dateFormat' />"
        ,dateValidMessage : "<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:"${sPurcRegStartDt}"
    });

    //조회조건 - END
    $("#sPurcRegEndDt").kendoExtMaskedDatePicker({
         format : "<dms:configValue code='dateFormat' />"
        ,dateValidMessage : "<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:"${sPurcRegEndDt}"
    });

    // 조회조건 - 시작일, 종료일
    $("#sPurcRegStartDt").on('change', {from : $("#sPurcRegStartDt"),to : $("#sPurcRegEndDt")}, fnChkSearchDate);
    $("#sPurcRegEndDt").on('change', {from : $("#sPurcRegStartDt"),to : $("#sPurcRegEndDt")}, fnChkSearchDate);

    //조회조건 - 제조사
    $("#sCarBrandCd").kendoExtDropDownList({
        dataTextField : "carBrandNm",
        dataValueField : "carBrandCd",
        dataSource : usedCarBrandList,
        suggest : true,
        filter : "startswith",
        height:400,
        change : function(e) {
            var carBrandCd = this.value();

            $("#sCarlineCd").data("kendoExtDropDownList").setDataSource([]);

            if(dms.string.isNotEmpty(carBrandCd)){
                $.ajax({
                    url : "<c:url value='/sal/usc/purcEval/selectUsedCarModelList.do'/>",
                    data : "carBrandCd="+carBrandCd,
                    type : "POST",
                    dataType : "json",
                    async : false,
                    error : function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success : function(data) {
                        var carlineDataSource = new kendo.data.DataSource({
                            data:data
                            ,group:{field:"brandNm"}
                        });

                        $("#sCarlineCd").data("kendoExtDropDownList").setDataSource(carlineDataSource);
                    }
                });
            }
        }
    });

    //조회조건 - 차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
        ,dataValueField:"carlineCd"
//         ,fixedGroupTemplate:null
//         ,fixedGroupTemplate:"Group : #: data #"
//         ,groupTemplate:"#: data #"
        ,optionLabel:" "
        ,height:400
    });

    /**************************************** 검색조건 END **********************************************************/

    $("#vinNo").kendoComboBox({
        /* dataSource: {
            transport: {
                read: {
                    url: null
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    var params = {};
                    return kendo.stringify(params);
                }
            }
            ,serverFiltering: false
            ,schema:{
                data:"data"
                ,total:"total"
            }
        } */
         dataSource: null
        ,suggest:true
        ,autoBind:false
        ,filter:"startswith"
        ,dataValueField:"vinNo"
        ,dataTextField:"vinNm"
        ,change:function(e){
          /*   var vinNo = $("#vinNo").data("kendoComboBox").text().toUpperCase();
            $("#vinNo").data("kendoComboBox").text(vinNo);
            $("#vinNo").data("kendoComboBox").value(vinNo);
            console.log(vinNo); */
            /* var onlyNumAlpha = new RegExp("[^A-Z0-9]");
            if(onlyNumAlpha.test(vinNo)){
                $("#vinNo").data("kendoComboBox").text("");
                $("#vinNo").data("kendoComboBox").value("");
            }else{
               $("#vinNo").data("kendoComboBox").text(vinNo);
               $("#vinNo").data("kendoComboBox").value(vinNo);
            } */
        }
    });


    //제조사
    $("#carBrandCd").kendoExtDropDownList({
        dataTextField : "carBrandNm",
        dataValueField : "carBrandCd",
        dataSource : usedCarBrandList,
        suggest : true,
        filter : "startswith",
        height : 300,
        change : function(e) {
            var carBrandCd = this.value();

            $("#modelCd").data("kendoExtDropDownList").setDataSource([]);
            $("#carlineCd").data("kendoExtDropDownList").setDataSource([]);

            if(dms.string.isNotEmpty(carBrandCd)){
                $.ajax({
                    url : "<c:url value='/sal/usc/purcEval/selectUsedCarModelList.do'/>",
                    data : "carBrandCd="+carBrandCd,
                    type : "POST",
                    dataType : "json",
                    async : false,
                    error : function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success : function(data) {
                        var carlineDataSource = new kendo.data.DataSource({
                            data:data
                            ,group:{field:"brandNm"}
                        });

                        $("#carlineCd").data("kendoExtDropDownList").setDataSource(carlineDataSource);
                    }

                });
            }
        }
    });


    //차종
    $("#carlineCd").kendoExtDropDownList({
        dataTextField : "carlineNm"
        ,dataValueField : "carlineCd"
        ,dataSource : []
        ,optionLabel : " "
        ,autoWidth : true
        ,height : 300
//      ,fixedGroupTemplate:"Group : #: data #"
//      ,groupTemplate:"#: data #"
        ,change : function(e) {

            var carlineCd = this.value();
            $("#modelCd").data("kendoExtDropDownList").setDataSource([]);

            if(dms.string.isNotEmpty(carlineCd)){
                $.ajax({
                    url : "<c:url value='/sal/usc/purcEval/selectUsedCarStyleList.do'/>",
                    data : "carlineCd="+carlineCd,
                    type : "POST",
                    dataType : "json",
                    async : false,
                    error : function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success : function(data) {
                        var carStyleDataSource = new kendo.data.DataSource({
                            data:data
                            ,group:{field:"year"}
                        });

                        $("#modelCd").data("kendoExtDropDownList").setDataSource(carStyleDataSource);
                    }

                });
            }
        }
        ,open:function(e){

            var carBrandCd = $("#carBrandCd").data("kendoExtDropDownList").value();
            var carlineCd = e.sender.value();

            if(e.sender.dataSource.data().length <= 1 ){
                $.ajax({
                    url : "<c:url value='/sal/usc/purcEval/selectUsedCarModelList.do'/>",
                    data : "carBrandCd="+carBrandCd,
                    type : "POST",
                    dataType : "json",
                    async : false,
                    error : function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success : function(data) {
                        var carlineDataSource = new kendo.data.DataSource({
                            data:data
                            ,group:{field:"brandNm"}
                        });

                        $("#carlineCd").data("kendoExtDropDownList").setDataSource(carlineDataSource);

                        if(carlineCd != null){
                            $("#carlineCd").data("kendoExtDropDownList").value(carlineCd);
                        }
                    }
                });
            }
        }
    });

    // 모델
    $("#modelCd").kendoExtDropDownList({
        dataTextField : "styleNm"
        ,dataValueField : "styleCd"
        ,optionLabel : " "
//         ,autoWidth : true
        ,height : 300
//         ,fixedGroupTemplate:"Group : #: data #"
//         ,groupTemplate:"#: data #"
        ,popup:{
            origin:"bottom left"
        }
        ,open:function(e){

            var carlineCd  = $("#carlineCd").data("kendoExtDropDownList").value();
            var modelCd = e.sender.value();

            if(e.sender.dataSource.data().length <= 1 ){
                $.ajax({
                    url : "<c:url value='/sal/usc/purcEval/selectUsedCarStyleList.do'/>",
                    data : "carlineCd="+carlineCd,
                    type : "POST",
                    dataType : "json",
                    async : false,
                    error : function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success : function(data) {
                        var carStyleDataSource = new kendo.data.DataSource({
                            data:data
                            ,group:{field:"year"}
                        });

                        $("#modelCd").data("kendoExtDropDownList").setDataSource(carStyleDataSource);

                        if(modelCd != null){
                            $("#modelCd").data("kendoExtDropDownList").value(modelCd);
                        }
                    }

                });
            }
        }
    });

    //외장색
    $("#extColorCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:purcExClrList,
        optionLabel : " "
    });

    $("#extColorCd").data("kendoExtDropDownList").enable(false);

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


    //구입유형
    $("#exchYn").kendoExtDropDownList({
        dataTextField : "cmmCdNm",
        dataValueField : "cmmCd",
        dataSource : usedCarUsgeCdList

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
    $("#exchAmt,#pecomSaleAmt,#platAmt,#custHopeAmt,#evalAmt,#lastAmt,#evalAmtFr,#evalAmtTo,#carRegAmt,#recomSaleAmt,#carRunDistVal").kendoExtNumericTextBox({
         format : "n0" // n0:###,###, n2:###,###.##
        ,decimals : 0 // 소숫점
        ,min : 0
        ,value : 0
        ,spinners : false
    // 증,감 화살표
    });
    /***** 배기량 *****/
    $("#carDispQty").kendoExtNumericTextBox({
         format : "n1" // n0:###,###, n2:###,###.##
        ,decimals : 1 // 소숫점
        ,min : 0.0
        ,value : 0.0
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
            //$("#tabstrip").data("kendoExtTabStrip").select(0);

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

            var grid = $('#grid').data('kendoExtGrid');

            var selectedItem = grid.dataItem(grid.select());

            if( dms.string.isNotEmpty(selectedItem) && dms.string.isNotEmpty(selectedItem.purcNo) ) {

                if( selectedItem.purcStatCd === "04" ) {
                    parent._createOrReloadTabMenu("<spring:message code='sal.title.purcUseCarPrint'/>", "<c:url value='/ReportServer?reportlet=sale/selectPurcEvalInfo.cpt'/>&sDlrCd="+selectedItem.dlrCd+"&sPurcNo="+selectedItem.purcNo);
                } else {
                    // {성공} 상태에서만 {양식출력 }이(가) 가능합니다.
                    dms.notification.warning("<spring:message code='global.btn.success' var='arg1' /><spring:message code='sal.lbl.formatExam' var='arg2' /><spring:message code='global.info.possible' arguments='${arg1}, ${arg2}' />");
                }

            } else {
                // 목록을 선택하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.required.select' />");
            };

        },
        enable:false
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
            $("#purchaseCancel").data("kendoButton").enable(false);
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

            $("#carlineCd").data("kendoExtDropDownList").setDataSource([]);
            $("#modelCd").data("kendoExtDropDownList").setDataSource([]);

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

            //구입가격
            if (dms.string.isEmpty($("#purcTotAmt").val())) {
                dms.notification.warning("<spring:message code='sal.lbl.purcTotAmt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#purcTotAmt").focus();
                return false;
            }

            //vin_no
            if (dms.string.isEmpty($("#vinNo").val())) {
                dms.notification.warning("<spring:message code='global.lbl.vinNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#vinNo").focus();
                return false;
            }

            //vin_no
            if ( $("#vinNo").val().length < 17  ) {
                dms.notification.warning("<spring:message code='sal.lnfo.chkVinNoLen' />");
                $("#vinNo").focus();
                return false;
            }

            //브랜드
            if (dms.string.isEmpty($("#carBrandCd").val())) {
                dms.notification.warning("<spring:message code='sal.lbl.oldVhBrand' var='oldVhBrand' /><spring:message code='global.info.required.field' arguments='${oldVhBrand}' />");
                $("#carBrandCd").focus();
                return false;
            }
            //차종
            if (dms.string.isEmpty($("#carlineCd").val())) {
                dms.notification.warning("<spring:message code='global.lbl.carLine' var='carLine' /><spring:message code='global.info.required.field' arguments='${carLine}' />");
                $("#carlineCd").focus();
                return false;
            }
            //모델
            if (dms.string.isEmpty($("#modelCd").val())) {
                dms.notification.warning("<spring:message code='global.lbl.model' var='model' /><spring:message code='global.info.required.field' arguments='${model}' />");
                $("#modelCd").focus();
                return false;
            }

            //평가항목 금액 구간시작
            if (dms.string.isEmpty($("#evalAmtFr").val())) {
                dms.notification.warning("<spring:message code='sal.lbl.evalPersonAmt' var='evalPersonAmt' /><spring:message code='global.info.required.field' arguments='${evalPersonAmt}' />");
                $("#evalAmtFr").focus();
                return false;
            }

            //평가항목 금액 구간종료
            if (dms.string.isEmpty($("#evalAmtTo").val())) {
                dms.notification.warning("<spring:message code='sal.lbl.evalPersonAmt' var='evalPersonAmt' /><spring:message code='global.info.required.field' arguments='${evalPersonAmt}' />");
                $("#evalAmtTo").focus();
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

                       /*  if ($("#evalMthCd").val() == "") {
                            param.evalMthCd = "A";
                        } else {
                            param.evalMthCd = $("#evalMthCd").val();
                        } */
                        param.evalMthCd    = "M";
                        param.evalPrsnNm   = $("#evalPrsnNm").val();
                        param.evalDt       = $("#evalDt").data("kendoExtMaskedDatePicker").value();
                        param.evalRemark   = $("#evalRemark").val();
                        param.custHopeAmt  = $("#custHopeAmt").val();
                        //param.carRegAmt    = $("#carRegAmt").val();
                        param.evalAmt      = $("#evalAmt").val();
                        param.lastAmt      = $("#lastAmt").val();

                        param.carBrandNm   = $("#carBrandCd").data("kendoExtDropDownList").text();
                        param.carlineNm    = $("#carlineCd").data("kendoExtDropDownList").text();
                        param.modelNm      = $("#modelCd").data("kendoExtDropDownList").text();
                        param.modelCd      = $("#modelCd").val();
                        param.extColorCd   = $("#extColorCd").val();
                        param.extColorNm   = $("#extColorCd").data("kendoExtDropDownList").text();

                        //var exchYn = $('input[name="exchYn"]:checked').val();
                        var exchYn         = $("#exchYn").val();
                        param.exchYn       = exchYn;
                        if(exchYn == "N"){
                            param.carStatCd    = "99";
                        }else{
                            param.carStatCd    = "60";
                        }


                        var noSaleYn       = ($("#noSaleYn").is(":checked")) ? "Y" : "N";
                        param.noSaleYn     = noSaleYn;

                        var purcStatCd = $("#purcStatCd").val();
                        if(dms.string.isEmpty(purcStatCd)){
                            purcStatCd = "01";
                        }
                        param.purcStatCd = purcStatCd;
                        saveUseCar(param, "01");

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

            var grid = $("#grid").data("kendoExtGrid");
            var selectedVal = grid.dataItem(grid.select());

            //고객명
            if (dms.string.isEmpty(selectedVal.purcCustNm)) {
                dms.notification.warning("<spring:message code='global.lbl.custNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            //vin_no
            if (dms.string.isEmpty(selectedVal.vinNo)) {
                dms.notification.warning("<spring:message code='global.lbl.vinNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

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
                                   ,purcCustNo      : selectedVal.purcCustNo
                                   ,carId           : selectedVal.carId
                                   ,vinCarId        : selectedVal.vinCarId
                            }
                            saveUseCar(param, "04");
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

            var grid = $("#grid").data("kendoExtGrid");
            var selectedVal = grid.dataItem(grid.select());

            //고객명
            if (dms.string.isEmpty(selectedVal.purcCustNm)) {
                dms.notification.warning("<spring:message code='global.lbl.custNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            //vin_no
            if (dms.string.isEmpty(selectedVal.vinNo)) {
                dms.notification.warning("<spring:message code='global.lbl.vinNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

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

                            saveUseCar(param, "05");
                        }

                    } else {
                        return false;
                    }
                }
            });
        },
        enable : false
    });

    // 매입취소
    $("#purchaseCancel").kendoButton({
        click : function(e) {

            var grid = $("#grid").data("kendoExtGrid");
            var selectedVal = grid.dataItem(grid.select());

            var param = {purcNo : selectedVal.purcNo};

            dms.window.confirm({
                message:"<spring:message code='sal.info.ConfirmUsedCarPurchaseCancel' />"
                ,title :"<spring:message code='sal.btn.purchaseCancel' />"
                ,callback:function(result){
                    if(result){
                        $.ajax({
                            url : "<c:url value='/sal/usc/purcEval/purchaseCancel.do' />",
                            type : 'POST',
                            dataType : 'json',
                            contentType : 'application/json',
                            data : JSON.stringify(param),
                            error : function(jqXHR,status,error) {dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);},
                            success : function(chkFlag) {
                                dms.notification.success("<spring:message code='sal.info.succPurchaseCancel' />"); //매입취소기성공처리
                                $("#btnSearch").click();
                            }
                        });
                    }else{
                        return false;
                    }
                }
            });
        },
        enable : false
    });

    //저장
    saveUseCar = function(param, flag){

        if(flag == "01"){
            var srchData = {"sVinNo":$("#vinNo").val(), "sPurcNo":$("#purcNo").val()};

            $.ajax({
                url : "<c:url value='/sal/usc/purcEval/checkingVinNoDupWhether.do' />",
                type : 'POST',
                dataType : 'json',
                contentType : 'application/json',
                data : JSON.stringify(srchData),
                async :false,
                error : function(jqXHR,status,error) {dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);},
                success : function(chkFlag) {
                    if(chkFlag == "Y"){
                        confirmDupVinSave(param);
                    }else{
                        saveParam(param);
                    }
                }
            });
        }else{
            saveParam(param);
        }
    };

    saveParam = function(param){
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
                //버튼 세팅
                setButtonEnable(data.purcStatCd);
                //fnReset();
                //purcStatCd == '';
                $('#grid').data('kendoExtGrid').dataSource.page(1);
                // 저장이 완료되었습니다.
                dms.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");

                $("#purcMngWindow").data("kendoWindow").close();
            }
        });
    }

    confirmDupVinSave = function(param){
        dms.window.confirm({
            message:"<spring:message code='sal.info.usedCarVinDup' />"
            ,title :"<spring:message code='global.btn.confirm' />"
            ,callback:function(result){
                if(result){
                    saveParam(param);
                }else{
                    return false;
                }
            }
        });
    }

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
      //  $("#detailEvalForm").get(0).reset();

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

        console.log(result);

        $("#dlrCd").val(result.dlrCd);
        $("#purcNo").val(result.purcNo);

        $("#regUsrNm").val(result.regUsrNm);

        $("#purcCustNm").val(result.purcCustNm);
        $("#purcCustNo").val(result.purcCustNo);
        $("#telNo1").val(result.telNo1);
        //$("#evalPrsnNmView").val(result.evalPrsnNmView);
        $("#vinNo").data("kendoComboBox").value(result.vinNo);
        $("#vinNo").data("kendoComboBox").text(result.vinNo);
        $("#contractNo").val(result.contractNo);
        $("#lastOwnerNm").val(result.lastOwnerNm);
        $("#lastOwnerTel").val(result.lastOwnerTel);
        $("#evalPrsnNm").val(result.evalPrsnNm);
        $("#evalRemark").val(result.evalRemark);
        $("#platNo").val(result.platNo);
        //$("input[name=exchYn]:radio:input[value="+result.exchYn+"]").prop("checked", true);
        $("#exchYn").data("kendoExtDropDownList").value(result.exchYn);

        $("#noSaleYn").prop("checked", (result.noSaleYn == "Y")? true : false );

        $("#purcStatCd").data("kendoExtDropDownList").value(result.purcStatCd);
        $("#drvMthCd").data("kendoExtDropDownList").value(result.drvMthCd);

        $("#pcDstinCd").data("kendoExtDropDownList").value(result.pcDstinCd);
        $("#saleRgstEmp").data("kendoExtDropDownList").value(result.saleRgstEmp);
        $("#fuelCd").data("kendoExtDropDownList").value(result.fuelCd);


        if(usedCarBrandList.length <= 1){
            $("#carBrandCd").data("kendoExtDropDownList").setDataSource([]);
            $("#carBrandCd").data("kendoExtDropDownList").setDataSource([{carBrandNm:result.carBrandNm, carBrandCd:result.carBrandCd}]);
        }
        $("#carBrandCd").data("kendoExtDropDownList").value(result.carBrandCd);

        if(result.carlineCd != null){
            $("#carlineCd").data("kendoExtDropDownList").setDataSource([]);

            var carlineDataSource = new kendo.data.DataSource({
                data:[{brandNm:result.carBrandNm, carlineNm:result.carlineNm, carlineCd:result.carlineCd}]
                ,group:{field:"brandNm"}
            });

            $("#carlineCd").data("kendoExtDropDownList").setDataSource(carlineDataSource);
            $("#carlineCd").data("kendoExtDropDownList").value(result.carlineCd);
        }

        if(result.modelCd != null ){
            if(result.purcStatCd == "01" || dms.string.isEmpty(result.purcStatCd)){
               // $("#modelCd").data("kendoExtDropDownList").enable(true);
            }else{
               // $("#modelCd").data("kendoExtDropDownList").enable(false);
            }

            var carStyleDataSource = new kendo.data.DataSource({
                data:[{year:dms.string.defaultString(result.modelYear,""), styleNm:result.modelNm, styleCd:result.modelCd}]
                ,group:{field:"year"}
            });

            $("#modelCd").data("kendoExtDropDownList").setDataSource(carStyleDataSource);
            $("#modelCd").data("kendoExtDropDownList").value(result.modelCd);
        }else {
            //$("#modelCd").data("kendoExtDropDownList").enable(true);
        }

        if(result.purcStatCd == "01" || dms.string.isEmpty(result.purcStatCd)){
            $("#extColorCd").data("kendoExtDropDownList").enable(true);
        }else{
            $("#extColorCd").data("kendoExtDropDownList").enable(false);
        }

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
        //$("#exchAmt").data("kendoExtNumericTextBox").value(result.exchAmt);
        //$("#recomSaleAmt").data("kendoExtNumericTextBox").value(result.recomSaleAmt);
        $("#custHopeAmt").data("kendoExtNumericTextBox").value(result.custHopeAmt);
        $("#lastAmt").data("kendoExtNumericTextBox").value(result.lastAmt);
        //$("#evalAmt").data("kendoExtNumericTextBox").value(result.evalAmt);
        //$("#carRegAmt").data("kendoExtNumericTextBox").value(result.carRegAmt);
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

            $("#telNo1").prop("disabled", "").removeClass("form_disabled");    //연락처
            $("#purcTotAmt").data("kendoExtNumericTextBox").enable(true);         //매입총금액
            $("#carBrandCd").data("kendoExtDropDownList").enable(true);           //제조사
            $("#tabBtnComp").removeClass("disabled");                          //본사/타사 구분버튼
            $("#evalAmtFr").data("kendoExtNumericTextBox").enable(true);          //매입금액구간시작
            $("#evalAmtTo").data("kendoExtNumericTextBox").enable(true);          //매입금액구간종료
            $("#carlineCd").data("kendoExtDropDownList").enable(true);            //차종
            $("#modelCd").data("kendoExtDropDownList").enable(true);            //차종
            $("#carDispQty").data("kendoExtNumericTextBox").enable(true);          //배기량
            $("#manufactYyMmDt").data("kendoExtMaskedDatePicker").enable(true); //제조년월
            $("#vehicleInspecDt").data("kendoExtMaskedDatePicker").enable(true); //차량검증일자
            $("#vinNo").data("kendoComboBox").enable(true);
            $("#vinNo").prop("disabled", "").removeClass("form_disabled"); //VIN NO
            $("#pcDstinCd").data("kendoExtDropDownList").enable(true); //사용용도
            $("#carRunDistVal").data("kendoExtNumericTextBox").enable(true); //주행거리
            $("#fuelCd").data("kendoExtDropDownList").enable(true); //연료
            $("#drvMthCd").data("kendoExtDropDownList").enable(true); //구동방식
            $("#exchYn").data("kendoExtDropDownList").enable(true); //구입유형
            //$("#exchAmt").data("kendoExtNumericTextBox").enable(true); //치환가격
            //$("#recomSaleAmt").data("kendoExtNumericTextBox").enable(true); //추천판매가격
            $("#retlDt").data("kendoExtMaskedDatePicker").enable(true); //소매일자
            $("#lastOwnerNm").prop("disabled", "").removeClass("form_disabled"); //최종소유자
            $("#noSaleYn").prop("disabled", "").removeClass("form_disabled"); //번호판여부
            $("#platNo").prop("disabled", "").removeClass("form_disabled"); //번호판번호
            $("#platAmt").data("kendoExtNumericTextBox").enable(true); //번호판가격
            $("#fceIncPrid").data("kendoExtMaskedDatePicker").enable(true); //교통사고강제보험 유효기간
            $("#carTaxPrid").data("kendoExtMaskedDatePicker").enable(true); //차배세유효기간
            $("#yyTestPrid").data("kendoExtMaskedDatePicker").enable(true); //년검사 유효기간
            $("#cmcIncPrid").data("kendoExtMaskedDatePicker").enable(true); //상업보험 유효기간
            //$("#evalPrsnNmView").prop("disabled", "disabled").addClass("form_disabled"); //평가사
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
            //$("#evalAmt").data("kendoExtNumericTextBox").enable(true); //평가가격
            $("#lastAmt").data("kendoExtNumericTextBox").enable(true); //최종판매가격
            //$("#carRegAmt").data("kendoExtNumericTextBox").enable(true); //번호판평가가격
            //$("#auctInfoButton").show();

            $("#extColorCd").data("kendoExtDropDownList").enable(true);
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
            $("#exchYn").data("kendoExtDropDownList").enable(false);     //구입유형
            $("#carBrandCd").data("kendoExtDropDownList").enable(false); //제조사
            $("#tabBtnComp").addClass("disabled"); //본사/타사 구분버튼
            $("#evalAmtFr").data("kendoExtNumericTextBox").enable(false); //매입금액구간시작
            $("#evalAmtTo").data("kendoExtNumericTextBox").enable(false); //매입금액구간종료
            $("#carlineCd").data("kendoExtDropDownList").enable(false); //차종
            $("#modelCd").data("kendoExtDropDownList").enable(false);            //차종
            $("#carDispQty").data("kendoExtNumericTextBox").enable(false); //배기량
            $("#manufactYyMmDt").data("kendoExtMaskedDatePicker").enable(false); //제조년월
            $("#vehicleInspecDt").data("kendoExtMaskedDatePicker").enable(false); //차량검증일자
            $("#vinNo").prop("disabled", "disabled").addClass("form_disabled"); //VIN NO
            $("#vinNo").data("kendoComboBox").enable(false);
            $("#pcDstinCd").data("kendoExtDropDownList").enable(false); //사용용도
            $("#carRunDistVal").data("kendoExtNumericTextBox").enable(false); //주행거리
            $("#fuelCd").data("kendoExtDropDownList").enable(false); //연료
            $("#drvMthCd").data("kendoExtDropDownList").enable(false); //구동방식
            //$("#exchAmt").data("kendoExtNumericTextBox").enable(false); //치환가격
            //$("#recomSaleAmt").data("kendoExtNumericTextBox").enable(false); //추천판매가격
            $("#retlDt").data("kendoExtMaskedDatePicker").enable(false); //소매일자
            $("#lastOwnerNm").prop("disabled", "disabled").addClass("form_disabled"); //최종소유자
            $("#noSaleYn").prop("disabled", "disabled").addClass("form_disabled"); //번호판여부
            $("#platNo").prop("disabled", "disabled").addClass("form_disabled"); //번호판번호
            $("#platAmt").data("kendoExtNumericTextBox").enable(false); //번호판가격
            $("#fceIncPrid").data("kendoExtMaskedDatePicker").enable(false); //교통사고강제보험 유효기간
            $("#carTaxPrid").data("kendoExtMaskedDatePicker").enable(false); //차배세유효기간
            $("#yyTestPrid").data("kendoExtMaskedDatePicker").enable(false); //년검사 유효기간
            $("#cmcIncPrid").data("kendoExtMaskedDatePicker").enable(false); //상업보험 유효기간
            //$("#evalPrsnNmView").prop("disabled", "disabled").addClass("form_disabled"); //평가사
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
            //$("#evalAmt").data("kendoExtNumericTextBox").enable(false); //평가가격
            $("#lastAmt").data("kendoExtNumericTextBox").enable(false); //최종판매가격
            //$("#carRegAmt").data("kendoExtNumericTextBox").enable(false); //번호판평가가격
            //$("#auctInfoButton").hide();
        }

        if(purcStatCd == ""){
            $("#btnVehicleEvalImageSub").data("kendoButton").enable(false);
        }else{
            $("#btnVehicleEvalImageSub").data("kendoButton").enable(true);
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
                    //vehiclePopupWindow();
                }
            }
        }
    });
/*
    $("#vinNo").bind("keydown",function(e){
        $(this).val($(this).val().toUpperCase());
    });
 */

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

                        if( data.vinNo == undefined ){

                            $.ajax({
                                url : "<c:url value='/crm/cif/customerInfo/customerListSearch.do'/>",
                                data : JSON.stringify({"lastIndex":1, "firstIndex":0, "sDlrCd":$("#dlrCd").val() , "sCustNo":data}),
                                type : "POST",
                                dataType : "json",
                                contentType : "application/json",
                                async : false,
                                error : function(jqXHR,status,error) {
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                },
                                success : function(result) {

                                    if (dms.string.isNotEmpty(result.data[0].custNo)) {
                                        $("#purcCustNm").val(result.data[0].custNm);
                                        $("#purcCustNo").val(result.data[0].custNo);
                                        $("#telNo1").val(result.data[0].hpNo);
                                    }
                                }
                            });
                            custInfoRegPopup.close();
                        }
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

        var custNm = $("#sCustNm").val()
           , autoBind = false;
         autoBind = dms.string.isNotEmpty(custNm)?true:false;

         popupWindow = dms.window.popup({
             windowId:"customerSearchPopupMain"
             , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
             , modal:true
             , content:{
                 url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                 , data:{
                     "autoBind":autoBind
                     , "custNm":custNm
                     , "closeYn":"Y"
                     , "type"  :null
                     , "callbackFunc":function(data){
                         if (data.length >= 1) {
                             if ( dms.string.isNotEmpty(data[0].custNo) ) {

                                 $("#sContractCustNo").val(data[0].custNo); // 고객코드
                                 $("#sContractCustNm").val(data[0].custNm); // 고객명
                                 $("#vContractCustNm").val(data[0].custNm); // 고객명

                             }

                         }
                     }
                 }
             }
         })
    };



  //그리드 설정
    $("#grid").kendoExtGrid({
        gridId : "G-SAL-2017-051917",
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

                        params["sVinNo"]          = $("#sVinNo").val(); // VIN NO
                        params["sPurcRegStartDt"] = $("#sPurcRegStartDt").data('kendoExtMaskedDatePicker').value(); // 매입등록일자-시작일
                        params["sPurcRegEndDt"]   = $("#sPurcRegEndDt").data('kendoExtMaskedDatePicker').value(); // 매입등록일자-종료일
                        params["sPlatNo"]         = $("#sPlatNo").val(); // 차량등록번호
                        params["sCarlineCd"]      = $("#sCarlineCd").val(); // 차종
                        params["sCarBrandCd"]     = $("#sCarBrandCd").val(); // 브랜드

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
                        carDispQty     : {type : "number"},
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
                        $("#btnSamplePrint").data("kendoButton").enable(false);
                        $("#purchaseCancel").data("kendoButton").enable(false);
                    } else if (selectedVal.purcStatCd == '02') {
                        $("#btnConfirm").data("kendoButton").enable(false);
                        $("#btnReject").data("kendoButton").enable(false);
                        $("#btnSave").data("kendoButton").enable(true);
                        $("#btnSamplePrint").data("kendoButton").enable(false);
                        $("#purchaseCancel").data("kendoButton").enable(false);
                    } else if (selectedVal.purcStatCd == '03') {
                        $("#btnConfirm").data("kendoButton").enable(true);
                        $("#btnReject").data("kendoButton").enable(true);
                        $("#btnSave").data("kendoButton").enable(false);
                        $("#btnSamplePrint").data("kendoButton").enable(false);
                        $("#purchaseCancel").data("kendoButton").enable(false);
                    } else if (selectedVal.purcStatCd == '04') {
                        $("#btnSamplePrint").data("kendoButton").enable(true);
                        $("#btnConfirm").data("kendoButton").enable(false);
                        $("#btnReject").data("kendoButton").enable(false);
                        $("#btnSave").data("kendoButton").enable(false);
                        $("#purchaseCancel").data("kendoButton").enable(true);
                    } else {
                        $("#btnConfirm").data("kendoButton").enable(false);
                        $("#btnReject").data("kendoButton").enable(false);
                        $("#btnSave").data("kendoButton").enable(false);
                        $("#btnSamplePrint").data("kendoButton").enable(false);
                        $("#purchaseCancel").data("kendoButton").enable(false);
                    }

                }
            }

        }
        /*,dataBinding : function(e) {
            kendo.bind($("#viewModel"), {"purcDs" : [ {"purcNo" : ""} ]});
        } */
        ,indvColumnVisible : true //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable : true //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip : true //Tooltip 적용, default:false
        ,resizable:true
        ,columns : [
                 {field : "purcNo",title : "<spring:message code='sal.lbl.documentNo' />", width:140, attributes:{"class":"ac"}}                          //매입번호
                ,{field : "purcCustNm",title : "<spring:message code='global.lbl.custNm' />", width:70, attributes:{"class":"al"}}                        //고객명
                ,{field : "vinNo",title : "<spring:message code = 'global.lbl.vinNo'/>", width:140, attributes : {"class":"al"}}                          //VIN NO
                ,{field : "carBrandCd",title : "<spring:message code='sal.lbl.oldVhBrand' />", width:80, attributes : {"class":"ac"},hidden:true}         //제조브랜드
                ,{field : "carBrandNm",title : "<spring:message code='sal.lbl.brandGudge' />", width:80, attributes : {"class":"ac"}}                     //제조브랜드명
                ,{field : "carDispQty",title : "<spring:message code='global.lbl.carDispQty' />",width:50, attributes:{"class":"ar"},format:"{0:n1}"}      //배기량
                ,{field : "carlineNm",title : "<spring:message code='global.lbl.carLine' />", width:80, attributes:{"class":"al"}}                         //차종
                ,{field : "modelNm",title : "<spring:message code='global.lbl.model' />", width:120, attributes:{"class":"al"}}                            //모델
                ,{field : "extColorNm",title : "<spring:message code='global.lbl.extColor' />", width:80, attributes:{"class":"al"}}                       //외장색
                ,{field : "platNo",title : "<spring:message code='global.lbl.carNo' />", width:80, attributes:{"class":"al"}}                              //차량번호
                //,{field : "evalAmt",title : "<spring:message code='sal.lbl.usrSbstAmt' />", width:80,attributes:{"class":"ar"},format : "{0:n2}"}          //평가금액
                //,{field : "evalAmtAll",title : "<spring:message code='sal.lbl.purcAmt' />(万)",width : 80,attributes : {"class" : "ac"}}                 //매입가격
                ,{field : "lastAmt",title : "<spring:message code='sal.lbl.buyAmt' />",width:80, attributes:{"class":"ar"},format:"{0:n2}"}                //구입가격
                ,{field : "purcTotAmt",title:"<spring:message code='sal.lbl.purcTotAmt' />", width:80, attributes:{"class":"ar"},format:"{0:n2}"}          //구매총금액
                ,{field : "saleAmt",title:"<spring:message code='sal.lbl.salePriceAmt' />", width:80, attributes:{"class":"ar"},format:"{0:n2}"}           //판매가격
                ,{field : "payTheDiff",title : "<spring:message code='sal.lbl.payTheDifference' />", width:80, attributes:{"class":"ar"},format : "{0:n2}"} //차액
                ,{field : "regDt",title : "<spring:message code='global.lbl.carRegDt' />", width:80, attributes:{"class":"ac"}
                    ,format : "{0:<dms:configValue code='dateFormat' />}"
                } //등록일자
                ,{field : "evalDt",title : "<spring:message code='global.lbl.evalScheDt' />", width:80, attributes:{"class":"ac"},
                    format : "{0:<dms:configValue code='dateFormat' />}"
                } //평가일자
                ,{field : "exchYn",title : "<spring:message code='sal.lbl.uatcCarPurc' />", width:50, attributes:{"class":"ac"}
                     ,template:"#= setUsedCarUsgeCdMap(exchYn)#"

                } //치환여부
                ,{field : "purcStatCd",title : "<spring:message code='global.lbl.statNm' />", width:70, attributes:{"class" : "ac"},
                    template : "# if(purcStatCdMap[purcStatCd] != null) { # #= purcStatCdMap[purcStatCd].cmmCdNm# # }#"
                } //상태
        ]
    });

  //상세팝업 - 고객조회
    purcCustPopupWindow = function() {

       if(!$($("#purcCustSearch")[0]).hasClass("form_search_disabled")){

            var custNm = $("#purcCustNm").val();

            popupWindow = dms.window.popup({
                windowId : "customerSearchPopupMain"
                ,title : "<spring:message code='global.title.custSearch' />" // 고객 조회
                ,height : "500px"
                ,width : "850px"
                ,content : {
                    url : "<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                   ,data : {
                        "autoBind" : true
                        ,"custNm" : custNm
                        ,"closeYn":"Y"
                        ,"type" : null
                        ,"callBackTp" : "BTN_CREATE"
                        ,"callbackFunc" : function(data) {

                            if (data.length >= 1) {

                                if (dms.string.isNotEmpty(data[0].custNo)) {
                                    $("#purcCustNm").val(data[0].custNm);
                                    $("#purcCustNo").val(data[0].custNo);
                                    $("#telNo1").val(data[0].hpNo);
                                    vinInfoSet();
                                }
                            }

                            if(data.callBackTp == "BTN_CREATE" ){
                                window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custReg' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoRegMain.do' />", "VIEW-D-10623");
                            }

                            /* if(data.callBackTp == "BTN_CREATE" ){
                                openCreateCust();
                            } */
                        }
                    }
                }
            });
        }
    };



  //고객별 VIN 조회
    vinInfoSet = function(){

/*   TMS0324C
 */
        var params = {
               "sCustNo":$("#purcCustNo").val()
       }
        $.ajax({
            url:"<c:url value='/sal/inc/incJoinInfo/selectCustContractNo.do' />",
            data:JSON.stringify(params),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function (result, textStatus){

                var vinDs = [];
                if(result.data.length > 0){

                    $.each(result.data , function(idx, obj){
                        if(obj.vinNo != null){
                            vinDs.push({"vinNo":obj.vinNo , "vinNm" : obj.vinNo });
                        }
                    });
                    if(vinDs.length > 0 ){
                        $("#vinNo").data("kendoComboBox").setDataSource(vinDs);
                        $("#vinNo").data("kendoComboBox").value(vinDs[0].vinNo);
                        $("#vinNo").data("kendoComboBox").text(vinDs[0].vinNm);
                        $("#vinNo").data("kendoComboBox").select(0);
                    }
                }



            }
        });

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
            //,height : 600
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
           // ,height:600
            ,width: 1230
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

    //중고차 이미지
    selectUsedCarPopupWindow = function() {

        popupEvCarWindow = dms.window.popup({
             windowId:"popupEvCarWindow"
            ,title:"<spring:message code = 'sal.lbl.vehicleEvalPic'/>" // 평가용 차량이미지
            ,draggable:true
            ,modal:true
            ,height:600
            ,width:1300
            ,content : {
                url : "<c:url value='/sal/usc/purcEval/selectUsedCarImage.do'/>",
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
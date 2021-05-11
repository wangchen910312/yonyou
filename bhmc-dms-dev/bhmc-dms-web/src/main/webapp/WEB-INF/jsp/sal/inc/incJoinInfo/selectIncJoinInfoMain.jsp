<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<!-- 보험가입정보관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.title.incJoinInfoMng" /></h1><!-- 보험가입정보 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-13085" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnPrint" type="button" class="btn_m btn_print"><spring:message code='global.btn.print' /><!-- 인쇄 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-13056" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnCustDiscMove" class="btn_m" ><spring:message code="sal.btn.custDiscMng" /></button>   <!-- 고객할인관리 -->
            </dms:access>
            <dms:access viewId="VIEW-D-13068" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnProcess" class="btn_m"><spring:message code='sal.btn.alram' /></button><!-- 알람버튼 -->
            </dms:access>
            <dms:access viewId="VIEW-D-13067" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-13066" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnReset" class="btn_m btn_new"><spring:message code='global.btn.new' /></button><!-- 신규 -->
            </dms:access>
            <dms:access viewId="VIEW-D-13065" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:20%;">
                <col style="width:8%;">
                <col style="width:20%;">
                <col style="width:8%;">
                <col style="width:20%;">
                <col style="width:7%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.incJoinDt' /></th><!-- 보험가입일 -->
                    <td cosplan="3">
                        <div class="date_left">
                            <input id="sIncJoinStartDt" data-type="maskDate" class="form_datetimepicker">
                            <span class="txt_from">~</span>
                        </div>
                        <div class="date_right">
                            <input id="sIncJoinEndDt" data-type="maskDate" class="form_datetimepicker">
                        </div>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.salesAdvisor' /></th><!-- 판매고문 -->
                    <td >
                        <input id="sSaleId" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.incStat' /></th>   <!-- 보험상태 -->
                    <td>
                        <input id="sIncStat" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.incCmp' /></th><!-- 보험회사 -->
                    <td >
                        <input id="sIncCmpCd" type="text" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.carSaleDt' /></th><!-- 차량판매일 -->
                    <td cosplan="3">
                        <div class="date_left">
                            <input id="sCarSaleStartDt" data-type="maskDate" class="form_datetimepicker">
                            <span class="txt_from">~</span>
                        </div>
                        <div class="date_right">
                            <input id="sCarSaleEndDt" data-type="maskDate" class="form_datetimepicker">
                        </div>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.custNm" /></th> <!-- 고객명 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="sCustNm" name="sCustNm" type="text" class="form_input" placeholder="<spring:message code='par.lbl.custNm' />" onchange="fnOnChange(this.id,this.value);" maxlength="30" />
                                    <a href="#;" class="custSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sCustNo" type="text" readonly class="form_input form_readonly">
                            </div>
                       </div>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.incEndDts' /></th><!-- 보험마감시간 -->
                    <td>
                        <div class="date_left">
                            <input id="sIncEndFromDt" data-type="maskDate" class="form_datetimepicker">
                            <span class="txt_from">~</span>
                        </div>
                        <div class="date_right">
                            <input id="sIncEndToDt" data-type="maskDate" class="form_datetimepicker">
                        </div>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.incTps' /></th>   <!-- 보험종류 -->
                    <td>
                        <input id="sIncCs" type="text" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.vinNo" /></th><!-- VIN NO -->
                    <td class="required_area">
                        <!-- <input id="sVinNo1" type="text" class="form_input" style="width:44%;"/>
                        <input id="sVinNo2" type="text" class="form_input" style="width:44%;"/> -->
                        <input id="sVinNo" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carNo' /></th>  <!-- 차량번호 -->
                    <td>
                        <input id="sCarRegNo" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.fincYn' /></th>   <!-- 대출여부 -->
                    <td><input id="sFincYn" type="text" class="form_comboBox" /></td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
            <button type="button" id="btnExcelExport" class="btn_s" ><spring:message code="global.btn.excelExport" /></button>   <!-- 엑셀다운로드 -->
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->

    <section id="incJoinWindow" class="pop_wrap">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='global.lbl.carLineInfo' /></h2><!-- 차량정보 -->
                <div class="btn_right">
                    <button id="popBtnPrint" type="button" class="btn_s"><spring:message code='global.btn.print' /><!-- 인쇄 --></button>
                    <button class="btn_s" id="btnCancel"><spring:message code="sal.btn.cancelBtn" /></button><!-- 퇴보 -->
                    <button class="btn_s" id="btnRemove"><spring:message code="global.btn.cancel" /></button><!-- 취소 -->
                    <button class="btn_s" id="btnComplete"><spring:message code="sal.btn.complete" /></button><!-- 완성 -->
                    <button class="btn_s" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                </div>
            </div>
                <div id="viewIncInfo">
                <form id="incDetailForm" name="incDetailForm" method="POST" action="/">
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:14%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col style="width:20%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.custNm" /></span></th> <!-- 고객명 -->
                                <td>
                                    <div class="form_float">
                                        <div class="form_left">
                                            <div class="form_search">
                                                <input id="custNm" name="custNm" type="text" class="form_input onKey_down" onchange="fnOnChange(this.id,this.value);" maxlength="30" data-bind="value:custNm" data-json-obj="true" />
                                                <a href="#;" class="custDtlSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                            </div>
                                        </div>
                                        <div class="form_right">
                                            <input id="custNo" name="custNo" readonly class="form_input form_readonly" data-bind="value:custNo" data-json-obj="true"/>
                                        </div>
                                   </div>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.custTp' /></th><!-- 고객유형 -->
                                <td>
                                    <input id="custTp" class="form_comboBox" data-bind="value:custTp"  />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.custTelNo' /></th><!-- 고객전화번호 -->
                                <td>
                                    <input id="custTelNo" name="custTelNo" readonly class="form_input form_readonly" data-bind="value:custTelNo" data-json-obj="true"/>
                                </td>
                            </tr>
                            <tr class="corpCar_01">
                                <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                                <td>
                                    <input id="carlineNm" name="carlineNm" readonly class="form_input form_readonly" data-bind="value:carlineNm"/>
                                    <input id="carlineCd" name="carlineCd" type="hidden" data-bind="value:carlineCd" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                                <td>
                                    <input id="fscNm" name="fscNm" readonly class="form_input form_readonly" data-bind="value:fscNm"/>
                                    <input id="fscCd" name="fscCd" type="hidden" data-bind="value:fscCd" data-json-obj="true"/>
                                    <input id="modelCd" name="modelCd" type="hidden" data-bind="value:modelCd" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.ocn' /></th><!-- OCN -->
                                <td>
                                    <input id="ocnNm" name="ocnNm" type="text" class="form_input form_readonly" data-bind="value:ocnNm" />
                                </td>
                            </tr>
                            <tr>
                                <th class="corpCar_01" scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                                <td class="corpCar_01">
                                    <input id="extColorNm" name="extColorNm" readonly class="form_input form_readonly" data-bind="value:extColorNm"/>
                                </td>
                                <th class="corpCar_01" scope="row"><spring:message code='global.lbl.intColor' /></th> <!-- 내장색 -->
                                <td class="corpCar_01">
                                    <input id="intColorNm" name="intColorNm" readonly class="form_input form_readonly" data-bind="value:intColorNm"/>
                                </td>

                                <th class="corpCar_02" scope="row" style="display:none;"><spring:message code='sal.lbl.brandNm' /></th><!-- 브랜드명 -->
                                <td class="corpCar_02" style="display:none;">
                                    <input id="carBrandNm" name="carBrandNm" readonly class="form_input form_readonly" data-bind="value:carBrandNm" data-json-obj="true"/>
                                    <input id="carBrandCd" name="carBrandCd" type="hidden" data-bind="value:carBrandCd" data-json-obj="true"/>
                                </td>
                                <th class="corpCar_02" scope="row" style="display:none;"><spring:message code='sal.lbl.modelNm' /></th> <!-- 모델명칭 -->
                                <td class="corpCar_02" style="display:none;">
                                    <input id="useCarNm" name="useCarNm" readonly class="form_input form_readonly" data-bind="value:useCarNm"/>
                                    <input type="hidden" id="useCarCd" name="useCarCd" data-bind="value:useCarCd" data-json-obj="true"/>
                                </td>

                                <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th><!-- VIN NO -->
                                <td>
                                    <input id="vinNo" name="vinNo" class="form_comboBox" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.carNo' /></th><!-- 차량번호 -->
                                <td>
                                    <input id="carRegNo" name="carRegNo" readonly class="form_input form_readonly" data-bind="value:carRegNo" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.enginNo' /></th><!-- 엔진번호 -->
                                <td>
                                    <input id="enginSerialNo" name="enginSerialNo" readonly class="form_input form_readonly" data-bind="value:enginSerialNo" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.cartNo' /></th><!-- 합격증 -->
                                <td>
                                    <input id="cartNo" name="cartNo" readonly class="form_input form_readonly" data-bind="value:cartNo" data-json-obj="true"/>
                                </td>
                            </tr>
                            <tr class="cCont" style="display:none">
                                <th scope="row"><spring:message code='global.lbl.contractNo' /></th><!-- 계약번호 -->
                                <td>
                                    <input id="contractNo"  name="contractNo" readonly class="form_input form_readonly" data-bind="value:contractNo" data-json-obj="true"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            <!-- //차량정보 탭 영역 -->


            <div class="header_area">
                <h2 class="title_basic"><spring:message code='sal.title.incReqInfo' /></h2><!-- 보험신청내용 -->
            </div>

            <!-- 보험신청정보 탭 영역 -->
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:14%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col style="width:20%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.incNo' /></th><!-- 보험번호 -->
                                <td>
                                    <input id="incNo" name="incNo" readonly class="form_input form_readonly" data-bind="value:incNo" data-json-obj="true">
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.incTps' /></span></th><!-- 보험종류 -->
                                <td>
                                    <input id="incCs" name="incCs" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.finImplyYn' /></th><!-- 재무수납여부 -->
                                <td>
                                    <input type="checkbox" id="finImplyYn" checked class="form_check" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.incRcptNm' /></th><!-- 보험영수증명칭-->
                                <td>
                                    <input id="incRcptNm" name="incRcptNm" class="form_input" data-bind="value:incRcptNm" data-json-obj="true">
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.incCmp' /></span></th><!-- 보험회사 -->
                                <td>
                                    <input id="incCmpCd" name="incCmpCd" class="form_comboBox" data-bind="value:incCmpCd" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.incJoinDt' /></th><!-- 보험가입일자 -->
                                <td>
                                    <input id="incJoinDt" name="incJoinDt" class="form_datepicker" data-bind="value:incJoinDt" data-json-obj="true">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.custSsnCrnNo' /></th><!-- 被保险人身份证号码/组织机构代码 -->
                                <td >
                                    <input id="custSsnCrnNo" name="custSsnCrnNo" class="form_input" data-bind="value:custSsnCrnNo" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.insured' /></th><!-- 피보험자 -->
                                <td>
                                    <input id="incCustNm" name="incCustNm" class="form_input"  data-bind="value:incCustNm"  data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.incTelNo' /></th><!-- 피보험자연락처 -->
                                <td >
                                    <input id="incCustTelNo" name="incCustTelNo" class="form_input" data-bind="value:incCustTelNo" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.incProfitNm' /></th><!-- 제1수익자-->
                                <td >
                                    <input id="incProfitNm" name="incProfitNm" class="form_input" data-bind="value:incProfitNm" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.relCustInfo' /></th><!-- 연계인 -->
                                <td>
                                    <input id="incPconCustNm" name="incPconCustNm" class="form_input" data-bind="value:incPconCustNm" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.saleEmpTel' /></th>   <!-- 연계인 전화번호 -->
                                <td><input id="incPconCustTelNo" name="incPconCustTelNo" type="text" class="form_input" maxlength="13" data-bind="value:incPconCustTelNo" data-json-obj="true" /></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.incPerson' /></th><!-- 보험담당자 -->
                                <td>
                                    <input id="incPrsnNm" name="incPrsnNm" readonly class="form_input form_readonly" data-bind="value:incPrsnNm">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.fincYn' /></th><!-- 대출여부 -->
                                <td><input id="fincYn" name="fincYn" class="form_comboBox" data-bind="value:fincYn" data-json-obj="true" /></td>
                                <th scope="row"><spring:message code='global.lbl.fincCmp' /></th><!-- 금융회사 -->
                                <td><input id="fincCmpCd" name="fincCmpCd" class="form_comboBox" data-bind="value:fincCmpCd" data-json-obj="true" /></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.frcIncAmt' /></th><!-- 강제보험금액 -->
                                <td>
                                    <input id="frcIncAmt" name="frcIncAmt" class="form_numeric ar" data-bind="value:frcIncAmt" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.busIncAmt' /></th><!-- 상업보험금액 -->
                                <td>
                                    <input id="busIncAmt" name="busIncAmt" class="form_numeric ar" data-bind="value:busIncAmt" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.transTaxAmt' /></th><!-- 차량선박세 -->
                                <td>
                                    <input id="transTaxAmt" name="transTaxAmt" class="form_numeric ar" data-bind="value:transTaxAmt" data-json-obj="true">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            <!-- //보험신청정보 탭 영역 -->

            <span style="display:none">
                <!-- 타사/자사 차량 여부 -->
                <input id="ncarDstinCd" name="ncarDstinCd" data-bind="value:ncarDstinCd" data-json-obj="true" />
                <!-- 보험처리상태 -->
                <input id="incStat" name="incStat" data-bind="value:incStat"/>
                <!-- 저장 후 조회용 key -->
                <input id="savedIncNo" value="" />
                <!-- 계약:총금액 포함여부 -->
                <input id="implyYn" name="implyYn" value="N" data-bind="value:implyYn" data-json-obj="true" />
                <!-- 계약:비고 -->
                <input id="remark" name="remark" data-bind="value:remark" data-json-obj="true">
            </span>
            </form>
            </div>

            <!-- 보험신청명세 탭 영역 -->
            <!--
            <div class="header_area">
                <h2 class="title_basic">保险申请明细</h2>보험신청명세
            </div>
            -->

            <div class="header_area">
                <div class="left_area" >
                    <ul class="txt_input">
                        <li>
                            <span class="span_bg" ><spring:message code='sal.lbl.incExpcTotAmt' /></span> <!-- 保险预计总额 -->
                            <input id="incExpcTotAmt" name="incExpcTotAmt" class="form_numeric" style="width:120px" data-bind="value:incExpcTotAmt" />
                        </li>
                        <li>
                            <span class="span_bg" ><spring:message code='sal.lbl.incFeeAmt' /></span> <!-- 保险手续费 -->
                            <input id="incFeeTotAmt" name="incFeeTotAmt" class="form_numeric" style="width:120px" data-bind="value:incFeeTotAmt" />
                        </li>
                        <li>
                            <span class="span_bg" ><spring:message code='sal.lbl.realIncTotAmt' /></span> <!-- 保险实际总额 -->
                            <input id="realIncTotAmt" name="realIncTotAmt" class="form_numeric" style="width:120px" data-bind="value:realIncTotAmt" />
                        </li>
                    </ul>
                </div>
                <div class="btn_right">
                    <button class="btn_s" id="btnIncAllChange"><spring:message code='sal.btn.incAllChange' /></button>        <!-- 일괄변경 -->
                    <button class="btn_s btn_add" id="btnIncDtlAdd"><spring:message code='global.btn.rowAdd' /></button>          <!-- 행추가 -->
                    <button class="btn_s btn_delete" id="btnIncDtlDel"><spring:message code='global.btn.rowDel' /></button>       <!-- 행삭제 -->
                    <button class="btn_s btn_cancel" id="btnIncDtlCancel"><spring:message code='global.btn.cancel' /></button>    <!-- 취소 -->
                </div>
            </div>
            <div class="table_grid mt10">
                <div id="incDtlGrid" class="grid"></div>
            </div>
            <!-- 보험신청명세 탭 영역  -->
    </section>
</section>
</div>

<!-- #스크립트 영역# -->
<script type="text/javascript">
<!--
var dlrCd = "${dlrCd}";                 // 딜러코드
var userId = "${userId}";
var userNm = "${userNm}";

var oneDay = "${oneDay}";               // 당월 1일
var toDay = "${toDay}";                 // 오늘 일자
var nextYearDay = "${nextYearDay}";     // 내년 오늘일자
var selectTabId;
var carSaleDt;
var incNo;
var resetVal = false;


//보험회사 Array
var incCmpCd = [];
<c:forEach var="obj" items="${incCmpCdList}">
    incCmpCd.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//회사차구분 Map
var incCmpCdMap = dms.data.arrayToMap(incCmpCd, function(obj){ return obj.cmmCd; });


//보험종류(대행구분) Array
var regTp = [];
<c:forEach var="obj" items="${regTpList}">
    regTp.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//보험종류(대행구분) Map
var regTpMap = dms.data.arrayToMap(regTp, function(obj){ return obj.cmmCd; });


//보험유형 Array
var incTpDs = [];
<c:forEach var="obj" items="${incTpList}">
    incTpDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//보험유형 Map
var incTpMap = dms.data.arrayToMap(incTpDs, function(obj){ return obj.cmmCd; });

//3자보험유형
var threeIncTpAmtDs = [];
var threeIncTpAmtObj = {};
<c:forEach var="obj" items="${threeIncTpAmtList}">
    threeIncTpAmtDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    threeIncTpAmtObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//보험종류
var incCSDS = [];
<c:forEach var="obj" items="${incCSList}">
    incCSDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//보험종류 Map
var incCSMap = dms.data.arrayToMap(incCSDS, function(obj){ return obj.cmmCd; });

//보험상태 SAL177
var incStatDS = [];
<c:forEach var="obj" items="${incStatList}">
    incStatDS.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//고객유형 Array
var custTpDs = [];
<c:forEach var="obj" items="${custTpList}">
    custTpDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//고객유형 Map
var custTpMap = dms.data.arrayToMap(custTpDs, function(obj){ return obj.cmmCd; });

//대출여부
var loanYnList = [];
var loanYnObj = {"Y":"分期", "N":"不分期"};
loanYnList.push({"cmmCd":"Y", "cmmCdNm":"分期", "useYn":"Y"});
loanYnList.push({"cmmCd":"N", "cmmCdNm":"不分期", "useYn":"Y"});

//금융사:SAL055
var fincCmpList = [];
var fincCmpObj = {};
fincCmpList.push({"cmmCd":"BHAF", "cmmCdNm":"北现金融", "useYn":"Y"});
<c:forEach var="obj" items="${fincCmpCdDS}">
    fincCmpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var fincCmpObj = dms.data.arrayToMap(fincCmpList, function(obj){return obj.cmmCd});

//완성or저장
save = function(typeFlag) {
    var grid = $("#grid").data('kendoExtGrid');
    var selectRow = grid.dataItem(grid.select());

    if(grid.select().index() == -1){
        dlrCd = dlrCd;
        incNo = "";
    }else {
        dlrCd = selectRow.dlrCd;
        incNo = selectRow.incNo;
    }

    var incGrid = $("#incDtlGrid").data("kendoExtGrid");
    var incRows = incGrid.tbody.find("tr")
      , insertList = [];
    incRows.each(function(index, row) {
        var row = incGrid.dataItem(row);
        insertList.push(row);
    });

    //var saveData = incDtlGrid.getCUDData("insertList", "updateList", "deleteList");
    var saveData = {"insertList":insertList};

    // form 데이터 및 그리드 변경 데이터 세팅
    var param = $.extend(
       {"incJoinInfoVO":$("#incDetailForm").serializeObject($("#incDetailForm").serializeArrayInSelector("[data-json-obj='true']"))}
       ,{"incDtlVO":saveData}
    );

    if( $("#custNm").val() == ""){
        // {고객}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='global.lbl.customer' var='globalLblCustomer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCustomer}' />");
        $("#custNm").focus();
        return false;
    }
    if( $("#custNo").val() == ""){
        // {고객}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='global.lbl.customer' var='globalLblCustomer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCustomer}' />");
        $("#custNm").focus();
        return false;
    }
    if(dms.string.isEmpty($("#custTp").data("kendoExtDropDownList").value())){
        // {고객유형}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='global.lbl.custTp' var='globalLblCustTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCustTp}' />");
        $("#custTp").focus();
        return false;
    }
    if(dms.string.isEmpty($("#incCs").data("kendoExtDropDownList").value())){
        // {보험종류}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='sal.lbl.incTps' var='salLblIncTps' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblIncTps}' />");
        $("#incCs").focus();
        return false;
    }

    if(dms.string.isEmpty($("#incCmpCd").data("kendoExtDropDownList").value())){
        // {보험회사}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='global.lbl.incCmp' var='globalLblIncCmp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblIncCmp}' />");
        $("#incCmpCd").focus();
        return false;
    }

    if(incRows.length < 1){
        //목록을 선택하여 주십시오.
        dms.notification.info("<spring:message code='global.info.required.select'/>");
        return fasle;
    }

    param.incJoinInfoVO.incJoinDt = $("#incJoinDt").data("kendoExtMaskedDatePicker").value();
    param.incJoinInfoVO.dlrCd = dlrCd;
    param.incJoinInfoVO.incNo = incNo;
    param.incJoinInfoVO.incExpcTotAmt = $("#incExpcTotAmt").val();
    param.incJoinInfoVO.incFeeTotAmt = $("#incFeeTotAmt").val();
    param.incJoinInfoVO.realIncTotAmt = $("#realIncTotAmt").val();
    param.incJoinInfoVO.frcIncAmt = $("#frcIncAmt").data("kendoExtNumericTextBox").value();
    param.incJoinInfoVO.busIncAmt = $("#busIncAmt").data("kendoExtNumericTextBox").value();
    param.incJoinInfoVO.transTaxAmt = $("#transTaxAmt").data("kendoExtNumericTextBox").value();
    param.incJoinInfoVO.vinNo = dms.string.strNvl($("#vinNo").data("kendoExtDropDownList").value());
    param.incJoinInfoVO.contractNo = $("#contractNo").val();
    param.incJoinInfoVO.custTp = $("#custTp").data("kendoExtDropDownList").value();
    param.incJoinInfoVO.incCs = $("#incCs").data("kendoExtDropDownList").value();
    param.incJoinInfoVO.finImplyYn = $("#finImplyYn").prop('checked')==true?"Y":"N";
    param.incJoinInfoVO.fincYn = $("#fincYn").data("kendoExtDropDownList").value();
    param.incJoinInfoVO.fincCmpCd = $("#fincCmpCd").data("kendoExtDropDownList").value();

    param.incJoinInfoVO.incStat = typeFlag;

    // 완성버튼 메시지
    var btnMsg = "<spring:message code='global.lbl.save' var='save' /><spring:message code='global.info.andMsg' arguments='${save}' />"
      , btnTitle = "<spring:message code='global.btn.save' />";
    if(typeFlag === "20"){
        btnMsg = "<spring:message code='sal.btn.complete' var='salBtnComplete' /><spring:message code='global.info.andMsg' arguments='${salBtnComplete}' />";
        btnTitle = "<spring:message code='sal.btn.complete' />";
    }

    dms.window.confirm({
        message:btnMsg
        ,title :btnTitle
        ,callback:function(result){
            if(result){
                $.ajax({
                    url:"<c:url value='/sal/inc/incJoinInfo/multiSaveIncJoinInfo.do' />"
                    ,data:JSON.stringify(param)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(request,status,error){
                        dms.notification.error(request.responseJSON.errors[0].errorMessage);
                    }
                }).done(function(result) {
                    var grid = $("#grid").data("kendoExtGrid");

                    reSearch(result.incNo);        // 조회조건 세팅
                    grid.dataSource.page(1);

                    /*
                    if(typeFlag == "20"){    //완성일때만 팝업을 닫는다.
                        fnReset();
                        $("#incJoinWindow").data("kendoWindow").close();
                    }else{
                        fnReset();
                        viewDetail(result);
                    }
                    */

                    fnReset();
                    $("#incJoinWindow").data("kendoWindow").close();

                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                });

            }else{
                return false;
            }
        }
    });

}

// 퇴보, 취소
updateSate = function(stat){
    var param = {};
    param.incNo = $("#incNo").val();
    param.contractNo = $("#contractNo").val();
    param.finImplyYn = $("#finImplyYn").prop('checked')==true?"Y":"N";
    param.incStat = stat;

    $.ajax({
        url:"<c:url value='/sal/inc/incJoinInfo/updateSateIncJoinInfo.do' />",
        data:JSON.stringify(param),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        async:false,
        error:function(jqXHR,status,error) {
            dms.notification.error(error);
        },
        success:function(jqXHR, textStatus) {

            var grid = $("#grid").data("kendoExtGrid");
            reSearch(jqXHR.incNo);        // 조회조건 세팅
            grid.dataSource.page(1);

            fnReset();
            $("#incJoinWindow").data("kendoWindow").close();
            //정상적으로 반영 되었습니다.
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
    });
}


$(document).ready(function() {

     $("#incJoinWindow").kendoWindow({
         animation:false
         ,draggable:true
         ,modal:false
         ,resizable:false
         ,visible:false
         ,title:"<spring:message code='sal.lbl.detailSearch' />"      // 상세조회
         ,width:"950px"
         ,height:"500px"
     }).data("kendoWindow");

     //보험회사
     $("#sIncCmpCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:incCmpCd
         ,optionLabel:" "   // 전체
     });

    //조회조건 - 보험가입일자(기간)- START
    $("#sIncJoinStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:oneDay
    });

    //조회조건 - 보험가입일자(기간)- END
    $("#sIncJoinEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:toDay
    });

    //조회조건  - 차량판매일(기간)- START
    $("#sCarSaleStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:oneDay
    });

    //조회조건 - 차량판매일(기간)- END
    $("#sCarSaleEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:toDay
    });

    //조회조건  - 보험마감시간(기간)- START
    $("#sIncEndFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //조회조건 - 보험마감시간(기간)- END
    $("#sIncEndToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //보험종류
    $("#sIncCs").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(incCSDS)
       ,optionLabel:" "
    });

    //보험상태
    $("#sIncStat").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(incStatDS)
       ,optionLabel:" "
    });

    //대출여부
    $("#sFincYn").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(loanYnList)
       ,optionLabel:" "
    });
    /*************************** 검색 조건 영역 END **************************************************/

    //보험가입일자
    $("#incJoinDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    //차량번호등록일자
    $("#carRegDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //차량판매일자
    $("#carSaleDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //보험회사
    $("#incCmpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:incCmpCd
        ,optionLabel:" "   // 전체
    });

    //고객유형
    $("#custTp").kendoExtDropDownList({
         dataTextField  :"cmmCdNm"
        ,dataValueField :"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(custTpDs)
        ,optionLabel:" "
    });
    $("#custTp").data("kendoExtDropDownList").enable(false);

    //vinNo
    $("#vinNo").kendoExtDropDownList({
        dataTextField:"vinNo"
        ,dataValueField:"vinNo"
        //,dataSource:""
        ,optionLabel:""   // 전체
        ,select:function(e){
            var dataItem = this.dataItem(e.item);

            if(custTpMap[dataItem.custTp] != null){
                $("#custTp").data("kendoExtDropDownList").value(dataItem.custTp);
            }else{
                $("#custTp").data("kendoExtDropDownList").value("");
            }
            $("#custTelNo").val(dataItem.custTelNo);
            $("#contractNo").val(dataItem.contractNo);
            $("#carlineCd").val(dataItem.carlineCd);
            $("#carlineNm").val(dataItem.carlineNm);
            $("#modelCd").val(dataItem.modelCd);
            $("#fscCd").val(dataItem.fscCd);
            $("#fscNm").val(dataItem.fscNm);
            $("#ocnNm").val(dataItem.ocnNm);
            $("#extColorNm").val(dataItem.extColorNm);
            $("#intColorNm").val(dataItem.intColorNm);
            $("#enginSerialNo").val(dataItem.enginSerialNo);
            $("#cartNo").val(dataItem.cartNo);
            $("#carRegNo").val(dataItem.carRegNo);

            $("#useCarNm").val(dataItem.useCarNm);
            $("#carBrandCd").val(dataItem.carBrandCd);
            $("#carBrandNm").val(dataItem.carBrandNm);
            $("#ncarDstinCd").val(dataItem.ncarDstinCd);

            //if(dms.string.isEmpty(dataItem.contractNo)){
            if(dms.string.strNvl(dataItem.ncarDstinCd) == "O"){
                $(".corpCar_01").hide();
                $(".corpCar_02").show();
                //$(".cCont").hide();
            }else{
                $(".corpCar_01").show();
                $(".corpCar_02").hide();
                //$(".cCont").show();
            }

            //if(dms.string.isNotEmpty(dataItem.contractNo)){
            //    $("#incCs").data("kendoExtDropDownList").value("01");
            //    $("#incCs").data("kendoExtDropDownList").enable(false);
            //    $("#finImplyYn").prop('checked', false);
            //    $("#finImplyYn").attr("disabled", true);
            //}else{
                $("#incCs").data("kendoExtDropDownList").value("01");
                $("#incCs").data("kendoExtDropDownList").enable(true);
                $("#finImplyYn").attr("disabled", false);
            //}

        }
    });

    //보험종류
    $("#incCs").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(incCSDS)
       //,index:0
       ,value:"02"  //속보험
    });

    //대출여부
    $("#fincYn").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(loanYnList)
       ,optionLabel:" "   // 전체
    });

    //금융사
    $("#fincCmpCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:fincCmpList
       ,optionLabel:" "   // 전체
    });

    //保险预计总额
    $("#incExpcTotAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });


    //保险手续费
    $("#incFeeTotAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });

    //保险实际总额
    $("#realIncTotAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });

    $("#incExpcTotAmt").data("kendoExtNumericTextBox").enable(false);
    $("#realIncTotAmt").data("kendoExtNumericTextBox").enable(false);

    //강제보험금액
    $("#frcIncAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    //상업보험금액
    $("#busIncAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    //차량선박세
    $("#transTaxAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    /*************************** 보험정보 영역 END **************************************************/
    // 상세정보
    $("#btnViewDetail").kendoButton({
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            if ( dms.string.isNotEmpty(selectedItem) ){
                viewPopup();   // 팝업오픈;
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
           , selectedItem = grid.dataItem(grid.select());

         if ( dms.string.isNotEmpty(selectedItem) ){
             viewPopup();   // 팝업오픈;
             viewDetail(selectedItem);
         } else {
             // {상세정보}을(를) 확인하여 주세요.
             dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
             return;
         }

     });

    //인쇄
    $("#btnPrint").kendoButton({
        click:function(e){
            var grid = $('#grid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            if(dms.string.isNotEmpty(selectedItem) && dms.string.isNotEmpty(selectedItem.incNo)) {
                parent._createOrReloadTabMenu("<spring:message code='sal.title.insuranceSettlementDoc'/>", "<c:url value='/ReportServer?reportlet=sale/selectInsuranceSettlementDoc.cpt'/>&sDlrCd="+selectedItem.dlrCd+"&sIncNo="+selectedItem.incNo);
            } else {
                // {보험}을(를) 선택해주세요.
                dms.notification.warning("<spring:message code='sal.title.incInfo' var='arg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arg}' />");
            };
        }
    });


    //인쇄 popup
    $("#popBtnPrint").kendoButton({
        click:function(e){
            var incNO = $("#incNo").val();
            console.log("incNO = "+ incNO + "dlrCd  = "+ dlrCd);
            if(dms.string.isNotEmpty(incNO)) {
                console.log("incNO = "+ incNO);
                parent._createOrReloadTabMenu("<spring:message code='sal.title.insuranceSettlementDoc'/>", "<c:url value='/ReportServer?reportlet=sale/selectInsuranceSettlementDoc.cpt'/>&sDlrCd="+dlrCd+"&sIncNo="+incNO);
            } else {
                // {보험}을(를) 선택해주세요.
                dms.notification.warning("<spring:message code='sal.title.incInfo' var='arg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arg}' />");
            };
        }
    });

     // 상세조회 후 팝업오픈
     viewDetail = function(selectedVal){

         if( dms.string.isNotEmpty(selectedVal) ){

             $.ajax({
                 url:"<c:url value='/sal/inc/incJoinInfo/selectIncDetail.do' />",
                 data:JSON.stringify({sDlrCd:selectedVal.dlrCd, sIncNo:selectedVal.incNo}),
                 type:"POST",
                 dataType:"json",
                 contentType:"application/json",
                 error:function(jqXHR,status,error){
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 }

             }).done(function(result) {
                 var incDetailDs = result["incDetailDs"];
                 kendo.bind($("#viewIncInfo"), incDetailDs);

                 if(incDetailDs.ncarDstinCd == "O"){
                     $(".corpCar_01").hide();
                     $(".corpCar_02").show();
                 }else{
                     $(".corpCar_01").show();
                     $(".corpCar_02").hide();
                 }

                 if(dms.string.isNotEmpty(incDetailDs.contractNo)){
                     $(".cCont").show();
                 }else{
                     $(".cCont").hide();
                 }

                 $("#incCs").data("kendoExtDropDownList").value(incDetailDs.incCs);
                 if(dms.string.isNotEmpty(incDetailDs.contractNo)){
                     $("#incCs").data("kendoExtDropDownList").enable(false);
                     $("#finImplyYn").attr("disabled", false);
                     $("#finImplyYn").prop('checked', false);
                     $("#finImplyYn").attr("disabled", true);
                     $("#fincYn").data("kendoExtDropDownList").enable(false);
                     $("#fincCmpCd").data("kendoExtDropDownList").enable(false);
                 }else{
                     $("#incCs").data("kendoExtDropDownList").enable(true);
                     $("#finImplyYn").attr("disabled", false);
                     $("#finImplyYn").prop('checked', incDetailDs.finImplyYn=="Y"?true:false);
                     $("#fincYn").data("kendoExtDropDownList").enable(true);
                     $("#fincCmpCd").data("kendoExtDropDownList").enable(true);
                 }

                 $("#frcIncAmt").data("kendoExtNumericTextBox").value(incDetailDs.frcIncAmt);
                 $("#busIncAmt").data("kendoExtNumericTextBox").value(incDetailDs.busIncAmt);
                 $("#transTaxAmt").data("kendoExtNumericTextBox").value(incDetailDs.transTaxAmt);
                 $("#incExpcTotAmt").data("kendoExtNumericTextBox").value(incDetailDs.incExpcTotAmt);
                 $("#incFeeTotAmt").data("kendoExtNumericTextBox").value(incDetailDs.incFeeTotAmt);
                 $("#realIncTotAmt").data("kendoExtNumericTextBox").value(incDetailDs.realIncTotAmt);
                 if(incDetailDs.vinNo == null){
                     $("#vinNo").data("kendoExtDropDownList").setDataSource([]);        //계약번호 dataSet
                 }else {
                     $("#vinNo").data("kendoExtDropDownList").setDataSource([{"vinNo":dms.string.strNvl(incDetailDs.vinNo), "vinNo":dms.string.strNvl(incDetailDs.vinNo)}]);        //계약번호 dataSet
                 }

                 $("#vinNo").data("kendoExtDropDownList").value(dms.string.strNvl(incDetailDs.vinNo));
                 $("#vinNo").data("kendoExtDropDownList").enable(false);
                 $("#custNm").prop("readonly","readonly").addClass("form_readonly");
                 $(".custDtlSearch").prop("disabled","disabled").addClass("form_disabled");

                 fn_btnState(incDetailDs.incStat);

                 $("#incDtlGrid").data("kendoExtGrid").dataSource.read();
             });


         } else {
             // {상세정보}을(를) 확인하여 주세요.
             dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
             return;
         }


     }

    //초기화
    $("#btnReset").kendoButton({
        click:function(e){
            fnReset();
            fn_btnState();
            viewPopup();

            var grid = $("#grid").data("kendoExtGrid");
            grid.clearSelection();
        }

    });


    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){

            var sFromDt = $("#sIncJoinStartDt").data("kendoExtMaskedDatePicker").value();
            var sToDt = $("#sIncJoinEndDt").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(sFromDt, sToDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sIncJoinStartDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(sToDt, sFromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sIncJoinEndDt").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(sFromDt, sToDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sIncJoinEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sIncJoinEndDt").focus();
               return false;
            }

            var cFromDt = $("#sCarSaleStartDt").data("kendoExtMaskedDatePicker").value();
            var cToDt = $("#sCarSaleEndDt").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(cFromDt, cToDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sCarSaleStartDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(cToDt, cFromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sCarSaleEndDt").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(cFromDt, cToDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sCarSaleEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sCarSaleEndDt").focus();
               return false;
            }

            var eFromDt = $("#sIncEndFromDt").data("kendoExtMaskedDatePicker").value();
            var eToDt = $("#sIncEndToDt").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(eFromDt, eToDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sIncEndFromDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(eToDt, eFromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sIncEndToDt").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(eFromDt, eToDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sIncEndToDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sIncEndToDt").focus();
               return false;
            }


            fnReset();
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼-알람
    $("#btnProcess").kendoButton({
        click:function(e) {
            if($("#grid").data("kendoExtGrid").select().length < 1){
                //목록을 1건만 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.title.list' var='globalTitleList' /><spring:message code='global.info.isSelectChk' arguments='${globalTitleList}, 1' />");
                return;
            }

            var grid = $("#grid").data("kendoExtGrid");
            var item = grid.dataItem(grid.select());
            popupWindow = dms.window.popup({
               windowId:"selectIncJoinProcessPopup"
               , width:"950px"
               , height:"278px"
               , title:"提醒按钮"    // 提醒按钮
               , content:{
                   url:"<c:url value='/sal/inc/incJoinInfo/selectIncProcessPopup.do' />"
                   , data:{
                       "autoBind":true
                       , "sIncNo":item.incNo
                       , "sDlrCd":item.dlrCd
                       , "callbackFunc":function(data) {
                           if(typeof(data) == "undefined" ){
                               //목록을 1건만 선택하여 주십시오.
                               dms.notification.info("<spring:message code='global.title.list' var='globalTitleList' /><spring:message code='global.info.isSelectChk' arguments='${globalTitleList}, 1' />");
                              $("#btnSearch").click();
                              //popupWindow.close();
                           }
                       }
                   }
               }

            });
        }
    });

    //버튼 - 고객할인관리
    $("#btnCustDiscMove").kendoButton({
        click:function(e) {
            window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custCouponMng' />", "<c:url value='/crm/cif/customerCouponInfo/selectCustCouponMain.do' />", "VIEW-D-10716");
        }
    });

    //버튼 - 엑셀다운로드
    $("#btnExcelExport").kendoButton({
        click:function(e) {
            var sFromDt = $("#sIncJoinStartDt").data("kendoExtMaskedDatePicker").value();
            var sToDt = $("#sIncJoinEndDt").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(sFromDt, sToDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sIncJoinStartDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(sToDt, sFromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sIncJoinEndDt").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(sFromDt, sToDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sIncJoinEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sIncJoinEndDt").focus();
               return false;
            }

            var cFromDt = $("#sCarSaleStartDt").data("kendoExtMaskedDatePicker").value();
            var cToDt = $("#sCarSaleEndDt").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(cFromDt, cToDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sCarSaleStartDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(cToDt, cFromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sCarSaleEndDt").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(cFromDt, cToDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sCarSaleEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sCarSaleEndDt").focus();
               return false;
            }

            var eFromDt = $("#sIncEndFromDt").data("kendoExtMaskedDatePicker").value();
            var eToDt = $("#sIncEndToDt").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(eFromDt, eToDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sIncEndFromDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(eToDt, eFromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sIncEndToDt").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(eFromDt, eToDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sIncEndToDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sIncEndToDt").focus();
               return false;
            }


            dms.ajax.excelExport({
                "beanName":"incJoinInfoService"
                ,"templateFile":"IncJoinInfo_Tpl.xlsx"
                ,"fileName":"DownloadExcel.xlsx"
                ,"sIncJoinStartDt":dms.string.strNvl(setKendoDate($("#sIncJoinStartDt").data("kendoExtMaskedDatePicker").value()))
                ,"sIncJoinEndDt"  :dms.string.strNvl(setKendoDate($("#sIncJoinEndDt").data("kendoExtMaskedDatePicker").value()))
                ,"sCarSaleStartDt":dms.string.strNvl(setKendoDate($("#sCarSaleStartDt").data("kendoExtMaskedDatePicker").value()))
                ,"sCarSaleEndDt"  :dms.string.strNvl(setKendoDate($("#sCarSaleEndDt").data("kendoExtMaskedDatePicker").value()))
                ,"sVinNo"         :$("#sVinNo").val()
                ,"sCustNo"        :$("#sCustNo").val()
                ,"sCustNm"        :$("#sCustNm").val()
                //,"sContractNo"  :$("#sContractNo").val()
                ,"sIncCs"         :$("#sIncCs").data("kendoExtDropDownList").value()
                ,"sIncCmpCd"       :$("#sIncCmpCd").data("kendoExtDropDownList").value() // E20032500003  保险信息注册，查询条件选保险公司，但是查询结果不受保险公司控制，仍然筛选出所有保险公司  贾明  2020-5-14
                ,"sIncStat"       :$("#sIncStat").data("kendoExtDropDownList").value()
                ,"sCarRegNo"      :$("#sCarRegNo").val()
                ,"sIncEndFromDt"  :dms.string.strNvl(setKendoDate($("#sIncEndFromDt").data("kendoExtMaskedDatePicker").value()))
                ,"sIncEndToDt"    :dms.string.strNvl(setKendoDate($("#sIncEndToDt").data("kendoExtMaskedDatePicker").value()))
                ,"sFincYn"        :$("#sFincYn").data("kendoExtDropDownList").value()
            });
        }
    });
    setKendoDate = function(dtValue){
        return kendo.toString(kendo.parseDate(dtValue),"<dms:configValue code='dateFormat' />");
    };

    // 일괄변경
    $("#btnIncAllChange").kendoButton({
        click:function(e){
            var grid = $("#incDtlGrid").data("kendoExtGrid");
            var rows = grid.tbody.find("tr");

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            var dItem = grid.dataItem(rows[0]);
            rows.each(function(index, row){
                var dataSourceRow = grid.dataSource.getByUid(row.attributes["data-uid"].nodeValue);
                //dataSourceRow.set("incTp", dms.string.strNvl(dItem.incTp));

                //dataSourceRow.set("incExpcAmt", dms.string.strNvl(dItem.incExpcAmt));
                //dataSourceRow.set("realIncAmt", dms.string.strNvl(dItem.realIncAmt));
                dataSourceRow.set("incPrid", dms.string.strNvl(dItem.incPrid));
                dataSourceRow.set("incStartDt", dms.string.strNvl(dItem.incStartDt));
                dataSourceRow.set("incEndDt", dms.string.strNvl(dItem.incEndDt));
                //dataSourceRow.set("incAmt", dms.string.strNvl(dItem.incAmt));
                dataSourceRow.set("remark", dms.string.strNvl(dItem.remark));
                dataSourceRow.set("dirty", true);
            });
        }
    });

    //보험신청명세 - 추가
    $("#btnIncDtlAdd").kendoButton({
        click:function(e) {
            selectIncItemPopupWindow();
        }
    });

    //보험Item 추가팝업
    selectIncItemPopupWindow = function(){
        var grid = $("#incDtlGrid").data("kendoExtGrid");
        var selectRow = grid.dataItem(grid.select());


        popupWindow = dms.window.popup({
            windowId:"selectIncItemPopupWindow"
            , title:"<spring:message code='sal.title.incJoinInfoMng' />"   // 보험정보등록
            , width:600
            , height:400
            , content:{
                url:"<c:url value='/sal/inc/incJoinInfo/selectIncItemPopup.do' />"
                , data:{
                    "autoBind":true
                    , "type"  :null
                    , "callbackFunc":function(data, num){
                        if (data.length >= 1) {

                            var sDt = kendo.parseDate(toDay);
                            sDt.setMonth(sDt.getMonth() + 12);
                            sDt.setDate(sDt.getDate() -1);
                            var eDt = kendo.toString(sDt, "<dms:configValue code='dateFormat' />");

                            var tData = {};
                            if(typeof(num) == "undefined" ){
                                for(var i=0; i<data.length; i++){
                                    tData = data[i];
                                    if(!isincDtlItem(tData.cmmCd)){
                                        grid.dataSource.insert(i, {
                                            "dlrCd":dlrCd
                                           ,"incNo":dms.string.strNvl($("#incNo").val())
                                           ,"incTp":tData.cmmCd
                                           ,"incExpcAmt":""
                                           ,"realIncAmt":""
                                           ,"incPrid":12
                                           ,"incStartDt":kendo.parseDate(toDay)
                                           ,"incEndDt":kendo.parseDate(eDt)
                                           ,"incAmt":""
                                       }).set("dirty", true);
                                    }
                                }
                            }else{
                                for(var i=0; i<data.length; i++){
                                    tData = data[i];
                                    if(!isincDtlItem(tData.incTp)){
                                        grid.dataSource.insert(i, {
                                            "dlrCd":dlrCd
                                           ,"incNo":dms.string.strNvl($("#incNo").val())
                                           ,"incTp":tData.incTp
                                           ,"incExpcAmt":""
                                           ,"realIncAmt":""
                                           ,"incPrid":12
                                           ,"incStartDt":kendo.parseDate(toDay)
                                           ,"incEndDt":kendo.parseDate(eDt)
                                           ,"incAmt":""
                                       }).set("dirty", true);
                                    }
                                }
                            }

                            popupWindow.close();

                        }
                    }
                }
            }
        })
    }


    // 보험신청명세 - 행삭제
    $("#btnIncDtlDel").kendoButton({
        click:function(e) {
            var incDtlGrid = $("#incDtlGrid").data("kendoExtGrid");
            var rows = incDtlGrid.select();

            rows.each(function(index, row) {
                incDtlGrid.removeRow(row);
            });
        }
    });

    // 보험신청명세 - 취소
    $("#btnIncDtlCancel").kendoButton({
        click:function(e) {
            $('#incDtlGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    //버튼 - 저장 : 10
    $("#btnSave").kendoButton({
        click:function(e) {
            save("10");
        }
    });

    //버튼 - 완성 : 20
    $("#btnComplete").kendoButton({
        click:function(e){
            save("20");
        }
    });

    //버튼 - 취소 : 90
    $("#btnRemove").kendoButton({
        click:function(e) {
            dms.window.confirm({
                message:"<spring:message code='global.btn.cancel' var='globalBtnCancel' /><spring:message code='global.info.cnfrmMsg' arguments='${globalBtnCancel}' />"
                ,title :"<spring:message code='global.btn.cancel' />"
                ,callback:function(result){
                    if(result){
                        if(dms.string.isEmpty($("#incNo").val())){
                            fnReset();
                            $("#incJoinWindow").data("kendoWindow").close();
                        }else{
                            updateSate("90");
                        }
                    }else{
                        return false;
                    }
                }
            });
        }
    });

    //버튼 - 퇴보 : 91
    $("#btnCancel").kendoButton({
        click:function(e) {
            dms.window.confirm({
                message:"<spring:message code='sal.btn.cancelBtn' var='salBtnCancelBtn' /><spring:message code='global.info.cnfrmMsg' arguments='${salBtnCancelBtn}' />"
                ,title :"<spring:message code='sal.btn.cancelBtn' />"
                ,callback:function(result){
                    if(result){
                        updateSate("91");
                    }else{
                        return false;
                    }
                }
            });
        }
    });

    /*******************  //버튼   *******************************************/

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-113901"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/inc/incJoinInfo/selectIncJoinInfo.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sIncJoinStartDt"]= $("#sIncJoinStartDt").data("kendoExtMaskedDatePicker").value(); // 보험가입일(기간) - 시작일
                        params["sIncJoinEndDt"]  = $("#sIncJoinEndDt").data("kendoExtMaskedDatePicker").value();   // 보험가입일(기간) - 종료일
                        params["sCarSaleStartDt"]= $("#sCarSaleStartDt").data("kendoExtMaskedDatePicker").value(); // 차량판매일(기간) - 시작일
                        params["sCarSaleEndDt"]  = $("#sCarSaleEndDt").data("kendoExtMaskedDatePicker").value();   // 차량판매일(기간) - 종료일
                        params["sVinNo"]         = $("#sVinNo").val();
                        params["sCustNo"]        = $("#sCustNo").val();                                            // 고객
                        params["sCustNm"]        = $("#sCustNm").val();                                            // 고객
                        //params["sContractNo"]    = $("#sContractNo").val();                                      // 계약번호
                        params["sIncCs"]         = $("#sIncCs").data("kendoExtDropDownList").value();                 // 보험종류
                        params["sIncStat"]       = $("#sIncStat").data("kendoExtDropDownList").value();               // 보험상태
                        params["sCarRegNo"]      = $("#sCarRegNo").val();               // 차량번호
                        params["sIncEndFromDt"]  = $("#sIncEndFromDt").data("kendoExtMaskedDatePicker").value();   // 보험마감시간
                        params["sIncEndToDt"]    = $("#sIncEndToDt").data("kendoExtMaskedDatePicker").value();     // 보험마감시간
                        params["sIncNo"]         = $("#savedIncNo").val();
                        params["sFincYn"]        = $("#sFincYn").data("kendoExtDropDownList").value();            // 금융여부
                        //20200509  故障E20032500003, 没有筛选保险公司  updateby tjx  start
                        params["sIncCmpCd"]      = $("#sIncCmpCd").data("kendoExtDropDownList").value();            // 保险公司
                      //20200509  故障E20032500003, 没有筛选保险公司  updateby tjx  end
                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"incPk"
                    ,fields:{
                         incPk    :{type:"string"}
                        ,custNo:{type:"string"}
                        ,custNm:{type:"string"}
                        ,custTelNo:{type:"string"}
                        ,carBrandNm:{type:"string"}
                        ,carlineNm:{type:"string"}
                        ,fscNm  :{type:"string"}
                        ,vinNo    :{type:"string"}
                        ,incStatNm:{type:"string"}
                        ,incCsNm:{type:"string"}
                        ,contractNo :{type:"string"}
                        ,incCmpCd :{type:"string"}
                        ,incNo:{type:"string"}
                        ,incExpcTotAmt:{type:"number"}
                        ,realIncTotAmt:{type:"number"}
                        ,incFeeTotAmt:{type:"number"}
                        ,saleNm   :{type:"string"}
                        ,incJoinDt:{type:"date"}
                        ,incPrsnNm:{type:"string"}
                        ,incProfitNm:{type:"string"}
                        ,fincYn:{type:"string"}
                        ,fincCmpCd:{type:"string"}
                    }
                }
            }
        }
        ,dataBound :function(e) {
            // 저장시에만 계약번호가 1회 들어있음.
            var savedIncNo = $("#savedIncNo").val();

            if(savedIncNo != ""){
                var rows = e.sender.tbody.children();
                var selectRow
                  , grid = $("#grid").data("kendoExtGrid");

                $.each(rows, function(idx, row){
                    var dataItem = e.sender.dataItem(row);
                    if(dataItem.incNo == savedIncNo){
                         selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(idx);
                         grid.select(selectRow);
                    }
                });
            }
            $("#savedIncNo").val("");
        }
        ,editable:false
        ,autoBind :false
        //,height  :460
        ,change:function(e) {

            if(this.select().length != 0){
                var selectedVal = this.dataItem(this.select());
                var incNo = selectedVal.incNo;

                if ( dms.string.isNotEmpty(incNo) ) {
                    $("#btnViewDetail").data("kendoButton").enable(true);
                }

            };
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
                     {field:"custNo"
                       ,title:"<spring:message code='global.lbl.icnCustNo' />"
                       ,width:130 ,attributes:{"class":"ac"}
                     } //가입자번호
                    ,{field:"custNm"
                       ,title:"<spring:message code='sal.lbl.incCustNm' />"
                       ,width:100
                       ,attributes:{"class":"ac"}
                     } //가입자명
                    ,{field:"custTelNo"
                         ,title:"<spring:message code='sal.lbl.incCustTelNo' />"
                         ,width:100
                         ,attributes:{"class":"al"}
                     } //가입자연락처
                    ,{field:"carBrandNm"
                         ,title:"<spring:message code='sal.lbl.brandNm' />"
                         ,width:100
                         ,attributes:{"class":"al"}
                    } // 브랜드명
                    ,{field:"carlineNm"
                       ,title:"<spring:message code = 'global.lbl.carLine'/>"
                       ,width:100
                       ,attributes:{"class":"al"}
                     } //차종
                    ,{field:"fscNm"
                       ,title:"<spring:message code = 'global.lbl.model'/>"
                       ,width:130
                       ,attributes:{"class":"al"}
                     } //차관
                    ,{field:"vinNo"
                       ,title:"<spring:message code = 'global.lbl.vinNum'/>"
                       ,width:150
                       ,attributes:{"class":"ac"}
                     } //VIN NO
                    ,{field:"incStatNm"
                         ,title:"<spring:message code = 'sal.lbl.incStat'/>"
                         ,width:100
                         ,attributes:{"class":"ac"}
                     } //보험상태
                    ,{field:"incCsNm"
                         ,title:"<spring:message code = 'sal.lbl.incTps'/>"
                         ,width:100
                         ,attributes:{"class":"ac"}
                    } //보험종류
                    ,{field:"contractNo"
                       ,title:"<spring:message code = 'global.lbl.contractNo'/>"
                       ,width:110
                       ,attributes:{"class":"ac"}
                     } //계약번호
                    ,{field:"incCmpCd"
                       ,title:"<spring:message code = 'global.lbl.incCmp'/>"
                       ,width:80
                       ,attributes:{"class":"ac"}
                       ,template:"# if(incCmpCdMap[incCmpCd] != null) { # #= incCmpCdMap[incCmpCd].cmmCdNm# # }#"
                     } //보험회사
                    ,{field:"incNo"
                       ,title:"<spring:message code = 'global.lbl.incNo'/>"
                       ,width:120
                       ,attributes:{"class":"ac"}
                     } //보험번호
                    ,{field:"incExpcTotAmt"
                       ,title:"<spring:message code = 'sal.lbl.incExpcAmt'/>"
                       ,width:100
                       ,attributes:{"class":"ar"}
                       ,format:"{0:n2}"
                     } //예상금액
                    ,{field:"realIncTotAmt"
                       ,title:"<spring:message code = 'sal.lbl.realIncAmt'/>"
                       ,width:100
                       ,attributes:{"class":"ar"}
                       ,format:"{0:n2}"
                     } //실보험금액
                    ,{field:"incFeeTotAmt"
                       ,title:"<spring:message code = 'ser.lbl.incFeeAmt'/>"
                       ,width:100
                       ,attributes:{"class":"ar"}
                       ,format:"{0:n2}"
                     } //보험수수료
                    ,{field:"saleNm"
                       ,title:"<spring:message code = 'sal.lbl.salesAdvisor'/>"
                       ,width:100
                       ,attributes:{"class":"al"}
                     } //판매고문
                    ,{field:"incJoinDt"
                       ,title:"<spring:message code = 'global.lbl.incJoinDt'/>"
                       ,width:80
                       ,attributes:{"class":"ac"}
                       ,format:"{0:<dms:configValue code='dateFormat' />}"
                     } //보험가입일
                    ,{field:"incPrsnNm"
                       ,title:"<spring:message code = 'sal.lbl.incPerson'/>"
                       ,width:100
                       ,attributes:{"class":"al"}
                     } //보험담당자
                    ,{field:"incProfitNm"
                       ,title:"<spring:message code = 'sal.lbl.incProfitNm'/>"
                       ,width:80
                       ,attributes:{"class":"ac"}
                    } //보험수익자명
                    ,{field:"fincYn"
                        ,title:"<spring:message code = 'sal.lbl.fincYn'/>"
                        ,width:80
                        ,attributes:{"class":"ac"}
                        ,template:"#= dms.string.strNvl(loanYnObj[fincYn]) #"
                      } //대출여부
                      ,{field:"fincCmpCd"
                          ,title:"<spring:message code = 'global.lbl.fincCmp'/>"
                          ,width:80
                          ,attributes:{"class":"ac"}
                          ,template:"# if(fincCmpObj[fincCmpCd] != null) { # #= fincCmpObj[fincCmpCd].cmmCdNm# # }#"
                      } //금융회사
                   ]
    });


    //그리드 설정
    $("#incDtlGrid").kendoExtGrid({
        gridId:"G-SAL-2017-051915"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/inc/incJoinInfo/selectIncDetailItem.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        var grid = $("#grid").data('kendoExtGrid');
                        var selectRow = grid.dataItem(grid.select());

                        params["sDlrCd"] = selectRow.dlrCd;             //딜러코드
                        params["sIncNo"] = selectRow.incNo;             //보험번호
                        params["sCustNo"] = selectRow.custNo;           //고객번호

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"incPk"
                    ,fields:{
                         incPk     :{type:"string"}
                        ,dlrCd     :{type:"string"}
                        ,incNo     :{type:"string"}
                        ,incTp     :{type:"string"}
                        ,incExpcAmt:{type:"number"}
                        ,realIncAmt:{type:"number"}
                        ,incPrid   :{type:"number"}
                        ,incStartDt:{type:"date"}
                        ,incEndDt  :{type:"date"}
                        ,incAmt    :{type:"number"}
                        ,remark    :{type:"string"}
                        ,regDt     :{type:"date"}
                        ,updtDt    :{type:"date"}
                    }
                }
            }
        }
        //,editableOnlyNew:true
        //,editableOnlyNewExcludeColumns:["incExpcAmt","realIncAmt","incPrid","incStartDt","incEndDt","incAmt","remark"]
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox :true    //멀티선택 적용. default :false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,height:138
        ,pageable:false
        ,autoBind:false
        ,sortable:false
        ,filterable:false
        ,edit:function(e){
            var eles = e.container.find("input");
            var fieldName;
            if(eles.length > 1){
                fieldName = eles[eles.length-1].getAttribute("name");
            }else{
                fieldName = eles.attr("name");
            }
            var input = e.container.find(".k-input");

            if(readOnlyFlag){
                this.closeCell();
                return;
            }

            if(fieldName == "incExpcAmt"){
                this.closeCell();
            }

            if(fieldName == "incExpcAmt"){
                //input.blur(function(){
                //    bf_gridSumIncAmt("incExpcAmt");
                //});
            }else if(fieldName == "realIncAmt"){
                input.blur(function(){
                    //var item = e.model;
                    //item.set("incExpcAmt", item.realIncAmt);
                    //bf_gridSumIncAmt("incExpcAmt");
                    bf_gridSumIncAmt("realIncAmt");
                });
            }

            if(fieldName == "incStartDt" ){
                input.blur(function(){
                    var selectedItem = e.model;

                    var incStartOrgDt = kendo.parseDate(kendo.toString(selectedItem.incStartDt, "yyyy-MM-dd"));
                    var incStartDt    = kendo.parseDate(kendo.toString(selectedItem.incStartDt, "yyyy-MM-dd"));

                    incStartDt.setMonth(incStartDt.getMonth() + Number(selectedItem.incPrid));
                    incStartDt.setDate(incStartDt.getDate() -1);
                    var incEndDt = kendo.toString(incStartDt, "yyyy-MM-dd");

                    selectedItem.set("incStartDt", incStartOrgDt);
                    selectedItem.set("incEndDt",   kendo.parseDate(incEndDt));
                });
            }

            if(fieldName == "incEndDt" ){
                input.blur(function(){
                    var selectedItem = e.model;

                    var incEndOrgDt = kendo.parseDate(kendo.toString(selectedItem.incEndDt, "yyyy-MM-dd"));
                    var incEndDt    = kendo.parseDate(kendo.toString(selectedItem.incEndDt, "yyyy-MM-dd"));

                    incEndDt.setMonth(incEndDt.getMonth() - Number(selectedItem.incPrid));
                    incEndDt.setDate(incEndDt.getDate() +1);
                    var incStartDt = kendo.toString(incEndDt, "yyyy-MM-dd");

                    selectedItem.set("incStartDt", kendo.parseDate(incStartDt));
                    selectedItem.set("incEndDt",   incEndOrgDt);
                });
            }
        }
        ,columns:[
                    {field:"incTp",title:"<spring:message code = 'sal.lbl.incTp'/>", width:120,attributes:{"class":"al"}
                       ,template:"# if(incTpMap[incTp] != null) { # #= incTpMap[incTp].cmmCdNm# # }#"
                       ,editor:function(container, options) {
                          $('<input required name="incTp" data-bind="value:' + options.field + '"/>')
                          .appendTo(container)
                          .kendoExtDropDownList({
                               autoBind:false
                              ,dataTextField:"cmmCdNm"
                              ,dataValueField:"cmmCd"
                              ,dataSource:incTpDs
                           });
                           $('<span class="k-invalid-msg" data-for="incTp"></span>').appendTo(container);
                       }
                   }//보험유형
                  ,{
                       field:"incExpcAmt",title:"<spring:message code = 'sal.lbl.incExpcAmt'/>",width:100
                       ,attributes:{"class":"ar"}, format:"{0:n2}"
                       ,editor:function(container, options){
                            $('<input name="incExpcAmt" data-bind="value:' + options.field + '" style="width:100%;" />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                    format:"n2"
                                   ,decimals:2
                                   ,value:0.00
                                   ,spinners:false
                                });
                            $('<span class="k-invalid-msg" data-for="incExpcAmt"></span>').appendTo(container);
                        }
                   } //보험예상금액
                  ,{
                        field:"realIncAmt",title:"<spring:message code = 'sal.lbl.realIncAmt'/>",width:100
                        ,attributes:{"class":"ar"}, format:"{0:n2}"
                        ,editor:function(container, options){
                            $('<input name="realIncAmt" data-bind="value:' + options.field + '" style="width:100%;" />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                    format:"n2"
                                   ,decimals:2
                                   ,value:0.00
                                   ,spinners:false
                                });
                            $('<span class="k-invalid-msg" data-for="realIncAmt"></span>').appendTo(container);
                        }

                   } //실보험금액
                  ,{
                      field:"incPrid", title:"<spring:message code='sal.lbl.pridMonth' />", attributes:{"class":"ar"}, width:90, format :"{0:n0}"
                      ,editor :function (container, options){
                          $('<input required name="incPrid" data-bind="value:' + options.field + '" onfocus="this.select()" maxlength="2" />')
                          .appendTo(container)
                          .kendoExtNumericTextBox({
                                format:"n0"
                                ,value:0
                                ,change :function(e){
                                    var grid = $("#incDtlGrid").data("kendoExtGrid");
                                    var selectedItem = grid.dataItem(grid.select());

                                    if(dms.string.isEmpty(selectedItem.incStartDt)){ return ; }

                                    var incStartOrgDt = kendo.parseDate(kendo.toString(selectedItem.incStartDt, "<dms:configValue code='dateFormat' />"));
                                    var incStartDt    = kendo.parseDate(kendo.toString(selectedItem.incStartDt, "<dms:configValue code='dateFormat' />"));

                                    incStartDt.setMonth(incStartDt.getMonth() + Number(this.value()));
                                    incStartDt.setDate(incStartDt.getDate() -1);
                                    var incEndDt = kendo.toString(incStartDt, "<dms:configValue code='dateFormat' />");

                                    selectedItem.set("incStartDt", incStartOrgDt);
                                    selectedItem.set("incEndDt",   kendo.parseDate(incEndDt));
                                }
                            });
                          $('<span class="k-invalid-msg" data-for="incPrid"></span>').appendTo(container);
                      }
                   }   // 기간(월)
                  ,{field:"incStartDt",title:"<spring:message code = 'sal.lbl.incStartDt'/>",width:120,attributes:{"class":"ac"}
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,editor:function (container, options){
                          $('<input required name="incStartDt" id="incStartDt" data-bind="value:' + options.field + '"/>')
                          .appendTo(container)
                          .kendoExtMaskedDatePicker({
                              format:"<dms:configValue code='dateFormat' />"
                              ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                           });
                           $('<span class="k-invalid-msg" data-for="incStartDt"></span>').appendTo(container);
                        }
                    } //起始时间
                   ,{field:"incEndDt",title:"<spring:message code = 'sal.lbl.deadlineTime'/>",width:120,attributes:{"class":"ac"}
                       ,format:"{0:<dms:configValue code='dateFormat' />}"
                       ,editor:function (container, options){
                           $('<input required name="incEndDt" id="incEndDt" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtMaskedDatePicker({
                               format:"<dms:configValue code='dateFormat' />"
                               ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                           });
                           $('<span class="k-invalid-msg" data-for="incEndDt"></span>').appendTo(container);
                       }
                   } //截止时间
                  ,{
                      field:"incAmt",title:"<spring:message code = 'sal.lbl.incAmountAmt'/>(<spring:message code='sal.lbl.planUnit' />)",width:100
                      ,attributes:{"class":"ar"}, template: "#= bf_incAmtTemplate(incTp, incAmt) #"
                      ,editor:function(container, options){
                          var obj = $('<input name="incAmt" data-bind="value:' + options.field + '" style="width:100%;" />').appendTo(container);
                          if(options.model.incTp == "03"){
                              obj.kendoExtDropDownList({
                                     autoBind:false
                                    ,dataTextField:"cmmCdNm"
                                    ,dataValueField:"cmmCd"
                                    ,dataSource:dms.data.cmmCdFilter(threeIncTpAmtDs)
                                 });
                          }else{
                              obj.kendoExtNumericTextBox({
                                  format:"n2"
                                 ,decimals:2
                                 ,value:0.00
                                 ,spinners:false
                              });
                          }
                          $('<span class="k-invalid-msg" data-for="incAmt"></span>').appendTo(container);
                      }

                    } //保额
                  ,{field:"remark",title:"<spring:message code = 'sal.lbl.remark'/>",width:100,attributes:{"class":"al"}} //备注
                ]
    });

    bf_gridSumIncAmt = function(gubun){
         var grid = $("#incDtlGrid").data("kendoExtGrid");
         var rows = grid.tbody.find("tr");
         var oItem;
         var oIncExpcAmt = 0;
         var oRealIncAmt = 0;

         rows.each(function(index, row) {
             oItem = grid.dataItem(rows[index]);

             if(gubun == "incExpcAmt"){
                 if(oItem.incExpcAmt != null){
                     oIncExpcAmt +=  Number(oItem.incExpcAmt);
                 }
             }else if(gubun == "realIncAmt"){
                 if(oItem.realIncAmt != null){
                     oRealIncAmt +=  Number(oItem.realIncAmt);
                 }
             }
         });

         if(gubun == "incExpcAmt"){
             $("#incExpcTotAmt").data("kendoExtNumericTextBox").value(oIncExpcAmt);
         }else if(gubun == "realIncAmt"){
             $("#realIncTotAmt").data("kendoExtNumericTextBox").value(oRealIncAmt);
         }

    }

    if('${incNo}' != ""){
        reSearch('${incNo}');        // 조회조건 세팅
    }
    $("#grid").data("kendoExtGrid").dataSource.page(1);

});

var popupWindow;
var custInfoRegPopup;
var zipCodeSearchPopupWin;

//팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
function viewPopup(){
    var win = $("#incJoinWindow").data("kendoWindow");
    win.center();
    win.open();
}


function fn_btnState(state){
    switch(state){
        case '10':     // 저장
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnRemove").data("kendoButton").enable(true);
            $("#btnComplete").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(true);

            $("#btnIncAllChange").data("kendoButton").enable(true);
            $("#btnIncDtlAdd").data("kendoButton").enable(true);
            $("#btnIncDtlDel").data("kendoButton").enable(true);
            $("#btnIncDtlCancel").data("kendoButton").enable(true);
            fn_readOnlyStat(false);
        break;
        case '20':     // 완료
            $("#btnCancel").data("kendoButton").enable(true);
            $("#btnRemove").data("kendoButton").enable(false);
            $("#btnComplete").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(false);

            $("#btnIncAllChange").data("kendoButton").enable(false);
            $("#btnIncDtlAdd").data("kendoButton").enable(false);
            $("#btnIncDtlDel").data("kendoButton").enable(false);
            $("#btnIncDtlCancel").data("kendoButton").enable(false);
            fn_readOnlyStat(true);
            break;
        case '90':      // 취소
        case '91':      // 퇴보
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnRemove").data("kendoButton").enable(false);
            $("#btnComplete").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(false);

            $("#btnIncAllChange").data("kendoButton").enable(false);
            $("#btnIncDtlAdd").data("kendoButton").enable(false);
            $("#btnIncDtlDel").data("kendoButton").enable(false);
            $("#btnIncDtlCancel").data("kendoButton").enable(false);
            fn_readOnlyStat(true);
            break;
        default :      // 작성전
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnRemove").data("kendoButton").enable(true);
            $("#btnComplete").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(true);

            $("#btnIncAllChange").data("kendoButton").enable(true);
            $("#btnIncDtlAdd").data("kendoButton").enable(true);
            $("#btnIncDtlDel").data("kendoButton").enable(true);
            $("#btnIncDtlCancel").data("kendoButton").enable(true);
            fn_readOnlyStat(false);
            break;
    }
}

var readOnlyFlag = false;
function fn_readOnlyStat(state){
    if(state){
        $("#incCs").data("kendoExtDropDownList").enable(false);
        $("#finImplyYn").attr("disabled", true);
        $("#incRcptNm").attr("disabled", true);
        $("#incCmpCd").data("kendoExtDropDownList").enable(false);
        $("#incPconCustNm").attr("disabled", true);
        $("#custSsnCrnNo").attr("disabled", true);
        $("#incCustNm").attr("disabled", true);
        $("#incCustTelNo").attr("disabled", true);
        $("#incPconCustTelNo").attr("disabled", true);
        $("#incProfitNm").attr("disabled", true);
        $("#frcIncAmt").data("kendoExtNumericTextBox").enable(false);
        $("#busIncAmt").data("kendoExtNumericTextBox").enable(false);
        $("#transTaxAmt").data("kendoExtNumericTextBox").enable(false);
        $("#incFeeTotAmt").data("kendoExtNumericTextBox").enable(false);
        $("#fincYn").data("kendoExtDropDownList").enable(false);
        $("#fincCmpCd").data("kendoExtDropDownList").enable(false);
        $("#incJoinDt").data("kendoExtMaskedDatePicker").enable(false);
    }else{
        //$("#incCs").data("kendoExtDropDownList").enable(true);
        //$("#finImplyYn").attr("disabled", false);
        $("#incRcptNm").attr("disabled", false);
        $("#incCmpCd").data("kendoExtDropDownList").enable(true);
        $("#incPconCustNm").attr("disabled", false);
        $("#custSsnCrnNo").attr("disabled", false);
        $("#incCustNm").attr("disabled", false);
        $("#incCustTelNo").attr("disabled", false);
        $("#incPconCustTelNo").attr("disabled", false);
        $("#incProfitNm").attr("disabled", false);
        $("#frcIncAmt").data("kendoExtNumericTextBox").enable(true);
        $("#busIncAmt").data("kendoExtNumericTextBox").enable(true);
        $("#transTaxAmt").data("kendoExtNumericTextBox").enable(true);
        $("#incFeeTotAmt").data("kendoExtNumericTextBox").enable(true);
        $("#incJoinDt").data("kendoExtMaskedDatePicker").enable(true);
        //$("#fincYn").data("kendoExtDropDownList").enable(true);
        //$("#fincCmpCd").data("kendoExtDropDownList").enable(true);
    }
    readOnlyFlag = state;
}

function fnReset(){
    //$("#custNo").prop("disabled","").removeClass("form_disabled");
    $("#custNm").prop("readonly","").removeClass("form_readonly");
    $(".custDtlSearch").prop("disabled","").removeClass("form_disabled");

    $("#vinNo").data("kendoExtDropDownList").setDataSource([]);        //계약번호 dataSet
    $("#vinNo").data("kendoExtDropDownList").value("");
    $("#custNo").val("");
    $("#custNm").val("");
    $("#incCustNm").val("");
    $("#custTp").data("kendoExtDropDownList").value("");
    $("#custTelNo").val("");
    $("#carlineNm").val("");
    $("#carlineCd").val("");
    $("#modelCd").val("");
    $("#fscCd").val("");
    $("#fscNm").val("");
    $("#ocnNm").val("");
    $("#extColorNm").val("");
    $("#intColorNm").val("");
    $("#useCarNm").val("");
    $("#carBrandCd").val("");
    $("#carBrandNm").val("");
    $("#ncarDstinCd").val("");

    $(".corpCar_01").show();
    $(".corpCar_02").hide();
    $(".cCont").hide();

    $("#carRegNo").val("");
    $("#contractNo").val("");
    $("#enginSerialNo").val("");
    $("#cartNo").val("");
    $("#incRcptNm").val("");
    $("#custNo1").val("");
    $("#custTelNo").val("");
    $("#custSsnCrnNo").val("");
    $("#incProfitNm").val("");
    $("#incCmpCd").data("kendoExtDropDownList").value("");
    $("#incJoinDt").data("kendoExtMaskedDatePicker").value(toDay);
    $("#frcIncAmt").data("kendoExtNumericTextBox").value(0.0);
    $("#busIncAmt").data("kendoExtNumericTextBox").value(0.0);
    $("#transTaxAmt").data("kendoExtNumericTextBox").value(0.0);
    $("#incPrsnNm").val(userNm);
    $("#incNo").val("");
    $("#incCustTelNo").val("");

    $("#incPconCustNm").val("");
    $("#incPconCustTelNo").val("");
    $("#finImplyYn").attr("disabled", false);
    $("#finImplyYn").prop('checked', false);
    $("#incCs").data("kendoExtDropDownList").enable(true);
    $("#incCs").data("kendoExtDropDownList").value("01");
    $("#implyYn").val("");
    $("#remark").val("");

    $("#incExpcTotAmt").data("kendoExtNumericTextBox").value(0.0);
    $("#incFeeTotAmt").data("kendoExtNumericTextBox").value(0.0);
    $("#realIncTotAmt").data("kendoExtNumericTextBox").value(0.0);

    $("#fincYn").data("kendoExtDropDownList").enable(true);
    $("#fincYn").data("kendoExtDropDownList").value("N");
    $("#fincCmpCd").data("kendoExtDropDownList").enable(true);
    $("#fincCmpCd").data("kendoExtDropDownList").value("");

    $('#incDtlGrid').data('kendoExtGrid').dataSource.data([]);
}

function reSearch(incNo){
    $("#sIncJoinStartDt").data("kendoExtMaskedDatePicker").value("");    // 보험가입일(기간) - 시작일
    $("#sIncJoinEndDt").data("kendoExtMaskedDatePicker").value("");      // 보험가입일(기간) - 종료일
    $("#sCarSaleStartDt").data("kendoExtMaskedDatePicker").value("");    // 차량판매일(기간) - 시작일
    $("#sCarSaleEndDt").data("kendoExtMaskedDatePicker").value("");      // 차량판매일(기간) - 종료일
    $("#sVinNo").val("");
    $("#sCustNo").val("");                                               // 고객
    //$("#sContractNo").val("");                                         // 계약번호
    $("#sIncCs").data("kendoExtDropDownList").value("");                    // 보험종류
    $("#sIncEndFromDt").data("kendoExtMaskedDatePicker").value("");      // 보험마감시간
    $("#sIncEndToDt").data("kendoExtMaskedDatePicker").value("");        // 보험마감시간
    $("#savedIncNo").val(incNo);
    $("#sFincYn").data("kendoExtDropDownList").value("");                // 대출여부
}

// item grid 보험유형 중복체크
function isincDtlItem(iTp){
    var flag = false;
    var grid = $('#incDtlGrid').data('kendoExtGrid');
    var rows = grid.tbody.find("tr");

    rows.each(function(index, row){
        var data = grid.dataItem(row);
        if(iTp == data.incTp){
            flag = true;
        }
    });
    return flag;
}

//고객명에서 ObKeyDown
$(".onKey_down").keydown(function(e){
    if (e.keyCode == 13) {
        if($(this).val() != "") {
            if($(this).attr("id") == 'sCustNm'){
                //$(".custSearch").click();
            }else {
                $(".custDtlSearch").click();
            }
        }
    }
});

// 고객조회
$(".custSearch").click(function(){

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
                            $("#sCustNo").val(data[0].custNo);
                            $("#sCustNm").val(data[0].custNm);
                        }

                        //popupWindow.close();

                    }
                }
            }
        }
    })
});


//고객조회
$(".custDtlSearch").click(function(){
    if($(this).prop("disabled") == "disabled" ){ return; }

    var custNm = $("#custNm").val()
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
                , "closeYn":"Y"
                , "custNm":custNm
                , "callBackTp":"BTN_CREATE"
                , "type"  :null
                , "callbackFunc":function(data){
                    if (data.length >= 1) {
                        if ( dms.string.isNotEmpty(data[0].custNo) ) {
                            $("#custNo").val(data[0].custNo);
                            $("#custNm").val(data[0].custNm);
                            $("#incCustNm").val(data[0].custNm);
                        }

                        initCustInfoSet(data[0].custNo);
                        //popupWindow.close();
                    }

                    if(data.callBackTp == "BTN_CREATE" ){
                        openCreateCust();
                    }
                }
            }
        }
    })
});

initCustInfoSet = function (custNo){

    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/sal/inc/incJoinInfo/selectCustContractNo.do' />"
        ,data:JSON.stringify({sCustNo:custNo})
        ,async:false
    });
        if(responseJson.total == 0){
            reJson = dms.ajax.getJson({
                url:"<c:url value='/crm/cif/customerInfo/customerListSearch.do' />"
                ,data :JSON.stringify({"lastIndex":1, "firstIndex":0, "sDlrCd":dlrCd, "sCustNo":custNo})
                ,async :false
            });

            if(reJson.total == 0){
                $("#custTp").data("kendoExtDropDownList").value("01");
                $("#custTelNo").val("");
            }else{
                $("#custNo").val(reJson.data[0].custNo);
                $("#custNm").val(reJson.data[0].custNm);
                $("#incCustNm").val(reJson.data[0].custNm);
                $("#custTp").data("kendoExtDropDownList").value(dms.string.strNvl(reJson.data[0].custTp));
                $("#custTelNo").val(reJson.data[0].hpNo);
            }

            $("#vinNo").data("kendoExtDropDownList").enable(false);
            $("#vinNo").data("kendoExtDropDownList").setDataSource([]);
            $("#contractNo").val("");
            $("#carlineCd").val("");
            $("#carlineNm").val("");
            $("#modelCd").val("");
            $("#fscCd").val("");
            $("#fscNm").val("");
            $("#ocnNm").val("");
            $("#extColorNm").val("");
            $("#intColorNm").val("");
            $("#enginSerialNo").val("");
            $("#cartNo").val("");
            $("#carRegNo").val("");
            $("#useCarNm").val("");
            $("#carBrandCd").val("");
            $("#carBrandNm").val("");
            $("#ncarDstinCd").val("");

            $(".corpCar_01").show();
            $(".corpCar_02").hide();

            $("#incCs").data("kendoExtDropDownList").value("01");  // 신보험(기본)
            $("#incCs").data("kendoExtDropDownList").enable(true);
            $("#fincYn").data("kendoExtDropDownList").enable(true);
            $("#fincCmpCd").data("kendoExtDropDownList").enable(true);
            $("#finImplyYn").attr("disabled", false);
            $("#finImplyYn").prop('checked', true);
            $(".cCont").hide();

        }else{
            $("#vinNo").data("kendoExtDropDownList").setDataSource(responseJson.data);
            $("#vinNo").data("kendoExtDropDownList").value(dms.string.strNvl(responseJson.data[0].vinNo));
            if(responseJson.total > 1){
                $("#vinNo").data("kendoExtDropDownList").enable(true);
            }else{
                $("#vinNo").data("kendoExtDropDownList").enable(false);
            }
            $("#custNo").val(responseJson.data[0].custNo);
            $("#custNm").val(responseJson.data[0].custNm);
            $("#incCustNm").val(responseJson.data[0].custNm);
            $("#custTp").data("kendoExtDropDownList").value(dms.string.strNvl(responseJson.data[0].custTp));
            $("#contractNo").val(responseJson.data[0].contractNo);
            $("#carlineCd").val(responseJson.data[0].carlineCd);
            $("#carlineNm").val(responseJson.data[0].carlineNm);
            $("#modelCd").val(responseJson.data[0].modelCd);
            $("#fscCd").val(responseJson.data[0].fscCd);
            $("#fscNm").val(responseJson.data[0].fscNm);
            $("#ocnNm").val(responseJson.data[0].ocnNm);
            $("#extColorNm").val(responseJson.data[0].extColorNm);
            $("#intColorNm").val(responseJson.data[0].intColorNm);
            $("#enginSerialNo").val(responseJson.data[0].enginSerialNo);
            $("#cartNo").val(responseJson.data[0].cartNo);
            $("#carRegNo").val(responseJson.data[0].carRegNo);
            $("#custTelNo").val(responseJson.data[0].custTelNo);

            $("#useCarNm").val(responseJson.data[0].useCarNm);
            $("#carBrandCd").val(responseJson.data[0].carBrandCd);
            $("#carBrandNm").val(responseJson.data[0].carBrandNm);
            $("#ncarDstinCd").val(responseJson.data[0].ncarDstinCd);

            if(responseJson.data[0].ncarDstinCd == "O"){
                $(".corpCar_01").hide();
                $(".corpCar_02").show();
            }else{
                $(".corpCar_01").show();
                $(".corpCar_02").hide();
            }

            //if(dms.string.isNotEmpty(responseJson.data[0].contractNo)){
            //    $("#incCs").data("kendoExtDropDownList").value("01");
            //    $("#incCs").data("kendoExtDropDownList").enable(false);
            //    $("#finImplyYn").prop('checked', false);
            //    $("#finImplyYn").attr("disabled", true);
            //    $(".cCont").show();
            //}else{
                $("#incCs").data("kendoExtDropDownList").value("01");  // 신보험(기본)
                $("#incCs").data("kendoExtDropDownList").enable(true);
                $("#fincYn").data("kendoExtDropDownList").enable(true);
                $("#fincCmpCd").data("kendoExtDropDownList").enable(true);
                $("#finImplyYn").attr("disabled", false);
                $("#finImplyYn").prop('checked', true);
                $(".cCont").hide();
            //}
        }
}


// 고객생성 팝업
openCreateCust = function(){
    /** [판매 신규 고객 등록 팝업]
    custInfoRegPopup = dms.window.popup({
        windowId:"custInfoRegPopup"
        , title:"<spring:message code='ser.lbl.custNew' />" //고객신규등록
        , height:390
        , modal:true
        , content:{
            url:"<c:url value='/sal/cmm/selectCustInfoCratePopup.do'/>"
            , data:{
                "vinNo":""
                ,"carId":""
                ,"isNew":"new"
                ,"preFixId":""
                , "callbackFunc":function(data){
                    getCustInfo(data);
                    custInfoRegPopup.close();
                }//callback
            }
        }
    });
    */

    /*** [TODO 정비와 같은 팝업으로 사용.] **/
    custInfoRegPopup = dms.window.popup({
        windowId:"custInfoRegPopup"
        , title:"<spring:message code='ser.lbl.custNew' />" //고객신규등록
        , height : 425
        , content:{
            url:"<c:url value='/ser/cmm/popup/selectCustInfoRegPopup.do'/>"
            , data:{
                "vinNo":""
                ,"carId":""
                ,"preFixId":"SAL"
                ,"callbackFunc":function(data){
                    getCustInfo(data);
                    custInfoRegPopup.close();
                }//callback
            }
        }
    });


}

getCustInfo = function(data){
    if(typeof(data) == "undefined" ){
        return;
    }
    initCustInfoSet(data);
};

fnOnChange = function(id,vl){
    if(id == "sCustNm" ){
        $("#sCustNo").val("");
    }else {
        $("#custNo").val("");       //고객번호
        $("#custTp").data("kendoExtDropDownList").value("");   //고객유형
        $("#custTelNo").val("");
        $("#carlineNm").val("");
        $("#modelNm").val("");
        $("#ocnNm").val("");
        $("#extColorNm").val("");
        $("#intColorNm").val("");
        $("#contractNo").val("");
        $("#carRegNo").val("");
        $("#engninSerialNo").val("");
        $("#cartNo").val("");
        $("#vinNo").data("kendoExtDropDownList").setDataSource([]);

        $("#enginSerialNo").val("");
        $("#useCarCd").val("");
        $("#useCarNm").val("");
        $("#carBrandCd").val("");
        $("#carBrandNm").val("");
        $("#ncarDstinCd").val("");

        $(".corpCar_01").show();
        $(".corpCar_02").hide();
        $(".cCont").hide();
    }
}

//
function bf_incAmtTemplate(incTp, amt) {
    if(incTp == "03"){
        return dms.string.strNvl(threeIncTpAmtObj[amt]) == ""?0.00:threeIncTpAmtObj[amt];
    }else{
        return kendo.toString(Number(amt), "n2");
    }
}

// 신규고객추가 팝업 - 1.고객찾기
function openCustomerSearchPopup(custNm, callbackFunc){
    popupWindow = dms.window.popup({
        windowId:"customerPopupWindow"
        , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
        , content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            , data:{
                "autoBind":false
                , "custNm":custNm
                , "type"  :null
                , "custCd":null         // null:all, 01:잠재, 02:보유
                , "dlrMbrYn":"N"        // 딜러 멤버십 가입 여부
                , "closeYn" : "Y"
                , "callbackFunc":function(data){
                    if (data.length >= 1) {
                        callbackFunc(data);
                    }
                }//end callbackFunc
            }//end data
        }// end content
    });
}

//신규고객추가 팝업 - 2.우편번호 찾기
function openzipCodeSearchPopup(callbackFunc){
    zipCodeSearchPopupWin = dms.window.popup({
        windowId:"zipCodeSearchPopupWin"
        , title:"<spring:message code='global.title.zipSearch' />"   // 사용자 조회
        , width:600
        , height:400
        , content:{
            url:"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
            , data:{
                "autoBind":false
                ,"usrNm":""
                , "callbackFunc":function(data){
                    if (data.length >= 1) {
                        callbackFunc(data);
                    }
                }
            }
        }
    });
}


relCustSearchPopUp = function(iframe, searchType, custTp, custNm) {

    popupWindow = dms.window.popup({
        windowId:"popupWindow"
        , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
        //, width:850
        , height:520
        , content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            , data:{
                "autoBind":true
                , "type"  :null
                , "custCd":null         // null:all, 01:잠재, 02:보유
                , "custTp":custTp
                , "custNm":custNm
                , "closeYn" : "Y"
                , "callbackFunc":function(data){
                    if (data.length >= 1) {
                        var windowElement = $("#"+iframe);
                        var iframeDomElement = windowElement.children("iframe")[0];
                        console.log(iframeDomElement);
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        iframeWindowObject.custDataSet(data, searchType);
                        popupWindow.close();
                    }//end if
                }//end callbackFunc
            }//end data
        }// end content
    });
}

zipCodeSearchPopUp = function(iframe, saveType) {

    zipCodeSearchPopupWin = dms.window.popup({
        windowId:"zipCodeSearchPopupWin"
        , title:"<spring:message code='global.title.zipSearch' />"   // 사용자 조회
        , width:600
        , height:400
        , content:{
            url:"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
            , data:{
                "autoBind":false
                ,"usrNm":""
                , "callbackFunc":function(data){
                    if (data.length >= 1) {
                        var windowElement = $("#"+iframe);
                        var iframeDomElement = windowElement.children("iframe")[0];
                        console.log(iframeDomElement);
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        iframeWindowObject.zipInfoDataSet(data, saveType);
                        zipCodeSearchPopupWin.close();
                    }
                }
            }
        }
    });
}

</script>
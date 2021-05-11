<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 차량마스터 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="global.title.vehicleMaster" /></h1><!-- 차량마스터 관리 -->
        <div class="left_area">
            <span class="txt_label bg_green">${dlrNm}[${dlrCd}]</span>
        </div>
        <div class="btn_right">
            <dms:access viewId="VIEW-D-11301" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnVehicleDetail" class="btn_m btn_modify"><spring:message code='global.btn.update' /><!-- 상세 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11300" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnMainSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnMainSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:9%;">
                <col style="width:18%;">
                <col style="width:7%;">
                <col style="width:15%;">
                <col style="width:7%;">
                <col style="width:16%;">
                <col style="width:7%;">
                <col style="width:21%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.carId" /></th><!-- CAR ID -->
                    <td>
                        <input id="sCarId" type="text" value="" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.vinNum" /></th><!-- VIN NO -->
                    <td>
                        <input id="sVinNo" type="text" class="form_input" >
                    </td>

                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                    <td>
                        <input id="sModelCd" class="form_comboBox">
                        <input id="hiddenFscCode" type="hidden" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.ocn" /></th>   <!-- OCN -->
                    <td>
                        <input id="sOcnCd" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.extIntColor' /></th>        <!-- 외장/내장색 -->
                    <td>
                        <input id="sExtColorCd" class="form_comboBox" style="width:49%"/>
                        <input id="sIntColorCd" class="form_comboBox" style="width:49%"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_form"><input id="tSearchDt" class="form_comboBox" style="width:70%"></th><!-- 계약일 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.vinSts' /></th><!-- 차량상태 -->
                    <td>
                        <input id="sCarStatCd" type="text" class="form_comboBox">
                    </td>
                </tr>

            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="mainGrid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->


    <!-- 팝업으로 변경된 숨김 영역  -->
    <section id="vehicleMstWindow" class="pop_wrap">

        <!-- 기본정보 -->
        <div>
            <div class="header_area">
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-11299" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_s btn_save" id="btnMainSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                    </dms:access>
                </div>
            </div>
            <form id="detailForm" name="detailForm" method="POST" action="/">
            <div class="table_form form_width_70per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:16%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr><input id="carId" name="carId" type="hidden" data-json-obj="true" />
                            <input id="ncarDstinCd" name="ncarDstinCd" type="hidden" data-json-obj="true" />
                            <th scope="row"><spring:message code="global.lbl.vinNum" /></th><!-- VIN NO -->
                            <td>
                                <input id="vinNo" name="vinNo" readonly class="form_input form_readonly" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.oldVhBrand" /></th><!-- 브랜드 NF-->
                            <td>
                                <input id="carBrandCd" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.carLine' /></th> <!-- 차종 -->
                            <td>
                                <input id="carlineNm" readonly class="form_input form_readonly" />
                                <input id="carlineCd" type="hidden" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 차관 -->
                            <td>
                                <input id="modelNm" readonly class="form_input form_readonly" />
                                <input id="modelCd" type="hidden" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.ocn' /></th><!-- OCN -->
                            <td>
                                <input id="ocnNm" readonly class="form_input form_readonly" />
                                <input id="ocnCd" type="hidden" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                            <td>
                                <input id="extColorNm" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                            <td>
                                <input id="intColorNm" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.ordTp" /></th><!-- 오더유형 -->
                            <td>
                                <input id="ordTpNm" readonly class="form_input form_readonly" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.chrgCd" /></th><!-- 주문자 NF-->
                            <td>
                                <input id="ordUsrId" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.vinSts' /></th><!-- 차량상태 -->
                            <td>
                                <input id="carStatNm" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.tacticsDeliveryFlag' /></th><!-- 전략출고여부 NF-->
                            <td>
                                <input id="strYn" name="strYn" class="form_comboBox" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.strge" /></th><!-- 창고 -->
                            <td>
                                <input id="strgeCd" name="strgeCd" class="form_comboBox" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.stockDays" /></th><!-- 입고재고일령 NF-->
                            <td>
                                <input id="stockDays" readonly class="form_numeric form_readonly ar" />
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.facOffDays" /></th><!-- 공장출고일령 NF-->
                            <td>
                                <input id="facOffDays" readonly class="form_numeric form_readonly ar" />
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.assignDealer" /></th><!-- 배정딜러 -->
                            <td>
                                <input id="blockSaleAdvNo" readonly class="form_input form_readonly ar" />
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.salesAdvisor" /></th><!-- 판매고문 -->
                            <td>
                                <input id="saleEmpNo" readonly class="form_input form_readonly" />
                            </td>

                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.salDlrCd" /></th><!-- 판매딜러 -->
                            <td>
                                <input id="dlrCd" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.pcDstinTp" /></th><!-- 승/상용 -->
                            <td>
                                <input id="carDstinNm" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.engnNo" /></th><!-- 엔진번호 - 정비기준 2017.08.03 -->
                            <td>
                                <input id="enginSerialNo" name="enginSerialNo" class="form_input" data-json-obj="true"  maxlength="12"/>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.carNo" /></th><!-- 차량번호 -->
                            <td>
                                <input id="carRegNo" name="carRegNo" class="form_input" data-json-obj="true" maxlength="20"/>
                            </td>
<%--
                            <th scope="row"><spring:message code="global.lbl.enginModelCd" /></th><!-- 엔진모델코드 -->
                            <td>
                                <input id="enginModelCd" name="enginModelCd" class="form_input" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.enginNo" /></th><!-- 엔진번호 -->
                            <td>
                                <input id="enginSerialNo" name="enginSerialNo" class="form_input" data-json-obj="true" />
                            </td>
 --%>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.makeFactoryCode" /></th><!-- 제조공장코드 NF -->
                            <td>
                                <input id="vinmF20010" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.certNo" /></th><!-- 합격증번호 -->
                            <td>
                                <input id="certNo" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.rfidNo" /></th><!-- RFID NO -->
                            <td>
                                <input id="rfidNo" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.carDispQty' /></th><!-- 배기량 -->
                            <td>
                                <input id="carDispQty" readonly class="form_numeric form_readonly ar" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.keyNo" /></th><!-- KEY번호 -->
                            <td>
                                <input id="keyNo" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.carRetlAmt" /></th><!-- 지도가 NF -->
                            <td>
                                <input id="msPrc" name="msPrc" class="form_numeric form_readonly ar" data-json-obj="true" />
                            </td>

                            <th scope="row"><spring:message code='global.lbl.deductionAmt' /></th><!-- 공제금액 -->
                            <td>
                                <input id="damt" name="damt" class="form_numeric form_readonly ar" data-json-obj="true" />
                            </td>

                            <th scope="row"><spring:message code='sal.lbl.saleRate' /></th><!-- 공제율 -->
                            <td>
                                <input id="damtRate" name="damtRate" class="form_numeric form_readonly ar" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.creDt" /></th><!-- 생산일자 NF -->
                            <td>
                                <input id="signoffDt" name="signoffDt" class="form_datepicker" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.pltGiDt" /></th><!-- 공장출고일자 NF -->
                            <td>
                                <input id="pltGiDt" name="pltGiDt" class="form_datepicker" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.grDt" /></th><!-- 입고일 -->
                            <td>
                                <input id="grDt" class="form_datepicker" />
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.retlDt" /></th><!-- 판매일 NF -->
                            <td>
                                <input id="custSaleDt" class="form_datepicker" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.carRegsDt" /></th><!-- 등록일자 NF -->
                            <td>
                                <input id="regDt" class="form_datepicker" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.grteStartDt" /></th><!-- 보증시작일 NF -->
                            <td>
                                <!-- <input id="invcPublDt" name="invcPublDt" class="form_datepicker" data-json-obj="true" /> GRTE_START_DT로 치환 2017.04.18-->
                                <input id="grteStartDt" name="grteStartDt" class="form_datepicker" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.grteEndDt" /></th><!-- 보증종료일 -->
                            <td>
                                <input id="wrrntEndDt" name="wrrntEndDt" class="form_datepicker" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.contractNo" /></th><!-- 계약번호 -->
                            <td>
                                <input id="contractNo" readonly class="form_input form_readonly" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.fscpRegGrade" /></th><!-- 배기등급 -->
                            <td>
                                <input id="fscpRegGrade" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.purcYn" /></th><!-- 중고차여부 NF -->
                            <td>
                                <input id="purcYn"  class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.nowRunDist' /></th><!-- 주행거리 -->
                            <td>
                                <input id="carRunDistVal" name="carRunDistVal" class="form_numeric form_readonly ar" data-json-obj="true" />
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.lv2DlrStock" /></th><!-- 2급딜러재고 -->
                            <td>
                                <input id="lv2DlrStockYn" name="lv2DlrStockYn" class="form_comboBox" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.lv2DlrOrg" /></th><!-- 2급딜러:TO BE 콤보박스 구현-2급딜러 마스터 테이블 미구현 -->
                            <td>
                                <input id="lv2DlrOrgCd" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.lv2DlrGrDt" /></th><!-- 2급딜러입고일 -->
                            <td>
                                <input id="lv2DlrStockGrDt" name="lv2DlrStockGrDt" class="form_datepicker" data-json-obj="true" />
                            </td>
                            <th scope="row"></th>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </form>
        </div>
        <!-- //기본정보 -->

        <div id="tabstrip" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <%-- <li id="basicInfo" class="k-state-active" selected><spring:message code="sal.lbl.carDetailInfo" /><!-- 차량상세정보 --></li> --%>
                <li id="owner" class="k-state-active" selected><spring:message code="global.lbl.carOwner" /><!-- 차량소유자 --></li>
                <li id="driver"><spring:message code="global.lbl.carDriver" /></li><!-- 차량운전자 -->
                <li id="service"><spring:message code="ser.lbl.lbrHistory" /></li><!-- 정비이력 -->
                <li id="option"><spring:message code="sal.lbl.goods" /></li><!--용품 -->
                <li id="contract"><spring:message code="global.lbl.contract" /></li><!-- 계약 -->
                <li id="order"><spring:message code="global.lbl.order" /></li><!-- 주문 -->
                <li id="engine"><spring:message code="sal.lbl.enginNoHistory" /></li><!-- 엔진히스토리 -->
                <li id="delivery"><spring:message code="sal.lbl.inOutStockHist" /></li><!-- 출입고이력(딜러입고/소매) -->
                <li id="vehicleCombine"><spring:message code="sal.lbl.VehicleCombineReceipt" /></li><!-- 기동차통일영수증 -->
                <li id="addTax"><spring:message code="sal.lbl.AddTaxReceipt" /></li><!-- 부가세영수증 -->
            </ul>
            <!-- //탭메뉴 -->

            <span class="btn_right_absolute">
                <dms:access viewId="VIEW-D-11298" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnAdd" ><spring:message code='global.btn.rowAdd' /></button><!-- 행추가 -->
                </dms:access>
                <dms:access viewId="VIEW-D-11297" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnCancel" ><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
                </dms:access>
            </span>



            <!--차량소유자 탭 영역 -->
            <div class="table_grid">
                <div class="table_grid">
                    <div id="ownerGrid" class="grid"></div>
                </div>
            </div>
            <!--차량운전자 탭 영역 -->
            <div class="table_grid">
                <div class="table_grid">
                    <div id="driverGrid" class="grid"></div>
                </div>
            </div>
            <!--서비스 탭 영역 -->
            <div>
                <div class="table_grid">
                    <div id="serviceGrid" class="grid"></div>
                </div>
            </div>
            <!--옵션 탭 영역 -->
            <div>
                <div class="table_grid">
                    <div id="optionGrid" class="grid"></div>
                </div>
            </div>
            <!-- 계약 -->
            <div>
                <div class="table_form form_width_70per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:24%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.contractNo' /></th>   <!-- 계약번호 -->
                                <td>
                                    <input id="cContractNo" readonly class="form_input form_readonly">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.contractDt' /></th>   <!-- 계약일자 -->
                                <td>
                                    <input id="cContractDt" disabled class="form_datepicker form_disabled" >
                                </td>
                                <th scope="row"><spring:message code='global.lbl.salEmp' /></th>       <!-- 판매사원 -->
                                <td>
                                    <input id="cSaleEmpNo" readonly class="form_input form_readonly">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.custInfo' /></th>        <!-- 계약처 -->
                                <td colspan="3">
                                    <div class="form_float">
                                        <div class="form_left" style="width:42%;">
                                            <input id="cCustNm" readonly class="form_input form_readonly">
                                            <input type="hidden" id="cCustCd">
                                        </div>
                                        <div class="form_right" style="width:58%;">
                                            <input id="cAddr" readonly class="form_input form_readonly">
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"></th>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.carReg' /></th>            <!-- 차량등록 -->
                                <td>
                                    <ul class="tabmenu disabled" >
                                        <li id="tabRegTp01">
                                            <button type="button" disabled><spring:message code='global.lbl.execution' /></button><!-- 대행 -->
                                        </li>
                                        <li id="tabRegTp02" class="on">
                                            <button type="button" disabled><spring:message code='global.lbl.himSelf' /></button><!-- 본인 -->
                                        </li>
                                        <input type="hidden" id="cRegTp">
                                    </ul>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.incReg' /></th>            <!-- 보험등록 -->
                                <td>
                                    <ul class="tabmenu disabled">
                                        <li id="incAapTp01">
                                            <button type="button" disabled><spring:message code='global.lbl.execution' /></button><!-- 대행 -->
                                        </li>
                                        <li id="incAapTp02" class="on">
                                            <button type="button" disabled><spring:message code='global.lbl.himSelf' /></button><!-- 본인 -->
                                        </li>
                                        <input type="hidden" id="cIncAapTp">
                                    </ul>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.fincCmp' /></th>           <!-- 금융사 -->
                                <td>
                                    <input id="cIncCmpNm" readonly class="form_input form_readonly">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="header_area">
                    <h3 class="title_basic"><spring:message code='sal.title.contractPriceInfo' /></h3>     <!-- 계약가격정보 -->
                </div>
                <div class="table_list table_list_v1">
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
                            <col>
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col" rowspan="2"><strong><spring:message code='sal.lbl.realCarAmts' /></strong></th>      <!-- 순차량가격 -->
                                <th scope="col" rowspan="2"><strong><spring:message code='global.lbl.contractAmt' /></strong></th>      <!-- 예판가격 -->
                                <th scope="col" rowspan="2"><spring:message code='sal.lbl.goods' /></th>            <!-- 용품 -->
                                <th scope="col" rowspan="2"><spring:message code='global.lbl.insurance' /></th>     <!-- 보험 -->
                                <th scope="col" rowspan="2"><spring:message code='global.lbl.finc' /></th>          <!-- 금융 -->
                                <th scope="col" rowspan="2"><spring:message code='sal.lbl.usedCar' /></th>          <!-- 중고차 -->
                                <th scope="col" rowspan="2"><spring:message code='global.lbl.execution' /></th>     <!-- 대행 -->
                                <th scope="col" rowspan="2"><spring:message code='sal.lbl.point' /></th>            <!-- 포인트 -->
                                <th scope="col" rowspan="2"><strong><spring:message code='sal.lbl.realPayAmts' /></strong></th>      <!-- 총계합 -->
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="ar child_borderNone"><input id="realAmt" name="realAmt" class="form_numeric ar font_bold" disabled="disabled" data-json-obj="true" /></td>         <!-- 순차량금액 -->
                                <td class="ar child_borderNone"><input id="reservContAmt" name="reservContAmt" class="form_numeric ar font_bold" disabled="disabled" data-json-obj="true" /></td>       <!-- 예판가격 -->
                                <td class="ar child_borderNone"><input id="goodsAmt" name="goodsAmt" class="form_numeric ar font_bold" disabled="disabled" data-json-obj="true" /></td>       <!-- 용품가격 -->
                                <td class="ar child_borderNone"><input id="incAmt" name="incAmt" class="form_numeric ar font_bold" disabled="disabled" data-json-obj="true" /></td>           <!-- 보험료 -->
                                <td class="ar child_borderNone"><input id="fincAmt" name="fincAmt" class="form_numeric ar font_bold" disabled="disabled" data-json-obj="true" /></td>         <!-- 금융 -->
                                <td class="ar child_borderNone"><input id="sbstAmt" name="sbstAmt" class="form_numeric ar font_bold" disabled="disabled" data-json-obj="true" /></td>         <!-- 중고차 -->
                                <td class="ar child_borderNone"><input id="aapAmt" name="aapAmt" class="form_numeric ar font_bold" disabled="disabled" data-json-obj="true" /></td>           <!-- 대행료 -->
                                <td class="ar child_borderNone"><input id="pointAmt" name="pointAmt" class="form_numeric ar font_bold" disabled="disabled" data-json-obj="true" /></td>    <!-- 포인트 -->
                                <td class="ar td_total child_borderNone"><input id="realPayAmt" name="realPayAmt" class="form_numeric ar font_bold" disabled="disabled" data-json-obj="true" /></td>     <!-- 실제지불금액 -->
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //계약 -->
            <!-- 주문 -->
            <div>
                <div class="table_form form_width_100per">
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
                                <th scope="row"><spring:message code='global.lbl.chrgCd' /></th>              <!-- 保?考票名? -->
                                <td>
                                    <input id="oOrdRegUsrId" readonly class="form_input form_readonly">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.ordDlrYyMmDt' /></th>          <!-- 주문년월 -->
                                <td>
                                    <input id="oOrdDlrYyMmDt" readonly class="form_input form_readonly">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.orderWeek' /></th>             <!-- 주문주차 -->
                                <td>
                                    <input id="oOrdMmDt" readonly class="form_input form_readonly">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.ordSeq' /></th>                <!-- 주문일련번호 -->
                                <td>
                                    <input id="oOrdSeq" readonly class="form_input form_readonly">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.wholesalePrice' /></th>        <!-- 도매가격 -->
                                <td class="readonly_area">
                                    <input id="oWhPrc" readonly class="form_numeric">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.dlrOrdReqDt' /></th>           <!-- 주문요청일자 -->
                                <td class="readonly_area">
                                    <input id="oDlrOrdReqDt" readonly class="form_datepicker">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.yard' /></th>                  <!-- 하치장 -->
                                <td>
                                    <input id="oCarDumpCd" readonly class="form_input form_readonly">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.erpOrdNo' /></th>              <!-- ERP주문번호 -->
                                <td>
                                    <input id="oErpOrdNo" readonly class="form_input form_readonly">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.trsfDealer' /></th>            <!-- 운송딜러 -->
                                <td>
                                    <input id="oTrsfDlrCd" readonly class="form_input form_readonly">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.invcPublDt' /></th>            <!-- 인보이스발행일자 -->
                                <td class="readonly_area">
                                    <input id="oInvcPublDt" readonly class="form_datepicker">
                                </td>
                                <td colspan="2"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //주문 -->

            <!-- 재고 -->
            <div>
                <div class="table_grid">
                    <div id="engineHistGrid" class="grid"></div>
                </div>
            </div>
            <!-- //재고 -->

            <div>
                <div class="table_grid">
                    <div id="deliveryGrid" class="grid"></div>
                </div>
            </div>
            <!-- 기동차영수증 -->
            <div>
                <div class="table_form form_width_100per">
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
                                <th scope="row"><spring:message code='sal.lbl.PayTaxPinNo' /></th>              <!-- 납세자식별번호 -->
                                <td class="readonly_area">
                                    <input id="rTaxpayerIdCd" readonly class="form_input form_readonly">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.rcptNo' /></th>                   <!-- 영수증번호 -->
                                <td class="readonly_area">
                                    <input id="rReceiptNo" readonly class="form_input form_readonly">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.ReceiptCd' /></th>                <!-- 영수증코드 -->
                                <td class="readonly_area">
                                    <input id="rReceiptCd" readonly class="form_input form_readonly">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.ReceiptPubDt' /></th>             <!-- 영수증발행일자 -->
                                <td class="readonly_area">
                                    <input id="rReceiptIssDt" readonly class="form_datepicker ac">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.PurchaseComInfo' /></th>          <!-- 영수증발행고객명 -->
                                <td class="readonly_area">
                                    <input id="rReceiptCustNm" readonly class="form_input form_readonly">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.ssnCrnNo' /></th>                 <!-- 증서번호 -->
                                <td class="readonly_area">
                                    <input id="rSsnCrnNo" readonly class="form_input form_readonly">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th>                 <!-- VIN번호 -->
                                <td class="readonly_area">
                                    <input id="rScanVinNo" readonly class="form_input form_readonly">
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.TaxIncludeSumAmtNum' /></th>      <!-- 세금포함금액 -->
                                <td class="readonly_area">
                                    <input id="rSumIncTax" readonly class="form_numeric ar">
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td></td>
                                <th></th>
                                <td></td>
                                <th></th>
                                <td></td>
                                <th></th>
                                <td>
                                    <a href='#' class='btnVehComImage'><span class='txt_label bg_yellow'><spring:message code='global.btn.preview' /></span></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //기동차영수증 -->
            <!-- 부가세영수증 -->
            <div>
                <div class="table_grid">
                    <div id="addTaxReceiptGrid" class="grid"></div>
                </div>
            </div>
            <!-- //부가세영수증 -->
        </div>

        <!-- // 탭 종료 -->
    </section>
    <!-- 팝업으로 변경된 숨김 영역  -->

    <!-- 팝업으로 변경된 숨김 영역  -->
    <section id="imageWindow" class="pop_wrap">
        <div class="header_area">
        </div>

        <div class="table_info table_info">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:100%;">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col"><spring:message code='sal.lbl.Item' /></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="hidden" id="uploadFileBlob" />
                            <img id="scanImageView" name="ScanImageView" width="800">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>

</section>
</div>


<!-- script -->
<script>

//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;
//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
//var vDtyyyyMMdd = vDateTimeFormat.substring(0,10);
var vDtyyyyMMdd = "${_dateFormat}";
// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);
//딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var sevenDay = "${sevenDay}";
var sVinNo = "${sVinNo}";       // CRM에서 넘어오는 VIN NO
var sCarId = "${sCarId}";       //정비에서 넘어오는 CAR ID
var selectTabId;

var sSerFg = "${sSerFg}";  //서비스사용자구분코드

//차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//사용여부
var useYnDs = [{"codeCd":"Y","codeNm":"Y"},{"codeCd":"N","codeNm":"N"}];

//차량상태코드 Array
var carStatDs = [];
<c:forEach var="obj" items="${carStatList}">
    carStatDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//차량상태코드 Map
var carStatMap = dms.data.arrayToMap(carStatDs, function(obj){ return obj.cmmCd; });

//손상여부 Array
var damageCdDs = [];
<c:forEach var="obj" items="${damageCdList}">
    damageCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//손상여부 Map
var damageCdMap = dms.data.arrayToMap(damageCdDs, function(obj){ return obj.cmmCd; });


//합격증상태 Array
var certSecu2CdDs = [];
<c:forEach var="obj" items="${certSecu2CdList}">
    certSecu2CdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//합격증상태 Map
var certSecu2CdMap = dms.data.arrayToMap(certSecu2CdDs, function(obj){ return obj.cmmCd; });


//차량그레이여부 SAL112
var greyList = [];
var greyObj  = {};
<c:forEach var="obj" items="${greyDS}">
    greyList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    greyObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 보증기준 SAL016
var grteStdList = [];
var grteStdObj = {};
<c:forEach var="obj" items="${grteStdDS}">
    grteStdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    grteStdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 자사차량구분 SAL118
var corpCarDstinList = [];
var corpCarDstinObj = {};
<c:forEach var="obj" items="${corpCarDstinDS}">
    corpCarDstinList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    corpCarDstinObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 브랜드 COM019
var carBrandList = [];
var carBrandObj = {};
<c:forEach var="obj" items="${carBrandDS}">
    carBrandList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    carBrandObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//창고
var storageDSList = [];
var strgeCdObj = {};
<c:forEach var="obj" items="${storageList}">
    <c:if test="${obj.strgeTp eq '02'}">
        storageDSList.push({cmmCdNm:"${obj.strgeNm}", cmmCd:"${obj.strgeCd}"});
    </c:if>
    strgeCdObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

// 옵션 - 자재
var OptionDSList = [];

// 계약 - 버튼 처리
var readyRegTp = true, readyIncAapTp = true;

// 상태변동유형 SAL009
var statChgObj = {};
<c:forEach var="obj" items="${statChgDS}">
    statChgObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//공통코드:RO유형 SER031
var roTpCdList = [];
var roTpCdListMap = [];
<c:forEach var="obj" items="${roTpCdList}">
    roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    roTpCdListMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//여부 COM020
var ynDs = [];
<c:forEach var="obj" items="${ynList}">
    ynDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var ynMap = dms.data.arrayToMap(ynDs, function(obj){ return obj.cmmCd; });


//조건기간구분 SAL061
var searchDSList = [];
<c:forEach var="obj" items="${searchDtList}" varStatus="status">
    searchDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//판매취소사유 SAL129
var dlvCnclCusList = [];
<c:forEach var="obj" items="${deliveryCnclCusDS}">
    grteStdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var dlvCnclCusMap = dms.data.arrayToMap(dlvCnclCusList, function(obj){ return obj.cmmCd; });


//판매사원 리스트
var selectSaleEmpDSList = [];
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
</c:forEach>
var selectSaleEmpMap = dms.data.arrayToMap(selectSaleEmpDSList, function(obj){ return obj.saleEmpCd; });


//입출고구분 SAL187
var deliveryTpList = [];
<c:forEach var="obj" items="${deliveryTpDs}">
    deliveryTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var deliveryTpMap = dms.data.arrayToMap(deliveryTpList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {

    if(sVinNo != "" || sVinNo != null){$("#sVinNo").val(sVinNo);}
    if(sCarId != "" || sCarId != null ){$("#sCarId").val(sCarId);}

    /*
    * max 500으로 지정. 여백이 있는경우는 줄여야함
    */

    $("#vehicleMstWindow").kendoWindow({
        animation:false
        ,draggable:false
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.lbl.detailSearch' />"      // 상세조회
        ,width:"980px"
        ,height:"500px"
    }).data("kendoWindow");

    $("#imageWindow").kendoWindow({
        animation:false
        ,draggable:false
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.lbl.detailSearch' />"      // 상세조회
        ,width:"850px"
        ,height:"500px"
    }).data("kendoWindow");


    //날짜검색조건 텍스트
    $("#tSearchDt").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:searchDSList,
        index:0
    });

    $("#sDlrCd").val(dlrCd);    // 딜러코드 세팅
    //$("#sVinNo").val("LBEYFANDXDY229552");    // 임시 테스트

    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sModelCd").data("kendoExtDropDownList").enable(true);

           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
           $("#sOcnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           $("#hiddenFscCode").val("");

           if(dataItem.carlineCd == ""){
               $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sModelCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectModelTypeCombo.do' />"
               ,data:JSON.stringify({"sCarlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    // 모델
    $("#sModelCd").kendoExtDropDownList({
        dataTextField:"fscNm"
       ,dataValueField:"fscCd"
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(true);

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           $("#hiddenFscCode").val("");

           if(dataItem.modelCd == ""){
               $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOcnCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectOcnCombo.do' />"
               ,data:JSON.stringify({"sCarlineCd":$("#sCarlineCd").val(), "sFscCd":dataItem.fscCd})
               ,async:false
           });
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#sModelCd").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#sOcnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){

            //console.log("this.dataItem(e.item).modelCnt:::::"+this.dataItem(e.item).modelCnt);

            if(this.dataItem(e.item).modelCnt > 1){

                dms.notification.info("<spring:message code='sal.info.modelOcnDupWrrMsg'/>");

                return false;
            }

            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(true);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

            $("#hiddenFscCode").val("");

            if(this.dataItem(e.item).ocnCd == ""){
                $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectExtColorCombo.do' />"
                ,data:JSON.stringify({"sModelCd":e.dataItem.modelCd})
                ,async:false
                ,success:function(data) {
                    $("#hiddenFscCode").val(e.dataItem.modelCd);
                }
            });

            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#sExtColorCd").kendoExtDropDownList({
         dataTextField: "extColorNm"
        ,dataValueField:"extColorCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            if(this.dataItem(e.item).extColorCd == ""){
                $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(true);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectIntColorCombo.do' />"
                ,data:JSON.stringify({"sModelCd":$("#hiddenFscCode").val()})
                ,async:false
            });
            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#sIntColorCd").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,optionLabel:" "   // 전체
    });
    $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

    //차량상태
    $("#sCarStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carStatDs
        ,optionLabel:" "  // 전체
    });

    //조회조건 - 계약일(기간)- START
    $("#sStartDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //조회조건 - 계약일(기간)- END
    $("#sEndDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

/*************************** 검색 조건 영역 END **************************************************/

    // 입고재고일령
    $("#stockDays").kendoExtNumericTextBox({
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                 // 소숫점
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 공장출고일령
    $("#facOffDays").kendoExtNumericTextBox({
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                 // 소숫점
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 배기량
    $("#carDispQty").kendoExtNumericTextBox({
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                 // 소숫점
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    //지도가
    $("#msPrc").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    //공제금액
    $("#damt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 공제율
    $("#damtRate").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 주행거리
    $("#carRunDistVal").kendoExtNumericTextBox({
        format:"n0"                // n0:###,###, n2:###,###.##
       ,decimals:0                 // 소숫점
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 순차량금액
    $("#realAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 예판가격
    $("#reservContAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 용품가격
    $("#goodsAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 보험료
    $("#incAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 금융
    $("#fincAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 치환차감(중고차)
    $("#sbstAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 대행료
    $("#aapAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 포인트
    $("#pointAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 실제지불금액
    $("#realPayAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 창고
    $("#strgeCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:storageDSList
       ,optionLabel:" "           //선택

    });
    $("#strgeCd").data("kendoExtDropDownList").enable(false);

    // 입고일
    $("#grDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });
    $("#grDt").data("kendoExtMaskedDatePicker").enable(false);

    // 보증시작일
   $("#grteStartDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });
   $("#grteStartDt").data("kendoExtMaskedDatePicker").enable(false);


   // 차량등록일
   $("#regDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });
   $("#regDt").data("kendoExtMaskedDatePicker").enable(false);

   //자사차량구분
   $("#corpCarDstinCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:corpCarDstinList
       ,optionLabel:" "  // 선택
   });

   // 2급딜러재고여부
   $("#lv2DlrStockYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:[{cmmCdNm:"Y", cmmCd:"Y"}, {cmmCdNm:"N", cmmCd:"N"}]
       ,value:"N"
   });
   $("#lv2DlrStockYn").data("kendoExtDropDownList").enable(false);
   // 2급딜러 TO BE 콤보박스 구현-2급딜러 마스터 테이블 미구현

   //2급딜러입고일
   $("#lv2DlrStockGrDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });
   $("#lv2DlrStockGrDt").data("kendoExtMaskedDatePicker").enable(false);

   //보증종료일
   $("#wrrntEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });
   $("#wrrntEndDt").data("kendoExtMaskedDatePicker").enable(false);

   //브랜드 COM019
/*    $("#carBrandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:carBrandList
       ,optionLabel:" "  // 선택
   }); */

   // 중고차여부
   $("#purcYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:[{cmmCdNm:"Y", cmmCd:"Y"}, {cmmCdNm:"N", cmmCd:"N"}]
       ,value:"N"
   });
   $("#purcYn").data("kendoExtDropDownList").enable(false);

   // 선출고여부
   $("#strYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:[{cmmCdNm:"Y", cmmCd:"Y"}, {cmmCdNm:"N", cmmCd:"N"}]
       ,value:"N"
   });
   $("#strYn").data("kendoExtDropDownList").enable(false);

   // 2급딜러재고여부
   $("#lv2DlrStockYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:[{cmmCdNm:"Y", cmmCd:"Y"}, {cmmCdNm:"N", cmmCd:"N"}]
       ,value:"N"
   });

   // 선출고여부
   $("#preGiYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:[{cmmCdNm:"Y", cmmCd:"Y"}, {cmmCdNm:"N", cmmCd:"N"}]
       ,value:"N"
   });


   // 손상여부
   $("#damageCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:damageCdDs
       ,value:"N"
   });

   // 합격증상태
   $("#certSecu2Cd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:certSecu2CdDs
       ,optionLabel:" "   // 전체
   });

   /***** 계약 *****/
   // 계약일자
   $("#cContractDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
      ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

   $("#signoffDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
      ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });
   $("#signoffDt").data("kendoExtMaskedDatePicker").enable(false);

   $("#pltGiDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
      ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });
   $("#pltGiDt").data("kendoExtMaskedDatePicker").enable(false);

   $("#custSaleDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
      ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });
   $("#custSaleDt").data("kendoExtMaskedDatePicker").enable(false);


   $("#rReceiptIssDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
      ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });
   $("#rReceiptIssDt").data("kendoExtMaskedDatePicker").enable(false);

   /*
   $("#regDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
      ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });
   $("#regDt").data("kendoExtMaskedDatePicker").enable(false);

   $("#invcPublDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
      ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });
   $("#invcPublDt").data("kendoExtMaskedDatePicker").enable(false);
   */

   // 차량등록정보:대행
   $("#tabRegTp01").click(function(){
       if(!readyRegTp){return false;}
       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#cRegTp").val("A");   // SAL126 대행:A , 본인:M
   });
   //차량등록정보:본인
   $("#tabRegTp02").click(function(){
       if(!readyRegTp){return false;}
       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#cRegTp").val("M");       // SAL126 대행:A , 본인:M
   });

   // 보험등록:대행
   $("#incAapTp01").click(function(){
       if(!readyIncAapTp){return false;}
       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#cIncAapTp").val("A");       // SAL126 대행:A , 본인:M
   });
   // 보험등록:본인
   $("#incAapTp02").click(function(){
       if(!readyIncAapTp){return false;}
       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#cIncAapTp").val("M");       // SAL126 대행:A , 본인:M
   });

   /***** 주문 *****/
   $("#oWhPrc").kendoExtNumericTextBox({                    // 구매가격
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,value:0.00
      ,spinners:false             // 증,감 화살표
   });

   $("#rSumIncTax").kendoExtNumericTextBox({                    // 세금포함합계금액
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,value:0.00
      ,spinners:false             // 증,감 화살표
   });

   $("#oDlrOrdReqDt").kendoExtMaskedDatePicker({          // 주문요청일자
       format:"<dms:configValue code='dateFormat' />"
      ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });



   $("#oInvcPublDt").kendoExtMaskedDatePicker({           //인보이스발행일자
       format:"<dms:configValue code='dateFormat' />"
      ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });
   /********************************** 상세내역 영역 END ************************************/
    // 상세정보
    $("#btnVehicleDetail").kendoButton({
        click:function(e){

            var grid = $("#mainGrid").data("kendoExtGrid");
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
     $("#mainGrid").on("dblclick", "tr.k-state-selected", function (e) {
         var gridId = e.delegateTarget.id
           , grid = $("#"+gridId+"").data("kendoExtGrid")
           , selectedItem = grid.dataItem(grid.select());

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
             refresh();
             // 팝업오픈;
             viewPopup();

             $("#carId").val(selectedVal.carId);
             $("#ncarDstinCd").val(selectedVal.ncarDstinCd);
             $("#vinNo").val(selectedVal.vinNo);
             $("#carBrandCd").val(selectedVal.carBrandCd); //NF
             $("#carlineNm").val(selectedVal.carlineNm);
             $("#carlineCd").val(selectedVal.carlineCd);
             $("#modelNm").val(selectedVal.modelNm);
             $("#modelCd").val(selectedVal.modelCd);

             $("#ocnNm").val(selectedVal.ocnNm);
             $("#ocnCd").val(selectedVal.ocnCd);
             $("#extColorNm").val(selectedVal.extColorNm);
             $("#intColorNm").val(selectedVal.intColorNm);
             $("#ordTpNm").val(selectedVal.ordTpNm);

             $("#ordUsrId").val(selectedVal.regUsrId);
             $("#carStatNm").val(selectedVal.carStatNm);

             if(selectedVal.strgeCd != null &&  selectedVal.strgeCd != ""){
                 $("#strgeCd").data("kendoExtDropDownList").value(selectedVal.strgeCd); // 차종
             }

             $("#strYn").data("kendoExtDropDownList").value(selectedVal.strYn); //NF
             $("#stockDays").data("kendoExtNumericTextBox").value(selectedVal.stockDays); //NF
             $("#facOffDays").data("kendoExtNumericTextBox").value(selectedVal.facOffDays); //NF
             $("#blockSaleAdvNo").val(selectedVal.saleAdvUsrNm);

             $("#dlrCd").val(selectedVal.dlrCd);
             $("#carDstinNm").val(selectedVal.carDstinNm);
             //$("#enginModelCd").val(selectedVal.enginModelCd);
             $("#vinmF20010").val(selectedVal.vinmF20010); //NF

             $("#enginSerialNo").val(selectedVal.enginSerialNo);
             $("#certNo").val(selectedVal.certNo);
             $("#rfidNo").val(selectedVal.rfidNo);
             $("#carDispQty").data("kendoExtNumericTextBox").value(selectedVal.carDispQty);

             $("#keyNo").val(selectedVal.keyNo);
             $("#msPrc").data("kendoExtNumericTextBox").value(Number(selectedVal.msPrc)); //NF
             $("#damtRate").data("kendoExtNumericTextBox").value(Number(selectedVal.damtRate)); //NF
             $("#damt").data("kendoExtNumericTextBox").value(Number(selectedVal.damt)); //NF
             $("#signoffDt").data("kendoExtMaskedDatePicker").value(selectedVal.signoffDt); //NF

             $("#pltGiDt").data("kendoExtMaskedDatePicker").value(selectedVal.pltGiDt); //NF
             $("#grDt").data("kendoExtMaskedDatePicker").value(selectedVal.grDt);
             $("#custSaleDt").data("kendoExtMaskedDatePicker").value(selectedVal.custSaleDt); //NF
             $("#regDt").data("kendoExtMaskedDatePicker").value(selectedVal.regDt); //NF

             $("#grteStartDt").data("kendoExtMaskedDatePicker").value(selectedVal.grteStartDt); //NF
             $("#contractNo").val(selectedVal.contractNo);
             $("#saleEmpNo").val(selectedVal.saleEmpNo);
             $("#purcYn").data("kendoExtDropDownList").value(selectedVal.purcYn); //NF

             $("#carRunDistVal").data("kendoExtNumericTextBox").value(selectedVal.carRunDistVal);
             $("#lv2DlrStockYn").data("kendoExtDropDownList").value(selectedVal.lv2DlrStockYn);
             $("#lv2DlrOrgCd").val(selectedVal.lv2DlrOrgCd);
             $("#lv2DlrStockGrDt").data("kendoExtMaskedDatePicker").value(selectedVal.lv2DlrStockGrDt);
             //$("#wrrntEndDt").data("kendoExtMaskedDatePicker").value(selectedVal.wrrntEndDt);

             $("#fscpRegGrade").val(selectedVal.fscpRegGrade);
             $("#carRegNo").val(selectedVal.carRegNo);

             if(dms.string.isNotEmpty(selectedVal.grteStartDt)){
                 var responseJson = dms.ajax.getJson({
                     url:"<c:url value='/sal/veh/vehicleMaster/selectWrrntEndDt.do' />"
                     ,data:JSON.stringify({"sVinNo":selectedVal.vinNo, "sCustSaleDt":selectedVal.grteStartDt, "sCarDstinCd":selectedVal.carDstinCd})
                     ,async:false
                 });


                 if( responseJson.total > 0 ){
                     $("#wrrntEndDt").data("kendoExtMaskedDatePicker").value(responseJson.data[0].wrrntEndDt);     //보증종료일
                 }else{
                     $("#wrrntEndDt").data("kendoExtMaskedDatePicker").value(responseJson.data[0].wrrntEndDt);
                 }
             }

             // 탭 조회
             selectTab(selectTabId);

             if(selectedVal.contractNo != null && selectedVal.contractNo != ""){
                 //계약금액정보
                 $.ajax({
                     url:"<c:url value='/sal/cnt/contractMnt/selectContractReSearch.do' />",
                     data:JSON.stringify({sContractNo:selectedVal.contractNo}),
                     type:"POST",
                     dataType:"json",
                     contentType:"application/json",
                     error:function(jqXHR,status,error){
                         dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                     }

                 }).done(function(result) {

                     if(result.total != 0){

                         var resultVal = result.data[0];

                         /* 계약가격정보 */
                         $("#realAmt").data("kendoExtNumericTextBox").value(resultVal.realCarAmt != null ? resultVal.realCarAmt :0);              // 순차량가격
                         $("#reservContAmt").data("kendoExtNumericTextBox").value(resultVal.reservContAmt != null ? resultVal.reservContAmt:0);   // 예판가격
                         $("#goodsAmt").data("kendoExtNumericTextBox").value(resultVal.goodsAmt != null ? resultVal.goodsAmt :0);                 // 용품가격
                         $("#incAmt").data("kendoExtNumericTextBox").value(resultVal.incAmt != null ? resultVal.incAmt :0);                       // 보험료
                         $("#fincAmt").data("kendoExtNumericTextBox").value(resultVal.fincFeeAmt != null ? resultVal.fincFeeAmt :0);              // 금융
                         $("#sbstAmt").data("kendoExtNumericTextBox").value(resultVal.sbstAmt != null ? resultVal.sbstAmt :0);                    // 치환차감
                         $("#aapAmt").data("kendoExtNumericTextBox").value(resultVal.aapAmt != null ? resultVal.aapAmt :0);                       // 대행료
                         $("#pointAmt").data("kendoExtNumericTextBox").value(resultVal.pointAmt != null ? resultVal.pointAmt :0);                 // 대행료
                         $("#realPayAmt").data("kendoExtNumericTextBox").value(resultVal.realPayAmt != null ? resultVal.realPayAmt :0);           // 실제지불금액
                     }
                 });
             }else {
                 /* 계약가격정보 */
                 $("#realAmt").data("kendoExtNumericTextBox").value(0);         // 순차량가격
                 $("#reservContAmt").data("kendoExtNumericTextBox").value(0);   // 예판가격
                 $("#goodsAmt").data("kendoExtNumericTextBox").value(0);        // 용품가격
                 $("#incAmt").data("kendoExtNumericTextBox").value(0);          // 보험료
                 $("#fincAmt").data("kendoExtNumericTextBox").value(0);         // 금융
                 $("#sbstAmt").data("kendoExtNumericTextBox").value(0);         // 치환차감
                 $("#aapAmt").data("kendoExtNumericTextBox").value(0);          // 대행료
                 $("#pointAmt").data("kendoExtNumericTextBox").value(0);        // 대행료
                 $("#realPayAmt").data("kendoExtNumericTextBox").value(0);      // 실제지불금액
             }


             // 옵션 데이터셋(추가버튼 사용)
/*                 $.ajax({
                 url:"<c:url value='/sal/veh/vehicleMaster/selectOptionList.do' />",
                 data:JSON.stringify({"modelCd":selectedVal.modelCd, "ocnCd":selectedVal.ocnCd}),
                 type:'POST',
                 dataType:'json',
                 contentType:'application/json',
                 async:false,
                 error:function(jqXHR,status,error) {
                     dms.notification.error(jqXHR.responseJSON.errors);
                 },
                 success:function(jqXHR, textStatus) {
                     OptionDSList = jqXHR;
                 }
             }); */


         } else {
             // {상세정보}을(를) 확인하여 주세요.
             dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
             return;
         }
     }
     /*****************************************************************************
     ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
     *******************************************************************************/
    //버튼 - 조회
    $("#btnMainSearch").kendoButton({
        click:function(e){
            var fromDt = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
            var toDt = $("#sEndDt").data("kendoExtMaskedDatePicker").value();

            if(salesJs.validate.isFromDateValid(fromDt, toDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sStartDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(toDt, fromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sEndDt").focus();
               return false;
            }

            if(!salesJs.validate.isDateValidPeriod(fromDt, toDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sEndDt").focus();
               return false;
            }

            refresh();
            $('#mainGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    // 저장/수정
    $("#btnMainSave").kendoButton({
        click:function(e) {

            if($("#vinNo").val() == ""){
                // 차량을(를) 선택하세요.
                dms.notification.warning("<spring:message code='global.lbl.car' var='globalLblCar' /><spring:message code='global.info.check.field' arguments='${globalLblCar}' />");
                return false;
            }

            var data = $("#detailForm").serializeObject($("#detailForm").serializeArrayInSelector("[data-json-obj='true']"));

            data.grteStartDt = $("#grteStartDt").data("kendoExtMaskedDatePicker").value();
            data.carRegDt = $("#regDt").data("kendoExtMaskedDatePicker").value();
            data.lv2DlrStockGrDt = $("#lv2DlrStockGrDt").data("kendoExtMaskedDatePicker").value();
            data.grDt = $("#grDt").data("kendoExtMaskedDatePicker").value();

            var ownerGrid = $("#ownerGrid").data("kendoExtGrid");
            var driverGrid = $("#driverGrid").data("kendoExtGrid");
            var ownerGridData = ownerGrid.getCUDData("insertList", "updateList", "deleteList");
            var driverGridData = driverGrid.getCUDData("insertList", "updateList", "deleteList");



            // form 데이터 및 그리드 변경 데이터 세팅
            var param = $.extend(
               {"vehicleMasterVO":data}
               ,{"ownerGridVO":ownerGridData}
               ,{"driverGridVO":driverGridData}
            );


            $.ajax({
                url:"<c:url value='/sal/veh/vehicleMaster/saveVehicleMasterMain.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(param),
                error:function(jqXHR,status,error){
                    //console.log(jqXHR);
                },
                success:function(data){
                    $("#vehicleMstWindow").data("kendoWindow").close();
                    refresh();
                    $("#mainGrid").data("kendoExtGrid").dataSource.read();
                    // 저장이 완료되었습니다.
                    dms.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
                }
            });

        }
    });




    //팝업 - 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            var mainGrid = $("#mainGrid").data("kendoExtGrid");
            if(mainGrid.select().index() == -1){
                // 차량을(를) 선택하세요.
                dms.notification.warning("<spring:message code='global.lbl.car' var='globalLblCar' /><spring:message code='global.info.check.field' arguments='${globalLblCar}' />");
                return false;
            }else {

                var grid;

                if(selectTabId == 'owner'){
                    grid = $('#ownerGrid').data('kendoExtGrid');
                    var rowChkCnt1 = 0;

                    $.each(grid.dataSource.data(), function(idx, dataItem){
                        if(dataItem.isNew()){
                            rowChkCnt1 = rowChkCnt1+1;
                        }
                    });

                    if(rowChkCnt1 < 1){

                        $.each(grid.dataSource.data(), function(idx, dataItem){
                            var gridData = grid.dataSource.at(idx);
                            if(gridData.useYn == "Y"){
                                gridData.set("useYn", "N");
                                dataItem.set("dirty", true);
                            }
                        });

                        grid.dataSource.insert(0, {
                            "dlrCd":$("#dlrCd").val()
                           ,"vinNo":$("#vinNo").val()
                           ,"carId":$("#carId").val()
                           ,"seq":""
                           ,"bpCd":""
                           ,"bpNm":""
                           ,"useYn":"Y"
                       });
                    }else{
                        return false;
                    }
                }else if(selectTabId == 'driver'){
                    grid = $('#driverGrid').data('kendoExtGrid');
                    var rowChkCnt2 = 0;

                    $.each(grid.dataSource.data(), function(idx, dataItem){
                        if(dataItem.isNew()){
                            rowChkCnt2 = rowChkCnt2+1;
                        }
                    });

                    if(rowChkCnt2 < 1){

                        $.each(grid.dataSource.data(), function(idx, dataItem){
                            var gridData = grid.dataSource.at(idx);
                            if(gridData.useYn == "Y"){
                                gridData.set("useYn", "N");
                                dataItem.set("dirty", true);
                            }
                        });

                        grid.dataSource.insert(0, {
                            "dlrCd":$("#dlrCd").val()
                           ,"vinNo":$("#vinNo").val()
                           ,"carId":$("#carId").val()
                           ,"seq":""
                           ,"bpCd":""
                           ,"bpNm":""
                           ,"mdriverYn":"Y"
                           ,"useYn":"Y"
                       });
                    }else{
                        return false;
                    }
                }else {
                    return false;
                }
            }
        }
    });



    // 팝업 - 취소버튼
    $("#btnCancel").kendoButton({
        click:function(e) {

            if(selectTabId == 'owner'){
                $('#ownerGrid').data('kendoExtGrid').cancelChanges();
            }else if(selectTabId == 'driver'){
                $('#driverGrid').data('kendoExtGrid').cancelChanges();
            }

        }
    });

    //그리드 설정
    $("#mainGrid").kendoExtGrid({
        gridId:"G-SAL-0721-115901"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/veh/vehicleMaster/selectVehicleMaster.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var srchDlrCd = dlrCd;
                        var sModelCd = "";
                        var sFscCd = "";

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        if(sSerFg == "N"){
                            srchDlrCd = srchDlrCd;                                                  // 딜러
                        }else{
                            srchDlrCd = "";                                                         // 딜러
                        }

                        params["sDlrCd"] = srchDlrCd;                                               // 딜러

                        params["sVinNo"] = $("#sVinNo").val();                                       // 빈넘버
                        params["sCarStatCd"] = $("#sCarStatCd").data("kendoExtDropDownList").value();   // 차량상태
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();   // 차종

                        if(dms.string.isNotEmpty($("#hiddenFscCode").val())){
                            sModelCd = $("#hiddenFscCode").val();
                        }else{
                            sFscCd = $("#sModelCd").data("kendoExtDropDownList").value();
                        }

                        params["sFscCd"]   = sFscCd;    // fsc코드
                        params["sModelCd"]   = sModelCd;    // 모델
                        params["sOcnCd"]     = $("#sOcnCd").data("kendoExtDropDownList").value();       // OCN
                        params["sExtColorCd"]= $("#sExtColorCd").data("kendoExtDropDownList").value();  // 외장색
                        params["sIntColorCd"]= $("#sIntColorCd").data("kendoExtDropDownList").value();  // 내장색
                        params["sCarId"]     = $("#sCarId").val();                                   // CAR ID
                        params["sSrchDtType"]   = $("#tSearchDt").data("kendoExtDropDownList").value();    //일자검색 조건
                        params["sStartDt"] = $("#sStartDt").data("kendoExtMaskedDatePicker").value();   //검색시작일
                        params["sEndDt"] = $("#sEndDt").data("kendoExtMaskedDatePicker").value();       //검색종료일

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                        carId       :{type:"string"}
                        ,vinNo      :{type:"string"}
                        ,ncarDstinCd:{typoe:"string"}
                        ,carStatNm  :{type:"string"}
                        ,carlineCd:{type:"string"}    //차종코드
                        ,carlineNm  :{type:"string"}
                        ,modelNm    :{type:"string"}
                        ,ocnCd         :{type:"string"}               //OCN코드
                        ,ocnNm      :{type:"string"}
                        ,extColorCd    :{type:"string"}               //외색코드
                        ,extColorNm :{type:"string"}
                        ,intColorCd    :{type:"string"}               //내색코드
                        ,intColorNm :{type:"string"}
                        ,grteStartDt:{type:"date"}
                        ,grDt       :{type:"date"}
                        ,carRegDt   :{type:"date"}
                        ,lv2DlrStockGrDt:{type:"date"}
                        ,custSaleDt:{type:"date"}
                        ,carDstinCd    :{type:"string"}
                    }
                }
            }
        }
        ,height:384
        ,editable:false
        ,selectable:"row"
        ,change:function(e) {

            if(!e.sender.dataItem(e.sender.select()).isNew()){
                var selectedVal = this.dataItem(this.select());
                var carId = selectedVal.carId;

                if ( dms.string.isNotEmpty(carId) ) {
                    $("#btnVehicleDetail").data("kendoButton").enable(true);
                }

            };
        }
        ,reorderable:false                  //컬럼순서변경가능여부
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:true                //Tooltip 적용, default:false
        ,autoBind:false
        ,navigatable:true
        ,sortable:false
        ,columns:[
                     {field:"vinNo"     ,title:"<spring:message code='global.lbl.vinNum' />"    ,width:130  ,attributes:{"class":"ac"}}   //VIN NO
                    ,{field:"carId"     ,title:"<spring:message code='sal.lbl.carId' />"        ,width:100  ,attributes:{"class":"ac"}, hidden:true}   //CAR ID
                    ,{field:"carStatNm" ,title:"<spring:message code='global.lbl.vinSts' />"    ,width:80   ,attributes:{"class":"al"}}   //차량상태
                    ,{field:"carlineCd",     title:"<spring:message code='global.lbl.carlineCd' />",      width:80,  attributes:{"class":"ac"}}//차종code
                    ,{field:"carlineNm",     title:"<spring:message code='global.lbl.carlineNm' />",      width:80, attributes:{"class":"al"}}//차종description
                    ,{field:"modelNm",       title:"<spring:message code='global.lbl.model' />",          width:140, attributes:{"class":"al"}} //모델description
                    ,{field:"ocnCd",         title:"<spring:message code='global.lbl.ocnCode' />",        width:80,  attributes:{"class":"ac"}} //OCNcode
                    ,{field:"ocnNm",         title:"<spring:message code='global.lbl.ocnNm' />",          width:140, attributes:{"class":"al"}} //OCNdescription
                    ,{field:"extColorCd",    title:"<spring:message code='global.lbl.extColorCd' />",     width:80,  attributes:{"class":"ac"}} //외장색code
                    ,{field:"extColorNm",    title:"<spring:message code='global.lbl.extColorNm' />",     width:80,  attributes:{"class":"al"}} //외장색description
                    ,{field:"intColorCd",    title:"<spring:message code='global.lbl.intColorCd' />",     width:80,  attributes:{"class":"ac"}} //내장색code

                ]
    });

    // 탭
    selectTabId = "owner";       // 초기값:차량소유자
    $("#tabstrip").kendoExtTabStrip({
        animation:false
       ,select:function(e) {
            selectTabId = e.item.id;
            //selectTab(selectTabId); // 탭 조회

            if(selectTabId == 'owner' || selectTabId == 'driver'){
                $("#btnAdd").show();
                $("#btnCancel").show();
            }else {
                $("#btnAdd").hide();
                $("#btnCancel").hide();
            }
        }
    });

    // 차량소유자 그리드.
    $("#ownerGrid").kendoExtGrid({
        gridId:"G-SAL-0721-115902"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/veh/vehicleMaster/selectVehicleMasterOwner.do' />"
                    , dataType:"json"
                    , type:"POST"
                    , contentType:"application/json;"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["sort"] = options.sort;

                        params["sDlrCd"] = dlrCd;
                        params["sVinNo"] = $("#vinNo").val();
                        params["sCarId"] = $("#carId").val();
                        return kendo.stringify(params);
                    }
                }
            }
            , schema:{
                model:{
                    id:"ownerPk"
                    ,fields:{
                         ownerPk:{ type:"string"}
                       , dlrCd:{ type:"string"}
                       , carId:{ type:"string"}
                       , vinNo:{ type:"string"}
                       , seq  :{ type:"number"}
                       , bpCd :{ type:"string"}
                       , bpNm:{ type:"string",editable:false}
                       , useYn:{ type:"string"}
                       , txtObjectCd:{ type:"string"}
                       , regUsrId:{ type:"string",editable:false}
                       , regDt:{ type:"date",editable:false}
                    }
                }
            }
        }
        ,edit:function(e){
            var eles = e.container.find("input");
            var fieldName;

            if(eles.length > 1){
                fieldName = eles[eles.length-1].getAttribute("name");
            }else{
                fieldName = eles.attr("name");
            }
            var input = e.container.find(".k-input");

            if(fieldName == "useYn"){
                this.closeCell();
            }
        }
        , selectable:"row" //선택가능하게
        , pageable:false
        , autoBind:false
        , editableOnlyNew:true
        , editableOnlyNewExcludeColumns:["txtObjectCd"]
        , height:150
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , enableTooltip:true               //Tooltip 적용, default:false
        , appendEmptyColumn:true          //빈컬럼 적용. default:false
        , filterable:false                 // 필터링 기능 사용안함
        , sortable:false
        , columns:[ {field:"dlrCd", hidden:true}
                    , {field:"carId", hidden:true}
                    , {field:"vinNo", hidden:true}
                    , {field:"seq", hidden:true}
                    , {field:"bpCd", title:"<spring:message code='global.lbl.custNo' />", width:140//고객코드
                        ,attributes:{"class":"ac"}
                        ,editor:function(container, options) {
                             if(!options.model.isNew()){
                                 container.context.innerText = options.model.bpCd
                                 return ;
                                }
                            $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:selectBpPopupWindow();"></a></div>')
                            .appendTo(container)
                        }
                      }
                    , {field:"bpNm", title:"<spring:message code='global.lbl.custNm' />", width:150, attributes:{"class":"al"}}//고객명
                    , { field:"useYn",title:"<spring:message code='global.lbl.useYn' />", width:90
                        , attributes:{"class":"ac"}
                        ,editor:function(container, options) {
                            $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                autoBind:false
                                ,dataSource:["Y","N"]
                            });
                            $('<span class="k-invalid-msg" data-for="useYn"></span>').appendTo(container);
                        }
                      }//사용여부
                    //, { field:"txtObjectCd", title:"<spring:message code='global.lbl.txtObjectCd' />", width:180, attributes:{"class":"ac"}}   //신분증스캔(문서번호)
                    , { field:"regUsrId", title:"<spring:message code='global.lbl.regUsrId' />", width:90, attributes:{"class":"al"}} //등록자
                    , { field:"regDt",    title:"<spring:message code='global.lbl.regDt' />",    width:90, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //등록일
                ]
    });

    // 차량운전자 그리드.
    $("#driverGrid").kendoExtGrid({
        gridId:"G-SAL-0721-115903"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/veh/vehicleMaster/selectVehicleMasterDriver.do' />"
                    , dataType:"json"
                    , type:"POST"
                    , contentType:"application/json;"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["sort"] = options.sort;

                        params["sDlrCd"] = dlrCd;
                        params["sCarId"] = $("#carId").val();
                        params["sVinNo"] = $("#vinNo").val();
                        return kendo.stringify(params);
                    }
                }
            }
            , schema:{
                model:{
                    id:"driverPk"
                    ,fields:{
                         dirverPk:{ type:"string"}
                       , dlrCd:{ type:"string"}
                       , carId:{ tpye:"string"}
                       , vinNo:{ type:"string"}
                       , seq  :{ type:"number"}
                       , bpCd :{ type:"string"}
                       , bpNm:{ type:"string",editable:false}
                       , mdriverYn:{ type:"string", validation:{required:true}}
                       , useYn:{ type:"string", validation:{required:true}}
                       , txtObjectCd:{ type:"string"}
                       , regUsrId:{ type:"string",editable:false}
                       , regDt:{ type:"date",editable:false}
                    }
                }
            }
        }
        , selectable:"row" //선택가능하게
        , pageable:false
        , autoBind:false
        , editableOnlyNew:true
        , editableOnlyNewExcludeColumns:["useYn"]
        , filterable:false
        , height:150
        , indvColumnVisible:true             //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true         //컬럼순서 변경 개인화 적용. default:true
        , enableTooltip:true               //Tooltip 적용, default:false
        , filterable:false                 // 필터링 기능 사용안함
        , sortable:false
        , columns:[ {field:"dlrCd", hidden:true}
                    , {field:"carId", hidden:true}
                    , {field:"vinNo", hidden:true}
                    , {field:"seq", hidden:true}
                    , {field:"bpCd", title:"<spring:message code='global.lbl.custNo' />", width:120//고객코드
                        ,attributes:{"class":"ac"}
                        ,editor:function(container, options) {
                             if(!options.model.isNew()){
                                 container.context.innerText = options.model.bpCd
                                 return ;
                                }
                            $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:selectBpPopupWindow();"></a></div>')
                            .appendTo(container)
                        }
                      }
                    , {field:"bpNm", title:"<spring:message code='global.lbl.custNm' />", width:200, attributes:{"class":"ac"}}//고객명
                    , {     // 주운전자 여부
                        field:"mdriverYn",title:"<spring:message code='global.lbl.driverYn' />", width:100
                        , attributes:{"class":"ac"}
                        ,editor:function(container, options) {
                            $('<input required name="mdriverYn" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                autoBind:false
                                ,dataSource:["Y","N"]
                            });
                            $('<span class="k-invalid-msg" data-for="mdriverYn"></span>').appendTo(container);
                        }
                    }
                    , {     // 사용여부
                        field:"useYn",title:"<spring:message code='global.lbl.useYn' />", width:80
                        , attributes:{"class":"ac"}
                        ,editor:function(container, options) {
                            $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                autoBind:false
                                ,dataSource:["Y","N"]
                            });
                            $('<span class="k-invalid-msg" data-for="useYn"></span>').appendTo(container);
                        }
                    }
                    , { field:"txtObjectCd", hidden:true}
                    , { field:"regUsrId", title:"<spring:message code='global.lbl.regUsrId' />", width:80, attributes:{"class":"ac"}} //등록자
                    , { field:"regDt",    title:"<spring:message code='global.lbl.regDt' />",    width:80, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //등록일
                ]
    });

    // 서비스 그리드.
    $("#serviceGrid").kendoExtGrid({
        gridId:"G-SAL-0721-115904"
        ,dataSource:{
            transport:{
                read:{
                    //url:"<c:url value='/ser/ro/repairOrder/selectRepairOrders.do' />"
                    url:"<c:url value='/sal/veh/vehicleMaster/selectServiceRepairOrders.do' />"

                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sDlrCd"] = dlrCd;
                        params["sVinNo"] = $("#vinNo").val();
                        //params["sCarId"] = $("#carId").val();

                        //console.log(JSON.stringify(params));
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,resvDocNo:{type:"string", editable:false}
                        ,roDocNo:{type:"string", editable:false}
                    }
                }
            }
        }

        ,selectable:"row" //선택가능하게
        ,height:150
        ,pageable:false
        ,autoBind:false
        ,editable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,filterable:false
        ,columns:[
            {field:"dlrCd", title:"<spring:message code='global.lbl.dealer' />", width:100, attributes:{"class":"ac"}, hidden:true}  // 딜러
            ,{field:"carRegNo", title:"<spring:message code='global.lbl.carNo' />", width:100, attributes:{"class":"ac"}}                    // 차량번호
            ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNo' />", width:150, attributes:{"class":"ac"}}                       // VIN
            ,{field:"carOwnNm", title:"<spring:message code='global.lbl.carOwner' />", width:100, attributes:{"class":"ac"}}                 // 차량소유주
            ,{field:"driverNm", title:"<spring:message code='global.lbl.vsitr' />", width:100, attributes:{"class":"ac"}}                    // 방문자
            ,{field:"carNm", title:"<spring:message code='global.lbl.car' />", width:100, attributes:{"class":"ac"}}                         // 차량
            ,{field:"runDistVal", title:"<spring:message code='global.lbl.runDist' />", width:70, attributes:{"class":"ar"}}                   // 주행거리
            ,{field:"roDocNo", title:"<spring:message code='global.lbl.roDocNo' />", width:150, attributes:{"class":"ac"}}                       // RO번호
            ,{field:"rnum", title:"<spring:message code='ser.lbl.roDt' />", width:100, attributes:{"class":"ar"}, hidden:true}     // RO확인시간
            ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:100
                , attributes:{"class":"ac"}
                , editor:function(container, options){
                    $('<input data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        , dataValueField:"cmmCd"
                        , dataSource:roTpCdList
                    });
                }
                , template:'#if (roTp !== ""){# #= roTpCdListMap[roTp]# #}#'
            }                                // RO유형
        ]
    });

    // 옵션 그리드.
    $("#optionGrid").kendoExtGrid({
        gridId:"G-SAL-0721-115905"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/veh/vehicleMaster/selectVehicleMasterOption.do' />"
                    , dataType:"json"
                    , type:"POST"
                    , contentType:"application/json;"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["sort"] = options.sort;

                        params["sDlrCd"] = dlrCd;
                        params["sVinNo"] = $("#vinNo").val();
                        params["sCarId"] = $("#carId").val();
                        params["sModelCd"] = $("#modelCd").val();
                        params["sOcnCd"] = $("#ocnCd").val();
                        return kendo.stringify(params);
                    }
                }
            }
            , schema:{
                model:{
                    id:"pkgCd"
                    , fields:{
                        dlrCd:{ type:"string"}
                       ,vinNo:{ type:"string"}
                       ,pkgCd  :{ type:"string"}
                       ,pkgNm  :{ type:"string"}
                       ,useYn  :{ type:"string"}
                       ,regUsrId:{ type:"string", editable:false}
                       ,regDt:{ type:"date", editable:false}
                    }
                }
            }
        }
        , pageable:false
        , autoBind:false
        , edit:function(e){
            var grid = this,
            fieldName = grid.columns[e.container.index()].field;
            if(fieldName === "pkgCd"){
                 this.closeCell();
            }
        }
        , editableOnlyNew:true
        , editableOnlyNewExcludeColumns:["useYn"]
        , height:150
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , enableTooltip:true               //Tooltip 적용, default:false
        , filterable:false
        , columns:[ {field:"dlrCd", hidden:true}
                    , {field:"vinNo", hidden:true}
                    , { field:"pkgCd", title:"<spring:message code='global.lbl.pkgCd' />", width:150,attributes:{"class":"ac"}} // 자재코드
                    , {  // 자재명
                        field:"pkgNm", title:"<spring:message code='global.lbl.pkgNm' />", width:200
                        ,headerAttributes:{"class":"ac"}, attributes:{"class":"al"}
                        ,template:"#= bf_selectOption(pkgCd, pkgNm) #"
                        ,editor:function (container, options){
                            $('<input required name="pkgNm" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                autoBind:false
                                ,dataTextField:"optionNm"
                                ,dataValueField:"optionCd"
                                ,dataSource:OptionDSList
                                ,select:function(e){
                                    var dataItem = this.dataItem(e.item);

                                    var grid = $("#optionGrid").data("kendoExtGrid");
                                    var row  = grid.select();
                                    var uid  = row[0].attributes["data-uid"].nodeValue;
                                    var dataSourceRow = grid.dataSource.getByUid(uid);
                                    dataSourceRow.set("pkgCd", dataItem.optionCd);
                                }
                            });
                            $('<span class="k-invalid-msg" data-for="pkgNm"></span>').appendTo(container);
                        }
                    }
                    , { field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:150
                        , attributes:{"class":"ac"}
                        ,editor:function(container, options) {
                            $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                autoBind:false
                                ,dataSource:["Y","N"]
                            });
                            $('<span class="k-invalid-msg" data-for="netingUseYn"></span>').appendTo(container);
                        }
                    }//사용여부
                    , { field:"regUsrId", title:"<spring:message code='global.lbl.regUsrId' />", width:80, attributes:{"class":"ac"}} //등록자
                    , { field:"regDt",    title:"<spring:message code='global.lbl.regDt' />",    width:80, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //등록일
                ]
    });


    // 엔진번호히스토리 그리드.
    $("#engineHistGrid").kendoExtGrid({
        gridId:"G-SAL-0802-161901"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/veh/vehicleMaster/selectVehicleMasterEngineHistory.do' />"
                    , dataType:"json"
                    , type:"POST"
                    , contentType:"application/json;"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sVinNo"] = $("#vinNo").val();

                        return kendo.stringify(params);
                    }
                }
            }
            , schema:{
                model:{
                    id:"seq"
                    , fields:{
                        seq:{type:"number"}
                       ,vinNo:{type:"string"}
                       ,oldEnginNo:{type:"string"}
                       ,newEnginNo:{type:"string"}
                       ,regUsrId:{type:"string"}
                       ,regDtChar:{type:"string"}
                    }
                }
            }
        }
        , pageable:false
        , autoBind:false
        , editable:false
        , height:150
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , enableTooltip:true               //Tooltip 적용, default:false
        , filterable:false
        , columns:[ {field:"vinNo", hidden:true}
                    ,{ field:"seq", title:"<spring:message code='global.lbl.noName' />", width:80, attributes:{"class":"ac"}}//순번
                    ,{ field:"oldEngineNo", title:"<spring:message code='sal.lbl.oldEngineNo' />", width:80, attributes:{"class":"al"}}//구엔진번호
                    ,{ field:"newEngineNo", title:"<spring:message code='sal.lbl.newEngineNo' />", width:80, attributes:{"class":"al"}}//신엔진번호
                    ,{ field:"regUsrId", title:"<spring:message code='global.lbl.regUsrId' />", width:80, attributes:{"class":"ac"}} //등록자
                    ,{ field:"regDtChar",    title:"<spring:message code='global.lbl.regDt' />",    width:80, attributes:{"class":"ac"}} //등록일
                ]
    });

    // 딜러입고 판매 그리드.
    $("#deliveryGrid").kendoExtGrid({
        gridId:"G-SAL-0324-194000"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/veh/vehicleMaster/selectVehicleMasterDeliveryHist.do' />"
                    , dataType:"json"
                    , type:"POST"
                    , contentType:"application/json;"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sDlrCd"] = dlrCd;
                        params["sVinNo"] = $("#vinNo").val();
                        params["sCarId"] = $("#carId").val();
                        return kendo.stringify(params);
                    }
                }
            }
            , schema:{
                model:{
                    id:"kmopt"
                    , fields:{
                       workDt:{type:"date"}   //작업일자
                      ,kmvin:{type:"string"}    //빈
                      ,kmopt:{type:"string"}    //작업구분
                    }
                }
            }
        }
        , pageable:false
        , autoBind:false
        , editable:false
        , height:150
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , enableTooltip:true               //Tooltip 적용, default:false
        , filterable:false
        , appendEmptyColumn :true           //빈컬럼 적용. default :false

        , columns:[ {field:"workDt", title:"<spring:message code='global.lbl.date' />", width:140, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateTimeFormat' />}"}         //일자
                   ,{field:"kmvin", title:"<spring:message code='global.lbl.vinNo' />", width:200, attributes:{"class":"ac"}}         //VIN_NO
                   ,{field:"kmopt", title:"<spring:message code='global.lbl.mesgTmplGrpTp' />", width:140, attributes:{"class":"al"}
                       ,template:"# if(deliveryTpMap[kmopt] != null) { # #= deliveryTpMap[kmopt].cmmCdNm# # }#"
                   }//작업구분
                   ]
    });

    // 영수증 관리 그리드 시작
    $("#addTaxReceiptGrid").kendoExtGrid({
        gridId:"G-SAL-0407-090400"
            ,dataSource:{
                transport:{
                   read:{
                       url:"<c:url value='/sal/rcp/selectSalesAddTaxReceiptSearch.do' />"
                   }
                   ,parameterMap:function(options, operation) {
                       if (operation === "read") {

                           var params = {};
                           params["sort"] = options.sort;

                           params["sVinNo"] = $("#vinNo").val();
                           params["sCarId"] = $("#carId").val();

                           return kendo.stringify(params);

                       } else if (operation !== "read" && options.models) {
                           return kendo.stringify(options.models);
                       };
                   }
               }
               ,schema:{
                   model:{
                       id:"vinNo"
                       ,fields:{
                           vinNo:{type:"string"}
                           ,seq:{type:"number"}
                           ,receiptNo:{type:"string"}
                           ,receiptIssDt:{type:"date"}
                           ,uploadDt:{type:"date"}
                           ,buyNm:{type:"string"}
                           ,taxpayerIdCd:{type:"string"}
                           ,sdlrCd:{type:"string"}
                           ,sumAmt:{type:"number"}
                           ,taxAmt:{type:"number"}
                           ,carlineNm:{type:"string"}
                           ,modelNm:{type:"string"}
                           ,wsPrc:{type:"number"}
                           ,extColorNm:{type:"string"}
                           ,dlrCd:{type:"string"}
                           ,pltGiDt:{type:"date"}
                           ,receiptImg:{type:"string"}
                       }
                   }
               }
           }
           ,pageable:false
           ,autoBind:false
           ,editable:false
           ,height:150
           ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
           ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
           ,enableTooltip:true               //Tooltip 적용, default:false
           ,filterable:false
           ,appendEmptyColumn :true           //빈컬럼 적용. default :false
           ,columns:[
                {field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", width:150}                  /* VIN */
               ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carLine' />", width:80}               /* 차종 */
               ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:200}                /* 모델 */
               ,{field:"wsPrc", title:"<spring:message code='sal.lbl.guideAmt' />", width:100, attributes :{"class":"ar"}, format:"{0:n2}"}                  /* 지도가격 */
               ,{field:"extColorNm", title:"<spring:message code='sal.lbl.extColor' />", width:100}             /* 외색 */
               ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:80 ,attributes:{"class":"ac"}}                  /* 딜러코드 */
               ,{field:"pltGiDt", title:"<spring:message code='sal.lbl.custSaleDt' />", width:100
                    ,attributes:{"class":"ac"}
                    ,format: "{0:<dms:configValue code='dateFormat' />}"
                 }              /* 출고일자 */
               ,{field:"sumAmt", title:"<spring:message code='sal.lbl.PublishAmt' />", width:100, attributes :{"class":"ar"}, format:"{0:n2}"}               /* 발행금액 */
               ,{field:"taxAmt", title:"<spring:message code='sal.lbl.vatAmt' />", width:100, attributes :{"class":"ar"}, format:"{0:n2}"}                   /* 발행세액 */
               ,{field:"receiptImg", title:"<spring:message code='sal.lbl.RcptImage' />", width:100
                   ,attributes:{"class":"ac"}
                   ,template:function(dataItem){
                       if(!dms.string.isEmpty(dataItem.receiptNo)){
                           return "<a href='#' class='btnAddTaxImage'><span class='txt_label bg_yellow'><spring:message code='global.btn.search' /></span></a>";
                       }
                       return "";
                    }
                }            /* 영수증이미지 */
           ]
       });
    // 영수증 관리 그리드 종료

    // 영수증 이미지 팝업
    var receiptImagePopupWindow;
    $(document).on("click", ".btnVehComImage", function(e){
        $("#uploadFileBlob").val("");
        $.ajax({
            url:"<c:url value='/sal/rcp/selectReceiptImageSearch.do' />"
            ,data:JSON.stringify({sCarId:$("#carId").val(),sVinNo:$("#rScanVinNo").val(),sReceiptNo:$("#rReceiptNo").val()}) //车辆主信息管理功能 详细信息下的 机动车统一发票 查询规则更新  新需求 NO 31 贾明 2019-11-27
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,async:false
            ,error:function(jqXHR,status,error){
                // itemCd not use check message
            }
            ,success:function(data, textStatus){
                $("#uploadFileBlob").val(data.receiptImg);
                imageLoader();
            }
        });

        var win = $("#imageWindow").data("kendoWindow");
        win.center();
        win.open();
    });

    $(document).on("click", ".btnAddTaxImage", function(e){
        $("#uploadFileBlob").val("");

        var grid = $("#addTaxReceiptGrid").data("kendoExtGrid");
        var rows = grid.select();
        if(rows !== null) {
            var data = [];
            $.each(rows, function(idx, row){
                data.push(grid.dataItem(row));
            });
        }

        $.ajax({
            url:"<c:url value='/sal/rcp/selectAddTaxReceiptImageSearch.do' />"
            ,data:JSON.stringify({sCarId:data[0].carId, sSeq:data[0].seq})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,async:false
            ,error:function(jqXHR,status,error){
                // itemCd not use check message
            }
            ,success:function(data, textStatus){
                $("#uploadFileBlob").val(data.receiptImg);
                imageLoader();
            }
        });

        var win = $("#imageWindow").data("kendoWindow");
        win.center();
        win.open();
    });

    $("#tabstrip").data("kendoExtTabStrip").select(0);

    if($("#sCarId").val() != ""){
        $('#mainGrid').data('kendoExtGrid').dataSource.page(1);
    }

    //자동조회
    <c:if test="${sVinNo ne ''}">
        $('#mainGrid').data('kendoExtGrid').dataSource.page(1);
    </c:if>
});

function imageLoader(){
    var fileView = document.querySelector("img");
    var bolbBytes = $("#uploadFileBlob").val();
    var fileData = window.atob(bolbBytes);
    fileView.src = fileData;

    fileView.onload = function() {
        if(this.width > 800){
            fileView.width = 800;
        }else{
            fileView.width = this.width;
        }
    };
}


//팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
function viewPopup(){
    var win = $("#vehicleMstWindow").data("kendoWindow");
    win.center();
    win.open();
}

var popupWindow;
//고객 팝업 열기 함수.
function selectBpPopupWindow(){


    //console.log(">>>>>>");

    popupWindow = dms.window.popup({
        windowId:"bpCdPopup"
        ,title:"<spring:message code = 'global.title.custSearch'/>"   // 고객 조회
        ,width:800
        ,height:500
        ,content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"closeYn":"Y"
                ,"autoBind":true
                ,"callbackFunc":function(data){
                    var grid;
                    if(selectTabId == 'owner'){
                        grid = $('#ownerGrid').data('kendoExtGrid');
                    }else if(selectTabId == 'driver'){
                        grid = $('#driverGrid').data('kendoExtGrid');
                    }
                    var dataItems = grid.dataSource._data;
                    var checkVal = true;

                    // 중복값 체크
                    /* $.each(dataItems, function(idx, obj){
                        if(data[0].bpCd == obj.subBpCd){
                            checkVal = false;
                        }
                    }); */
                    if(checkVal){
                        var dataItem = grid.dataItem(grid.select());

                        dataItem.bpCd = data[0].custNo;
                        dataItem.bpNm = data[0].custNm;
                        grid.refresh();
                    }
                    //popupWindow.close();
                }
            }
        }
    });
}

/**
 *  탭별 데이터 조회
 */
function selectTab(tabId){
    if($("#vinNo").val() == ""){ return false; }

    //switch (tabId){
        //case 'owner':                                                                       // 차량소유자
            $("#ownerGrid").data("kendoExtGrid").dataSource.read();
            //break;
        //case 'driver':                                                                      // 차량운전자
            $("#driverGrid").data("kendoExtGrid").dataSource.read();
            //break;
        //case 'service':                                                                     // 서비스
            $("#serviceGrid").data("kendoExtGrid").dataSource.read();
            //break;
        //case 'option':                                                                      // 옵션
            //$("#optionGrid").data("kendoExtGrid").dataSource.read();
            //break;
        //case 'contract':                                                                    // 계약

            $.ajax({
                url:"<c:url value='/sal/veh/vehicleMaster/selectVehicleMasterContract.do' />",
                data:JSON.stringify({"sDlrCd":dlrCd, "sCarId":$("#carId").val()}),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                async:false,
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(jqXHR, textStatus) {
                    if(jqXHR.data != null){
                        readyRegTp = true;
                        readyIncAapTp = true;

                        $("#cContractNo").val(jqXHR.data[0].contractNo);
                        $("#cContractDt").data("kendoExtMaskedDatePicker").value(jqXHR.data[0].contractDt);

                        //판매사원
                        //var saleEmpNo = selectSaleEmpMap[jqXHR.data[0].saleEmpNo].saleEmpNm;
                        //$("#cSaleEmpNo").val(saleEmpNo);
                        $("#cSaleEmpNo").val(jqXHR.data[0].saleEmpNm);
                        $("#cCustNm").val(jqXHR.data[0].custNm);
                        $("#cCustCd").val(jqXHR.data[0].custCd);
                        $("#cAddr").val(jqXHR.data[0].addr);
                        if(jqXHR.data[0].regTp == "A"){        // 대행
                            $("#tabRegTp01").click();
                        }else{                                 // 본인
                            $("#tabRegTp02").click();
                        }
                        readyRegTp = false;

                        if(jqXHR.data[0].incAapTp == "A"){    // 대행
                            $("#incAapTp01").click();
                        }else{                                // 본인
                            $("#incAapTp02").click();
                        }
                        readyIncAapTp = false;

                        $("#cIncCmpNm").val(jqXHR.data[0].incCmpCd);
                    }
                }
            });

            //break;
        //case 'order':                                                                       // 주문

            $.ajax({
                url:"<c:url value='/sal/veh/vehicleMaster/selectVehicleMasterOrder.do' />",
                data:JSON.stringify({"sVinNo":$("#vinNo").val(), "sCarId":$("#carId").val()}),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                async:false,
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(jqXHR, textStatus) {
                    if(jqXHR.data != null){
                        $("#oOrdRegUsrId").val(jqXHR.data[0].ordRegUsrId); // 주문자
                        $("#oOrdDlrYyMmDt").val(jqXHR.data[0].ordDlrYyMmDt);
                        $("#oOrdMmDt").val(jqXHR.data[0].ordMmDt);
                        $("#oOrdSeq").val(jqXHR.data[0].ordSeq);
                        $("#oWhPrc").data("kendoExtNumericTextBox").value(jqXHR.data[0].whPrc != "null"? jqXHR.data[0].whPrc:"0.00");
                        $("#oDlrOrdReqDt").data("kendoExtMaskedDatePicker").value(jqXHR.data[0].dlrOrdReqDt);
                        $("#oCarDumpCd").val(jqXHR.data[0].carDumpCd);
                        $("#oErpOrdNo").val(jqXHR.data[0].erpOrdNo);
                        $("#oTrsfDlrCd").val(jqXHR.data[0].trsfDlrCd);
                        $("#oInvcPublDt").data("kendoExtMaskedDatePicker").value(jqXHR.data[0].invcPublDt);
                    }
                }
            });

            //break;
        //case 'stock':              // 엔진번호히스토리
            $("#engineHistGrid").data("kendoExtGrid").dataSource.read();
            //break;
        //case 'delivery':              // 딜러입고, 소매
            $("#deliveryGrid").data("kendoExtGrid").dataSource.read();
            //break;


        //case 'vehicleCombineReceipt':        // 기동차영수증

            $.ajax({
                url:"<c:url value='/sal/rcp/selectVehicleInfoMotorVehInvoSearch.do' />" // selectReceiptDetailPopupSearch 更改 NO 31 DMS端车辆主信息的发票展示逻辑确定如下：1、车辆对应的发票，只有初审通过状态，没有复核通过的情况，那就以最新审核通过展示；2、有复核通过的发票，那就展示最新复核通过的。贾明 2019-11-28
                ,data:JSON.stringify({sCarId:$("#carId").val()})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,async:false
                ,error:function(jqXHR,status,error){
                    // itemCd not use check message
                      //贾明  当发票信息为空时，查看发票图片按钮为不显示 start 2020-1-13 
                       if(jqXHR.status == '200'){
                          $(".btnVehComImage").hide();
                       }
                    // 贾明  当发票信息为空时，查看发票图片按钮为不显示 end 2020-1-13 
                }
                ,success:function(data, textStatus){
                    $("#rTaxpayerIdCd").val(data.taxpayerIdCd);
                    $("#rReceiptNo").val(data.receiptNo);
                    $("#rReceiptCd").val(data.receiptCd);
                    $("#rReceiptIssDt").val(kendo.toString(kendo.parseDate(data.receiptIssDt), "yyyy-MM-dd"));
                    $("#rReceiptCustNm").val(data.receiptCustNm);
                    $("#rSsnCrnNo").val(data.ssnCrnNo);
                    $("#rScanVinNo").val(data.scanVinNo);
                    $("#rSumIncTax").data("kendoExtNumericTextBox").value(data.sumIncTax != "null"? data.sumIncTax:"0.00");
                }
            });

            //break;
        //case 'addTaxReceipt':              // 부가세영수증
            $("#addTaxReceiptGrid").data("kendoExtGrid").dataSource.read();
            //break;


        //default :
            //break;
    //}
}

// optionGrid- 자재의 template 정의
function bf_selectOption(pkgCd, pkgNm){
    if(pkgNm != ""){
        return pkgNm;
    }
    if(pkgCd == ""){
        return "";
    }
}

// 내용 초기화
function refresh(){
    $("#carId").val('');
    $("#vinNo").val('');
    $("#carBrandCd").val(''); //NF
    $("#carlineNm").val('');
    $("#carlineCd").val('');
    $("#modelNm").val('');
    $("#modelCd").val('');

    $("#ocnNm").val('');
    $("#ocnCd").val('');
    $("#extColorNm").val('');
    $("#intColorNm").val('');
    $("#ordTpNm").val('');

    $("#ordUsrId").val('');
    $("#carStatNm").val('');
    $("#strgeCd").data("kendoExtDropDownList").value(''); // 차종

    $("#strYn").data("kendoExtDropDownList").value(''); //NF
    $("#stockDays").data("kendoExtNumericTextBox").value(0); //NF
    $("#facOffDays").data("kendoExtNumericTextBox").value(0); //NF
    $("#blockSaleAdvNo").val(''); //블러킹판매고문

    $("#dlrCd").val('');
    $("#carDstinNm").val('');
    //$("#enginModelCd").val('');
    $("#vinmF20010").val(''); //NF

    $("#enginSerialNo").val('');
    $("#certNo").val('');
    $("#rfidNo").val('');
    $("#carDispQty").data("kendoExtNumericTextBox").value(0);

    $("#keyNo").val('');
    $("#msPrc").data("kendoExtNumericTextBox").value(0.00); //NF
    $("#damt").data("kendoExtNumericTextBox").value(0.00); //NF
    $("#damtRate").data("kendoExtNumericTextBox").value(0.00); //NF
    $("#signoffDt").data("kendoExtMaskedDatePicker").value(''); //NF

    $("#pltGiDt").data("kendoExtMaskedDatePicker").value(''); //NF
    $("#grDt").data("kendoExtMaskedDatePicker").value('');
    $("#custSaleDt").data("kendoExtMaskedDatePicker").value(''); //NF
    $("#regDt").data("kendoExtMaskedDatePicker").value(''); //NF

    $("#grteStartDt").data("kendoExtMaskedDatePicker").value(''); //NF
    $("#contractNo").val('');
    $("#saleEmpNo").val('');
    $("#purcYn").data("kendoExtDropDownList").value(''); //NF

    $("#carRunDistVal").data("kendoExtNumericTextBox").value(0);
    $("#lv2DlrStockYn").data("kendoExtDropDownList").value('');
    $("#lv2DlrOrgCd").val('');
    $("#lv2DlrStockGrDt").data("kendoExtMaskedDatePicker").value('');
    $("#wrrntEndDt").data("kendoExtMaskedDatePicker").value('');
    $("#fscpRegGrade").val('');

    $("#carRegNo").val('');

    //차량소유자
    $("#ownerGrid").data("kendoExtGrid").dataSource.data([]);
    // 차량운전자
    $("#driverGrid").data("kendoExtGrid").dataSource.data([]);
    // 서비스
    $("#serviceGrid").data("kendoExtGrid").dataSource.data([]);
    // 옵션
    $("#optionGrid").data("kendoExtGrid").dataSource.data([]);
    // 계약
    $("#cContractNo").val('');
    $("#cContractDt").data("kendoExtMaskedDatePicker").value('');
    $("#cSaleEmpNo").val('');
    $("#cCustNm").val('');
    $("#cCustCd").val('');
    $("#cAddr").val('');
    readyRegTp = true;
    $("#tabRegTp02").click();
    readyRegTp = false;
    readyIncAapTp = true;
    $("#incAapTp02").click();
    readyIncAapTp = false;
    $("#cIncCmpNm").val('');

    /* 계약가격정보 */
    $("#realAmt").data("kendoExtNumericTextBox").value(0);       // 순차량가격
    $("#reservContAmt").data("kendoExtNumericTextBox").value(0); // 예판가격
    $("#goodsAmt").data("kendoExtNumericTextBox").value(0);      // 용품가격
    $("#incAmt").data("kendoExtNumericTextBox").value(0);        // 보험료
    $("#fincAmt").data("kendoExtNumericTextBox").value(0);       // 금융
    $("#sbstAmt").data("kendoExtNumericTextBox").value(0);       // 치환차감
    $("#aapAmt").data("kendoExtNumericTextBox").value(0);        // 대행료
    $("#pointAmt").data("kendoExtNumericTextBox").value(0);      // 대행료
    $("#realPayAmt").data("kendoExtNumericTextBox").value(0);    // 실제지불금액

    //주문
    $("#oOrdRegUsrId").val('');
    $("#oOrdDlrYyMmDt").val('');
    $("#oOrdMmDt").val('');
    $("#oOrdSeq").val('');
    $("#oWhPrc").data("kendoExtNumericTextBox").value("0.00");
    $("#oDlrOrdReqDt").data("kendoExtMaskedDatePicker").value('');
    $("#oCarDumpCd").val('');
    $("#oErpOrdNo").val('');
    $("#oTrsfDlrCd").val('');
    $("#oInvcPublDt").data("kendoExtMaskedDatePicker").value('');

    //엔진번호이력
    $("#engineHistGrid").data("kendoExtGrid").dataSource.data([]);

    //출입고이력
    $("#deliveryGrid").data("kendoExtGrid").dataSource.data([]);

    //기동차영수증
    $("#rTaxpayerIdCd").val('');
    $("#rReceiptNo").val('');
    $("#rReceiptCd").val('');
    $("#rReceiptIssDt").data("kendoExtMaskedDatePicker").value('');
    $("#rReceiptCustNm").val('');
    $("#rSsnCrnNo").val('');
    $("#rScanVinNo").val('');
    $("#rSumIncTax").data("kendoExtNumericTextBox").value("0.00");

    //부가세영수증
    $("#addTaxReceiptGrid").data("kendoExtGrid").dataSource.data([]);

    OptionDSList = [];
}

</script>
<!-- //script -->
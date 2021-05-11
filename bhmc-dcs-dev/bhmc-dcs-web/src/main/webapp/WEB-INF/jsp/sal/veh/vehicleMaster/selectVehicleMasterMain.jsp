<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 차량마스터 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="global.title.vehicleMaster" /></h1><!-- 차량마스터 관리 -->
        <div class="left_area">
            <%-- <span class="span_txt"><spring:message code="global.lbl.dealer" /></span>    <!-- 딜러 -->
            <span class="readonly_area">
                <input id="sDlrCd" readonly class="form_input" style="width:156px;" />
            </span> --%>
            <span class="txt_label bg_green">${dlrNm}[${dlrCd}]</span>
        </div>
        <div class="btn_right">
            <button id="btnVehicleDetail" class="btn_m btn_modify"><spring:message code='global.btn.update' /><!-- 상세 --></button>
            <button class="btn_m btn_search" id="btnMainSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            <%-- <button class="btn_m btn_search" id="btnOtherSave"><spring:message code="global.btn.save" /></button> --%><!-- 정비 신규등록을 위한 테스트용. -->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnMainSearch">
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
                    <th scope="row"><spring:message code="sal.lbl.carId" /></th><!-- CAR ID -->
                    <td>
                        <input id="sCarId" type="text" value="" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.vinNum" /></th><!-- VIN NO -->
                    <td>
                        <!-- <input id="sVinNo1" type="text" class="form_input" style="width:49%;">
                        <input id="sVinNo2" type="text" class="form_input" style="width:49%;"> -->
                        <input id="sVinNo" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code='global.lbl.vinSts' /></th><!-- 차량상태 -->
                    <td>
                        <input id="sCarStatCd" type="text" class="form_comboBox">
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
                    </td>
                    <th scope="row"><spring:message code="global.lbl.ocn" /></th>   <!-- OCN -->
                    <td>
                        <input id="sOcnCd" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                    <td>
                        <input id="sExtColorCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                    <td>
                        <input id="sIntColorCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row" class="th_form"><input id="tSearchDt" class="form_comboBox" style="width:80%"></th><!-- 계약일 -->
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
                </tr>
                <%-- <tr>
                    <th scope="row"><spring:message code='global.lbl.assignYn' /></th><!-- 보유상태 -->
                    <td>
                        <input id="sOwnStatCd" type="text" class="form_comboBox">
                    </td>
                    <td colspan="2"></td>
                </tr> --%>
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
                    <button class="btn_s btn_save" id="btnMainSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                </div>
            </div>
            <form id="detailForm" name="detailForm" method="POST" action="/">
            <div class="table_form form_width_70per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:12%;">
                        <col style="width:15%;">
                        <col style="width:11%;">
                        <col style="width:15%;">
                        <col style="width:11%;">
                        <col style="width:12%;">
                        <col style="width:10%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr><input id="carId" name="carId" type="hidden" data-json-obj="true" />
                            <%-- <th><spring:message code="sal.lbl.carId" /></th><!-- CAR ID -->
                            <td>
                                <input id="carId" name="carId" readonly class="form_input form_readonly" data-json-obj="true" />
                            </td> --%>
                            <th scope="row"><spring:message code="global.lbl.vinNum" /></th><!-- VIN NO -->
                            <td>
                                <input id="vinNo" name="vinNo" readonly class="form_input form_readonly" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.stockMonth" /></th><!-- 재고월령 -->
                            <td>
                                <input id="mmCnt" readonly class="form_numeric form_readonly ar" />
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.assignDealer" /></th><!-- 배정딜러 -->
                            <td>
                                <input id="blockSaleAdvNo" readonly class="form_input form_readonly ar" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.chrgCd" /></th><!-- 주문딜러 -->
                            <td>
                                <input id="ordDlrCd" readonly class="form_input form_readonly" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.ncarDstin" /></th><!-- 신차구분 -->
                            <td>
                                <input id="ncarDstinNm" readonly class="form_input form_readonly" />
                                <input type="hidden" id="ncarDstinCd" name="ncarDstinCd" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.shareYn" /></th><!-- 공개여부 -->
                            <td>
                                <input id="openYn"  class="form_comboBox form_readonly" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.stockDay" /></th><!-- 재고일령 -->
                            <td>
                                <input id="ddCnt" readonly class="form_numeric form_readonly ar" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.carLine' /></th> <!-- 차종 -->
                            <td>
                                <input id="carlineNm" readonly class="form_input form_readonly" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                            <td>
                                <input id="modelNm" readonly class="form_input form_readonly" />
                                <input id="modelCd" type="hidden" />
                            </td>
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
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.vinSts' /></th><!-- 차량상태 -->
                            <td>
                                <input id="carStatNm" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.ownStatCd" /></th><!-- 보유상태 -->
                            <td>
                                <input id="ownStatNm" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.stockCd" /></th><!-- 재고유형 -->
                            <td>
                                <input id="stockNm" readonly class="form_input form_readonly" />
                            </td>
                           <th scope="row"><spring:message code="sal.lbl.pcDstinTp" /></th><!-- 승/상용 -->
                            <td>
                                <input id="carDstinNm" readonly class="form_input form_readonly" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.strge" /></th><!-- 창고 -->
                            <td>
                                <input id="strgeCd" name="strgeCd" class="form_comboBox" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.location" /></th><!-- 위치 -->
                            <td>
                                <input id="locCd" name="locCd" class="form_comboBox" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.salDlrCd" /></th><!-- 판매딜러 -->
                            <td>
                                <input id="dlrCd" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.saleType" /></th><!-- 판매유형 -->
                            <td>
                                <input id="saleTp" readonly class="form_input form_readonly" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.contractNo" /></th><!-- 계약번호 -->
                            <td>
                                <input id="contractNo" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.greyYn" /></th><!-- 그레이여부 -->
                            <td>
                                <input id="greyYn" name="greyYn" class="form_comboBox" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.grDt" /></th><!-- 입고일 -->
                            <td>
                                <input id="grDt" class="form_datepicker" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.carRegNo" /></th><!-- 차량등록번호 -->
                            <td>
                                <input id="carRegNo" name="carRegNo" class="form_input" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.manufactYyMmDt" /></th><!-- 제작년월 -->
                            <td>
                                <input id="manufactYyMmDt" class="form_datepicker" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.grteStartDt" /></th><!-- 보증시작일 -->
                            <td>
                                <input id="grteStartDt" name="grteStartDt" class="form_datepicker" data-json-obj="true" />
                            </td>
                            <%-- <th scope="row"><spring:message code="global.lbl.grteEndDt" /></th><!-- 보증종료일 -->
                            <td>
                                <input id="grteEndDt" name="grteEndDt" type="text" class="form_datepicker" data-json-obj="true" />
                            </td> --%>
                            <th scope="row"><spring:message code="sal.lbl.jeongpanNo" /></th><!-- 정판형호번호 -->
                            <td>
                                <input id="jeongpanNo" name="jeongpanNo" type="text" class="form_input" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.salesAdvisor" /></th><!-- 판매고문 -->
                            <td>
                                <input id="saleEmpNo" readonly class="form_input form_readonly" />
                            </td>
                        </tr>
                        <tr>
                            <%-- <th scope="row"><spring:message code="global.lbl.grteStdCd" /></th><!-- 보증기준 -->
                            <td>
                                <input id="grteStdCd" name="grteStdCd" class="form_comboBox" data-json-obj="true" />
                            </td> --%>
                            <th scope="row"><spring:message code="global.lbl.carLineRegDt" /></th><!-- 차량등록일 -->
                            <td>
                                <input id="carRegDt" name="carRegDt" class="form_datepicker" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.corpCarDstin" /></th><!-- 자사차량구분 -->
                            <td>
                                <input id="corpCarDstinCd" name="corpCarDstinCd" class="form_comboBox" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.ordTp" /></th><!-- 오더유형 -->
                            <td>
                                <input id="ordTpNm" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.rfidNo" /></th><!-- RFID NO -->
                            <td>
                                <input id="rfidNo" readonly class="form_input form_readonly" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.cmpCarYn" /></th><!-- 회사차여부 -->
                            <td>
                                <input id="cmpCarYn" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.cmpCarDstinCd" /></th><!-- 회사차구분 -->
                            <td>
                                <input id="cmpCarDstinNm" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.serviceAd" /></th><!-- 서비스고문 -->
                            <td>
                                <input id="tecId" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.certNo" /></th><!-- 합격증상태 -->
                            <td>
                                <input id="certSecu2Cd" name="certSecu2Cd" class="form_comboBox" data-json-obj="true" />
                            </td>
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

                            <th scope="row">2级经销商入库日</th><!-- 2급딜러입고일 -->
                            <td>
                                <input id="lv2DlrStockGrDt" name="lv2DlrStockGrDt" class="form_datepicker" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.nowRunDist' /></th><!-- 주행거리 -->
                            <td>
                                <input id="carRunDistVal" name="carRunDistVal" class="form_numeric" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.enginModelCd" /></th><!-- 엔진모델코드 -->
                            <td>
                                <input id="enginModelCd" name="enginModelCd" class="form_input" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.enginNo" /></th><!-- 엔진번호 -->
                            <td>
                                <input id="enginSerialNo" name="enginSerialNo" class="form_input" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.certNo" /></th><!-- 합격증번호 -->
                            <td>
                                <input id="certNo" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.brand" /></th><!-- 브랜드 -->
                            <td>
                                <input id="carBrandCd" name="carBrandCd" class="form_comboBox" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.purcPrc" /></th><!-- 구매가격 -->
                            <td>
                                <input id="retlPrc" name="retlPrc" class="form_input form_readonly ar" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.wholesalePrice" /></th><!-- 도매가격 -->
                            <td>
                                <input id="whslPrc" name="whslPrc" class="form_input form_readonly ar" data-json-obj="true" />
                            </td>

                            <th scope="row"><spring:message code='global.lbl.deductionRate' /></th><!-- 공제비율 -->
                            <td>
                                <input id="ddctRate" name="ddctRate" class="form_input form_readonly ar" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.carNm" /></th><!-- 차량명 -->
                            <td>
                                <input id="carNm" name="carNm" class="form_input" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.keyNo" /></th><!-- KEY번호 -->
                            <td>
                                <input id="keyNo" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.preGiYn' /></th><!-- 선출고여부 -->
                            <td>
                                <input id="preGiYn" name="preGiYn" class="form_comboBox" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.vehicleStat' /></th><!-- 손상여부 -->
                            <td>
                                <input id="damageCd" name="damageCd" class="form_comboBox" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.carDispQty' /></th><!-- 배기량 -->
                            <td>
                                <input id="carDispQty" name="carDispQty" class="form_numeric" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.remark' /></th><!-- 비고 -->
                            <td colspan="5">
                                <input id="remark" name="remark" class="form_input" data-json-obj="true" />
                            </td>
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
                <li id="stock"><spring:message code="sal.lbl.strgeMoveHis" /></li><!-- 창고이동이력 -->
                <li id="delivery"><spring:message code="sal.lbl.inOutStockHist" /></li><!-- 출입고이력(딜러입고/소매) -->
            </ul>
            <!-- //탭메뉴 -->

            <!--차량소유자 탭 영역 -->
            <div class="mt0">
                <div class="header_area">
                    <div class="btn_right">
                        <button class="btn_s btn_save" id="btnOwnerSave"><spring:message code='global.btn.save' /></button>     <!-- 저장 -->
                        <button class="btn_s btn_add" id="btnOwnerAdd"><spring:message code='global.btn.rowAdd' /></button>     <!-- 행추가 -->
                        <button class="btn_s btn_cancel" id="btnOwnerCancel"><spring:message code='global.btn.cancel' /></button>    <!-- 취소 -->
                    </div>
                </div>
                <div class="table_grid">
                    <div id="ownerGrid" class="grid"></div>
                </div>
            </div>
            <!--차량운전자 탭 영역 -->
            <div class="mt0">
                <div class="header_area">
                    <div class="btn_right">
                        <button class="btn_s btn_save" id="btnDriverSave"><spring:message code='global.btn.save' /></button>          <!-- 저장 -->
                        <button class="btn_s btn_add" id="btnDriverAdd"><spring:message code='global.btn.rowAdd' /></button>          <!-- 행추가 -->
                        <button class="btn_s btn_cancel" id="btnDriverCancel"><spring:message code='global.btn.cancel' /></button>    <!-- 취소 -->
                    </div>
                </div>
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
            <div class="mt0">
                <div class="header_area">
                    <div class="btn_right">
                        <button class="btn_s btn_save"   id="btnOptionSave"><spring:message code='global.btn.save' /></button>        <!-- 저장 -->
                        <button class="btn_s btn_add"    id="btnOptionAdd"><spring:message code='global.btn.rowAdd' /></button>       <!-- 행추가 -->
                        <button class="btn_s btn_cancel" id="btnOptionCancel"><spring:message code='global.btn.cancel' /></button>    <!-- 취소 -->
                    </div>
                </div>
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
                                        <li id="tabRegTp01"><button type="button" disabled><spring:message code='global.lbl.execution' /></button></li>                <!-- 대행 -->
                                        <li id="tabRegTp02" class="on"><button type="button" disabled><spring:message code='global.lbl.himSelf' /></button></li>       <!-- 본인 -->
                                        <input type="hidden" id="cRegTp">
                                    </ul>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.incReg' /></th>            <!-- 보험등록 -->
                                <td>
                                    <ul class="tabmenu disabled">
                                        <li id="incAapTp01"><button type="button" disabled><spring:message code='global.lbl.execution' /></button></li>                 <!-- 대행 -->
                                        <li id="incAapTp02" class="on"><button type="button" disabled><spring:message code='global.lbl.himSelf' /></button></li>        <!-- 본인 -->
                                        <input type="hidden" id="cIncAapTp">
                                    </ul>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.fincCmp' /></th>           <!-- 금융사 -->
                                <td>
                                    <input id="cIncCmpCd" readonly class="form_input form_readonly">
                                    <!--<input type="hidden" id="cFincCmpCd">-->
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>


                <div class="header_area">
                    <h3 class="title_basic"><spring:message code='sal.title.contractPriceInfo' /></h3>     <!-- 계약가격정보 -->
                </div>
                <div class="table_list table_list_v1 form_width_70per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:8%;">
                            <col style="width:8%;">
                            <col style="width:8%;">
                            <col style="width:8%;">
                            <col style="width:8%;">
                            <col style="width:8%;">
                            <col style="width:8%;">
                            <col style="width:8%;">
                            <col style="width:9%;">
                            <col style="width:9%;">
                            <col>
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="colgroup" colspan="5" class="hasBob"><spring:message code='global.lbl.vehiclePrice' /></th>                                          <!-- 차량가격 -->
                                <th scope="colgroup" colspan="4" class="hasBob"><spring:message code='sal.lbl.etcAmt' /></th>                                                   <!-- 기타비용 -->
                                <th scope="col" rowspan="2"><strong><spring:message code='sal.lbl.realCarAmt' /></strong></th>                                                  <!--실제차량금액 -->
                                <th scope="col" rowspan="2"><strong><spring:message code='global.lbl.oterAmt' /><br><spring:message code='global.lbl.total' /></strong></th>    <!-- 기타금액<br>합계 -->
                                <th scope="col" rowspan="2"><strong><spring:message code='sal.lbl.realPayAmt' /></strong></th>                                                  <!-- 실제지불금액 -->
                            </tr>
                            <tr>
                                <th scope="col"><spring:message code='sal.lbl.whslAmt' /></th>          <!-- 구매가 -->
                                <th scope="col"><spring:message code='sal.lbl.retlAmt' /></th>          <!-- 공장지도가 -->
                                <th scope="col"><spring:message code='sal.lbl.promotionAmt' /></th>     <!-- 판촉금액 -->
                                <th scope="col"><spring:message code='sal.lbl.sbstAmt' /></th>          <!-- 치환차감 -->
                                <th scope="col"><spring:message code='global.lbl.goodsAmt' /></th>      <!-- 용품가격 -->
                                <th scope="col"><spring:message code='global.lbl.consAmt' /></th>       <!-- 탁송료 -->
                                <th scope="col"><spring:message code='sal.lbl.incAmt' /></th>           <!-- 보험료 -->
                                <th scope="col"><spring:message code='sal.lbl.aapAmt' /></th>           <!-- 대행료 -->
                                <th scope="col"><spring:message code='sal.lbl.otherAmt' /></th>         <!-- 부가금액 -->
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="ar child_borderNone"><input id="whslAmt" name="whslAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>                                     <!-- 구매가 -->
                                <td class="ar child_borderNone"><input id="retlAmt" name="retlAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>                                     <!-- 공장지도가 -->
                                <td class="ar child_borderNone"><input id="promotionAmt" name="promotionAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>                           <!-- 판촉 -->
                                <td class="ar child_borderNone"><input id="sbstAmt" name="sbstAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>                                     <!-- 치환금액 -->
                                <td class="ar child_borderNone"><input id="goodsAmt" name="goodsAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>                                   <!-- 용품가격 -->
                                <td class="ar child_borderNone"><input id="consAmt" name="consAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>                                     <!-- 탁송료 -->
                                <td class="ar child_borderNone"><input id="incAmt" name="incAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>                                       <!-- 보험료 -->
                                <td class="ar child_borderNone"><input id="aapAmt" name="aapAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>                                       <!-- 대행료 -->
                                <td class="ar child_borderNone"><input id="vatAmt" name="vatAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>                                       <!-- 부가금액 -->
                                <td class="ar child_borderNone"><strong><input id="realCarAmt" name="realCarAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></strong></td>              <!-- 실제차량금액 -->
                                <td class="ar child_borderNone"><strong><input id="etcSumAmt" name="etcSumAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></strong></td>                <!-- 기타금액합계 -->
                                <td class="ar td_total child_borderNone"><strong><input id="realPayAmt" name="realPayAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></strong></td>     <!-- 실제지불금액 -->
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
                                <th scope="row"><spring:message code='global.lbl.chrgCd' /></th>              <!-- 保险考票名称 -->
                                <td>
                                    <input id="oOrdDlrCd" readonly class="form_input form_readonly">
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
                                <th scope="row"><spring:message code='sal.lbl.purcPrc' /></th>                  <!-- 구매가격 -->
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
                                <th scope="row"><spring:message code='sal.lbl.salesAdvisor' /></th>            <!-- 판매고문 -->
                                <td class="readonly_area">
                                    <input id="oSaleEmpNo" class="form_input form_readonly">
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
                    <div id="stockGrid" class="grid"></div>
                </div>
            </div>
            <!-- //재고 -->

            <div>
                <div class="table_grid">
                    <div id="deliveryGrid" class="grid"></div>
                </div>
            </div>

        </div>
        <!-- // 탭 종료 -->
    </section>
    <!-- 팝업으로 변경된 숨김 영역  -->

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
var sVinNo = "${sVinNo}";        // CRM에서 넘어오는 VIN NO
var selectTabId;

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

//차량보유상태 Array
/* var ownStatDs = [];
<c:forEach var="obj" items="${ownStatList}">
    ownStatDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//차량보유상태 Map
var ownStatMap = dms.data.arrayToMap(ownStatDs, function(obj){ return obj.cmmCd; }); */


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
    storageDSList.push({cmmCdNm:"${obj.strgeNm}", cmmCd:"${obj.strgeCd}"});
    strgeCdObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

// 위치
var locDSList = [];
var locCdObj = {};
<c:forEach var="obj" items="${locDSList}">
    locDSList.push({cmmCdNm:"${obj.locNm}", cmmCd:"${obj.locCd}"});
    locCdObj["${obj.locCd}"] = "${obj.locNm}";
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


//공개여부 Array
var openYnDs = [];
<c:forEach var="obj" items="${openYnList}">
    openYnDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//공개여부 Map
var openYnMap = dms.data.arrayToMap(openYnDs, function(obj){ return obj.cmmCd; });


//여부 COM020
var ynDs = [];
<c:forEach var="obj" items="${ynList}">
    ynDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var ynMap = dms.data.arrayToMap(ynDs, function(obj){ return obj.cmmCd; });


//조건기간구분 SAL061
var searchDSList = [];
<c:forEach var="obj" items="${searchDtList}" varStatus="status">
    /* <c:if test="${status.index == 0 || status.index == 3}" >
    searchDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if> */
    searchDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//판매취소사유 SAL129
var dlvCnclCusList = [];
<c:forEach var="obj" items="${deliveryCnclCusDS}">
    grteStdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var dlvCnclCusMap = dms.data.arrayToMap(dlvCnclCusList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {

    if(sVinNo != "" || sVinNo == null){$("#sVinNo").val(sVinNo);}

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
        ,width:"950px"
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

           if(dataItem.carlineCd == ""){
               $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sModelCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectModel.do' />"
               ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    // 모델
    $("#sModelCd").kendoExtDropDownList({
        dataTextField:"modelNm"
       ,dataValueField:"modelCd"
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(true);

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           if(dataItem.modelCd == ""){
               $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOcnCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectOcn.do' />"
               ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").val(), "modelCd":dataItem.modelCd})
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
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(true);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

            if(this.dataItem(e.item).ocnCd == ""){
                $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectExtColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                ,async:false
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
                url:"<c:url value='/sal/veh/vehicleMaster/selectIntColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
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

    //차량보유상태
/*     $("#sOwnStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:ownStatDs
        ,optionLabel:" "  // 전체
    }); */

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

    // 조회조건 - 시작일, 종료일
    $("#sStartDt").on('change', {from:$("#sStartDt"), to:$("#sEndDt")}, fnChkSearchDate);
    $("#sEndDt").on('change',   {from:$("#sStartDt"), to:$("#sEndDt")}, fnChkSearchDate);



/*************************** 검색 조건 영역 END **************************************************/

    // 구매가
    $("#whslAmt").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       //,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
       //,change:function(){}
    });

    // 공장지도가
    $("#retlAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       //,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 판촉금액(프로모션)
    $("#promotionAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 치환차감(중고차)
    $("#sbstAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 용품가격
    $("#goodsAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       //,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 탁송료
    $("#consAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       //,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 보험료
    $("#incAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       //,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 대행료
    $("#aapAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       //,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 부가금액(부가비용)
    $("#vatAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 실제차량금액
    $("#realCarAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       //,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 기타금액합계
    $("#etcSumAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 실제지불금액
    $("#realPayAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       //,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });


    // 재고월령
    $("#mmCnt").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });


    // 재고일령
    $("#ddCnt").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 창고
    $("#strgeCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:storageDSList
       ,optionLabel:" "           //선택
       ,select:function (e){
           var dataItem = this.dataItem(e.item);
           $("#locCd").data("kendoExtDropDownList").setDataSource([]);
           $("#locCd").data("kendoExtDropDownList").enable(true);

           if(dataItem.cmmCd == ""){
               $("#locCd").data("kendoExtDropDownList").setDataSource([]);
               $("#locCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/inv/stockState/selectLocation.do' />"
               ,data:JSON.stringify( dataItem.cmmCd )
               ,async:false
           });
           $("#locCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });


    // 위치
    $("#locCd").kendoExtDropDownList({
        dataTextField :"locNm"
       ,dataValueField:"locCd"
       ,optionLabel:" "           //선택
    });
    $("#locCd").data("kendoExtDropDownList").enable(false);


    // 그레이여부
    $("#greyYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:greyList
        ,optionLabel:" "  // 선택
    });

    // 입고일
    $("#grDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });
    $("#grDt").data("kendoExtMaskedDatePicker").enable(false);

    // 제작년월
    $("#manufactYyMmDt").kendoExtMaskedDatePicker({
        start:"year"
       ,depth:"year"
       ,format:"yyyy-MM"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });
    $("#manufactYyMmDt").data("kendoExtMaskedDatePicker").enable(false);

    // 보증시작일
   $("#grteStartDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });
   // 보증종료일
/*    $("#grteEndDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   }); */

   //보증기준
/*    $("#grteStdCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:grteStdList
       ,optionLabel:" "  // 선택
   }); */
   // 차량등록일
   $("#carRegDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });
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

   // 2급딜러 TO BE 콤보박스 구현-2급딜러 마스터 테이블 미구현

   //2급딜러입고일
   $("#lv2DlrStockGrDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

   //브랜드 COM019
   $("#carBrandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:carBrandList
       ,optionLabel:" "  // 선택
   });

   //배기량
   $("#carDispQty").kendoExtNumericTextBox({
       format:"{0:###,###}"
      ,decimals:0
      ,min:0
      ,value:0
      ,spinners:false
   });

   //주행거리
   $("#carRunDistVal").kendoExtNumericTextBox({
       format:"{0:###,###}"
      ,decimals:0
      ,min:0
      ,value:0
      ,spinners:false
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

   // 공개여부
   $("#openYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:openYnDs
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

             $("#carId").val(selectedVal.carId);
             $("#vinNo").val(selectedVal.vinNo);
             $("#ncarDstinCd").val(selectedVal.ncarDstinCd);
             $("#ncarDstinNm").val(selectedVal.ncarDstinNm);
             $("#openYn").data("kendoExtDropDownList").value(selectedVal.openYn);
             $("#mmCnt").data("kendoExtNumericTextBox").value(selectedVal.mmCnt);
             $("#carlineNm").val(selectedVal.carlineNm);
             $("#modelNm").val(selectedVal.modelNm);
             $("#modelCd").val(selectedVal.modelCd);
             $("#ocnNm").val(selectedVal.ocnNm);
             $("#ocnCd").val(selectedVal.ocnCd);
             $("#extColorNm").val(selectedVal.extColorNm);
             $("#intColorNm").val(selectedVal.intColorNm);
             $("#carStatNm").val(selectedVal.carStatNm);
             $("#ownStatNm").val(selectedVal.ownStatNm);
             $("#stockNm").val(selectedVal.stockNm);
             $("#carDstinNm").val(selectedVal.carDstinNm);
             //$("#strgeCd").data("kendoExtDropDownList").value(selectedVal.strgeCd);
             //$("#locCd").data("kendoExtDropDownList").value(selectedVal.locCd);
             $("#dlrCd").val(selectedVal.dlrCd);
             $("#saleTp").val(selectedVal.saleTp);
             $("#contractNo").val(selectedVal.contractNo);
             $("#greyYn").data("kendoExtDropDownList").value(selectedVal.greyYn);
             $("#grDt").data("kendoExtMaskedDatePicker").value(selectedVal.grDt);
             $("#carRegNo").val(selectedVal.carRegNo);
             $("#manufactYyMmDt").val((selectedVal.manufactYyMmDt).length == 6 ? (selectedVal.manufactYyMmDt).substring(0,4)+'-'+(selectedVal.manufactYyMmDt).substring(4,6):selectedVal.manufactYyMmDt);
             $("#grteStartDt").data("kendoExtMaskedDatePicker").value(selectedVal.grteStartDt);
             //$("#grteEndDt").data("kendoExtMaskedDatePicker").value(selectedVal.grteEndDt);
             //$("#grteStdCd").data("kendoExtDropDownList").value(selectedVal.grteStdCd);
             $("#carRegDt").data("kendoExtMaskedDatePicker").value(selectedVal.carRegDt);
             $("#corpCarDstinCd").data("kendoExtDropDownList").value(selectedVal.corpCarDstinCd);
             $("#ordDlrCd").val(selectedVal.ordDlrCd);
             $("#cmpCarYn").val(selectedVal.cmpCarYn);
             $("#cmpCarDstinNm").val(selectedVal.cmpCarDstinNm);
             $("#tecId").val(selectedVal.tecId);
             $("#ordTpNm").val(selectedVal.ordTpNm);
             $("#lv2DlrStockYn").data("kendoExtDropDownList").value(selectedVal.lv2DlrStockYn);
             $("#lv2DlrOrgCd").val(selectedVal.lv2DlrOrgCd);
             $("#lv2DlrStockGrDt").data("kendoExtMaskedDatePicker").value(selectedVal.lv2DlrStockGrDt);
             $("#rfidNo").val(selectedVal.rfidNo);
             $("#enginModelCd").val(selectedVal.enginModelCd);
             $("#enginSerialNo").val(selectedVal.enginSerialNo);
             $("#certNo").val(selectedVal.certNo);
             $("#keyNo").val(selectedVal.keyNo);
             $("#carBrandCd").data("kendoExtDropDownList").value(selectedVal.carBrandCd);
             $("#carNm").val(selectedVal.carNm);
             $("#carDispQty").data("kendoExtNumericTextBox").value(selectedVal.carDispQty);
             $("#carRunDistVal").data("kendoExtNumericTextBox").value(selectedVal.carRunDistVal);
             $("#remark").val(selectedVal.remark);
             $("#preGiYn").data("kendoExtDropDownList").value(selectedVal.preGiYn);
             $("#damageCd").data("kendoExtDropDownList").value(selectedVal.damageCd);

             $("#mmCnt").val(selectedVal.blockSaleAdvNo);                 //월령
             $("#ddCnt").val(selectedVal.blockSaleAdvNo);                 //일령
             $("#retlPrc").val(selectedVal.blockSaleAdvNo);               //구매가격
             $("#whslPrc").val(selectedVal.blockSaleAdvNo);               //도매가격
             $("#ddctRate").val(selectedVal.blockSaleAdvNo);              //공제비율
             $("#blockSaleAdvNo").val(selectedVal.blockSaleAdvNo);        //블러킹판매고문
             $("#certSecu2Cd").data("kendoExtDropDownList").value(selectedVal.certSecu2Cd);     //합격증상태
             $("#jeongpanNo").val(selectedVal.jeongpanNo);                //정판형호번호
             $("#saleEmpNo").val(selectedVal.saleEmpNo);                  //판매사원번호


             if(selectedVal.strgeCd != null &&  selectedVal.strgeCd != ""){
                 $("#strgeCd").data("kendoExtDropDownList").value(selectedVal.strgeCd); // 차종
             }

             if(selectedVal.locCd != null &&  selectedVal.locCd != ""){
                 var locCd = $("#locCd").data("kendoExtDropDownList");
                 locCd.setDataSource([{locNm:selectedVal.locNm, locCd:selectedVal.locCd}]);
                 locCd.enable(true);
                 locCd.value(selectedVal.locCd); // 내장색
             }else {
                 $("#locCd").data("kendoExtDropDownList").value("");
             }

             //위치를  다시 disabled 해준다.
             if(selectedVal.locCd != null &&  selectedVal.locCd != ""){locCd.enable(false);}

             // 탭 조회
             selectTab(selectTabId);

             //강제판매신청정보 조회
             $.ajax({
                 url:"<c:url value='/sal/dlv/vehicleDelivery/selectExcpDelivery.do' />",
                 data:JSON.stringify({sVinNo:selectedVal.vinNo}),
                 type:"POST",
                 dataType:"json",
                 contentType:"application/json",
                 error:function(jqXHR,status,error){
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 }

             }).done(function(result) {

                 if(result.total != 0){

                     var resultVal = result.data[0];

                     $("#rfidNo").val(resultVal.rfidNo);
                     $("#vinNo").val(resultVal.vinNo);
                     $("#fceSaleReqReasonCd").data("kendoExtDropDownList").value(resultVal.fceSaleReqReasonCd);
                     $("#reqStatCd").data("kendoExtDropDownList").value(resultVal.reqStatCd);
                 }
             });

             if(selectedVal.contractNo != null && selectedVal.contractNo != ""){
                 //강제판매신청정보 조회
                 $.ajax({
                     url:"<c:url value='/sal/cnt/contractRe/selectContractReSearch.do' />",
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
                         $("#whslAmt").data("kendoExtNumericTextBox").value(resultVal.whslAmt != null ? resultVal.whslAmt:0);                // 구매가
                         $("#retlAmt").data("kendoExtNumericTextBox").value(resultVal.retlAmt != null ? resultVal.retlAmt:0);                // 공장지도가
                         $("#promotionAmt").data("kendoExtNumericTextBox").value(resultVal.promotionAmt != null ? resultVal.promotionAmt:0); // 판촉금액
                         $("#sbstAmt").data("kendoExtNumericTextBox").value(resultVal.sbstAmt != null ? resultVal.sbstAmt:0);                // 치환차감
                         $("#goodsAmt").data("kendoExtNumericTextBox").value(resultVal.goodsAmt != null ? resultVal.goodsAmt:0);             // 용품가격
                         $("#consAmt").data("kendoExtNumericTextBox").value(resultVal.consAmt != null ? resultVal.consAmt:0);                // 탁송료
                         $("#incAmt").data("kendoExtNumericTextBox").value(resultVal.incAmt != null ? resultVal.incAmt:0);                   // 보험료
                         $("#aapAmt").data("kendoExtNumericTextBox").value(resultVal.aapAmt != null ? resultVal.aapAmt:0);                   // 대행료
                         $("#vatAmt").data("kendoExtNumericTextBox").value(resultVal.vatAmt != null ? resultVal.vatAmt:0);                   // 부가금액
                         $("#realCarAmt").data("kendoExtNumericTextBox").value(resultVal.realCarAmt != null ? resultVal.realCarAmt:0);       // 실제차량금액
                         $("#etcSumAmt").data("kendoExtNumericTextBox").value(resultVal.etcSumAmt != null ? resultVal.etcSumAmt:0);          // 기타금액
                         $("#realPayAmt").data("kendoExtNumericTextBox").value(resultVal.realPayAmt != null ? resultVal.realPayAmt:0);       // 실제지불금액
                     }
                 });
             }else {
                 /* 계약가격정보 */
                 $("#whslAmt").data("kendoExtNumericTextBox").value(0);        // 구매가 (A)
                 $("#retlAmt").data("kendoExtNumericTextBox").value(0);        // 공장지도가 (B)
                 $("#promotionAmt").data("kendoExtNumericTextBox").value(0);   // 판촉금액 (C)
                 $("#sbstAmt").data("kendoExtNumericTextBox").value(0);        // 치환차감 (D)
                 $("#goodsAmt").data("kendoExtNumericTextBox").value(0);       // 용품가격 (E)

                 $("#consAmt").data("kendoExtNumericTextBox").value(0);        // 탁송료
                 $("#incAmt").data("kendoExtNumericTextBox").value(0);         // 보험료
                 $("#aapAmt").data("kendoExtNumericTextBox").value(0);         // 대행료
                 $("#vatAmt").data("kendoExtNumericTextBox").value(0);         // 부가금액

                 $("#realCarAmt").data("kendoExtNumericTextBox").value(0);     // 실제차량금액 (B+C+D+E) = F
                 $("#etcSumAmt").data("kendoExtNumericTextBox").value(0);      // 기타금액 합계(G)
                 $("#realPayAmt").data("kendoExtNumericTextBox").value(0);     // 실제지불금액 (F+G)
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

            var param = $("#detailForm").serializeObject($("#detailForm").serializeArrayInSelector("[data-json-obj='true']"));

            param.grteStartDt = $("#grteStartDt").data("kendoExtMaskedDatePicker").value();
            //param.grteEndDt = $("#grteEndDt").data("kendoExtMaskedDatePicker").value();
            param.carRegDt = $("#carRegDt").data("kendoExtMaskedDatePicker").value();
            param.lv2DlrStockGrDt = $("#lv2DlrStockGrDt").data("kendoExtMaskedDatePicker").value();
            param.grDt = $("#grDt").data("kendoExtMaskedDatePicker").value();
            var openYn = $("#openYn").val();
            if(openYn == '01'){
                param.openYn = 'Y';
            }else {
                param.openYn = 'N';
            }

            $.ajax({
                url:"<c:url value='/sal/veh/vehicleMaster/saveVehicleMasterMain.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(param),
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
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

    //차량소유자 버튼 - 추가
    $("#btnOwnerAdd").kendoButton({
        click:function(e) {
            var grid = $("#mainGrid").data("kendoExtGrid");
            if(grid.select().index() == -1){
                // 차량을(를) 선택하세요.
                dms.notification.warning("<spring:message code='global.lbl.car' var='globalLblCar' /><spring:message code='global.info.check.field' arguments='${globalLblCar}' />");
                return false;
            }else {

                var grid = $("#ownerGrid").data("kendoExtGrid");
                grid.dataSource.insert(0, {
                     "dlrCd":$("#dlrCd").val()
                    ,"vinNo":$("#vinNo").val()
                    ,"carId":$("#carId").val()
                    ,"seq":""
                    ,"bpCd":""
                    ,"bpNm":""
                    ,"useYn":"Y"
                });
            }
        }
    });

    //차량소유자 버튼 - 저장
    $("#btnOwnerSave").kendoButton({
        click:function(e) {
            var grid = $("#mainGrid").data("kendoExtGrid");
            if(grid.select().index() == -1){
                // 차량을(를) 선택하세요.
                dms.notification.warning("<spring:message code='global.lbl.car' var='globalLblCar' /><spring:message code='global.info.check.field' arguments='${globalLblCar}' />");
                return false;
            }else {

                var grid = $('#ownerGrid').data('kendoExtGrid');
                var saveData = grid.getCUDData("insertOwnerList", "updateOwnerList", "deleteOwnerList");
                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                var rows = grid.tbody.find("tr");
                var bpCdFlg = false;
                $.each(rows, function(idx, row){
                    var item = grid.dataItem(row);
                    if(item.bpCd == ""){bpCdFlg = true;}
                });

                if(bpCdFlg){
                    // 선택하지 않은 고객이 있습니다.
                    dms.notification.warning("<spring:message code='global.info.customer' var='globalInfoCustomer' /><spring:message code='global.info.nonSelectItem' arguments='${globalInfoCustomer}' />");
                    return false;
                }

                if (grid.gridValidation()){
                    $.ajax({
                        url:"<c:url value='/sal/veh/vehicleMaster/saveVehicleMasterOwner.do' />"
                        ,data:JSON.stringify(saveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                        ,success:function(jqXHR, textStatus) {
                            grid.dataSource._destroyed = [];
                            grid.dataSource.read();

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }else{
                    //입력값을 확인하여 주십시오.
                    dms.notification.warning("<spring:message code='global.info.check.input'/>");
                }

            }
        }
    });

    // 차량소유자 버튼 - 취소
    $("#btnOwnerCancel").kendoButton({
        click:function(e) {
            $('#ownerGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    //차량운전자 버튼 - 추가
    $("#btnDriverAdd").kendoButton({
        click:function(e) {
            var grid = $("#mainGrid").data("kendoExtGrid");
            if(grid.select().index() == -1){
                // 차량을(를) 선택하세요.
                dms.notification.warning("<spring:message code='global.lbl.car' var='globalLblCar' /><spring:message code='global.info.check.field' arguments='${globalLblCar}' />");
                return false;
            }else {

                $('#driverGrid').data('kendoExtGrid').dataSource.insert(0, {
                     "dlrCd":$("#dlrCd").val()
                    ,"vinNo":$("#vinNo").val()
                    ,"carId":$("#carId").val()
                    ,"seq":""
                    ,"bpCd":""
                    ,"bpNm":""
                    ,"mdriverYn":"Y"
                    ,"useYn":"Y"
                });
            }
        }
    });

    //차량운전자 버튼 - 저장
    $("#btnDriverSave").kendoButton({
        click:function(e) {
            var grid = $("#mainGrid").data("kendoExtGrid");
            if(grid.select().index() == -1){
                // 차량을(를) 선택하세요.
                dms.notification.warning("<spring:message code='global.lbl.car' var='globalLblCar' /><spring:message code='global.info.check.field' arguments='${globalLblCar}' />");
                return false;
            }else {

                var grid = $('#driverGrid').data('kendoExtGrid');
                var saveData = grid.getCUDData("insertDriverList", "updateDriverList", "deleteDriverList");

                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

/*                 var rows = grid.tbody.find("tr");
                var useCnt = 0, mdriverCnt = 0, bpCdFlg = false;
                $.each(rows, function(idx, row){
                    var item = grid.dataItem(row);
                    if(item.bpCd == ""){bpCdFlg = true;}
                    if(item.useYn == "Y"){useCnt++;}
                    if(item.mdriverYn == "Y"){mdriverCnt++;}
                });

                if(useCnt < 1){
                    // 사용여부는 1개이상 되어야 합니다.
                    dms.notification.warning("<spring:message code='global.lbl.useYn' var='globalLblUseYn' /><spring:message code='global.info.isUpChk' arguments='${globalLblUseYn}, 1' />");
                    return false;
                }
                if(mdriverCnt != 1){
                    // 주운전자여부는 1개만 사용가능합니다.
                    dms.notification.warning("<spring:message code='global.lbl.driverYn' var='globalLblDriverYn' /><spring:message code='global.info.isUseChk' arguments='${globalLblDriverYn}, 1' />");
                    return false;
                }
                if(bpCdFlg){
                    // 선택하지 않은 고객이 있습니다.
                    dms.notification.warning("<spring:message code='global.lbl.customer' var='globalLblCustomer' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblCustomer}' />");
                    return false;
                } */

                if (grid.gridValidation()){
                    $.ajax({
                        url:"<c:url value='/sal/veh/vehicleMaster/saveVehicleMasterDriver.do' />"
                        ,data:JSON.stringify(saveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                        ,success:function(jqXHR, textStatus) {
                            grid.dataSource._destroyed = [];
                            grid.dataSource.read();

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }else{
                    //입력값을 확인하여 주십시오.
                    dms.notification.warning("<spring:message code='global.info.check.input'/>");
                }

            }
        }
    });

    // 차량운전자 버튼 - 취소
    $("#btnDriverCancel").kendoButton({
        click:function(e) {
            $('#driverGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    //옵션 버튼 - 추가
    $("#btnOptionAdd").kendoButton({
        click:function(e) {
            var grid = $("#mainGrid").data("kendoExtGrid");
            if(grid.select().index() == -1){
                dms.notification.warning("차량을 선택하여 주십시오.");
                return false;
            }else {

                $('#optionGrid').data('kendoExtGrid').dataSource.insert(0, {
                    "dlrCd":$("#dlrCd").val()
                    ,"vinNo":$("#vinNo").val()
                    ,"carId":$("#carId").val()
                    ,"pkgCd":""
                    ,"pkgNm":""
                    ,"useYn":"Y"
                });
            }
        }
    });

    //옵션 버튼 - 저장
    $("#btnOptionSave").kendoButton({
        click:function(e) {
            var grid = $("#mainGrid").data("kendoExtGrid");
            if(grid.select().index() == -1){
                // 차량을(를) 선택하세요.
                dms.notification.warning("<spring:message code='global.lbl.car' var='globalLblCar' /><spring:message code='global.info.check.field' arguments='${globalLblCar}' />");
                return false;
            }else {

                var grid = $('#optionGrid').data('kendoExtGrid');
                var saveData = grid.getCUDData("insertOptionList", "updateOptionList", "deleteOptionList");

                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                if (grid.gridValidation()){
                    $.ajax({
                        url:"<c:url value='/sal/veh/vehicleMaster/saveVehicleMasterOption.do' />"
                        ,data:JSON.stringify(saveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                        ,success:function(jqXHR, textStatus) {
                            grid.dataSource._destroyed = [];
                            grid.dataSource.read();

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }else{
                    //입력값을 확인하여 주십시오.
                    dms.notification.warning("<spring:message code='global.info.check.input'/>");
                }

            }
        }
    });

    // 옵션 버튼 - 취소
    $("#btnOptionCancel").kendoButton({
        click:function(e) {
            $('#optionGrid').data('kendoExtGrid').cancelChanges();
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
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"] = dlrCd;                                                    // 딜러
                        //params["sVinNo1"] = $("#sVinNo1").val();                                   // 빈넘버1
                        //params["sVinNo2"] = $("#sVinNo2").val();                                   // 빈넘버2
                        params["sVinNo"] = $("#sVinNo").val();                                       // 빈넘버
                        params["sCarStatCd"] = $("#sCarStatCd").data("kendoExtDropDownList").value();   // 차량상태
                        //params["sOwnStatCd"] = $("#sOwnStatCd").data("kendoExtDropDownList").value(); // 보유상태
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();   // 차종
                        params["sModelCd"]   = $("#sModelCd").data("kendoExtDropDownList").value();     // 모델
                        params["sOcnCd"]     = $("#sOcnCd").data("kendoExtDropDownList").value();       // OCN
                        params["sExtColorCd"]= $("#sExtColorCd").data("kendoExtDropDownList").value();  // 외장색
                        params["sIntColorCd"]= $("#sIntColorCd").data("kendoExtDropDownList").value();  // 내장색
                        params["sCarId"]     = $("#sCarId").val();                                   // CAR ID
                        params["tSearchDt"]   = $("#tSearchDt").data("kendoExtDropDownList").value();   // 일자검색 조건

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
                        ,carlineNm  :{type:"string"}
                        ,modelNm    :{type:"string"}
                        ,ocnNm      :{type:"string"}
                        ,extColorNm :{type:"string"}
                        ,intColorNm :{type:"string"}
                        ,mmCnt      :{type:"number"}
                        ,ddCnt      :{type:"number"}
                        ,grteStartDt:{type:"date"}
                        //,grteEndDt  :{type:"date"}
                        ,grDt       :{type:"date"}
                        ,carRegDt   :{type:"date"}
                        ,lv2DlrStockGrDt:{type:"date"}
                    }
                }
            }
        }
        ,height:384
        //,pageable:false
        ,editable:false
        //,autoBind:false
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
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
                     {field:"vinNo"     ,title:"<spring:message code='global.lbl.vinNum' />"    ,width:130  ,attributes:{"class":"ac"}}   //VIN NO
                    ,{field:"carId"     ,title:"<spring:message code='sal.lbl.carId' />"        ,width:100  ,attributes:{"class":"ac"}}   //CAR ID
                    ,{field:"carStatNm" ,title:"<spring:message code='global.lbl.vinSts' />"    ,width:80   ,attributes:{"class":"ac"}}   //차량상태
                    ,{field:"carlineNm" ,title:"<spring:message code='global.lbl.carLine' />"   ,width:100  ,attributes:{"class":"al"}}   //차종
                    ,{field:"modelNm"   ,title:"<spring:message code='global.lbl.model' />"     ,width:150  ,attributes:{"class":"al"}}   //모델
                    ,{field:"ocnNm"     ,title:"<spring:message code='global.lbl.ocn' />"       ,width:150  ,attributes:{"class":"al"}}   //OCN
                    ,{field:"extColorNm",title:"<spring:message code='global.lbl.extColor' />"  ,width:100  ,attributes:{"class":"al"}}   //외장색
                    ,{field:"intColorNm",title:"<spring:message code='global.lbl.intColor' />"  ,width:100  ,attributes:{"class":"al"}}   //내장색
                    ,{field:"mmCnt"     ,title:"<spring:message code='global.lbl.stockMonth' />",width:50   ,attributes:{"class":"ar"}, format:"{0:n0}"}    //재고월령
                ]
    });

    // 탭
    selectTabId = "owner";       // 초기값:차량소유자
    $("#tabstrip").kendoExtTabStrip({
        animation:false
       ,select:function(e) {
            selectTabId = e.item.id;
            selectTab(selectTabId); // 탭 조회
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
        , pageable:false
        , autoBind:false
        , editableOnlyNew:true
        , editableOnlyNewExcludeColumns:["txtObjectCd"]
        , height:150
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , enableTooltip:true               //Tooltip 적용, default:false
        , filterable:false
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
                    , {field:"bpNm", title:"<spring:message code='global.lbl.custNm' />", width:150, attributes:{"class":"ac"}}//고객명
                    , { field:"useYn",title:"<spring:message code='global.lbl.useYn' />", width:120
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
                    , { field:"txtObjectCd", title:"<spring:message code='global.lbl.txtObjectCd' />", width:180, attributes:{"class":"ac"}}   //신분증스캔(문서번호)
                    , { field:"regUsrId", title:"<spring:message code='global.lbl.regUsrId' />", width:80, attributes:{"class":"ac"}} //등록자
                    , { field:"regDt",    title:"<spring:message code='global.lbl.regDt' />",    width:80, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //등록일
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
        , pageable:false
        , autoBind:false
        , editableOnlyNew:true
        , editableOnlyNewExcludeColumns:["useYn"]
        , filterable:false
        , height:150
        , indvColumnVisible:true             //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true         //컬럼순서 변경 개인화 적용. default:true
        , enableTooltip:true               //Tooltip 적용, default:false
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
            ,{field:"rnum", title:"<spring:message code='ser.lbl.roDt' />", width:100, attributes:{"class":"ar"}}     // RO확인시간
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
            ,{field:"ro", title:"<spring:message code='global.lbl.roUser' />", width:100, attributes:{"class":"ac"}}                            // RO발행자
                          // RO발행자                          // RO발행자
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


    // 재고 그리드.
    $("#stockGrid").kendoExtGrid({
        gridId:"G-SAL-0721-115906"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/veh/vehicleMaster/selectVehicleMasterStock.do' />"
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
                    id:"pkgCd"
                    , fields:{
                        dlrCd:{type:"string"}
                       ,vinNo:{type:"string"}
                       ,seq  :{type:"number"}
                       ,statChgCd:{type:"string"}
                       ,statChgBefCont:{type:"string"}
                       ,statChgAftCont:{type:"string"}
                       ,regUsrId:{type:"string"}
                       ,regDt:{type:"date"}
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
        , columns:[ {field:"dlrCd", hidden:true}
                    , {field:"vinNo", hidden:true}
                    , {field:"seq", hidden:true}
                    , { // 유형
                        field:"statChgCd", title:"<spring:message code='global.lbl.type' />", width:150, attributes:{"class":"ac"}
                        ,template:"#= dms.string.strNvl(statChgObj[statChgCd]) #"
                    }
                    , { field:"statChgBefCont", title:"<spring:message code='global.lbl.statChgBefCont' />", width:80, attributes:{"class":"ac"}}      //변동전내용
                    , { field:"statChgAftCont", title:"<spring:message code='global.lbl.statChgAftCont' />", width:80, attributes:{"class":"ac"}}      //변동후내용
                    , { field:"regUsrId", title:"<spring:message code='global.lbl.regUsrId' />", width:80, attributes:{"class":"ac"}} //등록자
                    , { field:"regDt",    title:"<spring:message code='global.lbl.regDt' />",    width:80, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //등록일

                ]
    });

    // 딜러입고 판매 그리드.
    $("#deliveryGrid").kendoExtGrid({
        gridId:"G-SAL-0925-194000"
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
                    id:"deliverySt"
                    , fields:{
                       kmvin:{type:"string"}    //빈
                      ,kmopt:{type:"string"}    //작업구분
                      ,workDt:{type:"string"}   //작업일자
                      ,kmcncd:{type:"string"}   //인도취소사유
                      ,kmtrdy:{type:"string"}   //신청일자
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
        , columns:[ {field:"kmvin", title:"<spring:message code='global.lbl.vinNo' />", width:80, attributes:{"class":"ac"}}      //빈
                   ,{field:"kmopt", title:"<spring:message code='ser.title.lbrOperInfo' />", width:50, attributes:{"class":"ac"}}      //작업정보
                   ,{field:"workDt", title:"<spring:message code='global.lbl.workDt' />", width:50, attributes:{"class":"ac"}}      //작업일자
                   ,{field:"kmcncd", title:"<spring:message code='global.lbl.cancReasonCd' />", width:80, attributes:{"class":"ac"}}      //취소사유
                   ,{field:"kmtrdy", title:"<spring:message code='sal.lbl.reqDt' />", width:50, attributes:{"class":"ac"}}      //신청일자
/*                    , { // 유형
                        field:"statChgCd", title:"<spring:message code='global.lbl.type' />", width:150, attributes:{"class":"ac"}
                        ,template:"#= dms.string.strNvl(statChgObj[statChgCd]) #"
                    }
*/
                ]
    });


    $("#tabstrip").data("kendoExtTabStrip").select(0);


    /****************************************  정비에서 필요되는 차량 신규등록 저장 이벤트 (테스트용으로 만들어놓음)**************************************/
    //버튼 - 정비 신규등록을 위한 테스트용.
/*     $("#btnOtherSave").kendoButton({
        click:function(e) {

            var param = {};
            param.vinNo = 'LBEDMBKD5DZ042289';
            param.dlrCd = 'D0101';
            param.carBrandCd = "H";
            param.temp1 = "차량명";
            //param.manufactYyMmDt = $("#modelCd").data("kendoExtDropDownList").value();
            param.carRunDistVal = '12000';
            param.carDispQty = '200';
            param.carRegNo = '234234';


            $.ajax({
                url:"<c:url value='/sal/veh/vehicleMaster/saveNewCar.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(param),
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
                },
                success:function(data){
                    // 저장이 완료되었습니다.
                    dms.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
                }
            });

        }
    }); */
    /****************************************  정비에서 필요되는 차량 신규등록 저장 이벤트 (테스트용으로 만들어놓음) END **************************************/


});


//팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
function viewPopup(){
    var win = $("#vehicleMstWindow").data("kendoWindow");
    win.center();
    win.open();
}



var popupWindow;
//고객 팝업 열기 함수.
function selectBpPopupWindow(){
    popupWindow = dms.window.popup({
        windowId:"bpCdPopup"
        ,title:"<spring:message code = 'global.title.custSearch'/>"   // 고객 조회
        ,width:800
        ,height:500
        ,content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            ,data:{
                "type":"custom1"
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

    switch (tabId){
        case 'owner':                                                                       // 차량소유자
            $("#ownerGrid").data("kendoExtGrid").dataSource.read();
            break;
        case 'driver':                                                                      // 차량운전자
            $("#driverGrid").data("kendoExtGrid").dataSource.read();
            break;
        case 'service':                                                                     // 서비스
            $("#serviceGrid").data("kendoExtGrid").dataSource.read();
            break;
        case 'option':                                                                      // 옵션
            $("#optionGrid").data("kendoExtGrid").dataSource.read();
            break;
        case 'contract':                                                                    // 계약

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
                        $("#cSaleEmpNo").val(jqXHR.data[0].saleEmpNo);
                        $("#cCustNm").val(jqXHR.data[0].custNm);
                        $("#cCustCd").val(jqXHR.data[0].custCd);
                        $("#cAddr").val(jqXHR.data[0].addr);
                        if(jqXHR.data[0].regTp == "A"){                                     // 대행
                            $("#tabRegTp01").click();
                        }else{                                                              // 본인
                            $("#tabRegTp02").click();
                        }
                        readyRegTp = false;

                        if(jqXHR.data[0].incAapTp == "A"){                                  // 대행
                            $("#incAapTp01").click();
                        }else{                                                              // 본인
                            $("#incAapTp02").click();
                        }
                        readyIncAapTp = false;

                        $("#cIncCmpCd").val(jqXHR.data[0].incCmpCd);
                    }
                }
            });

            break;
        case 'order':                                                                       // 주문

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
                        $("#oOrdDlrCd").val(jqXHR.data[0].ordDlrCd);
                        $("#oOrdDlrYyMmDt").val(jqXHR.data[0].ordDlrYyMmDt);
                        $("#oOrdMmDt").val(jqXHR.data[0].ordMmDt);
                        $("#oOrdSeq").val(jqXHR.data[0].ordSeq);
                        $("#oWhPrc").data("kendoExtNumericTextBox").value(jqXHR.data[0].whPrc != "null"? jqXHR.data[0].whPrc:"0.00");
                        $("#oDlrOrdReqDt").data("kendoExtMaskedDatePicker").value(jqXHR.data[0].dlrOrdReqDt);
                        $("#oCarDumpCd").val(jqXHR.data[0].carDumpCd);
                        $("#oErpOrdNo").val(jqXHR.data[0].erpOrdNo);
                        $("#oTrsfDlrCd").val(jqXHR.data[0].trsfDlrCd);
                        $("#oInvcPublDt").data("kendoExtMaskedDatePicker").value(jqXHR.data[0].invcPublDt);
                        $("#oSaleEmpNo").val(jqXHR.data[0].saleEmpNo);
                    }
                }
            });

            break;
        case 'stock':              // 재고
            $("#stockGrid").data("kendoExtGrid").dataSource.read();
            break;
        case 'delivery':              // 딜러입고, 소매
            $("#deliveryGrid").data("kendoExtGrid").dataSource.read();
            break;
        default :
            break;
    }
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
    $("#ncarDstinCd").val('');
    $("#ncarDstinNm").val('');
    $("#mmCnt").data("kendoExtNumericTextBox").value(0);
    $("#carlineNm").val('');
    $("#modelNm").val('');
    $("#modelCd").val('');
    $("#ocnNm").val('');
    $("#ocnCd").val('');
    $("#extColorNm").val('');
    $("#intColorNm").val('');
    $("#carStatNm").val('');
    $("#ownStatNm").val('');
    $("#stockNm").val('');
    $("#carDstinNm").val('');
    $("#strgeCd").data("kendoExtDropDownList").value('');
    $("#locCd").data("kendoExtDropDownList").value('');
    $("#dlrCd").val('');
    $("#saleTp").val('');
    $("#contractNo").val('');
    $("#greyYn").data("kendoExtDropDownList").value('');
    $("#grDt").data("kendoExtMaskedDatePicker").value('');
    $("#carRegNo").val('');
    $("#manufactYyMmDt").val('');
    $("#grteStartDt").data("kendoExtMaskedDatePicker").value('');
    //$("#grteEndDt").data("kendoExtMaskedDatePicker").value('');
    //$("#grteStdCd").data("kendoExtDropDownList").value('');
    $("#carRegDt").data("kendoExtMaskedDatePicker").value('');
    $("#corpCarDstinCd").data("kendoExtDropDownList").value('');
    $("#ordDlrCd").val('');
    $("#cmpCarYn").val('');
    $("#cmpCarDstinNm").val('');
    $("#tecId").val('');
    $("#ordTpNm").val('');
    $("#lv2DlrStockYn").data("kendoExtDropDownList").value('');
    $("#lv2DlrOrgCd").val('');
    $("#lv2DlrStockGrDt").data("kendoExtMaskedDatePicker").value('');
    $("#rfidNo").val('');
    $("#enginModelCd").val('');
    $("#enginSerialNo").val('');
    $("#certNo").val('');
    $("#keyNo").val('');
    $("#carBrandCd").data("kendoExtDropDownList").value('');
    $("#carNm").val('');
    $("#carDispQty").data("kendoExtNumericTextBox").value(0);
    $("#carRunDistVal").data("kendoExtNumericTextBox").value(0);
    $("#remark").val('');
    $("#preGiYn").data("kendoExtDropDownList").value('');
    $("#damageCd").data("kendoExtDropDownList").value('');

    $("#mmCnt").val('');                 //월령
    $("#ddCnt").val('');                 //일령
    $("#retlPrc").val('');               //구매가격
    $("#whslPrc").val('');                //도매가격
    $("#ddctRate").val('');               //공제비율
    $("#blockSaleAdvNo").val('');        //블러킹판매고문
    $("#certSecu2Cd").data("kendoExtDropDownList").value('');
    $("#jeongpanNo").val('');
    $("#saleEmpNo").val('');

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
    //$("#cIncCmpCd").val('');

    /* 계약가격정보 */
    $("#whslAmt").data("kendoExtNumericTextBox").value(0);        // 구매가 (A)
    $("#retlAmt").data("kendoExtNumericTextBox").value(0);        // 공장지도가 (B)
    $("#promotionAmt").data("kendoExtNumericTextBox").value(0);   // 판촉금액 (C)
    $("#sbstAmt").data("kendoExtNumericTextBox").value(0);        // 치환차감 (D)
    $("#goodsAmt").data("kendoExtNumericTextBox").value(0);       // 용품가격 (E)

    $("#consAmt").data("kendoExtNumericTextBox").value(0);        // 탁송료
    $("#incAmt").data("kendoExtNumericTextBox").value(0);         // 보험료
    $("#aapAmt").data("kendoExtNumericTextBox").value(0);         // 대행료
    $("#vatAmt").data("kendoExtNumericTextBox").value(0);         // 부가금액

    $("#realCarAmt").data("kendoExtNumericTextBox").value(0);     // 실제차량금액 (B+C+D+E) = F
    $("#etcSumAmt").data("kendoExtNumericTextBox").value(0);      // 기타금액 합계(G)
    $("#realPayAmt").data("kendoExtNumericTextBox").value(0);     // 실제지불금액 (F+G)

    //주문
    $("#oOrdDlrCd").val('');
    $("#oOrdDlrYyMmDt").val('');
    $("#oOrdMmDt").val('');
    $("#oOrdSeq").val('');
    $("#oWhPrc").data("kendoExtNumericTextBox").value("0.00");
    $("#oDlrOrdReqDt").data("kendoExtMaskedDatePicker").value('');
    $("#oCarDumpCd").val('');
    $("#oErpOrdNo").val('');
    $("#oTrsfDlrCd").val('');
    $("#oInvcPublDt").data("kendoExtMaskedDatePicker").value('');

    //창고이력
    $("#stockGrid").data("kendoExtGrid").dataSource.data([]);

    //출입고이력
    $("#deliveryGrid").data("kendoExtGrid").dataSource.data([]);

    OptionDSList = [];
}



//조회조건:시작일-종료일 날짜 비교
fnChkSearchDate = function(e){
  if(dms.string.isEmpty(e.data.from.val())){return;}
  if(dms.string.isEmpty(e.data.to.val())){return;}

  var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
  var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
  if(startDt > endDt){
      dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
      $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
      $(this).focus();
  }
}


</script>
<!-- //script -->
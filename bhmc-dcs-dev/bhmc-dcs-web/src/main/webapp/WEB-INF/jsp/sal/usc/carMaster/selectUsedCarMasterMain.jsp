<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 중고차차량마스터관리 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.title.usedCarMaster" /></h1><!-- 중고차차량마스터 -->
        <div class="btn_right">
            <button id="btnViewDetail" class="btn_m btn_modify"><spring:message code='global.btn.update' /><!-- 수정 --></button>
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code="sal.lbl.carId" /></th><!-- CAR ID -->
                    <td>
                        <input type="text" id="sCarId" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.vinNum" /></th><!-- VIN NO -->
                    <td>
                        <input type="text" id="sVinNo" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.brand" /></th><!-- 브랜드 -->
                    <td>
                        <input type="text" id="sCarBrandCd" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.carNm" /></th><!-- 차량명 -->
                    <td>
                        <input type="text" id="sCarNm" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.vinSts" /></th><!-- 차량상태 -->
                    <td>
                        <input type="text" id="sCarStatCd" class="form_comboBox">
                    </td>
                    <td colspan="6"></td>
                </tr>
            </tbody>
        </table>
    </div>


    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->



    <section id="uscCarMstWindow" class="pop_wrap">
        <!-- 탭메뉴 전체 영역 -->
        <div class="tab_area" id="tabstrip">
            <!-- 탭메뉴 -->
            <ul>
                <li class="k-state-active" id="carInfo"><spring:message code="ser.title.carInfo" /></li><!-- 차량정보 -->
                <li id="topSelectCarInfo"><spring:message code="sal.lbl.topSelectCarInfo" /></li><!-- 수선차량정보 -->
                <li id="owner"><spring:message code="global.lbl.carOwner" /><!-- 차량소유자 --></li>
                <li id="driver"><spring:message code="global.lbl.carDriver" /></li><!-- 차량운전자 -->
            </ul>
            <!-- //탭메뉴 -->

            <span class="btn_right_absolute">
                <button class="btn_s btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                <button class="btn_s btn_add" id="btnAdd" disabled><spring:message code='global.btn.rowAdd' /></button><!-- 행추가 -->
                <button class="btn_s btn_cancel" id="btnCancel" disabled><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
            </span>

            <!-- 차량정보 -->
            <div>
                <div class="header_area">
                    <div class="btn_right">

                    </div>
                </div>
                <div class="table_form" id="viewModel1">
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
                                <th scope="row"><spring:message code="sal.lbl.carId" /></th><!-- CAR ID -->
                                <td>
                                    <input id="carId" type="text" class="form_input form_readonly" readonly data-bind="value:carId" />
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.factory" /></th><!-- 제조사 -->
                                <td>
                                    <input type="text" id="carBrandCd" class="form_comboBox" data-bind="value:carBrandCd">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.carNm" /></th><!-- 차량명 -->
                                <td>
                                    <input type="text" id="carNm" class="form_input" maxlength="100" data-name="<spring:message code="global.lbl.carNm" />" data-bind="value:carNm">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.vinSts" /></th><!-- 차량상태 -->
                                <td>
                                    <input type="text" id="carStatCd"  class="form_comboBox" data-bind="value:carStatCd">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.vinNum" /></th><!-- VIN NO -->
                                <td>
                                    <input type="text" id="vinNo" readonly class="form_input form_readonly" data-bind="value:vinNo">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.madeYyMm" /></th><!-- 제조년월 -->
                                <td>
                                    <input type="text" id="manufactYyMmDt" readonly class="form_input form_readonly" data-bind="value:manufactYyMmDt">
                                </td>
                                <th scope="row"><spring:message code="par.lbl.strge" /></th><!-- 창고 -->
                                <td>
                                    <input type="text" id="strgeCd" readonly class="form_input form_readonly" data-bind="value:strgeCd">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.location" /></th><!-- 위치 -->
                                <td>
                                    <input type="text" id="locCd" readonly class="form_input form_readonly" data-bind="value:locCd">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.runDist" /></th><!-- 주행거리(行驶距离) -->
                                <td>
                                    <input type="number" id="carRunDistVal" class="form_input ar" maxlength="8" data-name="<spring:message code="global.lbl.runDist" />" data-bind="value:carRunDistVal">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.carDispQty" /></th><!-- 배기량(排气量) -->
                                <td>
                                    <input type="number" id="carDispQty" class="form_input ar" maxlength="4" data-name="<spring:message code="global.lbl.carDispQty" />" data-bind="value:carDispQty">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.saleYn" /></th><!-- 판매가능여부(是否可以销售) -->
                                <td>
                                    <input type="text" id="saleYn" class="form_comboBox" >
                                </td>
                                <th scope="row"><spring:message code="global.lbl.corpCarDstin" /></th><!-- 자사차량구분(本公司车辆区分) -->
                                <td>
                                    <input type="text" id="corpCarDstinCd" class="form_comboBox" data-bind="value:corpCarDstinCd">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.dealer" /></th><!-- 딜러 -->
                                <td>
                                    <input type="text" id="dlrCd" readonly class="form_input form_readonly" data-bind="value:dlrCd">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.saleType" /></th><!-- 판매유형(销售类型) -->
                                <td>
                                    <input type="text" id="saleTp" disabled class="form_comboBox form_disabled" data-bind="value:saleTp">
                                </td>
                                <th scope="row"><spring:message code="par.lbl.saleDt" /></th><!-- 판매일자(销售日期) -->
                                <td class="readonly_area">
                                    <input type="text" id="custSaleDt" readonly class="form_datepicker" data-bind="value:custSaleDt">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.cancDt" /></th><!-- 취소일자(销售取消日期) -->
                                <td class="readonly_area">
                                    <input type="text" id="custSaleCancDt" readonly class="form_datepicker" data-bind="value:custSaleCancDt">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.contractNo" /></th><!-- 계약번호 -->
                                <td>
                                    <input type="text" id="contractNo" readonly class="form_input form_readonly" data-bind="value:contractNo">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.buyRoute" /></th><!-- 매입경로(买入渠道) -->
                                <td>
                                    <input type="text" id="purcPathNm" class="form_comboBox" data-bind="value:purcPathNm">
                                </td>
                                <th scope="row" class="group-OrdDt1" style="display:none;"><spring:message code="global.lbl.saleType" /></th><!-- 판매상태(销售状态) -->
                                <td class="required_area group-OrdDt1" style="display:none;">
                                    <input type="text" id="saleStatCd" class="form_comboBox" data-bind="value:saleStatCd">
                                </td>
                                <th scope="row" class="group-OrdDt1" style="display:none;"><spring:message code="global.lbl.remark" /></th><!-- 비고 -->
                                <td class="required_area group-OrdDt1" style="display:none;">
                                    <input type="text" id="remark" class="form_input" data-bind="value:remark">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //차량정보 -->

            <!-- 수선차량정보 -->
            <div>
                <div class="table_form" id="viewModel2">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:12%;">
                            <col style="width:14%;">
                            <col style="width:10%;">
                            <col style="width:14%;">
                            <col style="width:11%;">
                            <col style="width:14%;">
                            <col style="width:11%;">
                            <col style="width:14%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.model" /></th><!-- 모델(车型) -->
                                <td>
                                    <input type="text" id="carmodel" readonly class="form_input form_readonly" data-bind="value:carmodel">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.buyRoute" /></th><!-- 차량소재지(车辆所属地) -->
                                <td>
                                    <input type="text" id="place" readonly class="form_input form_readonly" data-bind="value:place">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.factory" /></th><!-- 제조사(制造商) -->
                                <td>
                                    <input type="text" id="producecompany" readonly class="form_input form_readonly" data-bind="value:producecompany">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.carRegNoFirst" /></th><!-- 번호판시작(车牌号头字) -->
                                <td>
                                    <input type="text" id="licensenostart" readonly class="form_input form_readonly" data-bind="value:licensenostart">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.brand" /></th><!-- 브랜드(品牌) -->
                                <td>
                                    <input type="text" id="brand" readonly class="form_input form_readonly" data-bind="value:brand">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.color" /></th><!-- 색상(颜色) -->
                                <td>
                                    <input type="text" id="color" readonly class="form_input form_readonly" data-bind="value:color">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.carLine" /></th><!-- 차종(车种) -->
                                <td>
                                    <input type="text" id="carstyle" readonly class="form_input form_readonly" data-bind="value:carstyle">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.runDist" /></th><!-- 주행거리(行驶距离) -->
                                <td>
                                    <input type="text" id="coveredmiles" readonly class="form_input form_readonly" data-bind="value:coveredmiles">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.hopePrice" /></th><!-- 희망가격(希望价格) -->
                                <td>
                                    <input type="text" id="sellerexpectprice" readonly class="form_input form_readonly" data-bind="value:sellerexpectprice">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.carSalePrice" /></th><!-- 차량판매가격(车辆销售价格) -->
                                <td>
                                    <input type="text" id="bluerefprice" readonly class="form_input form_readonly" data-bind="value:bluerefprice">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.evaluatePrice" /></th><!-- 평가가격(评价价格) -->
                                <td>
                                    <input type="text" id="intendbuyprice" readonly class="form_input form_readonly" data-bind="value:intendbuyprice">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.registrationYyMmDt" /></th><!-- 등록년월일(注册年月日) -->
                                <td>
                                    <input type="text" id="registdate" readonly class="form_input form_readonly" data-bind="value:registdate">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.enginNo" /></th><!-- 엔진번호(驱动编号) -->
                                <td>
                                    <input type="text" id="engineno" readonly class="form_input form_readonly" data-bind="value:engineno">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.tradeType" /></th><!-- 거래유형(交易类型) -->
                                <td>
                                    <input type="text" id="exchangetype" readonly class="form_input form_readonly" data-bind="value:exchangetype">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.licensePlt" /></th><!-- 번호판(车牌) -->
                                <td>
                                    <input type="text" id="licenseno" readonly class="form_input form_readonly" data-bind="value:licenseno">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.licensePltSaleYn" /></th><!-- 번호판등록판매여부(是否上牌销售) -->
                                <td>
                                    <input type="text" id="sellwithlicense" readonly class="form_input form_readonly" data-bind="value:sellwithlicense">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.vvtFinishDt" /></th><!-- 차배세완료기한(车船税终止期限) -->
                                <td class="readonly_area">
                                    <input type="text" id="taxdate" readonly class="form_input" data-bind="value:taxdate">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.maintainRegularYn" /></th><!-- 보양정상여부(保养是否正常) -->
                                <td>
                                    <input type="text" id="maintain" readonly class="form_input form_readonly" data-bind="value:maintain">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.coercionIncPeriod" /></th><!-- 강제보험기간(强制保险期限) -->
                                <td class="readonly_area">
                                    <input type="text" id="mustinsure" readonly class="form_input" data-bind="value:mustinsure">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.businessIncPeriod" /></th><!-- 상업보험기간(商业保险期限) -->
                                <td class="readonly_area">
                                    <input type="text" id="commerceinsure" readonly class="form_input" data-bind="value:commerceinsure">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.carSpec" /></th><!-- 차량스팩(车辆配置) -->
                                <td>
                                    <input type="text" id="carconfig" readonly class="form_input form_readonly" data-bind="value:carconfig">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.warrantyHaveYn" /></th><!-- 보증서유무(保证书有无) -->
                                <td>
                                    <input type="text" id="remarks" readonly class="form_input form_readonly" data-bind="value:remarks">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.companyId" /></th><!-- 회사ID(公司ID) -->
                                <td>
                                    <input type="text" id="companyid" readonly class="form_input form_readonly" data-bind="value:companyid">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.userId" /></th><!-- 사용자ID(用户ID) -->
                                <td>
                                    <input type="text" id="usersid" readonly class="form_input form_readonly" data-bind="value:usersid">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.image" /></th><!-- 이미지(图片) -->
                                <td>
                                    <input type="text" id="imgs" readonly class="form_input form_readonly" data-bind="value:imgs">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.createTime" /></th><!-- 생성시간(生成时间) -->
                                <td class="readonly_area">
                                    <input type="text" id="createdate" readonly class="form_input" data-bind="value:createdate">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.uatcCarPurc" /></th><!-- 치환여부(是否置换) -->
                                <td>
                                    <input type="text" id="bkcol1" readonly class="form_input form_readonly" data-bind="value:bkcol1">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.evaluator" /></th><!-- 평가자(评价人) -->
                                <td>
                                    <input type="text" id="bkcol2" readonly class="form_input form_readonly" data-bind="value:bkcol2">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.billInfo" /></th><!-- BILL정보(BILL信息) -->
                                <td>
                                    <input type="text" id="isregcard" readonly class="form_input form_readonly" data-bind="value:isregcard">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.gear" /></th><!-- 기어(档位) -->
                                <td>
                                    <input type="text" id="dangwei" readonly class="form_input form_readonly" data-bind="value:dangwei">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.carDistrict" /></th><!-- 산지(产地) -->
                                <td>
                                    <input type="text" id="chandi" readonly class="form_input form_readonly" data-bind="value:chandi">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.paint" /></th><!-- 페인트(油漆) -->
                                <td>
                                    <input type="text" id="youqi" readonly class="form_input form_readonly" data-bind="value:youqi">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.carType" /></th><!-- 차량유형(车辆类型) -->
                                <td>
                                    <input type="text" id="carleixing" readonly class="form_input form_readonly" data-bind="value:carleixing">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.engine" /></th><!-- 엔진(驱动) -->
                                <td>
                                    <input type="text" id="carfdj" readonly class="form_input form_readonly" data-bind="value:carfdj">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.fuel" /></th><!-- 연료(燃料) -->
                                <td>
                                    <input type="text" id="carranliao" readonly class="form_input form_readonly" data-bind="value:carranliao">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.carDesign" /></th><!-- 차량디자인(汽车款式) -->
                                <td>
                                    <input type="text" id="carkuanshi" readonly class="form_input form_readonly" data-bind="value:carkuanshi">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.carDispQty" /></th><!-- 배기량(排气量) -->
                                <td>
                                    <input type="text" id="carpailiang" readonly class="form_input form_readonly" data-bind="value:carpailiang">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.emitStandard" /></th><!-- 배출기준(排放基准) -->
                                <td>
                                    <input type="text" id="carpaifangbz" readonly class="form_input form_readonly" data-bind="value:carpaifangbz">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.gears" /></th><!-- Gears -->
                                <td>
                                    <input type="text" id="dangwei1" readonly class="form_input form_readonly" data-bind="value:dangwei1">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.type" /></th><!-- 유형(类型) -->
                                <td>
                                    <input type="text" id="carleixing1" readonly class="form_input form_readonly" data-bind="value:carleixing1">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.driveType" /></th><!-- 구동유형(驱动类型) -->
                                <td>
                                    <input type="text" id="carleixing2" readonly class="form_input form_readonly" data-bind="value:carleixing2">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.callId" /></th><!-- Call ID -->
                                <td>
                                    <input type="text" id="callid" readonly class="form_input form_readonly" data-bind="value:callid">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.isRents" /></th><!-- isRents -->
                                <td>
                                    <input type="text" id="isrents" readonly class="form_input form_readonly" data-bind="value:isrents">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.buyDate" /></th><!-- 매입일자(买入日期) -->
                                <td class="readonly_area">
                                    <input type="text" id="acquisitiondate" readonly class="form_input" data-bind="value:acquisitiondate">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.buyRoute" /></th><!-- 딜러점신차여부(是否为经销商新车) -->
                                <td>
                                    <input type="text" id="contractnum" readonly class="form_input form_readonly" data-bind="value:contractnum">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.contractNo" /></th><!-- 계약번호(合同编号) -->
                                <td>
                                    <input type="text" id="is4snewcar" readonly class="form_input form_readonly" data-bind="value:is4snewcar">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.buyRoute" /></th><!-- 매입경로(买入渠道) -->
                                <td>
                                    <input type="text" id="buyfrom" readonly class="form_input form_readonly" data-bind="value:buyfrom">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.warehousePlace" /></th><!-- 창고장소(仓库地点) -->
                                <td>
                                    <input type="text" id="storeplace" readonly class="form_input form_readonly" data-bind="value:storeplace">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.carRegNoDelivery" /></th><!-- 번호판번호(인도후)[车牌号(交车后)] -->
                                <td>
                                    <input type="text" id="newlicenseno" readonly class="form_input form_readonly" data-bind="value:newlicenseno">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.buyRoute" /></th><!-- 라스트갱신시간(最后更新时间) -->
                                <td>
                                    <input type="text" id="verdatetime" readonly class="form_input form_readonly" data-bind="value:verdatetime">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.modelId" /></th><!-- 모델ID(车型ID) -->
                                <td>
                                    <input type="text" id="modelid" readonly class="form_input form_readonly" data-bind="value:modelid">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.dealerId" /></th><!-- 딜러ID(车商ID) -->
                                <td>
                                    <input type="text" id="makeid" readonly class="form_input form_readonly" data-bind="value:makeid">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.trimId" /></th><!-- TrimID -->
                                <td class="readonly_area">
                                    <input type="text" id="trimid" readonly class="form_input" data-bind="value:trimid">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.onlineDist" /></th><!-- 온라인배포(在线分布) -->
                                <td>
                                    <input type="text" id="isweb" readonly class="form_input form_readonly" data-bind="value:isweb">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.oldNewCarYn" /></th><!-- 구로차여부(老旧车) -->
                                <td>
                                    <input type="text" id="isoldcar" readonly class="form_input form_readonly" data-bind="value:isoldcar">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.invoiceDt" /></th><!-- 영수증일자(发票日期) -->
                                <td class="readonly_area">
                                    <input type="text" id="billingtime" readonly class="form_input" data-bind="value:billingtime">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.rcptNo" /></th><!-- 영수증번호(发票编号) -->
                                <td>
                                    <input type="text" id="billing" readonly class="form_input form_readonly" data-bind="value:billing">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.saveMode" /></th><!-- 저장모드(保存模式) -->
                                <td>
                                    <input type="text" id="issave" readonly class="form_input form_readonly" data-bind="value:issave">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.vinOverlapYn" /></th><!-- VIN중복여부(VIN是否重复) -->
                                <td>
                                    <input type="text" is="isvinerperar" readonly class="form_input form_readonly" data-bind="value:isvinerperar">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.jingzhenguDealerId" /></th><!-- JINGZHENGU딜러ID(精真估车商ID) -->
                                <td>
                                    <input type="text" id="jzgmakeid" readonly class="form_input form_readonly" data-bind="value:jzgmakeid">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.buyRoute" /></th><!-- JINGZHENGU차종ID(精真估车种ID) -->
                                <td>
                                    <input type="text" id="jzgmodelid" readonly class="form_input form_readonly" data-bind="value:jzgmodelid">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.buyRoute" /></th><!-- JINGZHENGU모델ID(精真估车型ID) -->
                                <td>
                                    <input type="text" id="jzgstyleid" readonly class="form_input form_readonly" data-bind="value:jzgstyleid">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.carImagePosition" /></th><!-- 차량이미지대응위치(车辆图片相应位置) -->
                                <td>
                                    <input type="text" id="position" readonly class="form_input form_readonly" data-bind="value:position">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.ineternetDistFailYn" /></th><!-- 인터넷배포실패여부(网上分布失败与否) -->
                                <td>
                                    <input type="text" id="iswebfailure" readonly class="form_input form_readonly" data-bind="value:iswebfailure">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.qrCode" /></th><!-- QR Code -->
                                <td>
                                    <input type="text" id="ewmimgname" readonly class="form_input form_readonly" data-bind="value:ewmimgname">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.carId" /></th><!-- CAR ID -->
                                <td>
                                    <input type="text" id="dycwcarid" readonly class="form_input form_readonly" data-bind="value:dycwcarid">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.ordNo" /></th><!-- 주문번호(订单编号) -->
                                <td>
                                    <input type="text" id="orderno" readonly class="form_input form_readonly" data-bind="value:orderno">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.clivtaYn" /></th><!-- 교강보험여부(交强险与否) -->
                                <td>
                                    <input type="text" id="ismustinsure" readonly class="form_input form_readonly" data-bind="value:ismustinsure">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.businessIns" /></th><!-- 사업보험(事业保险) -->
                                <td>
                                    <input type="text" id="insurance" readonly class="form_input form_readonly" data-bind="value:insurance">
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.creditReplaceYn" /></th><!-- 인증치환여부(是否认证置换) -->
                                <td>
                                    <input type="text" id="isrzstatus" readonly class="form_input form_readonly" data-bind="value:isrzstatus">
                                </td>
                                <td colspan="4"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //수선차량정보 -->
            <!--차량소유자 탭 영역 -->
            <div class="mt10">
                <div class="table_grid">
                    <div id="ownerGrid" class="grid"></div>
                </div>
            </div>
            <!--차량운전자 탭 영역 -->
            <div class="mt10">
                <div class="table_grid">
                    <div id="driverGrid" class="grid"></div>
                </div>
            </div>
        </div>
        <!-- //탭메뉴 전체 영역 -->
    </section>

</section>
<!-- //중고차량마스터관리-->
</div>

<!-- script -->
<script>
var selectTabId;



//판매상태 Array(SAL182)
var saleStatCdDs = [];
<c:forEach var="obj" items="${saleStatCdList}">
    saleStatCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//판매상태 Map
var saleStatCdMap = dms.data.arrayToMap(saleStatCdDs, function(obj){ return obj.cmmCd; });



//차량브랜드코드 Array(SAL181)
var carBrandCdDs = [];
<c:forEach var="obj" items="${carBrandCdList}">
    carBrandCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//차량브랜드코드 Map
var carBrandCdMap = dms.data.arrayToMap(carBrandCdDs, function(obj){ return obj.cmmCd; });



//차량상태코드 Array
var carStatCdDs = [];
<c:forEach var="obj" items="${carStatList}">
if( "${obj.cmmCd}" == "60" || "${obj.cmmCd}" == "70"){
    carStatCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
}
</c:forEach>
//차량상태코드 Map
var carStatCdMap = dms.data.arrayToMap(carStatCdDs, function(obj){ return obj.cmmCd; });


//판매유형SAL003
var saleTpDs = [];
<c:forEach var="obj" items="${saleTpList}">
    saleTpDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//차량상태코드 Map
var saleTpMap = dms.data.arrayToMap(saleTpDs, function(obj){ return obj.cmmCd; });



//매입경로 SAL027
var purcPathNmDs = [];
<c:forEach var="obj" items="${purcPathNmList}">
    purcPathNmDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//매입경로 Map
var purcPathNmMap = dms.data.arrayToMap(purcPathNmDs, function(obj){ return obj.cmmCd; });


//자사구분 SAL118
var corpCarDstinCdDs = [];
<c:forEach var="obj" items="${corpCarDstinCdList}">
    corpCarDstinCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//자사구분 Map
var corpCarDstinCdMap = dms.data.arrayToMap(corpCarDstinCdDs, function(obj){ return obj.cmmCd; });



$(document).ready(function() {

    /*
     * max 500으로 지정. 여백이 있는경우는 줄여야함
     */

     $("#uscCarMstWindow").kendoWindow({
         animation:false
         ,draggable:false
         ,modal:true
         ,resizable:false
         ,visible:false
         ,title:"<spring:message code='sal.lbl.detailSearch' />"      // 상세정보
         ,width:"950px"
         ,height:"500px"
     }).data("kendoWindow");






    //검색조건 - 차량상태
    $("#sCarStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carStatCdDs
        ,optionLabel:" "  // 전체
    });



    //검색조건 - 브랜드
    $("#sCarBrandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:""
        ,optionLabel:" "  // 전체
    });

    /*************************** 검색 조건 영역 END **************************************************/

    //상세 - 차량상태
    $("#carStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:carStatCdDs,
        change:function(e){
            var dataItem = this.dataItem(e.item);

                if(dataItem.cmmCd == "70"){
                    $(".group-OrdDt1").show();
                }else {
                    if(!confirm("<spring:message code='sal.info.saleStatContResetYn' />")){
                    	$("#carStatCd").data("kendoExtDropDownList").value("70");
                        return false;
                    }
                    
                    $("#saleStatCd").data("kendoExtDropDownList").value("");
                    $("#remark").val("");

                    $(".group-OrdDt1").hide();
                }
        }
    });


    //상세 - 매입경로
    $("#purcPathNm").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:purcPathNmDs,
        optionLabel:" "
    });


    //상세 - 자사차량구분
    $("#corpCarDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:corpCarDstinCdDs,
        optionLabel:" "
    });



    //상세 - 판매가능여부
    $("#saleYn").kendoExtDropDownList({
        //dataTextField:"cmmCdNm",
        //dataValueField:"cmmCd",
        dataSource:["", "Y", "N"]
    });



    //상세 - 판매유형
    $("#saleTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:saleTpDs,
        optionLabel:" "
    });



    //상세 - 브랜드
    $("#carBrandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carBrandCdDs
        ,optionLabel:" "  // 전체
    });



    //판매일자
    $("#custSaleDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });



    //취소일자
    $("#custSaleCancDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });


    //상세 - 판매상태
    $("#saleStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:saleStatCdDs,
        optionLabel:" "
    });



    /***************************************************************** 상세내용 영역 END ********************************************************************************/

    var validator = $("#viewModel1").kendoExtValidator().data("kendoExtValidator");

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            refresh();
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {

            var ownerGrid = $("#ownerGrid").data("kendoExtGrid");
            var driverGrid = $("#driverGrid").data("kendoExtGrid");
            var ownerGridData = ownerGrid.getCUDData("insertList", "updateList", "deleteList");
            var driverGridData = driverGrid.getCUDData("insertList", "updateList", "deleteList");



            if($("#carStatCd").val() == "70"){
                if($("#saleStatCd").val() == ""){
                    //판매유형을 선택해주세요.
                    dms.notification.warning("<spring:message code='sal.info.selectSaleType'/>");
                    return false;
                }else {
                    if($("#saleStatCd").val() == "04" && $("#remark").val() == ""){
                        dms.notification.warning("<spring:message code='sal.lbl.inputRemark'/>");
                        $("#remark").focus();
                        return false;
                    }
                }
            }



            var data = {
                    carId         :$("#carId").val()
                    ,carStatCd    :$("#carStatCd").data("kendoExtDropDownList").value()
                    ,carBrandCd:$("#carBrandCd").data("kendoExtDropDownList").value()
                    ,carNm        :$("#carNm").val()
                    ,carRunDistVal:$("#carRunDistVal").val()
                    ,carDispQty   :$("#carDispQty").val()
                    ,corpCarDstinCd:$("#corpCarDstinCd").data("kendoExtDropDownList").value()
                    ,purcPathNm   :$("#purcPathNm").data("kendoExtDropDownList").value()
                    ,saleStatCd   :$("#saleStatCd").data("kendoExtDropDownList").value()
                    ,remark       :$("#remark").val()
                }

            // form 데이터 및 그리드 변경 데이터 세팅
            var param = $.extend(
               {"usedCarMasterVO":data}
               ,{"ownerGridVO":ownerGridData}
               ,{"driverGridVO":driverGridData}
            );


            $.ajax({
                url:"<c:url value='/sal/usc/carMaster/multiSaveUsedCar.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
            }).done(function(result) {
                $("#uscCarMstWindow").data("kendoWindow").close();
                $("#grid").data("kendoExtGrid").dataSource.read();
                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");

            });


        }
    });



    //팝업 - 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            if(grid.select().index() == -1){
                // 차량을(를) 선택하세요.
                dms.notification.warning("<spring:message code='global.lbl.car' var='globalLblCar' /><spring:message code='global.info.check.field' arguments='${globalLblCar}' />");
                return false;
            }else {

                var grid;
                var msg;
                if(selectTabId == 'owner'){
                    grid = $('#ownerGrid').data('kendoExtGrid');
                    msg = "<spring:message code='global.lbl.add' var='globalLblAdd' /><spring:message code='global.lbl.infoData' var='globalLblInfoData' /><spring:message code='global.info.stInfo' arguments='${globalLblAdd}, ${globalLblInfoData}' />"
                        + "<br />"
                        + "<spring:message code='global.info.isSaveRun' />";
                }else if(selectTabId == 'driver'){
                    grid = $('#driverGrid').data('kendoExtGrid');
                    msg = "<spring:message code='global.lbl.add' var='globalLblAdd' /><spring:message code='global.lbl.infoData' var='globalLblInfoData' /><spring:message code='global.info.stInfo' arguments='${globalLblAdd}, ${globalLblInfoData}' />"
                        + "<br />"
                        + "<spring:message code='global.info.isSaveRun' />";
                }else {
                    return false;
                }


                var rows = grid.tbody.find("tr");
                var chk = false;
                $.each(rows, function(idx, row){
                    var item = grid.dataItem(row);
                    if(item.seq == ""){
                        chk = true;
                    }
                });


                if(chk){
                    dms.notification.info(msg);
                    return false;
                }


                grid.dataSource.insert(0, {
                     "carId":$("#carId").val()
                    ,"useYn":"Y"
                });
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



    /*************************** 버튼  영역 END **************************************************/


    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-121101"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/usc/carMaster/selectUsedCarMaster.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCarId"]     = $("#sCarId").val();                       // CAR ID
                        params["sVinNo"]     = $("#sVinNo").val();                       // VIN NO
                        params["sCarBrandCd"]= $("#sCarBrandCd").val();                  // 브랜드
                        params["sCarNm"]     = $("#sCarNm").val();                       // 차량명
                        params["sCarStatCd"] = $("#sCarStatCd").val();                   // 차량상태

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"carId"
                    ,fields:{
                        carId     :{type:"string"}
                        ,vinNo    :{type:"string"}
                        ,carBrandCd:{type:"string"}
                        ,carNm    :{type:"string"}
                        ,carStatCd:{type:"string"}
                        ,strgeCd  :{type:"string"}
                        ,locCd    :{type:"string"}
                        ,corpCarDstinCd:{type:"string"}
                    }
                }
            }
        }
        ,dataBinding:function(e) {
            kendo.bind($("#viewModel1"), {"usedCar":[{"carId":"", "carNm":""}]});
            kendo.bind($("#viewModel2"), {"topSelectionCar":[{"carId":"", "carNm":""}]});
        }
        ,change:function(e) {

            if(this.select().length != 0){
                var selectedVal = this.dataItem(this.select());
                var carId = selectedVal.carId;

                if ( dms.string.isNotEmpty(carId) ) {
                    $("#btnViewDetail").data("kendoButton").enable(true);
                }

            }
        }
        ,editable:false
        //,autoBind:false
        //,height  :450
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[ {field:"carId"          ,title:"<spring:message code = 'sal.lbl.carId'/>"      ,width:120 ,attributes:{"class":"ac"}}            //CAR ID
                    ,{field:"vinNo"          ,title:"<spring:message code = 'global.lbl.vinNum'/>"  ,width:130 ,attributes:{"class":"ac"}}          //VIN NO
                    ,{field:"carBrandCd"     ,title:"<spring:message code = 'global.lbl.brand'/>"   ,width:100 ,attributes:{"class":"ac"}
                        ,template:"# if(carBrandCdMap[carBrandCd] != null) { # #= carBrandCdMap[carBrandCd].cmmCdNm# # }#"
                     }          //브랜드
                    ,{field:"carNm"          ,title:"<spring:message code = 'global.lbl.carNm'/>"   ,width:100 ,attributes:{"class":"al"}}          //차량명
                    ,{field:"carStatCd"      ,title:"<spring:message code = 'global.lbl.vinSts'/>"  ,width:100 ,attributes:{"class":"ac"}
                        ,template:"# if(carStatCdMap[carStatCd] != null) { # #= carStatCdMap[carStatCd].cmmCdNm# # }#"
                     }//차량상태
                    ,{field:"strgeCd"        ,title:"<spring:message code = 'par.lbl.strge'/>"      ,width:100 ,attributes:{"class":"al"}}          //창고
                    ,{field:"locCd"          ,title:"<spring:message code = 'global.lbl.location'/>",width:100 ,attributes:{"class":"al"}}          //위치
                    ,{field:"corpCarDstinCd" ,title:"<spring:message code = 'sal.lbl.corpCarYn'/>"  ,width:100 ,attributes:{"class":"ac"}
                        ,template:"# if(corpCarDstinCdMap[corpCarDstinCd] != null) { # #= corpCarDstinCdMap[corpCarDstinCd].cmmCdNm# # }#"
                     }//자사차량여부
                   ]
    });


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


             $.ajax({
                 url:"<c:url value='/sal/usc/carMaster/selectUsedCar.do' />",
                 data:JSON.stringify({sCarId:selectedVal.carId}),
                 type:"POST",
                 dataType:"json",
                 contentType:"application/json",
                 error:function(jqXHR,status,error){
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 }

             }).done(function(result) {

                 var usedCar = result["usedCar"];
                 var topSelectionCar = result["topSelectionCar"];

                 kendo.bind($("#viewModel1"), usedCar);
                 kendo.bind($("#viewModel2"), topSelectionCar);

                 $("#ownerGrid").data("kendoExtGrid").dataSource.read();
                 $("#driverGrid").data("kendoExtGrid").dataSource.read();
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



    // 차량소유자 그리드.
    $("#ownerGrid").kendoExtGrid({
        gridId:"G-SAL-0721-115506"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/usc/carMaster/selectUsedCarOwner.do' />"
                    , dataType:"json"
                    , type:"POST"
                    , contentType:"application/json;"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["sort"] = options.sort;

                        var grid = $("#grid").data("kendoExtGrid");
                        var sltIdx = grid.select().index();
                        var data = grid.dataSource.view();
                        var sltVal = data[sltIdx];

                        params["sCarId"] = sltVal.carId;

                        return kendo.stringify(params);
                    }
                }
            }
            , schema:{
                model:{
                    id:"regDt"
                    ,fields:{
                         ownerPk:{ type:"string"}
                       , carId:{ type:"string"}
                       , seq  :{ type:"number"}
                       , custNo :{ type:"string"}
                       , custNm:{ type:"string",editable:false}
                       , useYn:{ type:"string"}
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
        , height:173
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , enableTooltip:true               //Tooltip 적용, default:false
        , columns:[ {field:"carId", hidden:true}
                    , {field:"seq", hidden:true}
                    , {field:"custNo", title:"<spring:message code='global.lbl.custNo' />", width:120//고객코드
                        ,attributes:{"class":"ac"}
                        ,editor:function(container, options) {
                             if(!options.model.isNew()){
                                 container.context.innerText = options.model.custNo
                                 return ;
                                }
                            $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:selectBpPopupWindow();"></a></div>')
                            .appendTo(container)
                        }
                      }
                    , {field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:200, attributes:{"class":"ac"}}//고객명
                    , {field:"useYn",title:"<spring:message code='global.lbl.useYn' />", width:150
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
                    , { field:"regUsrId", title:"<spring:message code='global.lbl.regUsrId' />", width:80, attributes:{"class":"ac"}} //등록자
                    , { field:"regDt",    title:"<spring:message code='global.lbl.regDt' />",    width:80, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //등록일
                ]
    });

    // 차량운전자 그리드.
    $("#driverGrid").kendoExtGrid({
        gridId:"G-SAL-0721-115507"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/usc/carMaster/selectUsedCarDriver.do' />"
                    , dataType:"json"
                    , type:"POST"
                    , contentType:"application/json;"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["sort"] = options.sort;

                        var grid = $("#grid").data("kendoExtGrid");
                        var sltIdx = grid.select().index();
                        var data = grid.dataSource.view();
                        var sltVal = data[sltIdx];

                        params["sCarId"] = sltVal.carId;

                        return kendo.stringify(params);
                    }
                }
            }
            , schema:{
                model:{
                    id:"regDt"
                    ,fields:{
                         dirverPk:{ type:"string"}
                       , carId:{ tpye:"string"}
                       , seq  :{ type:"number"}
                       , custNo :{ type:"string"}
                       , custNm:{ type:"string",editable:false}
                       , mdriverYn:{ type:"string", validation:{required:true}}
                       , useYn:{ type:"string", validation:{required:true}}
                       , regUsrId:{ type:"string",editable:false}
                       , regDt:{ type:"date",editable:false}
                    }
                }
            }
        }
        , pageable:false
        , autoBind:false
        , editableOnlyNew:true
        , editableOnlyNewExcludeColumns:["useYn","mdriverYn"]
        , height:173
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , enableTooltip:true               //Tooltip 적용, default:false
        , columns:[ {field:"carId", hidden:true}
                    , {field:"seq", hidden:true}
                    , {field:"custNo", title:"<spring:message code='global.lbl.custNo' />", width:120//고객코드
                        ,attributes:{"class":"ac"}
                        ,editor:function(container, options) {
                             if(!options.model.isNew()){
                                 container.context.innerText = options.model.custNo
                                 return ;
                                }
                            $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:selectBpPopupWindow();"></a></div>')
                            .appendTo(container)
                        }
                      }
                    , {field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:200, attributes:{"class":"ac"}}//고객명
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
                    , { field:"regUsrId", title:"<spring:message code='global.lbl.regUsrId' />", width:80, attributes:{"class":"ac"}} //등록자
                    , { field:"regDt",    title:"<spring:message code='global.lbl.regDt' />",    width:80, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //등록일
                ]
    });




    // 탭
    selectTabId = "carInfo";       // 초기값:차량소유자
    $("#tabstrip").kendoExtTabStrip({
        animation:false
       ,select:function(e) {
            selectTabId = e.item.id;

            var grid = $("#grid").data("kendoExtGrid");
            var sltIdx = grid.select().index();


            if(selectTabId == 'carInfo' || selectTabId == 'topSelectCarInfo'){
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnAdd").data("kendoButton").enable(false);
                $("#btnCancel").data("kendoButton").enable(false);
            }else if(selectTabId == 'owner' || selectTabId == 'driver'){
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnAdd").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(true);
            }


        }
    });

    $("#tabstrip").data("kendoExtTabStrip").select(0);

});



//팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
function viewPopup(){
    var win = $("#uscCarMstWindow").data("kendoWindow");
    win.center();
    win.open();
}



//내용 초기화
function refresh(){

    //차량소유자
    $("#ownerGrid").data("kendoExtGrid").dataSource.data([]);
    // 차량운전자
    $("#driverGrid").data("kendoExtGrid").dataSource.data([]);

}



var popupWindow;
//고객 팝업 열기 함수.
function selectBpPopupWindow(){
  popupWindow = dms.window.popup({
      windowId:"bpCdPopup"
      ,title:"<spring:message code = 'global.title.custSearch'/>"   // 고객 조회
      ,height:"450px"
      ,width:"850px"
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

                      dataItem.custNo = data[0].custNo;
                      dataItem.custNm = data[0].custNm;
                      grid.refresh();
                  }
                  popupWindow.close();
              }
          }
      }
  });
}
</script>
<!-- //script -->
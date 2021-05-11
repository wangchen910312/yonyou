<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<style>
.explist{padding:5px 0 0 10px;}
.explist li{padding:2px;}
.imglistarea{margin-top:10px;border:1px solid #e7e7e7;background:#f7f7f7;}
.imglist{overflow:hidden;padding:10px;}
.imglist li{width:16.5%;float:left;text-align:center;}
.imglist li sapn{width:120px;height:120px;}
.imglist li sapn img{width:100%;height:100%;}

</style>

<!-- tab -->
<!-- <div id="resizableContainer"> -->
<div>
    <!-- 탭메뉴 전체 영역 -->
    <div id="tabstrip" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="carMaster" class="k-state-active" selected><spring:message code="sal.lbl.carMaster" /><!-- 차량마스터 --></li>
            <li id="customerInfo"><spring:message code="global.lbl.custInfo" /><!-- 고객정보 --></li>
            <li id="carDtlInfo"><spring:message code="sal.lbl.carDetailInfo" /><!-- 차량상세정보 --></li>
            <li id="carImageInfo"><spring:message code="sal.lbl.vehicleImageInfo" /><!-- 차량이미지정보 --></li>
        </ul>
        <!-- //탭메뉴 -->


        <!-- 차량마스터 탭 -->
        <div class="mt0">
            <section class="group">
                <div class="tab_area">
                    <!-- 탭메뉴 -->
                    <ul>
                        <li class="k-state-active"><spring:message code="sal.lbl.chuantongMode" /></li><!-- 전통모드 -->
                        <li><spring:message code="sal.lbl.vinMode" /></li><!-- VIN(차대번호)모드 -->
                        <li><spring:message code="sal.lbl.interCodeMode" /></li><!-- 국제코드모드 -->
                    </ul>
                    <!-- //탭메뉴 -->


                    <!-- 전통모드 탭 -->
                    <div class="mt10">
                        <section class="group">
                            <div class="table_form form_width_70per">
                                <table>
                                    <caption></caption>
                                    <colgroup>
                                        <col style="width:12%;">
                                        <col style="width:20%;">
                                        <col style="width:17%;">
                                        <col style="width:17%;">
                                        <col style="width:17%;">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row"><spring:message code="sal.lbl.carDistrict" /></th><!-- 산지 -->
                                            <td>
                                                <input id="chandi1" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.chandi}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='sal.lbl.carRegNoFirst' /></th><!-- 번호판앞글자 -->
                                            <td>
                                                <input id="licensenostart1" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.licensenostart}</c:if>" type="text" class="form_input form_readonly" readonly >
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="sal.lbl.factory" /></th><!-- 제조사 -->
                                            <td>
                                                <input id="producecompany1" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.producecompany}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code="sal.lbl.paintLevel" /></th><!-- 페인트레벨 -->
                                            <td>
                                                <input id="youQi1" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.youqi}</c:if>" class="form_input form_readonly" readonly  >
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.brand' /></th><!-- 브랜드 -->
                                            <td>
                                                <input id="brand1" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.brand}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='global.lbl.carColor' /></th><!-- 차량색상 -->
                                            <td>
                                                <input id="color1" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.color}</c:if>" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.createYear' /></th><!-- 생산년도 -->
                                            <td>
                                                <input id="factorydate1" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.factorydate}</c:if>" type="date" class="form_datepicker form_disabled" disabled>
                                            </td>
                                            <th scope="row"><spring:message code='global.lbl.carType' /></th><!-- 차량유형 -->
                                            <td class="bor_none">
                                                <input id="carKind1" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.carkind}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.carKuanshi' /></th><!-- 차량타입 -->
                                            <td>
                                                <input id="carkuanshi1" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.carkuanshi}</c:if>" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='ser.lbl.runDist' /></th><!-- 주행거리 -->
                                            <td class="bor_none">
                                                <input id="coveredMiles1" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.coveredmiles}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th><!-- VIN NO -->
                                            <td class="bor_none">
                                                <input id="vinNo1" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.vin}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='sal.lbl.carLocation' /></th><!-- 차량소재지 -->
                                            <td class="bor_none">
                                                <input id="place1" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.place}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                                            <td>
                                                <input id="carModel1" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.carmodel}</c:if>" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='sal.lbl.blueRefPrice' /></th><!-- 표준참조가격(만원) -->
                                            <td class="bor_none">
                                                <input id="blueRefPrice1" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.bluerefprice}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.registrationYyMmDt' /></th><!-- 등록년도 -->
                                            <td class="bor_none">
                                                <input id="registDate1" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.registdate}</c:if>" type="date" class="form_datepicker form_disabled" disabled>
                                            </td>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.gear' /></th><!-- Gear -->
                                            <td class="bor_none">
                                                <input id="dangWei1" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.dangwei}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='sal.lbl.carBodyType' /></th><!-- 차체형식 -->
                                            <td class="bor_none">
                                                <input id="carLeixingBasic" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.carleixing}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td class="bor_none">
                                                <input id="carLeixing1Basic" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.carleixing1}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td class="bor_none">
                                                <input id="carLeixing2Basic" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.carleixing2}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.engine' /></th><!-- 엔진 -->
                                            <td class="bor_none">
                                                <input id="carfdj1" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.carfdj}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='global.lbl.fuel' /></th><!-- 연료 -->
                                            <td class="bor_none">
                                                <input id="carRanLiao1" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.carranliao}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.carDispQty' /></th><!-- 배기량 -->
                                            <td class="bor_none">
                                                <input id="carPaiLiang1" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.carpailiang}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.emitStandard' /></th><!-- 배출기준 -->
                                            <td class="bor_none">
                                                <input id="carPaiFangBz1" value="<c:if test="${topSelectionUsedCarVO.issave == '1' }">${topSelectionUsedCarVO.carpaifangbz}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </div>
                    <!-- //전통모드탭-->



                    <!-- VIN(차대번호) 탭 -->
                    <div class="mt10">
                        <section class="group">
                            <div class="table_form form_width_70per">
                                <table>
                                    <caption></caption>
                                    <colgroup>
                                        <col style="width:12%;">
                                        <col style="width:20%;">
                                        <col style="width:17%;">
                                        <col style="width:17%;">
                                        <col style="width:17%;">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th><!-- VIN NO -->
                                            <td class="bor_none">
                                                <input id="vinNo2" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.vin}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.carKuanshi' /></th><!-- 차량타입 -->
                                            <td>
                                                <input id="carkuanshi2" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.carkuanshi}</c:if>" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='sal.lbl.carRegNoFirst' /></th><!-- 번호판앞글자 -->
                                            <td>
                                                <input id="licensenostart2" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.licensenostart}</c:if>" type="text" class="form_input form_readonly" readonly >
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="sal.lbl.carDistrict" /></th><!-- 산지 -->
                                            <td>
                                                <input id="chandi2" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.chandi}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code="sal.lbl.paintLevel" /></th><!-- 페인트레벨 -->
                                            <td>
                                                <input id="youQi2" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.youqi}</c:if>" class="form_input form_readonly" readonly  >
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="sal.lbl.factory" /></th><!-- 제조사 -->
                                            <td>
                                                <input id="producecompany2" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.producecompany}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='global.lbl.carColor' /></th><!-- 차량색상 -->
                                            <td>
                                                <input id="color2" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.color}</c:if>" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.brand' /></th><!-- 브랜드 -->
                                            <td>
                                                <input id="brand2" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.brand}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='global.lbl.carType' /></th><!-- 차량유형 -->
                                            <td class="bor_none">
                                                <input id="carKind2" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.carkind}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.createYear' /></th><!-- 생산년도 -->
                                            <td>
                                                <input id="factorydate2" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.factorydate}</c:if>" type="date" class="form_datepicker form_disabled" disabled>
                                            </td>
                                            <th scope="row"><spring:message code='ser.lbl.runDist' /></th><!-- 주행거리 -->
                                            <td class="bor_none">
                                                <input id="coveredMiles2" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.coveredmiles}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                                            <td>
                                                <input id="carModel2" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.carmodel}</c:if>" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='sal.lbl.carLocation' /></th><!-- 차량소재지 -->
                                            <td class="bor_none">
                                                <input id="place2" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.place}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.blueRefPrice' /></th><!-- 표준참조가격(만원) -->
                                            <td class="bor_none">
                                                <input id="blueRefPrice2" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.bluerefprice}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.gear' /></th><!-- Gear -->
                                            <td class="bor_none">
                                                <input id="dangWei2" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.dangwei}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='sal.lbl.registrationYyMmDt' /></th><!-- 등록년도 -->
                                            <td class="bor_none">
                                                <input id="registDate2" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.registdate}</c:if>" type="date" class="form_datepicker form_disabled" disabled>
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.engine' /></th><!-- 엔진 -->
                                            <td class="bor_none">
                                                <input id="carfdj2" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.carfdj}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='sal.lbl.carBodyType' /></th><!-- 차체형식 -->
                                            <td class="bor_none">
                                                <input id="carLeixingVin" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.carleixing}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td class="bor_none">
                                                <input id="carLeixing1Vin" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.carleixing1}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td class="bor_none">
                                                <input id="carLeixing2Vin" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.carleixing2}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.fuel' /></th><!-- 연료 -->
                                            <td class="bor_none">
                                                <input id="carRanLiao2" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.carranliao}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.emitStandard' /></th><!-- 배출기준 -->
                                            <td class="bor_none">
                                                <input id="carPaiFangBz2" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.carpaifangbz}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='global.lbl.carDispQty' /></th><!-- 배기량 -->
                                            <td class="bor_none">
                                                <input id="carPaiLiang2" value="<c:if test="${topSelectionUsedCarVO.issave == '2' }">${topSelectionUsedCarVO.carpailiang}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </div>
                    <!-- //VIN(차대번호) 탭-->


                    <!-- 국제코드 탭 -->
                    <div class="mt10">
                        <section class="group">
                            <div class="table_form form_width_70per">
                                <table>
                                    <caption></caption>
                                    <colgroup>
                                        <col style="width:12%;">
                                        <col style="width:20%;">
                                        <col style="width:17%;">
                                        <col style="width:17%;">
                                        <col style="width:17%;">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                                            <td>
                                                <input id="carModel3" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.carmodel}</c:if>" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.createYear' /></th><!-- 생산년도 -->
                                            <td>
                                                <input id="factorydate3" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.factorydate}</c:if>" type="date" class="form_datepicker form_disabled" disabled>
                                            </td>
                                            <th scope="row"><spring:message code='sal.lbl.carRegNoFirst' /></th><!-- 번호판앞글자 -->
                                            <td>
                                                <input id="licensenostart3" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.licensenostart}</c:if>" type="text" class="form_input form_readonly" readonly >
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.carKuanshi' /></th><!-- 차량타입 -->
                                            <td>
                                                <input id="carkuanshi3" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.carkuanshi}</c:if>" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code="sal.lbl.paintLevel" /></th><!-- 페인트레벨 -->
                                            <td>
                                                <input id="youQi2" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.youqi}</c:if>" class="form_input form_readonly" readonly  >
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="sal.lbl.carDistrict" /></th><!-- 산지 -->
                                            <td>
                                                <input id="chandi3" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.chandi}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='global.lbl.carColor' /></th><!-- 차량색상 -->
                                            <td>
                                                <input id="color3" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.color}</c:if>" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="sal.lbl.factory" /></th><!-- 제조사 -->
                                            <td>
                                                <input id="producecompany3" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.producecompany}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='global.lbl.carType' /></th><!-- 차량유형 -->
                                            <td class="bor_none">
                                                <input id="carKind3" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.carkind}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.brand' /></th><!-- 브랜드 -->
                                            <td>
                                                <input id="brand3" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.brand}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='ser.lbl.runDist' /></th><!-- 주행거리 -->
                                            <td class="bor_none">
                                                <input id="coveredMiles3" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.coveredmiles}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th><!-- VIN NO -->
                                            <td class="bor_none">
                                                <input id="vinNo3" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.vin}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='sal.lbl.carLocation' /></th><!-- 차량소재지 -->
                                            <td class="bor_none">
                                                <input id="place3" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.place}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.blueRefPrice' /></th><!-- 표준참조가격(만원) -->
                                            <td class="bor_none">
                                                <input id="blueRefPrice3" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.bluerefprice}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.gear' /></th><!-- Gear -->
                                            <td class="bor_none">
                                                <input id="dangWei3" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.dangwei}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='sal.lbl.registrationYyMmDt' /></th><!-- 등록년도 -->
                                            <td class="bor_none">
                                                <input id="registDate3" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.registdate}</c:if>" type="date" class="form_datepicker form_disabled" disabled>
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.engine' /></th><!-- 엔진 -->
                                            <td class="bor_none">
                                                <input id="carfdj3" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.carfdj}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='sal.lbl.carBodyType' /></th><!-- 차체형식 -->
                                            <td class="bor_none">
                                                <input id="carLeixingCode" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.carleixing}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td class="bor_none">
                                                <input id="carLeixing1Code" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.carleixing1}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td class="bor_none">
                                                <input id="carLeixing2Code" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.carleixing2}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.fuel' /></th><!-- 연료 -->
                                            <td class="bor_none">
                                                <input id="carRanLiao3" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.carranliao}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.emitStandard' /></th><!-- 배출기준 -->
                                            <td class="bor_none">
                                                <input id="carPaiFangBz3" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.carpaifangbz}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='global.lbl.carDispQty' /></th><!-- 배기량 -->
                                            <td class="bor_none">
                                                <input id="carPaiLiang3" value="<c:if test="${topSelectionUsedCarVO.issave == '3' }">${topSelectionUsedCarVO.carpailiang}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </div>
                    <!-- //국제코드 탭-->
                </div>
            </section>
        </div>
        <!-- //차량마스터 탭 -->



        <!-- 고객정보 -->
        <div>
            <section class="group">
                <div class="tab_area">
                    <!-- 탭메뉴 -->
                    <ul>
                        <li class="k-state-active"><spring:message code="sal.lbl.personalCustomer" /></li><!-- 개인고객 -->
                        <li><spring:message code="sal.lbl.groupCustomer" /></li><!-- 집단고객 -->
                    </ul>
                    <!-- //탭메뉴 -->


                    <!-- 개인고객 탭 -->
                    <div class="mt10">
                        <section class="group">
                            <div class="table_form form_width_70per">
                                <table>
                                    <caption></caption>
                                    <colgroup>
                                        <col style="width:12%;">
                                        <col style="width:20%;">
                                        <col style="width:17%;">
                                        <col style="width:17%;">
                                        <col style="width:17%;">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.name" /></th><!-- 이름 -->
                                            <td>
                                                <input id="perName1" value="<c:if test="${topSelectionCustomerVO.ownertype == 'P' }">${topSelectionCustomerVO.pername}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='sal.lbl.ssnCrnTp' /></th><!-- 신분증유형 -->
                                            <td>
                                                <input id="perPaperType1" value="<c:if test="${topSelectionCustomerVO.ownertype == 'P' }">${topSelectionCustomerVO.perpapertype}</c:if>" type="text" class="form_input form_readonly" readonly >
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="sal.lbl.telNumber1" /></th><!-- 연락처1 -->
                                            <td>
                                                <input id="perPhoneP1" value="<c:if test="${topSelectionCustomerVO.ownertype == 'P' }">${topSelectionCustomerVO.perphone1}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code="sal.lbl.perPapaerNo" /></th><!-- 신분증번호 -->
                                            <td>
                                                <input id="perPaperNo1" value="<c:if test="${topSelectionCustomerVO.ownertype == 'P' }">${topSelectionCustomerVO.perpaperno}</c:if>" class="form_input form_readonly" readonly  >
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.telNumber2' /></th><!-- 연락처2 -->
                                            <td>
                                                <input id="perPhoneP2" value="<c:if test="${topSelectionCustomerVO.ownertype == 'P' }">${topSelectionCustomerVO.perphone2}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <th scope="row"><spring:message code='global.lbl.idAddress' /></th><!-- 신분증주소 -->
                                            <td>
                                                <input id="perHu1" value="<c:if test="${topSelectionCustomerVO.ownertype == 'P' }">${topSelectionCustomerVO.perhu}</c:if>" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.emailAddr' /></th><!-- Email주소 -->
                                            <td>
                                                <input id="perEmail1" value="<c:if test="${topSelectionCustomerVO.ownertype == 'P' }">${topSelectionCustomerVO.peremail}</c:if>" type="date" class="form_input form_disabled" disabled>
                                            </td>
                                            <th scope="row"><spring:message code='global.lbl.detlAddr' /></th><!-- 상세주소 -->
                                            <td class="bor_none">
                                                <input id="perAddr" value="<c:if test="${topSelectionCustomerVO.ownertype == 'P' }">${topSelectionCustomerVO.peraddr}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </div>
                    <!-- //개인고객 탭-->



                    <!-- 집단고객 탭 -->
                    <div class="mt10">
                        <section class="group">
                            <div class="table_form form_width_70per">
                                <table>
                                    <caption></caption>
                                    <colgroup>
                                        <col style="width:12%;">
                                        <col style="width:20%;">
                                        <col style="width:17%;">
                                        <col style="width:17%;">
                                        <col style="width:17%;">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.groupCustomerName' /></th><!-- 집단고객명칭 -->
                                            <td class="bor_none">
                                                <input id="comName" value="<c:if test="${topSelectionCustomerVO.ownertype == 'C' }">${topSelectionCustomerVO.comname}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.relCustInfo1' /></th><!-- 연계인1 -->
                                            <td>
                                                <input id="comContactMan1" value="<c:if test="${topSelectionCustomerVO.ownertype == 'C' }">${topSelectionCustomerVO.comcontactman1}</c:if>" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="sal.lbl.relCustInfo2" /></th><!-- 연계인2 -->
                                            <td>
                                                <input id="comContactMan2" value="<c:if test="${topSelectionCustomerVO.ownertype == 'C' }">${topSelectionCustomerVO.comcontactman2}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="sal.lbl.telNumber1" /></th><!-- 연락처1 -->
                                            <td>
                                                <input id="comPhone1" value="<c:if test="${topSelectionCustomerVO.ownertype == 'C' }">${topSelectionCustomerVO.comphone1}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.telNumber2' /></th><!-- 연락처2 -->
                                            <td>
                                                <input id="comPhone2" value="<c:if test="${topSelectionCustomerVO.ownertype == 'C' }">${topSelectionCustomerVO.comphone2}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.custAttr' /></th><!-- 고객속성 -->
                                            <td>
                                                <input id="comType" value="<c:if test="${topSelectionCustomerVO.ownertype == 'C' }">${topSelectionCustomerVO.comtype}</c:if>" type="date" class="form_input form_disabled" disabled>
                                            </td>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.ssnCrnTp' /></th><!-- 신분증유형 -->
                                            <td>
                                                <input id="perPaperType" value="<c:if test="${topSelectionCustomerVO.ownertype == 'C' }">${topSelectionCustomerVO.perpapertype}</c:if>" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='sal.lbl.perPapaerNo' /></th><!-- 신분증번호 -->
                                            <td class="bor_none">
                                                <input id="perPaperNo" value="<c:if test="${topSelectionCustomerVO.ownertype == 'C' }">${topSelectionCustomerVO.perpaperno}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.idAddress' /></th><!-- 신분증주소 -->
                                            <td class="bor_none">
                                                <input id="perHu" value="<c:if test="${topSelectionCustomerVO.ownertype == 'C' }">${topSelectionCustomerVO.perhu}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.zipCd' /></th><!-- 우편번호 -->
                                            <td class="bor_none">
                                                <input id="comZipCode" value="<c:if test="${topSelectionCustomerVO.ownertype == 'C' }">${topSelectionCustomerVO.comzipcode}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="4"></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.detlAddr' /></th><!-- 상세주소 -->
                                            <td class="bor_none">
                                                <input id="comAddr" value="<c:if test="${topSelectionCustomerVO.ownertype == 'C' }">${topSelectionCustomerVO.comaddr}</c:if>" type="text" class="form_input form_readonly" readonly>
                                            </td>
                                            <td colspan="4"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </div>
                    <!-- //집단고객 탭-->
                </div>
            </section>
        </div>
        <!-- //고객정보 -->


        <!-- 차량상세정보 탭 -->
        <div>
            <section class="group">
                <div class="table_form form_width_70per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:12%;">
                            <col style="width:20%;">
                            <col style="width:17%;">
                            <col style="width:17%;">
                            <col style="width:17%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.buyChannel" /></th><!-- 매입채널 -->
                                <td>
                                    <input id="buyFrom1" value="${topSelectionUsedCarVO.buyfrom1}" type="text" class="form_input form_readonly" readonly>
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.infoFrom" /></th><!-- 정보유통경로 -->
                                <td>
                                    <input id="buyFrom2" value="${topSelectionUsedCarVO.buyfrom2}" type="text" class="form_input form_readonly" readonly >
                                </td>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.enginNo" /></th><!-- 엔진번호 -->
                                <td>
                                    <input id="engineNo" value="${topSelectionUsedCarVO.engineno}" type="text" class="form_input form_readonly" readonly>
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.oldCarRegNo" /></th><!-- 차량번호판(구) -->
                                <td>
                                    <input id="licenseNo" value="${topSelectionUsedCarVO.licenseno}" class="form_input form_readonly" readonly  >
                                </td>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.exchangeType" /></th><!-- 거래방식 -->
                                <td>
                                    <input id="exchangeType" value="${topSelectionUsedCarVO.exchangetype}" type="text" class="form_input form_readonly" readonly>
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.carRegNoDelivery" /></th><!-- 번호판번호(인도후) -->
                                <td>
                                    <input id="newLicenseNo" value="${topSelectionUsedCarVO.newlicenseno}" class="form_input form_readonly" readonly>
                                </td>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.isMustInsure" /></th><!-- 교통강제보험 -->
                                <td>
                                    <input id="isMustInsure" value="${topSelectionUsedCarVO.ismustinsure}" type="date" class="form_input form_readonly" readonly>
                                </td>
                                <td colspan="4"></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.businessInsure' /></th><!-- 상업보험 -->
                                <td colspan="5">
                                    <div id="insurance" style="list-style:none;">
                                        <input type='checkbox' name='insurance' id='insurance1' <c:if test="${topSelectionUsedCarVO.insurance1 == '1' }">checked</c:if> class='label_check form_disabled' disabled/><spring:message code="crm.lbl.problemN" /><!-- 없음 -->
                                        <input type='checkbox' name='insurance' id='insurance2' <c:if test="${topSelectionUsedCarVO.insurance2 == '1' }">checked</c:if> class='label_check form_disabled' disabled/><spring:message code="sal.lbl.carDamage" /><!-- 차량손해 -->
                                        <input type='checkbox' name='insurance' id='insurance3' <c:if test="${topSelectionUsedCarVO.insurance3 == '1' }">checked</c:if> class='label_check form_disabled' disabled/><spring:message code="sal.lbl.thirdParty" /><!-- 제삼자 -->
                                        <input type='checkbox' name='insurance' id='insurance4' <c:if test="${topSelectionUsedCarVO.insurance4 == '1' }">checked</c:if> class='label_check form_disabled' disabled/><spring:message code="sal.lbl.robbery" /><!-- 도난 -->
                                        <input type='checkbox' name='insurance' id='insurance5' <c:if test="${topSelectionUsedCarVO.insurance5 == '1' }">checked</c:if> class='label_check form_disabled' disabled/><spring:message code="sal.lbl.carMember" /><!-- 차량인원 -->
                                        <input type='checkbox' name='insurance' id='insurance6' <c:if test="${topSelectionUsedCarVO.insurance6 == '1' }">checked</c:if> class='label_check form_disabled' disabled/><spring:message code="sal.lbl.NonDeductible" /><!-- 부가 -->
                                        <input type='checkbox' name='insurance' id='insurance7' <c:if test="${topSelectionUsedCarVO.insurance7 == '1' }">checked</c:if> class='label_check form_disabled' disabled/><spring:message code="sal.lbl.glass" /><!-- 유리 -->
                                        <input type='checkbox' name='insurance' id='insurance8' <c:if test="${topSelectionUsedCarVO.insurance8 == '1' }">checked</c:if> class='label_check form_disabled' disabled/><spring:message code="sal.lbl.scratch" /><!-- 스크래치 -->
                                        <input type='checkbox' name='insurance' id='insurance9' <c:if test="${topSelectionUsedCarVO.insurance9 == '1' }">checked</c:if> class='label_check form_disabled' disabled/><spring:message code="sal.lbl.flooding" /><!-- 침수 -->
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.isMustInsurePeriod' /></th><!-- 강제보험완료기한 -->
                                <td>
                                    <input id="mustInsure" value="${topSelectionUsedCarVO.mustinsure}" type="text" class="form_datepicker form_disabled" disabled>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.businessInsurePeriod' /></th><!-- 상업보험기한 -->
                                <td>
                                    <input id="commerceInsure" value="${topSelectionUsedCarVO.commerceinsure}" class="form_datepicker form_disabled" disabled>
                                </td>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.sellWithLicense' /></th><!-- 번호판포함판매여부 -->
                                <td>
                                    <input id="sellWithLicense" value="${topSelectionUsedCarVO.sellwithlicense}" type="text" class="form_comboBox form_disabled" disabled>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.carCheckDate' /></th><!-- 년점검완료일자 -->
                                <td>
                                    <input id="" value="" class="form_input form_readonly" readonly>
                                </td>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.storePlace' /></th><!-- 창고주소 -->
                                <td>
                                    <input id="storePlace" value="${topSelectionUsedCarVO.storeplace}" type="text" class="form_input form_readonly" readonly>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.buyDate' /></th><!-- 매입일자 -->
                                <td>
                                    <input id="acquisitionDate" value="${topSelectionUsedCarVO.acquisitiondate}" class="form_datepicker form_disabled" disabled>
                                </td>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.insureContract' /></th><!-- 보험계약 -->
                                <td>
                                    <input id="remarks" value="${topSelectionUsedCarVO.remarks}" type="text" class="form_comboBox form_disabled" disabled>
                                </td>
                                <td colspan="4"></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.usedCarBillingNo' /></th><!-- 중고차영수증번호 -->
                                <td>
                                    <input id="billing" value="${topSelectionUsedCarVO.billing}" type="text" class="form_input form_readonly" readonly>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.usedCarBillingDate' /></th><!-- 중고차영수증일자 -->
                                <td>
                                    <input id="billingTime" value="${topSelectionUsedCarVO.billingtime}" class="form_datepicker form_disabled" disabled>
                                </td>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.isRegCard' /></th><!-- 고객소유영수증 -->
                                <td colspan="5">
                                    <div id="isRegCardArea" >
                                        <input type='checkbox' name='isRegCard' id='isRegCard1' <c:if test="${topSelectionUsedCarVO.isregcard1 == '1' }">checked</c:if> class='label_check form_disabled' disabled/><spring:message code="sal.lbl.vehicleRegCar" /><!-- 등록증 -->
                                        <input type='checkbox' name='isRegCard' id='isRegCard2' <c:if test="${topSelectionUsedCarVO.isregcard2 == '1' }">checked</c:if> class='label_check form_disabled' disabled/><spring:message code="sal.lbl.vehicleDrivingCard" /><!-- 운전증 -->
                                        <input type='checkbox' name='isRegCard' id='isRegCard3' <c:if test="${topSelectionUsedCarVO.isregcard3 == '1' }">checked</c:if> class='label_check form_disabled' disabled/><spring:message code="sal.lbl.taxCertificateCard" /><!-- 구매세증 -->
                                        <input type='checkbox' name='isRegCard' id='isRegCard4' <c:if test="${topSelectionUsedCarVO.isregcard4 == '1' }">checked</c:if> class='label_check form_disabled' disabled/><spring:message code="sal.lbl.purchaseInvoice" /><!-- 차량구입영수증(신차영수증) -->
                                        <input type='checkbox' name='isRegCard' id='isRegCard5' <c:if test="${topSelectionUsedCarVO.isregcard5 == '1' }">checked</c:if> class='label_check form_disabled' disabled/><spring:message code="sal.lbl.purchaseStamps" /><!-- 구매세표 -->
                                        <input type='checkbox' name='isRegCard' id='isRegCard6' <c:if test="${topSelectionUsedCarVO.isregcard6 == '1' }">checked</c:if> class='label_check form_disabled' disabled/><spring:message code="sal.lbl.transgerTicket" /><!-- 인도표 -->
                                        <input type='checkbox' name='isRegCard' id='isRegCard7' <c:if test="${topSelectionUsedCarVO.isregcard7 == '1' }">checked</c:if> class='label_check form_disabled' disabled/><spring:message code="sal.lbl.envirProtCertificate" /><!-- 환경보호증 -->
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.deadlineTime' /></th><!-- 마감시간 -->
                                <td>
                                    <input id="" value="" type="text" class="form_input form_readonly" readonly>
                                </td>
                                <td colspan="4"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
        <!-- //차량상세정보 탭 -->


        <!-- 차량이미지 정보 탭 -->
        <div class="mt0">
            <div class="clfix">
                <section class="left_areaStyle">
                    <div class="header_area">
                        <h2 class="title_basic">要求</h2>						<!-- 요구 -->
                    </div>
                    <ul class="explist">
                        <li>- 至少上传3张照片，认证4S店上传的认证车辆，必须上传6张照片</li>  	<!-- 최소3장 시진을 올려햐함, 인증한 4s 점에서 인증 한 차량의 경우 6장 사진 올려야함  -->
                        <li>- 分辨率：800*600至1024*768，照片500K以下</li>      	<!-- 800*600에서 1024*768, 사진 500K  이하  -->
                    </ul>
                </section>
                <section class="right_areaStyle">
                    <div class="header_area">
                        <h2 class="title_basic">6方位照片角度</h2>   			<!-- 6 방향의 사진 각도 -->
                    </div>
                    <ul class="explist">
                        <li>1. 左前方45°带号牌（必传）</li>    						<!-- 1. 앞 45도 번호판 포함 (필수) -->
                        <li>2. 仪表盘公里数（必传）</li>       						<!-- 2. 게이지판 키로 수(필수) -->
                        <li>3. 前风挡下车架号（必传） </li>     						<!-- 3. 앞 유리의 VIN 번호 (필수) -->
                        <li>4. 前排内饰（认证车必传）</li>     						<!-- 4. 앞에 인테리어 (인증 차 필수) -->
                        <li>5. 后排内饰（认证车必传）</li>      					<!-- 5. 뒤에 인테리어 (인증 차 필수) -->
                        <li>6. 发动机舱（认证车必传）</li>      					<!-- 6. 옌지  (인증 차 필수) -->
                    </ul>
                </section>
            </div>
            <div class="imglistarea" style="overflow:hidden;padding:5px;">
            	<c:forEach items="${vehicleImageList}" var="item">
	            	<c:if test="${item.imgFileNm != null}">
	            		<div class="vehicle-img" data-img-nm='${item.imgNm}' data-img-file-nm='${item.imgFileNm}' style="float:left;border:2px solid #FFFFFF;width:120px;height:90px;background-size:contain;background-repeat: no-repeat;background-position: center;background-image:url('http://zhihuan.xd2sc.com/Data/CarImage/${item.imgFileNm}')"></div>
	            	</c:if>
            	</c:forEach>
            </div>
        </div>
        <!-- //차량이미지 정보 탭-->
    </div>
    <!-- //탭메뉴 전체 영역 -->


    <!-- 파일업로드 내역조회 영역 -->
    <%@include file="selectIncludeMain.jsp" %>
    <!-- 파일업로드 내역조회 영역종료 -->

</div>
<!-- //tab -->
<!-- <div id="resizableContainer"> -->

<!-- script -->
<script type="text/javascript">
var carId = "${carId}";
var id = "${id}";
var vin = "${topSelectionUsedCarVO.vin}";

//선택된 Tab 아이디
var selectTabId;


$(document).ready(function() {
    // 탭
    $("#tabstrip, .tab_area").kendoExtTabStrip({
        animation:false
       ,select:function(e) {
            selectTabId = e.item.id;
            //resizeGrid();
        }
    });

    //생산일자1(전통모드)
    $("#factorydate1").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    //등록일자1(전통모드)
    $("#registDate1").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //생산일자2(VIN모드)
    $("#factorydate2").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    //등록일자2(VIN모드)
    $("#registDate2").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });



    //생산일자3(국제코드모드)
    $("#factorydate3").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    //등록일자3(국제코드모드)
    $("#registDate3").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //보험계약
    $("#remarks").kendoExtDropDownList({
        dataSource:['Y','N']
        ,optionLabel:" "  // 전체
    });


    //번호판포함판매
    $("#sellWithLicense").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:[{"cmmCd":"1", "cmmCdNm":"<spring:message code='crm.lbl.problemY'/>"}
                      ,{"cmmCd":"0", "cmmCdNm":"<spring:message code='crm.lbl.problemN'/>"}
                      ]
        ,optionLabel:" "  // 전체
    });

    //강제보험완료기한
    $("#mustInsure").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //상업보험기간
    $("#commerceInsure").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //매입일자
    $("#acquisitionDate").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //중고차영수증일자
    $("#billingTime").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

	$(".imglistarea .vehicle-img")
	.mouseover(function(e){
		var that = this;
		$("#imageContainer").css({
			"background-image":"url('http://zhihuan.xd2sc.com/Data/CarImage/"+$(this).data("imgFileNm")+"')"
		});

		imageViewerTimer = setTimeout(function(){
			var windowHeight = $(window).innerHeight();
			var top = (windowHeight-e.clientY >= 450)? e.clientY:e.clientY-(450-(windowHeight-e.clientY));
			var left = e.clientX;

			$("#imageNm").text($(that).data("imgNm"));

			$("#imageViewer")
    		.css({
    			"top":top
    			,"left":left
    		}).show();

			clearTimeout(imageViewerTimer);
		}, 500);
	})
	.mouseout(function(e){
		clearTimeout(imageViewerTimer);
		$("#imageViewer").hide();
	})
});

</script>
<!-- //script -->
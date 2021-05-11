<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<style type="text/css">
.form_readonly_text_blue {background-color:#dbdbdb!important; -webkit-text-fill-color:#45b4e8; color:#45b4e8!important; -webkit-opacity:1; opacity:1;}

.inputX::-ms-clear {display: none;}

</style>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 계약관리 상세 -->
<section id="window" class="pop_wrap">
<form id="contForm" name="contForm" method="POST">

    <!-- 계약상세정보 -->
    <section class="group">
        <div class="header_area">
            <%-- <h2 class="title_basic"><spring:message code='sal.title.retailContractDetail' /></h2> --%>    <!-- 계약상세정보 -->

            <div class="left_area">
                <!-- 판매기회여부 -->
                <%-- <input id="saleOpptYn" type="checkbox" class="form_check" disabled /><spring:message code='global.lbl.saleOpptYn' /> --%>
                <span id="saleOpptTxt" class="txt_label bg_green" style="display:none"> <spring:message code='global.lbl.saleOppt' /> </span>   <!-- 판매기회 -->
            </div>
            <div id="dPopButton" class="btn_right" style="display:none;">
                <button id="btnSaleAccountPrint" type="button" class="btn_m"><spring:message code='sal.btn.saleAccountPrint' /></button>   <!-- 완성차판매정산서 -->
                <button id="btnSanbaoPrint" type="button" class="btn_m" style="display:none;"><spring:message code='ser.btn.sanbaoPrint' /></button>   <!-- 삼포증 -->
                <button id="btnViewPrint" type="button" class="btn_m" style="display:none;"><spring:message code='sal.btn.giDoc' /></button>           <!-- 출고증 -->
                <button id="btnPayPrint" type="button" class="btn_m"><spring:message code='sal.btn.payPrint' /></button>         <!-- 결산서출력 -->
                <button id="btnContPrint" type="button" class="btn_m"><spring:message code='sal.btn.contPrint' /></button>       <!-- 계약서출력 -->
                <%-- <button id="btnCancel" type="button" class="btn_m"><spring:message code='global.lbl.contractCancel' /></button> --%>  <!-- 계약취소 -->
                <button id="btnSave"   type="button" class="btn_m"><spring:message code='global.btn.save' /></button>            <!-- 저장 -->
                <button id="btnCreate" type="button" class="btn_m"><spring:message code='sal.btn.contractCreate' /></button>     <!-- 계약생성 -->
            </div>
        </div>

        <div class="table_form">
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
                        <th scope="row"><spring:message code='global.lbl.contractNo' /></th>        <!-- 계약번호 -->
                        <td>
                            <input id="contractNo" name="contractNo" class="form_input form_readonly" readonly data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.contractDt' /></th>        <!-- 계약일자 -->
                        <td>
                            <input id="contractDt" name="contractDt" class="form_datepicker" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.beforeNo' /></th> <!-- 예약번호 -->
                        <td>
                            <div class="form_search" style="width:79%">
                                <input id="beforeNo" name="beforeNo" readonly class="form_input" data-json-obj="true" />
                                <input type="hidden" id="beBeforeNo" name="beBeforeNo" data-json-obj="true" />
                                <input type="hidden" id="beforeImplyYn" name="beforeImplyYn" data-json-obj="true" />
                                <a href="javascript:fn_beforeNoSearch();"><spring:message code='global.btn.search' /></a>  <!-- 조회 -->
                            </div>
                            <button type="button" class="btn_s" onclick="bf_initBeforeNo()"><spring:message code='global.btn.cancel' /></button>   <!-- 취소 -->
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.dlReqDt' /></span></th>    <!-- 인도요청일 -->
                        <td>
                            <input id="dlReqDt" name="dlReqDt" class="form_datepicker" data-json-obj="true" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.salPrsnNm' /></span></th>     <!-- 판매담당자 -->
                        <td>
                            <input id="saleEmpNo" name="saleEmpNo" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row" class="bor_none"></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.channelType" /></th>      <!-- 채널유형 --> <%-- <spring:message code='sal.lbl.chnLv2' /> --%>
                        <td>
                            <input id="dstbChnCd" name="dstbChnCd" class="form_comboBox" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.lv2DlrOrg' /></th>        <!-- 2급딜러 -->
                        <td>
                            <input id="lv2DlrOrgCd" name="lv2DlrOrgCd" class="form_comboBox" data-json-obj="true">                        </td>
                        </td>
                        <th scope="row" class="bor_none"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //계약상세정보 -->

    <!-- 고객정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='global.title.custinfo' /></h2>         <!-- 고객정보 -->
        </div>
        <!-- 개인 -->
        <div id="cust_01" class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:11%;">
                    <col style="width:8%;">
                    <col style="width:10%;">
                    <col style="width:7.5%;">
                    <col style="width:10%;">
                    <col style="width:8%;">
                    <col>
                    <col style="width:7.5%;">
                    <col style="width:10%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.customer' /></span></th>      <!-- 고객 -->
                        <td colspan="3">
                            <div class="form_float">
                                <div class="form_left">
                                    <div class="form_search">
                                        <input id="vCustNm_01" class="form_input onKey_up onKey_bulr" />
                                        <a href="javascript:bf_searchCustomer('vCustNm_01');"><spring:message code='global.btn.search' /></a>     <!-- 검색 -->
                                        <input id="custNm_01" type="hidden" />
                                    </div>
                                </div>
                                <div class="form_right">
                                    <input id="custCd_01" readonly class="form_input form_readonly_text_blue linkCustNo" style="cursor:pointer;" />
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.custTp' /></th>   <!-- 고객유형 -->
                        <td>
                            <input id="personalTxt_01" value="<spring:message code='global.lbl.personal' />" readonly class="form_input form_readonly ac">       <!-- 개인 -->
                        </td>
                        <td colspan="4">
                        <%--
                             <button type="button" class="btn_s" id="btnCrmCustSearch_01" onclick="bf_crmCustSearch();" style="display:none"><spring:message code='sal.btn.refresh' /></button>   <!-- 갱신 -->
                        --%>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.mathDocTp' /></span></th>  <!-- 증서유형 -->
                        <td>
                            <input id="ssnCrnTp_01" class="form_comboBox" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.ssnCrnNo' /></span></th>   <!-- 증서번호 -->
                        <td colspan="3">
                            <input id="ssnCrnNo_01" type="text" readonly class="form_input form_readonly numberandalpha" pattern="[0-9A-Z]" maxlength="20" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.hpNo' /></span></th>        <!-- 전화번호 -->
                        <td>
                            <input id="telNo1_01" type="text" readonly class="form_input form_readonly numberic" data-type="mobile" pattern="\d" maxlength="11" />
                            <input type="hidden" id="telNo2_01">         <!-- 전화번호2 화면에 없음 -->
                            <input type="hidden" id="emailNm_01" />      <!-- 이메일 -->
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.addrTp' /></span></th><!-- 주소유형 -->
                        <td>
                            <input id="addrTp_01" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.sung' /></span></th>  <!-- 성 -->
                        <td>
                            <input id="sungNm_01" readonly class="form_input form_readonly" />
                            <input type="hidden" id="sungCd_01" class="form_input" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.cityCd' /></span></th>  <!-- 시 -->
                        <td>
                            <input id="cityNm_01" readonly class="form_input form_readonly" />
                            <input type="hidden" id="cityCd_01" class="form_input" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.dist' /></span></th>  <!-- 구 -->
                        <td>
                             <input id="distNm_01" readonly class="form_input form_readonly" />
                             <input type="hidden" id="distCd_01" class="form_input" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.detlAddr' /></span></th>   <!-- 상세주소 -->
                        <td>
                            <input id="addrDetlCont_01" class="form_input" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.zipCd' /></span></th>
                        <td>
                            <div class="form_search">
                                <input id="zipCd_01" class="form_input" maxlength="6" />
                                <a href="javascript:bf_custZipCodeSearch('01');"><spring:message code='global.btn.search' /></a>       <!-- 조회 -->
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- //개인 -->
        <!-- 법인 -->
        <div id="cust_02" class="table_form" style="display:none">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:7.5%;">
                    <col style="width:10%;">
                    <col style="width:7.5%;">
                    <col style="width:10%;">
                    <col style="width:7.5%;">
                    <col style="width:10%;">
                    <col style="width:7.5%;">
                    <col>
                    <col style="width:9%;">
                    <col style="width:10%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.customer' /></span></th>      <!-- 고객 -->
                        <td colspan="3">
                            <div class="form_float">
                                <div class="form_left">
                                    <div class="form_search">
                                        <input id="vCustNm_02" class="form_input onKey_up onKey_bulr">
                                        <a href="javascript:bf_searchCustomer('vCustNm_02');"><spring:message code='global.btn.search' /></a>     <!-- 검색 -->
                                        <input id="custNm_02" type="hidden" />
                                    </div>
                                </div>
                                <div class="form_right">
                                    <input id="custCd_02" readonly class="form_input form_readonly_text_blue linkCustNo" style="cursor:pointer;" />
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.custTp' /></th>       <!-- 고객유형 -->
                        <td>
                            <input id="personalTxt_02" value="<spring:message code='global.lbl.corporation' />" readonly class="form_input form_readonly ac">        <!-- 법인 -->
                        </td>
                        <th scope="row"><spring:message code='sal.taxPayNo' /></th>   <!-- 납세번호 -->
                        <td>
                            <input id="taxPayNo_02" value="" readonly class="form_input form_readonly">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.corpPurcMng" /></span></th> <!-- 구매담당자명 -->
                        <td>
                            <input id="purcMngNm_02" type="text" value="" readonly class="form_input form_readonly" />
                        </td>
                        <%--
                        <td colspan="2">
                             <button type="button" class="btn_s" id="btnCrmCustSearch_02" onclick="bf_crmCustSearch();" style="display:none"><spring:message code='sal.btn.refresh' /></button>   <!-- 갱신 -->
                        </td>
                        --%>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.mathDocTp' /></span></th>       <!-- 증서유형 -->
                        <td>
                            <input id="ssnCrnTp_02" class="form_comboBox" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.ssnCrnNo' /></span></th>         <!-- 증서번호 -->
                        <td colspan="3">
                            <input id="ssnCrnNo_02" type="text" readonly class="form_input form_readonly" maxlength="25" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.hpNo' /></span></th>            <!-- 전화번호 -->
                        <td>
                            <input id="telNo1_02" type="text" readonly class="form_input form_readonly numberic" data-type="mobile" pattern="\d" maxlength="11" />
                            <input type="hidden" id="telNo2_02" />    <!-- 전화번호2 화면에 없음 -->
                            <input type="hidden" id="emailNm_02" class="form_input" />  <!-- 이메일 -->
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.addrTp' /></span></th><!-- 주소유형 -->
                        <td>
                            <input id="addrTp_02" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.sung' /></span></th>  <!-- 성 -->
                        <td>
                            <input id="sungNm_02" readonly class="form_input form_readonly" />
                            <input type="hidden" id="sungCd_02" class="form_input" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.cityCd' /></span></th>  <!-- 시 -->
                        <td>
                            <input id="cityNm_02" readonly class="form_input form_readonly" />
                            <input type="hidden" id="cityCd_02" class="form_input" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.dist' /></span></th>  <!-- 구 -->
                        <td>
                             <input id="distNm_02" readonly class="form_input form_readonly" />
                             <input type="hidden" id="distCd_02" class="form_input" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.detlAddr' /></span></th>   <!-- 상세주소 -->
                        <td>
                            <input id="addrDetlCont_02" class="form_input" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.zipCd' /></span></th>      <!-- 우편번호 -->
                        <td>
                            <div class="form_search">
                                <input id="zipCd_02" class="form_input" readonly maxlength="6" />
                                <a href="javascript:bf_custZipCodeSearch('02');"><spring:message code='global.btn.search' /></a>       <!-- 조회 -->
                            </div>
                        </td>

                    </tr>
                </tbody>
            </table>
        </div>
        <!-- //법인 -->
    </section>
    <!-- //계약고객정보 -->

    <!-- 차량정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='ser.title.carInfo' /></h2>   <!-- 차량정보 -->
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:26%;">
                    <col style="width:8%;">
                    <col style="width:22%;">
                    <col style="width:10%;">
                    <col style="width:11%;">
                    <col style="width:7%;">
                    <col style="width:10%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th>  <!-- VIN NO -->
                        <td>
                            <div class="form_search" style="width:81%">
                            <input id="sVinNo" type="text" maxlength="17" class="form_input inputX" style="text-transform:uppercase; ms-clear:display:none;"/>
                                <a href="#" onclick="bf_searchVinNo();" ><spring:message code='global.lbl.search' /></a>   <!-- 검색 -->
                            </div>
                            <!-- <input type="text" id="vinNo" name="vinNo" readonly class="form_input form_readonly" data-json-obj="true" style="width:47%" /> -->
                            <input type="hidden" id="vinNo" name="vinNo" readonly class="form_input form_readonly" data-json-obj="true" />
                            <input type="hidden" id="beforVinNo" name="beforVinNo" data-json-obj="true" />
                            <button type="button" class="btn_s" onclick="bf_initVinNo()"><spring:message code='global.btn.cancel' /></button>   <!-- 취소 -->
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.carLine' /></span></th>  <!-- 차종 -->
                        <td>
                            <input id="carlineCd" name="carlineCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.model' /></th>    <!-- 차관 -->
                        <td colspan="3">
                            <input id="fscCd" name="fscCd" class="form_comboBox" data-json-obj="true" />
                            <input id="modelCd" type="hidden" class="form_input" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.ocn' /></th> <!-- OCN -->
                        <td>
                            <input id="ocnCd" name="ocnCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.extColor' /></th>                          <!-- 외장색 -->
                        <td>
                            <input id="extColorCd" name="extColorCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.intColor' /></th>                          <!-- 내장색 -->
                        <td colspan="3">
                            <input id="intColorCd" name="intColorCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.payTp' /></th>          <!-- 지불방식 -->
                        <td>
                            <input id="payTp" name="payTp" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.carRetlAmt' /></th>   <!-- 지도가:공장지도가 -->
                        <td>
                            <input id="retlAmt" name="retlAmt" type="text" readonly class="form_numeric form_readonly ar" data-json-obj="true" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.realCarAmts' /></span></th>       <!-- 순차량금액:실제차량금액 -->
                        <td colspan="3">
                            <input id="realCarAmt" name="realCarAmt" onblur="bf_addDcRealAmt();" onfocus="fnOnfocus(this.id);" type="text" maxlength="12" class="form_numeric ar" data-json-obj="true" />

                            <!-- <spring:message code='sal.lbl.upgrdAmt' /> 우대금액 -->
                            <input type="hidden" id="promotionAmt" name="promotionAmt" readonly class="form_numeric form_readonly ar" data-json-obj="true" />
                        </td>

                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //차량정보 -->

    <!-- 계약가격정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.title.contractPriceInfo' /></h2>     <!-- 계약가격정보 -->
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
                    <%-- <col style="width:11%;"> --%>
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
                        <%-- <th scope="col" rowspan="2"><spring:message code='sal.lbl.promotion' /></th> --%>        <!-- 프로모션 -->
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
                        <!-- <td class="ar child_borderNone"><input id="promotionAmt" name="promotionAmt" class="form_numeric ar font_bold" disabled="disabled" data-json-obj="true" /></td> -->    <!-- 판촉 -->
                        <td class="ar child_borderNone"><input id="pointAmt" name="pointAmt" class="form_numeric ar font_bold" disabled="disabled" data-json-obj="true" /></td>    <!-- 포인트 -->
                        <td class="ar td_total child_borderNone"><input id="realPayAmt" name="realPayAmt" class="form_numeric ar font_bold" disabled="disabled" data-json-obj="true" /></td>     <!-- 실제지불금액 -->
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //계약가격정보 -->

    <!-- 탭메뉴 전체 영역 -->
    <div id="tabstrip" class="tab_area tab_area_v1 mt10">
        <!-- 탭메뉴 -->
        <ul>
            <li id="goodsTab" class="k-state-active"><spring:message code='sal.lbl.goods' /></li>   <!-- 용품 -->
            <li id="incServiceTab"><spring:message code='global.lbl.insurance' /></li>   <!-- 보험 -->
            <li id="fincTab"><spring:message code='global.lbl.finc' /></li>              <!-- 금융 -->
            <li id="useCarTab"><spring:message code='sal.lbl.usedCars' /></li>           <!-- 중고차 -->
            <li id="subServiceTab"><spring:message code='sal.lbl.subServices' /></li>    <!-- 대행업무 -->
            <li id="pointTab"><spring:message code='sal.lbl.bmPoint' /></li>               <!-- 포인트 -->
        </ul>
        <!-- //탭메뉴 -->

        <!-- 용품 -->
        <div class="mt0">
            <div class="header_area">
                <div class="btn_right">
                    <div class="txt_total mt0 child_borderNone" style="display:inline-block;position:relative;top:3px;margin-right:10px;">
                        <!-- 합계 -->
                        <p><spring:message code='global.lbl.total' /> :<input id="goodsTotAmt" class="form_numeric" readonly="readonly" style="width:80px;" /></p>
                    </div>
                    <button id="btnGoodsAdd" type="button" class="btn_s"><spring:message code='global.btn.rowAdd' /></button>          <!-- 행추가 -->
                    <button id="btnGoodsDel" type="button" class="btn_s"><spring:message code='global.btn.rowDel' /></button>          <!-- 행삭제 -->
                    <button id="btnGoodsCancel" type="button" class="btn_s"><spring:message code='global.btn.cancel' /></button>       <!-- 취소 -->
                </div>
            </div>
            <div class="table_grid">
                <div id="goodsGrid"></div>
            </div>
        </div>
        <!-- //용품 -->

        <!-- 보험서비스 -->
        <div class="mt0">
            <!-- 보험서비스 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='sal.title.incService' /></h2>      <!-- 보험서비스 -->

                    <div class="left_area">
                        <ul class="tabmenu">
                            <li id="incAapTp01"><button type="button"><spring:message code='global.lbl.execution' /></button></li>           <!-- 대행 -->
                            <li id="incAapTp02" class="on"><button type="button"><spring:message code='global.lbl.himSelf' /></button></li>  <!-- 본인 -->
                        </ul>
                        <input type="hidden" id="incAapTp" name="incAapTp" data-json-obj="true" />
                    </div>
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:11%;">
                            <col style="width:14%;">
                            <col style="width:11%;">
                            <col style="width:14%;">
                            <col style="width:11%;">
                            <col style="width:14%;">
                            <col style="width:11%;">
                            <col style="width:14%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span name="tsIncSpan"><spring:message code='sal.lbl.incExpcsAmt' /></span></th>     <!-- 보험예상금액(예상총금액) -->
                                <td>
                                    <!-- <input type="hidden" id="incAapTp" name="incAapTp" value="A" data-json-obj="true" /> -->
                                    <input id="incExpcAmt" name="incExpcAmt" onblur="bf_incImplyYn();bf_sumIncAmt();" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.realIncsAmt' /></th>     <!-- 실보험총금액 -->
                                <td>
                                    <input id="realIncAmt" name="realIncAmt" readonly class="form_numeric form_readonly ar" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.regDifferenceAmt' /></th>             <!-- 차액 -->
                                <td>
                                    <input id="incDifferenceAmt" readonly class="form_numeric form_readonly ar"/>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.incImplyYn' /></th>     <!-- 총금액포함여부 -->
                                <td>
                                    <input id="incImplyYn" type="checkbox" onclick="bf_incImplyYn()" class="form_check" checked />
                                </td>
                            </tr>

                            <tr>
                                <th scope="row"><spring:message code='global.lbl.relCustInfo' /></th>     <!-- 연계인 -->
                                <td>
                                    <input id="incPconCustNm" name="incPconCustNm" type="text" class="form_input" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.saleEmpTel' /></th>     <!-- 연계인전화 -->
                                <td>
                                    <input id="incPconCustTelNo" name="incPconCustTelNo" type="text" class="form_input numberic" data-type="mobile" pattern="\d" maxlength="13" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.insured' /></th>             <!-- 피보험자 -->
                                <td>
                                    <input id="incCustNm" name="incCustNm" type="text" class="form_input" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.incTelNo' /></th>     <!-- 피보험자전화 -->
                                <td>
                                    <input id="incCustTelNo" name="incCustTelNo" type="text" class="form_input numberic" data-type="mobile" pattern="\d" maxlength="13" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span name="tsIncSpan"><spring:message code='global.lbl.incCmp' /></span></th>    <!-- 보험회사 -->
                                <td>
                                    <input id="incCmpCd" name="incCmpCd" class="form_comboBox" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.incProfitNm' /></th>      <!-- 제1수익자 -->
                                <td>
                                    <input id="incProfitNm" name="incProfitNm" class="form_input" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.incFeeAmt' /></th>       <!-- 보험수수료 -->
                                <td>
                                    <input id="incFeeAmt" name="incFeeAmt" onblur="bf_incImplyYn();" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true"/>
                                </td>
                                <th scope="row" style="display:none;"><spring:message code='sal.lbl.finImplyYn' /></th>   <!-- 재무수납여부 -->
                                <td style="display:none;">
                                    <input type="checkbox" id="finImplyYn" class="form_check" disabled="disabled" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.frcIncAmt' /></th>      <!-- 강제보험금액 -->
                                <td>
                                    <input id="frcIncAmt" name="frcIncAmt" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.busIncAmt' /></th>      <!-- 상업보험금액 -->
                                <td>
                                    <input id="busIncAmt" name="busIncAmt" class="form_numeric ar" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.transTaxAmt' /></th><!-- 차량선박세 -->
                                <td>
                                    <input id="transIncTaxAmt" name="transIncTaxAmt" class="form_numeric ar" data-json-obj="true">
                                </td>
                                <th scope="row"></th>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.incType' /></th>       <!-- 보험종류 -->
                                <td colspan="7">
                                    <div class="header_area">
                                        <div class="btn_right">
                                            <button id="btnIncAllChange" type="button" class="btn_s"><spring:message code='sal.btn.incAllChange' /></button>        <!-- 일괄변경 -->
                                            <button id="btnIncAdd" type="button"  class="btn_s"><spring:message code='global.btn.rowAdd' /></button>        <!-- 행추가 -->
                                            <button id="btnIncDel" type="button" class="btn_s"><spring:message code='global.btn.rowDel' /></button>         <!-- 행삭제 -->
                                            <button id="btnIncCancel" type="button" class="btn_s" style="display:none;"><spring:message code='global.btn.cancel' /></button>          <!-- 취소 -->
                                        </div>
                                    </div>
                                    <div class="table_grid">
                                        <div id="incGrid" ></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.remark' /></th>     <!-- 비고 -->
                                <td colspan="7">
                                    <input id="incRemark" name="incRemark" class="form_input" data-json-obj="true" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //보험서비스 -->
        </div>
        <!-- //보험서비스 -->

        <!-- 금융서비스 -->
        <div class="mt0">
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='sal.title.fincService' /></h2>      <!-- 금융서비스 -->
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:11%;">
                            <col style="width:14%;">
                            <col style="width:11%;">
                            <col style="width:14%;">
                            <col style="width:11%;">
                            <col style="width:14%;">
                            <col style="width:11%;">
                            <col style="width:14%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.fincServiceApp' /></th>       <!-- 금융서비스처리 -->
                                <td colspan="7">
                                    <ul class="tabmenu">
                                        <li id="fincTp01"><button type="button"><spring:message code='global.lbl.execution' /></button></li>                <!-- 대행 -->
                                        <li id="fincTp02" class="on"><button type="button"><spring:message code='global.lbl.himSelf' /></button></li>       <!-- 본인 -->
                                    </ul>
                                    <input type="hidden" id="fincReqYn" name="fincReqYn" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span name="tsFincSpan"><spring:message code='global.lbl.fincCmp' /></span></th>       <!-- 금융사 -->
                                <td>
                                    <input id="fincCmpCd" name="fincCmpCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.fincRpayPrid' /></th>       <!-- 상환기간 -->
                                <td>
                                    <input id="fincRpayPrid" name="fincRpayPrid" maxlength="3" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.fincLoadRate' /></th>    <!-- 대출비율(%) -->
                                <td>
                                    <input id="fincLoadRate" name="fincLoadRate"  onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                <!--  대출수수료  贾明 合同签订管理：贷款手续费，保证手续费 隐藏 2019-4-16 -->
                                <th style="display:none" scope="row"><spring:message code='sal.lbl.fincFeeAmt' /></th>      
                                <td style="display:none">
                                    <input id="fincFeeAmt" name="fincFeeAmt" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.fincItem' /></th>             <!-- 상품 -->
                                <td>
                                    <input id="fincItemCd" name="fincItemCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.fincItemAmt' /></th>   <!-- 자기금액(고객부담금액) -->
                                <td>
                                    <input id="fincBurdAmt" name="fincBurdAmt" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.instIntrRate" /></th>      <!-- 할부이자율 -->
                                <td>
                                    <input id="instIntrRate" name="instIntrRate" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                <!--  보증수수료 贾明 合同签订管理：贷款手续费，保证手续费 隐藏 2019-4-16   -->
                                <th style="display:none" scope="row"><spring:message code="sal.lbl.grteIncAmt" /></th> 
                                <td style="display:none">
                                    <input id="grteIncAmt" name="grteIncAmt" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.fincReqDt' /></th>     <!-- 신청일자 -->
                                <td>
                                    <input id="fincReqDt" name="fincReqDt" class="form_datepicker" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.fincEndDt' /></th>     <!-- 만기일자 -->
                                <td>
                                    <input id="fincEndDt" name="fincEndDt" class="form_datepicker" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.fincReqAmt' /></th>        <!-- 신청금액 -->
                                <td>
                                    <input id="fincReqAmt" name="fincReqAmt" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                <td colspan="2"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
        <!-- //금융서비스 -->

        <!-- 중고차치환 -->
        <div class="mt0">
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='sal.lbl.useCar' /></h2>      <!-- 중고차치환 -->
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:24%;">
                            <col style="width:14%;">
                            <col style="width:14%;">
                            <col style="width:14%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.uatcCarPurc' /></th>   <!-- 치환여부 -->
                                <td>
                                    <input id="uatcCarPurcYn" name="uatcCarPurcYn" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.vinNum' /></th>     <!-- VIN NO -->
                                <td colspan="3">
                                    <div class="form_search" style="width:82%">
                                    <input id="sUsrVinNo" type="text" maxlength="17" class="form_input" style="text-transform:uppercase;"/>
                                        <a href="#" onclick="bf_searchUsedCarVinNo();" ><spring:message code='global.lbl.search' /></a>   <!-- 검색 -->
                                    </div>
                                    <!-- <input id="usrVinNo" name="usrVinNo" maxlength="17" readonly class="form_input form_readonly" style="width:47%" data-json-obj="true" /> -->
                                    <input type="hidden" id="usrVinNo" name="usrVinNo" maxlength="17" readonly class="form_input form_readonly" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.documentNo' /></th>   <!-- 매입번호 -->
                                <td>
                                    <input id="purcNo" name="purcNo" class="form_input form_readonly" readonly data-json-obj="true" />
                                    <input id="beforPurcNo" name="beforPurcNo" type="hidden" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.sbsAmt' /></th>    <!-- 치환금액 -->
                                <td>
                                    <input id="usrSbstAmt" name="usrSbstAmt" onblur="bf_addUsrSbstAmt();" onfocus="fnOnfocus(this.id);" readonly class="form_numeric form_readonly ar" data-json-obj="true" />
                                </td>
                                <th scope="row"></th>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.usrSubsidyamt' /></th><!-- 기업보조금 -->
                                <td>
                                    <input id="subsidyAmt" name="subsidyAmt" onblur="bf_addUsrSbstAmt();" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true"/>
                                    <input type="hidden" id="sbusTp" name="sbusTp" value="1" data-json-obj="true"/>
                                </td>
                                <td align="right">
                                    <label class="label_check"><input id="tabSbusTp01" name="tabSbusTp" type="radio" value="1" checked="checked" class="form_check" /><spring:message code='sal.lbl.noNApply' /></label><!-- 불반영 -->
                                </td>
                                <td align="right">
                                    <label class="label_check"><input id="tabSbusTp02" name="tabSbusTp" type="radio" value="2" class="form_check" /><spring:message code='sal.lbl.totPriceApply' /></label><!-- 총금액반영 -->
                                </td>
                                <td align="right">
                                    <label class="label_check"><input id="tabSbusTp03" name="tabSbusTp" type="radio" value="3" class="form_check" /><spring:message code='sal.lbl.recPrice' /></label><!-- 영수증가격 -->
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
        <!-- //중고차치환 -->

        <!-- 대행업무 -->
        <div class="mt0">

            <div class="header_area">
                <h2 class="title_basic"><spring:message code='sal.lbl.subServices' /></h2>
                <div class="left_area">
                    <ul class="tabmenu">
                        <li id="tabRegTp01"><button type="button"><spring:message code='global.lbl.execution' /></button></li>           <!-- 대행 -->
                        <li id="tabRegTp02" class="on"><button type="button"><spring:message code='global.lbl.himSelf' /></button></li>  <!-- 본인 -->
                    </ul>
                    <input type="hidden" id="regTp" name="regTp" data-json-obj="true" />
                </div>
                <div class="btn_right">
                    <button id="btnAapsAdd" type="button" class="btn_s"><spring:message code='global.btn.rowAdd' /></button>          <!-- 행추가 -->
                    <button id="btnAapsDel" type="button" class="btn_s"><spring:message code='global.btn.rowDel' /></button>          <!-- 행삭제 -->
                    <button id="btnAapsCancel" type="button" class="btn_s"><spring:message code='global.btn.cancel' /></button>       <!-- 취소 -->
                </div>
            </div>
            <section class="group">
                <div class="table_grid mt10">
                    <div id="aapGrid"></div>
                </div>
            </section>
        </div>
        <!-- //대행업무 -->

        <!-- 포인트 -->
        <div class="mt0">
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='sal.lbl.bmPoint'/></h2> <!-- BM 포인트 -->
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:13%;">
                            <col style="width:15%;">
                            <col style="width:8%;">
                            <col style="width:14%;">
                            <col style="width:20%;">
                            <col style="width:13%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.blueMembershipNo'/></th><!-- 블루멤버십번호 -->
                                <td class="readonly_area">
                                    <input id="blueMembershipNo" readonly class="form_input form_readonly" />
                                    <input id="blueMembershipId" type="hidden" />
                                </td>
                                <td>&nbsp;</td>
                                <th scope="row"><spring:message code='crm.lbl.mLevel'/></th><!-- 회원등급 -->
                                <td class="readonly_area">
                                    <input id="mLevel" readonly class="form_comboBox"/>
                                </td>
                                <th scope="row"><spring:message code='global.lbl.joinDt' /></th>    <!-- 가입일 -->
                                <td>
                                    <input id="regDt" readonly class="form_datepicker form_readonly"  />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.usePoint' /></th>   <!-- 가용포인트 -->
                                <td class="readonly_area">
                                    <input id="point" readonly class="form_numeric form_readonly ar" />
                                    <input id="bluePointApplyRate" name="bluePointApplyRate" type="hidden" data-json-obj="true" />
                                </td>
                                <td>
                                    <button type="button" class="btn_s" id="btnBmPointSearch"><spring:message code='sal.btn.refresh' /></button>   <!-- 갱신 -->
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.bmPointUse' /></th>    <!-- BM포인트사용금액 -->
                                <td >
                                    <input id="blueMembershipPointVal" name="blueMembershipPointVal" onblur="bf_sumPointAmt();" onfocus="fnOnfocus(this.id);" class="form_numeric ar" style="width:45%" data-json-obj="true" />
                                    <input id="tBlueAmount" readonly class="form_numeric form_readonly ar" style="width:47%" />
                                </td>
                                <th scope="row"></th>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
        <!-- //포인트 -->

    </div>
    <!-- //탭메뉴 전체 영역 -->

<!-- hidden값  -->
<span style="display:none">
    <!-- 계약고객유형 :SAL028 C:계약자, D:실운전자 -->
    <!-- 계약자 고객유형 :01:개인, 02:법인 -->
    <input id="custTp" name="custTp" type="hidden" data-json-obj="true" />

    <!--
        계약상태 :SAL002
        10      계약등록
        20      계약생성
        50      고객인도
        90      계약삭제
        91      계약해지
    -->
    <input id="contractStatCd" name="contractStatCd" type="hidden" data-json-obj="true" />

    <!-- 견적번호 -->
    <input id="estimateNo" name="estimateNo" type="hidden" data-json-obj="true" />

    <!-- 할인레벨 코드 -->
    <input id="dcLvlCd" name="dcLvlCd" data-json-obj="true" />

    <!-- 할인승인여부 -->
    <input id="dcApproveYn" name="dcApproveYn" value="N" data-json-obj="true" />

    <!-- 판매기회번호 -->
    <input id="saleOpptNo" name="saleOpptNo" data-json-obj="true" />

    <!-- 그룹계약번호 -->
    <input id="grpContractNo" name="grpContractNo" readonly class="form_input form_readonly" data-json-obj="true" />

    <!-- 판매유형 -->
    <input id="contractTp" name="contractTp" class="form_comboBox" data-json-obj="true" />

    <!-- 개인-납세번호 -->
    <input id="taxPayNo_01" type="hidden" value="" class="form_input" />

    <!-- 개인-구매담당자명 -->
    <input id="purcMngNm_01" type="hidden" value="" class="form_input" />

    <!-- 보험헤더 수정일자 -->
    <input id="incUpdtDtStr" name="incUpdtDtStr" type="hidden" value="" data-json-obj="true" />

    <!-- 보험가입일자 -->
    <input id="incJoinDt" name="incJoinDt" type="hidden" value="" data-json-obj="true" />

    <!-- 2급딜러 여부 -->
    <input id="lv2DlrYn" name="lv2DlrYn" type="hidden" value="N" data-json-obj="true">

    <!-- 계약수정일자 -->
    <input id="updtDtStr" name="updtDtStr" type="hidden" value="" data-json-obj="true" />
</span>
</form>
</section>
<!-- //계약관리 화면 -->

<!-- #스크립트 영역# -->
<script type="text/javascript">
<!--
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;
//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
var vDtyyyyMMdd = "${_dateFormat}";
// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);

// 딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";

//판매담당자 여부
var saleEmpYn = "${saleEmpYn}";
// 판매인 전체 조회 권한
var saleAdminYn = "${saleAdminYn}";

//임시 작업
//if(userId == "admin2"){ saleAdminYn = "Y"; }

// 사용자 직무, 채널유형
var chnInfoList = [];
<c:forEach var="obj" items="${dstbChnInfo}" varStatus="idx">
    chnInfoList.push({tskCd:"${obj.tskCd}", tskDetl:"${obj.tskDetl}", dstbChnCd:"${obj.dstbChnCd}", dstbChnNm:"${obj.dstbChnNm}"});
</c:forEach>
var chnInfo = chnInfoList[0];
chnInfoList = [];

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var sevenDay = "${sevenDay}";   // 현재일의 7일전
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후
var threeMonthDay = "${threeMonthDay}"; // 현재일 기준 3달전

var incModel = {};      // 보험서비스 임시 객체
var incGridModel = [];  // 보험그리드 임시 객체

var fincModel = {};     // 금융서비스 임시 객체

var regGridModel = [];  // 대행그리드 임시 객체

//차종조회
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//성 - 주소
var sungCdDs = [];
<c:forEach var="obj" items="${sungCdList}">
    sungCdDs.push({sungNm:"${obj.sungNm}", sungCd:"${obj.sungCd}"});
</c:forEach>

//판매사원 리스트
var selectSaleEmpDSList = [];
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
</c:forEach>

//지불방식 :SAL071
var amtPayTpList = [];
<c:forEach var="obj" items="${amtPayTpDS}">
    amtPayTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//계약유형 SAL003
var sContractTpList = [];
var contractTpList = [];    // 집단판매 제외, 직접
<c:forEach var="obj" items="${contractTpDS}">

    <c:if test="${obj.cmmCd ne 'G' and obj.cmmCd ne 'D' }">
        contractTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>

    sContractTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//계약상태
var contractStatCdList = [];
var contractStatCdArray = {};
<c:forEach var="obj" items="${contractStatCdDS}">
    contractStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    contractStatCdArray["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//용품판매품목상태
var itemStatCdList = [];
<c:forEach var="obj" items="${itemStatCdList}">
    itemStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var itemStatCdMap = dms.data.arrayToMap(itemStatCdList, function(obj){ return obj.cmmCd; });


//설치책임자
var eqipPrsnList = [];
<c:forEach var="obj" items="${eqipPrsnList}">
    eqipPrsnList.push({tecId:"${obj.tecId}", tecNm:"${obj.tecNm}"});
</c:forEach>
var eqipPrsnMap = dms.data.arrayToMap(eqipPrsnList, function(obj){ return obj.tecId; });

//탁송구분 :SAL125
// 탁송 :C , 방문 :I
// 차량등록지역 :SAL086

// 대행업무유형 : SAL021
var aapWorkList = [];
var aapWorkObj = {};
var incCmpCdList = [];
<c:forEach var="obj" items="${aapWorkDS}">
    aapWorkList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}", "remark1":"${obj.remark1}"});
    aapWorkObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 보험회사 :SAL127
var incCmpCdList = [];
<c:forEach var="obj" items="${incCmpCdDS}">
    incCmpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 보험유형 :SAL019
var insTpList = [];
var insTpObj = {};
<c:forEach var="obj" items="${insTpDS}">
    insTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    insTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//3자보험유형 :SAL197
var threeIncTpAmtDs = [];
var threeIncTpAmtObj = {};
<c:forEach var="obj" items="${threeIncTpAmtList}">
    threeIncTpAmtDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    threeIncTpAmtObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 금융사 :SAL055
var fincCmpCdList = [];
fincCmpCdList.push({"cmmCd":"BHAF", "cmmCdNm":"北现金融", "useYn":"Y"});
<c:forEach var="obj" items="${fincCmpCdDS}">
    fincCmpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 금융상품
var fincItemObj = {};
<c:forEach var="obj" items="${fincItemDS}">

    if(fincItemObj.hasOwnProperty("${obj.fincCmpCd}")){
        fincItemObj["${obj.fincCmpCd}"].push({"cmmCd":"${obj.fincItemCd}", "cmmCdNm":"${obj.fincItemNm}", "useYn":"${obj.useYn}"});
    }else{
        fincItemObj["${obj.fincCmpCd}"] = [];
        fincItemObj["${obj.fincCmpCd}"].push({"cmmCd":"${obj.fincItemCd}", "cmmCdNm":"${obj.fincItemNm}", "useYn":"${obj.useYn}"});
    }
</c:forEach>

var fincBHAFItemObj = {};
<c:forEach var="obj" items="${fincBHAFItemDS}">
//2018-12-05 update by fengdequan 合同管理下代办下商品只显示一条 start
    if(fincBHAFItemObj.hasOwnProperty("${obj.carlineCd}")){
        fincBHAFItemObj["${obj.carlineCd}"].push({"cmmCd":"${obj.fincItemCd}", "cmmCdNm":"${obj.fincItemNm}", "useYn":"${obj.useYn}"});
    }else{
        fincBHAFItemObj["${obj.carlineCd}"] = [];
        fincBHAFItemObj["${obj.carlineCd}"].push({"cmmCd":"${obj.fincItemCd}", "cmmCdNm":"${obj.fincItemNm}", "useYn":"${obj.useYn}"});
     
    }
  //2018-12-05 update by fengdequan 合同管理下代办下商品只显示一条 end
</c:forEach>


// 주요인증문서유형(신분증유형) :CRM024
var ssnCrnTpPList = [];        // remark1 - P :개인
var ssnCrnTpCList = [];        // remark1 - C :법인
<c:forEach var="obj" items="${mathDocTpDS}">
    <c:if test="${obj.remark1 eq 'P'}">
      ssnCrnTpPList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>

    <c:if test="${obj.remark1 eq 'C'}">
      ssnCrnTpCList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>

// 주소유형:CRM033
var addrTpList = [];
<c:forEach var="obj" items="${addrTpDS}">
    addrTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 할인레벨 :SAL156
var dcLvlCdObj = {};
<c:forEach var="obj" items="${dcLvlCdDS}">
    dcLvlCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 여부(Y/N) COM020
var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
    ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 채널유형 COM072
var dstbChnList = [];
<c:forEach var="obj" items="${dstbChnDs}">
    dstbChnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 블루멤버십 회원등급 유형 CRM806
var mLevelList = [];
<c:forEach var="obj" items="${mLevelList}">
    mLevelList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 2급딜러 리스트
var lvTwoDlrList = [];
var lvTwoDlrEWList = [];
var lvTwoDlrWXList = [];
<c:forEach var="obj" items="${lvTwoDlrDs}">
    lvTwoDlrList.push({"cmmCd":"${obj.sdlrCd}", "cmmCdNms":"${obj.sdlrNms}", "cmmCdNm":"${obj.sdlrNm}", "sdlrTp":"${obj.sdlrTp}"});

    <c:if test="${obj.sdlrTp eq 'WX'}">
      lvTwoDlrWXList.push({"cmmCd":"${obj.sdlrCd}", "cmmCdNms":"${obj.sdlrNms}", "cmmCdNm":"${obj.sdlrNm}", "sdlrTp":"${obj.sdlrTp}"});
    </c:if>
    <c:if test="${obj.sdlrTp eq 'EW'}">
      lvTwoDlrEWList.push({"cmmCd":"${obj.sdlrCd}", "cmmCdNms":"${obj.sdlrNms}", "cmmCdNm":"${obj.sdlrNm}", "sdlrTp":"${obj.sdlrTp}"});
    </c:if>
</c:forEach>

// 팝업 설정값
var options = parent.mainPopupWindow.options.content.data;

var popupWindow;
var dealerSearchPopupWin;

/******************************************
 * ready ()
 ******************************************/
$(document).ready(function() {

    // 저장
    $("#btnSave").kendoButton({
        enable:true,
        click:function(e){

            /** 무결성 검사 **/
            if( !save_Validate() ){
               return false;
            }

           popupWindow = dms.window.popup({
               windowId :"messagePopup"
               ,title :false
               ,width :300
               ,height:110
               ,modal:true
               ,content :{
                   url :"<c:url value='/sal/cnt/contractRe/contractMessagePopup.do' />"
                   ,data :{
                       "type" :null
                       ,"autoBind" :false
                       , msg :"<spring:message code='global.btn.save' var='globalBtnSave' /><spring:message code='global.info.cnfrmMsg' arguments='${globalBtnSave}' />"
                       , btnMsg01 :"<spring:message code='global.btn.save' />"
                       , btnMsg02 :"<spring:message code='global.btn.cancel' />"
                       ,"callbackFunc" :function(data){
                           if (data.msg == "01"){
                               // 직책별 할인금액 검사 로직 추가
                               dlrPromotionAmtChk('create');
                            }else{
                                return false;
                            }
                        }
                   }
               }
           });
        }
    });

    // 계약생성
    $("#btnCreate").kendoButton({
        enable:false,
        click:function(e){
            /** 무결성 검사 **/
            if( !save_Validate() ){
               return false;
            }

            popupWindow = dms.window.popup({
               windowId :"messagePopup"
               ,title :false
               ,width :300
               ,height:110
               ,modal:true
               ,content :{
                   url :"<c:url value='/sal/cnt/contractRe/contractMessagePopup.do' />"
                   ,data :{
                       "type" :null
                       ,"autoBind" :false
                       , msg :"<spring:message code='global.lbl.create' var='globalLblCreate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblCreate}' />"
                       , btnMsg01 :"<spring:message code='sal.btn.contractCreate' />"
                       , btnMsg02 :"<spring:message code='global.btn.cancel' />"
                       ,"callbackFunc" :function(data){
                           if (data.msg == "01"){
                               // 직책별 할인금액 검사 로직 추가
                               dlrPromotionAmtChk('save');
                            }else{
                                return false;
                            }
                        }
                   }
               }
           });

        }
    });

    /*
    $("#btnCancel").kendoButton({
        enable:false,
        click:function(e){

            // 계약생성 단계일시만 가능
            popupWindow = dms.window.popup({
                windowId :"messagePopup"
                ,title :false
                ,width :330
                ,height:90
                ,modal:true
                ,content :{
                    url :"<c:url value='/sal/cnt/contract/contractMessagePopup.do' />"
                    ,data :{
                        "type" :null
                        ,"autoBind" :false
                                 // xxxx(계약번호) 계약을 취소 하시겠습니까??
                        , msg :"("+$("#contractNo").val() +")"+ "<spring:message code='sal.info.contractClose' />"
                        , btnMsg01 :"<spring:message code='global.lbl.del' />"
                        , btnMsg02 :"<spring:message code='global.btn.cancel' />"
                        ,"callbackFunc" :function(data){
                            if (data.msg == "01"){
                                if($("#contractStatCd").val() == "" || $("#contractStatCd").val() == "10" ){
                                    remove();
                                }else{
                                    cancel();
                                }
                             }else{
                                 return false;
                             }
                         }
                    }
                }
            });
        }
    });
    */

    $("#btnContPrint").kendoButton({//계약서출력
        enable:false,
        click:function(e){
            var fileNm = 'selectSaleContractRpt';
            var num = dms.ajax.getJson({
                url :"<c:url value='/sal/cnt/contractMnt/selectDlrAmtTxt.do' />"
                ,async :false
            });
            fileNm += dms.string.isEmpty(num)?"01":num;

            var iReportParam = "&sDlrCd="+dlrCd+"&sContractNo="+$("#contractNo").val();
            var iReportUrl = "<c:url value='/ReportServer?reportlet=sale/"+fileNm+".cpt' />"+iReportParam;
            var newWindow=open(iReportUrl, "<spring:message code='sal.btn.contPrint' />", 'top=0,left=0,width=925,height=800,toolbar=no,menubar=no,location=no,status=yes,directories=yes,resizable=yes,scrolling=yes,scrollbars=1');
        }
    });

    $("#btnPayPrint").kendoButton({//결산서출력
        enable:false,
        click:function(e){
            var iReportParam =  "&sDlrCd="+dlrCd+"&sContractNo="+$("#contractNo").val()+"&sJobTp=C";
            var iReportUrl = "<c:url value='/ReportServer?reportlet=sale/selectSalePayInfoTotRpt.cpt' />"+iReportParam;
            var newWindow=open(iReportUrl, "<spring:message code='sal.btn.payPrint' />", 'top=0,left=0,width=870,height=800,toolbar=no,menubar=no,location=no,status=yes,directories=yes,resizable=yes,scrolling=yes,scrollbars=1');
        }
    });

    $("#btnViewPrint").kendoButton({//출고증출력
        enable:false,
        click:function(e){
            var vReportParam = "&sDlrCd="+dlrCd+"&sContractNo="+$("#contractNo").val();
            var vReportUrl = "<c:url value='/ReportServer?reportlet=sale/selectSaleGiDocPrint.cpt' />"+vReportParam;
            var newWindow=open(vReportUrl, "<spring:message code='sal.btn.giDoc' />",'top=0,left=0,width=925,height=600,toolbar=1,location=1,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');
        }
    });

    $("#btnSaleAccountPrint").kendoButton({ //완성차판매정산서
        enable:false,
        click:function(e){
            if(dms.string.isNotEmpty($("#contractStatCd").val())
              && $("#contractStatCd").val() == "50"
            ){
                var iReportParam = "&sDlrCd="+dlrCd+"&sContractNo="+$("#contractNo").val();
                var iReportUrl = "<c:url value='/ReportServer?reportlet=sale/selectContractSalesAccountPrint.cpt' />"+iReportParam;
                var newWindow=open(iReportUrl, "<spring:message code='sal.btn.saleAccountPrint' />", 'top=0,left=0,width=800,height=800,toolbar=no,menubar=no,location=no,status=yes,directories=yes,resizable=yes,scrolling=yes,scrollbars=1');
            }
        }
    });

    $("#btnSanbaoPrint").kendoButton({//삼포증출력
        enable:false,
        click:function(e){
            var iReportParam = "";
            if($("#vinNo").val() != ""){
                iReportParam = "&sVinNo="+$("#vinNo").val();
            }
            var iReportUrl = "<c:url value='/ReportServer?reportlet=ser/selectSanbaoDocRpt.cpt' />"+iReportParam;
            var newWindow=open(iReportUrl, "<spring:message code='ser.btn.sanbaoPrint' />", 'top=0,left=0,width=800,height=800,toolbar=no,menubar=no,location=no,status=yes,directories=yes,resizable=yes,scrolling=yes,scrollbars=1');
        }
    });

    /* 보험서비스 관리*/
    $("#btnIncAllChange").kendoButton({   // 보험서비스 - 일괄변경
        click:function(e){
            var grid = $("#incGrid").data("kendoExtGrid");
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

                //dataSourceRow.set("valRecAmt", dms.string.strNvl(dItem.valRecAmt));
                //dataSourceRow.set("incExpcAmt", dms.string.strNvl(dItem.incExpcAmt));
                //dataSourceRow.set("realIncAmt", dms.string.strNvl(dItem.realIncAmt));
                dataSourceRow.set("incPrid", dms.string.strNvl(dItem.incPrid));
                dataSourceRow.set("incStartDt", dms.string.strNvl(dItem.incStartDt));
                dataSourceRow.set("incEndDt", dms.string.strNvl(dItem.incEndDt));
                dataSourceRow.set("remark", dms.string.strNvl(dItem.remark));
                dataSourceRow.set("dirty", true);
            });
        }
    });

    $("#btnIncAdd").kendoButton({   // 보험서비스 - 행추가
        click:function(e){
            /*
            var sDt = kendo.parseDate(toDay);
                sDt.setMonth(sDt.getMonth() + 12);
                sDt.setDate(sDt.getDate() -1);
            var eDt = kendo.toString(sDt, "<dms:configValue code='dateFormat' />");

            $('#incGrid').data('kendoExtGrid').dataSource.insert(0, {
                 incTp:""
                ,incPrid:12
                ,incStartDt:new Date(toDay)
                ,incEndDt:new Date(eDt)
            });
            */

            parent.bf_pSearchIncItem();
        }
    });

    $("#btnIncDel").kendoButton({      // 보험서비스 - 행삭제
        click:function(e){
            var grid = $("#incGrid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    $("#btnIncCancel").kendoButton({    // 보험서비스 - 취소
        click :function(e) {
            $('#incGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    /* 용품 */
    $("#btnGoodsAdd").kendoButton({   // 용품 - 행추가
        click:function(e){
            $('#goodsGrid').data('kendoExtGrid').dataSource.insert(0, {
                "dlrCd":dlrCd
                ,"contractNo":$("#contractNo").val()
                ,"statCd":"10"
                ,"goodsCd":""
                ,"goodsNm":""
                ,"goodsCnt":1
                ,"goodsUnitCd":""
                ,"goodsPrc":0
                ,"dcRate":0
                ,"dcAmt":0
                ,"goodsAmt":0
                ,"realGoodsAmt":0
                ,"eqipCostAmt":0
                ,"totAmt":0
                ,"expcEqipDt":""
                ,"eqipPrsnId":""
                ,"expcGiEndDt":""
                ,"realDlDt":""
                ,"pkgItemCd":""
                ,"grStrgeCd":""
                ,"giStrgeCd":""
                ,"eqipEndDt":""
            });
        }
    });

    $("#btnGoodsDel").kendoButton({      // 용품 - 행삭제
        click:function(e){
            var grid = $("#goodsGrid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //용품을(를) 선택하여 주십시오
                dms.notification.warning("<spring:message code='sal.lbl.goods' var='goodsMsg' /><spring:message code='global.info.validation.select' arguments='${goodsMsg}' />");
                return;
            }

            //처리상태가 출고(20), 반납(40)인 경우 삭제 할수 없다.
            var flag = true;
            rows.each(function(index, row) {
                var dataItem = grid.dataItem(row);
                if(dataItem.statCd == "20" || dataItem.statCd == "40"){
                    flag = false;
                    return false;
                }
            });

            if(!flag){
                //처리상태가 출고/반납인 목록은 삭제 할 수 없습니다.
                dms.notification.warning("<spring:message code='sal.info.delete.impossibleState.accessoryItemSales' />");
                return;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });

            var tRow = grid.tbody.find("tr");
            if(tRow == null || tRow.length <= 0){
                $("#goodsTotAmt").data("kendoExtNumericTextBox").value(0.00);
                $("#goodsAmt").data("kendoExtNumericTextBox").value(0.00);
                bf_sumCarAmt();
            }
        }
    });

    $("#btnGoodsCancel").kendoButton({    // 용품 - 취소
        click :function(e) {
            $('#goodsGrid').data('kendoExtGrid').cancelChanges();

            var tRow = $('#goodsGrid').data('kendoExtGrid').tbody.find("tr");
            if(tRow == null || tRow.length <= 0){
                $("#goodsTotAmt").data("kendoExtNumericTextBox").value(0.00);
                $("#goodsAmt").data("kendoExtNumericTextBox").value(0.00);
                bf_sumCarAmt();
            }
        }
    });

    /* 대행업무 */
    $("#btnAapsAdd").kendoButton({   // 대행업무 - 행추가
        click:function(e){
            parent.bf_pSearchAapItem();
        }
    });

    $("#btnAapsDel").kendoButton({      // 대행업무 - 행삭제
        click:function(e){
            var grid = $("#aapGrid").data("kendoExtGrid");
            var rows = grid.tbody.find("tr");

            var removeList = [];
            rows.each(function(index, row) {
                if( $(this).find(".grid-checkbox-item").prop("checked") ){ removeList.push(row); }
            });

            if (removeList.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            $.each(removeList, function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    $("#btnAapsCancel").kendoButton({    // 대행업무 - 취소
        click :function(e) {
            $('#aapGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    $("#custTp").val("01");       // 계약자 고객유형
    $("#sDlrCd").val(dlrCd);        // 딜러코드
    $("#sDlrNm").val(dlrNm);        // 딜러명
    $("#personalTxt_01").val(" ");     // 개인고객
    //$("#personalTxt_02").val(" ");     // 법인

    // 탭
    var selectTabId = "goodsTab";       // 초기값 :용품
    $("#tabstrip").kendoExtTabStrip({
        animation:false
       ,select:function(e) {
            selectTabId = e.item.id;
        }
    });

    // 계약일
    $("#contractDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
       ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:toDay
    });

    // 채널유형
    $("#dstbChnCd").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(dstbChnList)
       ,optionLabel:" "
       ,change:function(e){
           var item = this.dataItem(this.select()).cmmCd;
           console.log(item);
           // 2급 딜러의 Data를 불러옴.
       }
    });

    // 2급딜러
    $("#lv2DlrOrgCd").kendoExtDropDownList({
        dataTextField  :"cmmCdNms"
       ,dataValueField :"cmmCd"
       ,dataSource:lvTwoDlrList
       ,optionLabel:" "
       ,change:function(e){
           var item = this.dataItem(this.select()).cmmCd;
           console.log(this.select().length);

           if(dms.string.isNotEmpty(item)){
               $("#lv2DlrYn").val("Y");
           }else{
               $("#lv2DlrYn").val("N");
           }
           // 2급 딜러의 Data를 불러옴.
       }
    });

    // 인도요청일
    $("#dlReqDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    // 계약유형
    $("#contractTp").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(contractTpList)
       ,index :0
    });

    // 지불방식
    $("#payTp").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(amtPayTpList)
       ,optionLabel:" "
    });

    // 판매담당자
    $("#saleEmpNo").kendoExtDropDownList({
        dataTextField :"saleEmpNm"
       ,dataValueField :"saleEmpCd"
       ,dataSource:selectSaleEmpDSList
       ,optionLabel:" "
       ,change:function(){
           // 선택할 수 있는 권한이 들어올시, 채널유형을 불러오게만 하면 됨. DAO.selectSaleEmpChannelTupeSearch
       }
    });

    if(saleEmpYn == "Y"){
        $("#saleEmpNo").data("kendoExtDropDownList").value(userId);
    }
    $("#saleEmpNo").data("kendoExtDropDownList").enable(false);
    $("#dstbChnCd").data("kendoExtDropDownList").value(dms.string.strNvl(chnInfo.dstbChnCd));
    $("#dstbChnCd").data("kendoExtDropDownList").enable(false);

    // 판매채널:대고객, 전시장일 경우
    if(chnInfo.dstbChnCd == "01" || chnInfo.dstbChnCd == "02"){
        $("#lv2DlrOrgCd").data("kendoExtDropDownList").value("");
        $("#lv2DlrOrgCd").data("kendoExtDropDownList").enable(false);
    }else if(chnInfo.dstbChnCd == "03"){        // 위성 WX
        $("#lv2DlrOrgCd").data("kendoExtDropDownList").setDataSource(lvTwoDlrWXList);
    }else if(chnInfo.dstbChnCd == "04"){        // 2급 EW
        $("#lv2DlrOrgCd").data("kendoExtDropDownList").setDataSource(lvTwoDlrEWList);
    }else{
        $("#lv2DlrOrgCd").data("kendoExtDropDownList").setDataSource([]);
        $("#lv2DlrOrgCd").data("kendoExtDropDownList").enable(false);
    }

    // 개인 :신분증유형
    $("#ssnCrnTp_01").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(ssnCrnTpPList)
       ,optionLabel:" "
       ,index:0
       ,change:function(){
           var sel = this.dataItem(this.select()).cmmCd;
           if (sel == "01") {
               $("#ssnCrnNo_01").attr('maxlength','18');
           }else if (sel  == "02"
                   || sel  == "03"
                   || sel  == "04"
                   || sel  == "05"
                   || sel  == "06"
                    ) {
               $("#ssnCrnNo_01").attr('maxlength','20');
           }else{
               $("#ssnCrnNo_01").attr('maxlength','20');
           }
       }
    });

    // 법인 :법인유형
    $("#ssnCrnTp_02").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(ssnCrnTpCList)
       ,optionLabel:" "
       ,index:0
       ,change:function(){
           var sel = this.dataItem(this.select()).cmmCd;
           if (sel == "08") {
               $("#ssnCrnNo_02").attr('maxlength','10');
           }else if(sel == "10"){
               $("#ssnCrnNo_02").attr('maxlength','18');
           }else{
               $("#ssnCrnNo_02").attr('maxlength','25');
           }
       }
    });

    /**
    * 주소유형
    */
    $("#addrTp_01").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(addrTpList)
       ,value:"02"
    });

   /**
    * 주소유형
    */
    $("#addrTp_02").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(addrTpList)
       ,value:"02"
    });

    // 차량
    $("#carlineCd").kendoExtDropDownList({
        dataTextField :"carlineNm"
       ,dataValueField :"carlineCd"
       ,dataSource :carLineCdList
       ,filter :"contains"
       ,change :onSelectCarlineCd
       ,optionLabel:" "
    });

    // 차관
    $("#fscCd").kendoExtDropDownList({
        dataTextField :"fscNm"
       ,dataValueField :"fscCd"
       ,filter :"contains"
       ,change :onSelectFscCd
       ,optionLabel:" "
    });
    $("#fscCd").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#ocnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,filter :"contains"
        ,optionLabel:" "
        ,change :onSelectOcnCd
    });
    $("#ocnCd").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#extColorCd").kendoExtDropDownList({
         dataTextField: "extColorNm"
        ,dataValueField:"extColorCd"
        ,filter :"contains"
        ,change :onSelectExtColorCd
        ,optionLabel:" "
    });
    $("#extColorCd").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#intColorCd").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,filter :"contains"
        ,optionLabel:" "
        ,change :function(e){
            $("#vinNo").val('');    // vin no
            $("#sVinNo").val('');
        }
    });
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    // 공장지도가
    $("#retlAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 실제차량금액( key in 변경 )
    $("#realCarAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });
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

    // 프로모션 : 할인금액
    /*
    $("#promotionAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });
    */

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


   /************************
    * 탭-용품
   ************************/
   // 용품 합계
   $("#goodsTotAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      ,value:0.00
      ,spinners:false
   });

   /************************
    * 탭-보험
   ************************/
    // 보험예상총금액
   $("#incExpcAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      //,min:0.00
      ,value:0.00
      ,spinners:false
   });

   // 실제보험총금액
   $("#realIncAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      ,value:0.00
      ,spinners:false
   });

   // 차액
   $("#incDifferenceAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      ,value:0.00
      ,spinners:false
   });

   // 보험수수료
   $("#incFeeAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      ,value:0.00
      ,spinners:false
   });

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
   $("#transIncTaxAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      ,value:0.00
      ,spinners:false
   });

   // 보험회사
   $("#incCmpCd").kendoExtDropDownList({
       dataTextField  :"cmmCdNm"
      ,dataValueField :"cmmCd"
      ,dataSource:dms.data.cmmCdFilter(incCmpCdList)
      ,optionLabel:" "
   });

   // 보험처리 :대행
   $("#incAapTp01").click(function(){
       if($(this).prop("disabled")){ return; }
       if( $("#incAapTp").val() === "A"){ return; }

       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("span[name='tsIncSpan']").addClass("bu_required");
       $("#incExpcAmt").data("kendoExtNumericTextBox").enable(true);
       $("#incImplyYn").attr("disabled", false);
       $("#incImplyYn").prop('checked', true);
       $("#incPconCustNm").attr("disabled", false);
       $("#incPconCustTelNo").attr("disabled", false);
       $("#incCustNm").attr("disabled", false);
       $("#incCustTelNo").attr("disabled", false);
       $("#incCmpCd").data("kendoExtDropDownList").enable(true);
       $("#incProfitNm").attr("disabled", false);
       $("#incFeeAmt").data("kendoExtNumericTextBox").enable(true);        // 보험수수료
       $("#frcIncAmt").data("kendoExtNumericTextBox").enable(true);
       $("#busIncAmt").data("kendoExtNumericTextBox").enable(true);
       $("#transIncTaxAmt").data("kendoExtNumericTextBox").enable(true);
       $("#incRemark").attr("disabled", false);

       if( !isObjectNullCheck(incModel) ){
           $("#incExpcAmt").data("kendoExtNumericTextBox").value(incModel.incExpcAmt);
           $("#realIncAmt").data("kendoExtNumericTextBox").value(incModel.realIncAmt);
           $("#incDifferenceAmt").data("kendoExtNumericTextBox").value(incModel.incDifferenceAmt);
           $("#incImplyYn").prop('checked', incModel.incImplyYn);
           $("#incPconCustNm").val(incModel.incPconCustNm);
           $("#incPconCustTelNo").val(incModel.incPconCustTelNo);
           $("#incCustNm").val(incModel.incCustNm);
           $("#incCustTelNo").val(incModel.incCustTelNo);
           $("#incCmpCd").data("kendoExtDropDownList").value(incModel.incCmpCd);
           $("#incProfitNm").val(incModel.incProfitNm);
           $("#incFeeAmt").data("kendoExtNumericTextBox").value(incModel.incFeeAmt);
           $("#finImplyYn").prop('checked', incModel.finImplyYn);
           $("#frcIncAmt").data("kendoExtNumericTextBox").value(incModel.frcIncAmt);
           $("#busIncAmt").data("kendoExtNumericTextBox").value(incModel.busIncAmt);
           $("#transIncTaxAmt").data("kendoExtNumericTextBox").value(incModel.transIncTaxAmt);
           $("#incRemark").val(incModel.incRemark);
           bf_incImplyYn();
       }

       // 보험 그리드
       if( !isObjectNullCheck(incGridModel) ){
           $("#incGrid").data('kendoExtGrid').dataSource.data([]);

           var incGrid = $("#incGrid").data('kendoExtGrid');
           $.each(incGridModel, function(idx, row){
               incGrid.dataSource.insert(idx, row);
           });
       }

       $("#btnIncAllChange").data("kendoButton").enable(true);
       $("#btnIncAdd").data("kendoButton").enable(true);
       $("#btnIncDel").data("kendoButton").enable(true);
       $("#btnIncCancel").data("kendoButton").enable(true);
       $("#incAapTp").val("A");      // SAL126 대행:A , 본인:M
   });
   //보험처리 :본인
   $("#incAapTp02").click(function(){
       if($(this).prop("disabled")){ return; }
       if( $("#incAapTp").val() === "M"){ return; }

       incModel = {
           "incExpcAmt":$("#incExpcAmt").data("kendoExtNumericTextBox").value()
           ,"realIncAmt":$("#realIncAmt").data("kendoExtNumericTextBox").value()
           ,"incDifferenceAmt":$("#incDifferenceAmt").data("kendoExtNumericTextBox").value()
           ,"incImplyYn":$("#incImplyYn").prop('checked')
           ,"incPconCustNm":$("#incPconCustNm").val()
           ,"incPconCustTelNo":$("#incPconCustTelNo").val()
           ,"incCustNm":$("#incCustNm").val()
           ,"incCustTelNo":$("#incCustTelNo").val()
           ,"incCmpCd":$("#incCmpCd").data("kendoExtDropDownList").value()
           ,"incProfitNm":$("#incProfitNm").val()
           ,"incFeeAmt":$("#incFeeAmt").data("kendoExtNumericTextBox").value()
           ,"finImplyYn":$("#finImplyYn").prop('checked')
           ,"frcIncAmt":$("#frcIncAmt").data("kendoExtNumericTextBox").value()
           ,"busIncAmt":$("#busIncAmt").data("kendoExtNumericTextBox").value()
           ,"transIncTaxAmt":$("#transIncTaxAmt").data("kendoExtNumericTextBox").value()
           ,"incRemark":$("#incRemark").val()
       };

       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("span[name='tsIncSpan']").removeClass("bu_required");
       $("#incExpcAmt").data("kendoExtNumericTextBox").value(0);
       $("#realIncAmt").data("kendoExtNumericTextBox").value(0);
       $("#incDifferenceAmt").data("kendoExtNumericTextBox").value(0);
       $("#incImplyYn").prop('checked', false);
       $("#incPconCustNm").val('');
       $("#incPconCustTelNo").val('');
       $("#incCustNm").val('');
       $("#incCustTelNo").val('');
       $("#incCmpCd").data("kendoExtDropDownList").value('');
       $("#incProfitNm").val('');
       $("#incFeeAmt").data("kendoExtNumericTextBox").value(0);
       $("#finImplyYn").prop('checked', false);
       $("#frcIncAmt").data("kendoExtNumericTextBox").value(0.00);
       $("#busIncAmt").data("kendoExtNumericTextBox").value(0.00);
       $("#transIncTaxAmt").data("kendoExtNumericTextBox").value(0.00);
       $("#incRemark").val('');
       bf_onIncAmt();

       $("#incExpcAmt").data("kendoExtNumericTextBox").enable(false);
       $("#incImplyYn").attr("disabled", true);
       $("#incPconCustNm").attr("disabled", true);
       $("#incPconCustTelNo").attr("disabled", true);
       $("#incCustNm").attr("disabled", true);
       $("#incCustTelNo").attr("disabled", true);
       $("#incCmpCd").data("kendoExtDropDownList").enable(false);
       $("#incProfitNm").attr("disabled", true);
       $("#incFeeAmt").data("kendoExtNumericTextBox").enable(false);        // 보험수수료
       $("#frcIncAmt").data("kendoExtNumericTextBox").enable(false);
       $("#busIncAmt").data("kendoExtNumericTextBox").enable(false);
       $("#transIncTaxAmt").data("kendoExtNumericTextBox").enable(false);
       $("#incRemark").attr("disabled", true);

       $("#btnIncAllChange").data("kendoButton").enable(false);
       $("#btnIncAdd").data("kendoButton").enable(false);
       $("#btnIncDel").data("kendoButton").enable(false);
       $("#btnIncCancel").data("kendoButton").enable(false);

       if($("#incGrid").data('kendoExtGrid') != null){
           incGridModel = [];
           if($("#incGrid").data('kendoExtGrid').dataSource.data().length > 0 ){
               var incGridObj = $("#incGrid").data('kendoExtGrid').dataSource.data();
               $.each(incGridObj, function(idx, row){
                   incGridModel.push(row);
               });
               incGridObj = {};
           }
           $("#incGrid").data('kendoExtGrid').dataSource.data([]); // 보험 Grid
       }

       $("#incAapTp").val("M");       // SAL126 대행:A , 본인:M
   });

   /************************
    * 탭-금융사
   ************************/
   // 금융처리 : 대행
    $("#fincTp01").click(function(){
        if($(this).prop("disabled")){ return; }
        if( $("#fincReqYn").val() === "Y"){ return; }

        $("#fincCmpCd").data("kendoExtDropDownList").value(fincModel.fincCmpCd);
        $("#fincRpayPrid").data("kendoExtNumericTextBox").value(fincModel.fincRpayPrid);
        $("#fincLoadRate").data("kendoExtNumericTextBox").value(fincModel.fincLoadRate);
        $("#fincFeeAmt").data("kendoExtNumericTextBox").value(fincModel.fincFeeAmt);
        $("#fincItemCd").data("kendoExtDropDownList").value(fincModel.fincItemCd);
        $("#fincBurdAmt").data("kendoExtNumericTextBox").value(fincModel.fincBurdAmt);
        $("#instIntrRate").data("kendoExtNumericTextBox").value(fincModel.instIntrRate);
        $("#grteIncAmt").data("kendoExtNumericTextBox").value(fincModel.grteIncAmt);
        $("#fincReqDt").data("kendoExtMaskedDatePicker").value(fincModel.fincReqDt);
        $("#fincEndDt").data("kendoExtMaskedDatePicker").value(fincModel.fincEndDt);
        $("#fincReqAmt").data("kendoExtNumericTextBox").value(fincModel.fincReqAmt);

        $(this).siblings("li").removeClass("on");
        $(this).addClass("on");
        //$(".tabFincUl").removeClass("disabled");
        $("span[name='tsFincSpan']").addClass("bu_required");
        $("#fincCmpCd").data("kendoExtDropDownList").enable(true);
        $("#fincRpayPrid").data("kendoExtNumericTextBox").enable(true);
        $("#fincLoadRate").data("kendoExtNumericTextBox").enable(true);
        $("#fincFeeAmt").data("kendoExtNumericTextBox").enable(true);
        $("#fincItemCd").data("kendoExtDropDownList").enable(true);
        $("#fincBurdAmt").data("kendoExtNumericTextBox").enable(true);
        $("#instIntrRate").data("kendoExtNumericTextBox").enable(true);
        $("#grteIncAmt").data("kendoExtNumericTextBox").enable(true);
        $("#fincReqDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#fincEndDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#fincReqAmt").data("kendoExtNumericTextBox").enable(true);

        $("#fincReqYn").val("Y");
        bf_onFincAmt();
    });

    // 금융처리 : 본인
    $("#fincTp02").click(function(){
       if($(this).prop("disabled")){ return; }
       if( $("#fincReqYn").val() === "N"){ return; }

       fincModel = {
           "fincCmpCd":$("#fincCmpCd").data("kendoExtDropDownList").value()
           ,"fincRpayPrid":$("#fincRpayPrid").data("kendoExtNumericTextBox").value()
           ,"fincLoadRate":$("#fincLoadRate").data("kendoExtNumericTextBox").value()
           ,"fincFeeAmt":$("#fincFeeAmt").data("kendoExtNumericTextBox").value()
           ,"fincItemCd":$("#fincItemCd").data("kendoExtDropDownList").value()
           ,"fincBurdAmt":$("#fincBurdAmt").data("kendoExtNumericTextBox").value()
           ,"instIntrRate":$("#instIntrRate").data("kendoExtNumericTextBox").value()
           ,"grteIncAmt":$("#grteIncAmt").data("kendoExtNumericTextBox").value()
           ,"fincReqDt":$("#fincReqDt").data("kendoExtMaskedDatePicker").value()
           ,"fincEndDt":$("#fincEndDt").data("kendoExtMaskedDatePicker").value()
           ,"fincReqAmt":$("#fincReqAmt").data("kendoExtNumericTextBox").value()
       };

       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       //$(".tabFincUl").addClass("disabled");
       $("span[name='tsFincSpan']").removeClass("bu_required");

       $("#fincCmpCd").data("kendoExtDropDownList").enable(false);
       $("#fincRpayPrid").data("kendoExtNumericTextBox").enable(false);
       $("#fincLoadRate").data("kendoExtNumericTextBox").enable(false);
       $("#fincFeeAmt").data("kendoExtNumericTextBox").enable(false);
       $("#fincItemCd").data("kendoExtDropDownList").enable(false);
       $("#fincBurdAmt").data("kendoExtNumericTextBox").enable(false);
       $("#instIntrRate").data("kendoExtNumericTextBox").enable(false);
       $("#grteIncAmt").data("kendoExtNumericTextBox").enable(false);
       $("#fincReqDt").data("kendoExtMaskedDatePicker").enable(false);
       $("#fincEndDt").data("kendoExtMaskedDatePicker").enable(false);
       $("#fincReqAmt").data("kendoExtNumericTextBox").enable(false);

       $("#fincCmpCd").data("kendoExtDropDownList").value("");
       $("#fincRpayPrid").data("kendoExtNumericTextBox").value(0);
       $("#fincLoadRate").data("kendoExtNumericTextBox").value(0);
       $("#fincFeeAmt").data("kendoExtNumericTextBox").value(0);
       $("#fincItemCd").data("kendoExtDropDownList").value("");
       $("#fincBurdAmt").data("kendoExtNumericTextBox").value(0);
       $("#instIntrRate").data("kendoExtNumericTextBox").value(0);
       $("#grteIncAmt").data("kendoExtNumericTextBox").value(0);
       $("#fincReqDt").data("kendoExtMaskedDatePicker").value("");
       $("#fincEndDt").data("kendoExtMaskedDatePicker").value("");
       $("#fincReqAmt").data("kendoExtNumericTextBox").value(0);

       $("#fincReqYn").val("N");
       bf_onFincAmt();
    });

   // 금융사
   $("#fincCmpCd").kendoExtDropDownList({
       dataTextField  :"cmmCdNm"
      ,dataValueField :"cmmCd"
      ,dataSource:dms.data.cmmCdFilter(fincCmpCdList)
      ,optionLabel:" "
   });

   // 상환기간
   $("#fincRpayPrid").kendoExtNumericTextBox({
       format:"n0"
      ,decimals :0
      //,min:0
      ,max:999
      ,spinners:false
      ,change: function() {
          var nFincRpayPrid = Number(this.value());

          if( dms.string.isEmpty($("#fincReqDt").data("kendoExtMaskedDatePicker").value()) ){
              $("#fincReqDt").data("kendoExtMaskedDatePicker").value(toDay);
          }
          var fincReqDt = kendo.parseDate(kendo.toString($("#fincReqDt").data("kendoExtMaskedDatePicker").value(), "yyyy-MM-dd"));
          fincReqDt.setMonth(fincReqDt.getMonth() + nFincRpayPrid );
          fincReqDt.setDate(fincReqDt.getDate() - 1);
          var fincEndDt = kendo.toString(fincReqDt, "yyyy-MM-dd");
          $("#fincEndDt").data("kendoExtMaskedDatePicker").value(fincEndDt);
      }
   });

   // 대출비율(%)
   $("#fincLoadRate").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      //,min:0
      ,max:999
      ,spinners:false
      ,change: function(){
          var fincLoadRate = Number(this.value());
          var realAmt = Number($("#realAmt").data("kendoExtNumericTextBox").value());

          // 금융:신청금액 = 총금액 - 고객부담금
          if(fincLoadRate > 0  && realAmt > 0){
              $("#fincReqAmt").data("kendoExtNumericTextBox").value( realAmt * naNcheck(fincLoadRate/100) );
              $("#fincBurdAmt").data("kendoExtNumericTextBox").value(realAmt - Number($("#fincReqAmt").data("kendoExtNumericTextBox").value()) );
          }else{
              $("#fincReqAmt").data("kendoExtNumericTextBox").value( 0.00);
          }
      }
   });

   //대출 수수료
   $("#fincFeeAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      //,min:0.00
      ,value:0.00
      ,spinners:false
      ,change:bf_onFincAmt
   });

   // 금융상품
   $("#fincItemCd").kendoExtDropDownList({
       dataTextField  :"cmmCdNm"
      ,dataValueField :"cmmCd"
      ,dataSource:[]
      ,optionLabel:" "
      ,change :function(e){
          var dataItem = this.dataItem(e.item);
          if(dms.string.strNvl(dataItem.cmmCd) != ""){
              //$("#fincRpayPrid").data("kendoExtNumericTextBox").value( Number(dataItem.fincItemPrid) ); //상환기간

              if( dms.string.isEmpty($("#fincReqDt").data("kendoExtMaskedDatePicker").value()) ){
                  $("#fincReqDt").data("kendoExtMaskedDatePicker").value(toDay);
              }
              var fincReqDt = kendo.parseDate(kendo.toString($("#fincReqDt").data("kendoExtMaskedDatePicker").value(), "yyyy-MM-dd"));
              //fincReqDt.setMonth(fincReqDt.getMonth() + Number(dataItem.fincItemPrid));
              fincReqDt.setMonth(fincReqDt.getMonth() + 12);        // 기본셋팅
              fincReqDt.setDate(fincReqDt.getDate() - 1);
              var fincEndDt = kendo.toString(fincReqDt, "yyyy-MM-dd");
              $("#fincEndDt").data("kendoExtMaskedDatePicker").value(fincEndDt);
          }
          //fn_FincRate();

      }
   });

   // 금융사 change 이벤트
   $("#fincCmpCd").on("change", function (){
       if( !dms.string.isEmpty($(this).data("kendoExtDropDownList").value()) ){
           if($(this).data("kendoExtDropDownList").value() === "BHAF"){
               $("#fincItemCd").data("kendoExtDropDownList").setDataSource(fincBHAFItemObj[$("#carlineCd").data("kendoExtDropDownList").value()]);
           }else{
               $("#fincItemCd").data("kendoExtDropDownList").setDataSource(fincItemObj[$(this).data("kendoExtDropDownList").value()]);
           }
       }else{
           $("#fincItemCd").data("kendoExtDropDownList").setDataSource([]);
       }
       //fn_FincRate();
   });

   // 금융정보 초기화
   fn_FincRate = function(){
       $("#fincLoadRate").data("kendoExtNumericTextBox").value(0);
       $("#fincFeeAmt").data("kendoExtNumericTextBox").value(0);
       $("#fincBurdAmt").data("kendoExtNumericTextBox").value(0);
       $("#instIntrRate").data("kendoExtNumericTextBox").value(0);
       $("#grteIncAmt").data("kendoExtNumericTextBox").value(0);
       $("#fincReqAmt").data("kendoExtNumericTextBox").value(0);
   }

   // 신청금액
   $("#fincReqAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      //,min:0.00
      ,value:0.00
      ,spinners:false
      ,change : function(){
          var fincReqAmt = Number(this.value());
          var realAmt = Number($("#realAmt").data("kendoExtNumericTextBox").value());
          if(fincReqAmt > 0  && realAmt > 0){
              $("#fincLoadRate").data("kendoExtNumericTextBox").value( (fincReqAmt / realAmt) * 100 );
          }else{
              $("#fincLoadRate").data("kendoExtNumericTextBox").value(0);
          }

          $("#fincBurdAmt").data("kendoExtNumericTextBox").value(realAmt - fincReqAmt);
      }
   });

   // 고객부담금
   $("#fincBurdAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      ,value:0.00
      ,spinners:false
      ,change : function(){
          var fincBurdAmt = Number(this.value());
          var realAmt = Number($("#realAmt").data("kendoExtNumericTextBox").value());
          $("#fincReqAmt").data("kendoExtNumericTextBox").value(realAmt - fincBurdAmt);

          var fincReqAmt = realAmt - fincBurdAmt;
          $("#fincLoadRate").data("kendoExtNumericTextBox").value( naNcheck(fincReqAmt / realAmt) * 100 );
      }
   });

   //할부이자율
   $("#instIntrRate").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,max:999
       ,value:0.00
       ,spinners:false
    });


   //보증수수료
   $("#grteIncAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

   // 신청일자
   $("#fincReqDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
       ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:toDay
   });

   // 만기일자
   $("#fincEndDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
       ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });


   /************************
    * 탭-중고차
   ************************/
   // 중고차 :치환여부
   $("#uatcCarPurcYn").kendoExtDropDownList({
       dataTextField  :"cmmCdNm"
      ,dataValueField :"cmmCd"
      ,dataSource:dms.data.cmmCdFilter(ynList)
      ,select :function(e){
          bf_uatcCarPurcYnChk(this.dataItem(e.item).cmmCd);
      }
      ,index :0
   });

   //평가금액
   $("#usrSbstAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      //,min:0.00
      ,value:0.00
      ,spinners:false
   });

   // 정부보조금
   $("#subsidyAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      //,min:0.00
      ,value:0.00
      ,spinners:false
   });

   $('input[name="tabSbusTp"]').click(function(){
       $("#sbusTp").val($('input[name="tabSbusTp"]:checked').val());
       bf_addUsrSbstAmt();
   });

   $("#sUsrVinNo").attr("disabled", true);
   $("#usrSbstAmt").data("kendoExtNumericTextBox").enable(false);
   $("#purcNo").attr("disabled", true);
   $("#subsidyAmt").data("kendoExtNumericTextBox").enable(false);
   $("#sbusTp").val("1");
   $('input[name="tabSbusTp"]').prop("disabled", true);

   /************************
    * 탭-대행
   ************************/

   // 번호판 등록처리 :대행
   $("#tabRegTp01").click(function(){
       if($(this).prop("disabled")){ return; }
       if( $("#regTp").val() === "A"){ return; }

       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#regTp").val("A");      // SAL126 대행:A , 본인:M
       var aapGrid = $("#aapGrid").data('kendoExtGrid');
       aapGrid.dataSource.data([]);
       if(isObjectNullCheck(regGridModel)){
           initAapGrid();
       }else{
           $.each(regGridModel, function(idx, row){
               aapGrid.dataSource.insert(idx, row);
           });
       }

       $("#btnAapsAdd").data("kendoButton").enable(true);
       $("#btnAapsDel").data("kendoButton").enable(true);
       $("#btnAapsCancel").data("kendoButton").enable(true);
   });
   //번호판 등록처리 :본인
   $("#tabRegTp02").click(function(){
       if($(this).prop("disabled")){ return; }
       if( $("#regTp").val() === "M"){ return; }

       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#regTp").val("M");       // SAL126 대행:A , 본인:M

       if($("#aapGrid").data('kendoExtGrid') != null){
           regGridModel = [];
           if($("#aapGrid").data('kendoExtGrid').dataSource.data().length > 0 ){
               var regGridObj = $("#aapGrid").data('kendoExtGrid').dataSource.data();
               $.each(regGridObj, function(idx, row){
                   regGridModel.push(row);
               });
               regGridObj = {};
           }
           $("#aapGrid").data('kendoExtGrid').dataSource.data([]);
       }

       $("#btnAapsAdd").data("kendoButton").enable(false);
       $("#btnAapsDel").data("kendoButton").enable(false);
       $("#btnAapsCancel").data("kendoButton").enable(false);
   });

   /************************
    * 탭-포인트
   ************************/
   // BM 회원등급
   $("#mLevel").kendoExtDropDownList({
       dataTextField  :"cmmCdNm"
      ,dataValueField :"cmmCd"
      ,dataSource:dms.data.cmmCdFilter(mLevelList)
      ,optionLabel:" "
   });

   $("#point").kendoExtNumericTextBox({
       format:"n0"
      ,decimals :0
      ,value:0
      ,spinners:false
   });

   $("#blueMembershipPointVal").kendoExtNumericTextBox({
       format:"n0"
      ,decimals :0
      ,value:0
      ,spinners:false
   });

   $("#tBlueAmount").kendoExtNumericTextBox({
       format:"###,###.## RMB"
      ,decimals :2
      ,value:0.00
      ,spinners:false
   });

   // 가입일
   $("#regDt").kendoExtMaskedDatePicker({
       format :"<dms:configValue code='dateFormat' />"
      ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

   // 포인트 갱신
   $("#btnBmPointSearch").on("click", function (){
       if(readOnlyFlag){ return; }

       var custTp = dms.string.isEmpty($("#custTp").val())?"01":$("#custTp").val();

       if( dms.string.isEmpty($("#custCd_"+custTp).val()) ){
           // {고객}를(을) 선택해주세요.
           dms.notification.info("<spring:message code='global.lbl.customer' var='globalLblCustomer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCustomer}' />");
           $("#custCd_"+custTp == "" ? "01" :custTp).focus();
           return ;
       }

       //$("#blueMembershipPointVal").data("kendoExtNumericTextBox").value(0);
       //$("#tBlueAmount").data("kendoExtNumericTextBox").value(0);
       fn_bmPointLoad($("#custCd_"+custTp).val());
   });

   /************************
    * 탭-종료
   ************************/

   // DB동기화 - 재조회.
   function fn_contOnLoad(selectedItem){
       dms.loading.show();
       $.ajax({
          url :"<c:url value='/sal/cnt/contractMnt/selectContractReSearch.do' />"
          ,data :JSON.stringify({"sDlrCd":selectedItem.sDlrCd, "sContractNo":selectedItem.sContractNo})
          ,type :'POST'
          ,dataType :'json'
          ,contentType :'application/json'
          ,error :function(jqXHR,status,error) {
              dms.loading.hide();
              if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                  dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
              }else{
                  dms.notification.error(error);
              }
          }
          ,success :function(jqXHR, textStatus) {
              dms.loading.hide();
              if(jqXHR.total > 0){
                fn_contGridDBclick(jqXHR.data[0]);
              }else{
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
              }
          }
      });
   }

   // 그리드 주문번호 더블클릭.
   fn_contGridDBclick = function(selectedItem){
       if( selectedItem != null && selectedItem != 'undefined'){

           $("#contractNo").val(selectedItem.contractNo);                           // 계약번호
           if(dms.string.strNvl(selectedItem.contractDt) == ""){
               $("#contractDt").data("kendoExtMaskedDatePicker").value( toDay );   // 계약일
           }else{
               $("#contractDt").data("kendoExtMaskedDatePicker").value(selectedItem.contractDt);   // 계약일
           }
           $("#contractDt").data("kendoExtMaskedDatePicker").enable(false);                    // 계약일 수정불가
           $("#contractStatCd").val(selectedItem.contractStatCd);                     // 계약상태

           $("#saleOpptNo").val(selectedItem.saleOpptNo);   //판매기회번호
           if(dms.string.isNotEmpty(selectedItem.saleOpptNo)){
               //$("#saleOpptYn").prop('checked', true);
               $("#saleOpptTxt").hide();
           }else{
               //$("#saleOpptYn").prop('checked', false);
               $("#saleOpptTxt").hide();
           }

           $("#dlReqDt").data("kendoExtMaskedDatePicker").value(selectedItem.dlReqDt);      // 인도요청일

           // 계약유형
           if(selectedItem.contractTp == "G"){              // 집단판매
               $("#contractTp").data("kendoExtDropDownList").setDataSource(sContractTpList);
               $("#contractTp").data("kendoExtDropDownList").value(selectedItem.contractTp);       // 계약유형
               $("#contractTp").data("kendoExtDropDownList").enable(false);
           }else if(selectedItem.contractTp == "D"){        // 직접판매
               $("#contractTp").data("kendoExtDropDownList").setDataSource(sContractTpList);
               $("#contractTp").data("kendoExtDropDownList").value(selectedItem.contractTp);
               $("#contractTp").data("kendoExtDropDownList").enable(false);
           }else {
               $("#contractTp").data("kendoExtDropDownList").setDataSource(contractTpList);        // 집단판매 제외
               $("#contractTp").data("kendoExtDropDownList").enable(true);
               $("#contractTp").data("kendoExtDropDownList").value(selectedItem.contractTp);       // 계약유형
           }

           $("#grpContractNo").val(selectedItem.grpContractNo);                       // 그룹계약번호
           $("#payTp").data("kendoExtDropDownList").value(selectedItem.payTp);           // 지불방식
           $("#beforeNo").val(selectedItem.beforeNo);                                 // 예약판매
           $("#beBeforeNo").val(selectedItem.beforeNo);                               // 예약판매
           $("#beforeImplyYn").val(selectedItem.beforeImplyYn);                       // 예약판매수납여부

           if(dms.string.isNotEmpty(selectedItem.saleEmpNo)){
               if(isArrayValues(selectSaleEmpDSList, 'saleEmpCd', selectedItem.saleEmpNo)){
                   $("#saleEmpNo").data("kendoExtDropDownList").value(selectedItem.saleEmpNo);   // 판매담당자
               }else{
                   $("#saleEmpNo").data("kendoExtDropDownList").setDataSource([{"saleEmpNm":"["+selectedItem.saleEmpNo+"]"+selectedItem.saleEmpNm, "saleEmpCd":selectedItem.saleEmpNo}]);
                   $("#saleEmpNo").data("kendoExtDropDownList").value(selectedItem.saleEmpNo);   // 판매담당자
               }
           }else{
               $("#saleEmpNo").data("kendoExtDropDownList").value("");   // 판매담당자
           }
           $("#saleEmpNo").data("kendoExtDropDownList").enable(false);

           $("#dstbChnCd").data("kendoExtDropDownList").value(selectedItem.dstbChnCd);
           $("#dstbChnCd").data("kendoExtDropDownList").enable(false);

           $("#lv2DlrYn").val(selectedItem.lv2DlrYn == "Y" ? "Y":"N");    //2급딜러여부

           // 판매채널:대고객, 전시장일 경우
           if(selectedItem.dstbChnCd == "01" || selectedItem.dstbChnCd == "02"){
               $("#lv2DlrOrgCd").data("kendoExtDropDownList").enable(false);
           }else if(selectedItem.dstbChnCd == "03"){        // 위성 WX
               $("#lv2DlrOrgCd").data("kendoExtDropDownList").setDataSource(lvTwoDlrWXList);
               $("#lv2DlrOrgCd").data("kendoExtDropDownList").enable(true);
           }else if(selectedItem.dstbChnCd == "04"){        // 2급 EW
               $("#lv2DlrOrgCd").data("kendoExtDropDownList").setDataSource(lvTwoDlrEWList);
               $("#lv2DlrOrgCd").data("kendoExtDropDownList").enable(true);
           }else{
               $("#lv2DlrOrgCd").data("kendoExtDropDownList").setDataSource([]);
               $("#lv2DlrOrgCd").data("kendoExtDropDownList").enable(false);
           }
           $("#lv2DlrOrgCd").data("kendoExtDropDownList").value(selectedItem.lv2DlrOrgCd);  // 2급딜러

           /* 계약 고객정보 세팅 */
           var custTp = selectedItem.custTp;
           if(custTp != null){
               $("#custTp").val(custTp);       // 계약 고객유형
               /** 계약고객정보 **/
               if(custTp == "02"){  // 법인
                   $("#cust_01").hide();
                   $("#cust_02").show();
                   $("#personalTxt_02").val("<spring:message code='global.lbl.corporation' />"); //법인
               }
               else{            // 개인
                   $("#cust_02").hide();
                   $("#cust_01").show();
                   $("#personalTxt_01").val("<spring:message code='global.lbl.personal' />"); //개인
               }

               $("#custCd_"+custTp).val(selectedItem.custCd);       // 고객코드
               $("#custNm_"+custTp).val(selectedItem.custNm);       // 고객명
               $("#vCustNm_"+custTp).val(selectedItem.custNm);      // 고객명
               $("#taxPayNo_"+custTp).val(selectedItem.taxPayNo);   // 납세번호
               $("#purcMngNm_"+custTp).val(selectedItem.purcMngNm);   // 구매담당자명
               $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").value(selectedItem.ssnCrnTp); // 신분증유형 / 법인유형
               $("#ssnCrnTp_"+custTp).change();
               $("#ssnCrnNo_"+custTp).val(selectedItem.ssnCrnNo);  // 증서번호
               $("#telNo1_"+custTp).val(selectedItem.telNo1);      // 전화번호1
               $("#telNo2_"+custTp).val(selectedItem.telNo2);      // 전화번호2
               $("#emailNm_"+custTp).val(selectedItem.emailNm);    // 이메일명

               $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").enable(false);

               // 보유고객은 신분증유형, 신분증 번호 변경 불가[2016.12.08 구상우K]
               /*
               if( dms.string.strNvl(selectedItem.custCcd) == "02" ){
                   $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").enable(false);
                   $("#ssnCrnNo_"+custTp).attr("disabled", true);
               }else{
                   $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").enable(true);
                   $("#ssnCrnNo_"+custTp).attr("disabled", false);
               }
               */

               // CRM 고객정보 블락요청[2017.03.21 이교진 요청]
               /*
               var blockYn = bf_blockSsnCrnNo(selectedItem.dlrCd, selectedItem.custCd);
               if(blockYn == "Y"){
                   $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").enable(true);
                   $("#ssnCrnNo_"+custTp).attr("disabled", false);
               }else{
                   $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").enable(false);
                   $("#ssnCrnNo_"+custTp).attr("disabled", true);
               }
               */

               $("#sungCd_"+custTp).val(selectedItem.sungCd);    // 성
               $("#sungNm_"+custTp).val(selectedItem.sungNm);    // 성
               $("#cityCd_"+custTp).val(selectedItem.cityCd);    // 시
               $("#cityNm_"+custTp).val(selectedItem.cityNm);    // 시
               $("#distCd_"+custTp).val(selectedItem.distCd);    // 구
               $("#distNm_"+custTp).val(selectedItem.distNm);    // 구
               $("#zipCd_"+custTp).val(selectedItem.zipCd);      // 우편번호
               if(dms.string.isNotEmpty(selectedItem.addrTp)){
                   $("#addrTp_"+custTp).data("kendoExtDropDownList").value(selectedItem.addrTp);   //주소유형
               }else{
                   $("#addrTp_"+custTp).data("kendoExtDropDownList").value("02");
               }
               $("#addrTp_"+custTp).data("kendoExtDropDownList").enable(false);
               $("#addrDetlCont_"+custTp).val(selectedItem.addrDetlCont);   // 상세주소

               // 판매 기회일 시, 계약자 변경 불가 및 계약자 동기화 버튼 활성화
               if(!dms.string.isEmpty(selectedItem.saleOpptNo)){
                   $("#vCustNm_"+custTp).attr("disabled", true);
                   //$("#btnCrmCustSearch_"+custTp).show();
               }

               // 집단판매일 시, 계약자 변경 불가 및 계약자 동기화 버튼 활성화
               if(selectedItem.contractTp == "G"){
                   $("#vCustNm_"+custTp).attr("disabled", true);
                   //$("#btnCrmCustSearch_"+custTp).show();
                   bf_crmCustSearch();      // 갱신버튼 실행.
               }

               // 저장시 고객변경 불가(2017.03.15 요청)
               $("#vCustNm_"+custTp).attr("disabled", true);
           }

           /* 차량정보 */
           var fscDS = null;
           var ocnDS = null;
           var extColorDS = null;
           var intColorDS = null;
           var fscCd = $("#fscCd").data("kendoExtDropDownList");
           var ocnCd = $("#ocnCd").data("kendoExtDropDownList");
           var extColorCd = $("#extColorCd").data("kendoExtDropDownList");
           var intColorCd = $("#intColorCd").data("kendoExtDropDownList");
           fscCd.enable(false);
           ocnCd.enable(false);
           extColorCd.enable(false);
           intColorCd.enable(false);

           if(dms.string.isNotEmpty(selectedItem.carlineCd)){
               $("#carlineCd").data("kendoExtDropDownList").enable(true);
               $("#carlineCd").data("kendoExtDropDownList").value(selectedItem.carlineCd);
               fscDS = setModelDataSource(selectedItem.carlineCd);

               fscCd.setDataSource(fscDS!=null?fscDS:[]);
               fscCd.enable(true);
           }


           if(dms.string.isNotEmpty(selectedItem.fscCd)){
               if(fscDS == null){
                   fscCd.setDataSource([{fscNm:selectedItem.fscNm, fscCd:selectedItem.fscCd}]);
                   fscCd.enable(false);
               }
               fscCd.value(selectedItem.fscCd);
           }

           ocnDS = setOcnDataSource(dms.string.strNvl(selectedItem.carlineCd), dms.string.strNvl(selectedItem.fscCd));
           if(ocnDS != null){
               ocnCd.setDataSource(ocnDS!=null?ocnDS:[]);
               ocnCd.enable(true);
           }

           if(dms.string.isNotEmpty(selectedItem.modelCd)){
               $("#modelCd").val(selectedItem.modelCd);

               extColorDS = setExtColorDataSource(selectedItem.modelCd);
               intColorDS = setIntColorDataSource(selectedItem.modelCd);

               extColorCd.setDataSource(extColorDS!=null?extColorDS:[]);
               intColorCd.setDataSource(intColorDS!=null?intColorDS:[]);
           }

           if(dms.string.isNotEmpty(selectedItem.ocnCd)){
               if(ocnDS == null){
                   ocnCd.setDataSource([{ocnNm:selectedItem.ocnNm, ocnCd:selectedItem.ocnCd}]);
                   ocnCd.enable(false);
               }
               ocnCd.value(selectedItem.ocnCd);
               extColorCd.enable(true);
           }

           if(dms.string.isNotEmpty(selectedItem.extColorCd)){
               if(extColorDS == null){
                   extColorCd.setDataSource([{extColorNm:selectedItem.extColorNm, extColorCd:selectedItem.extColorCd}]);
                   extColorCd.enable(false);
               }
               extColorCd.value(selectedItem.extColorCd);
               intColorCd.enable(true);
           }

           if(dms.string.isNotEmpty(selectedItem.intColorCd)){
               if(intColorDS == null){
                   intColorCd.setDataSource([{intColorNm:selectedItem.intColorNm, intColorCd:selectedItem.intColorCd}]);
                   intColorCd.enable(false);
               }
               intColorCd.value(selectedItem.intColorCd);
           }

           $("#beforVinNo").val(selectedItem.vinNo != null ? selectedItem.vinNo :"");    // vin no
           $("#vinNo").val(selectedItem.vinNo != null ? selectedItem.vinNo :"");         // vin no
           $("#sVinNo").val(selectedItem.vinNo != null ? selectedItem.vinNo :"");        // vin no

           /* 계약가격정보 */
           $("#retlAmt").data("kendoExtNumericTextBox").value(selectedItem.retlAmt != null ? selectedItem.retlAmt :0);                // 공장지도가
           //$("#promotionAmt").data("kendoExtNumericTextBox").value(selectedItem.promotionAmt != null ? selectedItem.promotionAmt :0); // 판촉금액
           $("#promotionAmt").val(selectedItem.promotionAmt != null ? selectedItem.promotionAmt :0);                               // 판촉금액
           $("#realCarAmt").data("kendoExtNumericTextBox").value(selectedItem.realCarAmt != null ? selectedItem.realCarAmt :0);       // 순차량가격
           $("#realAmt").data("kendoExtNumericTextBox").value(selectedItem.realCarAmt != null ? selectedItem.realCarAmt :0);          // 순차량가격
           $("#reservContAmt").data("kendoExtNumericTextBox").value(selectedItem.reservContAmt != null ? selectedItem.reservContAmt:0);   // 예판가격
           $("#goodsAmt").data("kendoExtNumericTextBox").value(selectedItem.goodsAmt != null ? selectedItem.goodsAmt :0);             // 용품가격
           $("#incAmt").data("kendoExtNumericTextBox").value(selectedItem.incAmt != null ? selectedItem.incAmt :0);                   // 보험료
           //$("#fincAmt").data("kendoExtNumericTextBox").value(selectedItem.fincFeeAmt != null ? selectedItem.fincFeeAmt :0);        // 금융
           $("#sbstAmt").data("kendoExtNumericTextBox").value(selectedItem.sbstAmt != null ? selectedItem.sbstAmt :0);                // 치환차감
           $("#aapAmt").data("kendoExtNumericTextBox").value(selectedItem.aapAmt != null ? selectedItem.aapAmt :0);                   // 대행료
           $("#pointAmt").data("kendoExtNumericTextBox").value(selectedItem.pointAmt != null ? selectedItem.pointAmt :0);                   // 대행료
           $("#realPayAmt").data("kendoExtNumericTextBox").value(selectedItem.realPayAmt != null ? selectedItem.realPayAmt :0);       // 실제지불금액

           /* 용품 */
           $("#goodsGrid").data('kendoExtGrid').dataSource.read();

           /* 보험서비스 */
           if(selectedItem.incAapTp == "A"){
               $("#incAapTp01").click();
               $("#incAapTp").val(selectedItem.incAapTp);
               $("#incExpcAmt").data("kendoExtNumericTextBox").value(Number(selectedItem.incExpcAmt));
               $("#realIncAmt").data("kendoExtNumericTextBox").value(Number(selectedItem.realIncAmt));
               $("#incFeeAmt").data("kendoExtNumericTextBox").value(Number(selectedItem.realIncFeeAmt));
               $("#incImplyYn").prop('checked', selectedItem.implyYn=="Y"?true:false);
               $("#finImplyYn").prop('checked', selectedItem.finImplyYn=="Y"?true:false);
               $("#incPconCustNm").val(selectedItem.incPconCustNm);
               $("#incPconCustTelNo").val(selectedItem.incPconCustTelNo);
               $("#incCustNm").val(selectedItem.incCustNm);
               $("#incCustTelNo").val(selectedItem.incCustTelNo);
               $("#incCmpCd").data("kendoExtDropDownList").value(selectedItem.incCmpCd);
               $("#incProfitNm").val(selectedItem.incProfitNm);
               $("#frcIncAmt").data("kendoExtNumericTextBox").value(selectedItem.frcIncAmt);
               $("#busIncAmt").data("kendoExtNumericTextBox").value(selectedItem.busIncAmt);
               $("#transIncTaxAmt").data("kendoExtNumericTextBox").value(selectedItem.transIncTaxAmt);
               $("#incRemark").val(selectedItem.incRemark);
               $("#incUpdtDtStr").val(selectedItem.incUpdtDtStr);
               $("#incJoinDt").val(selectedItem.incJoinDt);

               bf_incImplyYn();
               $("#incGrid").data('kendoExtGrid').dataSource.read();
           }else{
               $("#incImplyYn").prop('checked', true);
               $("#incGrid").data('kendoExtGrid').dataSource.data([]);
               $("#incAapTp02").click();
           }

           /* 금융서비스 */
           if( dms.string.strNvl(selectedItem.fincReqYn) == "Y"){
               $("#fincTp01").click();
           }else{
               $("#fincTp02").click();
           }

           $("#fincCmpCd").data("kendoExtDropDownList").value(selectedItem.fincCmpCd);
           $("#fincCmpCd").change();
           $("#fincRpayPrid").data("kendoExtNumericTextBox").value(selectedItem.fincRpayPrid);
           $("#fincLoadRate").data("kendoExtNumericTextBox").value(selectedItem.fincLoadRate);
           $("#fincFeeAmt").data("kendoExtNumericTextBox").value(selectedItem.fincFeeAmt);
           $("#fincAmt").data("kendoExtNumericTextBox").value(selectedItem.fincFeeAmt != null ? selectedItem.fincFeeAmt : 0);  //금융[탭]
           $("#fincItemCd").data("kendoExtDropDownList").value(selectedItem.fincItemCd);
           $("#fincBurdAmt").data("kendoExtNumericTextBox").value(selectedItem.fincBurdAmt);
           $("#fincReqAmt").data("kendoExtNumericTextBox").value(selectedItem.fincReqAmt);
           $("#instIntrRate").data("kendoExtNumericTextBox").value(selectedItem.instIntrRate);
           $("#grteIncAmt").data("kendoExtNumericTextBox").value(selectedItem.grteIncAmt);
           $("#fincReqDt").data("kendoExtMaskedDatePicker").value(selectedItem.fincReqDt);
           $("#fincEndDt").data("kendoExtMaskedDatePicker").value(selectedItem.fincEndDt);

           /* 중고차치환 */
           $("#uatcCarPurcYn").data("kendoExtDropDownList").value(selectedItem.uatcCarPurcYn);
           $("#sUsrVinNo").val(selectedItem.usrVinNo);
           if(dms.string.strNvl(selectedItem.usrVinNoSrYn) == "Y"){
               $("#usrVinNo").val(selectedItem.usrVinNo);
           }
           $("#usrSbstAmt").data("kendoExtNumericTextBox").value( Number(selectedItem.usrSbstAmt) );
           $("#purcNo").val(selectedItem.purcNo);
           $("#beforPurcNo").val(selectedItem.purcNo);

           $("#subsidyAmt").data("kendoExtNumericTextBox").value( Number(selectedItem.subsidyAmt) );
           $("#sbusTp").val(selectedItem.sbusTp == null ? "1" : selectedItem.sbusTp);

           $('input[name="tabSbusTp"]').prop("disabled", false);
           $("#tabSbusTp0"+$("#sbusTp").val()).attr("checked", true);
           bf_uatcCarPurcYnChk(selectedItem.uatcCarPurcYn);

           /* 번호판등록서비스 */
           if(selectedItem.regTp == "A"){
               $("#tabRegTp01").siblings("li").removeClass("on");
               $("#tabRegTp01").addClass("on");
               $("#regTp").val("A");      // SAL126 대행:A , 본인:M
               $("#aapGrid").data('kendoExtGrid').dataSource.read();

               $("#btnAapsAdd").data("kendoButton").enable(true);
               $("#btnAapsDel").data("kendoButton").enable(true);
               $("#btnAapsCancel").data("kendoButton").enable(true);
           }else{
               regGridModel = [];
               $("#tabRegTp02").click();
           }
           //$("#regPreAmt").data("kendoExtNumericTextBox").value(selectedItem.regPreAmt);
           //$("#realRegAmt").data("kendoExtNumericTextBox").value(selectedItem.realRegAmt);
           //$("#regDistCd").data("kendoExtDropDownList").value(selectedItem.regDistCd);
           //$("#regExpcDt").data("kendoExtMaskedDatePicker").value(selectedItem.regExpcDt);
           //$("#purcTaxPreAmt").data("kendoExtNumericTextBox").value(selectedItem.purcTaxPreAmt);
           //$("#realPurcTaxAmt").data("kendoExtNumericTextBox").value(selectedItem.realPurcTaxAmt);
           //$("#regFeeAmt").data("kendoExtNumericTextBox").value(selectedItem.regFeeAmt);
           //bf_sumRegAmt();

           /* 포인트 */
           $("#blueMembershipPointVal").data("kendoExtNumericTextBox").value( Number(selectedItem.blueMembershipPointVal) > 0 ? Number(selectedItem.blueMembershipPointVal) : 0.00 );
           var bmRate = selectedItem.bluePointApplyRate != null ? Number(selectedItem.bluePointApplyRate) : 1;
           $("#tBlueAmount").data("kendoExtNumericTextBox").value( Number(selectedItem.blueMembershipPointVal) * bmRate );
           if(Number(selectedItem.blueMembershipPointVal) > 0){
               fn_bmPointLoad(selectedItem.custCd);
           }

           // 견적번호 세팅
           $("#estimateNo").val(selectedItem.estimateNo);
           bf_sumCarAmt();

           /* 저장시에 재정의 사용 */
           $("#corpPromotionAmt").val('0');    // 법인 프로모션 금액
           $("#dlrPromotionAmt").val('0');     // 딜러 프로모션 금액
           $("#dcLvlCd").val(selectedItem.dcLvlCd);
           $("#dcApproveYn").val(selectedItem.dcApproveYn);
           $("#updtDtStr").val(selectedItem.updtDtStr);

           // 직접 계약일시
           if(selectedItem.contractTp == "D"){
               $("#carlineCd").data("kendoExtDropDownList").enable(false);
               $("#fscCd").data("kendoExtDropDownList").enable(false);
               $("#ocnCd").data("kendoExtDropDownList").enable(false);
               $("#extColorCd").data("kendoExtDropDownList").enable(false);
               $("#intColorCd").data("kendoExtDropDownList").enable(false);
           }

           // 계약종합조회 화면에서 넘어 왔을 시.
           if( typeof(options.sStatCd) != "undefined" && options.sStatCd == "900"){
               fn_btnState(options.sStatCd, selectedItem.contractStatCd);
           }else{
               fn_btnState(selectedItem.contractStatCd);   // 버튼상태
           }
       }
   }

   // 보험내역 Grid
   $("#incGrid").kendoExtGrid({
       gridId :"G-SAL-2017-051908"
       ,dataSource :{
           transport :{
               read :{
                   url :"<c:url value='/sal/cnt/contractRe/selectIncSearch.do' />"
               },
               parameterMap :function(options, operation) {
                   if (operation == "read") {
                       var params = {};

                       params["sDlrCd"] = dlrCd;
                       params["sContractNo"] = $("#contractNo").val();

                       return kendo.stringify(params);

                   }else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,batch :false
           ,requestEnd :function(e){
               if(e.type =="read" && e.response.total > 0){
                   //console.log(e.sender._data);
               }
           }
           ,schema :{
               model :{
                   id :"contractNo",
                   fields :{
                          dlrCd          :{type:"string"}
                        , contractNo     :{type:"string"}
                        , incTp          :{type:"string"}
                        , valRecAmt      :{type:"number"}
                        , incExpcAmt     :{type:"number"}
                        , realIncAmt     :{type:"number"}
                        , incPrid        :{type:"number"}
                        , incStartDt     :{type:"date"}
                        , incEndDt       :{type:"date"}
                        , remark         :{type:"string"}
                   }
               }
           }
       }
       ,dataBound :function(e) {
           var rows = e.sender.tbody.children()
             , v_incExpcAmt = 0
             , v_realIncAmt = 0;

           $.each(rows, function(idx, row){
               var dataItem = e.sender.dataItem(row);

               if(dataItem.incExpcAmt != null){
                   v_incExpcAmt += Number(dataItem.incExpcAmt);
               }
               if(dataItem.realIncAmt != null){
                   v_realIncAmt += Number(dataItem.realIncAmt);
               }
           });

           //$("#incExpcAmt").data("kendoExtNumericTextBox").value(v_incExpcAmt);
           v_incExpcAmt = Number($("#incExpcAmt").data("kendoExtNumericTextBox").value());
           $("#realIncAmt").data("kendoExtNumericTextBox").value(v_realIncAmt);
           $("#incDifferenceAmt").data("kendoExtNumericTextBox").value( (v_incExpcAmt - v_realIncAmt) );
       }
       ,indvColumnVisible :false          //컬럼 보이기/감추기 개인화 적용. default :true
       ,indvColumnReorderable :true       //컬럼순서 변경 개인화 적용. default :true
       ,multiSelectWithCheckbox :true    //멀티선택 적용. default :false
       //,appendEmptyColumn :false           //빈컬럼 적용. default :false
       ,enableTooltip :true               //Tooltip 적용, default :false
       ,height :105
       ,pageable :false
       ,resizable :true
       ,selectable :"multiple, row"
       ,autoBind :false
       ,sortable :false
       ,filterable :false
       ,edit :function(e){
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

               input.blur(function(){
                   var selectedItem = e.model;
                   var incExpcAmt = Number(selectedItem.incExpcAmt);

                   if(incExpcAmt >= 0 && incExpcAmt != null){

                       var grid = $("#incGrid").data("kendoExtGrid");
                       var rows = grid.tbody.find("tr");
                       var item, v_incExpcAmt = 0;

                       rows.each(function(index, row) {
                           item = grid.dataItem(rows[index]);

                           if(item.incExpcAmt != null){
                               v_incExpcAmt += Number(item.incExpcAmt);
                           }
                       });

                       $("#incExpcAmt").data("kendoExtNumericTextBox").value(v_incExpcAmt);
                       $("#incDifferenceAmt").data("kendoExtNumericTextBox").value( (v_incExpcAmt - $("#realIncAmt").data("kendoExtNumericTextBox").value()) );

                       bf_incImplyYn();
                   }
               });
           }

           if(fieldName == "realIncAmt"){
               /*
               input.blur(function(){
                   var selectedItem = e.model;

                   var realIncAmt = Number(selectedItem.realIncAmt);

                   if(realIncAmt >= 0 && realIncAmt != null){

                       var grid = $("#incGrid").data("kendoExtGrid");
                       var rows = grid.tbody.find("tr");
                       var item, v_realIncAmt = 0;

                       rows.each(function(index, row) {
                           item = grid.dataItem(rows[index]);

                           if(item.realIncAmt != null){
                               v_realIncAmt += Number(item.realIncAmt);
                           }
                       });

                       $("#realIncAmt").data("kendoExtNumericTextBox").value(v_realIncAmt);
                       $("#incDifferenceAmt").data("kendoExtNumericTextBox").value( ($("#incExpcAmt").data("kendoExtNumericTextBox").value() - v_realIncAmt) );

                       bf_incImplyYn();
                   }
               });
               */
               this.closeCell();
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
       ,columns :[
                   {field:"dlrCd", hidden:true}       // 딜러코드
                  ,{field:"contractNo", hidden:true}       // 계약번호
                  ,{
                      field:"incTp", title:"<spring:message code='sal.lbl.incTp' />", width:100, headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
                      ,template :"#= dms.string.strNvl(insTpObj[incTp]) #"
                      ,editor :function (container, options){
                          $('<input required name="incTp" data-bind="value:' + options.field + '"/>')
                          .appendTo(container)
                          .kendoExtDropDownList({
                              autoBind :false
                              ,valuePrimitive:true
                              ,dataTextField :"cmmCdNm"
                              ,dataValueField :"cmmCd"
                              ,dataSource :dms.data.cmmCdFilter(insTpList)
                          });
                          $('<span class="k-invalid-msg" data-for="incTp"></span>').appendTo(container);
                      }
                  }    // 보험유형
                  ,{
                      field:"valRecAmt", title:"<spring:message code='sal.lbl.incAmountAmt' />(<spring:message code='sal.lbl.planUnit' />)", attributes:{"class":"ar"}, width:150
                      ,template: "#= bf_incAmtTemplate(incTp, valRecAmt) #"
                      ,editor:function(container, options){
                          var obj = $('<input name="valRecAmt" data-bind="value:' + options.field + '" style="width:100%;" />').appendTo(container);
                          if(options.model.incTp == "03"){
                              obj.kendoExtDropDownList({
                                     autoBind:false
                                    ,valuePrimitive:true
                                    ,dataTextField:"cmmCdNm"
                                    ,dataValueField:"cmmCd"
                                    ,dataSource:dms.data.cmmCdFilter(threeIncTpAmtDs)
                                 });
                          }else{
                              obj.kendoExtNumericTextBox({
                                  format:"n2"
                                 ,decimals:2
                                 ,min:0.00
                                 ,value:0.00
                                 ,spinners:false
                              });
                          }
                          $('<span class="k-invalid-msg" data-for="valRecAmt"></span>').appendTo(container);
                      }
                   } //수령액(보액)
                  ,{
                       field:"incExpcAmt", title:"<spring:message code='sal.lbl.incExpcPrice' />", attributes:{"class":"ar"}, width:150
                       , format:"{0:n2}"
                       , editor:function(container, options){
                           $('<input name="incExpcAmt" data-bind="value:' + options.field + '" style="width:100%;" />')
                           .appendTo(container)
                           .kendoExtNumericTextBox({
                                   format:"n2"
                                  ,decimals:2
                                  ,min:0.00
                                  ,value:0.00
                                  ,spinners:false
                           });
                           $('<span class="k-invalid-msg" data-for="incExpcAmt"></span>').appendTo(container);
                       }
                   }   // 예상보험금액
                  ,{
                       field:"realIncAmt", title:"<spring:message code='sal.lbl.realIncPrice' />", attributes:{"class":"ar"}, width:150
                       ,format:"{0:n2}"
                       ,editor:function(container, options){
                           $('<input name="realIncAmt" data-bind="value:' + options.field + '" style="width:100%;" />')
                           .appendTo(container)
                           .kendoExtNumericTextBox({
                                   format:"n2"
                                  ,decimals:2
                                  ,min:0.00
                                  ,value:0.00
                                  ,spinners:false
                           });
                           $('<span class="k-invalid-msg" data-for="realIncAmt"></span>').appendTo(container);
                       }
                   }   // 실제보험금액
                  ,{
                      field:"incPrid", title:"<spring:message code='sal.lbl.pridMonth' />", attributes:{"class":"ar"}, width:90, format :"{0:n0}"
                      ,editor :function (container, options){
                          $('<input required name="incPrid" data-bind="value:' + options.field + '" onfocus="this.select()" maxlength="2" />')
                          .appendTo(container)
                          .kendoExtNumericTextBox({
                                format:"n0"
                                ,min:0
                                ,value:0
                                ,change :function(e){
                                    var grid = $("#incGrid").data("kendoExtGrid");
                                    var selectedItem = grid.dataItem(grid.select());
                                    if(dms.string.isEmpty(selectedItem.incStartDt)){ return ; }

                                    var incStartOrgDt = kendo.parseDate(kendo.toString(selectedItem.incStartDt, "yyyy-MM-dd"));
                                    var incStartDt    = kendo.parseDate(kendo.toString(selectedItem.incStartDt, "yyyy-MM-dd"));

                                    incStartDt.setMonth(incStartDt.getMonth() + Number(this.value()));
                                    incStartDt.setDate(incStartDt.getDate() -1);
                                    var incEndDt = kendo.toString(incStartDt, "yyyy-MM-dd");

                                    selectedItem.set("incStartDt", incStartOrgDt);
                                    selectedItem.set("incEndDt",   kendo.parseDate(incEndDt));
                                    //options.model.set("incEndDt", incEndDt);
                                }
                            });
                          $('<span class="k-invalid-msg" data-for="incPrid"></span>').appendTo(container);
                      }
                  }   // 기간(월)
                  ,{field:"incStartDt", title:"<spring:message code='sal.lbl.orgStartDt' />", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}" }   // 시작일자
                  ,{field:"incEndDt", title:"<spring:message code='sal.lbl.orgEndDt' />", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}" }     // 종료일자
                  ,{field:"remark", title:"<spring:message code='global.lbl.remark' />", attributes:{"class":"al"}, width:150}   // 비고
        ]
   });

   /* 용품 그리드 */
   $("#goodsGrid").kendoExtGrid({
       gridId :"G-SAL-2017-051911"
       ,dataSource :{
           transport :{
               read :{
                   url :"<c:url value='/sal/cnt/contractMnt/selectGoodsSearch.do' />"
               },
               parameterMap :function(options, operation) {
                   if (operation == "read") {
                       var params = {};

                       params["sDlrCd"] = dlrCd;
                       params["sContractNo"] = $("#contractNo").val();

                       return kendo.stringify(params);

                   }else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,batch :false
           ,requestEnd :function(e){
               if(e.type =="read" && e.response.total > 0){
                   //console.log(e.sender._data);
               }
           }
           ,schema :{
               model :{
                   id :"seq",
                   fields :{
                          dlrCd       :{type:"string", editable :false}  //딜러코드
                        , contractNo  :{type:"string", editable :false}
                        , seq         :{type:"number", editable :false}  //일련번호(라인번호)
                        , statCd      :{type:"string"}
                        , goodsCd     :{type:"string"}
                        , goodsNm     :{type:"string"}
                        , goodsCnt    :{type:"number"}
                        , goodsUnitCd :{type:"string"}
                        , goodsPrc    :{type:"number"}  // 단가
                        , dcRate      :{type:"number"}  // 할인율 = (할인금액/단가) * 100
                        , dcAmt       :{type:"number"}  // 할인금액 = (단가*수량) - 금액
                        , goodsAmt    :{type:"number"}  // 실제 판매가 = 단가 - (단가*할인율)
                        , realGoodsAmt:{type:"number"}  // 용품금액 = 실제판매가 * 수량
                        , eqipCostAmt:{type:"number"}      //설치비용
                        , totAmt:{type:"number"}           //총금액 = 용품금액+설치비용
                        , expcEqipDt:{type:"date"}         //설치예정일
                        , eqipPrsnId:{type:"string"}       //설치담당
                        , expcGiEndDt:{type:"date"}        //예약출고완료일자
                        , realDlDt:{type:"date"}           //출고일
                        , pkgItemCd:{type:"string"}        //패키지품목코드
                        , grStrgeCd:{type:"string"}        //입고창고
                        , giStrgeCd:{type:"string"}        //출고창고
                        , eqipEndDt:{type:"date"}          //설치완료일
                        , updtDtStr:{type:"string"}        //String수정일자
                   }
               }
               ,parse:function(d){
                   if(d.data != null){
                       $.each(d.data, function(idx, dataItem){
                           //용품판매품목상태가 반품대기(30), 반품(40) 인 경우 음수처리
                           if(dataItem.statCd == "30" || dataItem.statCd == "40"){
                               dataItem["goodsCnt"] = dataItem.goodsCnt * -1;
                               dataItem["dcAmt"] = dataItem.dcAmt * -1;

                               dataItem["realGoodsAmt"] = dataItem.realGoodsAmt * -1;
                               dataItem["eqipCostAmt"] = dataItem.eqipCostAmt * -1;
                               dataItem["totAmt"] = dataItem.totAmt * -1;
                           }
                       });
                   }
                   return d;
               }
           }
       }
       ,dataBound :function(e) {
           //var rows = e.sender.tbody.children();
           var grid = $("#goodsGrid").data('kendoExtGrid')
             , rows = grid.tbody.find("tr");
           var oRealGoodsAmt = 0;

           if(rows != null && rows.length > 0){
               for(var i = 0; i<rows.length; i++){
                   //var item = e.sender.dataItem(rows[i]);
                   var item = grid.dataItem(rows[i]);

                   //우대금액(단가*(우대율/100))
                    //item.set("dcAmt", naNcheck(item.goodsPrc * item.dcRate/100));
                    item["dcAmt"] = naNcheck(item.goodsPrc * item.dcRate/100);

                    //실제판매가(단가-우대금액)
                    //item.set("goodsAmt", item.goodsPrc - item.dcAmt);
                    item["goodsAmt"] = item.goodsPrc - item.dcAmt;

                    //용품총가격(수량*실제판매가)
                    //item.set("realGoodsAmt", item.goodsCnt * item.goodsAmt);
                    item["realGoodsAmt"] = item.goodsCnt * item.goodsAmt;

                    //금액(용품총가격+설치비용)
                    //item.set("totAmt", item.realGoodsAmt + item.eqipCostAmt);
                    item["totAmt"] = item.realGoodsAmt + item.eqipCostAmt;

                    oRealGoodsAmt += Number(item.totAmt);
               }
                $("#goodsTotAmt").data("kendoExtNumericTextBox").value(oRealGoodsAmt);
                $("#goodsAmt").data("kendoExtNumericTextBox").value(oRealGoodsAmt);
                bf_sumCarAmt();
           }
       }
       ,multiSelectWithCheckbox:true     //멀티선택 적용. default :false
       ,height:$(window).innerHeight()>=770?260:125
       ,pageable:false
       ,resizable:true
       ,selectable:"multiple, row"
       ,autoBind:false
       ,sortable:false
       ,filterable :false
       ,edit:function(e){
           var eles = e.container.find("input")
             , rows = e.sender.select()
             , selectedItem = e.sender.dataItem(rows[0])
             , fieldName;
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

           //용품판매품목상태가 출고대기(10)인 경우만 변경 가능
            if(selectedItem.statCd != "10"){
                this.closeCell();
                return;
            }

           if(fieldName == "goodsNm"){
               if(dms.string.isNotEmpty(selectedItem.goodsCd)){
                   this.closeCell();
               }
           }

           if(fieldName == "goodsUnitCd"
             || fieldName == "statCd"
             || fieldName == "goodsAmt"
             || fieldName == "realGoodsAmt"
             || fieldName == "totAmt"
             || fieldName == "expcEqipDt"
             || fieldName == "eqipPrsnId"
             || fieldName == "expcGiEndDt"
             || fieldName == "realDlDt"
             || fieldName == "pkgItemCd"
             || fieldName == "grStrgeCd"
             || fieldName == "giStrgeCd"
             || fieldName == "eqipEndDt"
           ){
               this.closeCell();
               return;
           }

           if(fieldName == "dcAmt" || fieldName == "goodsPrc"){
               input.blur(function(){
                   var item = e.model;

                   if(item.dcAmt > item.goodsPrc ){
                       dms.notification.info("<spring:message code='sal.lbl.upgrdAmt' var='upgrdAmt' /><spring:message code='global.lbl.prc' var='prc' /><spring:message code='sal.info.maxInfoChk' arguments='${upgrdAmt},${prc}' />");
                       item.set("dcAmt", 0.00);
                       item.set("dcRate", 0.00);
                   }else{
                       //할인율
                       //item["dcRate"] = (item.dcAmt/item.goodsPrc) * 100;
                       item.set("dcRate", naNcheck(item.dcAmt/item.goodsPrc) * 100);
                   }

                   //실제판매가(단가-할인금액)
                   //item["goodsAmt"] = item.goodsPrc - item.dcAmt;
                   item.set("goodsAmt", item.goodsPrc - item.dcAmt);

                   //용품총가격(수량*실제판매가)
                   //item["realGoodsAmt"] = item.goodsCnt * item.goodsAmt;
                   item.set("realGoodsAmt", item.goodsCnt * item.goodsAmt);

                   //금액(용품총가격+설치비용)
                   //item["totAmt"] = item.realGoodsAmt + item.eqipCostAmt;
                   item.set("totAmt", item.realGoodsAmt + item.eqipCostAmt);

                   //grid.refresh();
                   bf_gridSumGoodsAmt();
               });
           }

           if(fieldName == "dcRate"){
               input.blur(function(){
                   var item = e.model;

                   var dcAmt = naNcheck(Number(item.dcRate)*Number(item.goodsPrc)/100);

                   if(dcAmt > item.goodsPrc ){
                       dms.notification.info("<spring:message code='sal.lbl.upgrdAmt' var='upgrdAmt' /><spring:message code='global.lbl.prc' var='prc' /><spring:message code='sal.info.maxInfoChk' arguments='${upgrdAmt},${prc}' />");
                       item.set("dcAmt", 0.00);
                       item.set("dcRate", 0.00);
                   }else{
                       //할인가
                       item.set("dcAmt", naNcheck(Number(item.dcRate)*Number(item.goodsPrc)/100) );
                   }

                   //용품판매단가(단가-할인금액)
                   item.set("goodsAmt", item.goodsPrc - item.dcAmt);

                   //용품총가격(수량*실제판매가)
                   item.set("realGoodsAmt", item.goodsCnt * item.goodsAmt);

                   //금액(용품총가격+설치비용)
                   item.set("totAmt", item.realGoodsAmt + item.eqipCostAmt);
                   bf_gridSumGoodsAmt();
               });
           }
           if(fieldName == "goodsAmt"){
               input.blur(function(){
                   var item = e.model;
                   // 할인금액 = 단가-실제판매가
                   //item["dcAmt"] = item.goodsPrc - item.goodsAmt;
                   item.set("dcAmt", item.goodsPrc - item.goodsAmt);

                   //할인율
                   //item["dcRate"] = (item.dcAmt/item.goodsPrc) * 100;
                   item.set("dcRate", naNcheck(item.dcAmt/item.goodsPrc) * 100);

                   //용품총가격(수량*실제판매가)
                   //item["realGoodsAmt"] = item.goodsCnt * item.goodsAmt;
                   item.set("realGoodsAmt", item.goodsCnt * item.goodsAmt);

                   //금액(용품총가격+설치비용)
                   //item["totAmt"] = item.realGoodsAmt + item.eqipCostAmt;
                   item.set("totAmt", item.realGoodsAmt + item.eqipCostAmt);

                   bf_gridSumGoodsAmt();
               });
           }
           if(fieldName == "realGoodsAmt"){
               input.blur(function(){
                   var item = e.model;
                   // 할인금액 = 단가 - (금액/수량)
                   //item["dcAmt"] = item.goodsPrc - (item.realGoodsAmt/item.goodsCnt);
                   item.set("dcAmt", item.goodsPrc - (item.realGoodsAmt/item.goodsCnt));

                   //할인율
                   //item["dcRate"] = (item.dcAmt/item.goodsPrc) * 100;
                   item.set("dcRate", naNcheck(item.dcAmt/item.goodsPrc) * 100);

                   //금액(용품총가격+설치비용)
                   //item["totAmt"] = item.realGoodsAmt + item.eqipCostAmt;
                   item.set("totAmt", item.realGoodsAmt + item.eqipCostAmt);

                   bf_gridSumGoodsAmt();
               });
           }
           if(fieldName == "goodsCnt"){
               input.blur(function(){
                   var item = e.model;
                   //용품총가격(수량*실제판매가)
                   //item["realGoodsAmt"] = item.goodsCnt * item.goodsAmt;
                   item.set("realGoodsAmt", item.goodsCnt * item.goodsAmt);

                   //금액(용품총가격+설치비용)
                   //item["totAmt"] = item.realGoodsAmt + item.eqipCostAmt;
                   item.set("totAmt", item.realGoodsAmt + item.eqipCostAmt);

                   bf_gridSumGoodsAmt();
               });
           }
           if(fieldName == "eqipCostAmt"){
               input.blur(function(){
                   var item = e.model;
                   //금액(용품총가격+설치비용)
                   //item["totAmt"] = item.realGoodsAmt + item.eqipCostAmt;
                   item.set("totAmt", item.realGoodsAmt + item.eqipCostAmt);

                   bf_gridSumGoodsAmt();
               });
           }
           if(fieldName == "totAmt"){
               input.blur(function(){
                   var item = e.model;
                   //할인금= 단가 - ((총금액-설치비)/수량)
                   //item["dcAmt"] = item.goodsPrc - ((item.totAmt-item.eqipCostAmt) / item.goodsCnt);
                   item.set("dcAmt", item.goodsPrc - ((item.totAmt-item.eqipCostAmt) / item.goodsCnt));

                   //할인율
                   //item["dcRate"] = (item.dcAmt/item.goodsPrc) * 100;
                   item.set("dcRate", naNcheck(item.dcAmt/item.goodsPrc) * 100);

                   //실제판매가(단가-할인금액)
                   //item["goodsAmt"] = item.goodsPrc - item.dcAmt;
                   item.set("goodsAmt", item.goodsPrc - item.dcAmt);

                   //용품총가격(수량*실제판매가)
                   //item["realGoodsAmt"] = item.goodsCnt * item.goodsAmt;
                   item.set("realGoodsAmt", item.goodsCnt * item.goodsAmt);

                   bf_gridSumGoodsAmt();
               });
           }
       }
       ,columns :[
            {field:"dlrCd", hidden:true}            // 딜러코드
           ,{field:"contractNo", hidden:true}       // 계약번호
           ,{field:"seq", hidden:true}              // 순번
           , {field:"statCd", title:"<spring:message code='global.lbl.issueStatCd'/>", width:80
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    var statCdNm = "";

                    if(!dms.string.isEmpty(itemStatCdMap[dataItem.statCd])){
                        statCdNm = itemStatCdMap[dataItem.statCd].cmmCdNm;
                    }

                    if(dataItem.statCd == "10"){
                        return "<span class='txt_label bg_green'>" + statCdNm + "</span>";
                    }else if(dataItem.statCd == "20"){
                        return "<span class='txt_label bg_blue'>" + statCdNm + "</span>";
                    }else if(dataItem.statCd == "30"){
                        return "<span class='txt_label bg_orange'>" + statCdNm + "</span>";
                    }else if(dataItem.statCd == "40"){
                        return "<span class='txt_label bg_red'>" + statCdNm + "</span>";
                    }

                    return statCdNm;
                }
            }
           , {field:"goodsCd", title :"<spring:message code='sal.lbl.goodsCd' />", width :95
               ,attributes :{"class" :"ac"}
               ,editor :function(container, options) {
                   if(!options.model.isNew()
                           || dms.string.isNotEmpty(options.model.pkgItemCd) ){
                       container.context.innerText = dms.string.strNvl(options.model.goodsCd);
                       return;
                   }
                   $('<div class="form_search"><input required class="form_input" readonly data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:selectGoodsSearchPopup(\''+dms.string.strNvl(options.model.goodsCd)+'\', \''+dms.string.strNvl(options.model.pkgItemCd)+'\');"></a></div>')
                   .appendTo(container);
               }
             } //용품코드
           , {field:"goodsNm", title:"<spring:message code='global.lbl.goodsNm' />", width :140, attributes :{"class" :"al"}}//용품명
           , {field:"goodsCnt", title:"<spring:message code='global.lbl.qty' />", width:70, attributes:{"class":"ar"}, format:"{0:n0}"
               ,editor:function(container, options) {
                   $('<input name="goodsCnt" data-bind="value:' + options.field + '" maxlength="4" />')
                   .appendTo(container)
                   .kendoExtNumericTextBox({
                       format:"n0"
                      ,min:0
                      ,max:999
                      ,decimals:0
                      ,spinners:false
                   });
                   $('<span class="k-invalid-msg" data-for="goodsCnt"></span>').appendTo(container);
               }
           }    // 수량
           , {field:"goodsUnitCd", title:"<spring:message code='sal.lbl.unit' />", width:65, attributes:{"class":"ac"}} //단위
           , {field:"goodsPrc", title:"<spring:message code='global.lbl.prc' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"
                ,editor:function(container, options) {
                    $('<input name="goodsPrc" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2"
                       ,min:0.00
                       ,value:0.00
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="goodsPrc"></span>').appendTo(container);
                }
           }    // 단가
           , {field:"dcRate", title:"<spring:message code='sal.lbl.upgrdRate' />", width:65, attributes:{"class":"ar"}
                , template:"#=kendo.toString(dcRate, 'n2')#%"
                , editor:function(container, options) {
                    $('<input name="dcRate" data-bind="value:' + options.field + '" maxlength="6" />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2%"
                       ,min:0.00
                       ,value:0.00
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="dcRate"></span>').appendTo(container);
                }
           }    //할인율
           , {field:"dcAmt", title:"<spring:message code='sal.lbl.upgrdAmt' />", width:65, attributes:{"class":"ar"}, format:"{0:n2}"
                ,editor:function(container, options) {
                    $('<input name="dcAmt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2"
                       ,min:0.00
                       ,value:0.00
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="dcAmt"></span>').appendTo(container);
                }
           }     //할인가
           , {field:"goodsAmt", title:"<spring:message code='sal.lbl.saleAmt' />", width:110, attributes:{"class":"ar"}, format:"{0:n2}"}   //실제판매가
           , {field:"realGoodsAmt", title:"<spring:message code='sal.lbl.retlTotAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}    // 금액
           , {field:"eqipCostAmt", title:"<spring:message code='sal.lbl.eqipCost' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"
                ,editor:function(container, options) {
                    $('<input name="eqipCostAmt" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n2"
                       ,min:0.00
                       ,value:0.00
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="eqipCostAmt"></span>').appendTo(container);
                }
           }    //설치비용
           , {field:"totAmt", title:"<spring:message code='global.lbl.amt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}           //총가격
           , {field:"expcEqipDt", title:"<spring:message code='sal.lbl.expEqipDt' />", width:80, attributes:{"class":"ac"}                      //설치예정일
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"eqipPrsnId" ,title:"<spring:message code='sal.lbl.eqipEmp' />", width:90, attributes:{"class":"ac"}                        //설치담당
                ,template:"# if(eqipPrsnMap[eqipPrsnId] != null) { # #= eqipPrsnMap[eqipPrsnId].tecNm# # }#"
                ,editor:function (container, options){
                    $('<input required name="eqipPrsnId" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField: "tecNm"
                        ,dataValueField:"tecId"
                        ,dataSource:dms.data.cmmCdFilter(eqipPrsnList)
                        ,optionLabel:" "
                    });
                    $('<span class="k-invalid-msg" data-for="eqipPrsnId"></span>').appendTo(container);
                }
            }
            ,{field:"eqipEndDt", title:"<spring:message code='sal.lbl.eqipEndDt' />", width:80, attributes:{"class":"ac"}                       //설치완료일
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"expcGiEndDt", title:"<spring:message code='sal.lbl.expcGiEndDt' />", width:100, attributes:{"class":"ac"}                  //예약출고완료일자
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"realDlDt", title:"<spring:message code='global.lbl.giDt' />", width:80, attributes:{"class":"ac"}                          //출고일
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
           , {field:"pkgItemCd", title:"<spring:message code='global.lbl.pkgItemCd' />", width:100, attributes:{"class":"al"}, format:"{0:n2}"} //패키지번호
           , {field:"grStrgeCd",   hidden:true}
           , {field:"giStrgeCd",   hidden:true}
           , {field:"updtDtStr",   hidden:true}
       ]
    });

    /**
    * 그리드 목록의 체크박스 체크 여부에 따라 해당 목록을 선택하거나 선택/취소 한다.
    */
    /*
    $(document).on("click", ".grid-checkbox-item", function(e){
        var grid = $("#goodsGrid").data("kendoExtGrid")
          , row = grid.tbody.find("tr[data-uid='" + $(this).attr("data-uid") + "']")
          , chk = $(this).is(":checked")
          , pkg = dms.string.strNvl(grid.dataItem(row).pkgItemCd);

        if( pkg != ""){
            var rowsPack = grid.tbody.find("tr")
              , inputRows = grid.tbody.find("tr > td > input");

            rowsPack.each(function(index, row) {
                var rowItem = grid.dataItem(row);
                if(pkg == dms.string.strNvl(rowItem.pkgItemCd)){
                    inputRows[index].checked = chk;
                }
            });
        }
    });
    $(document).on("click", ".grid-checkAll", function(e){
        var grid = $("#goodsGrid").data("kendoExtGrid");
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
    */

   // 대행업무
   $("#aapGrid").kendoExtGrid({
       gridId :"G-SAL-2017-051906"
       ,dataSource :{
           transport :{
               read :{
                   url :"<c:url value='/sal/cnt/contractMnt/selectAapSearch.do' />"
               },
               parameterMap :function(options, operation) {
                   if (operation == "read") {
                       var params = {};

                       params["sDlrCd"] = dlrCd;
                       params["sContractNo"] = $("#contractNo").val();

                       return kendo.stringify(params);

                   }else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,batch :false
           ,requestEnd :function(e){
               if(e.type =="read" && e.response.total > 0){
                   //console.log(e.sender._data);
               }
           }
           ,schema :{
               model :{
                   id :"dlrCd",
                   fields :{
                          dlrCd     :{type:"string"}
                        , contractNo:{type:"string"}
                        , aapWorkTp :{type:"string"}
                        , realAapAmt :{type:"number"}
                        , aapImplyYn :{type:"string"}
                        , rmk:{type:"string"}

                   }
               }
           }
       }
       ,dataBound :function(e) {
           var rows = e.sender.tbody.children()
             , v_realAapAmt = 0

           $.each(rows, function(idx, row){
               var dataItem = e.sender.dataItem(row);

               if(dataItem.realAapAmt != null && dataItem.aapImplyYn == "Y" ){
                   v_realAapAmt += Number(dataItem.realAapAmt);
               }
           });
           $("#aapAmt").data("kendoExtNumericTextBox").value(Number(v_realAapAmt));
           bf_sumCarAmt();
       }
       ,indvColumnVisible :false          //컬럼 보이기/감추기 개인화 적용. default :true
       ,indvColumnReorderable :true       //컬럼순서 변경 개인화 적용. default :true
       ,multiSelectWithCheckbox :true    //멀티선택 적용. default :false
       //,appendEmptyColumn :false           //빈컬럼 적용. default :false
       ,enableTooltip :true               //Tooltip 적용, default :false
       ,height :120
       ,pageable :false
       ,resizable :true
       ,selectable :"multiple, row"
       ,autoBind :false
       ,sortable :false
       ,filterable :false
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

           if(fieldName == "aapImplyYn"){
               this.closeCell();
           }

           if(fieldName == "realAapAmt"){

               input.blur(function(){
                   var selectedItem = e.model;

                   var realAapAmt = Number(selectedItem.realAapAmt);

                   if(realAapAmt != null){

                       var grid = $("#aapGrid").data("kendoExtGrid");
                       var rows = grid.tbody.find("tr");
                       var item, v_realAapAmt = 0;

                       rows.each(function(index, row) {
                           item = grid.dataItem(rows[index]);

                           if(item.realAapAmt != null){
                               if(item.aapImplyYn == "Y"){
                                   v_realAapAmt += Number(item.realAapAmt);
                               }
                           }
                       });
                       $("#aapAmt").data("kendoExtNumericTextBox").value(Number(v_realAapAmt));
                       bf_sumCarAmt();
                   }
               });
           }
       }
       ,columns :[
                   {field:"dlrCd", hidden:true}       // 딜러코드
                  ,{field:"contractNo", hidden:true}       // 계약번호
                  ,{
                      field:"aapWorkTp", title:"<spring:message code='sal.lbl.workTp' />", width:100, headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
                      ,template :"#= dms.string.strNvl(aapWorkObj[aapWorkTp]) #"
                      ,editor :function (container, options){
                          $('<input required name="aapWorkTp" data-bind="value:' + options.field + '"/>')
                          .appendTo(container)
                          .kendoExtDropDownList({
                              autoBind :false
                              ,dataTextField :"cmmCdNm"
                              ,dataValueField :"cmmCd"
                              ,dataSource :dms.data.cmmCdFilter(aapWorkList)
                          });
                          $('<span class="k-invalid-msg" data-for="aapWorkTp"></span>').appendTo(container);
                      }
                  }    // 업무유형
                  ,{
                      field:"realAapAmt", title:"<spring:message code='sal.lbl.realAapAmt' />", attributes:{"class":"ar"}, width:100
                      , format:"{0:n2}"
                   } //실제금액
                  ,{
                      field:"aapImplyYn", title:"<spring:message code='sal.lbl.incImplyYn' />", attributes:{"class":"ac"}, width:90
                      , template: '<input type="checkbox" class="checkbox" data-uid=#= uid # onclick="bf_checkAapAmmt(this, \'#=uid#\')" id="aapImplyYn" #= aapImplyYn=="Y" ? checked="checked":"" #  />'
                   }   // 계약금 포함여부
                  ,{field:"rmk", title:"<spring:message code='sal.lbl.remark' />", attributes:{"class":"al"}, width:250}   // 비고
        ]
   });


   fnOnfocus = function(id){
       $("#"+ id +" ").select();
   }

   //$("#incAapTp02").click();       // 보험처리 - 최초:본인
   //$("#fincTp02").click();         // 금융 - 최초:본인
   //$("#tabRegTp02").click();       // 대행 - 최초:본인

   $("#dPopButton").show();

   // 더블클릭.
   if( dms.string.isNotEmpty(options.sContractNo)){
       refreshAll();
       fn_contOnLoad(options);
   }else{
       refreshAll();
       fn_btnState();
   }

});
/******************************************
 * ready () = End =
 ******************************************/

/******************************************
 * 함수영역 - start
 ******************************************/

// 초기화
function refreshAll() {
    /* 기본정보 */
    $("#contractNo").val("");      // 계약번호
    $("#contractDt").data("kendoExtMaskedDatePicker").enable(true);
    $("#contractDt").data("kendoExtMaskedDatePicker").value(toDay);      // 계약일자
    $("#contractDt").data("kendoExtMaskedDatePicker").enable(false);
    $("#saleOpptNo").val("");      // 판매기회번호
    //$("#saleOpptYn").prop('checked', false);
    $("#saleOpptTxt").hide();

    $("#lv2DlrOrgCd").data("kendoExtDropDownList").value('');
    $("#lv2DlrYn").val('N');            // 2급딜러여부

    $("#dlReqDt").data("kendoExtMaskedDatePicker").value(toDay);    // 인도요청일

    $("#contractTp").data("kendoExtDropDownList").setDataSource(dms.data.cmmCdFilter(contractTpList));        // 집단판매,직접판매 제외
    $("#contractTp").data("kendoExtDropDownList").enable(true);
    $("#contractTp").data("kendoExtDropDownList").select(0);   // 계약유형

    $("#grpContractNo").val("");     // 그룹계약번호
    $("#payTp").data("kendoExtDropDownList").value("");
    $("#beforeNo").val("");          // 예약판매
    $("#beBeforeNo").val("");        // 예약판매
    $("#beforeImplyYn").val("N");    // 예약판매수납여부

    $("#saleEmpNo").data("kendoExtDropDownList").setDataSource(selectSaleEmpDSList);
    if(saleEmpYn == "Y"){
        $("#saleEmpNo").data("kendoExtDropDownList").value(userId);             // 판매담당자
    }else{
        $("#saleEmpNo").data("kendoExtDropDownList").value('');
    }
    $("#dstbChnCd").data("kendoExtDropDownList").value(dms.string.strNvl(chnInfo.dstbChnCd));  // 채널유형
    $("#saleEmpNo").data("kendoExtDropDownList").enable(false);
    $("#dstbChnCd").data("kendoExtDropDownList").enable(false);

    // 판매채널:대고객, 전시장일 경우
    if(dms.string.strNvl(chnInfo.dstbChnCd) == "01" || dms.string.strNvl(chnInfo.dstbChnCd) == "02"){
        $("#lv2DlrOrgCd").data("kendoExtDropDownList").enable(false);
    }else if(dms.string.strNvl(chnInfo.dstbChnCd) == "03"){        // 위성 WX
        $("#lv2DlrOrgCd").data("kendoExtDropDownList").setDataSource(lvTwoDlrWXList);
        $("#lv2DlrOrgCd").data("kendoExtDropDownList").enable(true);
    }else if(dms.string.strNvl(chnInfo.dstbChnCd) == "04"){        // 2급 EW
        $("#lv2DlrOrgCd").data("kendoExtDropDownList").setDataSource(lvTwoDlrEWList);
        $("#lv2DlrOrgCd").data("kendoExtDropDownList").enable(true);
    }else{
        $("#lv2DlrOrgCd").data("kendoExtDropDownList").setDataSource([]);
        $("#lv2DlrOrgCd").data("kendoExtDropDownList").enable(false);
    }

    $("#custTp").val("01");       // 계약자 고객유형
    $("#estimateNo").val("");     // 견적번호
    $("#contractStatCd").val(""); // 계약상태

    $("#vCustNm_01").attr("disabled", false);
    $("#vCustNm_02").attr("disabled", false);
    //$("#btnCrmCustSearch_01").hide();
    //$("#btnCrmCustSearch_02").hide();

    $("#cust_02").hide();
    $("#cust_01").show();
    $("#personalTxt_01").val(" "); //개인
    $("#custCd_01").val("");     // 고객코드
    $("#custNm_01").val("");     // 고객명
    $("#vCustNm_01").val("");    // 고객명

    $("#ssnCrnTp_01").val("");   //신분증유형
    $("#ssnCrnTp_01").change();
    $("#ssnCrnNo_01").val("");   //증서번호
    $("#telNo1_01").val("");     //전화번호
    $("#telNo2_01").val("");
    $("#emailNm_01").val("");    //이메일
    $("#taxPayNo_01").val("");   // 납세번호
    $("#purcMngNm_01").val("");  //구매담당자명
    $("#ssnCrnTp_01").data("kendoExtDropDownList").enable(false);

    $("#sungNm_01").val("");
    $("#sungCd_01").val("");
    $("#cityNm_01").val("");
    $("#cityCd_01").val("");
    $("#distNm_01").val("");
    $("#distCd_01").val("");

    $("#zipCd_01").val("");
    $("#addrTp_01").data("kendoExtDropDownList").value("02");
    $("#addrTp_01").data("kendoExtDropDownList").enable(false);

    $("#addrDetlCont_01").val("");

    $("#custCd_02").val("");      // 고객코드
    $("#custNm_02").val("");      // 고객명
    $("#vCustNm_02").val("");     // 고객명
    $("#ssnCrnTp_02").val("");    //신분증유형
    $("#ssnCrnTp_02").change();
    $("#ssnCrnNo_02").val("");    //증서번호
    $("#telNo1_02").val("");      //전화번호
    $("#telNo2_02").val("");
    $("#emailNm_02").val("");     //이메일
    $("#taxPayNo_02").val("");    // 납세번호
    $("#purcMngNm_02").val(""); //구매담당자명
    $("#ssnCrnTp_02").data("kendoExtDropDownList").enable(false);

    $("#sungNm_02").val("");
    $("#sungCd_02").val("");
    $("#cityNm_02").val("");
    $("#cityCd_02").val("");
    $("#distNm_02").val("");
    $("#distCd_02").val("");

    $("#zipCd_02").val("");
    $("#addrTp_02").data("kendoExtDropDownList").value("02");
    $("#addrTp_02").data("kendoExtDropDownList").enable(false);
    $("#addrDetlCont_02").val("");

    /* 차량 */
    $("#carlineCd").data("kendoExtDropDownList").enable(true);
    $("#carlineCd").data("kendoExtDropDownList").value('');
    $("#modelCd").val("");

    var fscCd = $("#fscCd").data("kendoExtDropDownList");
    fscCd.setDataSource([]);
    fscCd.enable(false);
    fscCd.value('');

    var ocnCd = $("#ocnCd").data("kendoExtDropDownList");
    ocnCd.setDataSource([]);
    ocnCd.enable(false);
    ocnCd.value('');

    var extColorCd = $("#extColorCd").data("kendoExtDropDownList");
    extColorCd.setDataSource([]);
    extColorCd.enable(false);
    extColorCd.value('');

    var intColorCd = $("#intColorCd").data("kendoExtDropDownList");
    intColorCd.setDataSource([]);
    intColorCd.enable(false);
    intColorCd.value('');

    $("#beforVinNo").val('');                               // vin no
    $("#vinNo").val('');                                    // vin no
    $("#sVinNo").val('');                                  // 조회용

    $("#retlAmt").data("kendoExtNumericTextBox").value(0.00);     // 지도가
    $("#realCarAmt").data("kendoExtNumericTextBox").value(0.00);  // 실제차량금액

    /* 계약가격정보 */
    $("#realAmt").data("kendoExtNumericTextBox").value(0.00);        // 순차량금액
    $("#reservContAmt").data("kendoExtNumericTextBox").value(0.00);  // 예약판매금액
    $("#goodsAmt").data("kendoExtNumericTextBox").value(0.00);       // 용품가격
    $("#incAmt").data("kendoExtNumericTextBox").value(0.00);         // 보험료
    $("#fincAmt").data("kendoExtNumericTextBox").value(0.00);        // 금융
    $("#sbstAmt").data("kendoExtNumericTextBox").value(0.00);        // 치환차감
    $("#aapAmt").data("kendoExtNumericTextBox").value(0.00);         // 대행료
    //$("#promotionAmt").data("kendoExtNumericTextBox").value(0);   // 판촉금액
    $("#promotionAmt").val(0);                                 // 판촉금액
    $("#pointAmt").data("kendoExtNumericTextBox").value(0.00);       // 포인트
    $("#realPayAmt").data("kendoExtNumericTextBox").value(0.00);     // 실제지불금액

    $("#tabstrip").data("kendoExtTabStrip").select(0);
    selectTabId = "goodsTab";      // 용품

    /* 용품 */
    $("#goodsTotAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#goodsAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#goodsGrid").data('kendoExtGrid').dataSource.data([]);

    /* 보험 */
    incModel = {};
    $("#incImplyYn").prop('checked', true);
    $("#incAapTp02").click();    // 보험서비스 :본인
    incGridModel = [];
    $("#incUpdtDtStr").val("");
    $("#incJoinDt").val("");

    /*
    $("#incAapTp").val("A");      // SAL126 대행:A , 본인:M
    $("#incExpcAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#realIncAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#incDifferenceAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#incFeeAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#incImplyYn").prop('checked', true);
    $("#finImplyYn").prop('checked', false);
    $("#incPconCustNm").val('');
    $("#incPconCustTelNo").val('');
    $("#incCustNm").val('');
    $("#incCustTelNo").val('');
    $("#incCmpCd").data("kendoExtDropDownList").value('');
    $("#incProfitNm").val('');
    $("#frcIncAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#busIncAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#transIncTaxAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#incRemark").val('');
    $("#incGrid").data('kendoExtGrid').dataSource.data([]);     // 보험 Grid
    */

    /*금융*/
    fincModel = {};
    $("#fincTp02").click();      // 금융 : 본인
    $("#fincReqYn").val("N");

    $("#fincCmpCd").data("kendoExtDropDownList").value('');
    $("#fincCmpCd").change();
    $("#fincRpayPrid").data("kendoExtNumericTextBox").value(0);
    $("#fincLoadRate").data("kendoExtNumericTextBox").value(0.00);

    $("#fincFeeAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#fincItemCd").data("kendoExtDropDownList").value('');
    $("#fincBurdAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#fincReqAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#instIntrRate").data("kendoExtNumericTextBox").value(0);
    $("#grteIncAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#fincReqDt").data("kendoExtMaskedDatePicker").value('');
    $("#fincEndDt").data("kendoExtMaskedDatePicker").value('');

    /* 중고차치환 */
    $("#uatcCarPurcYn").data("kendoExtDropDownList").value("N");
    $("#sUsrVinNo").val('');
    $("#usrVinNo").val('');
    $("#purcNo").val('');
    $("#beforPurcNo").val('');

    $("#usrSbstAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#subsidyAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#sUsrVinNo").attr("disabled", true);
    $("#purcNo").attr("disabled", true);
    $("#usrSbstAmt").data("kendoExtNumericTextBox").enable(false);
    $("#subsidyAmt").data("kendoExtNumericTextBox").enable(false);
    $("#sbusTp").val("1");
    $("#tabSbusTp01").attr("checked", true);
    $('input[name="tabSbusTp"]').prop("disabled", true);
    //bf_uatcCarPurcYnChk("N");

    /* 대행업무 */
    $("#tabRegTp02").click();    // 번호판 등록서비스 :본인
    regGridModel = [];

    /* 포인트*/
    $("#blueMembershipId").val('');
    $("#blueMembershipNo").val('');
    $("#bluePointApplyRate").val('1');
    $("#mLevel").data("kendoExtDropDownList").value('');
    $("#point").data("kendoExtNumericTextBox").value(0.00);
    $("#blueMembershipPointVal").data("kendoExtNumericTextBox").value(0.00);
    $("#tBlueAmount").data("kendoExtNumericTextBox").value(0.00);
    $("#regDt").data("kendoExtMaskedDatePicker").value('');

    /* 판촉 */
    //$("#promotionAmt").data("kendoExtNumericTextBox").value(0.00);

    bf_sumCarAmt();

    $("#dcLvlCd").val("");
    $("#dcApproveYn").val("N");
}

/** [차량영역] ComboBox Select() **/
//차종에 따른 모델검색 [차량영역]
function onSelectCarlineCd(e){
    $("#fscCd").data("kendoExtDropDownList").setDataSource([]);
    $("#fscCd").data("kendoExtDropDownList").enable(true);
    $("#modelCd").val("");

    $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
    $("#ocnCd").data("kendoExtDropDownList").enable(true);       // OCN 닫음

    $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#extColorCd").data("kendoExtDropDownList").enable(false);

    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    $("#retlAmt").data("kendoExtNumericTextBox").value(0.00);         // 지도가
    $("#realCarAmt").data("kendoExtNumericTextBox").value(0.00);      // 순차량금액
    bf_addDcRealAmt();

    $("#vinNo").val('');    // vin no
    $("#sVinNo").val('');

    var dataItem = this.dataItem(e.item);
    if(dataItem.carlineCd == ""){
        $("#fscCd").data("kendoExtDropDownList").enable(false);
        $("#ocnCd").data("kendoExtDropDownList").enable(false);
        return false;
    }

    $("#fscCd").data("kendoExtDropDownList").setDataSource(setModelDataSource(dataItem.carlineCd));
    $("#ocnCd").data("kendoExtDropDownList").setDataSource(setOcnDataSource($("#carlineCd").val(),""));

    // 금융상품
    if( $("#fincReqYn").val() == "Y"){
      var fincCmpCd = $("#fincCmpCd").data("kendoExtDropDownList").value();
      if( fincCmpCd === "BHAF" ){
          $("#fincItemCd").data("kendoExtDropDownList").setDataSource(fincBHAFItemObj[dataItem.carlineCd]);
      }else{
          $("#fincItemCd").data("kendoExtDropDownList").setDataSource(fincItemObj[fincCmpCd]);
      }
    }

}

// 차관에 따른 OCN검색 [차량영역]
function onSelectFscCd(e){
    $("#modelCd").val("");

    $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
    $("#ocnCd").data("kendoExtDropDownList").enable(true);

    $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#extColorCd").data("kendoExtDropDownList").enable(false);

    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    $("#vinNo").val('');    // vin no
    $("#sVinNo").val('');

    var dataItem = this.dataItem(e.item);
    //if(dataItem.fscCd == ""){
    //    $("#ocnCd").data("kendoExtDropDownList").enable(false);
    //    return false;
    //}

    $("#ocnCd").data("kendoExtDropDownList").setDataSource(setOcnDataSource($("#carlineCd").val(), dataItem.fscCd));

    $("#retlAmt").data("kendoExtNumericTextBox").value(0);         // 지도가
    $("#realCarAmt").data("kendoExtNumericTextBox").value(0);      // 순차량금액
    bf_addDcRealAmt();
}

//OCN에 따른 외장색 검색
function onSelectOcnCd(e){
    $("#modelCd").val("");

    $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#extColorCd").data("kendoExtDropDownList").enable(true);

    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    $("#vinNo").val('');    // vin no
    $("#sVinNo").val('');

    var dataItem = this.dataItem(e.item);
    if(dataItem.ocnCd == ""){
        $("#extColorCd").data("kendoExtDropDownList").enable(false);
        return false;
    }

    if(Number(dataItem.modelCnt) > 1){
        dms.notification.error("<spring:message code='sal.info.modelCntCheck' arguments='"+dataItem.ocnNm+","+dataItem.modelCnt+"' />");
        $("#extColorCd").data("kendoExtDropDownList").enable(false);
        $("#ocnCd").data("kendoExtDropDownList").value("");
        return false;
    }

    $("#modelCd").val(dataItem.modelCd);

    //차량 가격 세팅
    $("#retlAmt").data("kendoExtNumericTextBox").value(dataItem.msPrc);       // 지도가
    //$("#realCarAmt").data("kendoExtNumericTextBox").value(dataItem.msPrc);    // 순차량금액
    $("#realCarAmt").data("kendoExtNumericTextBox").value(0);    // 순차량금액
    bf_addDcRealAmt();

    $("#extColorCd").data("kendoExtDropDownList").setDataSource(setExtColorDataSource($("#modelCd").val()));
}

// 외장색에 따른 내장색 검색
function onSelectExtColorCd(e){
    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(true);

    $("#vinNo").val('');    // vin no
    $("#sVinNo").val('');

    if(this.dataItem(e.item).ocnCd == ""){
        $("#intColorCd").data("kendoExtDropDownList").enable(false);
        return false;
    }
    $("#intColorCd").data("kendoExtDropDownList").setDataSource(setIntColorDataSource($("#modelCd").val()));
}

// 차관(모델)의 DataSource를 불러온다.
function setModelDataSource(carlineCd){
    var responseJson = dms.ajax.getJson({
        url :"<c:url value='/sal/cnt/contractMnt/selectFsc.do' />"
        ,data :JSON.stringify({"sCarlineCd":carlineCd})
        ,async :false
    });

    if(responseJson == null || responseJson.data == null){
        responseJson.data = null;
    }
    return responseJson.data;
}

// OCN의 DataSource를 불러온다.
function setOcnDataSource(carlineCd, fscCd){
    var responseJson = dms.ajax.getJson({
        url :"<c:url value='/sal/cnt/contractMnt/selectOcn.do' />"
        ,data :JSON.stringify({"sCarlineCd":carlineCd, "sFscCd":fscCd})
        ,async :false
    });

    if(responseJson == null || responseJson.data == null){
        responseJson.data = null;
    }
    return responseJson.data;
}

// 외장색의 DataSource를 불러온다.
function setExtColorDataSource(modelCd){
    var responseJson = dms.ajax.getJson({
        url :"<c:url value='/sal/cnt/contractRe/selectExtColor.do' />"
        ,data :JSON.stringify({"modelCd":modelCd})
        ,async :false
    });

    if(responseJson == null || responseJson.data == null){
        responseJson.data = null;
    }

    return responseJson.data;
}

// 내장색의 DataSource를 불러온다.
function setIntColorDataSource(modelCd){
    var responseJson = dms.ajax.getJson({
        url :"<c:url value='/sal/cnt/contractRe/selectIntColor.do' />"
        ,data :JSON.stringify({"modelCd":modelCd})
        ,async :false
    });

    if(responseJson == null || responseJson.data == null){
        responseJson.data = null;
    }

    return responseJson.data;
}

// 대출 수수료 = 금융 탭
function bf_onFincAmt(){
    var fincFeeAmt = $("#fincFeeAmt").data("kendoExtNumericTextBox").value();
    if(fincFeeAmt == null){
        fincFeeAmt = 0;
        $("#fincFeeAmt").data("kendoExtNumericTextBox").value(0.00);
    }

    $("#fincAmt").data("kendoExtNumericTextBox").value( Number(fincFeeAmt) );
    bf_sumCarAmt();
}

// 보험수수료 = 보험 탭
function bf_onIncAmt(){
    var incExpcAmt = $("#incExpcAmt").data("kendoExtNumericTextBox").value()
      , realIncAmt = $("#realIncAmt").data("kendoExtNumericTextBox").value()
      , incFeeAmt  = $("#incFeeAmt").data("kendoExtNumericTextBox").value();

    if(incExpcAmt == null){
        incExpcAmt = 0;
        $("#incExpcAmt").data("kendoExtNumericTextBox").value(incExpcAmt);
    }
    if(realIncAmt == null){
        realIncAmt = 0;
        $("#realIncAmt").data("kendoExtNumericTextBox").value(realIncAmt);
    }
    if(incFeeAmt == null){
        incFeeAmt = 0;
        $("#incFeeAmt").data("kendoExtNumericTextBox").value(incFeeAmt);
    }

    $("#incAmt").data("kendoExtNumericTextBox").value(realIncAmt>0?realIncAmt+incFeeAmt:incExpcAmt+incFeeAmt);
    bf_sumCarAmt();
}

// 순차량금액 조정
function bf_addDcRealAmt(){
    var realCarAmt = $("#realCarAmt").data("kendoExtNumericTextBox").value();
    if(realCarAmt == null){
        realCarAmt = 0;
        $("#realCarAmt").data("kendoExtNumericTextBox").value(realCarAmt);
    }

    $("#realAmt").data("kendoExtNumericTextBox").value(realCarAmt);
    bf_sumCarAmt();
}

// 차량가격 계산
function bf_sumCarAmt(){
   var carAmt     = Number($("#retlAmt").data("kendoExtNumericTextBox").value());
   var realCarAmt = Number($("#realCarAmt").data("kendoExtNumericTextBox").value());
   var dcAmt      = carAmt - realCarAmt;
   //2016.11.03 이승민과장 로직추가 : carAmt == 0은 할인가 표시 안함.
   //$("#promotionAmt").data("kendoExtNumericTextBox").value(carAmt==0?0:dcAmt);
   $("#promotionAmt").val(carAmt==0?0.00:dcAmt);

   var beforeAmt = Number($("#reservContAmt").data("kendoExtNumericTextBox").value());
   var goodsAmt = Number($("#goodsAmt").data("kendoExtNumericTextBox").value());
   var incAmt   = Number($("#incAmt").data("kendoExtNumericTextBox").value());
   var fincAmt  = Number($("#fincAmt").data("kendoExtNumericTextBox").value());
   var sbstAmt  = Number($("#sbstAmt").data("kendoExtNumericTextBox").value());
   var aapAmt   = Number($("#aapAmt").data("kendoExtNumericTextBox").value());
   var pointAmt = Number($("#pointAmt").data("kendoExtNumericTextBox").value());

   // 실제차량금액 = 지도가 - 예판가격 + 용품 + 보험 + 금융 + 중고차(-) + 대행 - 할인 + 포인트(-)
   var carTotAmt = carAmt - beforeAmt + goodsAmt + incAmt + fincAmt + sbstAmt + aapAmt - dcAmt + pointAmt;

   // 총판매 금액 : 실제차량금액
   $("#realPayAmt").data("kendoExtNumericTextBox").value(carTotAmt);

   //중고차 보조금
   var subsidyAmt = Number($("#subsidyAmt").data("kendoExtNumericTextBox").value());
   switch($("#sbusTp").val()){
       case '1':
           $("#realAmt").data("kendoExtNumericTextBox").value(realCarAmt);
           break;
       case '2':
           $("#realAmt").data("kendoExtNumericTextBox").value(realCarAmt);
           $("#realPayAmt").data("kendoExtNumericTextBox").value(carTotAmt-subsidyAmt);
           break;
       case '3':
           $("#realAmt").data("kendoExtNumericTextBox").value(realCarAmt-subsidyAmt);
           $("#realPayAmt").data("kendoExtNumericTextBox").value(carTotAmt-subsidyAmt);
           break;
   }

   // 금융신청금액 = 완성차가격 - 자기금액
   if( dms.string.strNvl($("#fincReqYn").val()) == "Y"){
       var fincBurdAmt = Number($("#fincBurdAmt").data("kendoExtNumericTextBox").value());
       var realAmt = Number($("#realAmt").data("kendoExtNumericTextBox").value());
       fincBurdAmt = fincBurdAmt < 0 ? 0 : fincBurdAmt;
       var fincReqAmt = realAmt - fincBurdAmt;
       $("#fincReqAmt").data("kendoExtNumericTextBox").value(fincReqAmt);

       if( fincReqAmt > 0  && realAmt > 0){
              $("#fincLoadRate").data("kendoExtNumericTextBox").value( (fincReqAmt / realAmt) * 100 );
          }else{
              $("#fincLoadRate").data("kendoExtNumericTextBox").value(0.00);
          }
   }
}

// 중고차치환 여부 변경 change
bf_uatcCarPurcYnChk = function(chk){
    if(chk == "Y"){
        $("#sUsrVinNo").attr("disabled", false);
        $("#purcNo").attr("disabled", false);
        $("#usrSbstAmt").data("kendoExtNumericTextBox").enable(true);
        $('input[name="tabSbusTp"]').prop("disabled", false);
        $("#subsidyAmt").data("kendoExtNumericTextBox").enable(true);
    }else{
        $("#sUsrVinNo").val('');
        $("#usrVinNo").val('');
        $("#purcNo").val('');

        $("#usrSbstAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#subsidyAmt").data("kendoExtNumericTextBox").value(0.00);
        $("#sbusTp").val('1');
        //$("#tabSbusTp01").attr("checked", true);
        $("#tabSbusTp01").prop('checked', true);

        bf_addUsrSbstAmt();

        $("#sUsrVinNo").attr("disabled", true);
        $("#purcNo").attr("disabled", true);
        $("#usrSbstAmt").data("kendoExtNumericTextBox").enable(false);
        $("#subsidyAmt").data("kendoExtNumericTextBox").enable(false);
        $('input[name="tabSbusTp"]').prop("disabled", true);
    }
}

// 중고차 치환 ( 음수로 표시 요청 )
bf_addUsrSbstAmt = function(){
    var usrSbstAmt = $("#usrSbstAmt").data("kendoExtNumericTextBox").value();
    if(usrSbstAmt == null){
        usrSbstAmt = 0;
        $("#usrSbstAmt").data("kendoExtNumericTextBox").value(0.00);
    }
    $("#sbstAmt").data("kendoExtNumericTextBox").value( Number(usrSbstAmt) * -1 );

    // 중고차 기업보조금
    var subsidyAmt = $("#subsidyAmt").data("kendoExtNumericTextBox").value();
    if(subsidyAmt == null){
        subsidyAmt = 0;
        $("#subsidyAmt").data("kendoExtNumericTextBox").value(0.00);
    }

    bf_sumCarAmt();
}

// 번호판 등록처리
/*
bf_addRegAmt = function(){
    var regPreAmt = $("#regPreAmt").data("kendoExtNumericTextBox").value();
    if(regPreAmt == null){
        regPreAmt = 0;
        $("#regPreAmt").data("kendoExtNumericTextBox").value(0.00);
    }
    $("#aapAmt").data("kendoExtNumericTextBox").value( regPreAmt );
    bf_sumCarAmt();
}
*/

// 번호판 차익계산
/*
bf_sumRegAmt = function(){
    var purcTaxPreAmt  = $("#purcTaxPreAmt").data("kendoExtNumericTextBox").value();
    var realPurcTaxAmt = $("#realPurcTaxAmt").data("kendoExtNumericTextBox").value();

    if(purcTaxPreAmt == null){
        purcTaxPreAmt = 0;
        $("#purcTaxPreAmt").data("kendoExtNumericTextBox").value(0.00);
    }

    if(realPurcTaxAmt == null){
        realPurcTaxAmt = 0;
        $("#realPurcTaxAmt").data("kendoExtNumericTextBox").value(0.00);
    }

    $("#regDifferenceAmt").data("kendoExtNumericTextBox").value( purcTaxPreAmt - realPurcTaxAmt );
}
*/

// 대행 - 계약금 포함여부
bf_checkAapAmmt = function(obj, uid){
    var uidVal = uid;

    var grid = $("#aapGrid").data("kendoExtGrid");
    var selectRow = grid.dataSource.getByUid(uid);
    if(obj.checked){
        selectRow[obj.id] = "Y";
    }else{
        selectRow[obj.id] = "N";
    }
    selectRow["dirty"] = true;

    var rows = grid.tbody.find("tr");
    var chkAmt = 0;
    $.each(rows, function(idx, row){
        var item = grid.dataItem(row);
        if(item.aapImplyYn == "Y"){
            chkAmt += Number(item.realAapAmt);
        }
    });

    $("#aapAmt").data("kendoExtNumericTextBox").value(chkAmt);
    bf_sumCarAmt();
}
//대행업무 그리드 초기화
function initAapGrid(){
    var grid = $("#aapGrid").data('kendoExtGrid');
    grid.dataSource.data([]);

    var rowNum = 0;
    $.each(aapWorkList, function(index, row){
        if( row["useYn"] == "Y" && row["remark1"] == "P" ){
            grid.dataSource.insert(rowNum, {
                "aapWorkTp":row["cmmCd"]
                ,"realAapAmt":0
                ,"aapImplyYn":"Y"
            }).set("dirty", true);
        }
    });
}


// 보험 : 총금액포함여부 체크
bf_incImplyYn = function(){
  if( $("#incImplyYn").prop('checked') ){
      bf_onIncAmt();
  }else{
      $("#incAmt").data("kendoExtNumericTextBox").value(0.00);
      bf_sumCarAmt();
  }
}

// 보험예상금액
bf_sumIncAmt = function(){
    var incExpcAmt  = $("#incExpcAmt").data("kendoExtNumericTextBox").value();
    var realIncAmt = $("#realIncAmt").data("kendoExtNumericTextBox").value();

    if(incExpcAmt == null){
        incExpcAmt = 0;
        $("#incExpcAmt").data("kendoExtNumericTextBox").value(0.00);
    }

    if(realIncAmt == null){
        realIncAmt = 0;
        $("#realIncAmt").data("kendoExtNumericTextBox").value(0.00);
    }
    $("#incDifferenceAmt").data("kendoExtNumericTextBox").value( incExpcAmt - realIncAmt );
}

//용품Grid 수량 및 값 입력시 계산.
bf_gridSumGoodsAmt = function(){
     var grid = $("#goodsGrid").data("kendoExtGrid");
     var rows = grid.tbody.find("tr");
     var oItem, oRealGoodsAmt = 0;

     rows.each(function(index, row) {
         oItem = grid.dataItem(rows[index]);
        if(oItem.realGoodsAmt != null){
            oRealGoodsAmt += Number(oItem.totAmt);
        }
     });

    $("#goodsTotAmt").data("kendoExtNumericTextBox").value(oRealGoodsAmt);
    $("#goodsAmt").data("kendoExtNumericTextBox").value(oRealGoodsAmt);
    bf_sumCarAmt();
}

// 포인트 금액
bf_sumPointAmt = function(){
    var blueMembershipPointVal  = $("#blueMembershipPointVal").data("kendoExtNumericTextBox").value();

    if(blueMembershipPointVal == null || blueMembershipPointVal < 0){
        blueMembershipPointVal = 0;
        $("#blueMembershipPointVal").data("kendoExtNumericTextBox").value(0);
    }

    // 비율
    var bmRate = Number($("#bluePointApplyRate").val()) ;

    /*
    var bmPointAmt = Number($("#point").data("kendoExtNumericTextBox").value()) / (bmRate * 100) ;

    bmPointAmt = Math.floor(bmPointAmt);
    if( (bmPointAmt - blueMembershipPointVal) < 0 ){
        blueMembershipPointVal = bmPointAmt;
        $("#blueMembershipPointVal").data("kendoExtNumericTextBox").value( bmPointAmt );
        dms.notification.info("<spring:message code='global.lbl.savePoint' var='globalLblSavePoint' /><spring:message code='crm.lbl.amount' var='crmLblAmount' /><spring:message code='sal.info.maxInfoChk' arguments='${globalLblSavePoint},${crmLblAmount}' />");
    }
    $("#tBlueAmount").data("kendoExtNumericTextBox").value( blueMembershipPointVal * bmRate );

    // 포인트 금액
    $("#pointAmt").data("kendoExtNumericTextBox").value( blueMembershipPointVal * -1 );
    */

    var point = Number($("#point").data("kendoExtNumericTextBox").value());

    if( (point - blueMembershipPointVal) < 0 ){
        blueMembershipPointVal = point;
       $("#blueMembershipPointVal").data("kendoExtNumericTextBox").value( point );
        dms.notification.info("<spring:message code='sal.info.usePointChk' />");
    }

    var pointAmt = blueMembershipPointVal * bmRate;
    $("#tBlueAmount").data("kendoExtNumericTextBox").value( pointAmt );
    $("#pointAmt").data("kendoExtNumericTextBox").value( pointAmt * -1 );

    bf_sumCarAmt();
}

// 포인트 조회
function fn_bmPointLoad(custNo){
    $.ajax({
       url :"<c:url value='/sal/cnt/contractMnt/selectBuleMemeberInfoSearch.do' />"
       ,data :JSON.stringify({"dlrCd":dlrCd, "custNo":custNo})
       ,type :'POST'
       ,dataType :'json'
       ,contentType :'application/json'
       ,error :function(jqXHR,status,error) {
           if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }else{
               dms.notification.error(error);
           }
           $("#blueMembershipId").val('');
           $("#blueMembershipNo").val('');
           $("#bluePointApplyRate").val('1');
           $("#mLevel").data("kendoExtDropDownList").value('');
           $("#point").data("kendoExtNumericTextBox").value(0.00);
           $("#regDt").data("kendoExtMaskedDatePicker").value('');
       }
       ,success :function(jqXHR, textStatus) {
           if(jqXHR.IsSuccess){
               if(jqXHR.Data != null){
                    //console.log("BM Point result : ", jqXHR);
                    $("#blueMembershipId").val(dms.string.strNvl(jqXHR.Data.BlueMembership_Id));
                    $("#blueMembershipNo").val(dms.string.strNvl(jqXHR.Data.BlueMembership_No));
                    $("#bluePointApplyRate").val(dms.string.strNvl(jqXHR.Data.Scale));
                    $("#mLevel").data("kendoExtDropDownList").value(dms.string.strNvl(jqXHR.Data.Mlevel));
                    $("#point").data("kendoExtNumericTextBox").value(Number(jqXHR.Data.Point));
                    $("#regDt").data("kendoExtMaskedDatePicker").value(jqXHR.Data.regDt);
                    //$("#blueMembershipNo").val(jqXHR.blueMembershipNo);
                    //console.log("jqXHR.Data.Mlevel : ",jqXHR.Data.Mlevel);
                }else{
                    $("#blueMembershipId").val('');
                    $("#blueMembershipNo").val('');
                    $("#bluePointApplyRate").val('1');
                    $("#mLevel").data("kendoExtDropDownList").value('');
                    $("#point").data("kendoExtNumericTextBox").value(0.00);
                    $("#regDt").data("kendoExtMaskedDatePicker").value('');
                }
           }else{
               dms.notification.error("<spring:message code='sal.lbl.bmPoint'/> : "+ jqXHR.Message);

               $("#blueMembershipId").val('');
               $("#blueMembershipNo").val('');
               $("#bluePointApplyRate").val('1');
               $("#mLevel").data("kendoExtDropDownList").value('');
               $("#point").data("kendoExtNumericTextBox").value(0.00);
               $("#regDt").data("kendoExtMaskedDatePicker").value('');
           }
       }
   });
}

// 딜러조회
bf_dealerSearchPopup = function(){
    return ;
    dealerSearchPopupWin = dms.window.popup({
        windowId :"dealerSearchPopupWin"
        ,title :"<spring:message code='cmm.title.dlrSearch'/>"   // 딜러 조회
        ,modal:true
        , content :{
            url :"<c:url value='/cmm/sci/commonPopup/selectDealerPopup.do'/>"
                , data:{
                    "autoBind" :false
                    ,"dlrCd":$("#sDlrCd").val()
                    ,"closeAfterSelect":true
                    ,"callbackFunc" :function(data){
                        if(data.length >= 1) {
                            $("#dlrCd").val(data[0].dlrCd);
                            $("#dlrNm").val(data[0].dlrNm);
                        }
                    }
                }
        }
    });
}

// 예약판매 조회
function fn_beforeNoSearch(){
    if(readOnlyFlag){ return; }

    var obj = {};
    obj["dlrCd"] = dlrCd;
    obj["saleEmpNo"] = $("#saleEmpNo").val();
    obj["beforeNo"] = $("#beforeNo").val();

    if( $("#custTp").val() == "01" ){
        obj["custNm"] =  $("#vCustNm_01").val();
        obj["custNo"] =  $("#custCd_01").val();
    }else{
        obj["custNm"] =  $("#vCustNm_02").val();
        obj["custNo"] =  $("#custCd_02").val();
    }

    parent.bf_beforeNoSearchPopup(obj);
}
// 예약판매 조회 call back
function bf_beforeNoSearchPopupCallBack(data){
    if(data.length > 0){
        $("#beforeNo").val(dms.string.strNvl(data[0].beforeNo));
        $("#beforeImplyYn").val(dms.string.strNvl(data[0].implyYn));
        if(data[0].implyYn == "Y"){
            $("#reservContAmt").data("kendoExtNumericTextBox").value(data[0].beforeAmt);
        }else{
            $("#reservContAmt").data("kendoExtNumericTextBox").value(0);
        }
        $("#dlReqDt").data("kendoExtMaskedDatePicker").value(kendo.toString(data[0].beforeContractDt, "<dms:configValue code='dateFormat' />"));

        data[0].msPrc = data[0].retlAmt;
        data[0].mathDocTp = data[0].ssnCrnTp;
        data[0].hpNo = data[0].telNo1;
        data[0].telNo = data[0].telNo2;
        bf_customerSet(data);
        bf_vinNoSet(data);
    }
}

// CRM 고객 데이터 조회
bf_searchCustomer = function(sIdNm){

    // 판매기회로 넘어온 고객은 고객변경 불가.
    if($("#saleOpptNo").val() != ""){ return;}

    // 집단판매는 고객정보 변경 불가
    if($("#contractTp").data("kendoExtDropDownList").value() == "G"){ return;}

    // 저장된 고객은 변경불가(2017.03.15)
    if(dms.string.isNotEmpty($("#contractStatCd").val())){ return; }

    var sMngScId = "";
    //if(saleAdminYn != "Y"){   //전체권한자는 고객전체 검색 가능.
        sMngScId = userId;
    //}

    var responseJson = {};
    if( dms.string.trim($("#"+sIdNm).val()).length > 0 ){
        responseJson = dms.ajax.getJson({
            url :"<c:url value='/sal/cnt/contractMnt/selectCrmCustomerInfo.do' />"
            ,data :JSON.stringify({"lastIndex":2, "firstIndex":0, "sDlrCd":dlrCd, "sAddrTp":"02", "sCustNm":$("#"+sIdNm).val(), "sMngScId":sMngScId})
            ,async :false
        });
    }

    if(responseJson != null && responseJson.total == 1){
        bf_customerSet(responseJson.data);
    }else{
        var obj = {};
        obj["sIdNm"] = $("#"+sIdNm).val();
        obj["sMngScId"] = sMngScId;
        obj["sAddrTp"] = "02";
        parent.bf_pSearchCustomer(obj);
    }
}
function bf_customerSet(data){
    var custTp = data[0].custTp;
    $("#custTp").val(custTp);

    if(custTp == "02"){  // 법인
        $("#cust_01").hide();
        $("#cust_02").show();
        $("#personalTxt_02").val("<spring:message code='global.lbl.corporation' />"); //법인
    }
    else{            // 개인
        $("#cust_02").hide();
        $("#cust_01").show();
        $("#personalTxt_01").val("<spring:message code='global.lbl.personal' />"); //개인
    }

    if(dms.string.isNotEmpty(data.blueMembershipNo)){
        fn_bmPointLoad(data[0].custNo);
    }

    $("#custCd_"+custTp).val(data[0].custNo);        // 고객코드
    $("#custNm_"+custTp).val(data[0].custNm);        // 고객명
    $("#vCustNm_"+custTp).val(data[0].custNm);       // 고객명
    $("#taxPayNo_"+custTp).val(data[0].taxpayerNo);  // 납세번호
    $("#purcMngNm_"+custTp).val(dms.string.strNvl(data[0].purcMngNm));    // 구매담당자명
    $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").value(data[0].mathDocTp); // 신분증유형 / 법인유형
    $("#ssnCrnTp_"+custTp).change();
    $("#ssnCrnNo_"+custTp).val(data[0].ssnCrnNo);  // 증서번호
    $("#telNo1_"+custTp).val(data[0].hpNo);        // 전화번호1
    $("#telNo2_"+custTp).val(data[0].telNo);       // 전화번호2
    $("#emailNm_"+custTp).val(data[0].emailNm);    // 이메일명

    // CRM 고객정보 블락요청[2017.03.21 이교진 요청]
    /*
    var blockYn = bf_blockSsnCrnNo(dlrCd, data[0].custNo);
    if(blockYn == "Y"){
        $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").enable(true);
        $("#ssnCrnNo_"+custTp).attr("disabled", false);
    }else{
        $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").enable(false);
        $("#ssnCrnNo_"+custTp).attr("disabled", true);
    }
    */

    $("#sungCd_"+custTp).val(data[0].sungCd);    // 성
    $("#sungNm_"+custTp).val(data[0].sungNm);    // 성
    $("#cityCd_"+custTp).val(data[0].cityCd);    // 시
    $("#cityNm_"+custTp).val(data[0].cityNm);    // 시
    $("#distCd_"+custTp).val(data[0].distCd);    // 구
    $("#distNm_"+custTp).val(data[0].distNm);    // 구
    $("#zipCd_"+custTp).val(data[0].zipCd);      // 우편번호

    if(dms.string.isEmpty(data[0].addrTp)){
        $("#addrTp_"+custTp).data("kendoExtDropDownList").value("02");   //주소유형
    }else{
        $("#addrTp_"+custTp).data("kendoExtDropDownList").value(data[0].addrTp);   //주소유형
    }
    $("#addrTp_"+custTp).data("kendoExtDropDownList").enable(false);

    $("#addrDetlCont_"+custTp).val(data[0].addrDetlCont);   // 상세주소
}

//우편번호 찾기
bf_custZipCodeSearch = function (custTp){
    if(readOnlyFlag){ return; }

    var obj = {};
    obj["custTp"] = custTp;
    obj["sZipCd"] = $("#zipCd_"+custTp).val();
    obj["sValue"] = $("#sungNm_"+custTp).val();
    parent.bf_pSearchZipCode(obj);
}
//우편번호 찾기 call back
function bf_custZipCodeSearchCallBack(data){
    if(data.length > 0){
        var custTp = data[0].custTp;

        $("#zipCd_"+custTp).val(data[0].zipCd);
        $("#sungNm_"+custTp).val(data[0].sungNm);
        $("#sungCd_"+custTp).val(data[0].sungCd);
        $("#cityNm_"+custTp).val(data[0].cityNm);
        $("#cityCd_"+custTp).val(data[0].cityCd);
        $("#distNm_"+custTp).val(data[0].distNm);
        $("#distCd_"+custTp).val(data[0].distCd);
        //$("#addrDetlCont_"+custTp).val('');
     }
}

//용품조회
selectGoodsSearchPopup = function(goodsCd, pkgItemCd){
    var obj = {};
    obj["dlrCd"] = dlrCd;
    obj["carlineCd"] = $("#carlineCd").data("kendoExtDropDownList").value();
    obj["goodsCd"] = goodsCd;
    obj["pkgItemCd"] = pkgItemCd;

    parent.bf_pSearchGoodsSearchPopup(obj);
}
//용품조회 call back
function bf_goodsSearchPopupCallBack(data, type){
    var tData = {};
    var grid = $("#goodsGrid").data("kendoExtGrid");
    var selectItem = grid.dataItem(grid.select());

    if(type == "package"){       // 패키지
        var pkgItemCd = "", isPackageFlag = false;

        for(var i=0; i<data.length; i++){
            tData = data[i];
            pkgItemCd = tData["pkgItemCd"];

            if(i == 0){

                var rowNum = 0;
                var rows = grid.tbody.find("tr");
                $.each(rows, function(index, row) {
                    var rowItem = grid.dataItem(row);

                    if(pkgItemCd == rowItem.pkgItemCd){
                        isPackageFlag = true;
                    }

                    if(selectItem.uid == rowItem.uid ){
                        rowNum = index;
                    }
                });

                if(isPackageFlag){
                    // 동일한 패키지가 존재합니다.
                    dms.notification.info("<spring:message code='sal.info.IsPackageMsg'/>");
                    return false;
                }
                selectItem.set("dlrCd", dlrCd);
                selectItem.set("contractNo", $("#contractNo").val());
                selectItem.set("statCd", "10");
                selectItem.set("goodsCd", tData.itemCd);
                selectItem.set("goodsNm", tData.itemNm);
                selectItem.set("goodsCnt", 1);
                selectItem.set("goodsUnitCd", dms.string.strNvl(tData.stockUnitCd) != "" ? tData.stockUnitCd:tData.itemUnitCd );
                selectItem.set("goodsPrc", Number(tData.itemPrc));
                selectItem.set("dcRate", Number(tData.pkgDetlDcRate));
                selectItem.set("dcAmt",   Number(tData.pkgDetlDcAmt));
                selectItem.set("goodsAmt", Number(tData.pkgDetlDcTotAmt) );
                selectItem.set("realGoodsAmt", Number(tData.pkgDetlDcTotAmt) );
                selectItem.set("eqipCostAmt", 0 );
                selectItem.set("totAmt", Number(tData.pkgDetlDcTotAmt));
                selectItem.set("expcEqipDt", "");
                selectItem.set("eqipPrsnId", "");
                selectItem.set("expcGiEndDt", "");
                selectItem.set("realDlDt", "");
                selectItem.set("pkgItemCd", pkgItemCd);
                selectItem.set("grStrgeCd",   "");
                selectItem.set("giStrgeCd",   tData.strgeCd);
                selectItem.set("eqipEndDt", "");
                selectItem.set("dirty", true);
            }else{
                grid.dataSource.insert(rowNum+i, {
                    "dlrCd":dlrCd
                    ,"contractNo":$("#contractNo").val()
                    ,"statCd":"10"
                    ,"goodsCd":tData.itemCd
                    ,"goodsNm":tData.itemNm
                    ,"goodsCnt":1
                    ,"goodsUnitCd":dms.string.strNvl(tData.stockUnitCd) != "" ? tData.stockUnitCd :tData.itemUnitCd
                    ,"goodsPrc":Number(tData.itemPrc)
                    ,"dcRate":Number(tData.pkgDetlDcRate)
                    ,"dcAmt":Number(tData.pkgDetlDcAmt)
                    ,"goodsAmt":Number(tData.pkgDetlDcTotAmt)
                    ,"realGoodsAmt":Number(tData.pkgDetlDcTotAmt)
                    ,"eqipCostAmt":0
                    ,"totAmt":Number(tData.pkgDetlDcTotAmt)
                    ,"expcEqipDt":""
                    ,"eqipPrsnId":""
                    ,"expcGiEndDt":""
                    ,"realDlDt":""
                    ,"pkgItemCd":pkgItemCd
                    ,"grStrgeCd":""
                    ,"giStrgeCd":tData.strgeCd
                    ,"eqipEndDt":""
                }).set("dirty", true);
            }
        }
    }
    else{

        for(var i=0; i<data.length; i++){
            tData = data[i];

            if(i == 0){
                var rowNum = 0;
                var rows = grid.tbody.find("tr");
                $.each(rows, function(index, row) {
                    var rowItem = grid.dataItem(row);
                    if(selectItem.uid == rowItem.uid ){
                        rowNum = index;
                    }
                });

                selectItem.set("dlrCd", dlrCd);
                selectItem.set("contractNo", $("#contractNo").val());
                selectItem.set("goodsCd", tData.itemCd);
                selectItem.set("goodsNm", tData.itemNm);
                selectItem.set("goodsCnt", 1);
                selectItem.set("goodsUnitCd", dms.string.strNvl(tData.stockUnitCd) != "" ? dms.string.strNvl(tData.stockUnitCd) :dms.string.strNvl(tData.itemUnitCd) );
                selectItem.set("goodsPrc", Number(tData.retlPrc));
                selectItem.set("dcRate", 0);
                selectItem.set("dcAmt", 0);
                selectItem.set("goodsAmt", Number(tData.retlPrc) );
                selectItem.set("realGoodsAmt", Number(tData.retlPrc) * 1);
                selectItem.set("eqipCostAmt", Number(tData.etc2) );
                selectItem.set("totAmt", Number(tData.retlPrc) );
                selectItem.set("expcEqipDt", "");
                selectItem.set("eqipPrsnId", "");
                selectItem.set("expcGiEndDt", "");
                selectItem.set("realDlDt", "");
                selectItem.set("pkgItemCd", "");
                selectItem.set("grStrgeCd", "");
                selectItem.set("giStrgeCd", tData.strgeCd);
                selectItem.set("eqipEndDt", "");
                selectItem.set("dirty", true);
            }else{
                grid.dataSource.insert(rowNum+i, {
                    "dlrCd":dlrCd
                    ,"contractNo":$("#contractNo").val()
                    ,"goodsCd":tData.itemCd
                    ,"goodsNm":tData.itemNm
                    ,"goodsCnt":1
                    ,"goodsUnitCd":dms.string.strNvl(tData.stockUnitCd) != "" ? dms.string.strNvl(tData.stockUnitCd) :dms.string.strNvl(tData.itemUnitCd)
                    ,"goodsPrc":Number(tData.retlPrc)
                    ,"dcRate":0
                    ,"dcAmt":0
                    ,"goodsAmt":Number(tData.retlPrc)
                    ,"realGoodsAmt":Number(tData.retlPrc) * 1
                    ,"eqipCostAmt":Number(tData.etc2)
                    ,"totAmt":Number(tData.retlPrc)
                    ,"expcEqipDt":""
                    ,"eqipPrsnId":""
                    ,"expcGiEndDt":""
                    ,"realDlDt":""
                    ,"pkgItemCd":""
                    ,"grStrgeCd":""
                    ,"giStrgeCd":tData.strgeCd
                    ,"eqipEndDt":""
                }).set("dirty", true);
            }
        }
    }

}

// 보험 item 추가 call back
function bf_incItemPopupCallBack(data, num){
    var grid = $("#incGrid").data("kendoExtGrid");

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
                    "incTp":tData.cmmCd
                   ,"valRecAmt":""
                   ,"incExpcAmt":""
                   ,"realIncAmt":""
                   ,"incPrid":12
                   ,"incStartDt":kendo.parseDate(toDay)
                   ,"incEndDt":kendo.parseDate(eDt)
               }).set("dirty", true);
            }
        }
    }else{
        for(var i=0; i<data.length; i++){
            tData = data[i];
            if(!isincDtlItem(tData.incTp)){
                grid.dataSource.insert(i, {
                    "incTp":tData.incTp
                   ,"valRecAmt":""
                   ,"incExpcAmt":""
                   ,"realIncAmt":""
                   ,"incPrid":12
                   ,"incStartDt":kendo.parseDate(toDay)
                   ,"incEndDt":kendo.parseDate(eDt)
               }).set("dirty", true);
            }
        }
    }

}
// 보험Grid 보험유형 중복체크
function isincDtlItem(iTp){
    var flag = false;
    var grid = $('#incGrid').data('kendoExtGrid');
    var rows = grid.tbody.find("tr");

    rows.each(function(index, row){
        var data = grid.dataItem(row);
        if(iTp == data.incTp){
            flag = true;
        }
    });
    return flag;
}

//보험 : 제3자 책임보험 금액표시
function bf_incAmtTemplate(incTp, amt) {
    if(incTp == "03"){
        return dms.string.strNvl(threeIncTpAmtObj[amt]) == ""?0.00:threeIncTpAmtObj[amt];
    }else{
        return kendo.toString(Number(amt), "n2");
    }
}

//대행업무 item 추가 call back
function bf_aapItemPopupCallBack(data){
    var grid = $("#aapGrid").data("kendoExtGrid");
    var tData = {};

    for(var i=0; i<data.length; i++){
        tData = data[i];
        if(!isAapDtlItem(tData.cmmCd)){
            grid.dataSource.insert(i, {
                "aapWorkTp":tData.cmmCd
               ,"realAapAmt":0
               ,"aapImplyYn" :"Y"
           }).set("dirty", true);
        }
    }
}


//대행업무 Grid 보험유형 중복체크
function isAapDtlItem(iTp){
    var flag = false;
    var grid = $('#aapGrid').data('kendoExtGrid');
    var rows = grid.tbody.find("tr");

    rows.each(function(index, row){
        var data = grid.dataItem(row);
        if(iTp == data.aapWorkTp){
            flag = true;
        }
    });
    return flag;
}



//중고차 VIN NO 조회 검색
bf_searchUsedCarVinNo = function(){
    if( dms.string.strNvl($("#uatcCarPurcYn").data("kendoExtDropDownList").value()) == "N" ){ return ;}

    var obj = {};
    obj["sDlrCd"] = dlrCd;
    obj["sVinNo"] = $("#sUsrVinNo").val().toUpperCase();
    parent.bf_pSearchUsedCarVinNo(obj);
}
//중고차 vin no call back
function bf_searchUsedCarVinNoCallBack(data){
    $("#sUsrVinNo").val(dms.string.strNvl(data[0].vinNo));
    $("#usrVinNo").val(dms.string.strNvl(data[0].vinNo));
    $("#purcNo").val(dms.string.strNvl(data[0].purcNo));

    $("#usrSbstAmt").data("kendoExtNumericTextBox").value(Number(data[0].purcTotAmt));
    bf_addUsrSbstAmt();
}
$("#sUsrVinNo").keyup(function(e){
    if (e.keyCode == 13) {
        if($(this).val() != "") {
            bf_searchUsedCarVinNo();
        }
    }else{
        if(dms.string.strNvl($("#sUsrVinNo").val().toUpperCase()) != dms.string.strNvl($("#usrVinNo").val().toUpperCase()) ){
            $("#usrVinNo").val('');
        }
    }
});


//신차 VIN NO 조회 검색
bf_searchVinNo = function(){
    if(readOnlyFlag){ return; }

    var responseJson = {};
    if( dms.string.trim($("#sVinNo").val()).length > 0 ){
        responseJson = dms.ajax.getJson({
            url :"<c:url value='/sal/cnt/contractMnt/selectContractReVinNoSearch.do' />"
            ,data :JSON.stringify({"lastIndex":2, "firstIndex":0
                    , "sDlrCd":dlrCd
                    , "sVinNo":$("#sVinNo").val().toUpperCase()
                    , "sCarlineCd" :$("#carlineCd").data("kendoExtDropDownList").value()
                    , "sFscCd" :$("#fscCd").data("kendoExtDropDownList").value()
                    , "sModelCd":$("#modelCd").val()
                    , "sOcnCd" :$("#ocnCd").data("kendoExtDropDownList").value()
                    , "sExtColorCd" :$("#extColorCd").data("kendoExtDropDownList").value()
                    , "sIntColorCd" :$("#intColorCd").data("kendoExtDropDownList").value()
                  })
            ,async :false
        });
    }

    if(responseJson != null && responseJson.total == 1){

        // block된 차량은 선택이 불가능 합니다.
        /*
        if(dms.string.strNvl(saleAdminYn) == "N"
            && dms.string.strNvl(saleEmpYn) == "Y"
            && responseJson.data[0].blockYn == "Y"
            && responseJson.data[0].blockSaleAdvNo != dms.string.strNvl(userId)
        ){
            dms.notification.info("<spring:message code='sal.info.blockStateMsg'/>");
            return;
        }
        */

        if( dms.string.isEmpty($("#contractNo").val()) || dms.string.strNvl($("#contractNo").val()) != dms.string.strNvl(responseJson.data[0].contractNo)){
            if( dms.string.strNvl(responseJson.data[0].blockSaleAdvNo) != ""
             && responseJson.data[0].blockSaleAdvNo != dms.string.strNvl(userId)){  // 판매고문 지정
                  // block된 차량은 선택이 불가능 합니다.
                  dms.notification.info("<spring:message code='sal.info.blockStateMsg'/>");
                  return false;
            }
            if(responseJson.data[0].damageCd == "01"){      // 차량 손상
                // 손상된 차량은 선택이 불가능 합니다.
                dms.notification.info("<spring:message code='sal.info.damageBlockMsg'/>");
                return false;
            }
            if(responseJson.data[0].ownStatCd == "A"){      // 차량 배정
                // 고객명, 계약번호 이 차량을 점용했습니다.
                dms.notification.info("<spring:message code='global.lbl.customer'/> "+responseJson.data[0].custNm+","+responseJson.data[0].contractNo+"<spring:message code='sal.info.carPrivateMsg'/>");
                return false;
            }
            if(responseJson.data[0].expAprYn == "Y"){       // 이상출고 통과된 차량
                // 고객명, 계약번호 이 차량을 점용했습니다.
                dms.notification.info("<spring:message code='global.lbl.customer'/> "+responseJson.data[0].custNm+","+responseJson.data[0].contractNo+"<spring:message code='sal.info.carPrivateMsg'/>");
                return false;
            }
        }

        bf_vinNoSet(responseJson.data);
    }else{
        var obj = {"sDlrCd" :dlrCd
                 , "sCarlineCd" :$("#carlineCd").data("kendoExtDropDownList").value()
                 , "sCarlineNm" :$("#carlineCd").data("kendoExtDropDownList").text()
                 , "sFscCd" :$("#fscCd").data("kendoExtDropDownList").value()
                 , "sFscNm" :$("#fscCd").data("kendoExtDropDownList").text()
                 , "sModelCd":$("#modelCd").val()
                 , "sOcnCd" :$("#ocnCd").data("kendoExtDropDownList").value()
                 , "sOcnNm" :$("#ocnCd").data("kendoExtDropDownList").text()
                 , "sExtColorCd" :$("#extColorCd").data("kendoExtDropDownList").value()
                 , "sExtColorNm" :$("#extColorCd").data("kendoExtDropDownList").text()
                 , "sIntColorCd" :$("#intColorCd").data("kendoExtDropDownList").value()
                 , "sIntColorNm" :$("#intColorCd").data("kendoExtDropDownList").text()
                 , "sVinNo":$("#sVinNo").val().toUpperCase()
                 , "sContractNo":$("#contractNo").val()
                };

        parent.bf_pSearchVinNo(obj);
    }

}
function bf_vinNoSet(data){
    if(dms.string.strNvl(data[0].vinNo) != ""){
        //$("#sVinNo2").val(data[0].vinNo.substring(11,17));
        $("#sVinNo").val(data[0].vinNo);
    }
    $("#vinNo").val(dms.string.strNvl(data[0].vinNo));
    //$("#carRetlAmt").data("kendoExtNumericTextBox").value(data[0].retlPrc);
    $("#retlAmt").data("kendoExtNumericTextBox").value(Number(data[0].msPrc));

    if($("#carlineCd").data("kendoExtDropDownList").value() != dms.string.strNvl(data[0].carlineCd)){
        $("#carlineCd").data("kendoExtDropDownList").value(dms.string.strNvl(data[0].carlineCd));
    }

    if( dms.string.isEmpty($("#fscCd").data("kendoExtDropDownList").value())
            || $("#fscCd").data("kendoExtDropDownList").value() != dms.string.strNvl(data[0].fscCd)){
       var fscCd = $("#fscCd").data("kendoExtDropDownList");
       fscCd.setDataSource([{fscNm:dms.string.strNvl(data[0].fscNm), fscCd:dms.string.strNvl(data[0].fscCd)}]);
       fscCd.value(dms.string.strNvl(data[0].fscCd));
       fscCd.enable(false);
    }

    if( dms.string.isEmpty($("#ocnCd").data("kendoExtDropDownList").value())
            || $("#ocnCd").data("kendoExtDropDownList").value() != dms.string.strNvl(data[0].ocnCd)){
       var ocnCd = $("#ocnCd").data("kendoExtDropDownList");
       ocnCd.setDataSource([{ocnNm:dms.string.strNvl(data[0].ocnNm), ocnCd:dms.string.strNvl(data[0].ocnCd)}]);
       ocnCd.value(dms.string.strNvl(data[0].ocnCd));
       ocnCd.enable(false);
    }

    $("#modelCd").val(dms.string.strNvl(data[0].modelCd));

    if( dms.string.isEmpty($("#extColorCd").data("kendoExtDropDownList").value())
            || $("#extColorCd").data("kendoExtDropDownList").value() != dms.string.strNvl(data[0].extColorCd)){
       var extColorCd = $("#extColorCd").data("kendoExtDropDownList");
       extColorCd.setDataSource([{extColorNm:dms.string.strNvl(data[0].extColorNm), extColorCd:dms.string.strNvl(data[0].extColorCd)}]);
       extColorCd.value(dms.string.strNvl(data[0].extColorCd));
       extColorCd.enable(false);
    }

    if( dms.string.isEmpty($("#intColorCd").data("kendoExtDropDownList").value())
            || $("#intColorCd").data("kendoExtDropDownList").value() != data[0].intColorCd){
       var intColorCd = $("#intColorCd").data("kendoExtDropDownList");
       intColorCd.setDataSource([{intColorNm:dms.string.strNvl(data[0].intColorNm), intColorCd:dms.string.strNvl(data[0].intColorCd)}]);
       intColorCd.value(dms.string.strNvl(data[0].intColorCd));
       intColorCd.enable(false);
    }

    // 금융상품
    if( $("#fincReqYn").val() == "Y"){
        var fincCmpCd = $("#fincCmpCd").data("kendoExtDropDownList").value();
        if( fincCmpCd === "BHAF" ){
        	debugger;
            $("#fincItemCd").data("kendoExtDropDownList").setDataSource(fincBHAFItemObj[dms.string.strNvl(data[0].carlineCd)]);
        }else{
            $("#fincItemCd").data("kendoExtDropDownList").setDataSource(fincItemObj[dms.string.strNvl(data[0].carlineCd)]);
        }
    }

    // 소매, 도매가
    //$("#whslAmt").data("kendoExtNumericTextBox").value(Number(data[0].whPrc));
    $("#retlAmt").data("kendoExtNumericTextBox").value(Number(data[0].msPrc));
    //$("#realCarAmt").data("kendoExtNumericTextBox").value(Number(data[0].msPrc));
    $("#realCarAmt").data("kendoExtNumericTextBox").value(0);  // 순차량금액
    bf_addDcRealAmt();
}

$("#sVinNo").keyup(function(e){
    if (e.keyCode == 13) {
        if($(this).val() != "") {
            bf_searchVinNo();
        }
    }
    if($(this).val() == ""){
        $("#vinNo").val("");
    }

});

// 증서유형, 증서번호 수정 제한.
function bf_blockSsnCrnNo(dlrCd, custNo){
    if(dms.string.isEmpty(custNo)){
        return false;
    }

    var responseJson = dms.ajax.getJson({
        url :"<c:url value='/sal/cnt/contractMnt/selectAbleToEditSsnCrnNoSearch.do' />"
        ,data :JSON.stringify({"dlrCd":dlrCd, "contractCustNo":custNo})
        ,async :false
    });

    return dms.string.strNvl(responseJson);
}


//예판번호 취소
function bf_initBeforeNo(){
    if(readOnlyFlag){ return; }

    $("#beforeNo").val("");
    $("#beforeImplyYn").val("N");
    $("#reservContAmt").data("kendoExtNumericTextBox").value(0.00);
    bf_sumCarAmt();
}

//임시배정 취소
function bf_initVinNo(){
    if(readOnlyFlag){ return; }

    if($("#contractTp").data("kendoExtDropDownList").value() == "D"){
        return ;
    }

    $("#carlineCd").data("kendoExtDropDownList").value("");

    $("#fscCd").data("kendoExtDropDownList").setDataSource([]);
    $("#fscCd").data("kendoExtDropDownList").enable(false);

    $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
    $("#ocnCd").data("kendoExtDropDownList").enable(false);

    $("#modelCd").val("");

    $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#extColorCd").data("kendoExtDropDownList").enable(false);

    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    // 금융-금융사 DataSet재설정
    $("#fincCmpCd").change();

    $("#retlAmt").data("kendoExtNumericTextBox").value(0);         // 지도가
    //$("#promotionAmt").data("kendoExtNumericTextBox").value(0);    // 프로모션 :치환차감
    $("#promotionAmt").val(0);
    bf_sumCarAmt();

    $("#sVinNo").val('');  // Vin_No
    $("#vinNo").val('');    // vin no
}

//판매기회, 집단판매 CRM고객정보 갱신 조회
function bf_crmCustSearch(){
    var sCustTp = $("#custTp").val();
    var sCustCd = $("#custCd_"+sCustTp).val();

    $.ajax({
        url :"<c:url value='/sal/cnt/contractRe/selectCrmCustomerInfo.do' />"
        ,data :JSON.stringify({"sDlrCd":dlrCd, "sAddrTp":"02", "sCustNo":sCustCd})
        ,type :'POST'
        ,dataType :'json'
        ,contentType :'application/json'
        ,error :function(jqXHR,status,error) {
            dms.notification.error(error);
        }
        ,success :function(jqXHR, textStatus) {
            bf_customerSet(jqXHR);
        }
    });
}

//견적 버튼 클릭
bf_clickEstimate = function (){
    /*
    // [TOBE] 인터페이스로 견적정보 불러옴. - 임시 화면
    popupWindow = dms.window.popup({
        windowId:"fincInfoItemPopup"
        , title:"<spring:message code='sal.title.fincEstimate' />"   // 금융상품 견적
        , height:600
        , content:{
            url:"https://m.bhaf-bhmc.com.cn/buy/calculator"
        }
    });
    */
    open("https://www.bhaf-bhmc.com.cn/", "<spring:message code='sal.title.fincEstimate' />", 'top=0,left=0,width=950,height=500,toolbar=no,menubar=no,location=no,status=yes,directories=yes,resizable=yes,scrolling=yes,scrollbars=1');

}

/** 무결성 검사 **/
function save_Validate(){

    // 계약일
    if($("#contractDt").data("kendoExtMaskedDatePicker").value() == "" ){
        dms.notification.info("<spring:message code='global.lbl.contractDt' var='globalLblContractDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblContractDt}' />");
        $("#contractDt").focus();
        return false;
    }

    if( dms.string.strNvl($("#contractNo").val()) == ""
            && kendo.toString($("#contractDt").data("kendoExtMaskedDatePicker").value(),"yyyy-MM-dd") < toDay ){
        // {계약일자}은 {현재일자}보다 작을 수 없습니다.
        dms.notification.info("<spring:message code='global.lbl.contractDt' var='globalLblContractDt' /><spring:message code='sal.lbl.toDay' var='salLblToDay' /><spring:message code='sal.info.CheckDateForm' arguments='${globalLblContractDt},${salLblToDay}' />");
        $("#contractDt").focus();
        return false;
    }

    // 계약유형
    if( dms.string.isEmpty($("#contractTp").data("kendoExtDropDownList").value())){
        dms.notification.info("<spring:message code='global.lbl.contractType' var='globalLblContractType' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblContractType}' />");
        $("#contractTp").focus();
        return false;
    }

    // 인도요청일
    if( dms.string.isEmpty($("#dlReqDt").data("kendoExtMaskedDatePicker").value())){
        dms.notification.info("<spring:message code='global.lbl.dlReqDt' var='globalLblDlReqDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblDlReqDt}' />");
        $("#dlReqDt").focus();
        return false;
    }

    // 판매담당자
    if( dms.string.isEmpty($("#saleEmpNo").data("kendoExtDropDownList").value())){
        dms.notification.info("<spring:message code='global.lbl.salPrsnNm' var='globalLblSalPrsnNm' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblSalPrsnNm}' />");
        $("#saleEmpNo").data("kendoExtDropDownList").focus();
        return false;
    }

    // 채널유형
    if(dms.string.isEmpty($("#dstbChnCd").data("kendoExtDropDownList").value())){
        dms.notification.info("<spring:message code='sal.lbl.channelType' var='salLblChannelType' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblChannelType}' />");
        $("#dstbChnCd").data("kendoExtDropDownList").focus();
        return false;
    }

    var custTp = $("#custTp").val();
    if( $("#custCd_"+custTp).val() == ""){
        // {고객}를(을) 선택해주세요. : 계약고객
        dms.notification.info("<spring:message code='global.lbl.customer' var='globalLblCustomer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCustomer}' />");
        $("#custCd_"+custTp == "" ? "01" :custTp).focus();
        return false;
    }

    if( dms.string.isEmpty($("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").value())){
        // {ID유형}를(을) 선택해주세요. : 계약고객
        dms.notification.info("<spring:message code='global.lbl.mathDocTp' var='globalLblMathDocTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblMathDocTp}' />");
        $("#ssnCrnTp_"+custTp == "" ? "01" :custTp).focus();
        return false;
    }

    if( dms.string.isEmpty($("#ssnCrnNo_"+custTp).val())){
        // {증서번호}를(을) 선택해주세요. : 계약고객
        dms.notification.info("<spring:message code='sal.lbl.ssnCrnNo' var='salLblSsnCrnNo' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblSsnCrnNo}' />");
        $("#ssnCrnNo_"+custTp == "" ? "01" :custTp).focus();
        return false;
    }

    if(custTp == "01"
            && $("#ssnCrnTp_01").data("kendoExtDropDownList").value() == "01"
            && ($("#ssnCrnNo_01").val().length != 15 && $("#ssnCrnNo_01").val().length != 18 )
       ){
        // {증서번호}의 자릿수를 확인해주세요.
        dms.notification.info("<spring:message code='sal.lbl.ssnCrnNo' var='salLblSsnCrnNo' /><spring:message code='sal.info.lengthCheckMsg' arguments='${salLblSsnCrnNo}' />");
        $("#ssnCrnTp_01").focus();
        return false;
    }

    if(custTp == "01"
            && $("#ssnCrnTp_01").data("kendoExtDropDownList").value() != "01" && $("#ssnCrnNo_01").val().length > 20 ){
        // {증서번호}의 자릿수를 확인해주세요.
        dms.notification.info("<spring:message code='sal.lbl.ssnCrnNo' var='salLblSsnCrnNo' /><spring:message code='sal.info.lengthCheckMsg' arguments='${salLblSsnCrnNo}' />");
        $("#ssnCrnTp_01").focus();
        return false;
    }

    if(custTp == "02"
            && $("#ssnCrnTp_02").data("kendoExtDropDownList").value() == "08"
            && $("#ssnCrnNo_02").val().length > 10 ){
        // {증서번호}의 자릿수를 확인해주세요.
        dms.notification.info("<spring:message code='sal.lbl.ssnCrnNo' var='salLblSsnCrnNo' /><spring:message code='sal.info.lengthCheckMsg' arguments='${salLblSsnCrnNo}' />");
        $("#ssnCrnTp_02").focus();
        return false;
    }

    if(custTp == "02"
            && $("#ssnCrnTp_02").data("kendoExtDropDownList").value() == "10"
            && $("#ssnCrnNo_02").val().length > 18 ){
        // {증서번호}의 자릿수를 확인해주세요.
        dms.notification.info("<spring:message code='sal.lbl.ssnCrnNo' var='salLblSsnCrnNo' /><spring:message code='sal.info.lengthCheckMsg' arguments='${salLblSsnCrnNo}' />");
        $("#ssnCrnTp_02").focus();
        return false;
    }

    if(dms.string.isEmpty($("#telNo1_"+custTp).val())){
        // {이동전화}을(를) 입력해주세요.
        dms.notification.info("<spring:message code='global.lbl.hpNo' var='globalLblHpNo' /><spring:message code='global.info.emptyCheckParam' arguments='${globalLblHpNo}' />");
        $("#telNo1_"+custTp).focus();
        return false;
    }

    if(dms.string.isEmpty($("#addrTp_"+custTp).data("kendoExtDropDownList").value())){
        // {주소유형}을(를) 입력해주세요.
        dms.notification.info("<spring:message code='sal.lbl.addrTp' var='salLblAddrTp' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblAddrTp}' />");
        $("#addrTp_"+custTp).focus();
        return false;
    }

    if(dms.string.isEmpty($("#sungCd_"+custTp).val())){
        // {성}을(를) 입력해주세요.
        dms.notification.info("<spring:message code='global.lbl.sung' var='globalLblSung' /><spring:message code='global.info.emptyCheckParam' arguments='${globalLblSung}' />");
        $("#sungCd_"+custTp).focus();
        return false;
    }

    if(dms.string.isEmpty($("#cityCd_"+custTp).val())){
        // {시}을(를) 입력해주세요.
        dms.notification.info("<spring:message code='sal.lbl.cityCd' var='salLblCityCd' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblCityCd}' />");
        $("#cityCd_"+custTp).focus();
        return false;
    }

    if(dms.string.isEmpty($("#distCd_"+custTp).val())){
        // {구}을(를) 입력해주세요.
        dms.notification.info("<spring:message code='sal.lbl.dist' var='salLblDist' /><spring:message code='global.info.emptyCheckParam' arguments='${salLblDist}' />");
        $("#distCd_"+custTp).focus();
        return false;
    }

    if(dms.string.isEmpty($("#zipCd_"+custTp).val())){
        // {우편번호}을(를) 입력해주세요.
        dms.notification.info("<spring:message code='global.lbl.zipCd' var='globalLblZipCd' /><spring:message code='global.info.emptyCheckParam' arguments='${globalLblZipCd}' />");
        $("#zipCd_"+custTp).focus();
        return false;
    }

    if(dms.string.isEmpty($("#addrDetlCont_"+custTp).val())){
        // {상세주소}을(를) 입력해주세요.
        dms.notification.info("<spring:message code='global.lbl.detlAddr' var='globalLblDetlAddr' /><spring:message code='global.info.emptyCheckParam' arguments='${globalLblDetlAddr}' />");
        $("#addrDetlCont_"+custTp).focus();
        return false;
    }

    if( dms.string.strNvl($("#sVinNo").val()) != dms.string.strNvl($("#vinNo").val()) ){
        // VIN번호가 맞는지 확인해주세요.
        dms.notification.info("<spring:message code='sal.info.vinCheck' />");
        $("#sVinNo").focus();
        return false;
    }

    // 차종
    if( dms.string.isEmpty($("#carlineCd").data("kendoExtDropDownList").value()) ){
        dms.notification.info("<spring:message code='global.lbl.carLine' var='globalLblCarLine' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCarLine}' />");
        $("#carlineCd").focus();
        return false;
    }

    // 차관
    /*
    if( dms.string.isEmpty($("#fscCd").data("kendoExtDropDownList").value())
            && dms.string.isEmpty($("#ocnCd").data("kendoExtDropDownList").value()) ){
        dms.notification.info("<spring:message code='global.lbl.model' var='globalLblModel' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblModel}' />");
        $("#fscCd").focus();
        return false;
    }
    */

    // ocn
    /*
    if(dms.string.isEmpty($("#ocnCd").data("kendoExtDropDownList").value()) ){
        dms.notification.info("<spring:message code='global.lbl.ocn' var='globalLblOcn' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblOcn}' />");
        $("#ocnCd").focus();
        return false;
    }

    // 외색
    if(dms.string.isEmpty($("#extColorCd").data("kendoExtDropDownList").value())){
        dms.notification.info("<spring:message code='global.lbl.extColor' var='globalLblExtColor' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblExtColor}' />");
        $("#extColorCd").focus();
        return false;
    }

    // 내색
    if(dms.string.isEmpty($("#intColorCd").data("kendoExtDropDownList").value())){
        dms.notification.info("<spring:message code='global.lbl.intColor' var='globalLblIntColor' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblIntColor}' />");
        $("#intColorCd").focus();
        return false;
    }

    // 지불방식
    if( dms.string.isEmpty($("#payTp").data("kendoExtDropDownList").value())){
        // {지불방식}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='sal.lbl.payTp' var='salLblPayTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblPayTp}' />");
        $("#payTp").focus();
        return false;
    }
    */

    //순차량금액
    if( Number($("#realCarAmt").data("kendoExtNumericTextBox").value()) <= 0  ){
        dms.notification.info("<spring:message code='sal.lbl.realCarAmts' var='salLblRealCarAmts' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblRealCarAmts}' />");
        $("#realCarAmt").focus();
        return false;
    }

    // 실판매 금액
    if( Number($("#realPayAmt").data("kendoExtNumericTextBox").value()) <= 0  ){
        dms.notification.info("<spring:message code='sal.lbl.realPayAmts' var='salLblRealPayAmts' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblRealPayAmts}' />");
        $("#realCarAmt").focus();
        return false;
    }

    // 보험서비스
    if($("#incAapTp").val() == "A"){
        // 보험 예상총액
        if( Number($("#incExpcAmt").data("kendoExtNumericTextBox").value()) <= 0 ){
            dms.notification.info("<spring:message code='sal.lbl.incExpcsAmt' var='salLblIncExpcsAmt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblIncExpcsAmt}' />");
            $("#incExpcAmt").focus();
            return false;
        }

        // 보험회사
        if(dms.string.strNvl($("#incCmpCd").data("kendoExtDropDownList").value()) == ""){
            dms.notification.info("<spring:message code='global.lbl.incCmp' var='globalLblIncCmp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblIncCmp}' />");
            $("#incCmpCd").focus();
            return false;
        }
    }

    // 금융
    if($("#fincReqYn").val() == "Y"){
        // 금융-vinNo 필수
        /*
        if(dms.string.isEmpty($("#vinNo").val())){
            dms.notification.info("<spring:message code='sal.lbl.carVinNo' var='salLblCarVinNo' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblCarVinNo}' />");
            $("#sVinNo").focus();
            return false;
        }
        */
        // 금융사
        if( dms.string.strNvl($("#fincCmpCd").data("kendoExtDropDownList").value()) == "" ){
            dms.notification.info("<spring:message code='global.lbl.fincCmp' var='globalLblFincCmp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblFincCmp}' />");
            $("#tabstrip").data("kendoExtTabStrip").select(2);
            return false;
        }
    }

    // 중고차 치환
    if(dms.string.strNvl($("#uatcCarPurcYn").data("kendoExtDropDownList").value()) == "Y"){
        if($("#usrVinNo").val().toUpperCase() == "" && $("#sUsrVinNo").val().toUpperCase() == "" ){
            // VIN NO 을(를) 올바르게 입력하여 주십시오.
            dms.notification.info("<spring:message code='global.lbl.vinNum' var='globalLblVinNum' /><spring:message code='global.info.validation.pattern' arguments='${globalLblVinNum}' />");
            $("#tabstrip").data("kendoExtTabStrip").select(3);
            $("#sUsrVinNo").focus();
            return false;
        }

        if($("#purcNo").val() == ""){
            // 매입번호 을(를) 올바르게 입력하여 주십시오.
            dms.notification.info("<spring:message code='sal.lbl.documentNo' var='salLblDocumentNo' /><spring:message code='global.info.validation.pattern' arguments='${salLblDocumentNo}' />");
            $("#tabstrip").data("kendoExtTabStrip").select(3);
            $("#purcNo").focus();
            return false;
        }
    }

    // 번호판 등록서비스
    if($("#regTp").val() == "A"){

    }

    return true;
}

/**
 * 직책별 할인금액 관리.
 */
function dlrPromotionAmtChk(mFlag){

    /** 무결성 검사 **/
    if( !save_Validate() ){
       return false;
    }

    var param = {
            "sStartContractDt" :$("#contractDt").data("kendoExtMaskedDatePicker").value()
            ,"sCarlineCd" :$("#carlineCd").data("kendoExtDropDownList").value()
            ,"sModelCd" :$("#modelCd").val()
            ,"sOcnCd" :$("#ocnCd").data("kendoExtDropDownList").value()
            //, "sPromotionAmt" :Number($("#promotionAmt").data("kendoExtNumericTextBox").value())
            , "sPromotionAmt" :Number($("#promotionAmt").val())
    }

    $.ajax({
        url :"<c:url value='/sal/cnt/contractMnt/selectDlrDcLevel.do' />"
        ,data :JSON.stringify(param)
        ,type :'POST'
        ,dataType :'json'
        ,contentType :'application/json'
        ,async :false
        ,error :function(jqXHR,status,error) {
            dms.notification.error(error);
        }
        ,success :function(jqXHR, textStatus) {
           if(jqXHR != null && jqXHR.total > 0
             && dms.string.strNvl(jqXHR.data[0].prcNregYn) == "Y" && dms.string.isNotEmpty(jqXHR.data[0].dcLvlCd) ){

               dms.window.confirm({
                   message:"["+ dms.string.strNvl(dcLvlCdObj[jqXHR.data[0].dcLvlCd]) +"] <spring:message code='sal.lbl.dcLvMsg' /> \n <spring:message code='sal.lbl.isContinueMsg' />"
                   ,title :"<spring:message code='global.lbl.info' />"
                   ,callback:function(result){
                       if(result){
                           $("#dcLvlCd").val(jqXHR.data[0].dcLvlCd);
                           $("#dcApproveYn").val("Y");
                           save(mFlag);
                       }else{
                           return false;
                       }
                   }
               });

           }else{
               save(mFlag);
           }
        }
    });
}


/*********
 * 저장
 *********/
function save(mFlag){
    /** 무결성 검사 **/
    //if( !save_Validate() ){
    //   return false;
    //}
    dms.loading.show();     // 로딩 시작

    var incGrid = $("#incGrid").data("kendoExtGrid");
    var incRows = incGrid.tbody.find("tr")
      , incList = [];
    incRows.each(function(index, row) {
        var row = incGrid.dataItem(row);
        incList.push(row);
    });

    var aapGrid = $("#aapGrid").data("kendoExtGrid");
    var aapRows = aapGrid.tbody.find("tr")
      , aapList = [];
    aapRows.each(function(index, row) {
        var row = aapGrid.dataItem(row);
        aapList.push(row);
    });

    var param = {
        "contractReVO" :$("#contForm").serializeObject($("#contForm").serializeArrayInSelector("[data-json-obj='true']"))
        ,"goodsVO" :$("#goodsGrid").data("kendoExtGrid").getCUDData("insertGoodsList", "updateGoodsList", "deleteGoodsList")
        ,"incVO" :{"insertIncList":incList}
        ,"aapsVO" :{"insertList":aapList}
        ,"multiFlag" :mFlag
    };

    if( $("#contractStatCd").val() == "" ){
        param.contractReVO.contractStatCd = "10";
    }

    if( $("#usrVinNo").val() == "" ){
        param.contractReVO.usrVinNo = $("#sUsrVinNo").val().toUpperCase();
    }

    param.contractReVO.saleEmpNo = $("#saleEmpNo").data("kendoExtDropDownList").value();           // 판매인
    param.contractReVO.contractTp = $("#contractTp").data("kendoExtDropDownList").value();
    param.contractReVO.dstbChnCd = $("#dstbChnCd").data("kendoExtDropDownList").value();           // 채널유형

    param.contractReVO.contractDt = $("#contractDt").data("kendoExtMaskedDatePicker").value();           // 계약일
    param.contractReVO.dlReqDt = $("#dlReqDt").data("kendoExtMaskedDatePicker").value();                 // 인도요청일
//    param.contractReVO.regExpcDt = $("#regExpcDt").data("kendoExtMaskedDatePicker").value();             // 등록예상일자
    param.contractReVO.fincReqDt = $("#fincReqDt").data("kendoExtMaskedDatePicker").value();             // 신청일자
    param.contractReVO.fincEndDt = $("#fincEndDt").data("kendoExtMaskedDatePicker").value();             // 만기일자

    // 금액
    param.contractReVO.realAmt  = $("#realAmt").data("kendoExtNumericTextBox").value();
    param.contractReVO.reservContAmt = $("#reservContAmt").data("kendoExtNumericTextBox").value();
    param.contractReVO.goodsAmt = $("#goodsAmt").data("kendoExtNumericTextBox").value();
    param.contractReVO.incAmt   = $("#incAmt").data("kendoExtNumericTextBox").value();
    param.contractReVO.sbstAmt  = $("#sbstAmt").data("kendoExtNumericTextBox").value();
    param.contractReVO.aapAmt   = $("#aapAmt").data("kendoExtNumericTextBox").value();
    param.contractReVO.pointAmt = $("#pointAmt").data("kendoExtNumericTextBox").value();
    //param.contractReVO.promotionAmt = $("#promotionAmt").data("kendoExtNumericTextBox").value();
    param.contractReVO.promotionAmt = Number($("#promotionAmt").val());
    param.contractReVO.realPayAmt   = $("#realPayAmt").data("kendoExtNumericTextBox").value();

    // 차종
    param.contractReVO.carlineCd  = $("#carlineCd").data("kendoExtDropDownList").value();
    param.contractReVO.fscCd      = $("#fscCd").data("kendoExtDropDownList").value();
    param.contractReVO.modelCd    = $("#modelCd").val();
    param.contractReVO.ocnCd      = $("#ocnCd").data("kendoExtDropDownList").value();
    param.contractReVO.extColorCd = $("#extColorCd").data("kendoExtDropDownList").value();
    param.contractReVO.intColorCd = $("#intColorCd").data("kendoExtDropDownList").value();

    // 계약고객정보
    var custTp = $("#custTp").val();
    param.contractReVO.custTp = custTp;                             // 고객유형
    param.contractReVO.custCd = $("#custCd_"+custTp).val();         // 고객코드
    param.contractReVO.contractCustNo = $("#custCd_"+custTp).val(); // 고객코드 0201T

    param.contractReVO.custNm = $("#custNm_"+custTp).val();         // 고객명
    param.contractReVO.taxPayNo = $("#taxPayNo_"+custTp).val();     // 납세번호
    param.contractReVO.purcMngNm = $("#purcMngNm_"+custTp).val();   // 구매담당자명
    param.contractReVO.ssnCrnTp = $("#ssnCrnTp_"+custTp).val();     //신분증유형
    param.contractReVO.ssnCrnNo = $("#ssnCrnNo_"+custTp).val();     //증서번호
    param.contractReVO.telNo1 = $("#telNo1_"+custTp).val();         // 전화번호1
    param.contractReVO.telNo2 = $("#telNo2_"+custTp).val();         // 전화번호2
    //param.contractReVO.emailNm = $("#emailNm_"+custTp).val();
    param.contractReVO.emailNm = "";
    param.contractReVO.sungNm = $("#sungNm_"+custTp).val();
    param.contractReVO.sungCd = $("#sungCd_"+custTp).val();
    param.contractReVO.cityNm = $("#cityNm_"+custTp).val();
    param.contractReVO.cityCd = $("#cityCd_"+custTp).val();
    param.contractReVO.distNm = $("#distNm_"+custTp).val();
    param.contractReVO.distCd = $("#distCd_"+custTp).val();
    param.contractReVO.zipCd  = $("#zipCd_"+custTp).val();          // 우편번호
    param.contractReVO.addrTp = $("#addrTp_"+custTp).data("kendoExtDropDownList").value(); //주소유형
    param.contractReVO.addrDetlCont  = $("#addrDetlCont_"+custTp).val();          // 주소

    // 실운전자
    param.contractReVO.realDriverSameYn = "Y";
    param.contractReVO.drvCustTp = custTp;                            // 고객유형
    param.contractReVO.drvCustCd = $("#custCd_"+custTp).val();        // 고객코드
    param.contractReVO.realDriverCustNo = $("#custCd_"+custTp).val(); // 고객코드 0201T

    param.contractReVO.drvCustNm    = $("#custNm_"+custTp).val();     // 고객명
    param.contractReVO.drvTaxPayNo  = $("#taxPayNo_"+custTp).val();   // 납세번호
    param.contractReVO.drvPurcMngNm = $("#purcMngNm_"+custTp).val();   // 납세번호
    param.contractReVO.drvSsnCrnTp  = $("#ssnCrnTp_"+custTp).val();   //신분증유형
    param.contractReVO.drvSsnCrnNo  = $("#ssnCrnNo_"+custTp).val();   //증서번호
    param.contractReVO.drvTelNo1    = $("#telNo1_"+custTp).val();     // 전화번호1
    param.contractReVO.drvTelNo2    = $("#telNo2_"+custTp).val();     // 전화번호2
    param.contractReVO.drvEmailNm   = $("#emailNm_"+custTp).val();
    param.contractReVO.drvSungNm    = $("#sungNm_"+custTp).val();
    param.contractReVO.drvSungCd    = $("#sungCd_"+custTp).val();
    param.contractReVO.drvCityNm    = $("#cityNm_"+custTp).val();
    param.contractReVO.drvCityCd    = $("#cityCd_"+custTp).val();
    param.contractReVO.drvDistNm    = $("#distNm_"+custTp).val();
    param.contractReVO.drvDistCd    = $("#distCd_"+custTp).val();
    param.contractReVO.drvZipCd     = $("#zipCd_"+custTp).val();          // 우편번호
    param.contractReVO.drvAddrTp    = $("#addrTp_"+custTp).data("kendoExtDropDownList").value(); //주소유형
    param.contractReVO.drvAddrDetlCont  = $("#addrDetlCont_"+custTp).val();          // 주소

    // 보험
    param.contractReVO.implyYn = $("#incImplyYn").prop('checked') == true ? "Y":"N";             //재무수납여부
    param.contractReVO.finImplyYn = $("#finImplyYn").prop('checked') == true ? "Y":"N";
    param.contractReVO.incJoinDt = dms.string.isEmpty($("#incJoinDt").val())? $("#contractDt").data("kendoExtMaskedDatePicker").value():$("#incJoinDt").val();

    var URLAddr = "";
    if(mFlag == "save"){
        URLAddr = "<c:url value='/sal/cnt/contractMnt/approvalContractMnts.do' />";
    }else{
        URLAddr = "<c:url value='/sal/cnt/contractMnt/multiContractMnts.do' />";
    }

    $.ajax({
        url:URLAddr
        ,data:JSON.stringify(param)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error :function(jqXHR,status,error) {
            dms.loading.hide();   // 로딩 종료

            if(jqXHR.responseJSON != null && jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                dms.notification.error(jqXHR.responseJSON.errors);
            }else{
                dms.notification.error(error);
            }
        }
        ,success :function(jqXHR, textStatus) {
            dms.loading.hide();   // 로딩 종료
            var data = {};
            data.msg = 'save';
            if(mFlag != "save"){
                data.cntTp = '01';      // 저장
            }
            data.cntNo = jqXHR;
            options.callbackFunc(data);
            refreshAll();
            parent.mainPopupWindow.close();
        }
    });
}

/**
 * 삭제
 */
function remove(){
    if($("#contractNo").val() == ""){
        // 삭제할 대상을 선택하십시오.
        dms.notification.info("<spring:message code='global.lbl.del' var='globalLblDel' /><spring:message code='global.lbl.rcpeNm' var='globalLblRcpeNm' /><spring:message code='global.info.chkselect' arguments='${globalLblDel}, ${globalLblRcpeNm}' />");
        return false;
    }

    // 계약삭제 승인전
    if( $("#contractStatCd").val() == "10" ){
        var param = {};
        param.contractNo = $("#contractNo").val();          // 계약번호

        $.ajax({
            url :"<c:url value='/sal/cnt/contractMnt/deleteContract.do' />",
            data :JSON.stringify(param),
            type :'POST',
            dataType :'json',
            contentType :'application/json',
            error :function(jqXHR,status,error) {
                //dms.notification.error(jqXHR.responseJSON.errors);
                if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
            },
            success :function(jqXHR, textStatus) {

                var data = {};
                data.msg = 'save';
                data.cntNo = jqXHR;
                options.callbackFunc(data);
                refreshAll();
                parent.mainPopupWindow.close();

                /*
                var grid = $("#contGrid").data("kendoExtGrid");
                grid.dataSource.read();
                refreshAll();
                fn_btnState();  // 버튼처리 초기화 상태

                $("#callContractReWindow").data("kendoWindow").close();

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
                */
            }
        });

    }else if($("#contractStatCd").val() == ""){
        refreshAll();
        parent.mainPopupWindow.close();
    }else{
        // 계약승인 이전단계에서만 삭제가 가능합니다.
        dms.notification.info("<spring:message code='global.lbl.contractAcptReq' var='globalLblContractAcptReq' /><spring:message code='global.lbl.del' var='globalLblDel' /><spring:message code='global.info.ckeckSaveInfo' arguments='${globalLblContractAcptReq}, ${globalLblDel}' />");
        return false;
    }

}

// 계약취소
function cancel(){

    if($("#contractNo").val() == ""){
        // 삭제할 대상을 선택하십시오.
        dms.notification.info("<spring:message code='global.lbl.del' var='globalLblDel' /><spring:message code='global.lbl.rcpeNm' var='globalLblRcpeNm' /><spring:message code='global.info.chkselect' arguments='${globalLblDel}, ${globalLblRcpeNm}' />");
        return false;
    }

    // 계약생성이후
    if( $("#contractStatCd").val() == "20" ){
        var param = {};
        param.contractNo = $("#contractNo").val();          // 계약번호

        $.ajax({
            url :"<c:url value='/sal/cnt/contractMnt/cancelContract.do' />",
            data :JSON.stringify(param),
            type :'POST',
            dataType :'json',
            contentType :'application/json',
            error :function(jqXHR,status,error) {
                //dms.notification.error(jqXHR.responseJSON.errors);
                if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
            },
            success :function(jqXHR, textStatus) {
                var data = {};
                data.msg = 'save';
                data.cntNo = jqXHR;
                options.callbackFunc(data);
                refreshAll();
                parent.mainPopupWindow.close();

                /*
                var grid = $("#contGrid").data("kendoExtGrid");
                grid.dataSource.read();
                refreshAll();
                fn_btnState();  // 버튼처리 초기화 상태

                $("#callContractReWindow").data("kendoWindow").close();

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
                */
            }
        });

    }else{
        // 계약생성된 이후 삭제처리가 가능합니다.
        dms.notification.info("<spring:message code='sal.info.contAfterMsg'/>");
        return false;
    }

}


/**
 * 버튼 상태 관리
 */
function fn_btnState(state, ste){
    switch(state){
        case '10':     // 계약등록
            $("#btnPayPrint").data("kendoButton").enable(false);
            $("#btnContPrint").data("kendoButton").enable(false);
            $("#btnViewPrint").data("kendoButton").enable(false);
            //$("#btnSanbaoPrint").data("kendoButton").enable(false);
            $("#btnSaleAccountPrint").data("kendoButton").enable(false);
            $("#btnPayPrint").hide();
            $("#btnContPrint").hide();
            $("#btnViewPrint").hide();
            //$("#btnSanbaoPrint").hide();
            $("#btnSaleAccountPrint").hide();

            //$("#btnCancel").data("kendoButton").enable(true);
            $("#btnCreate").data("kendoButton").enable(true);
            //$("#btnRemove").data("kendoButton").enable(true);
            //$("#btnUpdate").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnSave").show();
            fn_readOnlyStat(false);
        break;
        case '20':     // 계약생성
            $("#btnPayPrint").data("kendoButton").enable(true);
            $("#btnContPrint").data("kendoButton").enable(true);
            $("#btnViewPrint").data("kendoButton").enable(false);
            //$("#btnSanbaoPrint").data("kendoButton").enable(false);
            $("#btnSaleAccountPrint").data("kendoButton").enable(false);
            $("#btnPayPrint").show();
            $("#btnContPrint").show();
            $("#btnViewPrint").hide();
            //$("#btnSanbaoPrint").hide();
            $("#btnSaleAccountPrint").hide();

            //$("#btnCancel").data("kendoButton").enable(true);
            $("#btnCreate").data("kendoButton").enable(true);
            //$("#btnRemove").data("kendoButton").enable(false);
            //$("#btnUpdate").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnSave").hide();
            fn_readOnlyStat(false);
            break;
        case '50':     // 고객인도
            $("#btnPayPrint").data("kendoButton").enable(true);
            $("#btnContPrint").data("kendoButton").enable(true);
            $("#btnViewPrint").data("kendoButton").enable(true);
            //$("#btnSanbaoPrint").data("kendoButton").enable(true);
            $("#btnSaleAccountPrint").data("kendoButton").enable(true);
            $("#btnPayPrint").show();
            $("#btnContPrint").show();
            $("#btnViewPrint").show();
            //$("#btnSanbaoPrint").show();
            $("#btnSaleAccountPrint").show();

            //$("#btnCancel").data("kendoButton").enable(false);
            $("#btnCreate").data("kendoButton").enable(false);
            //$("#btnRemove").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(false);
            //$("#btnUpdate").data("kendoButton").enable(false);
            $("#btnSave").hide();
            fn_readOnlyStat(true);
            break;
        case '90':     // 계약삭제 - 계약생성전
        case '91':     // 계약해지
            $("#btnPayPrint").data("kendoButton").enable(false);
            $("#btnContPrint").data("kendoButton").enable(false);
            $("#btnViewPrint").data("kendoButton").enable(false);
            //$("#btnSanbaoPrint").data("kendoButton").enable(false);
            $("#btnSaleAccountPrint").data("kendoButton").enable(false);
            $("#btnPayPrint").hide();
            $("#btnContPrint").hide();
            $("#btnViewPrint").hide();
            //$("#btnSanbaoPrint").hide();
            $("#btnSaleAccountPrint").hide();

            //$("#btnCancel").data("kendoButton").enable(false);
            $("#btnCreate").data("kendoButton").enable(false);
            //$("#btnRemove").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(false);
            //$("#btnUpdate").data("kendoButton").enable(false);
            $("#btnSave").hide();
            fn_readOnlyStat(true);
            break;
        case '900':
            switch(ste){
                case '20':
                    $("#btnPayPrint").data("kendoButton").enable(true);
                    $("#btnContPrint").data("kendoButton").enable(true);
                    $("#btnViewPrint").data("kendoButton").enable(false);
                    //$("#btnSanbaoPrint").data("kendoButton").enable(false);
                    $("#btnSaleAccountPrint").data("kendoButton").enable(false);
                    $("#btnPayPrint").show();
                    $("#btnContPrint").show();
                    $("#btnViewPrint").show();
                    //$("#btnSanbaoPrint").show();
                    $("#btnSaleAccountPrint").show();
                    break;
                case '50':
                    $("#btnPayPrint").data("kendoButton").enable(true);
                    $("#btnContPrint").data("kendoButton").enable(true);
                    $("#btnViewPrint").data("kendoButton").enable(true);
                    //$("#btnSanbaoPrint").data("kendoButton").enable(true);
                    $("#btnSaleAccountPrint").data("kendoButton").enable(true);
                    $("#btnPayPrint").show();
                    $("#btnContPrint").show();
                    $("#btnViewPrint").show();
                    //$("#btnSanbaoPrint").show();
                    $("#btnSaleAccountPrint").show();
                    break;
                default :
                    $("#btnPayPrint").data("kendoButton").enable(false);
                    $("#btnContPrint").data("kendoButton").enable(false);
                    $("#btnViewPrint").data("kendoButton").enable(false);
                    //$("#btnSanbaoPrint").data("kendoButton").enable(false);
                    $("#btnSaleAccountPrint").data("kendoButton").enable(false);
                    $("#btnPayPrint").hide();
                    $("#btnContPrint").hide();
                    $("#btnViewPrint").hide();
                    //$("#btnSanbaoPrint").hide();
                    $("#btnSaleAccountPrint").hide();
                    break;
            }

            //$("#btnCancel").data("kendoButton").enable(false);
            $("#btnCreate").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(false);

            //$("#btnCancel").hide();
            $("#btnCreate").hide();
            $("#btnSave").hide();

            // 용품
            $("#btnGoodsAdd").hide();
            $("#btnGoodsDel").hide();
            $("#btnGoodsCancel").hide();

            // 보험
            $("#btnIncAllChange").hide();
            $("#btnIncAdd").hide();
            $("#btnIncDel").hide();
            $("#btnIncCancel").hide();
            fn_readOnlyStat(true);
            break;
        default :      // 작성전
            $("#btnPayPrint").data("kendoButton").enable(false);
            $("#btnContPrint").data("kendoButton").enable(false);
            $("#btnViewPrint").data("kendoButton").enable(false);
            //$("#btnSanbaoPrint").data("kendoButton").enable(false);
            $("#btnSaleAccountPrint").data("kendoButton").enable(false);
            $("#btnPayPrint").hide();
            $("#btnContPrint").hide();
            $("#btnViewPrint").hide();
            //$("#btnSanbaoPrint").hide();
            $("#btnSaleAccountPrint").hide();

            //$("#btnCancel").data("kendoButton").enable(false);
            $("#btnCreate").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(true);
            //$("#btnRemove").data("kendoButton").enable(false);
            //$("#btnUpdate").data("kendoButton").enable(false);
            $("#btnSave").show();
            fn_readOnlyStat(false);
            break;
    }
}

var readOnlyFlag = false;
function fn_readOnlyStat(state){
    if(state){
        $("#beforeNo").attr("disabled", true);
        $("#dlReqDt").data("kendoExtMaskedDatePicker").enable(false);
        $("#lv2DlrOrgCd").data("kendoExtDropDownList").enable(false);
        $("#dstbChnCd").data("kendoExtDropDownList").enable(false);

        var custTp = $("#custTp").val();
        $("#vCustNm_"+custTp).attr("disabled", true);
        $("#taxPayNo_"+custTp).attr("disabled", true);
        $("#purcMngNm_"+custTp).attr("disabled", true);
        $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").enable(false);
        $("#ssnCrnNo_"+custTp).attr("disabled", true);
        $("#telNo1_"+custTp).attr("disabled", true);
        //$("#addrTp_"+custTp).data("kendoExtDropDownList").enable(false);
        $("#zipCd_"+custTp).attr("disabled", true);
        $("#addrDetlCont_"+custTp).attr("disabled", true);

        $("#sVinNo").attr("disabled", true);
        $("#carlineCd").data("kendoExtDropDownList").enable(false);
        $("#fscCd").data("kendoExtDropDownList").enable(false);
        $("#ocnCd").data("kendoExtDropDownList").enable(false);
        $("#extColorCd").data("kendoExtDropDownList").enable(false);
        $("#intColorCd").data("kendoExtDropDownList").enable(false);
        $("#payTp").data("kendoExtDropDownList").enable(false);
        $("#realCarAmt").data("kendoExtNumericTextBox").enable(false);

        // 용품
        $("#btnGoodsAdd").data("kendoButton").enable(false);
        $("#btnGoodsDel").data("kendoButton").enable(false);
        $("#btnGoodsCancel").data("kendoButton").enable(false);

        // 보험
        $("#incAapTp01").prop("disabled", "disabled");
        $("#incAapTp02").prop("disabled", "disabled");
        if($("#incAapTp").val() == "A"){
            $("#incExpcAmt").data("kendoExtNumericTextBox").enable(false);
            $("#incImplyYn").attr("disabled", true);

            $("#incPconCustNm").attr("disabled", true);
            $("#incPconCustTelNo").attr("disabled", true);
            $("#incCustNm").attr("disabled", true);
            $("#incCustTelNo").attr("disabled", true);

            $("#incCmpCd").data("kendoExtDropDownList").enable(false);
            $("#incProfitNm").attr("disabled", true);
            $("#incFeeAmt").data("kendoExtNumericTextBox").enable(false);

            $("#frcIncAmt").data("kendoExtNumericTextBox").enable(false);
            $("#busIncAmt").data("kendoExtNumericTextBox").enable(false);
            $("#transIncTaxAmt").data("kendoExtNumericTextBox").enable(false);

            $("#btnIncAllChange").data("kendoButton").enable(false);
            $("#btnIncAdd").data("kendoButton").enable(false);
            $("#btnIncDel").data("kendoButton").enable(false);
            $("#btnIncCancel").data("kendoButton").enable(false);

            $("#incRemark").attr("disabled", true);
        }

        // 금융
        $("#fincTp01").prop("disabled", "disabled");
        $("#fincTp02").prop("disabled", "disabled");
        if($("#fincReqYn").val() == "Y"){
           $("#fincCmpCd").data("kendoExtDropDownList").enable(false);
           $("#fincRpayPrid").data("kendoExtNumericTextBox").enable(false);
           $("#fincLoadRate").data("kendoExtNumericTextBox").enable(false);
           $("#fincFeeAmt").data("kendoExtNumericTextBox").enable(false);
           $("#fincItemCd").data("kendoExtDropDownList").enable(false);
           $("#fincBurdAmt").data("kendoExtNumericTextBox").enable(false);
           $("#instIntrRate").data("kendoExtNumericTextBox").enable(false);
           $("#grteIncAmt").data("kendoExtNumericTextBox").enable(false);
           $("#fincReqDt").data("kendoExtMaskedDatePicker").enable(false);
           $("#fincEndDt").data("kendoExtMaskedDatePicker").enable(false);
           $("#fincReqAmt").data("kendoExtNumericTextBox").enable(false);
        }

        // 중고차
        $("#uatcCarPurcYn").data("kendoExtDropDownList").enable(false);
        $("#sUsrVinNo").attr("disabled", true);
        $("#purcNo").attr("disabled", true);
        $("#usrSbstAmt").data("kendoExtNumericTextBox").enable(false);
        $("#subsidyAmt").data("kendoExtNumericTextBox").enable(false);
        $('input[name="tabSbusTp"]').prop("disabled", true);

        // 대행업무
        $("#tabRegTp01").prop("disabled", "disabled");
        $("#tabRegTp02").prop("disabled", "disabled");
        $("#btnAapsAdd").data("kendoButton").enable(false);
        $("#btnAapsDel").data("kendoButton").enable(false);
        $("#btnAapsCancel").data("kendoButton").enable(false);

        // BM포인트
        $("#blueMembershipPointVal").data("kendoExtNumericTextBox").enable(false);
    }else{
        $("#beforeNo").attr("disabled", false);
        $("#dlReqDt").data("kendoExtMaskedDatePicker").enable(true);

        var custTp = $("#custTp").val();
        //$("#vCustNm_"+custTp).attr("disabled", false);
        //$("#taxPayNo_"+custTp).attr("disabled", false);
        $("#purcMngNm_"+custTp).attr("disabled", false);
        //$("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").enable(true);
        //$("#ssnCrnNo_"+custTp).attr("disabled", false);
        //$("#telNo1_"+custTp).attr("disabled", false);
        //$("#addrTp_"+custTp).data("kendoExtDropDownList").enable(true);
        $("#zipCd_"+custTp).attr("disabled", false);
        $("#addrDetlCont_"+custTp).attr("disabled", false);

        $("#sVinNo").attr("disabled", false);
        //$("#carlineCd").data("kendoExtDropDownList").enable(true);
        //$("#fscCd").data("kendoExtDropDownList").enable(true);
        //$("#ocnCd").data("kendoExtDropDownList").enable(true);
        //$("#extColorCd").data("kendoExtDropDownList").enable(true);
        //$("#intColorCd").data("kendoExtDropDownList").enable(true);
        $("#payTp").data("kendoExtDropDownList").enable(true);
        $("#realCarAmt").data("kendoExtNumericTextBox").enable(true);

        // 용품
        $("#btnGoodsAdd").data("kendoButton").enable(true);
        $("#btnGoodsDel").data("kendoButton").enable(true);
        $("#btnGoodsCancel").data("kendoButton").enable(true);

        // 보험
        $("#incAapTp01").prop("disabled", "");
        $("#incAapTp02").prop("disabled", "");
        if($("#incAapTp").val() == "A"){
            $("#incExpcAmt").data("kendoExtNumericTextBox").enable(true);
            $("#incImplyYn").attr("disabled", false);

            $("#incPconCustNm").attr("disabled", false);
            $("#incPconCustTelNo").attr("disabled", false);
            $("#incCustNm").attr("disabled", false);
            $("#incCustTelNo").attr("disabled", false);

            $("#incCmpCd").data("kendoExtDropDownList").enable(true);
            $("#incProfitNm").attr("disabled", false);
            $("#incFeeAmt").data("kendoExtNumericTextBox").enable(true);

            $("#frcIncAmt").data("kendoExtNumericTextBox").enable(true);
            $("#busIncAmt").data("kendoExtNumericTextBox").enable(true);
            $("#transIncTaxAmt").data("kendoExtNumericTextBox").enable(true);

            $("#btnIncAllChange").data("kendoButton").enable(true);
            $("#btnIncAdd").data("kendoButton").enable(true);
            $("#btnIncDel").data("kendoButton").enable(true);
            $("#btnIncCancel").data("kendoButton").enable(true);

            $("#incRemark").attr("disabled", false);
        }

        // 금융
        $("#fincTp01").prop("disabled", "");
        $("#fincTp02").prop("disabled", "");
        if($("#fincReqYn").val() == "Y"){
           $("#fincCmpCd").data("kendoExtDropDownList").enable(true);
           $("#fincRpayPrid").data("kendoExtNumericTextBox").enable(true);
           $("#fincLoadRate").data("kendoExtNumericTextBox").enable(true);
           $("#fincFeeAmt").data("kendoExtNumericTextBox").enable(true);
           $("#fincItemCd").data("kendoExtDropDownList").enable(true);
           $("#fincBurdAmt").data("kendoExtNumericTextBox").enable(true);
           $("#instIntrRate").data("kendoExtNumericTextBox").enable(true);
           $("#grteIncAmt").data("kendoExtNumericTextBox").enable(true);
           $("#fincReqDt").data("kendoExtMaskedDatePicker").enable(true);
           $("#fincEndDt").data("kendoExtMaskedDatePicker").enable(true);
           $("#fincReqAmt").data("kendoExtNumericTextBox").enable(true);
        }

        // 중고차
        $("#uatcCarPurcYn").data("kendoExtDropDownList").enable(true);

        // 대행업무
        $("#tabRegTp01").prop("disabled", "");
        $("#tabRegTp02").prop("disabled", "");
        //$("#btnAapsAdd").data("kendoButton").enable(true);
        //$("#btnAapsDel").data("kendoButton").enable(true);
        //$("#btnAapsCancel").data("kendoButton").enable(true);

        // BM포인트
        $("#blueMembershipPointVal").data("kendoExtNumericTextBox").enable(true);
    }
    readOnlyFlag = state;
}

// 대문자
//$(".upper").bind("keyup", function(){
//    $(this).val($(this).val().toUpperCase());
//});


// 숫자
var onlyNum = new RegExp("[^0-9]","i");
$(".numberic").keyup(function(e){
    var content = $(this).val();
    if(content.match(onlyNum)){
        $(this).val('');
    }
});

// 숫자와 알파벳   /^[A-Za-z0-9+]*$/  /[a-zA-Z0-9]/g;
var onlyNumAlpha = new RegExp("[^A-Z0-9]");
$(".numberandalpha").keyup(function(e)
{
    var contents = $(this).val();
    if(onlyNumAlpha.test(contents)){
        $(this).val('');
    }
});


// 숫자형체크
function naNcheck(data){
    return isNaN(data)?0:(Number(data)==Infinity||Number(data)==-Infinity)?0:Number(data);
}

// OBJ NULL 체크
function isObjectNullCheck(data){
    if(typeof(data) == "undefined"){
        return true;
    }
    if(data == null){
        return true;
    }

    var isResult = true;
    $.each(data, function(index, row) {
        isResult = false;
    });
    return isResult;
}

// OBJ List에 DataSet 값이 있는지 확인
function isArrayValues(Obj, name, value){
    var isReturn = false;
    $.each(Obj, function(idx, col){
        if(col[name] == value){
            isReturn = true;
        }
    });
    return isReturn;
}

//고객명 enter
$(".onKey_bulr").blur(function(e){
    var cId = dms.string.strNvl($(this).context.id);
    if(cId != ""){
        cleanCustCheck(cId);
    }
});

// 고객명 enter
$(".onKey_up").keyup(function(e){
    var cId = dms.string.strNvl($(this).context.id);
    if(cId == ""){
        return ;
    }

    if (e.keyCode == 13) {
        if($(this).val() != "") {
            bf_searchCustomer(cId);
        }
    }else{
        cleanCustCheck(cId);
    }
});

// 고객명 변경시 고객정보 clean
function cleanCustCheck(cId){
    if(cId == "vCustNm_01"){
        if(dms.string.strNvl($("#"+cId).val()) != dms.string.strNvl($("#custNm_01").val()) ){
            $("#ssnCrnTp_01").data("kendoExtDropDownList").enable(false);
            //$("#ssnCrnNo_01").attr("disabled", false);

            $("#personalTxt_01").val(" "); //개인
            $("#custCd_01").val('');       // 고객코드
            $("#taxPayNo_01").val('');     // 납세번호
            $("#purcMngNm_01").val('');     // 구매담당자명
            $("#ssnCrnTp_01").data("kendoExtDropDownList").value(''); // 신분증유형 / 법인유형
            $("#ssnCrnNo_01").val('');  // 증서번호
            $("#ssnCrnNo_01").attr('maxlength','20');
            $("#telNo1_01").val('');       // 전화번호1
            $("#telNo2_01").val('');       // 전화번호2
            $("#emailNm_01").val('');    // 이메일명

            $("#sungNm_01").val('');    // 성
            $("#sungCd_01").val('');    // 성
            $("#cityNm_01").val('');    // 시
            $("#cityCd_01").val('');    // 시
            $("#distNm_01").val('');    // 구
            $("#distCd_01").val('');    // 구

            $("#zipCd_01").val('');      // 우편번호
            $("#addrTp_01").data("kendoExtDropDownList").value('02');
            $("#addrTp_01").data("kendoExtDropDownList").enable(false);
            $("#addrDetlCont_01").val('');   // 상세주소

            $("#blueMembershipId").val('');
            $("#blueMembershipNo").val('');
            $("#bluePointApplyRate").val('1');
            $("#mLevel").data("kendoExtDropDownList").value('');
            $("#point").data("kendoExtNumericTextBox").value(0.00);
            $("#blueMembershipPointVal").data("kendoExtNumericTextBox").value(0.00);
            $("#tBlueAmount").data("kendoExtNumericTextBox").value(0.00);
            $("#regDt").data("kendoExtMaskedDatePicker").value('');
            bf_sumCarAmt();
        }
    }else if(cId == "vCustNm_02"){
        if(dms.string.strNvl($("#"+cId).val()) != dms.string.strNvl($("#custNm_02").val()) ){
            $("#ssnCrnTp_02").data("kendoExtDropDownList").enable(false);
            //$("#ssnCrnNo_02").attr("disabled", false);

            $("#personalTxt_02").val(" "); //법인
            $("#custCd_02").val('');       // 고객코드
            $("#taxPayNo_02").val('');     // 납세번호
            $("#purcMngNm_02").val('');     // 구매담당자명
            $("#ssnCrnTp_02").data("kendoExtDropDownList").value(''); // 신분증유형 / 법인유형
            $("#ssnCrnNo_02").val('');  // 증서번호
            $("#ssnCrnNo_02").attr('maxlength','25');
            $("#telNo1_02").val('');    // 전화번호1
            $("#telNo2_02").val('');    // 전화번호2
            $("#emailNm_02").val('');   // 이메일명

            $("#sungNm_02").val('');    // 성
            $("#sungCd_02").val('');    // 성
            $("#cityNm_02").val('');    // 시
            $("#cityCd_02").val('');    // 시
            $("#distNm_02").val('');    // 구
            $("#distCd_02").val('');    // 구

            $("#zipCd_02").val('');      // 우편번호
            $("#addrTp_02").data("kendoExtDropDownList").value('02');
            $("#addrTp_02").data("kendoExtDropDownList").enable(false);
            $("#addrDetlCont_02").val('');   // 상세주소

            $("#blueMembershipId").val('');
            $("#blueMembershipNo").val('');
            $("#bluePointApplyRate").val('1');
            $("#mLevel").data("kendoExtDropDownList").value('');
            $("#point").data("kendoExtNumericTextBox").value(0.00);
            $("#blueMembershipPointVal").data("kendoExtNumericTextBox").value(0.00);
            $("#tBlueAmount").data("kendoExtNumericTextBox").value(0.00);
            $("#regDt").data("kendoExtMaskedDatePicker").value('');
            bf_sumCarAmt();
        }
    }
}

// 고객정보 수정링크
$(document).on("click", ".linkCustNo", function(e){
    if(dms.string.isEmpty($(this).val())){return ;}
    parent.window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+$(this).val(), "VIEW-D-10272");
});


 /******************************************
  * 함수영역 - end
  ******************************************/
//-->
</script>
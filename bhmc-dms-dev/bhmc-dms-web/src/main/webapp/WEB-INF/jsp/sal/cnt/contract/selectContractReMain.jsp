<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<style type="text/css">
.form_readonly_text_blue {background-color:#dbdbdb!important; -webkit-text-fill-color:#45b4e8; color:#45b4e8!important; -webkit-opacity:1; opacity:1;}
</style>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- *************************************************************************
**************************파일업로드1********************************************
***************************************************************************-->
<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
<div id="progressWindow" class="resumable-progress">
    <p class="progress-total-txt"><!-- 현재 <span class="current_num">3</span> / 전체 <span class="whole_num">4</span> (<span class="complete_size">10</span>MB / <span class="whole_size">65</span>MB) --></p>
    <table>
        <tr>
            <td width="100%">
                <div class="progress-container">
                    <div class="progress-bar"></div>
                    <div class="progress-txt">00%</div>
                </div>
            </td>
            <td class="progress-pause" nowrap="nowrap">
                <div class="progress-btn">
                    <a href="#" onclick="r.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="r.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>
<!-- *************************************************************************
**************************파일업로드1********************************************
***************************************************************************-->

<!-- 계약관리 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.retailContractOrd' /></h1> <!-- 계약관리 -->
        <div class="left_area">
            <span class="span_txt"><spring:message code="global.lbl.dealer" /></span>    <!-- 딜러 -->
            <div style="display:inline-block;position:relative;top:2px;">
                <div class="form_search" style="width:80px;">
                    <a href="javascript:bf_dealerSearchPopup();"><spring:message code='global.btn.search' /></a>   <!-- 검색 -->
                    <input id="sDlrCd" readonly class="form_input form_readonly" />
                </div>
                <input id="sDlrNm" readonly class="form_input form_readonly" style="width:80px;">
            </div>
        </div>
        <div class="btn_right">
            <button id="btnViewDetail" type="button" class="btn_m"><spring:message code='global.btn.detail' /></button>           <!-- 상세 -->
            <button id="btnRefresh" type="button" class="btn_m btn_new"><spring:message code='global.btn.new' /></button>         <!-- 신규 -->
            <button id="btnSearch" type="button" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code='global.lbl.salPrsnNm' /></th> <!-- 판매담당자 -->
                    <td>
                        <input id="sSaleEmpNo" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="vContractCustNm" class="form_input onKey_up onKey_bulr" >
                                    <a href="javascript:bf_searchCustomer('search', 'vContractCustNm');"><spring:message code='global.lbl.search' /></a>       <!-- 검색 -->
                                    <input id="sContractCustNm" type="hidden" />
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sContractCustNo" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractType' /></th>      <!-- 계약유형 -->
                    <td>
                        <input id="sContractTp" class="form_comboBox" />
                    </td>
                </tr>

                <tr>
                    <th scope="row"><spring:message code='global.lbl.contractNo' /></th>        <!-- 계약번호 -->
                    <td>
                        <input id="sContractNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractStat' /></th>      <!-- 계약상태 -->
                    <td>
                        <input id="sContractStatCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractDt' /></th>        <!-- 계약일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartContractDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndContractDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th>       <!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th>     <!-- 모델 -->
                    <td>
                        <input id="sModelCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.ocn' /></th>       <!-- OCN -->
                    <td>
                        <input id="sOcnCd" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 계약내역 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="contGrid" class="resizable_grid"></div>
    </div>
    <!-- 계약내역 그리드 종료 -->
</section>
</div>
<!-- //계약관리 -->


<section id="callContractReWindow" class="pop_wrap">
<form id="contForm" name="contForm" method="POST">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnPayPrint" type="button" class="btn_m"><spring:message code='sal.btn.payPrint' /></button>         <!-- 결산서출력 -->
            <button id="btnContPrint" type="button" class="btn_m"><spring:message code='sal.btn.contPrint' /></button>       <!-- 계약서출력 -->
            <button id="btnCancel" type="button" class="btn_m"><spring:message code='global.lbl.contractCancel' /></button>  <!-- 계약취소 -->
            <button id="btnCreate" type="button" class="btn_m"><spring:message code='sal.btn.contractCreate' /></button>     <!-- 계약생성 -->
            <%--
            <button id="btnRemove" typetrue="button" class="btn_m"><spring:message code='global.lbl.contractDel' /></button>          <!-- 계약삭제 -->
            <button id="btnSave" type="button" class="btn_m btn_save"><spring:message code='global.btn.save' /></button>          <!-- 저장 -->
            <button id="btnUpdate" type="button" class="btn_m btn_modify"><spring:message code='global.btn.update' /></button>    <!-- 수정 -->
             --%>
        </div>
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div id="tabstrip" class="tab_area tab_area_v1 mt0">
        <!-- 탭메뉴 -->
        <ul>
            <li id="contInfoTab" class="k-state-active"><spring:message code='global.lbl.contractInfo' /></li>                       <!-- 계약정보 -->
            <li id="driverTab"><spring:message code='sal.lbl.driver' /></li>               <!-- 실운전자 -->
            <li id="consTab"><spring:message code='sal.lbl.cons' /></li>                   <!-- 탁송 -->
            <li id="promotionTab"><spring:message code='sal.lbl.promotion' /></li>         <!-- 판촉 -->
            <li id="receiptTab"><spring:message code='global.lbl.receipt' /></li>          <!-- 영수증 -->
            <li id="payInfoTab"><spring:message code='sal.lbl.payInfo' /></li>             <!-- 입출금 -->
            <li id="useCarTab"><spring:message code='sal.lbl.useCar' /></li>           <!-- 중고차치환 -->
            <li id="subServiceTab"><spring:message code='sal.lbl.subService' /></li>   <!-- 추가서비스 -->
            <li id="incServiceTab"><spring:message code='sal.title.incService' /></li>   <!-- 보험서비스 -->

            <li id="remarkTab"><spring:message code='sal.lbl.fileRemark' /></li>       <!-- 파일 및 비고 -->
            <li id="goodsTab"><spring:message code='sal.lbl.goods' /></li>             <!-- 용품 -->
            <li id="optionTab"><spring:message code='sal.lbl.optionAmt' /></li>        <!-- 부가비용 -->
            <li id="priceTab"><spring:message code='sal.lbl.price' /></li>             <!-- 가격 -->
        </ul>
        <!-- //탭메뉴 -->

        <!-- 계약정보 -->
        <div class="mt0">
            <!-- 계약상세정보 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='sal.title.retailContractDetail' /></h2>       <!-- 계약상세정보 -->
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
                                <th scope="row"><spring:message code='global.lbl.saleOpptYn' /></th>        <!-- 판매기회여부 -->
                                <td>
                                    &nbsp;<input id="saleOpptYn" type="checkbox" class="form_check" disabled />
                                </td>
                                <%--
                                <th scope="row"><spring:message code='global.lbl.lv2DlrYn' /></th>        <!-- 2급딜러여부 -->
                                <td>
                                    <div class="form_float">
                                        <div class="form_left" style="width:24%;">
                                            <input id="lv2DlrYn" name="lv2DlrYn" class="form_comboBox" data-json-obj="true">
                                        </div>
                                        <div class="form_left" style="width:40%;">
                                            <div class="form_search">
                                                <input id="lv2DlrOrgCd" name="lv2DlrOrgCd" readonly class="form_input" data-json-obj="true" />
                                                <a href="javascript:bf_searchSecondDealerSearchPopup();"><spring:message code='global.btn.search' /></a>       <!-- 조회 -->
                                            </div>
                                        </div>
                                        <div class="form_right" style="width:36%;">
                                            <input id="lv2DlrOrgNm" readonly class="form_input form_readonly" />
                                        </div>
                                    </div>
                                </td>
                                 --%>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.dlReqDt' /></span></th>                   <!-- 인도요청일 -->
                                <td>
                                    <input id="dlReqDt" name="dlReqDt" class="form_datepicker" data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.contractType' /></span></th>              <!-- 계약유형 -->
                                <td>
                                    <input id="contractTp" name="contractTp" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.grpContractNo' /></th>     <!-- 그룹계약번호 -->
                                <td>
                                    <input id="grpContractNo" name="grpContractNo" readonly class="form_input form_readonly" data-json-obj="true" />
                                </td>
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
                            <col style="width:12%;">
                            <col style="width:6%;">
                            <col style="width:10%;">
                            <col style="width:6%;">
                            <col style="width:10%;">
                            <col style="width:8%;">
                            <col style="width:10%;">
                            <col style="width:8%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.customer' /></span></th>      <!-- 고객 -->
                                <td colspan="3">
                                    <div class="form_float">
                                        <div class="form_left">
                                            <div class="form_search">
                                                <input id="vCustNm_01" class="form_input onKey_up onKey_bulr" />
                                                <a href="javascript:bf_searchCustomer('cust', 'vCustNm_01');"><spring:message code='global.btn.search' /></a>     <!-- 검색 -->
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
                                    <input value="<spring:message code='global.lbl.personal' />" readonly class="form_input form_readonly ac">       <!-- 개인 -->
                                </td>
                                <td colspan="4">
                                    <button type="button" class="btn_s" id="btnCrmCustSearch_01" onclick="bf_crmCustSearch();" style="display:none"><spring:message code='sal.btn.refresh' /></button>   <!-- 갱신 -->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.ssnCrnTp' /></th>  <!-- ID유형 -->
                                <td>
                                    <input id="ssnCrnTp_01" readonly class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.ssnCrnNo' /></th>   <!-- 증서번호 -->
                                <td colspan="3">
                                    <input id="ssnCrnNo_01" readonly class="form_input form_readonly" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.hpNo' /></th>        <!-- 전화번호 -->
                                <td>
                                    <input id="telNo1_01" readonly class="form_input form_readonly"/>
                                    <input type="hidden" id="telNo2_01">                            <!-- 전화번호2 화면에 없음 -->
                                </td>
                                <th scope="row"><spring:message code='global.lbl.emailNm' /></th>       <!-- 이메일 -->
                                <td>
                                    <input id="emailNm_01" readonly class="form_input form_readonly" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.sung' /></th>  <!-- 성 -->
                                <td>
                                    <input id="sungNm_01" readonly class="form_input form_readonly" />
                                    <input type="hidden" id="sungCd_01" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.cityCd' /></th>  <!-- 시 -->
                                <td>
                                    <input id="cityNm_01" readonly class="form_input form_readonly" />
                                    <input type="hidden" id="cityCd_01" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.dist' /></th>  <!-- 구 -->
                                <td>
                                    <input id="distNm_01" readonly class="form_input form_readonly" />
                                    <input type="hidden" id="distCd_01" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.zipCd' /></th>      <!-- 우편번호 -->
                                <td>
                                    <input id="zipCd_01" readonly class="form_input form_readonly" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.detlAddr' /></th>   <!-- 상세주소 -->
                                <td>
                                    <input id="addrDetlCont_01" readonly class="form_input form_readonly" />
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
                            <col style="width:8%;">
                            <col style="width:12%;">
                            <col style="width:6%;">
                            <col style="width:10%;">
                            <col style="width:6%;">
                            <col style="width:10%;">
                            <col style="width:8%;">
                            <col style="width:10%;">
                            <col style="width:8%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.customer' /></span></th>      <!-- 고객 -->
                                <td colspan="3">
                                    <div class="form_float">
                                        <div class="form_left">
                                            <div class="form_search">
                                                <input id="vCustNm_02" class="form_input onKey_up onKey_bulr">
                                                <a href="javascript:bf_searchCustomer('cust', 'vCustNm_02');"><spring:message code='global.btn.search' /></a>     <!-- 검색 -->
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
                                    <input value="<spring:message code='global.lbl.corporation' />" readonly class="form_input form_readonly ac">        <!-- 법인 -->
                                </td>
                                <td colspan="4">
                                    <button type="button" class="btn_s" id="btnCrmCustSearch_02" onclick="bf_crmCustSearch();" style="display:none"><spring:message code='sal.btn.refresh' /></button>   <!-- 갱신 -->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.corpSsnCrnTp' /></th>       <!-- 법인유형 -->
                                <td>
                                    <input id="ssnCrnTp_02" readonly class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.ssnCrnNo' /></th>         <!-- 증서번호 -->
                                <td colspan="3">
                                    <input id="ssnCrnNo_02" readonly class="form_input form_readonly" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.hpNo' /></th>            <!-- 전화번호 -->
                                <td>
                                    <input id="telNo1_02" readonly class="form_input form_readonly" />
                                    <input type="hidden" id="telNo2_02" />    <!-- 전화번호2 화면에 없음 -->

                                </td>
                                <th scope="row"><spring:message code='global.lbl.emailNm' /></th>       <!-- 이메일 -->
                                <td>
                                    <input id="emailNm_02" readonly class="form_input form_readonly" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.sung' /></th>  <!-- 성 -->
                                <td>
                                    <input id="sungNm_02" readonly class="form_input form_readonly" />
                                    <input type="hidden" id="sungCd_02" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.cityCd' /></th>  <!-- 시 -->
                                <td>
                                    <input id="cityNm_02" readonly class="form_input form_readonly" />
                                    <input type="hidden" id="cityCd_02" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.dist' /></th>  <!-- 구 -->
                                <td>
                                    <input id="distNm_02" readonly class="form_input form_readonly" />
                                    <input type="hidden" id="distCd_02" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.detlAddr' /></th>   <!-- 상세주소 -->
                                <td>
                                    <input id="addrDetlCont_02" readonly class="form_input form_readonly" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.zipCd' /></th>      <!-- 우편번호 -->
                                <td>
                                    <input id="zipCd_02" readonly class="form_input form_readonly" />
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
                            <col style="width:22%;">
                            <col style="width:8%;">
                            <col style="width:22%;">
                            <col style="width:8%;">
                            <col style="width:32%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.carLine' /></span></th>                           <!-- 차종 -->
                                <td>
                                    <input id="carlineCd" name="carlineCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.model' /></span></th>                             <!-- 모델 -->
                                <td>
                                    <input id="modelCd" name="modelCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.ocn' /></span></th>                               <!-- OCN -->
                                <td>
                                    <input id="ocnCd" name="ocnCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.extColor' /></span></th>                          <!-- 외장색 -->
                                <td>
                                    <input id="extColorCd" name="extColorCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.intColor' /></span></th>                          <!-- 내장색 -->
                                <td>
                                    <input id="intColorCd" name="intColorCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.carVinNo' /></th>                             <!-- VIN NO -->
                                <td>
                                    <div class="form_search" style="width:35%">
                                    <input id="sVinNo" type="text" maxlength="17" class="form_input"/>
                                        <a href="#" onclick="bf_searchVinNo();" ><spring:message code='global.lbl.search' /></a>   <!-- 검색 -->
                                    </div>
                                    <input type="text" id="vinNo" name="vinNo" readonly class="form_input form_readonly" data-json-obj="true" style="width:47%" />
                                    <input type="hidden" id="beforVinNo" name="beforVinNo" data-json-obj="true" />
                                    <button type="button" class="btn_s" onclick="bf_initVinNo()"><spring:message code='global.btn.cancel' /></button>   <!-- 취소 -->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.payTp' /></span></th>          <!-- 지불방식 -->
                                <td>
                                    <input id="payTp" name="payTp" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.salPrsnNm' /></th>   <!-- 판매담당자 -->
                                <td>
                                    <input id="saleEmpNo" name="saleEmpNo" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.carRetlAmt' /></th>      <!-- 지도가 -->
                                <td>
                                    <input id="carRetlAmt" name="carRetlAmt" type="text" readonly class="form_numeric form_readonly ar" data-json-obj="true" />
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
                                <th scope="colgroup" colspan="4" class="hasBob"><spring:message code='global.lbl.vehiclePrice' /></th>       <!-- 차량가격 -->
                                <th scope="colgroup" colspan="4" class="hasBob"><spring:message code='sal.lbl.etcAmt' /></th>       <!-- 기타비용 -->
                                <th scope="col" rowspan="2"><strong><spring:message code='sal.lbl.realCarAmt' /></strong></th>      <!--실제차량금액 -->
                                <th scope="col" rowspan="2"><strong><spring:message code='global.lbl.oterAmt' /><br><spring:message code='global.lbl.total' /></strong></th>    <!-- 기타금액<br>합계 -->
                                <th scope="col" rowspan="2"><strong><spring:message code='sal.lbl.realPayAmt' /></strong></th>      <!-- 실제지불금액 -->
                            </tr>
                            <tr>
                                <%-- <th scope="col"><spring:message code='sal.lbl.whslAmt' /></th> --%>          <!-- 구매가 -->
                                <th scope="col"><spring:message code='sal.lbl.retlAmt' /></th>          <!-- 공장지도가 -->
                                <th scope="col"><spring:message code='sal.lbl.promotionAmt' /></th>     <!-- 판촉금액 -->
                                <th scope="col"><spring:message code='sal.lbl.sbstAmt' /></th>          <!-- 치환차감 -->
                                <th scope="col"><spring:message code='global.lbl.goodsAmt' /></th>      <!-- 용품가격 -->
                                <th scope="col"><spring:message code='global.lbl.consAmt' /></th>       <!-- 탁송료 -->
                                <th scope="col"><spring:message code='sal.lbl.incAmt' /></th>           <!-- 보험료 -->
                                <th scope="col"><spring:message code='sal.lbl.aapAmt' /></th>        <!-- 대행료 -->
                                <th scope="col"><spring:message code='sal.lbl.otherAmt' /></th>      <!-- 부가금액 -->
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <!-- <td class="ar child_borderNone"><input id="whslAmt" name="whslAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td> -->              <!-- 구매가 -->
                                <td class="ar child_borderNone"><input id="retlAmt" name="retlAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>              <!-- 공장지도가 -->
                                <td class="ar child_borderNone"><input id="promotionAmt" name="promotionAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>    <!-- 판촉 -->
                                <td class="ar child_borderNone"><input id="sbstAmt" name="sbstAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>              <!-- 치환금액 -->
                                <td class="ar child_borderNone"><input id="goodsAmt" name="goodsAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>            <!-- 용품가격 -->
                                <td class="ar child_borderNone"><input id="consAmt" name="consAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>              <!-- 탁송료 -->
                                <td class="ar child_borderNone"><input id="incAmt" name="incAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>                <!-- 보험료 -->
                                <td class="ar child_borderNone"><input id="aapAmt" name="aapAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>  <!-- 대행료 -->
                                <td class="ar child_borderNone"><input id="vatAmt" name="vatAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>  <!-- 부가금액 -->
                                <td class="ar child_borderNone"><input id="realCarAmt" name="realCarAmt" class="form_numeric ar font_bold" readonly="readonly" data-json-obj="true" /></td>     <!-- 실제차량금액 -->
                                <td class="ar child_borderNone"><input id="etcSumAmt" name="etcSumAmt" class="form_numeric ar font_bold" readonly="readonly" data-json-obj="true" /></td>     <!-- 기타금액합계 -->
                                <td class="ar td_total child_borderNone"><input id="realPayAmt" name="realPayAmt" class="form_numeric ar font_bold" disabled="disabled" data-json-obj="true" /></td>     <!-- 실제지불금액 -->
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //계약가격정보 -->
        </div>
        <!-- //계약정보 -->

        <!--실운전자 -->
        <div class="mt0">
            <div class="header_area">
                <div class="fl ml0">
                    <label><input type="checkbox" id="realDriverSame" class="form_check" onclick="bf_realDriverSame(this)"> <spring:message code='global.lbl.contractCustomerInfoSame' /></label>       <!-- 계약고객정보와 동일 -->
                </div>
            </div>

            <!-- 개인 -->
            <div id="drvCust_01" class="table_form">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:8%;">
                        <col style="width:12%;">
                        <col style="width:6%;">
                        <col style="width:10%;">
                        <col style="width:6%;">
                        <col style="width:10%;">
                        <col style="width:8%;">
                        <col style="width:10%;">
                        <col style="width:8%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                            <td colspan="3">
                                <div class="form_float">
                                    <div class="form_left">
                                        <div class="form_search">
                                            <input id="vDrvCustNm_01" class="form_input onKey_up onKey_bulr"/>
                                            <a href="javascript:bf_searchCustomer('drv', 'vDrvCustNm_01');"><spring:message code='global.btn.search' /></a>      <!-- 검색 -->
                                            <input id="drvCustNm_01" type="hidden" />
                                        </div>
                                    </div>
                                    <div class="form_right">
                                        <input id="drvCustCd_01" readonly class="form_input form_readonly linkCustNo" style="cursor:pointer;" />
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.custTp' /></th>       <!-- 고객유형 -->
                            <td>
                                <input value="<spring:message code='global.lbl.personal' />" readonly class="form_input form_readonly ac">           <!-- 개인 -->
                            </td>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='sal.lbl.ssnCrnTp' /></th>      <!-- ID유형 -->
                            <td>
                                <input id="drvSsnCrnTp_01" readonly class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.ssnCrnNo' /></th>       <!-- 증서번호 -->
                            <td colspan="3">
                                <input id="drvSsnCrnNo_01" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code='par.lbl.telNo' /></th>        <!-- 대표전화번호 -->
                            <td>
                                <input id="drvTelNo1_01" readonly class="form_input form_readonly">
                                <input type="hidden" id="drvTelNo2_01">    <!-- 전화번호2 화면에 없음 -->
                            </td>
                            <th scope="row"><spring:message code='global.lbl.emailNm' /></th>       <!-- 이메일 -->
                            <td>
                                <input id="drvEmailNm_01" readonly class="form_input form_readonly" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.sung' /></th>      <!-- 성 -->
                            <td>
                                <input id="drvSungNm_01" readonly class="form_input form_readonly" />
                                <input type="hidden" id="drvSungCd_01" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.cityCd' /></th>      <!-- 시 -->
                            <td>
                                <input id="drvCityNm_01" readonly class="form_input form_readonly" />
                                <input type="hidden" id="drvCityCd_01" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.dist' /></th>      <!-- 구 -->
                            <td>
                                <input id="drvDistNm_01" readonly class="form_input form_readonly" />
                                <input type="hidden" id="drvDistCd_01" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.detlAddr' /></th>       <!-- 고객주소 -->
                            <td>
                                <input id="drvAddrDetlCont_01" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.zipCd' /></th>       <!-- 우편번호 -->
                            <td>
                                <input id="drvZipCd_01" readonly class="form_input form_readonly" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- //개인 -->
            <!-- 법인 -->
            <div id="drvCust_02" class="table_form" style="display:none">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:8%;">
                        <col style="width:12%;">
                        <col style="width:6%;">
                        <col style="width:10%;">
                        <col style="width:6%;">
                        <col style="width:10%;">
                        <col style="width:8%;">
                        <col style="width:10%;">
                        <col style="width:8%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                            <td colspan="3">
                                <div class="form_float">
                                    <div class="form_left">
                                        <div class="form_search">
                                            <input id="vDrvCustNm_02" class="form_input onKey_up onKey_bulr">
                                            <a href="javascript:bf_searchCustomer('drv', 'vDrvCustNm_02');"><spring:message code='global.btn.search' /></a>      <!-- 검색 -->
                                            <input id="drvCustNm_02" type="hidden" />
                                        </div>
                                    </div>
                                    <div class="form_right">
                                        <input id="drvCustCd_02" readonly class="form_input form_readonly linkCustNo" style="cursor:pointer;" />
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code='global.lbl.custTp' /></th>       <!-- 고객유형 -->
                            <td>
                                <input value="<spring:message code='global.lbl.corporation' />" readonly class="form_input form_readonly ac">    <!-- 법인 -->
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='sal.lbl.corpSsnCrnTp' /></th>       <!-- 법인유형 -->
                            <td>
                                <input id="drvSsnCrnTp_02" readonly class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.ssnCrnNo' /></th>       <!-- 증서번호 -->
                            <td colspan="3">
                                <input id="drvSsnCrnNo_02" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code='par.lbl.telNo' /></th>            <!-- 회사전화번호 -->
                            <td>
                                <input id="drvTelNo1_02" readonly class="form_input form_readonly">
                                <input type="hidden" id="drvTelNo2_02">    <!-- 전화번호2 화면에 없음 -->
                            </td>
                            <th scope="row"><spring:message code='global.lbl.emailNm' /></th>       <!-- 이메일 -->
                            <td>
                                <input id="drvEmailNm_02" readonly class="form_input form_readonly" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.sung' /></th>      <!-- 성 -->
                            <td>
                                <input id="drvSungNm_02" readonly class="form_input form_readonly" />
                                <input type="hidden" id="drvSungCd_02" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.cityCd' /></th>      <!-- 시 -->
                            <td>
                                <input id="drvCityNm_02" readonly class="form_input form_readonly" />
                                <input type="hidden" id="drvCityCd_02" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.dist' /></th>      <!-- 구 -->
                            <td>
                                <input id="drvDistNm_02" readonly class="form_input form_readonly" />
                                <input type="hidden" id="drvDistCd_02" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.zipCd' /></th>   <!-- 우편번호 -->
                            <td>
                                <input id="drvZipCd_02" readonly class="form_input form_readonly" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.detlAddr' /></th>   <!-- 상세주소 -->
                            <td>
                                <input id="drvAddrDetlCont_02" readonly class="form_input form_readonly" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- //법인 -->
        </div>
        <!-- //실운전자 -->

        <!-- 탁송 -->
        <div>
            <div class="table_form">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:12%;">
                        <col style="width:7%;">
                        <col style="width:12%;">
                        <col style="width:7%;">
                        <col style="width:12%;">
                        <col style="width:10%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.consTp' /></th>        <!-- 탁송구분 -->
                            <td>
                                <ul class="tabmenu">
                                    <li id="consTp01" class="on"><button type="button"><spring:message code='sal.lbl.vsit' /></button></li>        <!-- 방문 -->
                                    <li id="consTp02"><button type="button"><spring:message code='sal.lbl.cons' /></button></li>                   <!-- 탁송 -->
                                </ul>
                                <input type="hidden" id="consTp" name="consTp" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.consAmt' /></th>       <!-- 탁송료 -->
                            <td>
                                <input id="consConsAmt" name="consConsAmt" onblur="bf_addConsAmt();" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.zipCd' /></th>   <!-- 우편번호 -->
                            <td>
                                <div class="form_search">
                                    <input id="consZipCd" name="consZipCd" readonly class="form_input" maxlength="6" data-json-obj="true" />
                                    <a href="javascript:bf_zipCodeSearch();"><spring:message code='global.btn.search' /></a>       <!-- 조회 -->
                                </div>
                            </td>
                            <td colspan="2"></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.consAddr' /> <spring:message code='global.lbl.sung' /></th>      <!-- 탁송지 성 -->
                            <td>
                                <input id="consSungNm" name="consSungNm" class="form_input form_readonly" readonly data-json-obj="true" />
                                <input id="consSungCd" name="consSungCd" type="hidden" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.cityCd' /></th>      <!-- 시 -->
                            <td>
                                <input id="consCityNm" name="consCityNm" class="form_input form_readonly" readonly data-json-obj="true" />
                                <input id="consCityCd" name="consCityCd" type="hidden" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.dist' /></th>      <!-- 구 -->
                            <td>
                                <input id="consDistNm" name="consDistNm" class="form_input form_readonly" readonly data-json-obj="true" />
                                <input id="consDistCd" name="consDistCd" type="hidden" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.detlAddr' /></th>       <!-- 상세주소 -->
                            <td>
                                <input id="consAddrDetlCont" name="consAddrDetlCont" class="form_input" data-json-obj="true" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- //탁송 -->

        <!-- 판촉 -->
        <div class="mt0">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='sal.title.corpPromotion' /></h2>        <!-- 법인 프로모션 -->
                <div class="right_area">
                    <div class="txt_total child_borderNone">
                        <!-- 판촉금액 -->
                        <p><spring:message code='sal.lbl.promotionAmt' /> :<input id="promotionTotAmt" class="form_numeric ar" readonly="readonly" style="width:80px;" /></p>
                    </div>
                </div>
            </div>
            <div class="table_grid">
                <div id="corpPromotionGrid"></div>
            </div>

            <div class="header_area">
                <h2 class="title_basic"><spring:message code='sal.title.dlrPromotion' /></h2>        <!-- 딜러 프로모션 -->
            </div>
            <div class="table_grid">
                <div id="dlrPromotionGrid"></div>
            </div>
        </div>
        <!-- //판촉 -->

        <!-- 영수증 -->
        <div>
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
                        <col style="width:15%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.custNm' /></th>        <!-- 고객명 -->
                            <td>
                                <input id="contractPdpstNm" name="contractPdpstNm" class="form_input" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.rcptNo' /></th>       <!-- 영수번호 -->
                            <td>
                                <input id="contractRcptNo" name="contractRcptNo" class="form_input" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.rcptAmt' /></th>       <!-- 영수금액 -->
                            <td>
                                <input id="contractRcptAmt" name="contractRcptAmt" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.rcptDt' /></th>       <!-- 영수일자 -->
                            <td>
                                <input id="contractRcptDt" name="contractRcptDt" class="form_datepicker" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='sal.lbl.rcptScan' /></th>      <!-- 영수증스캔 -->
                            <td colspan="3">
                                <input id="contractRcptId" name="contractRcptId" readonly class="form_input form_readonly" style="width:85%;" data-json-obj="true" />
                                <button type="button" id="rcpScan" class="btn_s"><spring:message code='sal.lbl.scan' /></button>         <!-- 스캔 -->
                            </td>
                            <td colspan="4"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- //영수증 -->

        <!-- 입출금 -->
        <div class="mt0">
            <div class="header_area">
                <div class="btn_right">
                    <button id="btnPayInfoSave" type="button" class="btn_s"><spring:message code='global.btn.save' /></button>      <!-- 저장 -->
                    <button id="btnPayInfoAdd" type="button" class="btn_s"><spring:message code='global.btn.rowAdd' /></button>     <!-- 행추가 -->
                    <button id="btnPayInfoDel" type="button" class="btn_s"><spring:message code='global.btn.rowDel' /></button>     <!-- 행삭제 -->
                    <button id="btnPayInfoCancel" type="button" class="btn_s"><spring:message code='global.btn.cancel' /></button>  <!-- 취소 -->
                </div>
            </div>
            <div class="table_grid">
                <div id="payInfoGrid"></div>
            </div>
        </div>
        <!-- //입출금 -->

        <!-- 중고차치환 -->
        <div>
            <div class="table_form">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:24%;">
                        <col style="width:10%;">
                        <col style="width:23%;">
                        <col style="width:10%;">
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
                                <div class="form_search" style="width:35%">
                                <input id="sUsrVinNo" type="text" maxlength="17" class="form_input"/>
                                    <a href="#" onclick="bf_searchUsedCarVinNo();" ><spring:message code='global.lbl.search' /></a>   <!-- 검색 -->
                                </div>
                                <input id="usrVinNo" name="usrVinNo" maxlength="17" readonly class="form_input form_readonly" style="width:47%" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='sal.lbl.documentNo' /></th>   <!-- 매입번호 -->
                            <td>
                                <input id="purcNo" name="purcNo" class="form_input" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.sbsAmt' /></th>    <!-- 치환금액 -->
                            <td>
                                <input id="usrSbstAmt" name="usrSbstAmt" onblur="bf_addUsrSbstAmt();" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                            </td>
                            <th scope="row"></th>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- //중고차치환 -->

        <!-- 추가서비스 -->
        <div class="mt0">
            <!-- 번호판 등록서비스 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='sal.title.plateReg' /></h2>      <!-- 번호판 등록서비스 -->
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
                                <th scope="row"><spring:message code='sal.lbl.plateRegPro' /></th>   <!-- 번호판 등록처리 -->
                                <td>
                                    <ul class="tabmenu">
                                        <li id="tabRegTp01"><button type="button"><spring:message code='global.lbl.execution' /></button></li>              <!-- 대행 -->
                                        <li id="tabRegTp02" class="on"><button type="button"><spring:message code='global.lbl.himSelf' /></button></li>     <!-- 본인 -->
                                    </ul>
                                    <input type="hidden" id="regTp" name="regTp" data-json-obj="true" />
                                </td>
                                <td colspan="6"></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.regPreAmt' /></th>        <!-- 등록비 선수금 -->
                                <td>
                                    <input id="regPreAmt" name="regPreAmt" onblur="bf_addRegAmt();" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.realRegAmt' /></th>         <!-- 실제등록비용 -->
                                <td>
                                    <input id="realRegAmt" name="realRegAmt" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.regDist' /></th>             <!-- 등록장소 -->
                                <td>
                                    <input id="regDistCd" name="regDistCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.regExpcDt' /></th>         <!-- 등록예상일자 -->
                                <td>
                                    <input id="regExpcDt" name="regExpcDt" class="form_datepicker" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.purcTaxPreAmt' /></th>        <!-- 구입세 선수금 -->
                                <td>
                                    <input id="purcTaxPreAmt" name="purcTaxPreAmt" onblur="bf_sumRegAmt();" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.realPurcTaxAmt' /></th>       <!-- 실제구입세 -->
                                <td>
                                    <input id="realPurcTaxAmt" name="realPurcTaxAmt" onblur="bf_sumRegAmt();" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.regDifferenceAmt' /></th>     <!-- 차액 -->
                                <td>
                                    <input id="regDifferenceAmt" readonly class="form_numeric form_readonly ar" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.regFeeAmt' /></th>          <!-- 등록수수료 -->
                                <td>
                                    <input id="regFeeAmt" name="regFeeAmt" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //번호판 등록서비스 -->

            <!-- 금융서비스 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='sal.title.fincService' /></h2>      <!-- 금융서비스 -->
                    <div class="fl">
                        <label><input type="checkbox" id="fincReq" class="form_check" onclick="bf_fincReq()"> <spring:message code='global.lbl.fincApp' /></label>       <!-- 금융신청 -->
                    </div>
                </div>
                <div id="divFincReq" class="table_form" style="display:none">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:11%;">
                            <col style="width:14%;">
                            <col style="width:8%;">
                            <col style="width:6%;">
                            <col style="width:9%;">
                            <col style="width:6%;">
                            <col style="width:8%;">
                            <col style="width:14%;">
                            <col style="width:8%;">
                            <col style="width:14%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.fincItemKindCd' /></th>   <!-- 상품관리유형 -->
                                <td>
                                    <ul class="tabmenu">
                                        <li id="tabFincKindCd01" class="on"><button type="button"><spring:message code='global.lbl.amt' /></button></li>      <!-- 금액 -->
                                        <li id="tabFincKindCd02"><button type="button"><spring:message code='global.lbl.model' /></button></li>     <!-- 모델 -->
                                    </ul>
                                    <input type="hidden" id="fincItemKindCd" name="fincItemKindCd" data-json-obj="true" />
                                </td>
                                <td>
                                    <button type="button" class="btn_xs" onclick="bf_clickEstimate()"><spring:message code='ser.lbl.estimate' /></button>   <!-- 견적 -->
                                </td>
                                <td colspan="7"></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.fincCmp' /></th>       <!-- 금융사 -->
                                <td>
                                    <input id="fincCmpCd" name="fincCmpCd" class="form_comboBox" data-json-obj="true" />
                                </td>

                                <th scope="row"><spring:message code='sal.lbl.fincRpayPrid' /></th>       <!-- 상환기간 -->
                                <td>
                                    <input id="fincRpayPrid" name="fincRpayPrid" maxlength="3" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.fincLoadRate' /></th>    <!-- 대출비율(%) -->
                                <td>
                                    <input id="fincLoadRate" name="fincLoadRate" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.vehiclePrice' /></th>       <!-- 차량가격 -->
                                <td>
                                    <input id="fincCarAmt" readonly class="form_numeric form_readonly ar" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.fincFeeAmt' /></th>      <!-- 대출수수료 -->
                                <td>
                                    <input id="fincFeeAmt" name="fincFeeAmt" readonly class="form_numeric form_readonly ar" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.fincItem' /></th>             <!-- 상품 -->
                                <td>
                                    <input id="fincItemCd" name="fincItemCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.fincReqAmt' /></th>        <!-- 신청금액 -->
                                <td colspan="2">
                                    <input id="fincReqAmt" name="fincReqAmt" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                <td></td>
                                <th scope="row"><spring:message code="global.lbl.instIntrRate" /></th>      <!-- 할부이자율 -->
                                <td>
                                    <input id="instIntrRate" name="instIntrRate" readonly class="form_numeric form_readonly ar" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="sal.lbl.grteIncAmt" /></th> <!-- 보증수수료 -->
                                <td>
                                    <input id="grteIncAmt" name="grteIncAmt" readonly class="form_numeric form_readonly ar" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.fincReqDt' /></th>     <!-- 신청일자 -->
                                <td>
                                    <input id="fincReqDt" name="fincReqDt" class="form_datepicker" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.fincEndDt' /></th>     <!-- 만기일자 -->
                                <td colspan="2">
                                    <input id="fincEndDt" name="fincEndDt" class="form_datepicker" data-json-obj="true" />
                                </td>
                                <td colspan="5"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //금융서비스 -->
        </div>
        <!-- //추가서비스 -->

        <!-- 보험서비스 -->
        <div class="mt0">
            <!-- 보험서비스 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='sal.title.incService' /></h2>      <!-- 보험서비스 -->
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
                                <th scope="row"><spring:message code='sal.lbl.incAap' /></th>       <!-- 보험처리 -->
                                <td>
                                    <ul class="tabmenu">
                                        <li id="incAapTp01"><button type="button"><spring:message code='global.lbl.execution' /></button></li>                <!-- 대행 -->
                                        <li id="incAapTp02" class="on"><button type="button"><spring:message code='global.lbl.himSelf' /></button></li>       <!-- 본인 -->
                                    </ul>
                                    <input type="hidden" id="incAapTp" name="incAapTp" data-json-obj="true" />
                                </td>

                                <td colspan="6"></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.incExpcAmt' /></th>     <!-- 보험예상금액 -->
                                <td>
                                    <input id="incExpcAmt" name="incExpcAmt" readonly class="form_numeric form_readonly ar" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.realIncAmt' /></th>     <!-- 실보험금액 -->
                                <td>
                                    <input id="realIncAmt" name="realIncAmt" readonly class="form_numeric form_readonly ar" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.regDifferenceAmt' /></th>             <!-- 차액 -->
                                <td>
                                    <input id="incDifferenceAmt" readonly class="form_numeric form_readonly ar"/>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.incFeeAmt' /></th>       <!-- 보험수수료 -->
                                <td>
                                    <input id="incFeeAmt" name="incFeeAmt" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.incCmp' /></th>        <!-- 보험회사 -->
                                <td>
                                    <input id="incCmpCd" name="incCmpCd" class="form_comboBox" data-json-obj="true" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.incProfitNm' /></th>      <!-- 제1수익자 -->
                                <td>
                                    <input id="incProfitNm" name="incProfitNm" class="form_input" data-json-obj="true"/>
                                </td>
                                <td colspan="4"></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.incType' /></th>       <!-- 보험종류 -->
                                <td colspan="7">
                                    <div class="header_area">
                                        <div class="btn_right">
                                            <button id="btnIncAdd" type="button"  class="btn_s"><spring:message code='global.btn.rowAdd' /></button>        <!-- 행추가 -->
                                            <button id="btnIncDel" type="button" class="btn_s"><spring:message code='global.btn.rowDel' /></button>         <!-- 행삭제 -->
                                            <button id="btnIncCancel" type="button" class="btn_s"><spring:message code='global.btn.cancel' /></button>          <!-- 취소 -->
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

        <!-- 파일 및 비고 -->
        <div class="mt0">
            <!-- 파일업로드 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.title.fileUpload' /></h2>      <!-- 파일업로드 -->
                    <div class="btn_right">
                        <span class="btn_file" id="fileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
                        <button type="button" class="btn_s" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
                    </div>
                </div>
                <div class="table_grid">
                    <div id="fileGrid"></div>
                </div>
            </section>
            <!-- //파일업로드 -->

            <!-- 비고 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.lbl.remark' /></h2>        <!-- 비고 -->
                </div>
                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.specialFact' /></th>       <!-- 특이사항 -->
                                <td>
                                    <textarea id="remark" name="remark" rows="4" cols="30" placeholder="1,000字以" class="form_textarea" data-json-obj="true" ></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //비고 -->
        </div>
        <!-- //파일 및 비고 -->

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

        <!-- 부가비용 -->
        <div class="mt0">
            <div class="header_area">
                <div class="btn_right">
                    <div class="txt_total mt0 child_borderNone" style="display:inline-block;position:relative;top:3px;margin-right:10px;">
                        <!-- 합계 -->
                        <p><spring:message code='global.lbl.total' /> :<input id="otherTotAmt" class="form_numeric" readonly="readonly" style="width:80px;" /></p>
                    </div>
                    <button id="btnOptionAdd" type="button" class="btn_s"><spring:message code='global.btn.rowAdd' /></button>          <!-- 행추가 -->
                    <button id="btnOptionDel" type="button" class="btn_s"><spring:message code='global.btn.rowDel' /></button>          <!-- 행삭제 -->
                    <button id="btnOptionCancel" type="button" class="btn_s"><spring:message code='global.btn.cancel' /></button>         <!-- 취소 -->
                </div>
            </div>
            <div class="table_grid">
                <div id="optionGrid"></div>
            </div>
            <div class="table_form mt10">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:90%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.remark' /></th>     <!-- 비고 -->
                            <td>
                                <input id="remark1" name="remark1" class="form_input" data-json-obj="true" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- //부가비용 -->

        <!-- 가격 -->
        <div class="mt0">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='sal.lbl.priceDetaile' /></h2>       <!-- 가격명세 -->
                </div>
            <div class="table_list table_list_v1">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:50%;">
                        <col>
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col"><spring:message code='sal.lbl.no' /></th>         <!-- NO -->
                            <th scope="col"><spring:message code='global.lbl.item' /></th>    <!-- 항목 -->
                            <th scope="col"><spring:message code='global.lbl.amt' /></th>     <!-- 금액 -->
                        </tr>
                    </thead>
                    <tbody>
                        <%--
                        <tr>
                            <td class="ac"></td>
                            <td><spring:message code='sal.lbl.whslAmt' /></td>                <!-- 구매가 -->
                            <td class="ar child_borderNone"><input id="prcWhslAmt" class="form_numeric ar" readonly="readonly" /></td>
                        </tr>
                         --%>
                        <tr>
                            <td class="ac"></td>
                            <td><spring:message code='sal.lbl.retlAmt' /></td>              <!-- 공장지도가 -->
                            <td class="ar child_borderNone"><input id="prcRetlAmt" class="form_numeric ar" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td class="ac">1</td>
                            <td><spring:message code='sal.lbl.promotionAmt' /></td>               <!-- 판촉금액 -->
                            <td class="ar child_borderNone"><input id="prcPromotionAmt" class="form_numeric ar" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td class="ac">2</td>
                            <td><spring:message code='sal.lbl.sbstAmt' /></td>               <!-- 치환차감 -->
                            <td class="ar child_borderNone"><input id="prcSbstAmt" class="form_numeric ar" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td class="ac">3</td>
                            <td><spring:message code='sal.lbl.goodsAmt' /></td>               <!-- 용품금액 -->
                            <td class="ar child_borderNone"><input id="prcGoodsAmt" class="form_numeric ar" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td class="ac">4</td>
                            <td><spring:message code='global.lbl.consAmt' /></td>                <!-- 탁송료 -->
                            <td class="ar child_borderNone"><input id="prcConsAmt" class="form_numeric ar" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td class="ac">5</td>
                            <td><spring:message code='sal.lbl.incAmt' /></td>                <!-- 보험료 -->
                            <td class="ar child_borderNone"><input id="prcIncAmt" class="form_numeric ar" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td class="ac">6</td>
                            <td><spring:message code='sal.lbl.prcAapAmt' /></td>              <!-- 차량등록비 -->
                            <td class="ar child_borderNone"><input id="prcAapAmt" class="form_numeric ar" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td class="ac">7</td>
                            <td><spring:message code='sal.lbl.optionAmt' /></td>               <!-- 부가비용 -->
                            <td class="ar child_borderNone"><input id="prcVatAmt" class="form_numeric ar" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td class="ac">8</td>
                            <td><strong><spring:message code='sal.lbl.realCarAmt' /></strong></td>    <!-- 실제차량금액 -->
                            <td class="ar child_borderNone"><input id="prcRealCarAmt" class="form_numeric ar font_bold" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td class="ac">9</td>
                            <td><strong><spring:message code='global.lbl.oterTotAmt' /></strong></td>        <!-- 기타비용합계 -->
                            <td class="ar child_borderNone"><input id="prcEtcSumAmt" class="form_numeric ar font_bold" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td class="ac">10</td>
                            <td><strong><spring:message code='sal.lbl.realPayAmt' /></strong></td>        <!-- 실제지불금액 -->
                            <td class="ar td_total child_borderNone"><input id="prcRealPayAmt" class="form_numeric ar font_bold" readonly="readonly" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- //가격 -->

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

    <!-- 실운전자 고객유형 -->
    <input  id="drvCustTp" name="drvCustTp" type="hidden" data-json-obj="true" />

    <!-- 견적번호 -->
    <input id="estimateNo" name="estimateNo" type="hidden" data-json-obj="true" />

    <!-- 파일업로드 -->
    <input type="hidden" id="fileDocId" name="fileDocId" data-json-obj="true" />

    <!-- 저장 후 선택될 계약번호 -->
    <input id="savedContractNo" value="" />

    <!-- 법인 프로모션 금액 -->
    <input id="corpPromotionAmt" name="corpPromotionAmt" data-json-obj="true" />

    <!-- 딜러 프로모션 금액 -->
    <input id="dlrPromotionAmt" name="dlrPromotionAmt" data-json-obj="true" />

    <!-- 할인레벨 코드 -->
    <input id="dcLvlCd" name="dcLvlCd" data-json-obj="true" />

    <!-- 할인승인여부 -->
    <input id="dcApproveYn" name="dcApproveYn" value="N" data-json-obj="true" />

    <!-- 판매기회번호 -->
    <input id="saleOpptNo" name="saleOpptNo" data-json-obj="true" />

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

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var sevenDay = "${sevenDay}";   // 현재일의 7일전
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후
var threeMonthDay = "${threeMonthDay}"; // 현재일 기준 3달전

// 차량 및 탁송정보 - 모델 선택 변수. (프로모션 조회)
var onSelectModelCorp = "";
var onSelectModelDlr  = "";

// 계약생성 전 데이터
//var bfObj = {};

//차종조회
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
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

//탁송구분 :SAL125
// 탁송 :C , 방문 :I

//과세구분 :SAL124

// 차량등록지역 :SAL086
var regDistCdList = [];
<c:forEach var="obj" items="${regDistCdDS}">
    regDistCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
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

// 금융사 :SAL055
var fincCmpCdList = [];
<c:forEach var="obj" items="${fincCmpCdDS}">
    fincCmpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 금융상품 SA_0117T - 금액
var fincItemObj = {};
<c:forEach var="obj" items="${fincItemDS}">
    if(fincItemObj.hasOwnProperty("${obj.fincCmpCd}")){
        fincItemObj["${obj.fincCmpCd}"].push({cmmCd:"${obj.fincItemCd}", cmmCdNm:"${obj.fincItemNm}", instIntrRate:"${obj.instIntrRate}", grteIncAmt:"${obj.grteIncAmt}", hdlgFeeAmt:"${obj.hdlgFeeAmt}", fincItemPrid:"${obj.fincItemPrid}"});
    }else{
        fincItemObj["${obj.fincCmpCd}"] = [];
        fincItemObj["${obj.fincCmpCd}"].push({cmmCd:"${obj.fincItemCd}", cmmCdNm:"${obj.fincItemNm}", instIntrRate:"${obj.instIntrRate}", grteIncAmt:"${obj.grteIncAmt}", hdlgFeeAmt:"${obj.hdlgFeeAmt}", fincItemPrid:"${obj.fincItemPrid}"});
    }
</c:forEach>

// 금융상품 SA_0117T - 모델
var fincItemModelObj = {};

//프로모션 유형 :SAL010
//프로모션 적용방법  :SAL132

// 수납유형 :SAL011
var rectTpList = [];
var rectTpObj = {};
<c:forEach var="obj" items="${rectTpDS}">
    rectTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    rectTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 입출금유형 :SAL012
var ioTpList = [];
var ioTpObj = {};
<c:forEach var="obj" items="${ioTpDS}">
    ioTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ioTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 입출금대상유형 :SAL013
var ioTargetTpList = [];
var ioTargetTpObj = {};
<c:forEach var="obj" items="${ioTargetTpDS}">
    ioTargetTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ioTargetTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
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

var popupWindow;
var dealerSearchPopupWin;

/******************************************
 * ready ()
 ******************************************/
$(document).ready(function() {

    // 본문 팝업 설정
    $("#callContractReWindow").kendoWindow({
        animation :false
        ,draggable:true
        ,pinned:true        // 팝업스크롤링 막음
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.title.retailContractOrd' />"      // 계약관리
        ,width:"950px"
        ,height:"500px"
    }).data("kendoWindow");


    $("#btnViewDetail").kendoButton({    // 상세조회.
        click:function(e){
            var grid = $("#contGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            if ( dms.string.isNotEmpty(selectedItem) ){
                fn_contOnLoad(selectedItem);
                //refreshAll();
                //fn_contGridDBclick(selectedItem);
                //viewDetailPopup();
            } else {
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    });


    $("#btnSearch").kendoButton({ // 조회
         enable:true,
         click:function(e){
             
             var fromDt = $("#sStartContractDt").data("kendoExtMaskedDatePicker").value();
             var toDt = $("#sEndContractDt").data("kendoExtMaskedDatePicker").value();

             if(salesJs.validate.isFromDateValid(fromDt, toDt)) {
                 dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
                 $("#sStartContractDt").focus();
                 return false;
             }
             if(salesJs.validate.isFromDateValid(toDt, fromDt)) {
                 dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
                 $("#sEndContractDt").focus();
                 return false;
             }

             if(!salesJs.validate.isDateValidPeriod(fromDt, toDt)){
                 dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
                 $("#sEndContractDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                 $("#sEndContractDt").focus();
                 return false;
             }
             
             $('#contGrid').data('kendoExtGrid').dataSource.page(1);
             refreshAll();
             fn_btnState();  // 버튼상태
         }
    });

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
                       , msg :"<spring:message code='global.lbl.create' var='globalLblCreate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblCreate}' />"
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

    // 수정
    $("#btnUpdate").kendoButton({
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
                    url :"<c:url value='/sal/cnt/contract/contractMessagePopup.do' />"
                    ,data :{
                        "type" :null
                        ,"autoBind" :false
                        , msg :"<spring:message code='global.lbl.update' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />"
                        , btnMsg01 :"<spring:message code='global.btn.update' />"
                        , btnMsg02 :"<spring:message code='global.btn.cancel' />"
                        ,"callbackFunc" :function(data){
                            if (data.msg == "01"){
                                // 직책별 할인금액 검사 로직 추가
                                dlrPromotionAmtChk('update');
                             }else{
                                 return false;
                             }
                         }
                    }
                }
            });
        }
    });

    $("#btnRefresh").kendoButton({ // 초기화
        click:function(e){

            refreshAll();
            fn_btnState();      // 버튼상태
            viewDetailPopup();  // 상세팝업.

            /*
            popupWindow = dms.window.popup({
                windowId :"messagePopup"
                ,title :false
                ,width :300
                ,height:110
                ,content :{
                    url :"<c:url value='/sal/cnt/contract/contractMessagePopup.do' />"
                    ,data :{
                        "type" :null
                        ,"autoBind" :false
                        , msg :"<spring:message code='global.info.refresh' /> <br/> <spring:message code='global.lbl.progress' var='globalLblProgress' /><spring:message code='global.info.andMsg' arguments='${globalLblProgress}' />"
                        , btnMsg01 :"<spring:message code='global.btn.new' />"
                        , btnMsg02 :"<spring:message code='global.btn.cancel' />"
                        ,"callbackFunc" :function(data){
                            if (data.msg == "01"){
                                refreshAll();
                                fn_btnState();      // 버튼상태
                                viewDetailPopup();  // 상세팝업.
                             }else{
                                 return false;
                             }
                         }
                    }
                }
            });
            */

        }
    });

    // 계약생성
    /*
    $("#btnCreate").kendoButton({
        enable:false,
        click:function(e){

            if($("#contractNo").val() == ""){
                // 대상을 선택하십시오.
                dms.notification.info("<spring:message code='global.lbl.rcpeNm' var='globalLblRcpeNm' /><spring:message code='global.info.validation.select' arguments='${globalLblRcpeNm}' />");
                return false;
            }

            if(bfObj != null ){
                var formData = $("#contForm").serializeObject($("#contForm").serializeArrayInSelector("[data-json-obj='true']"));
                var v_Flag = false;
                $.each(formData, function(key, value){
                    if( bfObj[key] != value ){
                        v_Flag = true;
                    }
                });

                if(v_Flag){
                    // 변경사항이 있습니다.<br />수정처리 이후 다시 계약생성을 하여 주십시오.
                    dms.notification.info("<spring:message code='sal.info.conCreateChkMsg' />");
                    return false;
                }
            }

            // 계약생성
            if( $("#contractStatCd").val() == "10" ){

                popupWindow = dms.window.popup({
                    windowId :"messagePopup"
                    ,title :false
                    ,width :300
                    ,height:110
                    ,modal:true
                    ,content :{
                        url :"<c:url value='/sal/cnt/contract/contractMessagePopup.do' />"
                        ,data :{
                            "type" :null
                            ,"autoBind" :false
                                // xxxx(계약)를(을) 생성 하시겠습니까?
                            , msg :"("+$("#contractNo").val() +")"+" <spring:message code='sal.info.contractCreateMsg' />"
                            , btnMsg01 :"<spring:message code='sal.btn.contractCreate' />"
                            , btnMsg02 :"<spring:message code='global.btn.cancel' />"
                            ,"callbackFunc" :function(data){
                                if (data.msg == "01"){
                                    approval();
                                }else{
                                     return false;
                                 }
                             }
                        }
                    }
                });

            }else{
                // 저장시에만 계약생성이 가능합니다.
                dms.notification.info("<spring:message code='sal.info.checkContractSave' />");
            }
        }
    });
    */

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
                       , btnMsg01 :"<spring:message code='global.btn.save' />"
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


    $("#btnRemove").kendoButton({
        enable:false,
        click:function(e){

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
                                 // xxxx(계약번호) 계약을 삭제 하시겠습니까??
                        , msg :"("+$("#contractNo").val() +")"+ "<spring:message code='sal.info.contractClose' />"
                        , btnMsg01 :"<spring:message code='global.lbl.del' />"
                        , btnMsg02 :"<spring:message code='global.btn.cancel' />"
                        ,"callbackFunc" :function(data){
                            if (data.msg == "01"){
                                remove();
                             }else{
                                 return false;
                             }
                         }
                    }
                }
            });

        }
    });

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

    $("#btnContPrint").kendoButton({//계약서출력
        enable:false,
        click:function(e){
            var fileNm = 'selectSaleContractRpt';
            var num = dms.ajax.getJson({
                url :"<c:url value='/sal/cnt/contractRe/selectDlrAmtTxt.do' />"
                ,async :false
            });
            fileNm += dms.string.isEmpty(num)?"01":num;
            
            //parent._createOrReloadTabMenu("<spring:message code='sal.btn.contPrint' />", "<c:url value='/ReportServer?reportlet=sale/"+fileNm+".cpt'/>&sDlrCd="+dlrCd+"&sContractNo="+$("#contractNo").val());
            var iReportParam =  "&sDlrCd="+dlrCd+"&sContractNo="+$("#contractNo").val();
            var iReportUrl = "<c:url value='/ReportServer?reportlet=sale/"+fileNm+".cpt' />"+iReportParam;
            var newWindow=open(iReportUrl, "<spring:message code='sal.btn.contPrint' />", 'top=0,left=0,width=925,height=800,toolbar=no,menubar=no,location=no,status=yes,directories=yes,resizable=yes,scrolling=yes,scrollbars=1');
        }
    });

    $("#btnPayPrint").kendoButton({//결산서출력
        enable:false,
        click:function(e){
            // 결산서출력 개발진행 예정중입니다.
            alert("<spring:message code='sal.btn.payPrint' /> <spring:message code='global.info.developIng' />");
        }
    });

    $("#rcpScan").kendoButton({ //영수증 스캔
        click:function(e){

            popupWindow = dms.window.popup({
                windowId :"rcpScanPopup"
                , title :"<spring:message code='sal.lbl.rcptScan' />"   // 영수증스캔
                , modal:true
                , content :{
                    url :"<c:url value='/sal/cmm/selectScanSearchPopup.do'/>"
                    , data :{
                        "autoBind" :false
                        , "type"   :null
                        , "callbackFunc" :function(data){
                            if(data.length >= 1) {
                                //console.log(data);
                            }
                            popupWindow.close();
                        }
                    }
                }
            });
        }
    });

    /* 입출금 관리*/
    $("#btnPayInfoAdd").kendoButton({   // 입출금내역 - 행추가
        click:function(e){

            $('#payInfoGrid').data('kendoExtGrid').dataSource.insert(0, {
                 "dlrCd" :""
                ,"contractNo" :$("#contractNo").val()
                ,"rcvTp" :""
                ,"dpstWdrwTp" :""
                ,"dpstWdrwDt" :""
                ,"dpstWdrwTargTp" :""
                ,"dpstWdrwAmt" :""
                ,"remark" :""
            });
        }
    });

    $("#btnPayInfoDel").kendoButton({      // 입출금내역 - 행삭제
        click:function(e){
            var grid = $("#payInfoGrid").data("kendoExtGrid");
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

    $("#btnPayInfoCancel").kendoButton({    // 입출금내역 - 취소
        click :function(e) {
            $('#payInfoGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    $("#btnPayInfoSave").kendoButton({      // 입출금내역 - 저장
        click:function(e){
            var grid = $("#payInfoGrid").data("kendoExtGrid");

            if($("#contractNo").val() == ""){
                // 계약 저장이후에만 입/출금 기록이 가능합니다.
                dms.notification.warning("<spring:message code='sal.info.contractPayInfoMsg' />");
                return false;
            }

            var saveData = grid.getCUDData("insertPayInfoList", "updatePayInfoList", "deletePayInfoList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url :"<c:url value='/sal/cnt/contractRe/savePayInfo.do' />"
                    ,data :JSON.stringify(saveData)
                    ,type :'POST'
                    ,dataType :'json'
                    ,contentType :'application/json'
                    ,error :function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success :function(jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });

    /* 보험서비스 관리*/
    $("#btnIncAdd").kendoButton({   // 보험서비스 - 행추가
        click:function(e){
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

            // 차종
            /*
            if($("#carlineCd").data("kendoExtDropDownList").value() == "" ){
                dms.notification.info("<spring:message code='global.lbl.carLine' var='globalLblCarLine' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCarLine}' />");
                return false;
            }
            */

            $('#goodsGrid').data('kendoExtGrid').dataSource.insert(0, {
                "nChk" :"N"
                ,"serviceYn" :"N"
            });
        }
    });

    $("#btnGoodsDel").kendoButton({      // 용품 - 행삭제
        click:function(e){
            var grid = $("#goodsGrid").data("kendoExtGrid");
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

    $("#btnGoodsCancel").kendoButton({    // 용품 - 취소
        click :function(e) {
            $('#goodsGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    /* 부가비용 관리*/
    $("#btnOptionAdd").kendoButton({   // 부가비용 - 행추가
        click:function(e){
            $('#optionGrid').data('kendoExtGrid').dataSource.insert(0, {});
        }
    });

    $("#btnOptionDel").kendoButton({      // 부가비용 - 행삭제
        click:function(e){
            var grid = $("#optionGrid").data("kendoExtGrid");
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

    $("#btnOptionCancel").kendoButton({    // 부가비용 - 취소
        click :function(e) {
            $('#optionGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    //========파일삭제
    $("#fileDelete").click(function(){
        var grid = $("#fileGrid").data("kendoExtGrid");
        var rows = grid.select();

        if (rows.length < 1) {
            //목록을 선택하여 주십시오.
            dms.notification.info("<spring:message code='global.info.required.select'/>");
            return;
        }

        var deleteList = [];
        rows.each(function(index, row) {
            var dataItem = grid.dataItem(row);
            deleteList.push({"fileDocNo" :dataItem.fileDocNo, "fileNo" :dataItem.fileNo});
        });

        $.ajax({
            url :"<c:url value='/cmm/sci/fileUpload/deleteFiles.do' />"
            ,data :JSON.stringify(deleteList)
            ,type :'POST'
            ,dataType :'json'
            ,contentType :'application/json'
            ,error :function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            }
            ,success :function(jqXHR, textStatus) {
                grid.dataSource._destroyed = [];
                grid.dataSource.read();

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
        });
    });


    $("#custTp").val("01");       // 계약자 고객유형
    $("#drvCustTp").val("01");    // 실운전자 고객유형


    $("#sDlrCd").val(dlrCd);        // 딜러코드
    $("#sDlrNm").val(dlrNm);        // 딜러명
    /*
    [TOBE] 기능 결정
    $("#sDlrCd").kendoAutoComplete({
        minLength :2
        ,template :"[#:data.dlrCd#]#:data.dlrNm#"
        ,dataTextField :"dlrCd"
        ,dataSource :{
            serverFiltering :true
            ,transport :{
                read :{
                     url :"<c:url value='/cmm/cmp/plant/selectDealersForSuggest.do' />"
                     ,dataType :"json"
                     ,type :"POST"
                     ,contentType :"application/json"
                }
                ,parameterMap :function(options, operation){
                    if (operation == "read") {
                        return kendo.stringify({
                            "sText" :$("#sDlrCd").data("kendoAutoComplete").value()
                            ,"recordCountPerPage" :10
                        });
                    }
                }
            }
            ,schema :{
                data :"data"
                ,total :"total"
            }
        }
    });
    $("#sDlrCd").data("kendoAutoComplete").value(dlrCd);        // 딜러코드
    */

    //판매담당자
    $("#sSaleEmpNo").kendoExtDropDownList({
        dataTextField :"saleEmpNm"
       ,dataValueField :"saleEmpCd"
       ,dataSource:selectSaleEmpDSList
       ,optionLabel:" "
    });

    // 계약유형
    $("#sContractTp").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(sContractTpList)
       ,optionLabel:" "
    });

    // 계약상태
    $("#sContractStatCd").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(contractStatCdList)
       ,optionLabel:" "
    });

    // 계약 시작일
    $("#sStartContractDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:threeMonthDay
    });

    // 계약 종료일
    $("#sEndContractDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    // 계약시작일은 계약종료일보다 클수가 없다.
    //$("#sStartContractDt").on('change', {from:$("#sStartContractDt"), to:$("#sEndContractDt"), msg:"<spring:message code='global.err.checkDateValue'/>"}, salesJs.event.fnChkSearchDate);
    //$("#sEndContractDt").on('change', {from:$("#sStartContractDt"), to:$("#sEndContractDt"), msg:"<spring:message code='global.err.checkDateValue'/>"}, salesJs.event.fnChkSearchDate);

    /**
     * 차종 콤보박스
     */
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField :"carlineNm"
       ,dataValueField :"carlineCd"
       ,dataSource :carLineCdList
       ,optionLabel:" "
       , filter :"contains"
       ,filtering:function(e){
           var filter = e.filter;
       }
       ,select :onSelectSearchCarlineCd
    });

    /**
     * 모델 콤보박스
     */
     $("#sModelCd").kendoExtDropDownList({
         dataTextField :"modelNm"
        ,dataValueField :"modelCd"
        ,filter :"contains"
        ,select :onSelectSearchModelCd
        ,optionLabel:" "
     });
     //$("#sModelCd").data("kendoExtDropDownList").wrapper.hide();  // 숨김
     $("#sModelCd").data("kendoExtDropDownList").enable(false);

    /**
    * ocn 콤보박스
    */
    $("#sOcnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,filter :"contains"
        ,optionLabel:" "
    });
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);


    // 탭
    var selectTabId = "contInfoTab";       // 초기값 :계약정보
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
       ,change:function(e) {
           // 프로모션 초기화
           $("#corpPromotionGrid").data('kendoExtGrid').dataSource.data([]);     // 프로모션 초기화
           $("#dlrPromotionGrid").data('kendoExtGrid').dataSource.data([]);      // 프로모션 초기화
           $("#promotionTotAmt").data("kendoExtNumericTextBox").value(0);
           $("#promotionAmt").data("kendoExtNumericTextBox").value(0);
           $("#prcPromotionAmt").data("kendoExtNumericTextBox").value(0);

           bf_sumCarAmt(); // 차량금액 계산

           // 모델이 없을 시 프로모션 조회 못함.
           if($("#modelCd").data("kendoExtDropDownList").value() == ""){return false;}

           // 프로모션 재조회
           $("#corpPromotionGrid").data('kendoExtGrid').dataSource.read();
           $("#dlrPromotionGrid").data('kendoExtGrid').dataSource.read();
       }
    });

    // 2급딜러여부
    /*
    $("#lv2DlrYn").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(ynList)
       ,select :function(e){
           var dataItem = this.dataItem(e.item);
           if(dataItem.cmmCd != "Y"){
               $("#lv2DlrOrgCd").val('');
               $("#lv2DlrOrgNm").val('');
           }
       }
       ,index :0
    });
    */

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
       ,index:0
    });

    // 판매담당자
    $("#saleEmpNo").kendoExtDropDownList({
        dataTextField :"saleEmpNm"
       ,dataValueField :"saleEmpCd"
       ,dataSource:selectSaleEmpDSList
       ,optionLabel:" "
    });

    // 개인 :신분증유형
    $("#ssnCrnTp_01").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(ssnCrnTpPList)
       ,optionLabel:" "
       ,enable:false
    });

    // 법인 :법인유형
    $("#ssnCrnTp_02").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(ssnCrnTpCList)
       ,optionLabel:" "
       ,enable:false
    });

    // 차량
    $("#carlineCd").kendoExtDropDownList({
        dataTextField :"carlineNm"
       ,dataValueField :"carlineCd"
       ,dataSource :carLineCdList
       ,filter :"contains"
       ,select :onSelectCarlineCd
       ,optionLabel:" "
    });

    // 모델
    $("#modelCd").kendoExtDropDownList({
        dataTextField :"modelNm"
       ,dataValueField :"modelCd"
       ,filter :"contains"
       ,select :onSelectModelCd
       ,optionLabel:" "
    });

    //$("#sModelCd").data("kendoExtDropDownList").wrapper.hide();  // 숨김
    $("#modelCd").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#ocnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,filter :"contains"
        ,select :onSelectOcnCd
        ,optionLabel:" "
    });
    $("#ocnCd").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#extColorCd").kendoExtDropDownList({
         dataTextField: "extColorNm"
        ,dataValueField:"extColorCd"
        ,filter :"contains"
        ,select :onSelectExtColorCd
        ,optionLabel:" "
    });
    $("#extColorCd").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#intColorCd").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,filter :"contains"
        ,optionLabel:" "
        ,select :function(e){
            $("#vinNo").val('');    // vin no
            $("#sVinNo").val('');
            $("#carRetlAmt").data("kendoExtNumericTextBox").value(0);  // 지도가
        }
    });
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    //지도가
    $("#carRetlAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 구매가
    $("#whslAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
       //,change :function(){}
    });

    // 공장지도가
    $("#retlAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 판촉금액(프로모션)
    $("#promotionAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
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

    // 용품가격
    $("#goodsAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 탁송료
    $("#consAmt").kendoExtNumericTextBox({
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

    // 대행료
    $("#aapAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 부가금액(부가비용)
    $("#vatAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 실제차량금액
    $("#realCarAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 기타금액합계
    $("#etcSumAmt").kendoExtNumericTextBox({
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

    /* 가격 */
    // 구매가
    $("#prcWhslAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
       //,change :function(){}
    });

    // 공장지도가
    $("#prcRetlAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 판촉금액(프로모션)
    $("#prcPromotionAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 치환차감(중고차)
    $("#prcSbstAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 용품가격
    $("#prcGoodsAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 탁송료
    $("#prcConsAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 보험료
    $("#prcIncAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 대행료
    $("#prcAapAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 부가금액(부가비용)
    $("#prcVatAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 실제차량금액
    $("#prcRealCarAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 기타금액합계
    $("#prcEtcSumAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       ,value:0.00
       ,spinners:false
    });

    // 실제지불금액
    $("#prcRealPayAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

    // 사용자
    // 개인 :신분증유형
    $("#drvSsnCrnTp_01").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(ssnCrnTpPList)
       ,optionLabel:" "
       ,enable:false
    });

    // 법인 :법인유형
    $("#drvSsnCrnTp_02").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(ssnCrnTpCList)
       ,optionLabel:" "
       ,enable:false
    });

    // 탁송료
    $("#consConsAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals :2
       //,min:0.00
       ,value:0.00
       ,spinners:false
    });

   // 탁송구분:방문
   $("#consTp01").click(function(){
       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");

       $("#consConsAmt").data("kendoExtNumericTextBox").value(0);
       $("#consZipCd").val('');
       $("#consSungNm").val('');
       $("#consSungCd").val('');
       $("#consCityNm").val('');
       $("#consCityCd").val('');
       $("#consDistNm").val('');
       $("#consDistCd").val('');
       $("#consAddrDetlCont").val('');
       bf_addConsAmt();     // 탁송료 계산

       $("#consConsAmt").data("kendoExtNumericTextBox").enable(false);     // 탁송료
       $("#consZipCd").attr("disabled", true);                     // 우편번호
       $("#consSungNm").attr("disabled", true);                    // 성
       $("#consCityNm").attr("disabled", true);                    // 시
       $("#consDistNm").attr("disabled", true);                    // 구
       $("#consAddrDetlCont").attr("disabled", true);              // 상세주소

       $("#consTp").val("I");       // SAL125 탁송 :C , 방문 :I
   });
   //탁송구분:탁송
   $("#consTp02").click(function(){
       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");

       $("#consConsAmt").data("kendoExtNumericTextBox").enable(true);     // 탁송료
       $("#consZipCd").attr("disabled", false);                     // 우편번호
       $("#consSungNm").attr("disabled", false);                    // 성
       $("#consCityNm").attr("disabled", false);                    // 시
       $("#consDistNm").attr("disabled", false);                    // 구
       $("#consAddrDetlCont").attr("disabled", false);              // 상세주소

       $("#consTp").val("C");       // SAL125 탁송 :C , 방문 :I
   });

   // 프로모션 금액
   $("#promotionTotAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2                // 소숫점
      //,min:0.00
      ,value:0.00
      ,spinners:false             // 증,감 화살표
   });


   // 영수금액
   $("#contractRcptAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2                // 소숫점
      //,min:0.00
      ,value:0.00
      ,spinners:false             // 증,감 화살표
   });

   // 영수일자
   $("#contractRcptDt").kendoExtMaskedDatePicker({
       format :"<dms:configValue code='dateFormat' />"
      ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

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

   $("#sUsrVinNo").attr("disabled", true);
   $("#usrSbstAmt").data("kendoExtNumericTextBox").enable(false);
   $("#purcNo").attr("disabled", true);


   // 등록비 선수금
   $("#regPreAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      //,min:0.00
      ,value:0.00
      ,spinners:false
   });

   // 실제등록비용
   $("#realRegAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      //,min:0.00
      ,value:0.00
      ,spinners:false
   });

   // 번호판 등록장소
   $("#regDistCd").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(regDistCdList)
       ,optionLabel:" "
    });

    //등록예상일자
    $("#regExpcDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //구입세 선수금
    $("#purcTaxPreAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      //,min:0.00
      ,value:0.00
      ,spinners:false
    });

    //실제구입세
    $("#realPurcTaxAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      //,min:0.00
      ,value:0.00
      ,spinners:false
    });

    //차익
    $("#regDifferenceAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      ,value:0.00
      ,spinners:false
    });

    //등록수수료
    $("#regFeeAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      //,min:0.00
      ,value:0.00
      ,spinners:false
    });

   // 번호판 등록처리 :대행
   $("#tabRegTp01").click(function(){
       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#regPreAmt").data("kendoExtNumericTextBox").enable(true);       // 등록비 선수금
       $("#realRegAmt").data("kendoExtNumericTextBox").enable(true);      // 실제등록비용
       $("#regDistCd").data("kendoExtDropDownList").enable(true);         // 등록지역
       $("#regExpcDt").data("kendoExtMaskedDatePicker").enable(true);  // 등록예상일자
       $("#purcTaxPreAmt").data("kendoExtNumericTextBox").enable(true);   // 구입세 선수금
       $("#realPurcTaxAmt").data("kendoExtNumericTextBox").enable(true);  // 실제구입세
       $("#regFeeAmt").data("kendoExtNumericTextBox").enable(true);       // 등록수수료
       $("#regTp").val("A");      // SAL126 대행:A , 본인:M
   });
   //번호판 등록처리 :본인
   $("#tabRegTp02").click(function(){
       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#regPreAmt").data("kendoExtNumericTextBox").value(0);            // 등록비 선수금
       $("#realRegAmt").data("kendoExtNumericTextBox").value(0);           // 실제등록비용
       $("#regDistCd").data("kendoExtDropDownList").value('');             // 등록지역                          // 등록장소
       $("#regExpcDt").data("kendoExtMaskedDatePicker").value('');      // 등록예상일자
       $("#purcTaxPreAmt").data("kendoExtNumericTextBox").value(0);        // 구입세 선수금
       $("#realPurcTaxAmt").data("kendoExtNumericTextBox").value(0);        // 실제구입세
       $("#regDifferenceAmt").data("kendoExtNumericTextBox").value(0);     // 차액
       $("#regFeeAmt").data("kendoExtNumericTextBox").value(0);            // 등록수수료
       bf_addRegAmt();  // 번호판 등록비 선수금 계산

       $("#regPreAmt").data("kendoExtNumericTextBox").enable(false);       // 등록비 선수금
       $("#realRegAmt").data("kendoExtNumericTextBox").enable(false);      // 실제등록비용
       $("#regDistCd").data("kendoExtDropDownList").enable(false);         // 등록지역
       $("#regExpcDt").data("kendoExtMaskedDatePicker").enable(false);  // 등록예상일자
       $("#purcTaxPreAmt").data("kendoExtNumericTextBox").enable(false);   // 구입세 선수금
       $("#realPurcTaxAmt").data("kendoExtNumericTextBox").enable(false);   // 실제구입세
       $("#regFeeAmt").data("kendoExtNumericTextBox").enable(false);       // 등록수수료
       $("#regTp").val("M");       // SAL126 대행:A , 본인:M
   });

   // 보험예상금액
   $("#incExpcAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      //,min:0.00
      ,value:0.00
      ,spinners:false
   });

   // 실제보험금액
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

   // 보험회사
   $("#incCmpCd").kendoExtDropDownList({
       dataTextField  :"cmmCdNm"
      ,dataValueField :"cmmCd"
      ,dataSource:dms.data.cmmCdFilter(incCmpCdList)
      ,optionLabel:" "
   });

   // 보험처리 :대행
   $("#incAapTp01").click(function(){
       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#incFeeAmt").data("kendoExtNumericTextBox").enable(true);        // 보험수수료
       $("#incCmpCd").data("kendoExtDropDownList").enable(true);           // 보험회사
       $("#incProfitNm").attr("disabled", false);    // 제1수익자
       $("#incRemark").attr("disabled", false);    // 비고

       // 보험 그리드 조회
       $("#incGrid").data('kendoExtGrid').dataSource.read(); // 보험 Grid
       $("#btnIncAdd").data("kendoButton").enable(true);
       $("#btnIncDel").data("kendoButton").enable(true);
       $("#btnIncCancel").data("kendoButton").enable(true);
       $("#incAapTp").val("A");      // SAL126 대행:A , 본인:M
   });
   //보험처리 :본인
   $("#incAapTp02").click(function(){
       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#incExpcAmt").data("kendoExtNumericTextBox").value(0);
       $("#realIncAmt").data("kendoExtNumericTextBox").value(0);
       $("#incDifferenceAmt").data("kendoExtNumericTextBox").value(0);
       $("#incFeeAmt").data("kendoExtNumericTextBox").value(0);
       $("#incCmpCd").data("kendoExtDropDownList").value('');
       $("#incProfitNm").val('');
       $("#incRemark").val('');

       $("#incFeeAmt").data("kendoExtNumericTextBox").enable(false);        // 보험수수료
       $("#incCmpCd").data("kendoExtDropDownList").enable(false);           // 보험회사
       $("#incProfitNm").attr("disabled", true);    // 제1수익자
       $("#incRemark").attr("disabled", true);      // 비고

       $("#btnIncAdd").data("kendoButton").enable(false);
       $("#btnIncDel").data("kendoButton").enable(false);
       $("#btnIncCancel").data("kendoButton").enable(false);

       if($("#incGrid").data('kendoExtGrid') != null){
           $("#incGrid").data('kendoExtGrid').dataSource.data([]); // 보험 Grid
       }
       $("#incAapTp").val("M");       // SAL126 대행:A , 본인:M
   });

   /************************
    * 금융사
   ************************/
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
   });

   // 차량가격
   $("#fincCarAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      //,min:0.00
      ,value:0.00
      ,spinners:false
   });

   //대출 수수료
   $("#fincFeeAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      //,min:0.00
      ,value:0.00
      ,spinners:false
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
              $("#fincRpayPrid").data("kendoExtNumericTextBox").value( Number(dataItem.fincItemPrid) ); //상환기간

              if( dms.string.isEmpty($("#fincReqDt").data("kendoExtMaskedDatePicker").value()) ){
                  $("#fincReqDt").data("kendoExtMaskedDatePicker").value(toDay);
              }
              var fincReqDt = kendo.parseDate(kendo.toString($("#fincReqDt").data("kendoExtMaskedDatePicker").value(), "yyyy-MM-dd"));
              fincReqDt.setMonth(fincReqDt.getMonth() + Number(dataItem.fincItemPrid));
              fincReqDt.setDate(fincReqDt.getDate() - 1);
              var fincEndDt = kendo.toString(fincReqDt, "yyyy-MM-dd");
              $("#fincEndDt").data("kendoExtMaskedDatePicker").value(fincEndDt);

              $("#fincFeeAmt").data("kendoExtNumericTextBox").value(dataItem.hdlgFeeAmt);          //취급수수료 = 대출수수료
              $("#instIntrRate").data("kendoExtNumericTextBox").value(dataItem.instIntrRate);      //대출이율 = 할부이자율
              $("#grteIncAmt").data("kendoExtNumericTextBox").value(dataItem.grteIncAmt);          //보증수수료 = 보증 보험료
          }else{
              fn_FincRate();
          }
      }
   });

   // 금융사 change 이벤트
   $("#fincCmpCd").on("change", function (){
       //console.log('fincCmpCd Change:',$(this).data("kendoExtDropDownList").value());
       if( !dms.string.isEmpty($(this).data("kendoExtDropDownList").value()) ){

           if($("#fincItemKindCd").val() == "01"){
               $("#fincItemCd").data("kendoExtDropDownList").setDataSource(fincItemObj[$(this).data("kendoExtDropDownList").value()]);
           }else{
               $("#fincItemCd").data("kendoExtDropDownList").setDataSource(fincItemModelObj[$(this).data("kendoExtDropDownList").value()]);
           }
           fn_FincRate();

       }else{
           $("#fincItemCd").data("kendoExtDropDownList").setDataSource([]);
           fn_FincRate();
       }
   });

   // 금융정보 초기화
   fn_FincRate = function(){
       $("#fincFeeAmt").data("kendoExtNumericTextBox").value(0.00);          //취급수수료 = 대출수수료
       $("#instIntrRate").data("kendoExtNumericTextBox").value(0.00);        //대출이율 = 할부이자율
       $("#grteIncAmt").data("kendoExtNumericTextBox").value(0.00);          //보증수수료 = 보증 보험료
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
          var fincCarAmt = Number($("#fincCarAmt").data("kendoExtNumericTextBox").value());
          if(fincReqAmt > 0  && fincCarAmt > 0){
              $("#fincLoadRate").data("kendoExtNumericTextBox").value( (fincReqAmt / fincCarAmt) * 100 );
          }else{
              $("#fincLoadRate").data("kendoExtNumericTextBox").value(0);
          }
      }
   });

   //할부이자율
   $("#instIntrRate").kendoExtNumericTextBox({
        format:"n0"
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
   });

   // 만기일자
   $("#fincEndDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
       ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

   //상품관리유형 :금액
   $("#tabFincKindCd01").click(function(){
       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#fincItemKindCd").val('01');      // SAL160 :01:금액, 02:모델

       $("#fincItemCd").data("kendoExtDropDownList").value('');
       $("#fincCmpCd").change();
   });
   //상품관리유형 :모델
   $("#tabFincKindCd02").click(function(){
       if($("#modelCd").data("kendoExtDropDownList").value() == ""){
           dms.notification.info("<spring:message code='global.lbl.model' var='globalLblModel' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblModel}' />");
           if($("#carlineCd").data("kendoExtDropDownList").value() == ""){
               $("#carlineCd").focus();
           }else{
               $("#modelCd").focus();
           }
           return false;
       }

       fincItemModelObj = {}
       var responseJson = dms.ajax.getJson({
           url :"<c:url value='/sal/cnt/contractRe/selectFinancialProductModelSearch.do' />"
           ,data :JSON.stringify({"modelCd":$("#modelCd").data("kendoExtDropDownList").value()})
           ,async :false
       });

      if(responseJson.total > 0){
           $.each(responseJson.data, function(idx, row){

               if( fincItemModelObj.hasOwnProperty( row.fincCmpCd  ) ){
                   fincItemModelObj[row.fincCmpCd].push({cmmCd:row.fincItemCd, cmmCdNm:row.fincItemNm, instIntrRate:row.instIntrRate, grteIncAmt:row.grteIncAmt, hdlgFeeAmt:row.hdlgFeeAmt});
               }else{
                   fincItemModelObj[row.fincCmpCd] = [];
                   fincItemModelObj[row.fincCmpCd].push({cmmCd:row.fincItemCd, cmmCdNm:row.fincItemNm, instIntrRate:row.instIntrRate, grteIncAmt:row.grteIncAmt, hdlgFeeAmt:row.hdlgFeeAmt});
               }
           });

           $(this).siblings("li").removeClass("on");
           $(this).addClass("on");
           $("#fincItemKindCd").val('02');      // SAL160 :01:금액, 02:모델

           $("#fincItemCd").data("kendoExtDropDownList").value('');
           $("#fincCmpCd").change();
      }else{
          // 해당 모델에 대한 금융상품은 존재하지 않습니다.
          dms.notification.info("<spring:message code='sal.info.fincItemModelCheck' />");
      }

   });


   // 용품 합계
   $("#goodsTotAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      ,value:0.00
      ,spinners:false
   });

   // 부가비용 합계
   $("#otherTotAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals :2
      ,value:0.00
      ,spinners:false
   });

   //
   $("#consTp01").click();         // 탁송 - 최초:본인
   $("#tabRegTp02").click();       // 번호판등록 - 최초:본인
   $("#tabFincKindCd01").click();  // 금융서비스 - 최초:금액
   $("#incAapTp02").click();       // 보험처리 - 최초:본인

   // 간반차트에서 계약번호로 넘어 왔을 시.
   if("${orderNo}" != ""){
       reSearch("${orderNo}");
       $("#savedContractNo").val("${orderNo}");
   }

   /** 판매기회 정보 셋팅 **/
   var saleOpptNo = '${saleOpptNo}';       // 판매기회 데이터
   if(saleOpptNo != ""){
       reSearch(saleOpptNo);
       $("#savedContractNo").val(saleOpptNo);
   }
   /** 판매기회 정보 셋팅 END **/

   // 메인 그리드
    $("#contGrid").kendoExtGrid({
        gridId :"G-SAL-0721-113307"
        ,dataSource :{
            transport :{
                read :{
                    url :"<c:url value='/sal/cnt/contractRe/selectContractReSearch.do' />"
                },
                parameterMap :function(options, operation) {
                    if (operation == "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        // 딜러코드
                        params["sDlrCd"] = $("#sDlrCd").val();
                        // 판매사원
                        params["sSaleEmpNo"] = $("#sSaleEmpNo").data("kendoExtDropDownList").value();
                        // 고객명
                        params["sContractCustNm"] = $("#vContractCustNm").val();
                        //고객
                        params["sContractCustNo"] = $("#sContractCustNo").val();

                        // 계약유형
                        params["sContractTp"] = $("#sContractTp").data("kendoExtDropDownList").value();
                        // 계약번호
                        params["sContractNo"] = $("#sContractNo").val();
                        // 계약상태
                        params["sContractStatCd"] = $("#sContractStatCd").data("kendoExtDropDownList").value();
                        // 계약일자
                        params["sStartContractDt"] = $("#sStartContractDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndContractDt"]   = $("#sEndContractDt").data("kendoExtMaskedDatePicker").value();

                        // 차종
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                        // 모델
                        params["sModelCd"] = $("#sModelCd").data("kendoExtDropDownList").value();
                        //OCN
                        params["sOcnCd"] = $("#sOcnCd").data("kendoExtDropDownList").value();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch :false
            ,schema :{
                model :{
                    id :"contractNo",
                    fields :{
                         dlrCd         :{type :"string", editable:false} //딜러코드
                        ,contractNo    :{type :"string"}                 //계약번호
                        ,grpContractNo :{type :"string"}                 //그룹계약번호
                        ,contractTp    :{type :"string"}                 //계약유형
                        ,contractDt     :{type :"date"}                 //계약일
                        ,contractStatCd :{type :"string"}               //계약상태
                        ,contractCustNo :{type :"string"}               //계약고객번호
                        ,custNm         :{type :"string"}
                        ,saleEmpNo      :{type :"string"}               //판매사원번호
                        ,carlineCd  :{type :"string"}                   //차종코드
                        ,carlineNm  :{type :"string"}                   //차종명
                        ,modelCd    :{type :"string"}                   //모델코드
                        ,modelNm    :{type :"string"}                   //모델명
                        ,ocnCd      :{type :"string"}                   //OCN코드
                        ,ocnNm      :{type :"string"}                   //OCN명
                        ,extColorCd :{type :"string"}                   //외장색상코드
                        ,extColorNm :{type :"string"}                   //외장색
                        ,intColorCd :{type :"string"}                   //내장색상코드
                        ,intColorNm :{type :"string"}                   //내장색명
                        ,realPayAmt :{type :"number"}                   //판매금액
                        ,dcLvlCd    :{type :"string"}                   //할인레벨코드
                    }
                }
            }
        }
        ,dataBound :function(e) {
            // 저장시에만 계약번호가 1회 들어있음.
            var saveContNo = $("#savedContractNo").val();

            if(saveContNo != ""){
                var rows = e.sender.tbody.children();

                var selectRow
                  , grid = $("#contGrid").data("kendoExtGrid");

                $.each(rows, function(idx, row){
                    var dataItem = e.sender.dataItem(row);
                    if(dataItem.contractNo == saveContNo){

                         selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(idx);
                         grid.select(selectRow);
                        //fn_contGridDBclick(dataItem);
                        //viewDetailPopup();
                    }
                });
            }
            $("#savedContractNo").val("");      // 초기화
        }
       ,indvColumnVisible :true           //컬럼 보이기/감추기 개인화 적용. default :true
       ,indvColumnReorderable :true       //컬럼순서 변경 개인화 적용. default :true
       ,multiSelectWithCheckbox :false    //멀티선택 적용. default :false
       ,appendEmptyColumn :true           //빈컬럼 적용. default :false
       ,enableTooltip :false               //Tooltip 적용, default :false
       //,pageable :false
       ,pageable :{
           refresh :true
           ,pageSize :40
           ,pageSizes :[ "40", "60", "80", "100"]
       }
       ,height :434
       ,editable    :false
       ,resizable :true
       ,autoBind :true
       ,selectable :"row"
       ,navigatable :true
       //,sortable:false
       ,columns :[
          {field:"dlrCd",       title:"<spring:message code='global.lbl.dlrCd' />", hidden:true, width:100}       // 딜러코드
          ,{field:"contractNo", title:"<spring:message code='global.lbl.contractNo' />", attributes:{"class":"al"}, width:100}               //계약번호
          ,{field:"grpContractNo", title:"<spring:message code='sal.lbl.grpContractNo' />", attributes:{"class":"al"}, width:100}            //그룹계약번호
          ,{field:"contractTp", hidden:true}      //계약유형
          ,{field:"contractDt", title:"<spring:message code='global.lbl.contractDt' />", attributes:{"class":"ac"}, width:90, format:"{0:"+vDtyyyyMMdd+"}"}                   //계약일
          ,{field:"contractStatCd", title:"<spring:message code='global.lbl.contractStat' />", attributes:{"class":"ac"}, width:90, template:"#=contractStatCdArray[contractStatCd]#" }    //계약상태
          ,{field:"contractCustNo", title:"<spring:message code='global.lbl.contractCustNo' />", width:150}             //계약고객번호
          ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", attributes:{"class":"al"}, width:100}                       //고객명
          ,{field:"telNo1", title:"<spring:message code='sal.lbl.custTelNo' />", attributes:{"class":"al"}, width:100}                       //고객전화번호
          ,{field:"saleEmpNo", title:"<spring:message code='global.lbl.saleEmpNo' />", hidden:true, width:10}    //판매사원번호
          ,{field:"carlineCd", title:"carlineCd", hidden:true, width:100}        //차종코드
          ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", width:150}                          //차종명
          ,{field:"modelCd", title:"modelCd", hidden:true, width:10}            //모델코드
          ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:250}                             //모델명
          ,{field:"ocnCd", title:"ocnCd", hidden:true, width:10}                //OCN코드
          ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocn' />", width:220}                               //OCN명
          ,{field:"extColorCd", title:"extColorCd", hidden:true, width:10}     //외장색상코드
          ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />", width:180}                       //외장색
          ,{field:"intColorCd", title:"intColorCd", hidden:true, width:10}     //내장색상코드
          ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />", width:180}                       //내장색명
          ,{field:"realPayAmt", title:"<spring:message code='global.lbl.salAmt' />", attributes:{"class":"ar"}, width:80,format:"{0:n2}"}                  // 판매금액
          ,{field:"dcLvlCd", title:"<spring:message code='sal.lbl.dcLvlCd' />", attributes:{"class":"ac"}, width:90, template :"#= dms.string.strNvl(dcLvlCdObj[dcLvlCd]) #"}       // 할인레벨

       ]
   });

    // 그리드 더블클릭.
   $("#contGrid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#contGrid").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());

       fn_contOnLoad(selectedItem);

       //refreshAll();
       //fn_contGridDBclick(selectedItem);
       //viewDetailPopup();
   });

   // DB동기화 - 재조회.
   fn_contOnLoad = function(selectedItem){
       dms.loading.show();
       $.ajax({
          url :"<c:url value='/sal/cnt/contractRe/selectContractReSearch.do' />"
          ,data :JSON.stringify({"sDlrCd":dlrCd, "sContractNo":selectedItem.contractNo})
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
                refreshAll();
                fn_contGridDBclick(jqXHR.data[0]);
                viewDetailPopup();
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
           fn_btnState(selectedItem.contractStatCd);                                  // 버튼숨김

           $("#saleOpptNo").val(selectedItem.saleOpptNo);   //판매기회번호
           if(dms.string.isNotEmpty(selectedItem.saleOpptNo)){
               $("#saleOpptYn").prop('checked', true);
           }else{
               $("#saleOpptYn").prop('checked', false);
           }

           //$("#lv2DlrYn").data("kendoExtDropDownList").value(selectedItem.lv2DlrYn == "Y" ? "Y" :"N");    //2급딜러여부
           //$("#lv2DlrOrgCd").val(selectedItem.lv2DlrOrgCd);     //2급딜러조직코드
           //$("#lv2DlrOrgNm").val(selectedItem.lv2DlrOrgNm);     //2급딜러조직
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

           $("#grpContractNo").val(selectedItem.grpContractNo);        //그룹계약번호
           $("#payTp").data("kendoExtDropDownList").value(selectedItem.payTp);       // 지불방식
           $("#saleEmpNo").data("kendoExtDropDownList").value(selectedItem.saleEmpNo);   // 판매담당자

           /* 계약 고객정보 세팅 */
           var custTp = selectedItem.custTp;
           if(custTp != null){
               $("#custTp").val(custTp);       // 계약 고객유형
               /** 계약고객정보 **/
               if(custTp == "02"){  // 법인
                   $("#cust_01").hide();
                   $("#cust_02").show();
               }
               else{            // 개인
                   $("#cust_02").hide();
                   $("#cust_01").show();
               }

               $("#custCd_"+custTp).val(selectedItem.custCd);       // 고객코드
               $("#custNm_"+custTp).val(selectedItem.custNm);       // 고객명
               $("#vCustNm_"+custTp).val(selectedItem.custNm);       // 고객명
               $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").value(selectedItem.ssnCrnTp); // 신분증유형 / 법인유형
               $("#ssnCrnNo_"+custTp).val(selectedItem.ssnCrnNo);  // 증서번호
               $("#telNo1_"+custTp).val(selectedItem.telNo1);       // 전화번호1
               $("#telNo2_"+custTp).val(selectedItem.telNo2);       // 전화번호2
               $("#emailNm_"+custTp).val(selectedItem.emailNm);    // 이메일명
               $("#sungCd_"+custTp).val(selectedItem.sungCd);    // 성
               $("#sungNm_"+custTp).val(selectedItem.sungNm);    // 성
               $("#cityCd_"+custTp).val(selectedItem.cityCd);    // 시
               $("#cityNm_"+custTp).val(selectedItem.cityNm);    // 시
               $("#distCd_"+custTp).val(selectedItem.distCd);    // 구
               $("#distNm_"+custTp).val(selectedItem.distNm);    // 구
               $("#zipCd_"+custTp).val(selectedItem.zipCd);      // 우편번호
               $("#addrDetlCont_"+custTp).val(selectedItem.addrDetlCont);   // 상세주소

               // 판매 기회일 시, 계약자 변경 불가 및 계약자 동기화 버튼 활성화
               if(!dms.string.isEmpty(selectedItem.saleOpptNo)){
                   $("#vCustNm_"+custTp).attr("disabled", true);
                   $("#btnCrmCustSearch_"+custTp).show();
               }

               // 집단판매일 시, 계약자 변경 불가 및 계약자 동기화 버튼 활성화
               if(selectedItem.contractTp == "G"){
                   $("#vCustNm_"+custTp).attr("disabled", true);
                   $("#btnCrmCustSearch_"+custTp).show();
                   bf_crmCustSearch();      // 갱신버튼 실행.
               }
           }

           /* 차량정보 */
           if(selectedItem.carlineCd != null &&  selectedItem.carlineCd != ""){
               $("#carlineCd").data("kendoExtDropDownList").enable(true);
               $("#carlineCd").data("kendoExtDropDownList").value(selectedItem.carlineCd); // 차종

           }

           if(selectedItem.modelCd != null &&  selectedItem.modelCd != ""){
               var modelCd = $("#modelCd").data("kendoExtDropDownList");

               var modelDS = setModelDataSource(selectedItem.carlineCd);
               if(modelDS != null){
                   modelCd.setDataSource( modelDS );
               }else{
                   modelCd.setDataSource([{modelNm:selectedItem.modelNm, modelCd:selectedItem.modelCd}]);
               }
               modelCd.enable(true);
               modelCd.value(selectedItem.modelCd); // 모델
           }

           if(selectedItem.ocnCd != null &&  selectedItem.ocnCd != ""){
               var ocnCd = $("#ocnCd").data("kendoExtDropDownList");

               var ocnDS = setOcnDataSource(selectedItem.carlineCd, selectedItem.modelCd);
               if(ocnDS != null){
                   ocnCd.setDataSource( ocnDS );
               }else{
                   ocnCd.setDataSource([{ocnNm:selectedItem.ocnNm, ocnCd:selectedItem.ocnCd}]);
               }
               ocnCd.enable(true);
               ocnCd.value(selectedItem.ocnCd); // OCN
           }

           if(selectedItem.extColorCd != null &&  selectedItem.extColorCd != ""){
               var extColorCd = $("#extColorCd").data("kendoExtDropDownList");

               var extColorDS = setExtColorDataSource(selectedItem.modelCd);
               if(extColorDS != null){
                   extColorCd.setDataSource( extColorDS );
               }else{
                   extColorCd.setDataSource([{extColorNm:selectedItem.extColorNm, extColorCd:selectedItem.extColorCd}]);
               }
               extColorCd.enable(true);
               extColorCd.value(selectedItem.extColorCd); // 외장색
           }

           if(selectedItem.intColorCd != null &&  selectedItem.intColorCd != ""){
               var intColorCd = $("#intColorCd").data("kendoExtDropDownList");

               var intColorDS = setIntColorDataSource(selectedItem.modelCd);
               if(intColorDS != null){
                   intColorCd.setDataSource( intColorDS );
               }else{
                   intColorCd.setDataSource([{intColorNm:selectedItem.intColorNm, intColorCd:selectedItem.intColorCd}]);
               }
               intColorCd.enable(true);
               intColorCd.value(selectedItem.intColorCd); // 내장색
           }

           $("#beforVinNo").val(selectedItem.vinNo != null ? selectedItem.vinNo :"");    // vin no
           $("#vinNo").val(selectedItem.vinNo != null ? selectedItem.vinNo :"");         // vin no
           $("#sVinNo").val(selectedItem.vinNo != null ? selectedItem.vinNo :"");        // vin no
           $("#carRetlAmt").data("kendoExtNumericTextBox").value(selectedItem.carRetlAmt != null ? selectedItem.carRetlAmt :0);  // 지도가

           /* 계약가격정보 */
           //$("#whslAmt").data("kendoExtNumericTextBox").value(selectedItem.whslAmt != null ? selectedItem.whslAmt :0);              // 구매가
           $("#retlAmt").data("kendoExtNumericTextBox").value(selectedItem.retlAmt != null ? selectedItem.retlAmt :0);                // 공장지도가
           $("#promotionAmt").data("kendoExtNumericTextBox").value(selectedItem.promotionAmt != null ? selectedItem.promotionAmt :0); // 판촉금액
           $("#sbstAmt").data("kendoExtNumericTextBox").value(selectedItem.sbstAmt != null ? selectedItem.sbstAmt :0);                // 치환차감
           $("#goodsAmt").data("kendoExtNumericTextBox").value(selectedItem.goodsAmt != null ? selectedItem.goodsAmt :0);             // 용품가격
           $("#consAmt").data("kendoExtNumericTextBox").value(selectedItem.consAmt != null ? selectedItem.consAmt :0);                // 탁송료
           $("#incAmt").data("kendoExtNumericTextBox").value(selectedItem.incAmt != null ? selectedItem.incAmt :0);                   // 보험료
           $("#aapAmt").data("kendoExtNumericTextBox").value(selectedItem.aapAmt != null ? selectedItem.aapAmt :0);                   // 대행료
           $("#vatAmt").data("kendoExtNumericTextBox").value(selectedItem.vatAmt != null ? selectedItem.vatAmt :0);                   // 부가금액
           $("#realCarAmt").data("kendoExtNumericTextBox").value(selectedItem.realCarAmt != null ? selectedItem.realCarAmt :0);       // 실제차량금액
           $("#etcSumAmt").data("kendoExtNumericTextBox").value(selectedItem.etcSumAmt != null ? selectedItem.etcSumAmt :0);          // 기타금액
           $("#realPayAmt").data("kendoExtNumericTextBox").value(selectedItem.realPayAmt != null ? selectedItem.realPayAmt :0);       // 실제지불금액

           /* 실운전자 정보 세팅 */
           var drvCustTp = selectedItem.drvCustTp;

           // 실운전자 동일여부
           if(selectedItem.realDriverSameYn == "Y"){
               $("#realDriverSame").prop('checked', true);
               $("#vDrvCustNm_"+ dms.string.strNvl(drvCustTp) != "" ? drvCustTp :"01").attr("disabled", true);
           }else{
               $("#realDriverSame").prop('checked', false);
               $("#vDrvCustNm_"+ dms.string.strNvl(drvCustTp) != "" ? drvCustTp :"01").attr("disabled", false);
           }

           if(drvCustTp != null){
               $("#drvCustTp").val(drvCustTp);                   // 실운전자 고객유형

               if(drvCustTp == "02"){  // 법인
                   $("#drvCust_01").hide();
                   $("#drvCust_02").show();
               }
               else{            // 개인
                   $("#drvCust_02").hide();
                   $("#drvCust_01").show();
               }

               $("#drvCustCd_"+drvCustTp).val(selectedItem.drvCustCd);       // 고객코드
               $("#drvCustNm_"+drvCustTp).val(selectedItem.drvCustNm);       // 고객명
               $("#vDrvCustNm_"+drvCustTp).val(selectedItem.drvCustNm);       // 고객명

               $("#drvSsnCrnTp_"+drvCustTp).data("kendoExtDropDownList").value(selectedItem.ssnCrnTp); // 신분증유형 / 법인유형
               $("#drvSsnCrnNo_"+drvCustTp).val(selectedItem.ssnCrnNo);   // 증서번호
               $("#drvTelNo1_"+drvCustTp).val(selectedItem.drvTelNo1);    // 전화번호1
               $("#drvTelNo2_"+drvCustTp).val(selectedItem.drvTelNo2);    // 전화번호2
               $("#drvEmailNm_"+drvCustTp).val(selectedItem.drvEmailNm);  // 이메일명
               $("#drvSungCd_"+drvCustTp).val(selectedItem.drvSungCd);    // 성
               $("#drvSungNm_"+drvCustTp).val(selectedItem.drvSungNm);    // 성
               $("#drvCityCd_"+drvCustTp).val(selectedItem.drvCityCd);    // 시
               $("#drvCityNm_"+drvCustTp).val(selectedItem.drvCityNm);    // 시
               $("#drvDistCd_"+drvCustTp).val(selectedItem.drvDistCd);    // 구
               $("#drvDistNm_"+drvCustTp).val(selectedItem.drvDistNm);    // 구
               $("#drvZipCd_"+drvCustTp).val(selectedItem.drvZipCd);      // 우편번호
               $("#drvAddrDetlCont_"+drvCustTp).val(selectedItem.drvAddrDetlCont);   // 상세주소
           }

           /* 탁송 */
           // 탁송 :C , 방문 :I
           if(selectedItem.consTp == "C"){
               $("#consTp02").click();
           }else{
               $("#consTp01").click();
           }
           $("#consConsAmt").data("kendoExtNumericTextBox").value(selectedItem.consConsAmt);   // 탁송료
           $("#consZipCd").val(selectedItem.consZipCd);
           $("#consSungNm").val(selectedItem.consSungNm);
           $("#consSungCd").val(selectedItem.consSungCd);
           $("#consCityNm").val(selectedItem.consCityNm);
           $("#consCityCd").val(selectedItem.consCityCd);
           $("#consDistNm").val(selectedItem.consDistNm);
           $("#consDistCd").val(selectedItem.consDistCd);
           $("#consAddrDetlCont").val(selectedItem.consAddrDetlCont);

           /* 판촉 */
           $("#corpPromotionGrid").data('kendoExtGrid').dataSource.read();
           $("#dlrPromotionGrid").data('kendoExtGrid').dataSource.read();

           /* 영수증 */
           $("#contractPdpstNm").val(selectedItem.contractPdpstNm);
           $("#contractRcptNo").val(selectedItem.contractRcptNo);
           $("#contractRcptAmt").val(selectedItem.contractRcptAmt);
           $("#contractRcptDt").data("kendoExtMaskedDatePicker").value(selectedItem.contractRcptDt);
           $("#contractRcptId").val(selectedItem.contractRcptId);

           /* 입금내역 */
           $("#payInfoGrid").data('kendoExtGrid').dataSource.read();

           /* 중고차치환 */
           $("#uatcCarPurcYn").data("kendoExtDropDownList").value(selectedItem.uatcCarPurcYn);
           $("#sUsrVinNo").val(selectedItem.usrVinNo);
           if(dms.string.strNvl(selectedItem.usrVinNoSrYn) == "Y"){
               $("#usrVinNo").val(selectedItem.usrVinNo);
           }
           $("#usrSbstAmt").data("kendoExtNumericTextBox").value( Number(selectedItem.usrSbstAmt) );
           $("#purcNo").val(selectedItem.purcNo);
           bf_uatcCarPurcYnChk(selectedItem.uatcCarPurcYn);

           /* 번호판등록서비스 */
           if(selectedItem.regTp == "A"){
               $("#tabRegTp01").click();
           }else{
               $("#tabRegTp02").click();
           }
           $("#regPreAmt").data("kendoExtNumericTextBox").value(selectedItem.regPreAmt);
           $("#realRegAmt").data("kendoExtNumericTextBox").value(selectedItem.realRegAmt);
           $("#regDistCd").data("kendoExtDropDownList").value(selectedItem.regDistCd);
           $("#regExpcDt").data("kendoExtMaskedDatePicker").value(selectedItem.regExpcDt);
           $("#purcTaxPreAmt").data("kendoExtNumericTextBox").value(selectedItem.purcTaxPreAmt);
           $("#realPurcTaxAmt").data("kendoExtNumericTextBox").value(selectedItem.realPurcTaxAmt);
           $("#regFeeAmt").data("kendoExtNumericTextBox").value(selectedItem.regFeeAmt);
           bf_sumRegAmt();

           /* 보험서비스 */
           if(selectedItem.incAapTp == "A"){
               $("#incAapTp01").click();
           }else{
               $("#incAapTp02").click();
           }
           $("#incExpcAmt").data("kendoExtNumericTextBox").value(selectedItem.incExpcAmt);
           $("#realIncAmt").data("kendoExtNumericTextBox").value(selectedItem.realIncAmt);
           $("#incFeeAmt").data("kendoExtNumericTextBox").value(selectedItem.realIncFeeAmt);
           $("#incCmpCd").data("kendoExtDropDownList").value(selectedItem.incCmpCd);
           $("#incProfitNm").val(selectedItem.incProfitNm);
           $("#incRemark").val(selectedItem.incRemark);
           bf_sumIncAmt();

           // 보험그리드 조회
           $("#incGrid").data('kendoExtGrid').dataSource.read();

           /* 금융서비스 */
           if(selectedItem.fincReqYn == "Y"){
               $("#fincReq").prop('checked', true);
           }else{
               $("#fincReq").prop('checked', false);
           }
           bf_fincReq();
           if(selectedItem.fincItemKindCd == "02"){
               $("#tabFincKindCd02").click();
           }else{
               $("#tabFincKindCd01").click();
           }
           $("#fincCmpCd").data("kendoExtDropDownList").value(selectedItem.fincCmpCd);
           $("#fincCmpCd").change();
           $("#fincRpayPrid").data("kendoExtNumericTextBox").value(selectedItem.fincRpayPrid);
           $("#fincLoadRate").data("kendoExtNumericTextBox").value(selectedItem.fincLoadRate);
           $("#fincCarAmt").data("kendoExtNumericTextBox").value(selectedItem.realPayAmt);
           $("#fincFeeAmt").data("kendoExtNumericTextBox").value(selectedItem.fincFeeAmt);

           $("#fincItemCd").data("kendoExtDropDownList").value(selectedItem.fincItemCd);
           $("#fincReqAmt").data("kendoExtNumericTextBox").value(selectedItem.fincReqAmt);
           $("#instIntrRate").data("kendoExtNumericTextBox").value(selectedItem.instIntrRate);
           $("#grteIncAmt").data("kendoExtNumericTextBox").value(selectedItem.grteIncAmt);
           $("#fincReqDt").data("kendoExtMaskedDatePicker").value(selectedItem.fincReqDt);
           $("#fincEndDt").data("kendoExtMaskedDatePicker").value(selectedItem.fincEndDt);

           /* 파일업로드 */
           $("#fileDocId").val(selectedItem.fileDocId);    // 파일 문서 번호
           $("#fileGrid").data("kendoExtGrid").dataSource.read();
           /* 비고 */
           $("#remark").val(selectedItem.remark);

           /* 용품 */
           $("#goodsGrid").data('kendoExtGrid').dataSource.read();

           /* 부가비용 */
           $("#optionGrid").data('kendoExtGrid').dataSource.read();
           $("#remark1").val(selectedItem.remark1);

           /* 가격 */
           //$("#prcWhslAmt").data("kendoExtNumericTextBox").value(selectedItem.whslAmt != null ? selectedItem.whslAmt :0);
           $("#prcRetlAmt").data("kendoExtNumericTextBox").value(selectedItem.retlAmt != null ? selectedItem.retlAmt :0);
           $("#prcPromotionAmt").data("kendoExtNumericTextBox").value(selectedItem.promotionAmt != null ? selectedItem.promotionAmt :0);
           $("#prcSbstAmt").data("kendoExtNumericTextBox").value(selectedItem.sbstAmt != null ? selectedItem.sbstAmt :0);
           $("#prcGoodsAmt").data("kendoExtNumericTextBox").value(selectedItem.goodsAmt != null ? selectedItem.goodsAmt :0);
           $("#prcConsAmt").data("kendoExtNumericTextBox").value(selectedItem.consAmt != null ? selectedItem.consAmt :0);
           $("#prcIncAmt").data("kendoExtNumericTextBox").value(selectedItem.incAmt != null ? selectedItem.incAmt :0);
           $("#prcAapAmt").data("kendoExtNumericTextBox").value(selectedItem.aapAmt != null ? selectedItem.aapAmt :0);
           $("#prcVatAmt").data("kendoExtNumericTextBox").value(selectedItem.vatAmt != null ? selectedItem.vatAmt :0);
           $("#prcRealCarAmt").data("kendoExtNumericTextBox").value(selectedItem.realCarAmt != null ? selectedItem.realCarAmt :0);
           $("#prcEtcSumAmt").data("kendoExtNumericTextBox").value(selectedItem.etcSumAmt != null ? selectedItem.etcSumAmt :0);
           $("#prcRealPayAmt").data("kendoExtNumericTextBox").value(selectedItem.realPayAmt != null ? selectedItem.realPayAmt :0);

           // 견적번호 세팅
           $("#estimateNo").val(selectedItem.estimateNo);

           bf_sumCarAmt();  // 차량가격정보 계산

           /* 저장시에 재정의 사용 */
           $("#corpPromotionAmt").val('0');    // 법인 프로모션 금액
           $("#dlrPromotionAmt").val('0');     // 딜러 프로모션 금액
           $("#dcLvlCd").val(selectedItem.dcLvlCd);
           $("#dcApproveYn").val(selectedItem.dcApproveYn);

           // 직접 계약일시
           if(selectedItem.contractTp == "D"){
               $("#carlineCd").data("kendoExtDropDownList").enable(false);
               $("#modelCd").data("kendoExtDropDownList").enable(false);
               $("#ocnCd").data("kendoExtDropDownList").enable(false);
               $("#extColorCd").data("kendoExtDropDownList").enable(false);
               $("#intColorCd").data("kendoExtDropDownList").enable(false);
           }

           // 저장 상태일 경우 obj 저장
           /*
           if(selectedItem.contractStatCd == "10"){
               bfObj = $("#contForm").serializeObject($("#contForm").serializeArrayInSelector("[data-json-obj='true']"));
           }else{
               bfObj = {};
           }
           */
       }
   }

   // 법인 프로모션 그리드
   $("#corpPromotionGrid").kendoExtGrid({
         gridId :"G-SAL-0721-113308"
        ,dataSource :{
            transport :{
                read :{
                    url :"<c:url value='/sal/cnt/contractRe/selectPromotionSearch.do' />"
                },
                parameterMap :function(options, operation) {
                    if (operation == "read") {
                        var params = {};

                        params["sDlrCd"] = dlrCd;
                        if(onSelectModelCorp != ""){
                            params["sModelCd"] = onSelectModelCorp;
                            onSelectModelCorp = "";
                        }else{
                            params["sModelCd"] = $("#modelCd").data("kendoExtDropDownList").value();
                        }
                        params["sStartContractDt"] = $("#contractDt").data("kendoExtMaskedDatePicker").value();   // 계약일
                        params["sContractTp"] = $("#contractTp").data("kendoExtDropDownList").value();
                        params["sContractNo"] = $("#contractNo").val();
                        params["sContractCustNo"] =  $("#custCd_" + $("#custTp").val() ).val();       // 고객코드
                        params["sPromotionOwnCd"] = "01";        // 법인 01
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
                    id :"promotionCd",
                    fields :{
                           promotionCd :{type:"string"}
                         , promotionNm :{type:"string"}
                         , promotionTp :{type:"string"}
                         , modelCd     :{type:"string"}
                         , startDt     :{type:"date"}
                         , endDt       :{type:"date"}
                         , applyTp     :{type:"string"}
                         , promotionAmt:{type:"number"}
                         , imsBudnRate :{type:"number"}
                         , dlrBudnRate :{type:"number"}
                         , contractTp  :{type:"string"}
                    }
                }
            }
        }
       ,dataBound :function(e) {
           var rows = e.sender.tbody.children();

           var carAmt = Number($("#retlAmt").data("kendoExtNumericTextBox").value())
             , sDcAmt = 0;

            $.each(rows, function(idx, row){
                var item = e.sender.dataItem(row);

                if(item.chkYn == "Y"){
                        // 비율(R), 금액(F)
                        if( item.applyTp == "R"){
                            sDcAmt += carAmt * (Number(item.promotionAmt) / 100 );
                        }else{
                            sDcAmt += Number(item.promotionAmt);
                        }
                }
            });
            $("#promotionTotAmt").data("kendoExtNumericTextBox").value(sDcAmt);

            $("#promotionAmt").data("kendoExtNumericTextBox").value(Number(sDcAmt) * -1);  // 프로모션 :치환차감
            bf_sumCarAmt(); // 차량금액 계산
       }
       ,indvColumnVisible :false          //컬럼 보이기/감추기 개인화 적용. default :true
       ,indvColumnReorderable :true       //컬럼순서 변경 개인화 적용. default :true
       ,multiSelectWithCheckbox :false    //멀티선택 적용. default :false
       ,appendEmptyColumn :true           //빈컬럼 적용. default :false
       ,enableTooltip :true               //Tooltip 적용, default :false
       ,height :110
       ,pageable :false
       ,editable :false
       ,resizable :true
       ,selectable :"multiple, row"
       ,autoBind :false
       ,sortable:false
       ,filterable :false
       ,columns :[
            {field:"promotionCd",  width:10, hidden:true} //프로모션
           ,{       // 표시
                field:"chk", title:"<spring:message code='global.lbl.chk' />", width:50
               ,headerAttributes:{style:"text-align:center;"}
               ,attributes:{style:"text-align:center;"}
               ,template:'<input type="checkbox" class="checkbox" onclick="bf_checkPromotion(this, \'#= promotionCd #\', 1)" id="chkYn" #= chkYn=="Y"? checked="checked" :"" #  />'
            }
           ,{field:"promotionNm", title:"<spring:message code='global.lbl.promotionNm' />", width:500, attributes:{"class":"al"}} //프로모션명
           ,{field:"promotionTp", hidden:true} //프로모션 유형
           ,{field:"modelCd",     hidden:true}
           ,{field:"startDt",     hidden:true} //시작일
           ,{field:"endDt",       hidden:true} //종료일
           ,{field:"applyTp",     hidden:true} //적용방법
           ,{field:"promotionAmt",title:"<spring:message code='global.lbl.amt' />/<spring:message code='global.lbl.dcRate' />", width:160,  attributes:{"class":"ar"},format :"{0:##,###.0}"} //금액/할인율
           ,{field:"imsBudnRate", hidden:true}
           ,{field:"dlrBudnRate", hidden:true}
           ,{field:"contractTp", hidden:true}
       ]
   });

   // 딜러 프로모션 그리드
   $("#dlrPromotionGrid").kendoExtGrid({
         gridId :"G-SAL-0721-113309"
        ,dataSource :{
            transport :{
                read :{
                    url :"<c:url value='/sal/cnt/contractRe/selectPromotionSearch.do' />"
                },
                parameterMap :function(options, operation) {
                    if (operation == "read") {
                        var params = {};

                        params["sDlrCd"] = dlrCd;
                        if(onSelectModelDlr != ""){
                            params["sModelCd"] = onSelectModelDlr;
                            onSelectModelDlr = "";
                        }else{
                            params["sModelCd"] = $("#modelCd").data("kendoExtDropDownList").value();
                        }
                        params["sStartContractDt"] = $("#contractDt").data("kendoExtMaskedDatePicker").value();   // 계약일
                        params["sContractTp"] = $("#contractTp").data("kendoExtDropDownList").value();
                        params["sContractNo"] = $("#contractNo").val();
                        params["sContractCustNo"] =  $("#custCd_" + $("#custTp").val() ).val();       // 고객코드
                        params["sPromotionOwnCd"] = "02";        // 딜러 02

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
                    id :"promotionCd",
                    fields :{
                           promotionCd  :{type:"string", editable :false}
                         , chk :{type:"string", editable:false}
                         , promotionNm :{type:"string", editable :false}
                         , promotionTp :{type:"string", editable :false}
                         , modelCd     :{type:"string", editable :false}
                         , startDt     :{type:"date", editable :false}
                         , endDt       :{type:"date", editable :false}
                         , applyTp     :{type:"string", editable :false}
                         , promotionAmt:{type:"number"}
                         , imsBudnRate :{type:"number", editable :false}
                         , dlrBudnRate :{type:"number", editable :false}
                         , contractTp  :{type:"string", editable :false}
                    }
                }
            }
        }
       ,dataBound :function(e) {
           var rows = e.sender.tbody.children();

           var carAmt = Number($("#retlAmt").data("kendoExtNumericTextBox").value())
             , sDcAmt = 0;

            $.each(rows, function(idx, row){
                var item = e.sender.dataItem(row);

                if(item.chkYn == "Y"){
                    // 비율(R), 금액(F)
                    if( item.applyTp == "R"){
                        sDcAmt += carAmt * (Number(item.promotionAmt) / 100 );
                    }else{
                        sDcAmt += Number(item.promotionAmt);
                    }
                }
            });
            $("#promotionTotAmt").data("kendoExtNumericTextBox").value(sDcAmt);

            $("#promotionAmt").data("kendoExtNumericTextBox").value(Number(sDcAmt) * -1);  // 프로모션 :치환차감
            bf_sumCarAmt(); // 차량금액 계산
       }
       ,indvColumnVisible :false           //컬럼 보이기/감추기 개인화 적용. default :true
       ,indvColumnReorderable :true       //컬럼순서 변경 개인화 적용. default :true
       ,multiSelectWithCheckbox :false    //멀티선택 적용. default :false
       ,appendEmptyColumn :true           //빈컬럼 적용. default :false
       ,enableTooltip :true               //Tooltip 적용, default :false
       ,height :110
       ,pageable :false
       //,editable :false
       ,resizable :true
       ,selectable :"multiple, row"
       ,autoBind :false
       ,sortable:false
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

           if(fieldName == "promotionAmt"){
               input.blur(function(){
                   var grid = $("#dlrPromotionGrid").data("kendoExtGrid");
                   var rows = grid.tbody.find("tr");
                   var item, sDcAmt = 0;

                   rows.each(function(index, row) {
                       item = grid.dataItem(row);

                       if(item.chkYn == "Y"){
                           // 비율(R), 금액(F)
                           if( item.applyTp == "R"){
                               sDcAmt += carAmt * (Number(item.promotionAmt) / 100 );
                           }else{
                               sDcAmt += Number(item.promotionAmt);
                           }
                       }
                   });

                   $("#promotionTotAmt").data("kendoExtNumericTextBox").value(sDcAmt);
                   $("#promotionAmt").data("kendoExtNumericTextBox").value(Number(sDcAmt) * -1);  // 프로모션 :치환차감
                   bf_sumCarAmt(); // 차량금액 계산
               });
           }
       }
       ,columns :[
            {field:"promotionCd",  width:10, hidden:true} //프로모션
           ,{       // 표시
                field:"chk", title:"<spring:message code='global.lbl.chk' />", width:50
               ,headerAttributes:{style:"text-align:center;"}
               ,attributes:{style:"text-align:center;"}
               ,template:'<input type="checkbox" class="checkbox" onclick="bf_checkPromotion(this, \'#= promotionCd #\', 2)" id="chkYn" #= chkYn=="Y"? checked="checked" :"" #  />'
            }
           ,{field:"promotionNm", title:"<spring:message code='global.lbl.promotionNm' />", width:500, attributes:{"class":"al"}} //프로모션명
           ,{field:"promotionTp", hidden:true} //프로모션 유형
           ,{field:"modelCd",     hidden:true}
           ,{field:"startDt",     hidden:true} //시작일
           ,{field:"endDt",       hidden:true} //종료일
           ,{field:"applyTp",     hidden:true} //적용방법
           ,{field:"promotionAmt",title:"<spring:message code='global.lbl.amt' />/<spring:message code='global.lbl.dcRate' />", width:160,  attributes:{"class":"ar"},format :"{0:##,###.0}"} //금액/할인율
           ,{field:"imsBudnRate", hidden:true}
           ,{field:"dlrBudnRate", hidden:true}
           ,{field:"contractTp", hidden:true}
       ]
   });

   $("#corpPromotionGrid").data("kendoExtGrid").table.on("click", ".checkbox" , selectCorpRow);
   function selectCorpRow() {
       var checked = this.checked,
       row = $(this).closest("tr"),
       grid = $("#corpPromotionGrid").data("kendoExtGrid"),
       dataItem = grid.dataItem(row);

       var id = this.id;
       if (checked) {
           row.addClass("k-state-selected");
           dataItem.dirty = true;
           if (id == "chkYn") dataItem.chkYn = "Y";
       } else {
           row.removeClass("k-state-selected");
           dataItem.dirty = true;
           if (id == "chkYn") dataItem.chkYn = "N";
       }
   }

   $("#dlrPromotionGrid").data("kendoExtGrid").table.on("click", ".checkbox" , selectDlrRow);
   function selectDlrRow() {
       var checked = this.checked,
       row = $(this).closest("tr"),
       grid = $("#dlrPromotionGrid").data("kendoExtGrid"),
       dataItem = grid.dataItem(row);

       var id = this.id;
       if (checked) {
           row.addClass("k-state-selected");
           dataItem.dirty = true;
           if (id == "chkYn") dataItem.chkYn = "Y";
       } else {
           row.removeClass("k-state-selected");
           dataItem.dirty = true;
           if (id == "chkYn") dataItem.chkYn = "N";
       }
   }

   // 입출금내역
   $("#payInfoGrid").kendoExtGrid({
       gridId :"G-SAL-0721-113310"
       ,dataSource :{
           transport :{
               read :{
                   url :"<c:url value='/sal/cnt/contractRe/selectPayInfoSearch.do' />"
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
                          dlrCd          :{type:"string"}
                        , contractNo     :{type:"string"}
                        , seq            :{type:"number"}
                        , rcvTp          :{type:"string", validation :{required :true}}
                        , dpstWdrwTp     :{type:"string", validation :{required :true}}
                        , dpstWdrwDt     :{type:"date", validation :{required :true}}
                        , dpstWdrwTargTp :{type:"string", validation :{required :true}}
                        , dpstWdrwAmt    :{type:"number"}
                        , remark         :{type:"string"}
                   }
               }
           }
       }
       ,indvColumnVisible :false          //컬럼 보이기/감추기 개인화 적용. default :true
       ,indvColumnReorderable :true       //컬럼순서 변경 개인화 적용. default :true
       ,multiSelectWithCheckbox :true    //멀티선택 적용. default :false
       //,appendEmptyColumn :false           //빈컬럼 적용. default :false
       ,enableTooltip :true               //Tooltip 적용, default :false
       ,height :180
       ,pageable :false
       ,resizable :true
       ,selectable :"multiple, row"
       ,autoBind :false
       ,sortable :false
       ,filterable :false
       ,columns :[
            {field:"dlrCd", hidden:true}       // 딜러코드
           ,{field:"contractNo", hidden:true}       // 계약번호
           ,{field:"seq", hidden:true}       // 순번
           ,{
               field:"rcvTp", title:"<spring:message code='sal.lbl.rcvTp' />", width:100, headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
               ,template :"#= dms.string.strNvl(rectTpObj[rcvTp]) #"
               ,editor :function (container, options){
                   $('<input required name="rcvTp" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       autoBind :false
                       ,dataTextField :"cmmCdNm"
                       ,dataValueField :"cmmCd"
                       ,dataSource :dms.data.cmmCdFilter(rectTpList)
                   });
                   $('<span class="k-invalid-msg" data-for="rcvTp"></span>').appendTo(container);
               }
           }    // 수납유형
          ,{
               field:"dpstWdrwTp", title:"<spring:message code='sal.lbl.dpstWdrwTp' />", width:100, headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
               ,template :"#= dms.string.strNvl(ioTpObj[dpstWdrwTp]) #"
               ,editor :function (container, options){
                   $('<input required name="dpstWdrwTp" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       autoBind :false
                       ,dataTextField :"cmmCdNm"
                       ,dataValueField :"cmmCd"
                       ,dataSource :dms.data.cmmCdFilter(ioTpList)
                   });
                   $('<span class="k-invalid-msg" data-for="dpstWdrwTp"></span>').appendTo(container);
               }
          }    // 입출금유형
         ,{field:"dpstWdrwDt", title:"<spring:message code='sal.lbl.dpsWdrwDt' />", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}" }   // 입출금일자
         ,{
             field:"dpstWdrwTargTp", title:"<spring:message code='sal.lbl.dpstWdrwTargTp' />", width:100, headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
             ,template :"#= dms.string.strNvl(ioTargetTpObj[dpstWdrwTargTp]) #"
             ,editor :function (container, options){
                 $('<input required name="dpstWdrwTargTp" data-bind="value:' + options.field + '"/>')
                 .appendTo(container)
                 .kendoExtDropDownList({
                     autoBind :false
                     ,dataTextField :"cmmCdNm"
                     ,dataValueField :"cmmCd"
                     ,dataSource :dms.data.cmmCdFilter(ioTargetTpList)
                 });
                 $('<span class="k-invalid-msg" data-for="dpstWdrwTargTp"></span>').appendTo(container);
             }
        }    // 입출금대상유형
        ,{field:"dpstWdrwAmt", title:"<spring:message code='sal.lbl.dpstWdrwAmt' />", attributes:{"class":"ar"}, width:90, format :"{0:n2}" }   // 입/출금액
        ,{field:"remark", title:"<spring:message code='global.lbl.reasonCd' />", attributes:{"class":"al"}, width:150}   // 사유
       ]
   });

   // 보험내역 Grid
   $("#incGrid").kendoExtGrid({
       gridId :"G-SAL-2017-051909"
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
                   id :"incTp",
                   fields :{
                          dlrCd          :{type:"string"}
                        , contractNo     :{type:"string"}
                        , incTp          :{type:"string"}
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

           $("#incExpcAmt").data("kendoExtNumericTextBox").value(v_incExpcAmt);
           $("#realIncAmt").data("kendoExtNumericTextBox").value(v_realIncAmt);
           $("#incDifferenceAmt").data("kendoExtNumericTextBox").value( (v_incExpcAmt - v_realIncAmt) );

           $("#incAmt").data("kendoExtNumericTextBox").value(v_incExpcAmt);
           bf_sumCarAmt(); // 차량금액 계산
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
       ,edit :function(e){
           var eles = e.container.find("input");
           var fieldName;
           if(eles.length > 1){
               fieldName = eles[eles.length-1].getAttribute("name");
           }else{
               fieldName = eles.attr("name");
           }

           var input = e.container.find(".k-input");

           if(fieldName == "incExpcAmt"){

               input.blur(function(){
                // 선택된 값
                   var rows = e.sender.select();
                   var selectedItem = e.sender.dataItem(rows[0]);

                   var incExpcAmt = Number(selectedItem.incExpcAmt);

                   if(incExpcAmt > 0 && incExpcAmt != null){

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

                       $("#incAmt").data("kendoExtNumericTextBox").value(v_incExpcAmt);
                       bf_sumCarAmt(); // 차량금액 계산
                   }
               });
           }

           if(fieldName == "realIncAmt"){

               input.blur(function(){
                // 선택된 값
                   var rows = e.sender.select();
                   var selectedItem = e.sender.dataItem(rows[0]);

                   var realIncAmt = Number(selectedItem.realIncAmt);

                   if(realIncAmt > 0 && realIncAmt != null){

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
                   }
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
                              ,dataTextField :"cmmCdNm"
                              ,dataValueField :"cmmCd"
                              ,dataSource :dms.data.cmmCdFilter(insTpList)
                          });
                          $('<span class="k-invalid-msg" data-for="incTp"></span>').appendTo(container);
                      }
                  }    // 보험유형
                  ,{field:"incExpcAmt", title:"<spring:message code='global.lbl.incAmt' />", attributes:{"class":"ar"}, width:90, format :"{0:n2}" }     // 보험금액
                  ,{field:"realIncAmt", title:"<spring:message code='sal.lbl.realIncAmt' />", attributes:{"class":"ar"}, width:90, format :"{0:n2}" }   // 실제보험료
                  ,{
                      field:"incPrid", title:"<spring:message code='sal.lbl.pridMonth' />", attributes:{"class":"ar"}, width:90, format :"{0:n0}"
                      ,editor :function (container, options){
                          $('<input required name="incPrid" data-bind="value:' + options.field + '" onfocus="this.select()" maxlength="2" />')
                          .appendTo(container)
                          .kendoExtNumericTextBox({
                                format:"n0"
                                ,value:0
                                ,change :function(e){
                                    var grid = $("#incGrid").data("kendoExtGrid");
                                    var selectedItem = grid.dataItem(grid.select());
                                    if(dms.string.isEmpty(selectedItem.incStartDt)){ return ; }

                                    var incStartOrgDt = kendo.parseDate(kendo.toString(selectedItem.incStartDt, "yyyy-MM-dd"));
                                    var incStartDt    = kendo.parseDate(kendo.toString(selectedItem.incStartDt, "yyyy-MM-dd"));

                                    incStartDt.setMonth(incStartDt.getMonth() + Number(this.value()));
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
       gridId :"G-SAL-2017-051912"
       ,dataSource :{
           transport :{
               read :{
                   url :"<c:url value='/sal/cnt/contractRe/selectGoodsSearch.do' />"
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
                          dlrCd          :{type:"string", editable :false}
                        , contractNo     :{type:"string", editable :false}
                        , seq            :{type:"number", editable :false}
                        , nChk           :{type:"string", editable :false}
                        , goodsCd        :{type:"string", validation :{required :true}}
                        , goodsNm        :{type:"string"}
                        , goodsCnt       :{type:"number", validation :{required :true}}
                        , goodsUnitCd    :{type:"string"}
                        , goodsPrc       :{type:"number"}  // 단가
                        , dcRate         :{type:"number"}  // 할인율
                        , goodsAmt       :{type:"number"}  // 실제 판매가 = 단가 - (단가*할인율)
                        , serviceYn      :{type:"string"}  // 서비스여부
                        , realGoodsAmt   :{type:"number"}  // 금액     = 실제판매가 * 수량
                        , dcAmt          :{type:"number"}  // 할인금액 = (단가*수량) - 금액
                        , pkgItemCd      :{type:"string"}
                        , grStrgeCd:{type:"string"}
                        , giStrgeCd:{type:"string"}
                   }
               }
           }
       }
       ,dataBound :function(e) {
           var rows = e.sender.tbody.children();
           var oRealGoodsAmt = 0;

           $.each(rows, function(idx, row){
                var item = e.sender.dataItem(row);
                oRealGoodsAmt += Number(item.realGoodsAmt);
            });

           $("#goodsTotAmt").data("kendoExtNumericTextBox").value(oRealGoodsAmt);
           $("#goodsAmt").data("kendoExtNumericTextBox").value(oRealGoodsAmt);

           bf_sumCarAmt();  // 차량가격정보 계산
       }
       ,indvColumnVisible :false          //컬럼 보이기/감추기 개인화 적용. default :true
       ,indvColumnReorderable :true       //컬럼순서 변경 개인화 적용. default :true
       ,multiSelectWithCheckbox :false     //멀티선택 적용. default :false
       //,appendEmptyColumn :false        //빈컬럼 적용. default :false
       ,enableTooltip :true               //Tooltip 적용, default :false
       ,height :180
       ,pageable :false
       ,resizable :true
       ,selectable :"row"
       ,autoBind :false
       ,sortable :false
       ,filterable :false
       ,edit :function(e){
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

           if(fieldName == "goodsNm"){
               if(dms.string.isNotEmpty(selectedItem.goodsCd)){
                   this.closeCell();
               }
           }
           if(fieldName == "goodsUnitCd"){
               this.closeCell();
           }
           if(fieldName == "goodsPrc"){
               this.closeCell();
           }
           if(fieldName == "dcRate"){
               this.closeCell();
           }

           if(fieldName == "goodsAmt"){
               this.closeCell();
           }

           if(fieldName == "dcAmt"){
               this.closeCell();
           }

           if(fieldName == "realGoodsAmt"){
               if(e.model.serviceYn == "Y"){
                   this.closeCell();
               }else{
                   input.blur(function(){
                       var grid = $("#goodsGrid").data("kendoExtGrid")
                         , item = grid.dataItem(grid.select());

                       var oDcAmt = (Number(item.goodsPrc) * Number(item.goodsCnt)) - Number(item.realGoodsAmt);
                       item.set("dcAmt", oDcAmt);

                       bf_gridSumGoodsAmt();
                   });
               }
           }
           if(fieldName == "goodsCnt"){
               input.blur(function(){
                   var grid = $("#goodsGrid").data("kendoExtGrid");
                   var item = grid.dataItem(grid.select());
                   if(item.serviceYn == "Y"){
                       item.set("realGoodsAmt", 0 );
                       item.set("dcAmt", (item.goodsPrc * item.goodsCnt));

                   }else{
                       var oRealGoodsAmt = Number(item.goodsAmt) * Number(item.goodsCnt);
                       item.set("realGoodsAmt", oRealGoodsAmt );
                       item.set("dcAmt",  (item.goodsPrc * item.goodsCnt) - oRealGoodsAmt );
                   }
                   bf_gridSumGoodsAmt();
               });
           }

           if(fieldName == "pkgItemCd"){
               this.closeCell();
           }
       }
       ,columns :[
            {field:"dlrCd", hidden:true}            // 딜러코드
           ,{field:"contractNo", hidden:true}       // 계약번호
           ,{field:"seq", hidden:true}              // 순번
           , {
               field:"nChk", title :"<spring:message code='global.lbl.chk' />", width :40
                ,headerAttributes:{"class":"ac"}
                ,attributes:{"class":"ac"}
                ,template:'<input type="checkbox" data-uid="#= uid #" class="grid-checkbox-item" name="nChk" />'
                ,headerTemplate :"<input type='checkbox' class='grid-checkAll'/>"
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
           , {field:"goodsCnt", title:"<spring:message code='global.lbl.qty' />", width:70, attributes:{"class":"ar"}, format:"{0:n0}"}    // 수량
           , {field:"goodsUnitCd", title:"<spring:message code='sal.lbl.unit' />", width:65, attributes:{"class":"ac"}} //단위
           , {field:"goodsPrc", title:"<spring:message code='global.lbl.prc' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}" }    // 단가
           , {field:"dcRate", title:"<spring:message code='global.lbl.dcRate' />", width:65, attributes:{"class":"ar"}, format:"{0:n0}%"} //할인율
           , {field:"goodsAmt", title:"<spring:message code='sal.lbl.saleAmt' />", width:110, attributes:{"class":"ar"}, format:"{0:n2}"} //실제판매가
           , {
               field :"serviceYn", title:"<spring:message code='sal.lbl.serviceYn' />", width:80
                ,attributes:{"class":"ac"}
                ,template :"#= dms.string.strNvl(ynObj[serviceYn]) #"
                ,editor :function (container, options){
                    $('<input required name="serviceYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind :false
                        ,dataTextField :"cmmCdNm"
                        ,dataValueField :"cmmCd"
                        ,dataSource :dms.data.cmmCdFilter(ynList)
                        ,value :"N"
                        ,select :function(e){
                            var dataItem = this.dataItem(e.item);

                            var grid = $("#goodsGrid").data("kendoExtGrid");
                            var item = grid.dataItem(grid.select());

                            if(dataItem.cmmCd == "Y"){
                                item.set("realGoodsAmt", 0 );
                                item.set("dcAmt", item.goodsPrc * item.goodsCnt );

                            }else{
                                item.set("realGoodsAmt", Number(item.goodsAmt) * Number(item.goodsCnt) );
                                item.set("dcAmt",  (item.goodsPrc * item.goodsCnt) - Number(item.goodsAmt) * Number(item.goodsCnt) );
                            }
                            bf_gridSumGoodsAmt();
                        }
                    });
                    $('<span class="k-invalid-msg" data-for="serviceYn"></span>').appendTo(container);
                }
                , hidden:true
            }    // 서비스여부
           , {field:"dcAmt", title:"dcAmt", attributes:{"class":"ar"}, format:"{0:n2}" , hidden:true}
           , {field:"realGoodsAmt", title:"<spring:message code='global.lbl.amt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}    // 금액
           , {field:"pkgItemCd", title:"<spring:message code='sal.lbl.pkgItemCd' />", width:100, attributes:{"class":"al"}, format:"{0:n2}"} //패키지번호
           , {field:"grStrgeCd",   hidden:true}
           , {field:"giStrgeCd",   hidden:true}

       ]
    });

     /**
     * 그리드 목록의 체크박스 체크 여부에 따라 해당 목록을 선택하거나 선택/취소 한다.
     */
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

   /* 부가비용 그리드 */
    $("#optionGrid").kendoExtGrid({
        gridId :"G-SAL-0721-113313"
        ,dataSource :{
            transport :{
                read :{
                    url :"<c:url value='/sal/cnt/contractRe/selectOptionSearch.do' />"
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
                           dlrCd          :{type:"string"}
                         , contractNo     :{type:"string"}
                         , seq          :{type:"number"}
                         , addAtcNm     :{type:"string"}
                         , addAmt     :{type:"number"}
                    }
                }
            }
        }
        ,dataBound :function(e) {
            var rows = e.sender.tbody.children();
            var oTotAmt = 0;

            $.each(rows, function(idx, row){
                 var item = e.sender.dataItem(row);
                 oTotAmt += Number(item.addAmt);
             });

             $("#otherTotAmt").data("kendoExtNumericTextBox").value(oTotAmt);      // 합계
             $("#vatAmt").data("kendoExtNumericTextBox").value(oTotAmt);       // 부가금액
             bf_sumCarAmt();  // 차량가격정보 계산
        }
        ,indvColumnVisible :false          //컬럼 보이기/감추기 개인화 적용. default :true
        ,indvColumnReorderable :true       //컬럼순서 변경 개인화 적용. default :true
        ,multiSelectWithCheckbox :true    //멀티선택 적용. default :false
        //,appendEmptyColumn :false           //빈컬럼 적용. default :false
        ,enableTooltip :true               //Tooltip 적용, default :false
        ,height :150
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

            if(fieldName == "addAmt"){

                input.blur(function(){
                 // 선택된 값
                    var rows = e.sender.select();
                    var selectedItem = e.sender.dataItem(rows[0]);

                    var addAmt = Number(selectedItem.addAmt);

                    if(addAmt > 0 && addAmt != null){

                        var grid = $("#optionGrid").data("kendoExtGrid");
                        var rows = grid.tbody.find("tr");
                        var item, oTotAmt = 0;

                        rows.each(function(index, row) {
                            item = grid.dataItem(rows[index]);

                            if(item.addAmt != null){
                                oTotAmt += Number(item.addAmt);
                            }
                        });

                        $("#otherTotAmt").data("kendoExtNumericTextBox").value(oTotAmt);      // 합계
                        $("#vatAmt").data("kendoExtNumericTextBox").value(oTotAmt);       // 부가금액
                        bf_sumCarAmt();  // 차량가격정보 계산

                    }
                });
            }

        }
        ,columns :[
                    {field:"dlrCd", hidden:true}        // 딜러코드
                   ,{field:"contractNo", hidden:true}   // 계약번호
                   ,{field:"seq", hidden:true}          // 일련번호
                   ,{field:"addAtcNm", title:"<spring:message code='sal.lbl.addAtcNm' />", attributes:{"class":"ar"}, width:150 }                // 부가항목
                   ,{field:"addAmt", title:"<spring:message code='global.lbl.amt' />", attributes:{"class":"ar"}, width:90, format :"{0:n2}" }   // 금액
        ]
    });


   // 파일 그리드 시작 //
   $("#fileGrid").kendoExtGrid({
       dataSource :{
           transport :{
               read :{
                   url :"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
               },
               parameterMap :function(options, operation) {
                   if (operation == "read") {
                       var params = {};
                       params["sFileDocNo"] = $("#fileDocId").val();

                       return kendo.stringify(params);
                   }else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema :{
               model :{
                   fields :{
                       fileDocNo :{type :"string"}
                       ,fileNo :{type :"number"}
                       ,fileNm :{type :"string"}
                       ,fileSize :{type :"number"}
                   }
               }
           }
       }
      ,change :function(e){
          var dataItem = this.dataItem(this.select());

          if(dms.string.isNotEmpty(dataItem)){
              dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
          }
      }
      ,autoBind :false
      ,editable :false
      ,height :80
      ,multiSelectWithCheckbox :true
      ,navigatable :false
      ,pageable :false
      ,resizable :false
      ,sortable :false
      ,filterable :false
      //,selectable :"row"
      ,columns :[
          {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />" }           // 파일명
         ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />" }       // 파일크기
         ,{_field:"_field",title :""}

      ]
   });
   // 파일 그리드 종료 //

   fnOnfocus = function(id){
       $("#"+ id +" ").select();
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
    $("#saleOpptYn").prop('checked', false);
    //$("#lv2DlrYn").data("kendoExtDropDownList").value('N');            // 2급딜러여부
    //$("#lv2DlrOrgCd").val('');
    //$("#lv2DlrOrgNm").val('');
    $("#dlReqDt").data("kendoExtMaskedDatePicker").value(toDay);    // 인도요청일

    $("#contractTp").data("kendoExtDropDownList").setDataSource(dms.data.cmmCdFilter(contractTpList));        // 집단판매,직접판매 제외
    $("#contractTp").data("kendoExtDropDownList").enable(true);
    $("#contractTp").data("kendoExtDropDownList").select(0);   // 계약유형

    $("#grpContractNo").val("");      // 그룹계약번호
    $("#payTp").data("kendoExtDropDownList").select(1);          // 지불방식
    //$("#saleEmpNo").data("kendoExtDropDownList").value('');    // 판매담당자
    $("#saleEmpNo").data("kendoExtDropDownList").select(1);

    $("#custTp").val("01");       // 계약자 고객유형
    $("#drvCustTp").val("01");    // 실운전자 고객유형
    $("#estimateNo").val("");     // 견적번호
    $("#contractStatCd").val(""); // 계약상태

    $("#vCustNm_01").attr("disabled", false);
    $("#vCustNm_02").attr("disabled", false);
    $("#btnCrmCustSearch_01").hide();
    $("#btnCrmCustSearch_02").hide();

    $("#cust_02").hide();
    $("#cust_01").show();
    $("#custCd_01").val("");     // 고객코드
    $("#custNm_01").val("");     // 고객명
    $("#vCustNm_01").val("");    // 고객명
    $("#ssnCrnTp_01").val("");   //신분증유형
    $("#ssnCrnNo_01").val("");   //증서번호
    $("#telNo1_01").val("");     //전화번호
    $("#telNo2_01").val("");
    $("#emailNm_01").val("");    //이메일
    $("#sungNm_01").val("");
    $("#sungCd_01").val("");
    $("#cityNm_01").val("");
    $("#cityCd_01").val("");
    $("#distNm_01").val("");
    $("#distCd_01").val("");
    $("#zipCd_01").val("");
    $("#addrDetlCont_01").val("");

    $("#custCd_02").val("");      // 고객코드
    $("#custNm_02").val("");      // 고객명
    $("#vCustNm_02").val("");     // 고객명
    $("#ssnCrnTp_02").val("");    //신분증유형
    $("#ssnCrnNo_02").val("");    //증서번호
    $("#telNo1_02").val("");      //전화번호
    $("#telNo2_02").val("");
    $("#emailNm_02").val("");     //이메일
    $("#sungNm_02").val("");
    $("#sungCd_02").val("");
    $("#cityNm_02").val("");
    $("#cityCd_02").val("");
    $("#distNm_02").val("");
    $("#distCd_02").val("");
    $("#zipCd_02").val("");
    $("#addrDetlCont_02").val("");

    /* 차량 */
    $("#carlineCd").data("kendoExtDropDownList").enable(true);
    $("#carlineCd").data("kendoExtDropDownList").value('');

    var modelCd = $("#modelCd").data("kendoExtDropDownList");
    modelCd.setDataSource([]);
    modelCd.enable(false);
    modelCd.value('');

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
    $("#carRetlAmt").data("kendoExtNumericTextBox").value(0);  // 지도가

    /* 계약가격정보 */
    //$("#whslAmt").data("kendoExtNumericTextBox").value(0);        // 구매가 (A)
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

    $("#tabstrip").data("kendoExtTabStrip").select(0);
    selectTabId = "contInfoTab";      // 계약정보

    /* 실운전자 */
    $("#realDriverSame").prop('checked', true);
    $("#vDrvCustNm_01").attr("disabled", true);
    $("#vDrvCustNm_02").attr("disabled", true);

    $("#drvCust_02").hide();
    $("#drvCust_01").show();
    $("#drvCustCd_01").val("");     // 고객코드
    $("#drvCustNm_01").val("");     // 고객명
    $("#vDrvCustNm_01").val("");     // 고객명
    $("#drvSsnCrnTp_01").val("");  //신분증유형
    $("#drvSsnCrnNo_01").val("");   //증서번호
    $("#drvTelNo1_01").val("");     //전화번호
    $("#drvTelNo2_01").val("");
    $("#drvEmailNm_01").val("");    //이메일
    $("#drvSungNm_01").val("");
    $("#drvSungCd_01").val("");
    $("#drvCityNm_01").val("");
    $("#drvCityCd_01").val("");
    $("#drvDistNm_01").val("");
    $("#drvDistCd_01").val("");
    $("#drvZipCd_01").val("");
    $("#drvAddrDetlCont_01").val("");

    $("#drvCustCd_02").val("");      // 고객코드
    $("#drvCustNm_02").val("");      // 고객명
    $("#vDrvCustNm_02").val("");      // 고객명
    $("#drvSsnCrnTp_02").val("");   //신분증유형
    $("#drvSsnCrnNo_02").val("");    //증서번호
    $("#drvTelNo1_02").val("");      //전화번호
    $("#drvTelNo2_02").val("");
    $("#drvEmailNm_02").val("");     //이메일
    $("#drvSungNm_02").val("");
    $("#drvSungCd_02").val("");
    $("#drvCityNm_02").val("");
    $("#drvCityCd_02").val("");
    $("#drvDistNm_02").val("");
    $("#drvDistCd_02").val("");
    $("#drvZipCd_02").val("");
    $("#drvAddrDetlCont_02").val("");

    /* 탁송 */
    $("#consConsAmt").data("kendoExtNumericTextBox").value(0);   // 탁송료
    $("#consZipCd").val('');
    $("#consSungNm").val('');
    $("#consSungCd").val('');
    $("#consCityNm").val('');
    $("#consCityCd").val('');
    $("#consDistNm").val('');
    $("#consDistCd").val('');
    $("#consAddrDetlCont").val('');
    $("#consTp01").click();

    /* 판촉 */
    $("#corpPromotionGrid").data('kendoExtGrid').dataSource.data([]);   // 법인 프로모션
    $("#dlrPromotionGrid").data('kendoExtGrid').dataSource.data([]);    // 딜러 프로모션
    $("#promotionTotAmt").data("kendoExtNumericTextBox").value(0);

    /* 영수증 */
    $("#contractPdpstNm").val('');
    $("#contractRcptNo").val('');
    $("#contractRcptAmt").val(0);
    $("#contractRcptDt").data("kendoExtMaskedDatePicker").value('');
    $("#contractRcptId").val('');

    /* 입금내역 */
    $("#payInfoGrid").data('kendoExtGrid').dataSource.data([]);

    /* 중고차치환 */
    $("#uatcCarPurcYn").data("kendoExtDropDownList").value("N");
    $("#sUsrVinNo").val('');
    $("#usrVinNo").val('');
    $("#purcNo").val('');
    $("#usrSbstAmt").data("kendoExtNumericTextBox").value(0);
    $("#sUsrVinNo").attr("disabled", true);
    $("#purcNo").attr("disabled", true);
    $("#usrSbstAmt").data("kendoExtNumericTextBox").enable(false);
    //bf_uatcCarPurcYnChk("N");

    /* 추가서비스 */
    $("#tabRegTp02").click();    // 번호판 등록서비스 :본인
    $("#incAapTp02").click();    // 보험서비스 :본인
    $("#incGrid").data('kendoExtGrid').dataSource.data([]);     // 보험 Grid

    /*금융*/
    $("#tabFincKindCd01").click();      //금융서비스 :상품관리 유형 - 금액
    $("#fincReq").prop('checked', false);
    bf_fincReq();
    $("#fincCmpCd").data("kendoExtDropDownList").value('');
    $("#fincCmpCd").change();
    $("#fincRpayPrid").data("kendoExtNumericTextBox").value('');
    $("#fincLoadRate").data("kendoExtNumericTextBox").value('');
    $("#fincCarAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#fincFeeAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#fincItemCd").data("kendoExtDropDownList").value('');
    $("#fincReqAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#instIntrRate").data("kendoExtNumericTextBox").value(0);
    $("#grteIncAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#fincReqDt").data("kendoExtMaskedDatePicker").value('');
    $("#fincEndDt").data("kendoExtMaskedDatePicker").value('');


    /* 파일업로드 */
    $("#fileDocId").val('');    // 파일 문서 번호
    $("#fileGrid").data('kendoExtGrid').dataSource.data([]);   // 파일업로드
    $("#remark").val('');       /* 비고 */

    /* 용품 */
    $("#goodsTotAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#goodsAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#goodsGrid").data('kendoExtGrid').dataSource.data([]);

    /* 부가비용 */
    $("#otherTotAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#optionGrid").data('kendoExtGrid').dataSource.data([]);   // 부가비용
    $("#remark1").val('');       // 비고

    bf_sumCarAmt();  // 차량가격정보 계산

    $("#savedContractNo").val("");      // 저장 조회용

    $("#corpPromotionAmt").val('0');    // 법인 프로모션 금액
    $("#dlrPromotionAmt").val('0');     // 딜러 프로모션 금액

    $("#dcLvlCd").val("");
    $("#dcApproveYn").val("N");

    //bfObj = {};
}

// 검색조건
function reSearch(contNo){
    $("#sContractCustNo").val("");  // 고객번호
    $("#sContractCustNm").val("");  // 고객명
    $("#vContractCustNm").val("");  // 고객명
    $("#sContractTp").data("kendoExtDropDownList").value('');  // 계약유형
    $("#sContractNo").val(contNo);  // 계약번호
    $("#sContractStatCd").data("kendoExtDropDownList").value('');  // 계약상태
    $("#sStartContractDt").data("kendoExtMaskedDatePicker").value('');
    $("#sEndContractDt").data("kendoExtMaskedDatePicker").value('');
    $("#sCarlineCd").data("kendoExtDropDownList").value('');   // 차종
    $("#sModelCd").data("kendoExtDropDownList").value(''); // 모델
    $("#sOcnCd").data("kendoExtDropDownList").value('');   //OCN
}


/** [조회조건 영역] ComboBox Select() **/
// 차종에 따른 모델검색
function onSelectSearchCarlineCd(e){
    $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
   // $("#sModelCd").data("kendoExtDropDownList").wrapper.show();
    $("#sModelCd").data("kendoExtDropDownList").enable(true);

    $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

    var dataItem = this.dataItem(e.item);
    if(dataItem.carlineCd == ""){
        $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
        $("#sModelCd").data("kendoExtDropDownList").enable(false);
        return false;
    }

    $("#sModelCd").data("kendoExtDropDownList").setDataSource(setModelDataSource(dataItem.carlineCd));
}

// 모델에 따른 OCN검색 [조회조건 영역]
function onSelectSearchModelCd(e){
    $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
    //$("#sOcnCd").data("kendoExtDropDownList").wrapper.show();
    $("#sOcnCd").data("kendoExtDropDownList").enable(true);

    var dataItem = this.dataItem(e.item);
    if(dataItem.modelCd == ""){
        $("#sOcnCd").data("kendoExtDropDownList").enable(false);
        return false;
    }
    $("#sOcnCd").data("kendoExtDropDownList").setDataSource(setOcnDataSource($("#sCarlineCd").val(), dataItem.modelCd));
}

/** [차량영역] ComboBox Select() **/
//차종에 따른 모델검색 [차량영역]
function onSelectCarlineCd(e){
    $("#modelCd").data("kendoExtDropDownList").setDataSource([]);
    $("#modelCd").data("kendoExtDropDownList").enable(true);

    $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
    $("#ocnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

    $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#extColorCd").data("kendoExtDropDownList").enable(false);

    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    $("#corpPromotionGrid").data('kendoExtGrid').dataSource.data([]);     // 프로모션 초기화
    $("#dlrPromotionGrid").data('kendoExtGrid').dataSource.data([]);      // 프로모션 초기화
    $("#promotionTotAmt").data("kendoExtNumericTextBox").value(0);           // 프로모션 금액

    //$("#whslAmt").data("kendoExtNumericTextBox").value(0);  // 초기화
    $("#retlAmt").data("kendoExtNumericTextBox").value(0);  // 초기화
    $("#promotionAmt").data("kendoExtNumericTextBox").value(0);              // 프로모션 :치환차감
    bf_sumCarAmt(); // 차량금액 계산

    $("#vinNo").val('');    // vin no
    $("#sVinNo").val('');
    $("#carRetlAmt").data("kendoExtNumericTextBox").value(0);  // 지도가

    var dataItem = this.dataItem(e.item);
    if(dataItem.carlineCd == ""){
        $("#modelCd").data("kendoExtDropDownList").enable(false);
        return false;
    }

    $("#modelCd").data("kendoExtDropDownList").setDataSource(setModelDataSource(dataItem.carlineCd));
}

// 모델에 따른 OCN검색 [차량영역]
function onSelectModelCd(e){
    onSelectModelCorp = "";
    onSelectModelDlr  = "";

    $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
    $("#ocnCd").data("kendoExtDropDownList").enable(true);

    $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#extColorCd").data("kendoExtDropDownList").enable(false);

    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    $("#vinNo").val('');    // vin no
    $("#sVinNo").val('');
    $("#carRetlAmt").data("kendoExtNumericTextBox").value(0);  // 지도가

    var dataItem = this.dataItem(e.item);
    if(dataItem.modelCd == ""){
        $("#ocnCd").data("kendoExtDropDownList").enable(false);
        return false;
    }
    onSelectModelCorp = dataItem.modelCd;
    onSelectModelDlr  = dataItem.modelCd;

    $("#ocnCd").data("kendoExtDropDownList").setDataSource(setOcnDataSource($("#carlineCd").val(), dataItem.modelCd));

    $("#promotionTotAmt").data("kendoExtNumericTextBox").value(0);           // 프로모션 금액
    //$("#whslAmt").data("kendoExtNumericTextBox").value(0);       // 초기화
    $("#retlAmt").data("kendoExtNumericTextBox").value(0);       // 초기화
    $("#promotionAmt").data("kendoExtNumericTextBox").value(0);  // 프로모션 :치환차감
    bf_sumCarAmt(); // 차량금액 계산

    // 계약일자가 없을시 프로모션 조회 못함.
    if($("#contractDt").data("kendoExtMaskedDatePicker").value() == ""){return false;}

    $("#corpPromotionGrid").data('kendoExtGrid').dataSource.read();
    $("#dlrPromotionGrid").data('kendoExtGrid').dataSource.read();
}

//OCN에 따른 외장색 검색
function onSelectOcnCd(e){
    $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#extColorCd").data("kendoExtDropDownList").enable(true);

    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    $("#vinNo").val('');    // vin no
    $("#sVinNo").val('');
    $("#carRetlAmt").data("kendoExtNumericTextBox").value(0);  // 지도가

    if(this.dataItem(e.item).ocnCd == ""){
        $("#extColorCd").data("kendoExtDropDownList").enable(false);
        return false;
    }

    //차량 가격 세팅
    //$("#whslAmt").data("kendoExtNumericTextBox").value(this.dataItem(e.item).whPrc);
    $("#retlAmt").data("kendoExtNumericTextBox").value(this.dataItem(e.item).msPrc);

    // 프로모션 :치환차감
    //$("#promotionAmt").data("kendoExtNumericTextBox").value(Number($("#promotionTotAmt").data("kendoExtNumericTextBox").value()) * -1);

    bf_sumCarAmt(); // 차량금액 계산

    $("#extColorCd").data("kendoExtDropDownList").setDataSource(setExtColorDataSource($("#modelCd").data("kendoExtDropDownList").value()));
}

// 외장색에 따른 내장색 검색
function onSelectExtColorCd(e){
    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(true);

    $("#vinNo").val('');    // vin no
    $("#sVinNo").val('');
    $("#carRetlAmt").data("kendoExtNumericTextBox").value(0);  // 지도가

    if(this.dataItem(e.item).ocnCd == ""){
        $("#intColorCd").data("kendoExtDropDownList").enable(false);
        return false;
    }

    $("#intColorCd").data("kendoExtDropDownList").setDataSource(setIntColorDataSource($("#modelCd").data("kendoExtDropDownList").value()));
}

// 차관(모델)의 DataSource를 불러온다.
function setModelDataSource(carlineCd){
    var responseJson = dms.ajax.getJson({
        url :"<c:url value='/sal/cnt/contractRe/selectModel.do' />"
        ,data :JSON.stringify({"carlineCd":carlineCd})
        ,async :false
    });

    if(responseJson == null || responseJson.data == null){
        responseJson.data = null;
    }

    return responseJson.data;
}

// OCN의 DataSource를 불러온다.
function setOcnDataSource(carlineCd, modelCd){
    var responseJson = dms.ajax.getJson({
        url :"<c:url value='/sal/cnt/contractRe/selectOcn.do' />"
        ,data :JSON.stringify({"carlineCd":carlineCd, "modelCd":modelCd})
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

//실운전자 계약자 정보 초기화
function reDriverData(){
    $("#drvCustTp").val("");       // 고객유형
    $("#drvCustCd_01").val("");    // 개인코드
    $("#drvCustNm_01").val("");    // 개인성명
    $("#vDrvCustNm_01").attr("disabled", false);
    $("#vDrvCustNm_01").val("");    // 개인성명
    $("#drvSsnCrnTp_01").data("kendoExtDropDownList").value('');
    $("#drvSsnCrnNo_01").val("");  // 증서번호
    $("#drvTelNo1_01").val("");    // 개인 연락처1
    $("#drvTelNo2_01").val("");    // 개인 연락처2
    $("#drvEmailNm_01").val("");   // 개인 이메일
    $("#drvSungCd_01").val("");    // 성
    $("#drvSungNm_01").val("");    // 성
    $("#drvCityCd_01").val("");    // 시
    $("#drvCityNm_01").val("");    // 시
    $("#drvDistCd_01").val("");    // 구
    $("#drvDistNm_01").val("");    // 구
    $("#drvZipCd_01").val("");     // 우편번호
    $("#drvAddrDetlCont_01").val("");  // 상세주소

    $("#drvCustCd_02").val("");    // 법인코드
    $("#drvCustNm_02").val("");    // 법인명
    $("#vDrvCustNm_02").attr("disabled", false);
    $("#vDrvCustNm_02").val("");    // 법인명
    $("#drvSsnCrnTp_02").data("kendoExtDropDownList").value('');
    $("#drvSsnCrnNo_02").val("");  // 증서번호
    $("#drvTelNo1_02").val("");    // 법인 연락처1
    $("#drvTelNo2_02").val("");    // 법인 연락처2
    $("#drvEmailNm_02").val("");   // 이메일명
    $("#drvSungCd_02").val("");    // 성
    $("#drvSungNm_02").val("");    // 성
    $("#drvCityCd_02").val("");    // 시
    $("#drvCityNm_02").val("");    // 시
    $("#drvDistCd_02").val("");    // 구
    $("#drvDistNm_02").val("");    // 구
    $("#drvZipCd_02").val("");     // 우편번호
    $("#drvAddrDetlCont_02").val("");   // 상세주소
}

// 차량금액 계산
function bf_sumCarAmt(){
   var carAmt   = Number($("#retlAmt").data("kendoExtNumericTextBox").value());
   var dcAmt    = Number($("#promotionAmt").data("kendoExtNumericTextBox").value());
   var sbstAmt  = Number($("#sbstAmt").data("kendoExtNumericTextBox").value());
   var goodsAmt = Number($("#goodsAmt").data("kendoExtNumericTextBox").value());

   // 실제 차량금액 = 차량가격(B) + 할인가격(-C) + 치환차감(-D) + 용품가격(E)
   var carTotAmt = carAmt + dcAmt + sbstAmt + goodsAmt;
   $("#realCarAmt").data("kendoExtNumericTextBox").value(carTotAmt);

   var consAmt = Number($("#consAmt").data("kendoExtNumericTextBox").value());
   var incAmt  = Number($("#incAmt").data("kendoExtNumericTextBox").value());
   var aapAmt  = Number($("#aapAmt").data("kendoExtNumericTextBox").value());
   var vatAmt  = Number($("#vatAmt").data("kendoExtNumericTextBox").value());

   // 기타비용합계 = 탁송료 + 보험료 + 대행료 + 부가금액
   var otherTotAmt = consAmt + incAmt + aapAmt + vatAmt;
   $("#etcSumAmt").data("kendoExtNumericTextBox").value(otherTotAmt);

   // 총판매 금액
   $("#realPayAmt").data("kendoExtNumericTextBox").value(carTotAmt + otherTotAmt);
   // 차량가격 - 금융서비스
   $("#fincCarAmt").data("kendoExtNumericTextBox").value(carTotAmt + otherTotAmt);

   // 가격 정보 탭
   //$("#prcWhslAmt").data("kendoExtNumericTextBox").value($("#whslAmt").data("kendoExtNumericTextBox").value());
   $("#prcRetlAmt").data("kendoExtNumericTextBox").value(carAmt);
   $("#prcPromotionAmt").data("kendoExtNumericTextBox").value(dcAmt);
   $("#prcSbstAmt").data("kendoExtNumericTextBox").value(sbstAmt);
   $("#prcGoodsAmt").data("kendoExtNumericTextBox").value(goodsAmt);
   $("#prcConsAmt").data("kendoExtNumericTextBox").value(consAmt);
   $("#prcIncAmt").data("kendoExtNumericTextBox").value(incAmt);
   $("#prcAapAmt").data("kendoExtNumericTextBox").value(aapAmt);
   $("#prcVatAmt").data("kendoExtNumericTextBox").value(vatAmt);
   $("#prcRealCarAmt").data("kendoExtNumericTextBox").value(carTotAmt);
   $("#prcEtcSumAmt").data("kendoExtNumericTextBox").value(otherTotAmt);
   $("#prcRealPayAmt").data("kendoExtNumericTextBox").value(carTotAmt + otherTotAmt);
}

// 탁송료 계산
bf_addConsAmt = function(){
    var consConsAmt = $("#consConsAmt").data("kendoExtNumericTextBox").value();
    if(consConsAmt == null){
        consConsAmt = 0;
        $("#consConsAmt").data("kendoExtNumericTextBox").value(0);
    }
    $("#consAmt").data("kendoExtNumericTextBox").value(consConsAmt);
    bf_sumCarAmt();     // 차량금액 계산
}

// 중고차치환 여부 변경 change
bf_uatcCarPurcYnChk = function(chk){
    if(chk == "Y"){
        $("#sUsrVinNo").attr("disabled", false);
        $("#purcNo").attr("disabled", false);
        $("#usrSbstAmt").data("kendoExtNumericTextBox").enable(true);
    }else{
        $("#sUsrVinNo").val('');
        $("#usrVinNo").val('');
        $("#purcNo").val('');
        $("#usrSbstAmt").data("kendoExtNumericTextBox").value(0);
        bf_addUsrSbstAmt();

        $("#sUsrVinNo").attr("disabled", true);
        $("#purcNo").attr("disabled", true);
        $("#usrSbstAmt").data("kendoExtNumericTextBox").enable(false);
    }
}

// 중고차 치환 ( 음수로 표시 요청 )
bf_addUsrSbstAmt = function(){
    var usrSbstAmt = $("#usrSbstAmt").data("kendoExtNumericTextBox").value();
    if(usrSbstAmt == null){
        usrSbstAmt = 0;
        $("#usrSbstAmt").data("kendoExtNumericTextBox").value(0);
    }
    $("#sbstAmt").data("kendoExtNumericTextBox").value( Number(usrSbstAmt) * -1 );
    bf_sumCarAmt();     // 차량금액 계산
}

// 번호판 등록처리
bf_addRegAmt = function(){
    var regPreAmt = $("#regPreAmt").data("kendoExtNumericTextBox").value();
    if(regPreAmt == null){
        regPreAmt = 0;
        $("#regPreAmt").data("kendoExtNumericTextBox").value(0);
    }
    $("#aapAmt").data("kendoExtNumericTextBox").value( regPreAmt );
    bf_sumCarAmt();     // 차량금액 계산
}

// 번호판 차익계산
bf_sumRegAmt = function(){
    var purcTaxPreAmt  = $("#purcTaxPreAmt").data("kendoExtNumericTextBox").value();
    var realPurcTaxAmt = $("#realPurcTaxAmt").data("kendoExtNumericTextBox").value();

    if(purcTaxPreAmt == null){
        purcTaxPreAmt = 0;
        $("#purcTaxPreAmt").data("kendoExtNumericTextBox").value(0);
    }

    if(realPurcTaxAmt == null){
        realPurcTaxAmt = 0;
        $("#realPurcTaxAmt").data("kendoExtNumericTextBox").value(0);
    }

    $("#regDifferenceAmt").data("kendoExtNumericTextBox").value( purcTaxPreAmt - realPurcTaxAmt );
}

// 보험예상금액
bf_sumIncAmt = function(){
    var incExpcAmt  = $("#incExpcAmt").data("kendoExtNumericTextBox").value();
    var realIncAmt = $("#realIncAmt").data("kendoExtNumericTextBox").value();

    if(incExpcAmt == null){
        incExpcAmt = 0;
        $("#incExpcAmt").data("kendoExtNumericTextBox").value(0);
    }

    if(realIncAmt == null){
        realIncAmt = 0;
        $("#realIncAmt").data("kendoExtNumericTextBox").value(0);
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
            oRealGoodsAmt += Number(oItem.realGoodsAmt);
        }
     });

    $("#goodsTotAmt").data("kendoExtNumericTextBox").value(oRealGoodsAmt);
    $("#goodsAmt").data("kendoExtNumericTextBox").value(oRealGoodsAmt);

    bf_sumCarAmt();  // 차량가격정보 계산
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

// 2급딜러조회
/*
bf_searchSecondDealerSearchPopup = function(){
    if( $("#lv2DlrYn").data("kendoExtDropDownList").value() != "Y" ){
        return ;
    }

    popupWindow = dms.window.popup({
        windowId :"secondDealerSearchPopupWin"    // 2급딜러조회 팝업
        ,title :"<spring:message code='sal.title.secondGradeDlrInfo'/>"   // 2급딜러정보
        ,content :{
            url :"<c:url value='/sal/btc/secondDealer/selectSecondDealerSearchPopup.do'/>"
            ,data:{
                "autoBind" :false
                , "lv2DlrCd" :$("#lv2DlrOrgCd").val()
                ,"callbackFunc" :function(data){
                    if(data.length > 0){
                        $("#lv2DlrOrgCd").val(data[0].lv2DlrCd);
                        $("#lv2DlrOrgNm").val(data[0].lv2DlrNm);
                    }

                    popupWindow.close();
                }
            }
        }
    });
}
*/

// CRM 고객 데이터 조회
bf_searchCustomer = function(obCd, sIdNm){

    // 판매기회로 넘어온 고객은 고객변경 불가.
    if(obCd == 'cust' && $("#saleOpptNo").val() != ""){ return;}

    // 집단판매는 고객정보 변경 불가
    if(obCd == 'cust' && $("#contractTp").data("kendoExtDropDownList").value() == "G"){ return;}

    // 실운전자 , 계약고객정보와 동일 체크 시 고객조회 불가
    if(obCd == 'drv' && (sIdNm == 'vDrvCustNm_01' || sIdNm == 'vDrvCustNm_02') && $("#realDriverSame").prop('checked') ){return; }

    var responseJson = {};
    if( dms.string.trim($("#"+sIdNm).val()).length > 0 ){
        responseJson = dms.ajax.getJson({
            url :"<c:url value='/sal/cnt/contractRe/selectCrmCustomerInfo.do' />"
            ,data :JSON.stringify({"lastIndex":2, "firstIndex":0, "sDlrCd":dlrCd, "sCustNm":$("#"+sIdNm).val()})
            ,async :false
        });
    }

    if(responseJson != null && responseJson.total == 1){
        bf_customerSet(obCd, responseJson.data);
    }else{

        popupWindow = dms.window.popup({
            windowId :"customerSearchPopup"
            , title :"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , modal:true
            , content :{
                url :"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data :{
                    "autoBind" :true
                    , "closeYn":"Y"
                    , "custNm" :$("#"+sIdNm).val()
                    , "type"   :null
                    , "callbackFunc" :function(data){
                        if(data.length >= 1) {
                            bf_customerSet(obCd, data);
                        }
                        //popupWindow.close();
                    }
                }
            }
        });
    }
}
function bf_customerSet(obCd, data){
    var custTp = data[0].custTp;
    // 계약고객
    if(obCd == 'cust'){
        $("#custTp").val(custTp);

        if(custTp == "02"){  // 법인
            $("#cust_01").hide();
            $("#cust_02").show();
        }
        else{            // 개인
            $("#cust_02").hide();
            $("#cust_01").show();
        }

        $("#custCd_"+custTp).val(data[0].custNo);       // 고객코드
        $("#custNm_"+custTp).val(data[0].custNm);       // 고객명
        $("#vCustNm_"+custTp).val(data[0].custNm);       // 고객명

        $("#ssnCrnTp_"+custTp).data("kendoExtDropDownList").value(data[0].mathDocTp); // 신분증유형 / 법인유형
        $("#ssnCrnNo_"+custTp).val(data[0].ssnCrnNo);  // 증서번호
        $("#telNo1_"+custTp).val(data[0].hpNo);        // 전화번호1
        $("#telNo2_"+custTp).val(data[0].telNo);       // 전화번호2
        $("#emailNm_"+custTp).val(data[0].emailNm);    // 이메일명
        $("#sungCd_"+custTp).val(data[0].sungCd);    // 성
        $("#sungNm_"+custTp).val(data[0].sungNm);    // 성
        $("#cityCd_"+custTp).val(data[0].cityCd);    // 시
        $("#cityNm_"+custTp).val(data[0].cityNm);    // 시
        $("#distCd_"+custTp).val(data[0].distCd);    // 구
        $("#distNm_"+custTp).val(data[0].distNm);    // 구
        $("#zipCd_"+custTp).val(data[0].zipCd);      // 우편번호
        $("#addrDetlCont_"+custTp).val(data[0].addrDetlCont);   // 상세주소

        if($("#realDriverSame").prop('checked')){
            bf_realDriverSame( $("#realDriverSame")[0] );   // 계약고객정보와 동일 체크시, 실행
        }

    }   // 실운전자
    else if(obCd == 'drv'){
        $("#drvCustTp").val(custTp);                   // 실운전자 고객유형

        if(custTp == "02"){  // 법인
            $("#drvCust_01").hide();
            $("#drvCust_02").show();
        }
        else{            // 개인
            $("#drvCust_02").hide();
            $("#drvCust_01").show();
        }

        $("#drvCustCd_"+custTp).val(data[0].custNo);       // 고객코드
        $("#drvCustNm_"+custTp).val(data[0].custNm);       // 고객명
        $("#vDrvCustNm_"+custTp).val(data[0].custNm);       // 고객명

        $("#drvSsnCrnTp_"+custTp).val(data[0].mathDocTp); // 신분증유형 / 법인유형
        $("#drvSsnCrnNo_"+custTp).val(data[0].ssnCrnNo);  // 증서번호
        $("#drvTelNo1_"+custTp).val(data[0].telNo);       // 전화번호1
        $("#drvTelNo2_"+custTp).val(data[0].telNo);       // 전화번호2
        $("#drvEmailNm_"+custTp).val(data[0].emailNm);    // 이메일명
        $("#drvSungCd_"+custTp).val(data[0].sungCd);    // 성
        $("#drvSungNm_"+custTp).val(data[0].sungNm);    // 성
        $("#drvCityCd_"+custTp).val(data[0].cityCd);    // 시
        $("#drvCityNm_"+custTp).val(data[0].cityNm);    // 시
        $("#drvDistCd_"+custTp).val(data[0].distCd);    // 구
        $("#drvDistNm_"+custTp).val(data[0].distNm);    // 구
        $("#drvZipCd_"+custTp).val(data[0].zipCd);      // 우편번호
        $("#drvAddrDetlCont_"+custTp).val(data[0].addrDetlCont);   // 상세주소

    }       // 검색
    else{
        $("#sContractCustNo").val(data[0].custNo);       // 고객코드
        $("#sContractCustNm").val(data[0].custNm);       // 고객명
        $("#vContractCustNm").val(data[0].custNm);

    }
}


// 실운전자 계약자와 동일
bf_realDriverSame = function(obj){

    // 실운전자 계약자 정보 초기화
    reDriverData();

    if(obj.checked){

        // 고객 유형 : 01:개인 , 02:법인
        $("#drvCustTp").val($("#custTp").val());

        var drvCustTp = $("#drvCustTp").val();

        /** 계약고객정보 **/
        if(drvCustTp == "02"){  // 법인
            $("#drvCust_01").hide();
            $("#drvCust_02").show();
        }
        else{            // 개인
            $("#drvCust_02").hide();
            $("#drvCust_01").show();
        }

        $("#vDrvCustNm_"+drvCustTp).attr("disabled", true);

        $("#drvCustCd_"+drvCustTp).val($("#custCd_"+drvCustTp).val());       // 고객코드
        $("#drvCustNm_"+drvCustTp).val($("#custNm_"+drvCustTp).val());       // 고객명
        $("#vDrvCustNm_"+drvCustTp).val($("#vCustNm_"+drvCustTp).val());       // 고객명
        $("#drvSsnCrnTp_"+drvCustTp).data("kendoExtDropDownList").value($("#ssnCrnTp_"+drvCustTp).data("kendoExtDropDownList").value()); // 신분증유형 / 법인유형
        $("#drvSsnCrnNo_"+drvCustTp).val($("#ssnCrnNo_"+drvCustTp).val());  // 증서번호
        $("#drvTelNo1_"+drvCustTp).val($("#telNo1_"+drvCustTp).val());      // 전화번호1
        $("#drvTelNo2_"+drvCustTp).val($("#telNo2_"+drvCustTp).val());      // 전화번호2
        $("#drvEmailNm_"+drvCustTp).val($("#emailNm_"+drvCustTp).val());    // 이메일명
        $("#drvSungCd_"+drvCustTp).val($("#sungCd_"+drvCustTp).val());      // 성
        $("#drvSungNm_"+drvCustTp).val($("#sungNm_"+drvCustTp).val());      // 성
        $("#drvCityCd_"+drvCustTp).val($("#cityCd_"+drvCustTp).val());      // 시
        $("#drvCityNm_"+drvCustTp).val($("#cityNm_"+drvCustTp).val());      // 시
        $("#drvDistCd_"+drvCustTp).val($("#distCd_"+drvCustTp).val());      // 구
        $("#drvDistNm_"+drvCustTp).val($("#distNm_"+drvCustTp).val());      // 구
        $("#drvZipCd_"+drvCustTp).val($("#zipCd_"+drvCustTp).val());        // 우편번호
        $("#drvAddrDetlCont_"+drvCustTp).val($("#addrDetlCont_"+drvCustTp).val());   // 상세주소
    }
}

// 금융신청시 체크
bf_fincReq = function(obj){
    if($("#fincReq").prop('checked')){
        $("#divFincReq").show();
    }else{
        $("#divFincReq").hide();
    }
}

// 해당 프로모션을 선택했을 경우 차량 가격 계산.
function bf_checkPromotion(obj, id, own){
    var carAmt = Number($("#retlAmt").data("kendoExtNumericTextBox").value());     // 차량가격 = 공장지도가
    var sDcAmt = 0          // 할인가격
       , chk = 'N';         // 버튼 체크 여부
    var grid;
    if(own == 1){
       grid = $("#corpPromotionGrid").data("kendoExtGrid");
    }else{
       grid = $("#dlrPromotionGrid").data("kendoExtGrid");
    }

    var rows = grid.tbody.find("tr");
    $.each(rows, function(idx, row){
        var item = grid.dataItem(row);

        if(item.promotionCd == id){
            chk = item.chkYn;           // 체크시 :N , 해제시 :Y
            // 비율(R) , 금액(F)
            if(item.applyTp == "R"){
                sDcAmt = carAmt * (Number(item.promotionAmt) / 100 );
            }else{
                sDcAmt = Number(item.promotionAmt);
            }
        }
    });

    /**
    *  체크박스를 막 클릭했을 경우,
    *  obj.checked 가 정확히 작동하지 못하는 현상 발생으로.
    *  chkYn값을 체크하여 중복 발생하는 현상을 막음.
    **/
    var dcAmt = $("#promotionTotAmt").data("kendoExtNumericTextBox");
    if(obj.checked){
        if(chk == "N"){
            dcAmt.value( (Number(dcAmt.value()) + sDcAmt) );
        }
    }else{
        if(chk == "Y"){
            dcAmt.value( (Number(dcAmt.value()) - sDcAmt) );
        }
    }

/*
    var dcAmt = $("#dcAmt").data("kendoExtNumericTextBox");
    if(obj.checked){
        dcAmt.value( (Number(dcAmt.value()) + sDcAmt) );
    }else{
        dcAmt.value( (Number(dcAmt.value()) - sDcAmt) );
    }
*/

    $("#promotionAmt").data("kendoExtNumericTextBox").value( Number(dcAmt.value()) * -1 );

    bf_sumCarAmt(); // 차량금액 계산
}

//우편번호 조회(탁송지)
var zipCodeSearchPopupWin = null;
bf_zipCodeSearch = function (){
    if( $("#consTp").val() == "I" ){ return; }

    zipCodeSearchPopupWin = dms.window.popup({
        windowId :"zipCodeSearchPopupWin"
        , title :"<spring:message code='cmm.title.zipcode.search' />"   // 우편번호 조회
        , modal:true
        , content :{
            url :"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
            , data :{
                "autoBind" :false
                , "usrNm":""
                , "callbackFunc" :function(data){
                    if(data.length >= 1) {
                        $("#consZipCd").val(data[0].zipCd);
                        $("#consSungNm").val(data[0].sungNm);
                        $("#consSungCd").val(data[0].sungCd);
                        $("#consCityNm").val(data[0].cityNm);
                        $("#consCityCd").val(data[0].cityCd);
                        $("#consDistNm").val(data[0].distNm);
                        $("#consDistCd").val(data[0].distCd);
                        $("#consAddrDetlCont").val('');
                    }

                    //zipCodeSearchPopupWin.close();
                }
            }
        }
    });
}

//용품조회
selectGoodsSearchPopup = function(goodsCd, pkgItemCd){

    /*
    // 차종
    if($("#carlineCd").data("kendoExtDropDownList").value() == "" ){
        dms.notification.info("<spring:message code='global.lbl.carLine' var='globalLblCarLine' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCarLine}' />");
        return false;
    }

    popupWindow = dms.window.popup({
        windowId :"GoodsSearchPopup"
        ,title :"<spring:message code='sal.title.goodsSearch' />"   // 용품조회
        ,modal:true
        ,content :{
            url :"<c:url value='/sal/cmm/selectGoodsSearchPopup.do'/>"
            ,data:{
                "type" :null
                ,"autoBind" :true
                , "sDlrCd" :dlrCd
                , "sCarlineCd" :$("#carlineCd").data("kendoExtDropDownList").value()
                , "sCarlineNm" :$("#carlineCd").data("kendoExtDropDownList").text()
                ,"callbackFunc" :function(data){
                    var grid = $('#goodsGrid').data('kendoExtGrid');
                    var item = grid.dataItem(grid.select());
                    item.set("goodsCd", data[0].itemCd);
                    item.set("goodsNm", data[0].itemNm);
                    item.set("goodsPrc", data[0].salePrcAmt);

                    if(item.serviceYn == "Y"){
                        item.set("goodsAmt", 0 );
                    }else{
                        item.set("goodsAmt", Number(item.goodsPrc) * Number(item.goodsCnt) );
                    }

                    bf_gridSumGoodsAmt();
                    popupWindow.close();
                }
            }
        }
    });
    */


    popupWindow = dms.window.popup({
        windowId:"GoodsItemSearchPopup"
        ,width:700
        ,title:"<spring:message code='sal.title.goodsSearch' />"   // 용품조회
        ,content:{
            url:"<c:url value='/sal/acc/accessoryMng/selectGoodsItemSearchPopup.do'/>"
            ,data:{
                "type":null
                ,"autoBind":true
                , "sDlrCd":dlrCd
                , "sCarlineCd" :$("#carlineCd").data("kendoExtDropDownList").value()
                , "sGoodsCd"   :goodsCd
                , "sPkgItemCd" :pkgItemCd
                ,"callbackFunc":function(data, type){
                    var tData = {};
                    var grid = $("#goodsGrid").data("kendoExtGrid");
                    var selectItem = grid.dataItem(grid.select());

                    if(type == "01"){       // 패키지
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
                                selectItem.set("goodsCd", tData.itemCd);
                                selectItem.set("goodsNm", tData.itemNm);
                                selectItem.set("goodsCnt", 1);
                                selectItem.set("goodsUnitCd", dms.string.strNvl(tData.stockUnitCd) != "" ? tData.stockUnitCd:tData.itemUnitCd );
                                selectItem.set("goodsPrc", Number(tData.itemPrc));
                                selectItem.set("dcRate", Number(tData.pkgDetlDcRate));
                                selectItem.set("goodsAmt", Number(tData.itemPrc) - ( Number(tData.itemPrc) * (Number(tData.pkgDetlDcRate) / 100) ) );
                                selectItem.set("serviceYn", "N");
                                selectItem.set("realGoodsAmt", (Number(tData.itemPrc) - ( Number(tData.itemPrc) * (Number(tData.pkgDetlDcRate) / 100) ) ) );
                                selectItem.set("dcAmt",   Number(tData.itemPrc) - (Number(tData.itemPrc) - ( Number(tData.itemPrc) * (Number(tData.pkgDetlDcRate) / 100) ) )  );
                                selectItem.set("pkgItemCd", pkgItemCd);
                                selectItem.set("grStrgeCd",   tData.grStrgeCd);
                                selectItem.set("giStrgeCd",   tData.giStrgeCd);
                                selectItem.set("dirty", true);
                            }else{
                                grid.dataSource.insert(rowNum+i, {
                                    "dlrCd":dlrCd
                                    ,"contractNo":$("#contractNo").val()
                                    ,"goodsCd":tData.itemCd
                                    ,"goodsNm":tData.itemNm
                                    ,"goodsCnt":1
                                    ,"goodsUnitCd":dms.string.strNvl(tData.stockUnitCd) != "" ? tData.stockUnitCd :tData.itemUnitCd
                                    ,"goodsPrc":Number(tData.itemPrc)
                                    ,"dcRate":Number(tData.pkgDetlDcRate)
                                    ,"goodsAmt":Number(tData.itemPrc) - ( Number(tData.itemPrc) * (Number(tData.pkgDetlDcRate) / 100))
                                    ,"serviceYn":"N"
                                    ,"realGoodsAmt":Number(tData.itemPrc) - ( Number(tData.itemPrc) * (Number(tData.pkgDetlDcRate) / 100) )
                                    ,"dcAmt":Number(tData.itemPrc) - (Number(tData.itemPrc) - (Number(tData.itemPrc) * (Number(tData.pkgDetlDcRate) / 100)) )
                                    ,"pkgItemCd":pkgItemCd
                                    ,"grStrgeCd":tData.grStrgeCd
                                    ,"giStrgeCd":tData.giStrgeCd
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
                                selectItem.set("goodsPrc", Number(tData.salePrcAmt));
                                selectItem.set("dcRate", 0);
                                selectItem.set("goodsAmt", Number(tData.salePrcAmt) );
                                selectItem.set("serviceYn", "N");
                                selectItem.set("realGoodsAmt", Number(tData.salePrcAmt) * 1);
                                selectItem.set("dcAmt", 0);
                                selectItem.set("pkgItemCd", "");
                                selectItem.set("grStrgeCd",   tData.grStrgeCd);
                                selectItem.set("giStrgeCd",   tData.giStrgeCd);
                                selectItem.set("dirty", true);
                            }else{
                                grid.dataSource.insert(rowNum+i, {
                                    "dlrCd":dlrCd
                                    ,"contractNo":$("#contractNo").val()
                                    ,"goodsCd":tData.itemCd
                                    ,"goodsNm":tData.itemNm
                                    ,"goodsCnt":1
                                    ,"goodsUnitCd":dms.string.strNvl(tData.stockUnitCd) != "" ? dms.string.strNvl(tData.stockUnitCd) :dms.string.strNvl(tData.itemUnitCd)
                                    ,"goodsPrc":Number(tData.salePrcAmt)
                                    ,"dcRate":0
                                    ,"goodsAmt":Number(tData.salePrcAmt)
                                    ,"serviceYn":"N"
                                    ,"realGoodsAmt":Number(tData.salePrcAmt) * 1
                                    ,"dcAmt":0
                                    ,"pkgItemCd":""
                                    ,"grStrgeCd":tData.grStrgeCd
                                    ,"giStrgeCd":tData.giStrgeCd
                                }).set("dirty", true);
                            }
                        }
                    }
                    popupWindow.close();
                }
            }
        }
    });
}

//중고차 VIN NO 조회 검색
bf_searchUsedCarVinNo = function(){
    if( dms.string.strNvl($("#uatcCarPurcYn").data("kendoExtDropDownList").value()) == "N" ){ return ;}

    popupWindow = dms.window.popup({
        windowId :"VinNoContractPopup"
        , title :"<spring:message code='sal.title.usedCarSearch' />"   // 중고차조회
        , modal:true
        , content :{
            url :"<c:url value='/sal/cnt/contractRe/selectContractReUsedCarSearchPopup.do'/>"
            , data :{
                "autoBind" :true
                , "type"   :null
                , "sDlrCd" :dlrCd
                , "sVinNo" :$("#sUsrVinNo").val()
                , "callbackFunc" :function(data){
                    if(data.length >= 1) {

                        $("#sUsrVinNo").val(dms.string.strNvl(data[0].vinNo));
                        $("#usrVinNo").val(dms.string.strNvl(data[0].vinNo));
                        $("#purcNo").val(dms.string.strNvl(data[0].purcNo));

                        $("#usrSbstAmt").data("kendoExtNumericTextBox").value(Number(data[0].exchAmt));
                        bf_addUsrSbstAmt();
                    }
                    popupWindow.close();
                }
            }
        }
    });
}
$("#sUsrVinNo").keyup(function(e){
    if (e.keyCode == 13) {
        if($(this).val() != "") {
            bf_searchUsedCarVinNo();
        }
    }else{
        if(dms.string.strNvl($("#sUsrVinNo").val()) != dms.string.strNvl($("#usrVinNo").val()) ){
            $("#usrVinNo").val('');
        }
    }
});



//신차 VIN NO 조회 검색
bf_searchVinNo = function(){
    popupWindow = dms.window.popup({
        windowId :"VinNoContractPopup"
        , title :"<spring:message code='sal.title.carSearch' />"   // 차량조회
        , modal:true
        , content :{
            url :"<c:url value='/sal/cnt/contractRe/selectContractReVinNoSearchPopup.do'/>"
            , data :{
                "autoBind" :false
                , "type"   :null
                , "sDlrCd" :dlrCd
                , "sCarlineCd" :$("#carlineCd").data("kendoExtDropDownList").value()
                , "sCarlineNm" :$("#carlineCd").data("kendoExtDropDownList").text()
                , "sModelCd" :$("#modelCd").data("kendoExtDropDownList").value()
                , "sModelNm" :$("#modelCd").data("kendoExtDropDownList").text()
                , "sOcnCd" :$("#ocnCd").data("kendoExtDropDownList").value()
                , "sOcnNm" :$("#ocnCd").data("kendoExtDropDownList").text()
                , "sExtColorCd" :$("#extColorCd").data("kendoExtDropDownList").value()
                , "sExtColorNm" :$("#extColorCd").data("kendoExtDropDownList").text()
                , "sIntColorCd" :$("#intColorCd").data("kendoExtDropDownList").value()
                , "sIntColorNm" :$("#intColorCd").data("kendoExtDropDownList").text()
                , "sVinNo" :$("#sVinNo").val()
                , "callbackFunc" :function(data){
                    if(data.length >= 1) {
                        if(dms.string.strNvl(data[0].vinNo) != ""){
                            //$("#sVinNo2").val(data[0].vinNo.substring(11,17));
                            $("#sVinNo").val(data[0].vinNo);
                        }
                        $("#vinNo").val(dms.string.strNvl(data[0].vinNo));
                        //$("#carRetlAmt").data("kendoExtNumericTextBox").value(data[0].retlPrc);
                        $("#carRetlAmt").data("kendoExtNumericTextBox").value(Number(data[0].msPrc));

                        if($("#carlineCd").data("kendoExtDropDownList").value() != data[0].carlineCd){
                            $("#carlineCd").data("kendoExtDropDownList").value(data[0].carlineCd);
                        }

                        if($("#modelCd").data("kendoExtDropDownList").value() == ""
                                || $("#modelCd").data("kendoExtDropDownList").value() != data[0].modelCd){
                           var modelCd = $("#modelCd").data("kendoExtDropDownList");
                           modelCd.setDataSource([{modelNm:data[0].modelNm, modelCd:data[0].modelCd}]);
                           modelCd.value(data[0].modelCd);
                           modelCd.enable(false);
                        }

                        if($("#ocnCd").data("kendoExtDropDownList").value() == ""
                                || $("#ocnCd").data("kendoExtDropDownList").value() != data[0].ocnCd){
                           var ocnCd = $("#ocnCd").data("kendoExtDropDownList");
                           ocnCd.setDataSource([{ocnNm:data[0].ocnNm, ocnCd:data[0].ocnCd}]);
                           ocnCd.value(data[0].ocnCd);
                           ocnCd.enable(false);
                        }

                        if($("#extColorCd").data("kendoExtDropDownList").value() == ""
                                || $("#extColorCd").data("kendoExtDropDownList").value() != data[0].extColorCd){
                           var extColorCd = $("#extColorCd").data("kendoExtDropDownList");
                           extColorCd.setDataSource([{extColorNm:data[0].extColorNm, extColorCd:data[0].extColorCd}]);
                           extColorCd.value(data[0].extColorCd);
                           extColorCd.enable(false);
                        }

                        if($("#intColorCd").data("kendoExtDropDownList").value() == ""
                                || $("#intColorCd").data("kendoExtDropDownList").value() != data[0].intColorCd){
                           var intColorCd = $("#intColorCd").data("kendoExtDropDownList");
                           intColorCd.setDataSource([{intColorNm:data[0].intColorNm, intColorCd:data[0].intColorCd}]);
                           intColorCd.value(data[0].intColorCd);
                           intColorCd.enable(false);
                        }

                        onSelectModelCorp = data[0].modelCd;
                        onSelectModelDlr  = data[0].modelCd;

                        $("#promotionTotAmt").data("kendoExtNumericTextBox").value(0);  // 프로모션 금액
                        $("#promotionAmt").data("kendoExtNumericTextBox").value(0);     // 프로모션 :치환차감

                        if($("#contractDt").data("kendoExtMaskedDatePicker").value() != ""){
                            $("#corpPromotionGrid").data('kendoExtGrid').dataSource.read();
                            $("#dlrPromotionGrid").data('kendoExtGrid').dataSource.read();
                        }

                        // 소매, 도매가
                        //$("#whslAmt").data("kendoExtNumericTextBox").value(Number(data[0].whPrc));
                        $("#retlAmt").data("kendoExtNumericTextBox").value(Number(data[0].msPrc));

                        bf_sumCarAmt(); // 차량금액 계산

                    }
                    popupWindow.close();
                }
            }
        }
    });
}
$("#sVinNo").keyup(function(e){
    if (e.keyCode == 13) {
        if($(this).val() != "") {
            bf_searchVinNo();
        }
    }
});


//임시배정 취소
function bf_initVinNo(){
    if($("#contractTp").data("kendoExtDropDownList").value() == "D"){
        return ;
    }

    $("#carlineCd").data("kendoExtDropDownList").value("");

    $("#modelCd").data("kendoExtDropDownList").setDataSource([]);
    $("#modelCd").data("kendoExtDropDownList").enable(false);

    $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
    $("#ocnCd").data("kendoExtDropDownList").enable(false);

    $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#extColorCd").data("kendoExtDropDownList").enable(false);

    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    $("#corpPromotionGrid").data('kendoExtGrid').dataSource.data([]);     // 프로모션 초기화
    $("#dlrPromotionGrid").data('kendoExtGrid').dataSource.data([]);      // 프로모션 초기화
    $("#promotionTotAmt").data("kendoExtNumericTextBox").value(0);           // 프로모션 금액

    $("#retlAmt").data("kendoExtNumericTextBox").value(0);  // 초기화
    $("#promotionAmt").data("kendoExtNumericTextBox").value(0);              // 프로모션 :치환차감
    bf_sumCarAmt(); // 차량금액 계산

    $("#sVinNo").val('');  // Vin_No
    $("#vinNo").val('');    // vin no
    $("#carRetlAmt").data("kendoExtNumericTextBox").value(0);  // 지도가
}

//판매기회, 집단판매 CRM고객정보 갱신 조회
function bf_crmCustSearch(){

    var sCustTp = $("#custTp").val();
    var sCustCd = $("#custCd_"+sCustTp).val();

    $.ajax({
        url :"<c:url value='/sal/cnt/contractRe/selectCrmCustomerInfo.do' />"
        ,data :JSON.stringify({"sDlrCd":dlrCd, "sCustNo":sCustCd})
        ,type :'POST'
        ,dataType :'json'
        ,contentType :'application/json'
        ,error :function(jqXHR,status,error) {
            dms.notification.error(error);
        }
        ,success :function(jqXHR, textStatus) {

            var dataItem = jqXHR.data[0]
              , cuTp = dataItem.custTp;

            $("#custTp").val(cuTp);
            if(cuTp == "02"){  // 법인
                $("#cust_01").hide();
                $("#cust_02").show();
            }else{            // 개인
                $("#cust_02").hide();
                $("#cust_01").show();
            }
            $("#custCd_"+cuTp).val(dataItem.custNo);       // 고객코드
            $("#custNm_"+cuTp).val(dataItem.custNm);       // 고객명
            $("#ssnCrnTp_"+cuTp).data("kendoExtDropDownList").value(dataItem.mathDocTp); // 신분증유형 / 법인유형
            $("#ssnCrnNo_"+cuTp).val(dataItem.ssnCrnNo);   // 증서번호
            $("#telNo1_"+cuTp).val(dataItem.hpNo);         // 전화번호1
            $("#telNo2_"+cuTp).val(dataItem.telNo);        // 전화번호2
            $("#emailNm_"+cuTp).val(dataItem.emailNm);     // 이메일명

            // 판매기회 고객의 대표주소S
            $("#addr1_"+cuTp).val(dataItem.sungNm +" "+dataItem.cityNm +" "+dataItem.distNm);    // 주소1
            $("#addr2_"+cuTp).val(dataItem.addrDetlCont);         // 주소2

            $("#sungCd_"+cuTp).val(dataItem.sungCd);    // 성
            $("#sungNm_"+cuTp).val(dataItem.sungNm);    // 성
            $("#cityCd_"+cuTp).val(dataItem.cityCd);    // 시
            $("#cityNm_"+cuTp).val(dataItem.cityNm);    // 시
            $("#distCd_"+cuTp).val(dataItem.distCd);  // 구
            $("#distNm_"+cuTp).val(dataItem.distNm);    // 구
            $("#addrDetlCont_"+cuTp).val(dataItem.addrDetlCont);   // 상세주소

           if($("#realDriverSame").prop('checked')){
                bf_realDriverSame( $("#realDriverSame")[0] );     // 계약고객정보와 동일 체크시, 실행
           }
        }
    });
}

//견적 버튼 클릭
bf_clickEstimate = function (){
    /*
    if($("#fincNo").val() == "" ){
        // 신청번호를 선택하여 주세요.
        dms.notification.warning("<spring:message code='global.lbl.applNumber' var='globalLblApplNumber' /><spring:message code='global.info.check.field' arguments='${globalLblApplNumber}' />");
        return false;
    }
    */

    /*
    // 인터페이스완성되면, 해당 주석만 풀어서 사용할것.
    popupWindow = dms.window.popup({
        windowId:"fincInfoItemPopup"
        , title:"<spring:message code='sal.title.fincEstimate' />"   // 금융상품 견적
        , content:{
            url:"<c:url value='/sal/fim/fincInfoMng/selectfincEstimatePopup.do' />"
            , data:{
                "autoBind":false
                , "type"  :null
                , "fincNo":$("#fincNo").val()
                , "fincItemNm":$("#fincItemCd").data("kendoExtDropDownList").text()        // 상품
                , "fincReqAmt":$("#fincReqAmt").data("kendoExtNumericTextBox").value()       // 대출금액
                , "fincRpayPrid":$("#fincRpayPrid").val()                                 // 대출기간
                , "fincLoanRate":$("#fincLoanRate").val()                                 // 대출비율
                , "callbackFunc":function(data){
                    if(data.length >= 1) {
                        //console.log(data);
                    }
                    popupWindow.close();
                }
            }
        }
    });
    */

    // 임시 화면
    popupWindow = dms.window.popup({
        windowId:"fincInfoItemPopup"
        , title:"<spring:message code='sal.title.fincEstimate' />"   // 금융상품 견적
        , height:600
        , content:{
            url:"https://m.bhaf-bhmc.com.cn/buy/calculator"
        }
    });

}


/** 무결성 검사 **/
function save_Validate(){

    // 인도요청일
    if( dms.string.isEmpty($("#dlReqDt").data("kendoExtMaskedDatePicker").value())){
        dms.notification.info("<spring:message code='global.lbl.dlReqDt' var='globalLblDlReqDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblDlReqDt}' />");
        $("#tabstrip").data("kendoExtTabStrip").select(0);
        $("#dlReqDt").focus();
        return false;
    }

    // 계약유형
    if( dms.string.isEmpty($("#contractTp").data("kendoExtDropDownList").value())){
        dms.notification.info("<spring:message code='global.lbl.contractType' var='globalLblContractType' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblContractType}' />");
        $("#tabstrip").data("kendoExtTabStrip").select(0);
        $("#contractTp").focus();
        return false;
    }

    var custTp = $("#custTp").val();
    if( $("#custCd_"+custTp).val() == ""){
        // {고객}를(을) 선택해주세요. : 계약고객
        dms.notification.info("<spring:message code='global.lbl.customer' var='globalLblCustomer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCustomer}' />");

        $("#tabstrip").data("kendoExtTabStrip").select(0);
        $("#custCd_"+custTp == "" ? "01" :custTp).focus();
        return false;
    }
    var drvCustTp = $("#drvCustTp").val();
    if( $("#drvCustCd_"+custTp).val() == ""){
        // {고객}를(을) 선택해주세요. :실운전자
        dms.notification.info("<spring:message code='sal.lbl.driver' var='salLblDriver' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblDriver}' />");

        $("#tabstrip").data("kendoExtTabStrip").select(1);
        $("#drvCustCd_"+custTp == "" ? "01" :custTp).focus();
        return false;
    }

    // 계약고객정보와 동일 체크 시 ( 계약자 = 실운전자 )
    if( $("#realDriverSame").prop('checked') == true ){
        if( $("#custCd_"+custTp).val() != $("#drvCustCd_"+drvCustTp).val() ){
            // {고객}를(을) 선택해주세요. :실운전자
            dms.notification.info("<spring:message code='sal.lbl.driver' var='salLblDriver' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblDriver}' />");

            $("#tabstrip").data("kendoExtTabStrip").select(1);
            return false;
        }
    }

     // 2급딜러여부
    /*
     if( $("#lv2DlrYn").data("kendoExtDropDownList").value() == "Y" ){
        if( $("#lv2DlrOrgCd").val() == ""){
            // 2급딜러을 선택하여 주세요.
            dms.notification.info("<spring:message code='sal.lbl.lv2DlrOrg' var='salLblLv2DlrOrg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblLv2DlrOrg}' />");
            $("#tabstrip").data("kendoExtTabStrip").select(0);
            return false;
        }
    }
    */

    // 계약일
    if($("#contractDt").data("kendoExtMaskedDatePicker").value() == "" ){
        dms.notification.info("<spring:message code='global.lbl.contractDt' var='globalLblContractDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblContractDt}' />");
        $("#tabstrip").data("kendoExtTabStrip").select(0);
        $("#contractDt").focus();
        return false;
    }

    if( dms.string.strNvl($("#contractNo").val()) == ""
            && kendo.toString($("#contractDt").data("kendoExtMaskedDatePicker").value(),"yyyy-MM-dd") < toDay ){
        // {계약일자}은 {현재일자}보다 작을 수 없습니다.
        dms.notification.info("<spring:message code='global.lbl.contractDt' var='globalLblContractDt' /><spring:message code='sal.lbl.toDay' var='salLblToDay' /><spring:message code='sal.info.CheckDateForm' arguments='${globalLblContractDt},${salLblToDay}' />");
        $("#tabstrip").data("kendoExtTabStrip").select(0);
        $("#contractDt").focus();
        return false;
    }

    // 차종
    if( dms.string.isEmpty($("#carlineCd").data("kendoExtDropDownList").value()) ){
        dms.notification.info("<spring:message code='global.lbl.carLine' var='globalLblCarLine' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCarLine}' />");
        $("#tabstrip").data("kendoExtTabStrip").select(0);
        $("#carlineCd").focus();
        return false;
    }

    // 모델
    if( dms.string.isEmpty($("#modelCd").data("kendoExtDropDownList").value()) ){
        dms.notification.info("<spring:message code='global.lbl.model' var='globalLblModel' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblModel}' />");
        $("#tabstrip").data("kendoExtTabStrip").select(0);
        $("#modelCd").focus();
        return false;
    }

    // ocn
    if(dms.string.isEmpty($("#ocnCd").data("kendoExtDropDownList").value()) ){
        dms.notification.info("<spring:message code='global.lbl.ocn' var='globalLblOcn' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblOcn}' />");
        $("#tabstrip").data("kendoExtTabStrip").select(0);
        $("#ocnCd").focus();
        return false;
    }

    // 외색
    if(dms.string.isEmpty($("#extColorCd").data("kendoExtDropDownList").value())){
        dms.notification.info("<spring:message code='global.lbl.extColor' var='globalLblExtColor' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblExtColor}' />");
        $("#tabstrip").data("kendoExtTabStrip").select(0);
        $("#extColorCd").focus();
        return false;
    }

    // 내색
    if(dms.string.isEmpty($("#intColorCd").data("kendoExtDropDownList").value())){
        dms.notification.info("<spring:message code='global.lbl.intColor' var='globalLblIntColor' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblIntColor}' />");
        $("#tabstrip").data("kendoExtTabStrip").select(0);
        $("#intColorCd").focus();
        return false;
    }

    // 지불방식
    if( dms.string.isEmpty($("#payTp").data("kendoExtDropDownList").value())){
        // {지불방식}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='sal.lbl.payTp' var='salLblPayTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblPayTp}' />");
        $("#tabstrip").data("kendoExtTabStrip").select(0);
        $("#payTp").focus();
        return false;
    }

    // 탁송구분이 C 이면, 탁송료 와 탁송지 선택
    if( $("#consTp").val() == "C" ){
        //탁송료
        if( $("#consConsAmt").data("kendoExtNumericTextBox").value() <= 0 ){
            dms.notification.info("<spring:message code='global.lbl.consAmt' var='globalLblConsAmt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblConsAmt}' />");
            $("#tabstrip").data("kendoExtTabStrip").select(2);
            return false;
        }
        // 탁송지
        if(  $("#consZipCd").val() == "" || $("#consAddrDetlCont").val() == ""){
            dms.notification.info("<spring:message code='global.lbl.consAddr' var='globalLblConsAddr' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblConsAddr}' />");
            $("#tabstrip").data("kendoExtTabStrip").select(2);
            return false;
        }
    }

    // 중고차 치환
    if(dms.string.strNvl($("#uatcCarPurcYn").data("kendoExtDropDownList").value()) == "Y"){
        if($("#usrVinNo").val() == "" && $("#sUsrVinNo").val() == "" ){
            // VIN NO 을(를) 올바르게 입력하여 주십시오.
            dms.notification.info("<spring:message code='global.lbl.vinNum' var='globalLblVinNum' /><spring:message code='global.info.validation.pattern' arguments='${globalLblVinNum}' />");
            $("#tabstrip").data("kendoExtTabStrip").select(6);
            $("#sUsrVinNo").focus();
            return false;
        }

        if($("#purcNo").val() == ""){
            // 매입번호 을(를) 올바르게 입력하여 주십시오.
            dms.notification.info("<spring:message code='sal.lbl.documentNo' var='salLblDocumentNo' /><spring:message code='global.info.validation.pattern' arguments='${salLblDocumentNo}' />");
            $("#tabstrip").data("kendoExtTabStrip").select(6);
            $("#purcNo").focus();
            return false;
        }
    }

    // 번호판 등록서비스
    if($("#regTp").val() == "A"){


    }

    // 보험서비스
    if($("#incAapTp").val() == "A"){


    }

    if($("#fincReq").prop('checked')){
        // 금융사
        if( dms.string.strNvl($("#fincCmpCd").data("kendoExtDropDownList").value()) == "" ){
            dms.notification.info("<spring:message code='global.lbl.fincCmp' var='globalLblFincCmp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblFincCmp}' />");
            $("#tabstrip").data("kendoExtTabStrip").select(7);
            return false;
        }

        // 상품
        if( dms.string.strNvl($("#fincItemCd").data("kendoExtDropDownList").value()) == "" ){
            dms.notification.info("<spring:message code='sal.lbl.fincItem' var='globalLblFincItem' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblFincItem}' />");
            $("#tabstrip").data("kendoExtTabStrip").select(7);
            return false;
        }
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

    $("#dlrPromotionAmt").val(selectPromotionAmt('dlr'));       // 딜러 프로모션 값 지정
    $("#corpPromotionAmt").val(selectPromotionAmt('corp'));     // 법인 프로모션 값 지정

    var param = {
            "sStartContractDt" :$("#contractDt").data("kendoExtMaskedDatePicker").value()
            ,"sCarlineCd" :$("#carlineCd").data("kendoExtDropDownList").value()
            ,"sModelCd" :$("#modelCd").data("kendoExtDropDownList").value()
            ,"sOcnCd" :$("#ocnCd").data("kendoExtDropDownList").value()
            , "sPromotionAmt" :Number($("#dlrPromotionAmt").val())
    }

    $.ajax({
        url :"<c:url value='/sal/cnt/contractRe/selectDlrDcLevel.do' />"
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

               /*
               if(!confirm("["+ dms.string.strNvl(dcLvlCdObj[jqXHR.data[0].dcLvlCd]) +"] <spring:message code='sal.lbl.dcLvMsg' /> \n <spring:message code='sal.lbl.isContinueMsg' />")){
                   return false;
               }
               $("#dcLvlCd").val(jqXHR.data[0].dcLvlCd);
               $("#dcApproveYn").val("Y");
               save(mFlag);
               */
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

// 법인/딜러별 프로모션 합계 계산
function selectPromotionAmt(id){
    var carAmt = Number($("#retlAmt").data("kendoExtNumericTextBox").value());     // 차량가격 = 공장지도가
    var sDcAmt = 0;

    var grid;
    if(id == 'dlr'){
        grid = $("#dlrPromotionGrid").data('kendoExtGrid');
    }else{
        grid = $("#corpPromotionGrid").data('kendoExtGrid');
    }

    var rows = grid.tbody.find("tr");
    $.each(rows, function(idx, row){
        var item = grid.dataItem(row);

        if(item.chkYn == "Y"){
            if(item.applyTp == "R"){
                sDcAmt += carAmt * (Number(item.promotionAmt) / 100 );
            }else{
                sDcAmt += Number(item.promotionAmt);
            }
        }
    });
    return sDcAmt;
}

/*********
 * 저장
 *********/
function save(mFlag){

    /** 무결성 검사 **/
    //if( !save_Validate() ){
    //   return false;
    //}

    dms.loading.show($("#callContractReWindow"));     // 로딩 시작

    var param = {
        "contractReVO" :$("#contForm").serializeObject($("#contForm").serializeArrayInSelector("[data-json-obj='true']"))
        ,"corpPromotionVO" :$("#corpPromotionGrid").data("kendoExtGrid").getCUDData("insertCorpPromotionList", "updateCorpPromotionList", "deleteCorpPromotionList")
        ,"dlrPromotionVO" :$("#dlrPromotionGrid").data("kendoExtGrid").getCUDData("insertDlrPromotionList", "updateDlrPromotionList", "deleteDlrPromotionList")
        ,"payInfoVO" :$("#payInfoGrid").data("kendoExtGrid").getCUDData("insertPayInfoList", "updatePayInfoList", "deletePayInfoList")
        ,"goodsVO" :$("#goodsGrid").data("kendoExtGrid").getCUDData("insertGoodsList", "updateGoodsList", "deleteGoodsList")
        ,"incVO" :$("#incGrid").data("kendoExtGrid").getCUDData("insertIncList", "updateIncList", "deleteIncList")
        ,"optionVO" :$("#optionGrid").data("kendoExtGrid").getCUDData("insertOptionList", "updateOptionList", "deleteOptionList")
        ,"multiFlag" :mFlag
    };

    if( $("#contractStatCd").val() == "" ){
        param.contractReVO.contractStatCd = "10";
    }

    if( $("#usrVinNo").val() == "" ){
        param.contractReVO.usrVinNo = $("#sUsrVinNo").val();
    }

    param.contractReVO.contractTp = $("#contractTp").data("kendoExtDropDownList").value();

    param.contractReVO.contractDt = $("#contractDt").data("kendoExtMaskedDatePicker").value();           // 계약일
    param.contractReVO.dlReqDt = $("#dlReqDt").data("kendoExtMaskedDatePicker").value();                 // 인도요청일
    param.contractReVO.contractRcptDt = $("#contractRcptDt").data("kendoExtMaskedDatePicker").value();   // 영수일자
    param.contractReVO.regExpcDt = $("#regExpcDt").data("kendoExtMaskedDatePicker").value();             // 등록예상일자
    param.contractReVO.fincReqDt = $("#fincReqDt").data("kendoExtMaskedDatePicker").value();             // 신청일자
    param.contractReVO.fincEndDt = $("#fincEndDt").data("kendoExtMaskedDatePicker").value();             // 만기일자

    param.contractReVO.realPayAmt = $("#realPayAmt").data("kendoExtNumericTextBox").value();                // 가격

    // 차종
    param.contractReVO.carlineCd  = $("#carlineCd").data("kendoExtDropDownList").value();
    param.contractReVO.modelCd    = $("#modelCd").data("kendoExtDropDownList").value();
    param.contractReVO.ocnCd      = $("#ocnCd").data("kendoExtDropDownList").value();
    param.contractReVO.extColorCd = $("#extColorCd").data("kendoExtDropDownList").value();
    param.contractReVO.intColorCd = $("#intColorCd").data("kendoExtDropDownList").value();

    // 계약고객정보
    var custTp = $("#custTp").val();
    param.contractReVO.custTp = custTp;                            // 고객유형
    param.contractReVO.custCd = $("#custCd_"+custTp).val();         // 고객코드
    param.contractReVO.contractCustNo = $("#custCd_"+custTp).val(); // 고객코드 0201T

    param.contractReVO.custNm = $("#custNm_"+custTp).val();         // 고객명
    param.contractReVO.ssnCrnTp = $("#ssnCrnTp_"+custTp).val();   //신분증유형
    param.contractReVO.ssnCrnNo = $("#ssnCrnNo_"+custTp).val();      //증서번호
    param.contractReVO.telNo1 = $("#telNo1_"+custTp).val();         // 전화번호1
    param.contractReVO.telNo2 = $("#telNo2_"+custTp).val();         // 전화번호2
    param.contractReVO.emailNm = $("#emailNm_"+custTp).val();
    param.contractReVO.sungNm = $("#sungNm_"+custTp).val();
    param.contractReVO.sungCd = $("#sungCd_"+custTp).val();
    param.contractReVO.cityNm = $("#cityNm_"+custTp).val();
    param.contractReVO.cityCd = $("#cityCd_"+custTp).val();
    param.contractReVO.distNm = $("#distNm_"+custTp).val();
    param.contractReVO.distCd = $("#distCd_"+custTp).val();
    param.contractReVO.zipCd  = $("#zipCd_"+custTp).val();          // 우편번호
    param.contractReVO.addrDetlCont  = $("#addrDetlCont_"+custTp).val();          // 주소

    // 계약고객정보와 동일 체크
    if( $("#realDriverSame").prop('checked') == true ){
        param.contractReVO.realDriverSameYn = "Y";
    }else{
        param.contractReVO.realDriverSameYn = "N";
    }

    // 실운전자정보
    var drvCustTp = $("#drvCustTp").val();
    param.contractReVO.drvCustTp = drvCustTp;                         // 고객유형
    param.contractReVO.drvCustCd = $("#drvCustCd_"+drvCustTp).val();   // 고객코드
    param.contractReVO.realDriverCustNo = $("#drvCustCd_"+drvCustTp).val();   // 고객코드 0201T

    param.contractReVO.drvCustNm    = $("#drvCustNm_"+drvCustTp).val();      // 고객명
    param.contractReVO.drvSsnCrnTp = $("#drvSsnCrnTp_"+drvCustTp).val();   //신분증유형
    param.contractReVO.drvSsnCrnNo  = $("#drvSsnCrnNo_"+drvCustTp).val();    //증서번호
    param.contractReVO.drvTelNo1    = $("#drvTelNo1_"+drvCustTp).val();      // 전화번호1
    param.contractReVO.drvTelNo2    = $("#drvTelNo2_"+drvCustTp).val();      // 전화번호2
    param.contractReVO.drvEmailNm   = $("#drvEmailNm_"+drvCustTp).val();
    param.contractReVO.drvSungNm = $("#drvSungNm_"+drvCustTp).val();
    param.contractReVO.drvSungCd = $("#drvSungCd_"+drvCustTp).val();
    param.contractReVO.drvCityNm = $("#drvCityNm_"+drvCustTp).val();
    param.contractReVO.drvCityCd = $("#drvCityCd_"+drvCustTp).val();
    param.contractReVO.drvDistNm = $("#drvDistNm_"+drvCustTp).val();
    param.contractReVO.drvDistCd = $("#drvDistCd_"+drvCustTp).val();
    param.contractReVO.drvZipCd  = $("#drvZipCd_"+drvCustTp).val();          // 우편번호
    param.contractReVO.drvAddrDetlCont  = $("#drvAddrDetlCont_"+drvCustTp).val();          // 주소

    // 금융신청 체크
    if( $("#fincReq").prop('checked')){
        param.contractReVO.fincReqYn = "Y";
    }else{
        param.contractReVO.fincReqYn = "N";
    }

    $.ajax({
        url :"<c:url value='/sal/cnt/contractRe/multiContractRes.do' />"
        ,data :JSON.stringify(param)
        ,type :'POST'
        ,dataType :'json'
        ,contentType :'application/json'
        ,error :function(jqXHR,status,error) {
            dms.loading.hide($("#callContractReWindow"));   // 로딩 종료
            if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
        }
        ,success :function(jqXHR, textStatus) {
            dms.loading.hide($("#callContractReWindow"));   // 로딩 종료
            if(mFlag == "save"){
                approval(jqXHR);
            }else{
                var grid = $("#contGrid").data("kendoExtGrid");
                refreshAll();
                reSearch(jqXHR);                    // 조회조건 세팅

                $("#savedContractNo").val(jqXHR);   // 저장된 계약번호
                grid.dataSource.page(1);

                $("#callContractReWindow").data("kendoWindow").close();

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
        }
    });
}

/**
 * 계약생성
 */
function approval(vContNo){
    var cNo    = $("#contractNo").val()
      , cState = $("#contractStatCd").val();

    if(typeof(vContNo) != "undefined" ){
        cNo = vContNo;
        cState = "20";
    }

    dms.loading.show($("#callContractReWindow"));     // 로딩 시작

    var param = {};
    param.contractNo = cNo;
    param.contractStatCd = cState;

    $.ajax({
        url :"<c:url value='/sal/cnt/contractRe/approval.do' />",
        data :JSON.stringify(param),
        type :'POST',
        dataType :'json',
        contentType :'application/json',
        error :function(jqXHR,status,error) {
            dms.loading.hide($("#callContractReWindow"));   // 로딩 종료
            //dms.notification.error(jqXHR.responseJSON.errors);
            if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
        },
        success :function(jqXHR, textStatus) {
            var grid = $("#contGrid").data("kendoExtGrid");
            refreshAll();
            reSearch(jqXHR);                    // 조회조건 세팅
            $("#savedContractNo").val(jqXHR);   // 승인한 계약번호

            dms.loading.hide($("#callContractReWindow"));   // 로딩 종료

            grid.dataSource.page(1);

            $("#callContractReWindow").data("kendoWindow").close();

            //정상적으로 반영 되었습니다.
            dms.notification.success("<spring:message code='global.info.success'/>");
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
            url :"<c:url value='/sal/cnt/contractRe/deleteContract.do' />",
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
                var grid = $("#contGrid").data("kendoExtGrid");
                //grid.dataSource.read();
                refreshAll();
                //fn_btnState();  // 버튼처리 초기화 상태
                reSearch(jqXHR);                    // 조회조건 세팅

                $("#savedContractNo").val(jqXHR);   // 저장된 계약번호
                grid.dataSource.page(1);

                $("#callContractReWindow").data("kendoWindow").close();

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
        });

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
            url :"<c:url value='/sal/cnt/contractRe/cancelContract.do' />",
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
                /*
                var grid = $("#contGrid").data("kendoExtGrid");
                grid.dataSource.read();
                refreshAll();
                fn_btnState();  // 버튼처리 초기화 상태

                $("#callContractReWindow").data("kendoWindow").close();
                */

                var grid = $("#contGrid").data("kendoExtGrid");
                refreshAll();
                reSearch(jqXHR);                    // 조회조건 세팅

                $("#savedContractNo").val(jqXHR);   // 저장된 계약번호
                grid.dataSource.page(1);

                $("#callContractReWindow").data("kendoWindow").close();

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
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
function fn_btnState(state){
    switch(state){
        case '10':     // 계약등록
            $("#btnPayPrint").data("kendoButton").enable(false);
            $("#btnContPrint").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(true);
            $("#btnCreate").data("kendoButton").enable(true);
            //$("#btnRemove").data("kendoButton").enable(true);
            //$("#btnSave").data("kendoButton").enable(false);
            //$("#btnUpdate").data("kendoButton").enable(true);
            $("#btnPayInfoSave").data("kendoButton").enable(true);
        break;
        case '20':     // 계약생성
            $("#btnPayPrint").data("kendoButton").enable(false);
            $("#btnContPrint").data("kendoButton").enable(true);
            $("#btnCancel").data("kendoButton").enable(true);
            $("#btnCreate").data("kendoButton").enable(true);
            //$("#btnRemove").data("kendoButton").enable(false);
            //$("#btnSave").data("kendoButton").enable(false);
            //$("#btnUpdate").data("kendoButton").enable(false);

            $("#btnPayInfoSave").data("kendoButton").enable(true);
            break;
        case '50':     // 고객인도
            $("#btnPayPrint").data("kendoButton").enable(true);
            $("#btnContPrint").data("kendoButton").enable(true);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnCreate").data("kendoButton").enable(false);
            //$("#btnRemove").data("kendoButton").enable(false);
            //$("#btnSave").data("kendoButton").enable(false);
            //$("#btnUpdate").data("kendoButton").enable(false);

            $("#btnPayInfoSave").data("kendoButton").enable(true);
            break;
        case '90':     // 계약삭제 - 계약생성전
        case '91':     // 계약해지
            $("#btnPayPrint").data("kendoButton").enable(false);
            $("#btnContPrint").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnCreate").data("kendoButton").enable(false);
            //$("#btnRemove").data("kendoButton").enable(false);
            //$("#btnSave").data("kendoButton").enable(false);
            //$("#btnUpdate").data("kendoButton").enable(false);

            $("#btnPayInfoSave").data("kendoButton").enable(false);
            break;
        default :      // 작성전
            $("#btnPayPrint").data("kendoButton").enable(false);
            $("#btnContPrint").data("kendoButton").enable(false);
            $("#btnCancel").data("kendoButton").enable(false);
            $("#btnCreate").data("kendoButton").enable(true);
            //$("#btnRemove").data("kendoButton").enable(false);
            //$("#btnSave").data("kendoButton").enable(true);
            //$("#btnUpdate").data("kendoButton").enable(false);

            $("#btnPayInfoSave").data("kendoButton").enable(false);
            break;
    }

    $("#btnViewDetail").data("kendoButton").enable(true);
    $("#btnRefresh").data("kendoButton").enable(true);
    $("#btnSearch").data("kendoButton").enable(true);
}

// 상세내용 팝업 호출
function viewDetailPopup(){
    var win = $("#callContractReWindow").data("kendoWindow").center().open();
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
            searchCustEnter(cId);
        }
    }else{
        cleanCustCheck(cId);
    }
});

// 고객명 Enter로 검색
function searchCustEnter(cId){
    var key = "";
    if(cId == "vContractCustNm"){
        key = 'search';
    }else if(cId == "vCustNm_01"){
        key = 'cust';
    }else if(cId == "vCustNm_02"){
        key = 'cust';
    }else if(cId == "vDrvCustNm_01"){
        key = 'drv';
    }else if(cId == "vDrvCustNm_02"){
        key = 'drv';
    }

    bf_searchCustomer(key, cId);
}

// 고객명 변경시 고객정보 clean
function cleanCustCheck(cId){
    if(cId == "vContractCustNm"){
        if(dms.string.strNvl($("#"+cId).val()) != dms.string.strNvl($("#sContractCustNm").val()) ){
            $("#sContractCustNo").val('');
        }
    }else if(cId == "vCustNm_01"){
        if(dms.string.strNvl($("#"+cId).val()) != dms.string.strNvl($("#custNm_01").val()) ){
            $("#custCd_01").val('');       // 고객코드
            $("#ssnCrnTp_01").data("kendoExtDropDownList").value(''); // 신분증유형 / 법인유형
            $("#ssnCrnNo_01").val('');  // 증서번호
            $("#telNo1_01").val('');       // 전화번호1
            $("#telNo2_01").val('');       // 전화번호2
            $("#emailNm_01").val('');    // 이메일명
            $("#sungCd_01").val('');    // 성
            $("#sungNm_01").val('');    // 성
            $("#cityCd_01").val('');    // 시
            $("#cityNm_01").val('');    // 시
            $("#distCd_01").val('');    // 구
            $("#distNm_01").val('');    // 구
            $("#zipCd_01").val('');      // 우편번호
            $("#addrDetlCont_01").val('');   // 상세주소
        }
    }else if(cId == "vCustNm_02"){
        if(dms.string.strNvl($("#"+cId).val()) != dms.string.strNvl($("#custNm_02").val()) ){
            $("#custCd_02").val('');       // 고객코드
            $("#ssnCrnTp_02").data("kendoExtDropDownList").value(''); // 신분증유형 / 법인유형
            $("#ssnCrnNo_02").val('');  // 증서번호
            $("#telNo1_02").val('');    // 전화번호1
            $("#telNo2_02").val('');    // 전화번호2
            $("#emailNm_02").val('');   // 이메일명
            $("#sungCd_02").val('');    // 성
            $("#sungNm_02").val('');    // 성
            $("#cityCd_02").val('');    // 시
            $("#cityNm_02").val('');    // 시
            $("#distCd_02").val('');    // 구
            $("#distNm_02").val('');    // 구
            $("#zipCd_02").val('');      // 우편번호
            $("#addrDetlCont_02").val('');   // 상세주소
        }
    }else if(cId == "vDrvCustNm_01"){
        if(dms.string.strNvl($("#"+cId).val()) != dms.string.strNvl($("#drvCustNm_01").val()) ){
            $("#drvCustCd_01").val('');       // 고객코드
            $("#drvSsnCrnTp_01").data("kendoExtDropDownList").value(''); // 신분증유형 / 법인유형
            $("#drvSsnCrnNo_01").val('');  // 증서번호
            $("#drvTelNo1_01").val('');    // 전화번호1
            $("#drvTelNo2_01").val('');    // 전화번호2
            $("#drvEmailNm_01").val('');   // 이메일명
            $("#drvSungNm_01").val('');    // 성
            $("#drvSungCd_01").val('');    // 성
            $("#drvCityNm_01").val('');    // 시
            $("#drvCityCd_01").val('');    // 시
            $("#drvDistNm_01").val('');    // 구
            $("#drvDistCd_01").val('');    // 구
            $("#drvZipCd_01").val('');      // 우편번호
            $("#drvAddrDetlCont_01").val('');   // 상세주소
        }
    }else if(cId == "vDrvCustNm_02"){
        if(dms.string.strNvl($("#"+cId).val()) != dms.string.strNvl($("#drvCustNm_02").val()) ){
            $("#drvCustCd_02").val('');       // 고객코드
            $("#drvSsnCrnTp_02").data("kendoExtDropDownList").value(''); // 신분증유형 / 법인유형
            $("#drvSsnCrnNo_02").val('');  // 증서번호
            $("#drvTelNo1_02").val('');    // 전화번호1
            $("#drvTelNo2_02").val('');    // 전화번호2
            $("#drvEmailNm_02").val('');   // 이메일명
            $("#drvSungNm_02").val('');    // 성
            $("#drvSungCd_02").val('');    // 성
            $("#drvCityNm_02").val('');    // 시
            $("#drvCityCd_02").val('');    // 시
            $("#drvDistNm_02").val('');    // 구
            $("#drvDistCd_02").val('');    // 구
            $("#drvZipCd_02").val('');      // 우편번호
            $("#drvAddrDetlCont_01").val('');   // 상세주소
        }
    }
}

// 고객정보 수정링크
$(document).on("click", ".linkCustNo", function(e){
    // tab window open
    window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+$(this).val(), "VIEW-D-10272");
});

/* *************************************************************************
 **************************파일업로드3********************************************
 ***************************************************************************/
 //================================
 var r = new Resumable({
     target :"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
     ,chunkSize :1 * 1024 * 1024
     ,simultaneousUploads :4
     ,testChunks :true
     ,throttleProgressCallbacks :1
     ,method :"octet"
     //,maxFiles :1
 });
 r.assignBrowse($('#fileSelect')[0]);

 //파일추가 이벤트
 r.on('fileAdded', function(file) {

     $("#progressWindow").kendoWindow({
         width :"600px"
         ,height :"300px"
         ,title :"<spring:message code='global.lbl.fileSend'/>"     // 파일전송
         ,animation:false
         ,draggable :false
         ,visible :false
         ,resizable :false
         ,modal :true
     }).data("kendoWindow").center().open();


     $('.resumable-progress, .resumable-list').show();
     $('.resumable-progress .progress-resume-link').hide();
     $('.resumable-progress .progress-pause-link').show();

     //파일목록 출력
     $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

     //업로드 시작
     r.upload();

 });
 r.on('pause', function() {
     $('.resumable-progress .progress-resume-link').show();
     $('.resumable-progress .progress-pause-link').hide();
 });
 r.on('uploadStart', function() {

     var _that = this;

     if (_that.opt["query"] == null) {
          _that.opt["query"] = {};
     }

     if (dms.string.isEmpty($("#fileDocId").val())) {
         $.ajax({
             url :"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
             dataType :"json",
             type :"get",
             async :false,
             cache :false,
             success :function(id) {
                 _that.opt["query"]["resumableSessionId"] = id;
                 $("#fileDocId").val(id);
             }
         });
     } else {
         _that.opt["query"]["resumableSessionId"] = $("#fileDocId").val();
     }

     $('.resumable-progress .progress-resume-link').hide();
     $('.resumable-progress .progress-pause-link').show();
 });
 r.on('complete', function() {

     var _that = this;

     $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();

     //console.log("resumableSessionId :" + _that.opt["query"]["resumableSessionId"]);

     $("#progressWindow").data("kendoWindow").close();
     r.files = [];
     $(".resumable-list").html("");
 });
 r.on('fileSuccess', function(file, message) {
     ///console.log(message);

     var result = JSON.parse(message);
     if(result.status === "finished") {
         $("#fileGrid").data("kendoExtGrid").dataSource.insert({
             fileDocNo :result.fileDocNo
             ,fileNo :result.fileNo
             ,fileNm :result.fileNm
             ,fileSize :dms.string.formatFileSize(result.fileSize)
         });
         //$('.resumable-file-'+file.uniqueIdentifier+' .resumable-file-progress').html('(completed)');
     }


 });
 r.on('fileError', function(file, message) {
     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded:' + message + ')');
 });
 r.on('fileProgress', function(file) {
     var fileProgress = 0;

     if (file instanceof ResumableChunk) {
         fileProgress = file.fileObj.progress();
     } else {
         fileProgress = file.progress();
     }

     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width :Math.min(Math.floor(fileProgress * 100), 100) + '%'});
     $('.progress-bar').css({width :Math.min(Math.floor(r.progress() * 100), 100)+ '%'});
 });
 /* *************************************************************************
 **************************파일업로드3****************************************
 ***************************************************************************/

 /******************************************
  * 함수영역 - end
  ******************************************/
//-->
</script>
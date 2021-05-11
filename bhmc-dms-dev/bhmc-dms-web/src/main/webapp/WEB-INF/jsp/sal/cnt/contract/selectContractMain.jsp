<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
<%-- <dms:configValue code='defaultCurrency' var="_defaultCurrency" /> --%>

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

<!-- 계약품의관리 화면 -->
<!-- <section id="content"> -->

    <!-- 계약품의관리 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code='sal.title.retailContractOrd' /></h1>
            <div class="left_area">
                <span class="span_txt"><spring:message code="global.lbl.dealer" /></span>    <!-- 딜러 -->
                <span class="readonly_area">
                    <input id="sDlrCd" readonly class="form_comboBox" style="width:150px;" />
                </span>
            </div>
            <div class="btn_right">
                <button id="btnPayPrint" class="btn_m"><spring:message code='sal.btn.payPrint' /></button>        <!-- 결산서출력 -->
                <button id="btnContPrint" class="btn_m"><spring:message code='sal.btn.contPrint' /></button>       <!-- 계약서출력 -->
                <button id="btnApproval" class="btn_m" style="display:none"><spring:message code='global.btn.approvalFix' /></button>        <!-- 승인확정 -->
                <button id="btnConRequestAppr" class="btn_m" style="display:none"><spring:message code='global.btn.applyReq' /></button>     <!-- 승인요청 -->
                <button id="btnRefresh"  class="btn_m btn_reset"><spring:message code='global.btn.init' /></button>                          <!-- 초기화 -->
                <button id="btnSearch"   class="btn_m btn_search"><spring:message code='global.btn.search' /></button>  <!-- 조회 -->
                <button id="btnSave"     class="btn_m btn_save"><spring:message code='global.btn.save' /></button>      <!-- 저장 -->
                <button id="btnRemove"   class="btn_m btn_delete" style="display:none"><spring:message code='global.btn.del' /></button>     <!-- 삭제 -->
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.salPrsnNm' /></th> <!-- 판매직원 -->
                        <td class="readonly_area">
                            <input id="sSaleEmpNo" readonly class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                        <td>
                            <div class="form_float">
                                <div class="form_left">
                                    <div class="form_search">
                                        <input id="sContractCustNo" class="form_input" onPaste="return false;" />
                                        <a href="javascript:bf_searchCustomer('search');"><spring:message code='global.btn.search' /></a>       <!-- 조회 -->
                                    </div>
                                </div>
                                <div class="form_right">
                                    <input id="sContractCustNm" readonly class="form_input form_readonly">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.contractType' /></th>      <!-- 계약유형 -->
                        <td>
                            <input id="sContractTp" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.contractNo' /></th>        <!-- 계약번호 -->
                        <td>
                            <input id="sContractNo" class="form_input">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.contractStat' /></th>      <!-- 계약상태 -->
                        <td>
                            <input id="sContractStatCd" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.contractDt' /></th>        <!-- 계약일자 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sStartContractDt" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sEndContractDt" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.carLine' /></th>   <!-- 차종 -->
                        <td>
                            <input id="sCarlineCd" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.model' /></th>     <!-- 모델 -->
                        <td>
                            <input id="sModelCd" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.ocn' /></th>       <!-- OCN -->
                        <td>
                            <input id="sOcnCd" class="form_comboBox">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 계약내역 그리드 시작 -->
        <div class="table_grid mt10">
            <div id="contGrid"></div>
        </div>
        <!-- 계약내역 그리드 종료 -->
    </section>
    <!-- //계약품의관리 -->


<form id="contForm" name="contForm" method="POST">
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.contractNo' /></th>        <!-- 계약번호 -->
                        <td>
                            <input id="contractNo" name="contractNo" class="form_input" readonly="readonly" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.contractDt' /></th>        <!-- 계약일자 -->
                        <td>
                            <input id="contractDt" name="contractDt" class="form_datepicker" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.saleOpptSeq' /></th>        <!-- 판매기회번호 -->
                        <td>
                            <input id="saleOpptNo" name="saleOpptNo" class="form_input form_readonly" readonly="readonly" data-json-obj="true">
                        </td>
                    </tr>

                    <tr>
                        <th scope="row"><spring:message code='global.lbl.lv2DlrYn' /></th>        <!-- 2급딜러여부 -->
                        <td>
                            <input id="lv2DlrYn" name="lv2DlrYn" class="form_comboBox" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.lv2DlrOrg' /></th>        <!-- 2급딜러 -->
                        <td>
                            <div class="form_float">
                                <div class="form_left">
                                    <div class="form_search">
                                        <input id="lv2DlrOrdCd" name="lv2DlrOrdCd" class="form_input" data-json-obj="true">
                                        <!-- 개발진행 예정중입니다. -->
                                        <a href="javascript:alert('<spring:message code='global.info.developIng' />')"><spring:message code='global.btn.search' /></a>       <!-- 조회 -->
                                    </div>
                                </div>
                                <div class="form_right">
                                    <input id="lv2DlrOrdNm" readonly class="form_input form_readonly">
                                </div>
                            </div>
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //계약상세정보 -->

    <!-- 차량가격정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.title.vehiclePriceInfo' /></h2>           <!-- 차량가격정보 -->
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.vehiclePrice' /></th>      <!-- 차량가격 -->
                        <td>
                            <input id="carAmt" name="carAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.dcAmt' /></th>        <!-- 할인가격 -->
                        <td>
                            <input id="dcAmt" name="dcAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true">
                        </td>
                        <th scope="row" class="txt_total"><spring:message code='global.lbl.carAmt' /></th>      <!-- 차량금액 -->
                        <td>
                            <input id="carTotAmt" name="carTotAmt" class="form_numeric ar" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.goodsAmt' /></th>      <!-- 용품가격 -->
                        <td>
                            <input id="goodsTotAmt" name="goodsTotAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.consAmt' /></th>           <!-- 탁송료 -->
                        <td>
                            <input id="consAmt" name="consAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.regSbodtAmt' /></th>       <!-- 부대비용 -->
                        <td>
                            <input id="regSbodtAmt" name="regSbodtAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.vattaxAmt' /></th>         <!-- 증치세 -->
                        <td>
                            <input id="vattaxAmt" name="vattaxAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.otherTaxAmt' /></th>       <!-- 기타세금 -->
                        <td>
                            <input id="otherTaxAmt" name="otherTaxAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true">
                        </td>
                        <th scope="row" class="txt_total"><spring:message code='global.lbl.oterTotAmt' /></th>      <!-- 기타비용합계 -->
                        <td>
                            <input id="otherTotAmt" class="form_numeric ar" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.oterAmt' /></th>       <!-- 기타금액 -->
                        <td class="bor_none">
                            <input id="otherAmt" name="otherAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true">
                        </td>
                        <th scope="row" class="bor_none"></th>
                        <td></td>
                        <th scope="row" class="txt_total"><spring:message code='sal.lbl.payTotAmt' /></th>      <!-- 총 판매금액 -->
                        <td>
                            <input id="payTotAmt" class="form_numeric ar" readonly="readonly">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //차량가격정보 -->

    <!-- 계약고객정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.title.retailCustomerInfo' /></h2>         <!-- 계약고객정보 -->
        </div>
        <!-- 개인 -->
        <div id="cust_01" class="table_form">
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
                        <th scope="row"><spring:message code='global.lbl.customer' /></th>          <!-- 고객 -->
                        <td>
                            <div class="form_float">
                                <div class="form_left" style="width:43%;">
                                    <div class="form_search">
                                        <input id="custCd_01" readonly class="form_input">
                                        <a href="javascript:bf_searchCustomer('cust');"><spring:message code='global.btn.search' /></a>     <!-- 검색 -->
                                    </div>
                                </div>
                                <div class="form_left" style="width:39%;">
                                    <input id="custNm_01" readonly class="form_input form_readonly">
                                </div>
                                <div class="form_right" style="width:18%;">
                                    <input value="<spring:message code='global.lbl.personal' />" readonly class="form_input form_readonly ac">       <!-- 개인 -->
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='par.lbl.telNo' /></th>        <!-- 대표전화번호 -->
                        <td>
                            <input id="telNo1_01" readonly class="form_input">
                            <input type="hidden" id="telNo2_01">    <!-- 전화번호2 화면에 없음 -->
                        </td>
                        <th scope="row"><spring:message code='global.lbl.emailNm' /></th>       <!-- 이메일 -->
                        <td>
                            <input id="emailNm_01" readonly class="form_input">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.addr' /></th>      <!-- 주소 -->
                        <td colspan="3">
                            <div class="form_float">
                                <div class="form_left" style="width:11%;">
                                    <input id="zipCd_01" readonly class="form_input">
                                </div>
                                <div class="form_left" style="width:55%;">
                                    <input id="addr1_01" readonly class="form_input">
                                </div>
                                <div class="form_right" style="width:34%;">
                                    <input id="addr2_01" readonly class="form_input">
                                </div>
                            </div>
                        </td>
                        <th scope="row"></th>
                        <td></td>
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
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                        <td>
                            <div class="form_float">
                                <div class="form_left" style="width:43%;">
                                    <div class="form_search">
                                        <input id="custCd_02" readonly class="form_input">
                                        <a href="javascript:bf_searchCustomer('cust');"><spring:message code='global.btn.search' /></a>     <!-- 검색 -->
                                    </div>
                                </div>
                                <div class="form_left" style="width:39%;">
                                    <input id="custNm_02" readonly class="form_input form_readonly">
                                </div>
                                <div class="form_right" style="width:18%;">
                                    <input value="<spring:message code='global.lbl.corporation' />" readonly class="form_input form_readonly ac">        <!-- 법인 -->
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='par.lbl.telNo' /></th>            <!-- 회사전화번호 -->
                        <td>
                            <input id="telNo1_02" readonly class="form_input">
                            <input type="hidden" id="telNo2_02">    <!-- 전화번호2 화면에 없음 -->
                        </td>
                        <th scope="row"><spring:message code='global.lbl.crnNo' /></th>     <!-- 사업자등록번호 -->
                        <td>
                            <input id="crnNo_02" readonly class="form_input">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.addr' /></th>      <!-- 법인주소 -->
                        <td colspan="3">
                            <div class="form_float">
                                <div class="form_left" style="width:11%;">
                                    <input id="zipCd_02" readonly class="form_input">
                                </div>
                                <div class="form_left" style="width:55%;">
                                    <input id="addr1_02" readonly class="form_input">
                                </div>
                                <div class="form_right" style="width:34%;">
                                    <input id="addr2_02" readonly class="form_input">
                                </div>
                            </div>
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- //법인 -->
    </section>
    <!-- //계약고객정보 -->

    <!-- 실운전자정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='global.title.realDriverInfo' /></h2>      <!-- 실운전자정보 -->
            <div class="fl">
                <label><input type="checkbox" id="realDriverSame" class="form_check" onclick="bf_realDriverSame(this)"> <spring:message code='global.lbl.contractCustomerInfoSame' /></label>       <!-- 계약고객정보와 동일 -->
            </div>
        </div>
        <!-- 개인 -->
        <div id="drvCust_01" class="table_form">
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
                        <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                        <td>
                            <div class="form_float">
                                <div class="form_left" style="width:43%;">
                                    <div class="form_search">
                                        <input id="drvCustCd_01" readonly class="form_input">
                                        <a href="javascript:bf_searchCustomer('drv');"><spring:message code='global.btn.search' /></a>      <!-- 검색 -->
                                    </div>
                                </div>
                                <div class="form_left" style="width:39%;">
                                    <input id="drvCustNm_01" readonly class="form_input form_readonly">
                                </div>
                                <div class="form_right" style="width:18%;">
                                    <input value="<spring:message code='global.lbl.personal' />" readonly class="form_input form_readonly ac">           <!-- 개인 -->
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='par.lbl.telNo' /></th>        <!-- 전화번호 -->
                        <td>
                            <input id="drvTelNo1_01" readonly class="form_input">
                            <input type="hidden" id="drvTelNo2_01">    <!-- 전화번호2 화면에 없음 -->
                        </td>
                        <th scope="row"><spring:message code='global.lbl.emailNm' /></th>           <!-- 이메일 -->
                        <td>
                            <input id="drvEmailNm_01" readonly class="form_input">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.addr' /></th>      <!-- 고객주소 -->
                        <td colspan="3">
                            <div class="form_float">
                                <div class="form_left" style="width:11%;">
                                    <input id="drvZipCd_01" readonly class="form_input">
                                </div>
                                <div class="form_left" style="width:55%;">
                                    <input id="drvAddr1_01" readonly class="form_input">
                                </div>
                                <div class="form_right" style="width:34%;">
                                    <input id="drvAddr2_01" readonly class="form_input">
                                </div>
                            </div>
                        </td>
                        <th scope="row"></th>
                        <td></td>
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
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.customer' /></th>          <!-- 고객 -->
                        <td>
                            <div class="form_float">
                                <div class="form_left" style="width:43%;">
                                    <div class="form_search">
                                        <input id="drvCustCd_02" readonly class="form_input">
                                        <a href="javascript:bf_searchCustomer('drv');"><spring:message code='global.btn.search' /></a>      <!-- 검색 -->
                                    </div>
                                </div>
                                <div class="form_left" style="width:39%;">
                                    <input id="drvCustNm_02" readonly class="form_input form_readonly">
                                </div>
                                <div class="form_right" style="width:18%;">
                                    <input value="<spring:message code='global.lbl.corporation' />" readonly class="form_input form_readonly ac">            <!-- 법인 -->
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='par.lbl.telNo' /></th>                    <!-- 회사전화번호 -->
                        <td>
                            <input id="drvTelNo1_02" readonly class="form_input">
                            <input type="hidden" id="drvTelNo2_02">    <!-- 전화번호2 화면에 없음 -->
                        </td>
                        <th scope="row"><spring:message code='global.lbl.crnNo' /></th>             <!-- 사업자등록번호 -->
                        <td>
                            <input id="drvCrnNo_02" readonly class="form_input">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.addr' /></th>                          <!-- 법인주소 -->
                        <td colspan="3">
                            <div class="form_float">
                                <div class="form_left" style="width:11%;">
                                    <input id="drvZipCd_02" readonly class="form_input">
                                </div>
                                <div class="form_left" style="width:55%;">
                                    <input id="drvAddr1_02" readonly class="form_input">
                                </div>
                                <div class="form_right" style="width:34%;">
                                    <input id="drvAddr2_02" readonly class="form_input">
                                </div>
                            </div>
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- //법인 -->
    </section>
    <!-- //실운전자정보 -->

    <!-- 차량 및 탁송정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.title.carConsInfo' /></h2>                <!-- 차량 및 탁송정보 -->
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.carLine' /></th>                               <!-- 차종 -->
                        <td>
                            <input id="carlineCd" name="carlineCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.model' /></th>                             <!-- 모델 -->
                        <td>
                            <input id="modelCd" name="modelCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.ocn' /></th>                               <!-- OCN -->
                        <td>
                            <input id="ocnCd" name="ocnCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.extColor' /></th>                              <!-- 외장색 -->
                        <td>
                            <input id="extColorCd" name="extColorCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.intColor' /></th>                              <!-- 내장색 -->
                        <td>
                            <input id="intColorCd" name="intColorCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.contractType' /></th>              <!-- 계약유형 -->
                        <td>
                            <input id="contractTp" name="contractTp" class="form_comboBox" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.consTp' /></th>        <!-- 탁송구분 -->
                        <td>
                            <input id="consTp" name="consTp" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.taxTp' /></th>     <!-- 과세구분 -->
                        <td>
                            <input id="taxTp" name="taxTp" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.dlReqDt' /></th>       <!-- 인도요청일 -->
                        <td>
                            <input id="dlReqDt" name="dlReqDt" class="form_datepicker" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr id="tabConsTp">
                        <th scope="row"><spring:message code='global.lbl.consAmt' /></th>       <!-- 탁송료 -->
                        <td>
                            <input id="tConsAmt" onblur="bf_addConsAmt();" onfocus="fnOnfocus(this.id);" class="form_numeric ar">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.consAddr' /></th>      <!-- 탁송지 -->
                        <td colspan="3">
                            <div class="form_float">
                                <div class="form_left" style="width:11%;">
                                    <div class="form_search">
                                        <input id="consZipCd" name="consZipCd" class="form_input" readonly maxlength="6" data-json-obj="true">
                                        <a href="javascript:bf_zipCodeSearch();"><spring:message code='global.btn.search' /></a>       <!-- 조회 -->
                                    </div>
                                </div>
                                <div class="form_left" style="width:55%;">
                                    <input id="consAddr1" name="consAddr1" class="form_input" readonly maxlength="80" data-json-obj="true">
                                </div>
                                <div class="form_right" style="width:34%;">
                                    <input id="consAddr2" name="consAddr2" class="form_input" maxlength="80" data-json-obj="true">
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //차량 및 탁송정보 -->

    <!-- 용품(Local Option)정보 -->
    <section class="group" style="display:none">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.title.localGoodsInfo' /></h2>     <!-- 용품(Local Option)정보 -->
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col>
                    <col style="width:10%;">
                    <col style="width:24%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.goodsNm' /></th>       <!-- 용품명 -->
                        <td>
                            <input id="goodsNm" name="goodsNm" class="form_input" style="width:100%" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.goodsAmt' /></th>     <!-- 용품금액 -->
                        <td>
                            <input id="goodsAmt" name="goodsAmt" onblur="bf_addGoodsAmt();" class="form_numeric ar" style="width:70%" data-json-obj="true" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="header_area">
            <div class="btn_right">
                <button type="button" id="btnOptionPopupAdd" class="btn_s btn_add"><spring:message code='global.btn.add' /></button>        <!-- 팝업 추가 -->
                <button type="button" id="btnOptionAdd" class="btn_s btn_add"><spring:message code='global.btn.add' /></button>             <!-- 추가 -->
                <button type="button" id="btnOptionDelete" class="btn_s btn_delete"><spring:message code='global.btn.del' /></button>       <!-- 삭제 -->
            </div>
        </div>

        <!-- 로컬옵션 그리드 시작 -->
        <div class="table_grid">
            <div id="localOptionGrid"></div>
        </div>
        <!-- 로컬옵션 그리드 종료 -->
    </section>
    <!-- //용품(Locatl Option)정보 -->



    <!-- 용품(Local Option)정보 (수정버전 Ver.2)  -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.title.localGoodsInfo' /></h2> <!-- 용품(Local Option)정보 -->
            <div class="btn_right">
                <button type="button" id="btnOptionSearch" class="btn_s"><spring:message code='global.btn.optionSearch' /></button> <!-- 용품계약조회 -->
            </div>
        </div>
        <div class="table_form form_width_70per">
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
                        <th scope="row"><spring:message code='global.lbl.goodsContractNo' /></th> <!-- 용품계약번호 -->
                        <td>
                            <input type="text" id="goodsContractNo" name="goodsContractNo" readonly class="form_input form_readonly" data-json-obj="true" />
                        </td>
                        <th scope="row" class="txt_total"><spring:message code='sal.lbl.goodsAmt' /></th>   <!-- 용품금액 -->
                        <td>
                            <input type="text" value="0" readonly class="form_input ar form_readonly">
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- <div class="table_grid mt10"> --><div class="table_list mt10">
            <table class="grid">
                <caption></caption>
                <colgroup>
                    <col style="width:45px">
                    <col style="width:150px">
                    <col style="width:200px">
                    <col>
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" data-field="data1">No</th>
                        <th scope="col" data-field="data2"><spring:message code='global.lbl.localOption' /></th>  <!-- 용품 -->
                        <th scope="col" data-field="data3"><spring:message code='global.lbl.goodsNm' /></th>      <!-- 용품명  -->
                        <th scope="col" data-field="data4"><spring:message code='sal.lbl.goodsAmt' /></th>        <!-- 용품금액 -->
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="ac">1</td>
                        <td class="ac">L20160001</td>
                        <td class="al">导航</td>
                        <td class="ar">0</td>
                    </tr>
                    <tr>
                        <td class="ac">2</td>
                        <td class="ac">L20160002</td>
                        <td class="al">坐垫</td>
                        <td class="ar">0</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //용품(Locatl Option)정보 (수정버전 Ver.2)  -->


    <!-- 프로모션 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.title.promotion' /></h2>      <!-- 프로모션 -->
        </div>
        <div class="table_grid">
            <div id="promotionGrid"></div>
        </div>
    </section>
    <!-- //프로모션 -->

    <!-- 차량대금지불방법 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.title.carAmtPayInfo' /></h2>      <!-- 차량대금지불방법 -->
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:12%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.contractPdpstNm' /></th>       <!-- 계약금입금자명 -->
                        <td>
                            <input id="contractPdpstNm" name="contractPdpstNm" class="form_input" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.contractAmt' /></th>       <!-- 계약금액 -->
                        <td>
                            <input id="contractAmt" name="contractAmt" class="form_numeric ar" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.contractAmtPayTp' /></th>      <!-- 계약금지불유형 -->
                        <td>
                            <input id="contractAmtPayTp" name="contractAmtPayTp" class="form_comboBox" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.contractRcptNo' /></th>        <!-- 계약금영수증번호 -->
                        <td>
                            <input id="contractRcptNo" name="contractRcptNo" class="form_input" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.dlAmt' /></th>     <!-- 인도금 -->
                        <td>
                            <input id="dlAmt" name="dlAmt" readonly class="form_numeric ar" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.dlAmtPayTp' /></th>        <!-- 인도금지불유형 -->
                        <td>
                            <input id="dlAmtPayTp" name="dlAmtPayTp" class="form_comboBox" data-json-obj="true" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //차량대금지불방법 -->

    <!-- 입출금내역 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.title.payDetail' /></h2>      <!-- 입출금내역 -->
        </div>
        <!-- <div class="table_grid"> --><div class="table_list">
            <!-- <div id="payGrid" /> -->

            <table class="grid">
                <caption></caption>
                <colgroup>
                    <col style="width:45px">
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" data-field="data1">No</th>
                        <th scope="col" data-field="data2">入款日期</th>
                        <th scope="col" data-field="data3">入款类型</th>
                        <th scope="col" data-field="data4">入款金额</th>
                        <th scope="col" data-field="data5">结算状态</th>
                        <th scope="col" data-field="data6">出款日期</th>
                        <th scope="col" data-field="data7">出款类型</th>
                        <th scope="col" data-field="data8">出款金额</th>
                        <th scope="col" data-field="data9">结算状态</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <td class="ac">合计</td>
                        <td class="ac"></td>
                        <td class="ac"></td>
                        <td class="td_total ar">3,000,000</td>
                        <td class="ac"></td>
                        <td class="ac"></td>
                        <td class="ac"></td>
                        <td class="ar"></td>
                        <td class="ac"></td>
                    </tr>
                </tfoot>
                <tbody>
                    <tr>
                        <td class="ac">1</td>
                        <td class="ac">2015-12-03</td>
                        <td class="ac">定金</td>
                        <td class="ar">2,200,000</td>
                        <td class="ac">完成</td>
                        <td class="ac"></td>
                        <td class="ac"></td>
                        <td class="ar"></td>
                        <td class="ac"></td>
                    </tr>
                    <tr>
                        <td class="ac">2</td>
                        <td class="ac">2015-12-03</td>
                        <td class="ac">定金</td>
                        <td class="ar">800,000</td>
                        <td class="ac">完成</td>
                        <td class="ac"></td>
                        <td class="ac"></td>
                        <td class="ar"></td>
                        <td class="ac"></td>
                    </tr>
                </tbody>
            </table>

        </div>
    </section>
    <!-- //입출금내역 -->

    <!-- 중고차보상판매 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.title.useCarIndSale' /></h2>      <!-- 중고차보상판매 -->
            <div class="fl">
                <label><input type="checkbox" id="uatcCarPurc" class="form_check" onclick="bf_uatcCarPurc()"> <spring:message code='sal.title.useCarBuy' /></label>     <!-- 중고차 매입시 -->
            </div>
            <div class="btn_right">
                <button type="button" id="btnTradeIn" class="btn_s" style="display:none"><spring:message code='sal.btn.tradeIn' /></button>
            </div>
        </div>
        <div id="usedCar" class="table_form" style="display:none">
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
                        <th scope="row"><spring:message code='global.lbl.ourCompany' />/<spring:message code='global.lbl.otherCompany' /></th>      <!-- 자사/타사 -->
                        <td>
                            <input id="corpCarDstinCd" name="corpCarDstinCd" class="form_comboBox" data-json-obj="true" />
                        </td>

                        <th class="group-others" scope="row" style="display:none"><spring:message code='global.lbl.brand' /></th>       <!-- 브랜드 -->
                        <td class="group-others" style="display:none">
                            <input id="brandCd" name="brandCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th class="group-others" scope="row" style="display:none"><spring:message code='global.lbl.model' /></th>       <!-- 모델 -->
                        <td class="bor_none group-others" style="display:none">
                            <input id="useOthersModelNm" name="useOthersModelNm" class="form_input" data-json-obj="true" />
                        </td>
                        <th scope="row" class="bor_none group-others" style="display:none"></th>
                        <td class="group-others" style="display:none"></td>

                        <th class="group-ours" scope="row"><spring:message code='global.lbl.carLine' /></th>        <!-- 차종 -->
                        <td class="group-ours">
                            <input id="useCarlineCd" name="useCarlineCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th class="group-ours" scope="row"><spring:message code='global.lbl.model' /></th>      <!-- 모델 -->
                        <td class="group-ours">
                            <input id="useModelCd" name="useModelCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th class="group-ours" scope="row"><spring:message code='global.lbl.ocn' /></th>        <!-- OCN -->
                        <td class="group-ours">
                            <input id="useOcnCd" name="useOcnCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr class="group-ours">
                        <th class="group-ours" scope="row"><spring:message code='global.lbl.extColor' /></th>       <!-- 외장색 -->
                        <td class="group-ours">
                            <input id="useExtColorCd" name="useExtColorCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th class="group-ours" scope="row"><spring:message code='global.lbl.intColor' /></th>       <!-- 내장색 -->
                        <td class="bor_none group-ours">
                            <input id="useIntColorCd" name="useIntColorCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row" class="bor_none group-ours"></th>
                        <td class="bor_none group-ours"></td>
                        <th scope="row" class="bor_none group-ours"></th>
                        <td class="bor_none group-ours"></td>
                    </tr>

                    <tr>
                        <th scope="row"><spring:message code='global.lbl.carNo' /></th>     <!-- 차량번호 -->
                        <td>
                            <input id="carNo" name="carNo" class="form_input" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code='par.lbl.vinNo' /></th>        <!-- 차대번호 -->
                        <td>
                            <input id="vinNo" name="vinNo" class="form_input" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.nowRunDist' /></th>      <!-- 사전점검주행거리 -->
                        <td>
                            <input id="carRunDistVal" name="carRunDistVal" class="form_numeric" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.carDispQty' /></th>        <!-- 배기량 -->
                        <td>
                            <input id="carDispQty" name="carDispQty" class="form_numeric" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.carDrvMth' /></th>     <!-- 구동방식 -->
                        <td>
                            <input id="carDrvMthCd" name="carDrvMthCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.fuel' /></th>      <!-- 연료 -->
                        <td>
                            <input id="fuelCd" name="fuelCd" name="fuelCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.pcDstin' />/<spring:message code='global.lbl.coDstin' /></th>      <!-- 승용/상용 -->
                        <td>
                            <input id="pcDstinCd" name="pcDstinCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.carLmtVal' /></th>     <!-- 정원 -->
                        <td>
                            <input id="carLmtVal" name="carLmtVal" class="form_numeric" data-json-obj="true" >
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.carYy' /></th>     <!-- 연식 -->
                        <td>
                            <input id="carYyCd" name="carYyCd" class="form_datepicker" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.carRegDt' /></th>      <!-- 등록일자 -->
                        <td>
                            <input id="carRegDt" name="carRegDt" class="form_datepicker" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.evalScheDt' /></th>        <!-- 평가일자 -->
                        <td>
                            <input id="evalScheDt" name="evalScheDt" class="form_datepicker" data-json-obj="true" />
                        </td>
                        <th scope="row" class="bor_none"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //중고차보상판매 -->

    <!-- 차량등록정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.title.carRegInfo' /></h2>     <!-- 차량등록정보 -->
        </div>
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
                        <th scope="row"><spring:message code='global.lbl.carReg' /></th>        <!-- 차량등록 -->
                        <td>
                            <ul class="tabmenu">
                                <li id="tabRegTp01"><button type="button"><spring:message code='global.lbl.execution' /></button></li>      <!-- 대행 -->
                                <li id="tabRegTp02" class="on"><button type="button"><spring:message code='global.lbl.himSelf' /></button></li>     <!-- 본인 -->
                            </ul>
                            <input type="hidden" id="regTp" name="regTp" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.regDist' /></th>       <!-- 등록지역 -->
                        <td>
                            <input id="regDistCd" name="regDistCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.regName' /></th>       <!-- 명의자 -->
                        <td>
                            <input id="regNameNm" name="regNameNm" class="form_input" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.regSbodtAmt' /></th>       <!-- 부대비용 -->
                        <td>
                            <input id="tRegSbodtAmt" class="form_numeric ar" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //차량등록정보 -->

    <!-- 보험정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.title.incInfo' /></h2>        <!-- 보험정보 -->
        </div>
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
                        <th scope="row"><spring:message code='global.lbl.incReg' /></th>        <!-- 보험등록 -->
                        <td>
                            <ul class="tabmenu">
                                <li id="incAapCd01"><span><spring:message code='global.lbl.execution' /></span></li>        <!-- 대행 -->
                                <li id="incAapCd02" class="on"><span><spring:message code='global.lbl.himSelf' /></span></li>       <!-- 본인 -->
                            </ul>
                            <input type="hidden" id="incAapCd" name="incAapCd" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.incCmp' /></th>        <!-- 보험회사 -->
                        <td>
                            <input id="incCmpCd" name="incCmpCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.incJoinDt' /></th>     <!-- 보험가입일 -->
                        <td>
                            <input id="incJoinDt" name="incJoinDt" class="form_datepicker" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.incAmt' /></th>        <!-- 보험금액 -->
                        <td>
                            <input id="incAmt" name="incAmt" class="form_numeric ar" data-json-obj="true" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //보험정보 -->

    <!-- 금융정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.title.fincInfo' /></h2>       <!-- 금융정보 -->
            <div class="fl">
                <label><input type="checkbox" id="fincReq" class="form_check" onclick="bf_fincReq()"> <spring:message code='global.lbl.fincApp' /></label>       <!-- 금융신청 -->
            </div>
        </div>
        <div id="divFincReq" class="table_form" style="display:none">
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
                        <th scope="row"><spring:message code='global.lbl.fincCmp' /></th>       <!-- 금융사 -->
                        <td>
                            <input id="fincCmpCd" name="fincCmpCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.fincItem' /></th>      <!-- 금융상품 -->
                        <td>
                            <input id="fincItemCd" name="fincItemCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.fincReqAmt' /></th>        <!-- 신청금액 -->
                        <td>
                            <input id="fincReqAmt" name="fincReqAmt" class="form_numeric ar" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.fincReqDt' /></th>     <!-- 신청일자 -->
                        <td>
                            <input id="fincReqDt" name="fincReqDt" class="form_datepicker" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.fincEndDt' /></th>     <!-- 만기일자 -->
                        <td class="bor_none">
                            <input id="fincEndDt" name="fincEndDt" class="form_datepicker" data-json-obj="true" />
                        </td>
                        <th scope="row" class="bor_none"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //금융정보 -->

    <!-- 파일업로드 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='global.title.fileUpload' /></h2>      <!-- 파일업로드 -->
            <div class="btn_right">
                <span class="btn_file" id="fileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
                <button class="btn_s" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
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
                            <textarea id="remark" name="remark" rows="4" cols="30" placeholder="1,000字以?" class="form_textarea" data-json-obj="true" ></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //비고 -->


<!-- hidden값  -->
<span style="display:none">
    <!-- 계약자 고객유형:SAL028 -->
    <input id="custTp" name="custTp" type="hidden" data-json-obj="true" />

    <!--
        계약상태:SAL002
        10      계약등록
        20      계약승인요청
        21      계약승인
        30      배정
        40      출고요청
        41      출고확정
        50      고객인도
        91      계약해약  - 출고이후 , goodwill 품의
        92      계약삭제  - 삭제버튼 (승인전)
        93      계약취소  - 계약승인 이후
    -->
    <input id="contractStatCd" name="contractStatCd" type="hidden" data-json-obj="true" />

    <!-- 실운전자 고객유형 -->
    <input  id="drvCustTp" name="drvCustTp" type="hidden" data-json-obj="true" />

    <!-- 견적번호 -->
    <input id="estimateNo" name="estimateNo" type="hidden" data-json-obj="true" />

    <!-- 로컬옵션 가격 -->
    <input id="optionAmt" name="optionAmt" type="hidden" data-json-obj="true" />

    <!-- 파일업로드 -->
    <input type="hidden" id="fileDocId" name="fileDocId" data-json-obj="true" />

    <!-- 저장 후 선택될 계약번호 -->
    <input id="savedContractNo" value="" />

</span>
</form>

<!-- </section> -->
<!-- //계약품의관리 화면 -->


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
//var vDtyyyyMMdd = vDateTimeFormat.substring(0,10);
var vDtyyyyMMdd = "${_dateFormat}";
// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);

// 딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var userId = "${userId}";
var userNm = "${userNm}";

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var vCustNo = "";


// 차량 및 탁송정보 - 모델 선택 변수. (프로모션 조회)
var onSelectModel = "";

// 딜러 리스트 (HR정보)
var selectDlrDSList = [];
<c:forEach var="obj" items="${dlrDSInfo}">
    selectDlrDSList.push({dlrNm:"${obj.dlrNm}", dlrCd:"${obj.dlrCd}"});
</c:forEach>


// 판매사원 리스트
var selectSaleEmpDSList = [];
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"${obj.saleEmpNm}", saleEmpCd:"${obj.saleEmpCd}"});
</c:forEach>

//차종조회
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//계약유형 SAL003
var contractTpList = [];
<c:forEach var="obj" items="${contractTpDS}">
    contractTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//계약상태
var contractStatCdList = [];
<c:forEach var="obj" items="${contractStatCdDS}">
    contractStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var contractStatCdArray = [];
$.each(contractStatCdList, function(idx, obj){
    contractStatCdArray[obj.cmmCd] = obj.cmmCdNm;
});

//탁송구분:SAL125
var consTpList = [];
<c:forEach var="obj" items="${consTpDS}">
    consTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//과세구분:SAL124
var taxTpList = [];
<c:forEach var="obj" items="${taxTpDS}">
    taxTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//인도금지불유형:SAL071 , 계약금지불유형:SAL071
var amtPayTpList = [];
<c:forEach var="obj" items="${amtPayTpDS}">
    amtPayTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 자사/타사 구분:SAL118
var corpCarDstinTpList = [];
<c:forEach var="obj" items="${corpCarDstinTpDS}">
    corpCarDstinTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//중고차-타사-브랜드 :COM019
var brandCdList = [];
<c:forEach var="obj" items="${brandCdDS}">
    brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//구동방식:SAL121
var carDrvMthCdList = [];
<c:forEach var="obj" items="${carDrvMthCdDS}">
    carDrvMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 연료:SAL114
var fuelCdList = [];
<c:forEach var="obj" items="${fuelCdDS}">
    fuelCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 승용/상용:SAL120
var pcDstinCdList = [];
<c:forEach var="obj" items="${pcDstinCdDS}">
    pcDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//보험등록유형:SAL126  , 차량등록유형:SAL126
var regTpList = [];
<c:forEach var="obj" items="${regTpDS}">
    regTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//차량 등록지역:SAL086
var regDistCdList = [];
<c:forEach var="obj" items="${regDistCdDS}">
    regDistCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 보험회사:SAL127
var incCmpCdList = [];
<c:forEach var="obj" items="${incCmpCdDS}">
    incCmpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 금융사:SAL055
var fincCmpCdList = [];
<c:forEach var="obj" items="${fincCmpCdDS}">
    fincCmpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 금융상품:마스터 테이블 생성 예정  [TODO]
var fincItemList = [];
<c:forEach var="obj" items="${fincItemDS}">
  fincItemList.push({cmmCdNm:"${obj.fincItemNm}", cmmCd:"${obj.fincItemCd}"});
</c:forEach>

//프로모션 유형:SAL010
var promotionTpObj = {};
<c:forEach var="obj" items="${promotionTpDS}">
    promotionTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//프로모션 적용방법 :SAL132
var applyTpObj = {};
<c:forEach var="obj" items="${applyTpDS}">
    applyTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//로컬옵션 상품목록 DataSource
var selectOptionGridDSList = [];
var selectOptionGridArray  = [];

var popupWindow;

/******************************************
 * button - area
 ******************************************/
   $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){

            if( ($("#sStartContractDt").data("kendoExtMaskedDatePicker").value() != null && $("#sEndContractDt").data("kendoExtMaskedDatePicker").value() == null)
              ||($("#sEndContractDt").data("kendoExtMaskedDatePicker").value() != null && $("#sStartContractDt").data("kendoExtMaskedDatePicker").value() == null)){
              //적용일을 모두 입력해 주세요
                dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                return false;
            }

            $('#contGrid').data('kendoExtGrid').dataSource.read();
            refreshAll();
            fn_btnState();  // 버튼상태
        }
    });

    $("#btnSave").kendoButton({ // 저장
        enable:true,
        click:function(e){
            save();
        }
    });

    $("#btnRefresh").kendoButton({ // 초기화
        click:function(e){

            popupWindow = dms.window.popup({
                windowId:"messagePopup"
                ,title:false
                ,width :300
                ,height:110
                ,content:{
                    url:"<c:url value='/sal/cnt/contract/contractMessagePopup.do' />"
                    ,data:{
                        "type":null
                        ,"autoBind":false
                        , msg:"<spring:message code='global.info.refresh' /> <br/> <spring:message code='global.lbl.progress' var='globalLblProgress' /><spring:message code='global.info.andMsg' arguments='${globalLblProgress}' />"
                        , btnMsg01:"<spring:message code='global.btn.init' />"
                        , btnMsg02:"<spring:message code='global.btn.cancel' />"
                        ,"callbackFunc":function(data){
                            if (data.msg == "01"){
                                refreshAll();
                                fn_btnState();  // 버튼상태
                             }else{
                                 return false;
                             }
                         }
                    }
                }
            });

        }
    });

    $("#btnRemove").kendoButton({  // 삭제
        click:function(e){

            popupWindow = dms.window.popup({
                windowId:"messagePopup"
                ,title:false
                ,width :330
                ,height:90
                ,content:{
                    url:"<c:url value='/sal/cnt/contract/contractMessagePopup.do' />"
                    ,data:{
                        "type":null
                        ,"autoBind":false
                                 // xxxx(계약번호)를(을) 삭제 하시겠습니까?
                        , msg:"("+$("#contractNo").val() +")"+ "<spring:message code='global.lbl.contract' var='globalLblContract' /><spring:message code='global.btn.del' var='globalBtnDel' /><spring:message code='global.info.cnfrmsMsg' arguments='${globalLblContract}, ${globalBtnDel}' />"
                        , btnMsg01:"<spring:message code='global.lbl.del' />"
                        , btnMsg02:"<spring:message code='global.btn.cancel' />"
                        ,"callbackFunc":function(data){
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

    $("#btnConRequestAppr").kendoButton({//계약승인요청
        click:function(e){

            popupWindow = dms.window.popup({
                windowId:"messagePopup"
                ,title:false
                ,width :330
                ,height:90
                ,content:{
                    url:"<c:url value='/sal/cnt/contract/contractMessagePopup.do' />"
                    ,data:{
                        "type":null
                        ,"autoBind":false
                                 // xxxx(계약)를(을) 승인요청 하시겠습니까?
                        , msg:"("+$("#contractNo").val()+")"+"<spring:message code='global.lbl.contract' var='globalLblContract' /><spring:message code='global.btn.applyReq' var='globalBtnApplyReq' /><spring:message code='global.info.cnfrmsMsg' arguments='${globalLblContract}, ${globalBtnApplyReq}' />"
                        , btnMsg01:"<spring:message code='global.btn.applyReq' />"
                        , btnMsg02:"<spring:message code='global.btn.cancel' />"
                        ,"callbackFunc":function(data){
                            if (data.msg == "01"){
                                conRequestAppr();
                             }else{
                                 return false;
                             }
                         }
                    }
                }
            });

        }
    });

    $("#btnApproval").kendoButton({//승인확정(결재)
        click:function(e){

            popupWindow = dms.window.popup({
                windowId:"messagePopup"
                ,title:false
                ,width :330
                ,height:90
                ,content:{
                    url:"<c:url value='/sal/cnt/contract/contractMessagePopup.do' />"
                    ,data:{
                        "type":null
                        ,"autoBind":false
                                 // xxxx(계약)를(을) 승인 하시겠습니까?
                        , msg:"("+$("#contractNo").val() +")"+"<spring:message code='global.lbl.contract' var='globalLblContract' /><spring:message code='global.btn.approval' var='globalBtnApproval' /><spring:message code='global.info.cnfrmsMsg' arguments='${globalLblContract}, ${globalBtnApproval}' />"
                        , btnMsg01:"<spring:message code='global.btn.approval' />"
                        , btnMsg02:"<spring:message code='global.btn.appRollback' />"
                        , btnMsg03:"<spring:message code='global.btn.cancel' />"

                        ,"callbackFunc":function(data){
                            if (   data.msg == "01"     // 승인
                                || data.msg == "02"){   // 반려
                                approval(data.msg);
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
        click:function(e){
            // 계약서출력 개발진행 예정중입니다.
            alert("<spring:message code='sal.btn.contPrint' /> <spring:message code='global.info.developIng' />");
        }
    });

    $("#btnPayPrint").kendoButton({//계약서출력
        click:function(e){
            // 결산서출력 개발진행 예정중입니다.
            alert("<spring:message code='sal.btn.payPrint' /> <spring:message code='global.info.developIng' />");
        }
    });

 //로컬옵션 버튼 - 추가(1)
 $("#btnOptionAdd").kendoButton({
     click:function(e){

         if(selectOptionGridDSList == null || selectOptionGridDSList.length <= 0){
             // 해당 모델의 옵션은 사용할 수 없습니다.
             dms.notification.info("<spring:message code='global.lbl.model' var='globalLblModel' /><spring:message code='global.lbl.option' var='globalLblOption' /><spring:message code='global.info.isCheckedItem' arguments='${globalLblModel}, ${globalLblOption}' />");
             return false;
         }

         $('#localOptionGrid').data('kendoExtGrid').dataSource.insert(0, {
              dlrCd    :$("#sDlrCd").data("kendoExtDropDownList").value() == "" ? dlrCd:$("#sDlrCd").data("kendoExtDropDownList").value()
             ,contractNo:$("#contractNo").val()
             ,seq     :""
             ,optionCd:""
             ,optionNm:""
             ,optionAmt :"0"
          });

     }
 });


 // 로컬옵션 버튼 - 추가(2):팝업형
 $("#btnOptionPopupAdd").kendoButton({
     click:function(e){
         if(selectOptionGridDSList == null || selectOptionGridDSList.length <= 0){
             // 해당 모델의 옵션은 사용할 수 없습니다.
             dms.notification.info("<spring:message code='global.lbl.model' var='globalLblModel' /><spring:message code='global.lbl.option' var='globalLblOption' /><spring:message code='global.info.isCheckedItem' arguments='${globalLblModel}, ${globalLblOption}' />");
             return false;
         }

         // 팝업 호출
         popupWindow = dms.window.popup({
             windowId:"localOptionSearchPopup"
             , title:"<spring:message code='sal.title.localOption' />"   // 로컬옵션
             , content:{
                 //url:"<c:url value='/sal/cnt/contract/selectLocalOptionPricePopupMain.do'/>"
                 url:"<c:url value='/sal/veh/localOptionPrice/selectLocalOptionPricePopupMain.do'/>"
                 , data:{
                      "type"  :null
                     ,"autoBind":false

                     , "dlrCd":$("#sDlrCd").data("kendoExtDropDownList").value() == "" ? dlrCd:$("#sDlrCd").data("kendoExtDropDownList").value()
                     , "modelCd"  :$("#modelCd").data("kendoExtDropDownList").value()

                     , "callbackFunc":function(data){
                         if(data.length >= 1) {

                             $('#localOptionGrid').data('kendoExtGrid').dataSource.insert(0, {
                                  dlrCd    :$("#sDlrCd").data("kendoExtDropDownList").value() == "" ? dlrCd:$("#sDlrCd").data("kendoExtDropDownList").value()
                                 ,contractNo:$("#contractNo").val()
                                 ,seq      :""
                                 ,optionCd :data[0].optionCd
                                 ,optionNm :data[0].optionNm
                                 ,optionAmt:data[0].salePrc
                              });

                             bf_addLocaloptionAmt();
                             bf_sumCarAmt();                    // 계산
                         }
                     }
                 }
             }
         });
         // 팝업 호출 끝
     }
 });

 //로컬옵션 버튼 - 삭제
 $("#btnOptionDelete").kendoButton({
     click:function(e){

         var grid = $("#localOptionGrid").data("kendoExtGrid");
         var rows = grid.select();
         /*var selectItem = grid.dataItem(rows);*/

         if (rows.length < 1) {
            //목록을 선택하여 주십시오.
            dms.notification.info("<spring:message code='global.info.required.select'/>");
            return;
         }

         var removeOptionAmt = 0;
         rows.each(function(index, row) {
             var item = grid.dataItem(row);
             removeOptionAmt += Number(item.optionAmt);
             //grid.removeRow(row);         // row가 지워져서 따로 구현해야 함.
         });

         $("#optionAmt").val( Number($("#optionAmt").val()) -  Number(removeOptionAmt) );
         bf_sumCarAmt();                    // 계산

         // ROW 삭제
         rows.each(function(index, row) {
             grid.removeRow(row);
         });
     }
 });

 // 용품(Local Option)정보 (수정버전 Ver.2) 용품계약조회
 $("#btnOptionSearch").kendoButton({
     click:function(e){
         // 부품모듈과 연계 개발진행중입니다.
         alert("<spring:message code='global.info.parDeveloping' />");
     }
 });

 // 중고차 Trade In 이동
 $("#btnTradeIn").kendoButton({
     click:function(e){
         // 개발진행 예정중입니다.
         alert("<spring:message code='global.info.developIng' />");
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
         deleteList.push({"fileDocNo":dataItem.fileDocNo, "fileNo":dataItem.fileNo});
     });

     $.ajax({
         url:"<c:url value='/cmm/sci/fileUpload/deleteFiles.do' />"
         ,data:JSON.stringify(deleteList)
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
 });

/******************************************
 * variable - area
 ******************************************/
function addCustomer(obj){  // 추가고객정보
    if(obj.checked){
        $("#addCustomerInfo").attr("style", "display:display");
    }else{
        $("#addCustomerInfo").attr("style", "display:none");
    }
}

/******************************************
 * 함수영역 - start
 ******************************************/

// 초기화
refreshAll = function() {
    //$("#contForm").get(0).reset();

    /* 기본정보 */
    $("#contractNo").val("");      // 계약번호
    $("#contractDt").data("kendoExtMaskedDatePicker").value(toDay);      // 계약일자
    $("#contractDt").data("kendoExtMaskedDatePicker").enable(true);

    $("#custTp").val("01");       // 계약자 고객유형
    $("#drvCustTp").val("01");    // 실운전자 고객유형
    $("#estimateNo").val("");     // 견적번호
    $("#contractStatCd").val(""); // 계약상태

    $("#saleOpptNo").val("");      //판매기회번호
    $("#lv2DlrOrdCd").val("");      //2급딜러조직코드
    $("#lv2DlrOrdNm").val("");      //2급딜러조직
    $("#lv2DlrYn").data("kendoExtDropDownList").value("N");    //2급딜러여부
    $("#goodsContractNo").val("");  //용품계약번호

    selectOptionGridDSList = [];
    selectOptionGridArray  = [];
    $("#localOptionGrid").data('kendoExtGrid').dataSource.data([]); // 로컬옵션
    $("#promotionGrid").data('kendoExtGrid').dataSource.data([]);   // 프로모션

    $("#carAmt").data("kendoExtNumericTextBox").value(0);       // 차량가격
    $("#dcAmt").data("kendoExtNumericTextBox").value(0);        // 할인가격
    $("#goodsTotAmt").data("kendoExtNumericTextBox").value(0);  // 용품가격
    $("#consAmt").data("kendoExtNumericTextBox").value(0);      // 탁송료
    $("#regSbodtAmt").data("kendoExtNumericTextBox").value(0);  // 부대비용
    $("#vattaxAmt").data("kendoExtNumericTextBox").value(0);    // 증치세
    $("#otherTaxAmt").data("kendoExtNumericTextBox").value(0);  // 기타세금
    $("#otherAmt").data("kendoExtNumericTextBox").value(0);     // 기타금액

    // 계약고객
    $("#custTp").val("01");       // 계약자 고객유형
    $("#cust_02").hide();
    $("#cust_01").show();
    $("#crnNo_02").val("");       // 사업자 번호
    $("#emailNm_01").val("");     // 이메일
    $("#custCd_01").val("");      // 고객코드
    $("#custCd_02").val("");      // 고객코드
    $("#custNm_01").val("");      // 고객명
    $("#custNm_02").val("");      // 고객명
    $("#telNo1_01").val("");      // 전화번호1
    $("#telNo1_02").val("");      // 전화번호1
    $("#telNo2_01").val("");      // 전화번호2
    $("#telNo2_02").val("");      // 전화번호2
    $("#zipCd_01").val("");       // 우편번호
    $("#zipCd_02").val("");       // 우편번호
    $("#addr1_01").val("");       // 주소1
    $("#addr1_02").val("");       // 주소1
    $("#addr2_01").val("");       // 주소2
    $("#addr2_02").val("");       // 주소2

    $("#realDriverSame").prop('checked', false);
    $("#drvCustTp").val("01");       // 실운전자 고객유형
    $("#drvCust_02").hide();
    $("#drvCust_01").show();
    $("#drvCrnNo_02").val("");       // 사업자 번호
    $("#drvEmailNm_01").val("");     // 이메일

    $("#drvCustCd_01").val("");       // 고객코드
    $("#drvCustCd_02").val("");       // 고객코드
    $("#drvCustNm_01").val("");       // 고객명
    $("#drvCustNm_02").val("");       // 고객명
    $("#drvTelNo1_01").val("");       // 전화번호1
    $("#drvTelNo1_02").val("");       // 전화번호1
    $("#drvTelNo2_01").val("");       // 전화번호2
    $("#drvTelNo2_02").val("");       // 전화번호2
    $("#drvZipCd_01").val("");        // 우편번호
    $("#drvZipCd_02").val("");        // 우편번호
    $("#drvAddr1_01").val("");        // 주소1
    $("#drvAddr1_02").val("");        // 주소1
    $("#drvAddr2_01").val("");        // 주소2
    $("#drvAddr2_02").val("");        // 주소2

    /* 차량및 탁송정보 */
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

    $("#contractTp").data("kendoExtDropDownList").value(''); // 계약유형
    $("#taxTp").data("kendoExtDropDownList").value('');      // 과세구분
    $("#dlReqDt").data("kendoExtMaskedDatePicker").value('');      // 인도요청일
    $("#consTp").data("kendoExtDropDownList").value('');     // 탁송구분
    $("#tabConsTp").show();                               // 탁송지 선택
    $("#tConsAmt").data("kendoExtNumericTextBox").value(0); // 탁송료
    $("#consZipCd").val('');    // 탁송지
    $("#consAddr1").val('');
    $("#consAddr2").val('');

    /* 용품정보 세팅 */
    $("#goodsNm").val("");                                    // 용품명
    $("#goodsAmt").data("kendoExtNumericTextBox").value(0);     // 용품금액
    $("#optionAmt").val("0");                                  // 로컬옵션 금액

    /* 차량대금 지불방법 */
    $("#contractPdpstNm").val("");                                //계약입금자명
    $("#contractAmt").data("kendoExtNumericTextBox").value(0);      // 계약금액
    $("#contractAmtPayTp").data("kendoExtDropDownList").value("");   //계약금지불유형
    $("#contractRcptNo").val("");                                 //계약영수증번호
    $("#dlAmt").data("kendoExtNumericTextBox").value(0);            // 인도금액
    $("#dlAmtPayTp").data("kendoExtDropDownList").value("");         // 인도금지불유형

    /* 중고차 보상판매 */
    $("#uatcCarPurc").prop('checked', false);
    bf_uatcCarPurc();        // 중고차 보상판매.

    // 자사
    $(".group-others").hide();
    $(".group-ours").show();

    $("#useCarlineCd").data("kendoExtDropDownList").value('');

    $("#useModelCd").data("kendoExtDropDownList").setDataSource([]);
    $("#useModelCd").data("kendoExtDropDownList").value('');
    $("#useModelCd").data("kendoExtDropDownList").enable(false);

    $("#useOcnCd").data("kendoExtDropDownList").setDataSource([]);
    $("#useOcnCd").data("kendoExtDropDownList").value('');
    $("#useOcnCd").data("kendoExtDropDownList").enable(false);

    $("#useExtColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#useExtColorCd").data("kendoExtDropDownList").value('');
    $("#useExtColorCd").data("kendoExtDropDownList").enable(false);

    $("#useExtColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#useExtColorCd").data("kendoExtDropDownList").value('');
    $("#useExtColorCd").data("kendoExtDropDownList").enable(false);

    $("#brandCd").data("kendoExtDropDownList").value('');
    $("#useOthersModelNm").val('');

    $("#corpCarDstinCd").data("kendoExtDropDownList").value('');

    $("#carNo").val("");
    $("#vinNo").val("");
    $("#carRunDistVal").data("kendoExtNumericTextBox").value(0);
    $("#carDispQty").data("kendoExtNumericTextBox").value(0);
    $("#carDrvMthCd").data("kendoExtDropDownList").value('');
    $("#fuelCd").data("kendoExtDropDownList").value('');
    $("#pcDstinCd").data("kendoExtDropDownList").value('');
    $("#carLmtVal").data("kendoExtNumericTextBox").value(0);
    $("#carYyCd").data("kendoExtMaskedDatePicker").value('');
    $("#carRegDt").data("kendoExtMaskedDatePicker").value('');
    $("#evalScheDt").data("kendoExtMaskedDatePicker").value('');

    /** 차량등록정보 **/
    $("#regDistCd").data("kendoExtDropDownList").value('');            // 등록지역코드
    $("#regNameNm").val("");                                        // 등록명의자
    $("#tRegSbodtAmt").data("kendoExtNumericTextBox").value(0);     // 등록부대금액
    $("#tabRegTp02").click();

    $("#incCmpCd").data("kendoExtDropDownList").value('');  //보험회사코드
    $("#incJoinDt").data("kendoExtMaskedDatePicker").value('');   // 보험가입일자
    $("#incAmt").data("kendoExtNumericTextBox").value(0);  // 보험금액
    $("#incAapCd02").click();

    /** 금융정보 **/
    $("#fincReq").prop('checked', false);
    bf_fincReq();

    $("#fincCmpCd").data("kendoExtDropDownList").value('');     //금융회사코드
    $("#fincItemCd").data("kendoExtDropDownList").value('');   //금융상품코드
    $("#fincReqAmt").data("kendoExtNumericTextBox").value(0); // 금융요청금액
    $("#fincReqDt").data("kendoExtMaskedDatePicker").value('');       // 금융요청일자
    $("#fincEndDt").data("kendoExtMaskedDatePicker").value('');       // 금융만기일자

    /* 파일업로드 */
    $("#fileDocId").val('');    // 파일 문서 번호
    $("#fileGrid").data('kendoExtGrid').dataSource.data([]);   // 파일업로드

    /* 비고 */
    $("#remark").val('');

    $("#savedContractNo").val("");      // 저장 조회용

    bf_sumCarAmt();  // 차량가격정보 계산
}

// 검색조건
function reSearch(contNo){
    $("#sContractCustNo").val("");  // 고객번호
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

    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/sal/cnt/contract/selectModel.do' />"
        ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
        ,async:false
    });
    $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
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
    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/sal/cnt/contract/selectOcn.do' />"
        ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").val(), "modelCd":dataItem.modelCd})
        ,async:false
    });
    $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
}

/** [차량 및 탁송정보 영역] ComboBox Select() **/
//차종에 따른 모델검색 [차량 및 탁송정보 영역]
function onSelectCarlineCd(e){
    $("#modelCd").data("kendoExtDropDownList").setDataSource([]);
    $("#modelCd").data("kendoExtDropDownList").enable(true);

    $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
    $("#ocnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

    $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#extColorCd").data("kendoExtDropDownList").enable(false);

    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    $("#localOptionGrid").data('kendoExtGrid').dataSource.data([]);   // 로컬옵션 초기화.
    bf_addLocaloptionAmt();             // 로컬옵션 계산
    selectOptionGridDSList = [];
    selectOptionGridArray  = [];

    $("#promotionGrid").data('kendoExtGrid').dataSource.data([]);     // 프로모션 초기화
    $("#dcAmt").data("kendoExtNumericTextBox").value(0);                 // 프로모션:할인가격

    $("#carAmt").data("kendoExtNumericTextBox").value(0);  // 차량가격 초기화
    bf_sumCarAmt(); // 차량금액 계산

    var dataItem = this.dataItem(e.item);
    if(dataItem.carlineCd == ""){
        $("#modelCd").data("kendoExtDropDownList").enable(false);
        return false;
    }
    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/sal/cnt/contract/selectModel.do' />"
        ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
        ,async:false
    });
    $("#modelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
}

// 모델에 따른 OCN검색 [차량 및 탁송정보 영역]
function onSelectModelCd(e){
    onSelectModel = "";

    $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
    $("#ocnCd").data("kendoExtDropDownList").enable(true);

    $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#extColorCd").data("kendoExtDropDownList").enable(false);

    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    var dataItem = this.dataItem(e.item);
    if(dataItem.modelCd == ""){
        $("#ocnCd").data("kendoExtDropDownList").enable(false);
        return false;
    }
    onSelectModel = dataItem.modelCd;
    var responseJson = dms.ajax.getJson({
        // url:_contextPath + "/sal/veh/localOptionPrice/selectLocalMappingModel.do"
        url:"<c:url value='/sal/cnt/contract/selectOcn.do' />"
        ,data:JSON.stringify({"carlineCd":$("#carlineCd").val(), "modelCd":dataItem.modelCd})
        ,async:false
    });
    $("#ocnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

    // 로컬옵션 dropDown List 목록 조회
    var dlr = $("#sDlrCd").data("kendoExtDropDownList").value() == "" ? dlrCd:$("#sDlrCd").data("kendoExtDropDownList").value();
    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/sal/cnt/contract/selectLocalOptionPriceLists.do' />"
        ,data:JSON.stringify({"dlrCd":dlr, "modelCd":dataItem.modelCd})
        ,async:false
    });
    selectOptionGridDSList = responseJson.data;
    selectOptionGridArray  = [];
    if(selectOptionGridDSList != null){
        $.each(selectOptionGridDSList, function(idx, obj){
            selectOptionGridArray[obj.optionCd] = obj.optionNm;
        });
    }
    // 로컬옵션 grid 초기화.
    $("#localOptionGrid").data('kendoExtGrid').dataSource.data([]);
    bf_addLocaloptionAmt();             // 로컬옵션 계산

    // 프로모션 grid 조회 - 검색조건:딜러코드, 모델명, 계약일자
    $("#promotionGrid").data('kendoExtGrid').dataSource.read();
    $("#dcAmt").data("kendoExtNumericTextBox").value(0);   // 프로모션:할인가격

    $("#carAmt").data("kendoExtNumericTextBox").value(0);  // 차량가격 초기화
    bf_sumCarAmt(); // 차량금액 계산
}

//OCN에 따른 외장색 검색
function onSelectOcnCd(e){
    $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#extColorCd").data("kendoExtDropDownList").enable(true);

    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    if(this.dataItem(e.item).ocnCd == ""){
        $("#extColorCd").data("kendoExtDropDownList").enable(false);
        return false;
    }

    //차량 가격 세팅
    $("#carAmt").data("kendoExtNumericTextBox").value(this.dataItem(e.item).msPrc);
    bf_TotDcAmt();  // 프로모션 계산(할인금액)
    bf_sumCarAmt(); // 차량금액 계산

    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/sal/cnt/contract/selectExtColor.do' />"
        ,data:JSON.stringify({"modelCd":$("#modelCd").data("kendoExtDropDownList").value() })
        ,async:false
    });
    $("#extColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
}

// 외장색에 따른 내장색 검색
function onSelectExtColorCd(e){
    $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
    $("#intColorCd").data("kendoExtDropDownList").enable(true);

    if(this.dataItem(e.item).ocnCd == ""){
        $("#intColorCd").data("kendoExtDropDownList").enable(false);
        return false;
    }

    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/sal/cnt/contract/selectIntColor.do' />"
        ,data:JSON.stringify({"modelCd":$("#modelCd").data("kendoExtDropDownList").value() })
        ,async:false
    });
    $("#intColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
}


/** [중고차] ComboBox Select() **/
//차종에 따른 모델검색 [중고차 영역]
 function onSelectUseCarlineCd(e){
     $("#useModelCd").data("kendoExtDropDownList").setDataSource([]);
     $("#useModelCd").data("kendoExtDropDownList").enable(true);

     $("#useOcnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
     $("#useOcnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

     $("#useExtColorCd").data("kendoExtDropDownList").setDataSource([]);       // 외장색
     $("#useExtColorCd").data("kendoExtDropDownList").enable(true);            // 외장색 닫음

     $("#useIntColorCd").data("kendoExtDropDownList").setDataSource([]);       // 내장색
     $("#useIntColorCd").data("kendoExtDropDownList").enable(true);            // 내장색 닫음

     var dataItem = this.dataItem(e.item);

      var responseJson = dms.ajax.getJson({
         url:"<c:url value='/sal/cnt/contract/selectModel.do' />"
         ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
         ,async:false
     });

     $("#useModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
 }

 // 모델에 따른 OCN , 외장색, 내장색 검색 [중고차 영역]
 function onSelectUseModelCd(e){
     $("#useOcnCd").data("kendoExtDropDownList").setDataSource([]);
     $("#useOcnCd").data("kendoExtDropDownList").enable(true);

     $("#useExtColorCd").data("kendoExtDropDownList").setDataSource([]);
     $("#useExtColorCd").data("kendoExtDropDownList").enable(true);

     $("#useIntColorCd").data("kendoExtDropDownList").setDataSource([]);
     $("#useIntColorCd").data("kendoExtDropDownList").enable(true);

     var dataItem = this.dataItem(e.item);

     var responseJson = dms.ajax.getJson({
         url:"<c:url value='/sal/cnt/contract/selectOcn.do' />"
         ,data:JSON.stringify({"carlineCd":$("#useCarlineCd").val(), "modelCd":dataItem.modelCd})
         ,async:false
     });
     $("#useOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

     var responseJson = dms.ajax.getJson({
         url:"<c:url value='/sal/cnt/contract/selectExtColor.do' />"
         ,data:JSON.stringify({"modelCd":dataItem.modelCd})
         ,async:false
     });
     $("#useExtColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

     var responseJson = dms.ajax.getJson({
         url:"<c:url value='/sal/cnt/contract/selectIntColor.do' />"
         ,data:JSON.stringify({"modelCd":dataItem.modelCd})
         ,async:false
     });
     $("#useIntColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
 }

//실운전자 계약자 정보 초기화
function reDriverData(){
    $("#drvCustTp").val("");           // 고객유형

    $("#drvCustCd_01").val("");        // 개인코드
    $("#drvCustNm_01").val("");        // 개인성명
    $("#drvTelNo1_01").val("");        // 개인 연락처1
    $("#drvTelNo2_01").val("");        // 개인 연락처2
    $("#drvEmailNm_01").val("");       // 개인 이메일
    $("#drvZipCd_01").val("");         // 개인 우편번호
    $("#drvAddr1_01").val("");         // 개인 주소1
    $("#drvAddr2_01").val("");         // 개인 주소2

    $("#drvCustCd_02").val("");        // 법인코드
    $("#drvCustNm_02").val("");        // 법인명
    $("#drvTelNo1_02").val("");        // 법인 연락처1
    $("#drvTelNo2_02").val("");        // 법인 연락처2
    $("#drvCrnNo_02").val("");         // 사업자번호
    $("#drvZipCd_02").val("");         // 법인 우편번호
    $("#drvAddr1_02").val("");         // 법인 주소1
    $("#drvAddr2_02").val("");         // 법인 주소2
}

// 차량금액 계산
function bf_sumCarAmt(){
   var carAmt = Number($("#carAmt").data("kendoExtNumericTextBox").value());
   var dcAmt  = Number($("#dcAmt").data("kendoExtNumericTextBox").value());

   // 차량금액 = 차량가격 - 할인가격
   var carTotAmt = carAmt - dcAmt;
   $("#carTotAmt").data("kendoExtNumericTextBox").value(carTotAmt);

   var goodsAmt  = Number($("#goodsAmt").data("kendoExtNumericTextBox").value());
   var optionAmt = Number($("#optionAmt").val());
   // 용품가격 = 용품금액 + 로컬옵션 가격
   var goodsTotAmt = goodsAmt + optionAmt;
   $("#goodsTotAmt").data("kendoExtNumericTextBox").value(goodsTotAmt);

   var consAmt     = Number($("#consAmt").data("kendoExtNumericTextBox").value());
   var regSbodtAmt = Number($("#regSbodtAmt").data("kendoExtNumericTextBox").value());
   var vattaxAmt   = Number($("#vattaxAmt").data("kendoExtNumericTextBox").value());
   var otherTaxAmt = Number($("#otherTaxAmt").data("kendoExtNumericTextBox").value());

   // 기타비용합계 = 용품가격 + 탁송료 + 부대비용 + 증치세 + 기타세금
   var otherTotAmt = goodsTotAmt + consAmt + regSbodtAmt + vattaxAmt + otherTaxAmt;
   $("#otherTotAmt").data("kendoExtNumericTextBox").value(otherTotAmt);

   var otherAmt = Number($("#otherAmt").data("kendoExtNumericTextBox").value()); // 기타금액

   // 총판매 금액
   $("#payTotAmt").data("kendoExtNumericTextBox").value(carTotAmt + otherTotAmt + otherAmt);
}

// 탁송료 계산
bf_addConsAmt = function(){
    var tConsAmt = $("#tConsAmt").data("kendoExtNumericTextBox").value();
    if(tConsAmt == null){
        tConsAmt = 0;
        $("#tConsAmt").data("kendoExtNumericTextBox").value(0);
    }
    $("#consAmt").data("kendoExtNumericTextBox").value(tConsAmt);

    bf_sumCarAmt();     // 차량금액 계산
}

// 용품금액 계산
bf_addGoodsAmt = function(){
    var goodsAmt = $("#goodsAmt").data("kendoExtNumericTextBox").value();
    if(goodsAmt == null){
        goodsAmt = 0;
        $("#goodsAmt").data("kendoExtNumericTextBox").value(0);
    }
    bf_sumCarAmt();     // 차량금액 계산
}

// 로컬옵션 계산
bf_addLocaloptionAmt = function(){
    var grid = $("#localOptionGrid").data("kendoExtGrid");

    var items = grid.dataItems();

    var lOptionTot = 0;
    $.each(items, function(idx, row){
        lOptionTot += Number(row.optionAmt);
    });
    $("#optionAmt").val(Number(lOptionTot));
}

// CRM 고객 데이터 조회
bf_searchCustomer = function(obCd){

    popupWindow = dms.window.popup({
        windowId:"customerSearchPopup"
        , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
        , content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            , data:{
                "autoBind":false
                , "closeYn":"Y"
                , "type"  :null
                , "callbackFunc":function(data){
                    if(data.length >= 1) {
                        //console.log(data);

                        var custTp = data[0].custTp;
                        // 계약고객
                        if(obCd == 'cust'){
                            $("#custTp").val(custTp);

                            if(custTp == "02"){  // 법인
                                $("#cust_01").hide();
                                $("#cust_02").show();
                                $("#crnNo_"+custTp).val(data[0].ssnCrnNo);     // 사업자 번호

                            }
                            else{            // 개인
                                $("#cust_02").hide();
                                $("#cust_01").show();
                                $("#emailNm_"+custTp).val(data[0].emailNm);     // 이메일
                            }

                            $("#custCd_"+custTp).val(data[0].custNo);       // 고객코드
                            $("#custNm_"+custTp).val(data[0].custNm);       // 고객명
                            $("#telNo1_"+custTp).val(data[0].telNo);       // 전화번호1
                            $("#telNo2_"+custTp).val(data[0].telNo);       // 전화번호2
                            $("#zipCd_"+custTp).val(data[0].zipCd);         // 우편번호
                            $("#addr1_"+custTp).val(data[0].addr1);         // 주소1
                            $("#addr2_"+custTp).val(data[0].addr2);         // 주소2

                        }   // 실운전자
                        else if(obCd == 'drv'){
                            $("#drvCustTp").val(custTp);                   // 실운전자 고객유형

                            if(custTp == "02"){  // 법인
                                $("#drvCust_01").hide();
                                $("#drvCust_02").show();
                                $("#drvCrnNo_02").val(data[0].ssnCrnNo);     // 사업자 번호
                            }
                            else{            // 개인
                                $("#drvCust_02").hide();
                                $("#drvCust_01").show();
                                $("#drvEmailNm_01").val(data[0].emailNm);     // 이메일
                            }

                            $("#drvCustCd_"+custTp).val(data[0].custNo);       // 고객코드
                            $("#drvCustNm_"+custTp).val(data[0].custNm);       // 고객명
                            $("#drvTelNo1_"+custTp).val(data[0].telNo);        // 전화번호1
                            $("#drvTelNo2_"+custTp).val(data[0].telNo);        // 전화번호2
                            $("#drvZipCd_"+custTp).val(data[0].zipCd);         // 우편번호
                            $("#drvAddr1_"+custTp).val(data[0].addr1);         // 주소1
                            $("#drvAddr2_"+custTp).val(data[0].addr2);         // 주소2

                        }       // 검색
                        else{
                            $("#sContractCustNo").val(data[0].custNo);       // 고객코드
                            $("#sContractCustNm").val(data[0].custNm);       // 고객명
                            vCustNo = data[0].custNo;
                        }

                    }
                    //popupWindow.close();
                }
            }
        }
    });
}

// 실운전자 계약자와 동일
bf_realDriverSame = function(obj){

    // 실운전자 계약자 정보 초기화
    reDriverData();

    if(obj.checked){


        // 고객 유형:01:개인 , 02:법인
        $("#drvCustTp").val($("#custTp").val());

        var drvCustTp = $("#drvCustTp").val();

        /** 계약고객정보 **/
        if(drvCustTp == "02"){  // 법인
            $("#drvCust_01").hide();
            $("#drvCust_02").show();

            $("#drvCrnNo_02").val($("#crnNo_02").val());     // 사업자 번호
        }
        else{            // 개인
            $("#drvCust_02").hide();
            $("#drvCust_01").show();

            $("#drvEmailNm_01").val($("#emailNm_01").val());     // 이메일
        }

        $("#drvCustCd_"+drvCustTp).val($("#custCd_"+drvCustTp).val());       // 고객코드
        $("#drvCustNm_"+drvCustTp).val($("#custNm_"+drvCustTp).val());       // 고객명
        $("#drvTelNo1_"+drvCustTp).val($("#telNo1_"+drvCustTp).val());       // 전화번호1
        $("#drvTelNo2_"+drvCustTp).val($("#telNo2_"+drvCustTp).val());       // 전화번호2
        $("#drvZipCd_"+drvCustTp).val($("#zipCd_"+drvCustTp).val());         // 우편번호
        $("#drvAddr1_"+drvCustTp).val($("#addr1_"+drvCustTp).val());         // 주소1
        $("#drvAddr2_"+drvCustTp).val($("#addr2_"+drvCustTp).val());         // 주소2
    }
}

// 중고차 매입시 체크
bf_uatcCarPurc = function(obj){

    // 내용지우기
    $(".group-others").hide();
    $(".group-ours").show();

    if($("#uatcCarPurc").prop('checked')){
        $("#usedCar").show();
        $("#btnTradeIn").show();
    }else{
        $("#usedCar").hide();
        $("#btnTradeIn").hide();
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


// 로컬옵션 목록 조회
bf_selectLocalOption = function(optionCd, optionNm){
    if(optionNm != ""){
        return optionNm;
    }
    if(optionCd == ""){
        return "";
    }
    return selectOptionGridArray[optionCd];
}

// 해당 프로모션을 선택했을 경우 차량 가격 계산.
function bf_checkPromotion(obj, id){
    //console.log(obj.checked);

    var carAmt = Number($("#carAmt").data("kendoExtNumericTextBox").value());     // 차량가격
    var sDcAmt = 0          // 할인가격
       , chk = 'N';         // 버튼 체크 여부
    var grid = $("#promotionGrid").data("kendoExtGrid");
    var rows = grid.tbody.find("tr");
    $.each(rows, function(idx, row){
        var item = $("#promotionGrid").data("kendoExtGrid").dataItem(row);

        if(item.promotionCd == id){
            chk = item.chkYn;           // 체크시:N , 해제시:Y
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
    var dcAmt = $("#dcAmt").data("kendoExtNumericTextBox");
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
    bf_sumCarAmt(); // 차량금액 계산
}


//프로모션 계산:OCN 재 선택시 다시 계산.
function bf_TotDcAmt(){
    var carAmt = Number($("#carAmt").data("kendoExtNumericTextBox").value());     // 차량가격
    var sDcAmt = 0          // 할인가격
       , chk = 'N';         // 버튼 체크 여부

    var grid = $("#promotionGrid").data("kendoExtGrid");
    var rows = grid.tbody.find("tr");

    $.each(rows, function(idx, row){
        var item = grid.dataItem(row);
        if(item.chkYn == "Y"){
            // 비율(R) , 금액(F)
            if(item.applyTp == "R"){
                sDcAmt += carAmt * (Number(item.promotionAmt) / 100 );
            }else{
                sDcAmt += Number(item.promotionAmt);
            }
        }
    });

    $("#dcAmt").data("kendoExtNumericTextBox").value(Number(sDcAmt));
}

// 우편번호 조회(탁송지)
var zipCodeSearchPopupWin = null;
bf_zipCodeSearch = function (){

    zipCodeSearchPopupWin = dms.window.popup({
        windowId:"zipCodeSearchPopupWin"
        , title:"<spring:message code='cmm.title.zipcode.search' />"   // 우편번호 조회
        , content:{
            url:"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
            , data:{
                "autoBind":false
                , "usrNm":""
                , "callbackFunc":function(data){
                    if(data.length >= 1) {
                        //var zipDS = JSON.stringify(data);
                        $("#consZipCd").val(data[0].zipCd);
                        $("#consAddr1").val(data[0].sungNm +" "+ data[0].cityNm +" "+ data[0].distNm);
                    }

                    //zipCodeSearchPopupWin.close();
                }
            }
        }
    });
}

/** 무결성 검사 **/
function save_Validate(){
    var custTp = $("#custTp").val();
    if( $("#custCd_"+custTp).val() == ""){
        // {고객}를(을) 선택해주세요.:계약고객
        dms.notification.info("<spring:message code='global.lbl.customer' var='globalLblCustomer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCustomer}' />");
        return false;
    }
    var drvCustTp = $("#drvCustTp").val();
    if( $("#drvCustCd_"+custTp).val() == ""){
        // {고객}를(을) 선택해주세요.:실운전자
        dms.notification.info("<spring:message code='global.lbl.customer' var='globalLblCustomer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCustomer}' />");
        return false;
    }

    // 계약고객정보와 동일 체크 시 ( 계약자 = 실운전자 )
    if( $("#realDriverSame").prop('checked') == true ){
        if( $("#custCd_"+custTp).val() != $("#drvCustCd_"+custTp).val() ){
            // {고객}를(을) 선택해주세요.:실운전자
            dms.notification.info("<spring:message code='global.lbl.customer' var='globalLblCustomer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCustomer}' />");
            return false;
        }
    }

    // 차종
    if($("#carlineCd").data("kendoExtDropDownList").value() == "" ){
        dms.notification.info("<spring:message code='global.lbl.carLine' var='globalLblCarLine' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCarLine}' />");
        return false;
    }

    // 모델
    if($("#modelCd").data("kendoExtDropDownList").value() == "" ){
        dms.notification.info("<spring:message code='global.lbl.model' var='globalLblModel' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblModel}' />");
        return false;
    }

    // ocn
    if($("#ocnCd").data("kendoExtDropDownList").value() == "" ){
        dms.notification.info("<spring:message code='global.lbl.ocn' var='globalLblOcn' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblOcn}' />");
        return false;
    }

    // 외색
    if($("#extColorCd").data("kendoExtDropDownList").value() == "" ){
        dms.notification.info("<spring:message code='global.lbl.extColor' var='globalLblExtColor' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblExtColor}' />");
        return false;
    }

    // 내색
    if($("#intColorCd").data("kendoExtDropDownList").value() == "" ){
        dms.notification.info("<spring:message code='global.lbl.intColor' var='globalLblIntColor' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblIntColor}' />");
        return false;
    }

    // 계약유형
    if( $("#contractTp").data("kendoExtDropDownList").value() == "" ){
        dms.notification.info("<spring:message code='global.lbl.contractType' var='globalLblContractType' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblContractType}' />");
        return false;
    }

    // 과세구분
    if( $("#taxTp").data("kendoExtDropDownList").value() == "" ){
        dms.notification.info("<spring:message code='global.lbl.taxTp' var='globalLblTaxTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblTaxTp}' />");
        return false;
    }

    // 인도요청일
    if( $("#dlReqDt").data("kendoExtMaskedDatePicker").value() == "" ){
        dms.notification.info("<spring:message code='global.lbl.dlReqDt' var='globalLblDlReqDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblDlReqDt}' />");
        return false;
    }

    // 탁송구분
    if( $("#consTp").data("kendoExtDropDownList").value() == "" ){
        dms.notification.info("<spring:message code='global.lbl.consTp' var='globalLblConsTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblConsTp}' />");
        return false;
    }
    // 탁송구분이 C 이면, 탁송료 와 탁송지 선택
    if( $("#consTp").data("kendoExtDropDownList").value() == "C" ){
        //탁송료
        if( $("#tConsAmt").data("kendoExtNumericTextBox").value() <= 0 ){
            dms.notification.info("<spring:message code='global.lbl.consAmt' var='globalLblConsAmt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblConsAmt}' />");
            return false;
        }
        // 탁송지
        if(  $("#consZipCd").val() == "" || $("#consAddr1").val() == "" || $("#consAddr2").val() == ""){
            dms.notification.info("<spring:message code='global.lbl.consAddr' var='globalLblConsAddr' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblConsAddr}' />");
            return false;
        }
    }

    // 계약금지불유형
    if( $("#contractAmtPayTp").data("kendoExtDropDownList").value() == "" ){
        dms.notification.info("<spring:message code='global.lbl.contractAmtPayTp' var='globalLblContractAmtPayTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblContractAmtPayTp}' />");
        return false;
    }
    // 인도금지불유형
    if( $("#dlAmtPayTp").data("kendoExtDropDownList").value() == "" ){
        dms.notification.info("<spring:message code='global.lbl.dlAmtPayTp' var='globalLblDlAmtPayTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblDlAmtPayTp}' />");
        return false;
    }

    // 중고차 매입시 선택 시,
    if( $("#uatcCarPurc").prop('checked') ){
        // 자사/타사
        if( $("#corpCarDstinCd").data("kendoExtDropDownList").value() == "" ){
            dms.notification.info("<spring:message code='global.lbl.ourCompany' var='globalLblOurCompany' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblOurCompany}' />");
            return false;
        }

        // 자사
        if( $("#corpCarDstinCd").data("kendoExtDropDownList").value() == "01" ){
            // 차종
            if( $("#useCarlineCd").data("kendoExtDropDownList").value() == "" ){
                dms.notification.info("<spring:message code='global.lbl.carLine' var='globalLblCarLine' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCarLine}' />");
                return false;
            }
            //모델
            if( $("#useModelCd").data("kendoExtDropDownList").value() == "" ){
                dms.notification.info("<spring:message code='global.lbl.model' var='globalLblModel' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblModel}' />");
                return false;
            }
            //OCN
            if( $("#useOcnCd").data("kendoExtDropDownList").value() == "" ){
                dms.notification.info("<spring:message code='global.lbl.ocn' var='globalLblOcn' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblOcn}' />");
                return false;
            }
            //외장색
            if( $("#useExtColorCd").data("kendoExtDropDownList").value() == "" ){
                dms.notification.info("<spring:message code='global.lbl.extColor' var='globalLblExtColor' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblExtColor}' />");
                return false;
            }
            //내장색
            if( $("#useIntColorCd").data("kendoExtDropDownList").value() == "" ){
                dms.notification.info("<spring:message code='global.lbl.intColor' var='globalLblIntColor' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblIntColor}' />");
                return false;
            }


        }   // 타사
        else{
            // 브랜드
            if( $("#brandCd").data("kendoExtDropDownList").value() == "" ){
                dms.notification.info("<spring:message code='global.lbl.brand' var='globalLblBrand' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblBrand}' />");
                return false;
            }
            //모델
            if( $("#useOthersModelNm").val() == "" ){
                dms.notification.info("<spring:message code='global.lbl.model' var='globalLblModel' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblModel}' />");
                return false;
            }
        }

        // 차량번호
        if( $("#carNo").val() == "" ){
            dms.notification.info("<spring:message code='global.lbl.carNo' var='globalLblCarNo' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCarNo}' />");
            return false;
        }
        // 차대 번호
        if( $("#vinNo").val() == "" ){
            dms.notification.info("<spring:message code='par.lbl.vinNo' var='parLblVinNo' /><spring:message code='global.info.chkSelectItemMsg' arguments='${parLblVinNo}' />");
            return false;
        }

    }

    // 차량등록정보 대행시.
    if($("#regTp").val() == "A"){
        // 등록지역
        if( $("#regDistCd").data("kendoExtDropDownList").value() == "" ){
            dms.notification.info("<spring:message code='global.lbl.regDist' var='globalLblRegDist' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblRegDist}' />");
            return false;
        }
        // 명의자
        if( $("#regNameNm").val() == "" ){
            dms.notification.info("<spring:message code='global.lbl.regName' var='globalLblRegName' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblRegName}' />");
            return false;
        }
    }

    // 보험정보 대행시
    if($("#incAapCd").val() == "A"){
        // 보험회사
        if( $("#incCmpCd").data("kendoExtDropDownList").value() == "" ){
            dms.notification.info("<spring:message code='global.lbl.incCmp' var='globalLblIncCmp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblIncCmp}' />");
            return false;
        }
        // 보험가입일
        if( $("#incJoinDt").data("kendoExtMaskedDatePicker").value() == "" ){
            dms.notification.info("<spring:message code='global.lbl.incJoinDt' var='globalLblRegName' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblIncJoinDt}' />");
            return false;
        }
    }

    // 금융신청 선택시.
    if($("#fincReq").prop('checked')){
        // 금융사
        if( $("#fincCmpCd").data("kendoExtDropDownList").value() == "" ){
            dms.notification.info("<spring:message code='global.lbl.fincCmp' var='globalLblFincCmp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblFincCmp}' />");
            return false;
        }

        // 금융상품
        if( $("#fincItemCd").data("kendoExtDropDownList").value() == "" ){
            dms.notification.info("<spring:message code='global.lbl.fincItem' var='globalLblFincItem' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblFincItem}' />");
            return false;
        }

        // 신청일자
        if( $("#fincReqDt").data("kendoExtMaskedDatePicker").value() == "" ){
            dms.notification.info("<spring:message code='global.lbl.fincReqDt' var='globalLblFincReqDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblFincReqDt}' />");
            return false;
        }

        // 만기일자
        if( $("#fincEndDt").data("kendoExtMaskedDatePicker").value() == "" ){
            dms.notification.info("<spring:message code='global.lbl.fincEndDt' var='globalLblFincEndDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblFincEndDt}' />");
            return false;
        }
    }

    return true;
}

/*********
 * 저장
 *********/
function save(){
    /** 무결성 검사 **/
    if( !save_Validate() ){
       return false;
    }

    var param = {
        "contractVO":$("#contForm").serializeObject($("#contForm").serializeArrayInSelector("[data-json-obj='true']"))
       ,"localOptionVO":$("#localOptionGrid").data("kendoExtGrid").getCUDData("insertOptionList", "updateOptionList", "deleteOptionList")
       ,"promotionVO":$("#promotionGrid").data("kendoExtGrid").getCUDData("insertPromotionList", "updatePromotionList", "deletePromotionList")
       ,"multiFlag":""
    };

    // 로컬옵션 무결성 체크
    var dataValidate = false;
    $.each(param.localOptionVO.updateOptionList, function(idx, row){
        if(row.optionCd == ""){
           // 선택하지 않은 로컬옵션이 있습니다.
           dms.notification.info("<spring:message code='global.lbl.option' var='globalLblOption' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblOption}' />");
           dataValidate = true;
           return false;
        }
     });
    $.each(param.localOptionVO.insertOptionList, function(idx, row){
       if(row.optionCd == ""){
           // 선택하지 않은 로컬옵션이 있습니다.
           dms.notification.info("<spring:message code='global.lbl.option' var='globalLblOption' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblOption}' />");
           dataValidate = true;
           return false;
       }
    });
    if(dataValidate){ return false; }

    // 계약상태
    if( $("#contractStatCd").val() == "" ){
        param.contractVO.contractStatCd = "10";      // 계약등록
    }

    param.contractVO.contractDt = $("#contractDt").data("kendoExtMaskedDatePicker").value();           // 계약일
    param.contractVO.dlReqDt = $("#dlReqDt").data("kendoExtMaskedDatePicker").value();                 // 인도요청일
    param.contractVO.carYyCd = kendo.toString($("#carYyCd").data("kendoExtMaskedDatePicker").value(),"yyyyMM");    // 중고차:연식
    param.contractVO.carRegDt = $("#carRegDt").data("kendoExtMaskedDatePicker").value();               // 등록일자
    param.contractVO.evalScheDt = $("#evalScheDt").data("kendoExtMaskedDatePicker").value();           // 평가일자
    param.contractVO.incJoinDt = $("#incJoinDt").data("kendoExtMaskedDatePicker").value();             // 보험가입일
    param.contractVO.fincReqDt = $("#fincReqDt").data("kendoExtMaskedDatePicker").value();             // 신청일자
    param.contractVO.fincEndDt = $("#fincEndDt").data("kendoExtMaskedDatePicker").value();             // 만기일자

    if($("#sDlrCd").data("kendoExtDropDownList").value() == ""){
        param.contractVO.dlrCd = dlrCd;       // 딜러코드
    }else{
        param.contractVO.dlrCd = $("#sDlrCd").data("kendoExtDropDownList").value();
    }

    if($("#sSaleEmpNo").data("kendoExtDropDownList").value() == ""){
        param.contractVO.saleEmpNo = userId;       // 판매사원
    }else {
        param.contractVO.saleEmpNo = $("#sSaleEmpNo").data("kendoExtDropDownList").value();
    }

    // 계약고객정보
    var custTp = $("#custTp").val();
    param.contractVO.custTp = custTp;                            // 고객유형
    param.contractVO.custCd = $("#custCd_"+custTp).val();         // 고객코드
    param.contractVO.contractCustNo = $("#custCd_"+custTp).val(); // 고객코드 0201T
    param.contractVO.custNm = $("#custNm_"+custTp).val();         // 고객명
    param.contractVO.telNo1 = $("#telNo1_"+custTp).val();         // 전화번호1
    param.contractVO.telNo2 = $("#telNo2_"+custTp).val();         // 전화번호2
    param.contractVO.zipCd  = $("#zipCd_"+custTp).val();          // 우편번호
    param.contractVO.addr1  = $("#addr1_"+custTp).val();          // 주소1
    param.contractVO.addr2  = $("#addr2_"+custTp).val();          // 주소2

    if(custTp == "01"){     // 개인
        param.contractVO.emailNm = $("#emailNm_"+custTp).val();   // 이메일주소
    }else{                  // 법인
        param.contractVO.crnNo = $("#crnNo_"+custTp).val();       // 사업자/법인 번호
    }

    // 계약고객정보와 동일 체크
    if( $("#realDriverSame").prop('checked') == true ){
        param.contractVO.realDriverSameYn = "Y";
    }else{
        param.contractVO.realDriverSameYn = "N";
    }

    // 실운전자정보
    var drvCustTp = $("#drvCustTp").val();
    param.contractVO.drvCustTp = drvCustTp;                         // 고객유형
    param.contractVO.drvCustCd = $("#drvCustCd_"+drvCustTp).val();   // 고객코드
    param.contractVO.realDriverCustNo = $("#drvCustCd_"+drvCustTp).val();   // 고객코드 0201T
    param.contractVO.drvCustNm = $("#drvCustNm_"+drvCustTp).val();   // 고객명
    param.contractVO.drvTelNo1 = $("#drvTelNo1_"+drvCustTp).val();   // 전화번호1
    param.contractVO.drvTelNo2 = $("#drvTelNo2_"+drvCustTp).val();   // 전화번호2
    param.contractVO.drvZipCd  = $("#drvZipCd_"+drvCustTp).val();    // 우편번호
    param.contractVO.drvAddr1  = $("#drvAddr1_"+drvCustTp).val();    // 주소1
    param.contractVO.drvAddr2  = $("#drvAddr2_"+drvCustTp).val();    // 주소2

    if(custTp == "01"){     // 개인
        param.contractVO.drvEmailNm = $("#drvEmailNm_"+drvCustTp).val();   // 이메일주소
    }else{                  // 법인
        param.contractVO.drvCrnNo = $("#drvCrnNo_"+drvCustTp).val();       // 사업자/법인 번호
    }

    // 차량가격
    param.contractVO.totAmt = $("#payTotAmt").data("kendoExtNumericTextBox").value();  // 총 판매금액

    // 중고차 매입시 체크
    if( $("#uatcCarPurc").prop('checked')){
        param.contractVO.uatcCarPurcYn = "Y";
    }else{
        param.contractVO.uatcCarPurcYn = "N";
    }

    // 금융신청 체크
    if( $("#fincReq").prop('checked')){
        param.contractVO.fincReqYn = "Y";
    }else{
        param.contractVO.fincReqYn = "N";
    }

    if( $("#contractNo").val() != ""){
        // 수정하시겠습니까?
        if(!confirm("<spring:message code='global.lbl.update' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
            return;
        }
        param.multiFlag = "update";
    }else{
        // 생성하시겠습니까?
        if(!confirm("<spring:message code='global.lbl.create' var='globalLblCreate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblCreate}' />")){
            return;
        }
        param.multiFlag = "create";
    }

    $.ajax({
        url:"<c:url value='/sal/cnt/contract/multiContracts.do' />",
        data:JSON.stringify(param),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR,status,error) {
            dms.notification.error(jqXHR.responseJSON.errors);
        },
        success:function(jqXHR, textStatus) {

            var grid = $("#contGrid").data("kendoExtGrid");
            refreshAll();
            reSearch(jqXHR);                    // 조회조건 세팅
            $("#savedContractNo").val(jqXHR);   // 저장된 계약번호
            grid.dataSource.read();

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
        if($("#sDlrCd").data("kendoExtDropDownList").value() == ""){
            param.dlrCd = dlrCd;                            // 딜러코드
        }else{
            param.dlrCd = $("#sDlrCd").data("kendoExtDropDownList").value();
        }

        $.ajax({
            url:"<c:url value='/sal/cnt/contract/deleteContract.do' />",
            data:JSON.stringify(param),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            },
            success:function(jqXHR, textStatus) {
                var grid = $("#contGrid").data("kendoExtGrid");
                grid.dataSource.read();
                refreshAll();
                fn_btnState();  // 버튼처리 초기화 상태

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

/**
 * 계약승인요청 [TOBE 결재요청을 통한 승인요청 처리변경 예정]
 */
function conRequestAppr(){
    if($("#contractNo").val() == ""){
        // 대상을 선택하십시오.
        dms.notification.info("대상을 선택하여 주세요.");
        return false;
    }

    if( $("#contractStatCd").val() == "10" ){
        var param = {};
        param.contractNo = $("#contractNo").val();          // 계약번호
        if($("#sDlrCd").data("kendoExtDropDownList").value() == ""){
            param.dlrCd = dlrCd;                            // 딜러코드
        }else{
            param.dlrCd = $("#sDlrCd").data("kendoExtDropDownList").value();
        }

        $.ajax({
            url:"<c:url value='/sal/cnt/contract/conRequestAppr.do' />",
            data:JSON.stringify(param),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            },
            success:function(jqXHR, textStatus) {
                var grid = $("#contGrid").data("kendoExtGrid");
                refreshAll();
                reSearch(jqXHR);                    // 조회조건 세팅
                $("#savedContractNo").val(jqXHR);   // 계약승인요청 한 계약번호
                grid.dataSource.read();

                /*
                var rows = grid.tbody.find("tr");
                $.each(rows, function(idx, row){
                    var item = grid.dataItem(row);
                    if(item.contractNo == jqXHR){
                        fn_contGridDBclick(item);
                    }
                });
                */

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
        });

    }else{
        // 승인 이전단계에서만 승인요청이 가능합니다.
        dms.notification.info("<spring:message code='global.lbl.contractAcptReq' var='globalLblContractAcptReq' /><spring:message code='global.btn.applyReq' var='globalBtnApplyReq' /><spring:message code='global.info.ckeckSaveInfo' arguments='${globalLblContractAcptReq}, ${globalBtnApplyReq}' />");
        return false;
    }
}


/**
 * 승인확정 [TOBE 결재요청을 통한 승인요청 처리변경 예정]
 */
function approval(state){
    if($("#contractNo").val() == ""){
        // 대상을 선택하십시오.
        dms.notification.info("대상을 선택하여 주세요.");
        return false;
    }

    // 승인전
    if( $("#contractStatCd").val() == "20" ){
        var param = {};
        param.contractNo = $("#contractNo").val();          // 계약번호
        if($("#sDlrCd").data("kendoExtDropDownList").value() == ""){
            param.dlrCd = dlrCd;                            // 딜러코드
        }else{
            param.dlrCd = $("#sDlrCd").data("kendoExtDropDownList").value();
        }

        var appURL = "";
        if(state == "01"){ // 승인확정
            appURL = "<c:url value='/sal/cnt/contract/approval.do' />";
        }else{          // 승인반려
            appURL = "<c:url value='/sal/cnt/contract/approvalRollback.do' />";
        }

        $.ajax({
            url:appURL,
            data:JSON.stringify(param),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            },
            success:function(jqXHR, textStatus) {
                var grid = $("#contGrid").data("kendoExtGrid");
                refreshAll();
                //fn_btnState();  // 버튼상태
                reSearch(jqXHR);                    // 조회조건 세팅
                $("#savedContractNo").val(jqXHR);   // 승인한 계약번호
                grid.dataSource.read();

                /*
                var rows = grid.tbody.find("tr");
                $.each(rows, function(idx, row){
                    var item = grid.dataItem(row);
                    if(item.contractNo == jqXHR){
                        fn_contGridDBclick(item);
                    }
                });
                */

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
        });

    }else{
        // 승인요청 이전단계에서만 승인확정이 가능합니다.
        dms.notification.info("<spring:message code='global.btn.applyReq' var='globalBtnApplyReq' /><spring:message code='global.btn.approvalFix' var='globalBtnApprovalFix' /><spring:message code='global.info.ckeckSaveInfo' arguments='${globalBtnApplyReq}, ${globalBtnApprovalFix}' />");
    }
}

/**
 * 버튼 상태 관리
 */
function fn_btnState(state){
    switch(state){
        case '10':     // 계약등록
            $("#btnSave").show();
            $("#btnRemove").show();
            $("#btnConRequestAppr").show();
            $("#btnApproval").hide();
            break;
        case '20':     // 계약승인요청
            $("#btnApproval").show();
            $("#btnSave").hide();
            $("#btnRemove").hide();
            $("#btnConRequestAppr").hide();
            break;
        case '21':     // 계약승인
        case '30':     // 배정
        case '40':     // 출고요청
        case '41':     // 출고확정
        case '50':     // 고객인도
        case '91':     // 계약해약  - 출고이후 , goodwill 품의
        case '92':     // 계약삭제  - 삭제버튼 (승인전)
        case '93':     // 계약취소  - 계약승인 이후
            $("#btnSave").hide();
            $("#btnRemove").hide();
            $("#btnConRequestAppr").hide();
            $("#btnApproval").hide();
            break;
        default:     // 작성전
            $("#btnSave").show();
            $("#btnRemove").hide();
            $("#btnConRequestAppr").hide();
            $("#btnApproval").hide();
           break;
    }
}

// 검색조건:계약일자의 시작일-종료일 날짜 비교
fnChkSearchDate = function(e){
    //if(dms.string.isEmpty($(this).val())){return;}
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

//검색조건:고객
fnCheckCustValue = function(){
    if($("#sContractCustNo").val() != vCustNo){
        $("#sContractCustNm").val("");
    }
}


/* *************************************************************************
 **************************파일업로드3********************************************
 ***************************************************************************/
 //================================
 var r = new Resumable({
     target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
     ,chunkSize:1 * 1024 * 1024
     ,simultaneousUploads:4
     ,testChunks:true
     ,throttleProgressCallbacks:1
     ,method:"octet"
 });
 r.assignBrowse($('#fileSelect')[0]);

 //파일추가 이벤트
 r.on('fileAdded', function(file) {

     $("#progressWindow").kendoWindow({
         width:"600px"
         ,height:"300px"
         ,title:"<spring:message code='global.lbl.fileSend'/>"     // 파일전송
         ,animation:false
         ,draggable:false
         ,visible:false
         ,resizable:false
         ,modal:true
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
             url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
             dataType:"json",
             type:"get",
             async:false,
             cache:false,
             success:function(id) {
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

     console.log("resumableSessionId:" + _that.opt["query"]["resumableSessionId"]);

     $("#progressWindow").data("kendoWindow").close();
     r.files = [];
     $(".resumable-list").html("");
 });
 r.on('fileSuccess', function(file, message) {
     console.log("===============");
     console.log(message);

     var result = JSON.parse(message);
     if(result.status === "finished") {
         $("#fileGrid").data("kendoExtGrid").dataSource.insert({
             fileDocNo:result.fileDocNo
             ,fileNo:result.fileNo
             ,fileNm:result.fileNm
             ,fileSize:dms.string.formatFileSize(result.fileSize)
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
     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
     $('.progress-bar').css({width:Math.min(Math.floor(r.progress() * 100), 100)+ '%'});
 });
 /* *************************************************************************
 **************************파일업로드3********************************************
 ***************************************************************************/


/******************************************
 * 함수영역 - end
 ******************************************/
$(document).ready(function() {
    $("#custTp").val("01");       // 계약자 고객유형
    $("#drvCustTp").val("01");    // 실운전자 고객유형
    $("#sContractCustNo").on('change', fnCheckCustValue);

    // 딜러
    $("#sDlrCd").kendoExtDropDownList({
          dataTextField:"dlrNm"
         ,dataValueField:"dlrCd"
         ,dataSource:selectDlrDSList
         ,optionLabel:" "   // 전체
      });
    $("#sDlrCd").data("kendoExtDropDownList").value(dlrCd);        // 딜러코드
    /*
    [TOBE] 기능 결정
    $("#sDlrCd").kendoAutoComplete({
        minLength:2
        ,template:"[#:data.dlrCd#]#:data.dlrNm#"
        ,dataTextField:"dlrCd"
        ,dataSource:{
            serverFiltering:true
            ,transport:{
                read:{
                     url:"<c:url value='/cmm/cmp/plant/selectDealersForSuggest.do' />"
                     ,dataType:"json"
                     ,type:"POST"
                     ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation){
                    if (operation === "read") {
                        return kendo.stringify({
                            "sText":$("#sDlrCd").data("kendoAutoComplete").value()
                            ,"recordCountPerPage":10
                        });
                    }
                }
            }
            ,schema:{
                data:"data"
                ,total:"total"
            }
        }
    });
    $("#sDlrCd").data("kendoAutoComplete").value(dlrCd);        // 딜러코드
    */

    //판매사원
    $("#sSaleEmpNo").kendoExtDropDownList({
        dataTextField:"saleEmpNm"
       ,dataValueField:"saleEmpCd"
       ,dataSource:selectSaleEmpDSList
       ,optionLabel:" "   // 전체
    });
    $("#sSaleEmpNo").data("kendoExtDropDownList").value(userId);   // 판매사원


    // 계약유형
    $("#sContractTp").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:contractTpList
       ,optionLabel:" "   // 전체
    });

    // 계약상태
    $("#sContractStatCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:contractStatCdList
       ,optionLabel:" "   // 전체
    });

    // 계약 시작일
    $("#sStartContractDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
    });

    // 계약 종료일
    $("#sEndContractDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    // 계약시작일은 계약종료일보다 클수가 없다.
    //$("#sStartContractDt").on('change', fnChkSearchDate);
    $("#sStartContractDt").on('change', {from:$("#sStartContractDt"), to:$("#sEndContractDt")}, fnChkSearchDate);
    $("#sEndContractDt").on('change', {from:$("#sStartContractDt"), to:$("#sEndContractDt")}, fnChkSearchDate);

    /**
     * 차종 콤보박스
     */
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,select:onSelectSearchCarlineCd
       ,optionLabel:" "   // 전체
    });

    /**
     * 모델 콤보박스
     */
     $("#sModelCd").kendoExtDropDownList({
         dataTextField:"modelNm"
        ,dataValueField:"modelCd"
        ,select:onSelectSearchModelCd
        ,optionLabel:" "   // 전체
     });

     //$("#sModelCd").data("kendoExtDropDownList").wrapper.hide();  // 숨김
     $("#sModelCd").data("kendoExtDropDownList").enable(false);

    /**
    * ocn 콤보박스
    */
    $("#sOcnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "   // 전체
    });

    //$("#sOcnCd").data("kendoExtDropDownList").wrapper.hide();      // 숨김
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);


    // 계약일
    $("#contractDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:toDay
    });

    // 2급딜러여부
    $("#lv2DlrYn").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:[{cmmCdNm:"Y", cmmCd:"Y"}, {cmmCdNm:"N", cmmCd:"N"}]
       ,index:1
    });

    // 차량가격
    $("#carAmt").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
       //,change:function(){}
    });

    // 할인가격
    $("#dcAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 차량금액
    $("#carTotAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 용품가격
    $("#goodsTotAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 탁송료
    $("#consAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 부대비용
    $("#regSbodtAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 증치세
    $("#vattaxAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 기타세금
    $("#otherTaxAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 기타비용합계
    $("#otherTotAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 기타금액
    $("#otherAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 총판매금액
    $("#payTotAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });


   /************************
    * 차량 및 탁송정보
   ************************/
    // 차량
    $("#carlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,select:onSelectCarlineCd
       ,optionLabel:" "   // 전체
    });

    // 모델
    $("#modelCd").kendoExtDropDownList({
        dataTextField:"modelNm"
       ,dataValueField:"modelCd"
       ,select:onSelectModelCd
       ,optionLabel:" "   // 전체
    });

    //$("#sModelCd").data("kendoExtDropDownList").wrapper.hide();  // 숨김
    $("#modelCd").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#ocnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "   // 전체
        ,select:onSelectOcnCd
    });
    $("#ocnCd").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#extColorCd").kendoExtDropDownList({
         dataTextField: "extColorNm"
        ,dataValueField:"extColorCd"
        ,optionLabel:" "   // 전체
        ,select:onSelectExtColorCd
    });
    $("#extColorCd").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#intColorCd").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,optionLabel:" "   // 전체
    });
    $("#intColorCd").data("kendoExtDropDownList").enable(false);

    // 계약유형
    $("#contractTp").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:contractTpList
       ,optionLabel:" "   // 전체
    });

    // 탁송구분
    $("#consTp").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:consTpList
       ,select:function(e){
           // 탁송:C , 방문:I
           if(this.dataItem(e.item).cmmCd == "I"){
               $("#tabConsTp").hide();

               $("#tConsAmt").data("kendoExtNumericTextBox").value(0);
               $("#consZipCd").val('');
               $("#consAddr1").val('');
               $("#consAddr2").val('');
               bf_addConsAmt();  // 탁송료 계산
           }else{
               $("#tabConsTp").show();
           }
       }
       ,optionLabel:" "   // 전체
    });

    // 과세구분
    $("#taxTp").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:taxTpList
       ,optionLabel:" "   // 전체
    });

    // 인도요청일
    $("#dlReqDt").kendoExtMaskedDatePicker({
      //value:toDay,
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });


    // 탁송료
    $("#tConsAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       //,spinners:false             // 증,감 화살표
    });

    /************************
     * 용품정보
    ************************/
    // 용품금액
    $("#goodsAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       //,spinners:false             // 증,감 화살표
    });

    /************************
     * 차량대금지불방법
    ************************/
    // 계약금액
    $("#contractAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       //,spinners:false             // 증,감 화살표
    });
    // 계약금지불유형
    $("#contractAmtPayTp").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:amtPayTpList
       ,optionLabel:" "   // 전체
    });
    // 인도금액
    $("#dlAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,min:0.00
       ,value:0.00
       //,spinners:false             // 증,감 화살표
    });
    // 인도금지불유형
    $("#dlAmtPayTp").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:amtPayTpList
       ,optionLabel:" "   // 전체
    });

    /************************
     * 중고차
    ************************/
    // 자사/타사
    $("#corpCarDstinCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:corpCarDstinTpList
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           if(dataItem.cmmCd == "01"){    // 자사
               $(".group-others").hide();
               $(".group-ours").show();
           }else{                   // 타사
               $(".group-others").show();
               $(".group-ours").hide();
           }
       }
       ,optionLabel:" "   // 전체
    });

    //브랜드
   $("#brandCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:brandCdList
       ,optionLabel:" "   // 전체
    });

   // 중고차:차종
   $("#useCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,select:onSelectUseCarlineCd
       ,optionLabel:" "   // 전체
    });
   // 중고차:모델
   $("#useModelCd").kendoExtDropDownList({
       dataTextField:"modelNm"
      ,dataValueField:"modelCd"
      ,select:onSelectUseModelCd
      ,optionLabel:" "   // 전체
   });
   $("#useModelCd").data("kendoExtDropDownList").enable(false);

   // 중고차:ocn
   $("#useOcnCd").kendoExtDropDownList({
        dataTextField: "ocnNm"
       ,dataValueField:"ocnCd"
       ,optionLabel:" "   // 전체
   });
   $("#useOcnCd").data("kendoExtDropDownList").enable(false);

   // 중고차:외장색
   $("#useExtColorCd").kendoExtDropDownList({
        dataTextField: "extColorNm"
       ,dataValueField:"extColorCd"
       ,optionLabel:" "   // 전체
   });
   $("#useExtColorCd").data("kendoExtDropDownList").enable(false);

   // 중고차:내장색
   $("#useIntColorCd").kendoExtDropDownList({
        dataTextField: "intColorNm"
       ,dataValueField:"intColorCd"
       ,optionLabel:" "   // 전체
   });
   $("#useIntColorCd").data("kendoExtDropDownList").enable(false);


   //주행거리
   $("#carRunDistVal").kendoExtNumericTextBox({
       format:"{0:###,###}"
      ,decimals:0
      ,min:0
      ,value:0
      ,spinners:false
   });

   //배기량
   $("#carDispQty").kendoExtNumericTextBox({
       format:"{0:###,###}"
      ,decimals:0
      ,min:0
      ,value:0
      ,spinners:false
   });

   //구동방식
   $("#carDrvMthCd").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:carDrvMthCdList
      ,optionLabel:" "   // 전체
   });

   //연료
   $("#fuelCd").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:fuelCdList
      ,optionLabel:" "   // 전체
   });

   // 승용/상용
   $("#pcDstinCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:pcDstinCdList
       ,optionLabel:" "   // 전체
    });

   //정원
   $("#carLmtVal").kendoExtNumericTextBox({
       format:"{0:###,###}"
      ,decimals:0
      ,min:0
      ,value:0
      ,spinners:false
   });

   //연식
   $("#carYyCd").kendoExtMaskedDatePicker({
        value:toDay.substring(0, 8)
       ,start:"year"
       ,depth:"year"
       ,format:"yyyy-MM"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });


   //등록일자
   $("#carRegDt").kendoExtMaskedDatePicker({
        //value:toDay,
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

   //평가일자
   $("#evalScheDt").kendoExtMaskedDatePicker({
        //value:toDay,
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

   /************************
    * 차량등록정보
   ************************/
   //등록지역
   $("#regDistCd").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:regDistCdList
      ,optionLabel:" "   // 전체
   });

   //부대비용
   $("#tRegSbodtAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2                // 소숫점
      ,min:0.00
      ,value:0.00
      ,spinners:false             // 증,감 화살표
   });

   // 차량등록정보:대행
   $("#tabRegTp01").click(function(){
       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#regDistCd").data("kendoExtDropDownList").enable(true);          // 등록지역
       $("#tRegSbodtAmt").data("kendoExtNumericTextBox").enable(true);     // 부대비용
       $("#regNameNm").attr("disabled", false);                         // 명의자
       $("#regTp").val("A");       // SAL126 대행:A , 본인:M
   });
   //차량등록정보:본인
   $("#tabRegTp02").click(function(){
       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#regDistCd").data("kendoExtDropDownList").enable(false);        // 등록지역
       $("#tRegSbodtAmt").data("kendoExtNumericTextBox").enable(false);   // 부대비용
       $("#regNameNm").attr("disabled", true);                         // 명의자
       $("#regTp").val("M");       // SAL126 대행:A , 본인:M
   });
   $("#tabRegTp02").click();    // 최초:본인

   /************************
    * 보험정보
   ************************/
   //보험회사
   $("#incCmpCd").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:incCmpCdList
      ,optionLabel:" "   // 전체
   });

   //보험가입일
   $("#incJoinDt").kendoExtMaskedDatePicker({
        //value:toDay,
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

   //보험금액
   $("#incAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2                // 소숫점
      ,min:0.00
      ,value:0.00
      ,spinners:false             // 증,감 화살표
   });

   // 보험등록:대행
   $("#incAapCd01").click(function(){
       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#incCmpCd").data("kendoExtDropDownList").enable(true);          // 보험회사
       $("#incJoinDt").data("kendoExtMaskedDatePicker").enable(true);           // 보험가입일
       $("#incAmt").data("kendoExtNumericTextBox").enable(true);          // 보험금액
       $("#incAapCd").val("A");       // SAL126 대행:A , 본인:M
   });
   // 보험등록:본인
   $("#incAapCd02").click(function(){
       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#incCmpCd").data("kendoExtDropDownList").enable(false);          // 보험회사
       $("#incJoinDt").data("kendoExtMaskedDatePicker").enable(false);           // 보험가입일
       $("#incAmt").data("kendoExtNumericTextBox").enable(false);          // 보험금액
       $("#incAapCd").val("M");       // SAL126 대행:A , 본인:M
   });
   $("#incAapCd02").click(); // 최초:본인
   /************************
    * 금융정보
   ************************/
   // 금융사
   $("#fincCmpCd").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:fincCmpCdList
      ,optionLabel:" "   // 전체
   });

   // 금융상품
   $("#fincItemCd").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:fincItemList
      ,optionLabel:" "   // 전체
   });

   // 신청금액
   $("#fincReqAmt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,value:0.00
      ,spinners:false             // 증,감 화살표
   });

   // 신청일자
   $("#fincReqDt").kendoExtMaskedDatePicker({
        value:toDay
       ,format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

   // 만기일자
   $("#fincEndDt").kendoExtMaskedDatePicker({
        value:toDay
       ,format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

   // 간반차트에서 계약번호로 넘어 왔을 시.
   if("${orderNo}" != ""){
       reSearch("${orderNo}");
       $("#savedContractNo").val("${orderNo}");
   }

   /** 판매기회 정보 셋팅 **/
   var saleOpptNo = '${opptDS.saleOpptNo}';       // 판매기회 데이터
   if(saleOpptNo != ""){
       //판매기회번호
       $("#saleOpptNo").val(saleOpptNo);

       var cuTp =  '${opptDS.custTp}';
       $("#custTp").val(cuTp);
       if(cuTp == "02"){  // 법인
           $("#cust_01").hide();
           $("#cust_02").show();
           // 사업자 번호
       }else{            // 개인
           $("#cust_02").hide();
           $("#cust_01").show();
           // 이메일
       }

       $("#custCd_"+cuTp).val('${opptDS.custNo}');       // 고객코드
       $("#custNm_"+cuTp).val('${opptDS.custNm}');       // 고객명
       $("#telNo1_"+cuTp).val('${opptDS.hpNo}');         // 전화번호1
       $("#telNo2_"+cuTp).val('${opptDS.hpNo}');         // 전화번호2

       // 판매기회 고객의 대표주소
       $("#zipCd_"+cuTp).val('${opptAddr.zipCd}');         // 우편번호
       $("#addr1_"+cuTp).val('${opptAddr.sungNm}' +" "+'${opptAddr.cityNm}' +" "+'${opptAddr.distNm}');    // 주소1
       $("#addr2_"+cuTp).val('${opptAddr.addrDetlCont}');         // 주소2

       // 차종
       $("#carlineCd").data("kendoExtDropDownList").value('${opptDS.carlineCd}');

       // 모델 DataSource
       var modelResponseJson = dms.ajax.getJson({
           url:"<c:url value='/sal/cnt/contract/selectModel.do' />"
           ,data:JSON.stringify({"carlineCd":'${opptDS.carlineCd}'})
           ,async:false
       });
       $("#modelCd").data("kendoExtDropDownList").setDataSource(modelResponseJson.data);
       $("#modelCd").data("kendoExtDropDownList").enable(true);
       $("#modelCd").data("kendoExtDropDownList").value('${opptDS.modelCd}');

       // OCN DataSource
       var ocnResponseJson = dms.ajax.getJson({
           url:"<c:url value='/sal/cnt/contract/selectOcn.do' />"
           ,data:JSON.stringify({"carlineCd":'${opptDS.carlineCd}', "modelCd":'${opptDS.modelCd}'})
           ,async:false
       });
       $("#ocnCd").data("kendoExtDropDownList").setDataSource(ocnResponseJson.data);
       $("#ocnCd").data("kendoExtDropDownList").enable(true);
   }
   /** 판매기회 정보 셋팅 END **/

   // 메인 그리드
    $("#contGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/cnt/contract/selectContractSearch.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        // 딜러코드
                        params["sDlrCd"] = $("#sDlrCd").data("kendoExtDropDownList").value();
                        // 판매사원
                        params["sSaleEmpNo"] = $("#sSaleEmpNo").data("kendoExtDropDownList").value();
                        // 고객
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
                        //params["sStartContractDt"] = $("#sStartContractDt").val();
                        //params["sEndContractDt"]   = $("#sEndContractDt").val();

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
            ,batch:false
            ,schema:{
                model:{
                    id:"contractNo",
                    fields:{
                         dlrCd       :{type:"string", editable:false} //딜러코드
                        ,contractNo  :{type:"string"}                 //계약번호
                        ,contractTp  :{type:"string"}                 //계약유형
                        ,contractDt      :{type:"date"}               //계약일
                        ,contractStatCd  :{type:"string"}             //계약상태
                        ,saleEmpNo  :{type:"string"}                 //판매사원번호
                        ,contractCustNo:{type:"string"}               //계약고객번호
                        ,realDriverCustNo:{type:"string"}             //실제운전자고객번호
                        ,realDriverSameYn:{type:"string"}             //실제운전자동일여부
                        ,introDlrCd:{type:"string"}                   //소개딜러코드
                        ,carlineCd:{type:"string"}                    //차종코드

                        //차종명
                        ,carlineNm:{type:"string"}
                        //모델코드
                        ,modelCd:{type:"string"}
                        //모델명
                        ,modelNm:{type:"string"}
                        //OCN코드
                        ,ocnCd:{type:"string"}
                        //OCN명
                        ,ocnNm:{type:"string"}
                        //외장색상코드
                        ,extColorCd:{type:"string"}
                        //외장색
                        ,extColorNm:{type:"string"}
                        //내장색상코드
                        ,intColorCd:{type:"string"}
                        //내장색명
                        ,intColorNm:{type:"string"}
                        //2급딜러조직코드
                        ,lv2DlrOrdCd:{type:"string"}
                        //2급딜러조직
                        ,lv2DlrOrdNm:{type:"string"}
                        //2급딜러여부
                        ,lv2DlrYn:{type:"string"}
                        //판매기회번호
                        ,saleOpptNo:{type:"string"}
                        //용품계약번호
                        ,goodsContractNo:{type:"string"}
                        //탁송유형
                        ,consTp:{type:"string"}
                        //탁송우편번호
                        ,consZipCd:{type:"string"}
                        //탁송주소1
                        ,consAddr1:{type:"string"}
                        //탁송주소2
                        ,consAddr2:{type:"string"}
                        //탁송금액
                        ,consAmt:{type:"number"}
                        //과세유형
                        ,taxTp:{type:"string"}
                        //총금액
                        ,totAmt:{type:"number"}
                        //차량금액
                        ,carAmt:{type:"number"}
                        //할인금액
                        ,dcAmt:{type:"number"}
                        //용품총금액
                        ,goodsTotAmt:{type:"number"}
                        //증치세금액
                        ,vattaxAmt:{type:"number"}
                        //기타세금액
                        ,otherTaxAmt:{type:"number"}
                        //기타금액
                        ,otherAmt:{type:"number"}
                        //용품명
                        ,goodsNm:{type:"string"}
                        //용품금액
                        ,goodsAmt:{type:"number"}
                        //옵션금액
                        ,optionAmt:{type:"number"}
                        //계약금지불유형
                        ,contractAmtPayTp:{type:"string"}
                        //계약입금자명
                        ,contractPdpstNm:{type:"string"}
                        //계약영수증번호
                        ,contractRcptNo:{type:"string"}
                        //계약금액
                        ,contractAmt:{type:"number"}
                        //인도금지불유형
                        ,dlAmtPayTp:{type:"string"}
                        //인도금액
                        ,dlAmt:{type:"number"}
                        //등록유형
                        ,regTp:{type:"string"}
                        //등록지역코드
                        ,regDistCd:{type:"string"}
                        //등록명의자명
                        ,regNameNm:{type:"string"}
                        //등록부대금액
                        ,regSbodtAmt:{type:"number"}
                        //보험대행여부
                        ,incAapCd:{type:"string"}
                        //보험회사코드
                        ,incCmpCd:{type:"string"}
                        //보험가입일자
                        ,incJoinDt:{type:"date"}
                        //보험금액
                        ,incAmt:{type:"number"}
                        //금융요청여부
                        ,fincReqYn:{type:"string"}
                        //금융회사코드
                        ,fincCmpCd:{type:"string"}
                        //금융상품코드
                        ,fincItemCd:{type:"string"}
                        //금융요청일자
                        ,fincReqDt:{type:"date"}
                        //금융요청금액
                        ,fincReqAmt:{type:"number"}
                        //금융만기일자
                        ,fincEndDt:{type:"date"}
                        //견적번호
                        ,estimateNo:{type:"string"}
                        //중고차량매입여부
                        ,uatcCarPurcYn:{type:"string"}
                        //계약승인요청일자
                        ,contractApproveReqDt:{type:"date"}
                        //계약승인일자
                        ,contractApproveDt:{type:"date"}
                        //배정큐번호
                        ,allocQueNo:{type:"string"}
                        //배정일자
                        ,allocDt:{type:"date"}
                        //출고요청일자
                        ,eqDt:{type:"date"}

                        //출고일자
                        ,giDt:{type:"date"}
                        //인도요청일자
                        ,dlReqDt:{type:"date"}
                        //인도예정일자
                        ,dlScheDt:{type:"date"}
                        //실제인도일자
                        ,realDlDt:{type:"date"}

                        //인수자명
                        ,tovrNm:{type:"string"}
                        //인수자관계코드
                        ,tovrRelCd:{type:"string"}
                        //취소요청일자
                        ,cancReqDt:{type:"date"}
                        //취소일자
                        ,cancDt:{type:"date"}
                        //취소사유코드
                        ,cancReasonCd:{type:"string"}
                        ,retlTp:{type:"string"}         //소매유형
                        ,fileDocId:{type:"string"}      //파일문서ID
                        ,remark:{type:"string"}         //비고

                        ,regUsrId:{type:"string", editable:false}   //등록자ID
                        ,regDt:{type:"date", editable:false}        //등록일자
                        ,updtUsrId:{type:"string", editable:false}  //수정자ID
                        ,updtDt:{type:"date", editable:false}       //수정일자

                        ,custCd:{type:"string"}     // 계약자 고객 코드
                        ,custTp:{type:"string"}     // 계약자 고객유형
                        ,custNm:{type:"string"}     // 고객명
                        ,telNo1:{type:"string"}     // 전화번호1
                        ,telNo2:{type:"string"}     // 전화번호2
                        ,emailNm:{type:"string"}    // 이메일명
                        ,crnNo:{type:"string"}      // 사업자등록번호
                        ,zipCd:{type:"string"}      // 우편번호
                        ,addr1:{type:"string"}      // 주소1
                        ,addr2:{type:"string"}      // 주소2

                        ,drvCustCd:{type:"string"}      // 실운전자 고객코드
                        ,drvCustTp:{type:"string"}      // 계약자 고객유형
                        ,drvCustNm:{type:"string"}      // 고객명
                        ,drvTelNo1:{type:"string"}      // 전화번호1
                        ,drvTelNo2:{type:"string"}      // 전화번호2
                        ,drvEmailNm:{type:"string"}     // 이메일명
                        ,drvCrnNo:{type:"string"}       // 사업자등록번호
                        ,drvZipCd:{type:"string"}       // 우편번호
                        ,drvAddr1:{type:"string"}       // 주소1
                        ,drvAddr2:{type:"string"}       // 주소2

                        ,corpCarDstinCd:{type:"string"}     // 자사차량구분코드
                        ,brandCd:{type:"string"}            // 브랜드코드
                        ,useOthersModelNm:{type:"string"}   // 타사:모델명
                        ,useCarlineCd:{type:"string"}       // 차종코드
                        ,useCarlineNm:{type:"string"}       // 차종명
                        ,useModelCd:{type:"string"}         // 모델코드
                        ,useModelNm:{type:"string"}         // 모델명
                        ,useOcnCd:{type:"string"}           // OCN코드
                        ,useOcnNm:{type:"string"}           // OCN명
                        ,useExtColorCd:{type:"string"}      // 외장색상코드
                        ,useExtColorNm:{type:"string"}      // 외장색상
                        ,useIntColorCd:{type:"string"}      // 내장색상코드
                        ,useIntColorNm:{type:"string"}      // 내장색상
                        ,carRunDistVal:{type:"number"}      // 차량주행거리값
                        ,carNo:{type:"string"}              // 차량번호
                        ,vinNo:{type:"string"}              // 차대번호
                        ,carDrvMthCd:{type:"string"}        // 차량구동방식코드
                        ,fuelCd:{type:"string"}             // 연료코드
                        ,pcDstinCd:{type:"string"}          // 승상용구분코드
                        ,carLmtVal:{type:"number"}          // 차량정원값
                        ,carYyCd:{type:"string"}            // 차량연식코드
                        ,carDispQty:{type:"number"}         // 차량배기량
                        ,carRegDt:{type:"date"}             // 차량등록일자
                        ,evalScheDt:{type:"date"}           // 평가예정일자
                    }
                }
            }
        }
        ,dataBound:function(e) {
            // 저장시에만 계약번호가 1회 들어있음.
            var saveContNo = $("#savedContractNo").val();

            if(saveContNo != ""){
                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var dataItem = e.sender.dataItem(row);
                    if(dataItem.contractNo == saveContNo){
                        fn_contGridDBclick(dataItem);
                    }
                });
            }
            $("#savedContractNo").val("");      // 초기화
        }
       ,multiSelectWithCheckbox:false
       //,pageable:false
       ,pageable:{
           refresh:true
           ,pageSize:20
           ,pageSizes:[ "20", "40", "80", "100", "all" ]
       }
       ,height:160
       ,editable   :false
       ,resizable:true
       ,autoBind:true
       ,selectable:"row"
       ,navigatable:true
       ,sortable:false
       //,edit:onEditMainCd
       ,columns:[
          {field:"dlrCd",       title:"<spring:message code='global.lbl.dlrCd' />", hidden:true, width:100}       // 딜러코드

          ,{field:"contractNo", title:"<spring:message code='global.lbl.contractNo' />", width:150}                 //계약번호
          ,{field:"contractTp", title:"<spring:message code='global.lbl.contractType' />", hidden:true, width:10}      //계약유형
          ,{field:"contractDt", title:"<spring:message code='global.lbl.contractDt' />", attributes:{"class":"ac"}, width:90, format:"{0:"+vDtyyyyMMdd+"}"}                   //계약일
          ,{field:"contractStatCd", title:"<spring:message code='global.lbl.contractStat' />", attributes:{"class":"ac"}, width:90, template:"#=contractStatCdArray[contractStatCd]#" }    //계약상태
          ,{field:"saleEmpNo", title:"<spring:message code='global.lbl.saleEmpNo' />", hidden:true, width:10}    //판매사원번호
          ,{field:"contractCustNo", title:"<spring:message code='global.lbl.contractCustNo' />", width:150}             //계약고객번호
          ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", attributes:{"class":"ac"}, width:100}                       //고객명
          ,{field:"realDriverCustNo", title:"realDriverCustNo", hidden:true, width:100}           //실제운전자고객번호
          ,{field:"realDriverSameYn", title:"realDriverSameYn", hidden:true, width:100}           //실제운전자동일여부
          ,{field:"introDlrCd", title:"<spring:message code='global.lbl.introDlr' />", width:100}                      //소개딜러코드
          ,{field:"carlineCd", title:"carlineCd", hidden:true, width:100}        //차종코드
          ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", width:150}                          //차종명
          ,{field:"modelCd", title:"modelCd", hidden:true, width:10}            //모델코드
          ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:250}                             //모델명
          ,{field:"ocnCd", title:"ocnCd", hidden:true, width:10}                //OCN코드
          ,{field:"ocnNm", title:"OCN", width:220}                               //OCN명
          ,{field:"extColorCd", title:"extColorCd", hidden:true, width:10}     //외장색상코드
          ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />", width:180}                       //외장색
          ,{field:"intColorCd", title:"intColorCd", hidden:true, width:10}     //내장색상코드
          ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />", width:180}                       //내장색명

          ,{field:"lv2DlrOrdCd", hidden:true}       //2급딜러조직코드
          ,{field:"lv2DlrOrdNm", hidden:true}       //2급딜러조직
          ,{field:"lv2DlrYn", hidden:true}          //2급딜러여부
          ,{field:"saleOpptNo", hidden:true}       //판매기회번호
          ,{field:"goodsContractNo", hidden:true}   //용품계약번호
          //탁송유형
          ,{field:"consTp", hidden:true}
          //탁송우편번호
          ,{field:"consZipCd", hidden:true}
          //탁송주소1
          ,{field:"consAddr1", hidden:true}
          //탁송주소2
          ,{field:"consAddr2", hidden:true}
          //탁송금액
          ,{field:"consAmt", hidden:true}
          //과세유형
          ,{field:"taxTp", hidden:true}
          //총금액
          ,{field:"totAmt", hidden:true}
          //차량금액
          ,{field:"carAmt", hidden:true}
          //할인금액
          ,{field:"dcAmt", hidden:true}
          //용품총금액
          ,{field:"goodsTotAmt", hidden:true}
          //증치세금액
          ,{field:"vattaxAmt", hidden:true}
          //기타세금액
          ,{field:"otherTaxAmt", hidden:true}
          //기타금액
          ,{field:"otherAmt", hidden:true}
          //용품명
          ,{field:"goodsNm", hidden:true}
          //용품금액
          ,{field:"goodsAmt", hidden:true}
          //옵션금액
          ,{field:"optionAmt", hidden:true}
          //계약금지불유형
          ,{field:"contractAmtPayTp", hidden:true}
          //계약입금자명
          ,{field:"contractPdpstNm", hidden:true}
          //계약영수증번호
          ,{field:"contractRcptNo", hidden:true}
          //계약금액
          ,{field:"contractAmt", hidden:true}
          //인도금지불유형
          ,{field:"dlAmtPayTp", hidden:true}
          //인도금액
          ,{field:"dlAmt", hidden:true}
          //등록유형
          ,{field:"regTp", hidden:true}
          //등록지역코드
          ,{field:"regDistCd", hidden:true}
          //등록명의자명
          ,{field:"regNameNm", hidden:true}
          //등록부대금액
          ,{field:"regSbodtAmt", hidden:true}
          //보험대행여부
          ,{field:"incAapCd", hidden:true}
          //보험회사코드
          ,{field:"incCmpCd", hidden:true}
          //보험가입일자
          ,{field:"incJoinDt", hidden:true}
          //보험금액
          ,{field:"incAmt", hidden:true}
          //금융요청여부
          ,{field:"fincReqYn", hidden:true}
          //금융회사코드
          ,{field:"fincCmpCd", hidden:true}
          //금융상품코드
          ,{field:"fincItemCd", hidden:true}
          //금융요청일자
          ,{field:"fincReqDt", hidden:true}
          //금융요청금액
          ,{field:"fincReqAmt", hidden:true}
          //금융만기일자
          ,{field:"fincEndDt", hidden:true}
          //견적번호
          ,{field:"estimateNo", hidden:true}
          //중고차량매입여부
          ,{field:"uatcCarPurcYn", hidden:true}
          //계약승인요청일자
          ,{field:"contractApproveReqDt", hidden:true}
          //계약승인일자
          ,{field:"contractApproveDt", hidden:true}
          //배정큐번호
          ,{field:"allocQueNo", hidden:true}
          //배정일자
          ,{field:"allocDt", hidden:true}
          //출고요청일자
          ,{field:"giReqDt", hidden:true}

          //출고일자
          ,{field:"giDt", hidden:true}
          //인도요청일자
          ,{field:"dlReqDt", hidden:true}
          //인도예정일자
          ,{field:"dlScheDt", hidden:true}
          //실제인도일자
          ,{field:"realDlDt", hidden:true}

          //인수자명
          ,{field:"tovrNm", hidden:true}
          //인수자관계코드
          ,{field:"tovrRelCd", hidden:true}
          //취소요청일자
          ,{field:"cancReqDt", hidden:true}
          //취소일자
          ,{field:"cancDt", hidden:true}
          //취소사유코드
          ,{field:"cancReasonCd", hidden:true}
          //소매유형
          ,{field:"retlTp", hidden:true}
          //파일문서ID
          ,{field:"fileDocId", hidden:true}
          //비고
          ,{field:"remark", hidden:true}

          ,{field:"regUsrId", hidden:true}   //등록자ID
          ,{field:"regDt", hidden:true}       //등록일자
          ,{field:"updtUsrId", hidden:true}  //수정자ID
          ,{field:"updtDt", hidden:true}       //수정일자

          ,{field:"custCd", hidden:true}     // 계약자 고객 코드
          ,{field:"custTp", hidden:true}     // 계약자 고객유형
          ,{field:"custNm", hidden:true}     // 고객명
          ,{field:"telNo1", hidden:true}     // 전화번호1
          ,{field:"telNo2", hidden:true}     // 전화번호2
          ,{field:"emailNm", hidden:true}    // 이메일명
          ,{field:"crnNo", hidden:true}      // 사업자등록번호
          ,{field:"zipCd", hidden:true}      // 우편번호
          ,{field:"addr1", hidden:true}      // 주소1
          ,{field:"addr2", hidden:true}      // 주소2

          ,{field:"drvCustCd", hidden:true}      // 실운전자 고객코드
          ,{field:"drvCustTp", hidden:true}      // 계약자 고객유형
          ,{field:"drvCustNm", hidden:true}      // 고객명
          ,{field:"drvTelNo1", hidden:true}      // 전화번호1
          ,{field:"drvTelNo2", hidden:true}      // 전화번호2
          ,{field:"drvEmailNm", hidden:true}     // 이메일명
          ,{field:"drvCrnNo", hidden:true}       // 사업자등록번호
          ,{field:"drvZipCd", hidden:true}       // 우편번호
          ,{field:"drvAddr1", hidden:true}       // 주소1
          ,{field:"drvAddr2", hidden:true}       // 주소2

          ,{field:"corpCarDstinCd",   hidden:true}       // 자사차량구분코드
          ,{field:"brandCd",          hidden:true}       // 브랜드코드
          ,{field:"useOthersModelNm", hidden:true}       // 타사:모델명

          ,{field:"useCarlineCd",   hidden:true}       // 차종코드
          ,{field:"useCarlineNm",   hidden:true}       // 차종코드
          ,{field:"useModelCd",     hidden:true}       // 모델코드
          ,{field:"useModelNm",     hidden:true}       // 모델코드
          ,{field:"useOcnCd",       hidden:true}       // OCN코드
          ,{field:"useOcnNm",       hidden:true}       // OCN코드
          ,{field:"useExtColorCd",  hidden:true}       // 외장색상코드
          ,{field:"useExtColorNm",  hidden:true}       // 외장색상코드
          ,{field:"useIntColorCd",  hidden:true}       // 내장색상코드
          ,{field:"useIntColorNm",  hidden:true}       // 내장색상코드
          ,{field:"carRunDistVal",  hidden:true}       // 차량주행거리값
          ,{field:"carNo",          hidden:true}       // 차량번호
          ,{field:"vinNo",          hidden:true}       // 차대번호
          ,{field:"carDrvMthCd",    hidden:true}       // 차량구동방식코드
          ,{field:"fuelCd",         hidden:true}       // 연료코드
          ,{field:"pcDstinCd",      hidden:true}       // 승상용구분코드
          ,{field:"carLmtVal",      hidden:true}       // 차량정원값
          ,{field:"carYyCd",        hidden:true}       // 차량연식코드
          ,{field:"carDispQty",     hidden:true}       // 차량배기량
          ,{field:"carRegDt",       hidden:true}       // 차량등록일자
          ,{field:"evalScheDt",     hidden:true}       // 평가예정일자
       ]
   });


    // 그리드 더블클릭.
   $("#contGrid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#contGrid").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());
       fn_contGridDBclick(selectedItem);
   });

   // 그리드 주문번호 더블클릭.
   fn_contGridDBclick = function(selectedItem){
       if( selectedItem != null && selectedItem != 'undefined'){
           //refreshAll();    // from의 모든데이터 초기화

           $("#contractNo").val(selectedItem.contractNo);                             // 계약번호
           $("#contractDt").data("kendoExtMaskedDatePicker").value(selectedItem.contractDt);   // 계약일
           $("#contractDt").data("kendoExtMaskedDatePicker").enable(false);                    // 계약일 수정불가
           $("#contractStatCd").val(selectedItem.contractStatCd);                     // 계약상태
           fn_btnState(selectedItem.contractStatCd);                                  // 버튼숨김

           $("#saleOpptNo").val(selectedItem.saleOpptNo);     //판매기회번호
           $("#lv2DlrOrdCd").val(selectedItem.lv2DlrOrdCd);     //2급딜러조직코드
           $("#lv2DlrOrdNm").val(selectedItem.lv2DlrOrdNm);     //2급딜러조직
           $("#lv2DlrYn").data("kendoExtDropDownList").value(selectedItem.lv2DlrYn == "Y" ? "Y":"N");    //2급딜러여부
           $("#goodsContractNo").val(selectedItem.goodsContractNo);     //용품계약번호

           // 로컬옵션 grid 조회 - 검색조건:딜러코드, 계약번호
           //$("#localOptionGrid").data('kendoExtGrid').dataSource.read();

           // 입출금 grid 조회 [TOBE]


           /* 차량가격정보 세팅 */
           $("#carAmt").data("kendoExtNumericTextBox").value(selectedItem.carAmt != "null"? selectedItem.carAmt:"0.00");     // 차량가격
           $("#dcAmt").data("kendoExtNumericTextBox").value(selectedItem.dcAmt != "null"? selectedItem.dcAmt:"0.00");                    // 할인가격
           $("#goodsTotAmt").data("kendoExtNumericTextBox").value(selectedItem.goodsTotAmt != "null"? selectedItem.goodsTotAmt:"0.00");  // 용품가격
           $("#consAmt").data("kendoExtNumericTextBox").value(selectedItem.consAmt != "null"? selectedItem.consAmt:"0.00");              // 탁송료
           $("#regSbodtAmt").data("kendoExtNumericTextBox").value(selectedItem.regSbodtAmt != "null"? selectedItem.regSbodtAmt:"0.00");  // 부대비용
           $("#vattaxAmt").data("kendoExtNumericTextBox").value(selectedItem.vattaxAmt != "null"? selectedItem.vattaxAmt:"0.00");        // 증치세
           $("#otherTaxAmt").data("kendoExtNumericTextBox").value(selectedItem.otherTaxAmt != "null"? selectedItem.otherTaxAmt:"0.00");  // 기타세금

           $("#otherAmt").data("kendoExtNumericTextBox").value(selectedItem.otherAmt != "null"? selectedItem.otherAmt:"0.00");           // 기타금액


           /* 계약 고객정보 세팅 */
           var custTp = selectedItem.custTp;
           $("#custTp").val(custTp);       // 계약 고객유형
           /** 계약고객정보 **/
           if(custTp == "02"){  // 법인
               $("#cust_01").hide();
               $("#cust_02").show();
               $("#crnNo_"+custTp).val(selectedItem.crnNo);     // 사업자 번호
           }
           else{            // 개인
               $("#cust_02").hide();
               $("#cust_01").show();
               $("#emailNm_"+custTp).val(selectedItem.emailNm);     // 이메일
           }

           $("#custCd_"+custTp).val(selectedItem.custCd);       // 고객코드
           $("#custNm_"+custTp).val(selectedItem.custNm);       // 고객명
           $("#telNo1_"+custTp).val(selectedItem.telNo1);       // 전화번호1
           $("#telNo2_"+custTp).val(selectedItem.telNo2);       // 전화번호2
           $("#zipCd_"+custTp).val(selectedItem.zipCd);         // 우편번호
           $("#addr1_"+custTp).val(selectedItem.addr1);         // 주소1
           $("#addr2_"+custTp).val(selectedItem.addr2);         // 주소2


           /* 실운전자 정보 세팅 */
           // 실운전자 동일여부
           if(selectedItem.realDriverSameYn == "Y"){
               $("#realDriverSame").prop('checked', true);
           }else{
               $("#realDriverSame").prop('checked', false);
           }

           var drvCustTp = selectedItem.drvCustTp;
           $("#drvCustTp").val(drvCustTp);                   // 실운전자 고객유형

           if(drvCustTp == "02"){  // 법인
               $("#drvCust_01").hide();
               $("#drvCust_02").show();
               $("#drvCrnNo_02").val(selectedItem.drvCrnNo);     // 사업자 번호
           }
           else{            // 개인
               $("#drvCust_02").hide();
               $("#drvCust_01").show();
               $("#drvEmailNm_01").val(selectedItem.drvEmailNm);     // 이메일
           }

           $("#drvCustCd_"+drvCustTp).val(selectedItem.drvCustCd);       // 고객코드
           $("#drvCustNm_"+drvCustTp).val(selectedItem.drvCustNm);       // 고객명
           $("#drvTelNo1_"+drvCustTp).val(selectedItem.drvTelNo1);       // 전화번호1
           $("#drvTelNo2_"+drvCustTp).val(selectedItem.drvTelNo2);       // 전화번호2
           $("#drvZipCd_"+drvCustTp).val(selectedItem.drvZipCd);         // 우편번호
           $("#drvAddr1_"+drvCustTp).val(selectedItem.drvAddr1);         // 주소1
           $("#drvAddr2_"+drvCustTp).val(selectedItem.drvAddr2);         // 주소2

           /* 차량및 탁송정보 세팅 */
           if(selectedItem.carlineCd != null &&  selectedItem.carlineCd != ""){
               $("#carlineCd").data("kendoExtDropDownList").value(selectedItem.carlineCd); // 차종
           }

           if(selectedItem.modelCd != null &&  selectedItem.modelCd != ""){
               var modelCd = $("#modelCd").data("kendoExtDropDownList");
               modelCd.setDataSource([{modelNm:selectedItem.modelNm, modelCd:selectedItem.modelCd}]);
               modelCd.enable(true);
               modelCd.value(selectedItem.modelCd); // 모델
           }

           if(selectedItem.ocnCd != null &&  selectedItem.ocnCd != ""){
               var ocnCd = $("#ocnCd").data("kendoExtDropDownList");
               ocnCd.setDataSource([{ocnNm:selectedItem.ocnNm, ocnCd:selectedItem.ocnCd}]);
               ocnCd.enable(true);
               ocnCd.value(selectedItem.ocnCd); // OCN
           }

           if(selectedItem.extColorCd != null &&  selectedItem.extColorCd != ""){
               var extColorCd = $("#extColorCd").data("kendoExtDropDownList");
               extColorCd.setDataSource([{extColorNm:selectedItem.extColorNm, extColorCd:selectedItem.extColorCd}]);
               extColorCd.enable(true);
               extColorCd.value(selectedItem.extColorCd); // 외장색
           }

           if(selectedItem.intColorCd != null &&  selectedItem.intColorCd != ""){
               var intColorCd = $("#intColorCd").data("kendoExtDropDownList");
               intColorCd.setDataSource([{intColorNm:selectedItem.intColorNm, intColorCd:selectedItem.intColorCd}]);
               intColorCd.enable(true);
               intColorCd.value(selectedItem.intColorCd); // 내장색
           }

           // 프로모션 grid 조회 - 검색조건:딜러코드, 모델명, 계약일자
           $("#promotionGrid").data('kendoExtGrid').dataSource.read();

           if(selectedItem.contractTp != null &&  selectedItem.contractTp != ""){
               $("#contractTp").data("kendoExtDropDownList").value(selectedItem.contractTp); // 계약유형
           }

           if(selectedItem.taxTp != null &&  selectedItem.taxTp != ""){
               $("#taxTp").data("kendoExtDropDownList").value(selectedItem.taxTp);     // 과세구분
           }

           $("#dlReqDt").data("kendoExtMaskedDatePicker").value(selectedItem.dlReqDt);   // 인도요청일

           if(selectedItem.consTp != null &&  selectedItem.consTp != ""){
               $("#consTp").data("kendoExtDropDownList").value(selectedItem.consTp);     // 탁송구분

               // 탁송:C , 방문:I
               if(selectedItem.consTp == "I"){
                   $("#tabConsTp").hide();
               }else{
                   $("#tabConsTp").show();
               }
           }

           // 탁송료
           $("#tConsAmt").data("kendoExtNumericTextBox").value(selectedItem.consAmt);
           // 탁송지
           $("#consZipCd").val(selectedItem.consZipCd);
           $("#consAddr1").val(selectedItem.consAddr1);
           $("#consAddr2").val(selectedItem.consAddr2);

           /* 용품정보 세팅 */
           $("#goodsNm").val(selectedItem.goodsNm);                                     // 용품명
           $("#goodsAmt").data("kendoExtNumericTextBox").value(selectedItem.goodsAmt);     // 용품금액
           $("#optionAmt").val(selectedItem.optionAmt);                                 // 로컬옵션 금액

           /* 차량대금 지불방법 */
           $("#contractPdpstNm").val(selectedItem.contractPdpstNm);                                //계약입금자명
           $("#contractAmt").data("kendoExtNumericTextBox").value(selectedItem.contractAmt);          // 계약금액
           $("#contractAmtPayTp").data("kendoExtDropDownList").value(selectedItem.contractAmtPayTp);  //계약금지불유형
           $("#contractRcptNo").val(selectedItem.contractRcptNo);                                  //계약영수증번호
           $("#dlAmt").data("kendoExtNumericTextBox").value(selectedItem.dlAmt);                      // 인도금액
           $("#dlAmtPayTp").data("kendoExtDropDownList").value(selectedItem.dlAmtPayTp);              // 인도금지불유형

           /* 중고차 보상판매 */
           // 중고차 매입 여부   ????
           if(selectedItem.uatcCarPurcYn == "Y"){
               $("#uatcCarPurc").prop('checked', true);
           }else{
               $("#uatcCarPurc").prop('checked', false);
           }
           bf_uatcCarPurc();        // 중고차 보상판매.

           // 중고차 자사 여부
           var corpCarDstinCd = selectedItem.corpCarDstinCd;
           if(corpCarDstinCd == "01"){  // 자사
               $(".group-others").hide();
               $(".group-ours").show();

               //차종
               var useCarlineCd = $("#useCarlineCd").data("kendoExtDropDownList");
               //useCarlineCd.setDataSource([{carlineNm:selectedItem.useCarlineNm, carlineCd:selectedItem.useCarlineCd}]);
               //useCarlineCd.select(0);
               useCarlineCd.value(selectedItem.useCarlineCd);


               //모델
               var useModelCd = $("#useModelCd").data("kendoExtDropDownList");
               useModelCd.setDataSource([{modelNm:selectedItem.useModelNm, modelCd:selectedItem.useModelCd}]);
               useModelCd.select(0);

               //OCN
               var useOcnCd = $("#useOcnCd").data("kendoExtDropDownList");
               useOcnCd.setDataSource([{useOcnNm:selectedItem.useOcnNm, useOcnCd:selectedItem.useOcnCd}]);
               useOcnCd.select(0);

               //외장색
               var useExtColorCd = $("#useExtColorCd").data("kendoExtDropDownList");
               useExtColorCd.setDataSource([{useExtColorNm:selectedItem.useExtColorNm, useExtColorCd:selectedItem.useExtColorCd}]);
               useExtColorCd.select(0);

               //내장색
               var useIntColorCd = $("#useIntColorCd").data("kendoExtDropDownList");
               useIntColorCd.setDataSource([{useIntColorNm:selectedItem.useIntColorNm , useIntColorCd:selectedItem.useIntColorCd}]);
               useIntColorCd.select(0);


           }else{
               $(".group-ours").hide();
               $(".group-others").show();

               // 브랜드:타사인 경우
               $("#brandCd").data("kendoExtDropDownList").value(selectedItem.brandCd);
               // 모델명:타사인 경우.
               $("#useOthersModelNm").val(selectedItem.useOthersModelNm);
           }

           // 자사/타사
           $("#corpCarDstinCd").data("kendoExtDropDownList").value(corpCarDstinCd);

           // 차량번호
           $("#carNo").val(selectedItem.carNo);
           // 차대번호
           $("#vinNo").val(selectedItem.vinNo);
           // 차량주행거리값
           $("#carRunDistVal").data("kendoExtNumericTextBox").value(selectedItem.carRunDistVal);
           //차량배기량
           $("#carDispQty").data("kendoExtNumericTextBox").value(selectedItem.carDispQty);
           //차량구동방식
           $("#carDrvMthCd").data("kendoExtDropDownList").value(selectedItem.carDrvMthCd);
           //연료
           $("#fuelCd").data("kendoExtDropDownList").value(selectedItem.fuelCd);
           //승상용구분코드
           $("#pcDstinCd").data("kendoExtDropDownList").value(selectedItem.pcDstinCd);
           // 차량정원값
           $("#carLmtVal").data("kendoExtNumericTextBox").value(selectedItem.carLmtVal);
           //차량연식
           if(selectedItem.carYyCd != null){
               $("#carYyCd").val((selectedItem.carYyCd).length == 6 ? (selectedItem.carYyCd).substring(0,4)+'-'+(selectedItem.carYyCd).substring(4,6):selectedItem.carYyCd);
           }else{
               $("#carYyCd").val('');
           }

           //차량등록일자
           $("#carRegDt").data("kendoExtMaskedDatePicker").value(selectedItem.carRegDt);
           //평가예정일자
           $("#evalScheDt").data("kendoExtMaskedDatePicker").value(selectedItem.evalScheDt);


           /* 차량등록정보 */
           if(selectedItem.regTp == "A"){       // 대행
               $("#tabRegTp01").click();
           }else{                               // 본인
               $("#tabRegTp02").click();
           }
           $("#regDistCd").data("kendoExtDropDownList").value(selectedItem.regDistCd);            // 등록지역코드
           $("#regNameNm").val(selectedItem.regNameNm);                                        // 등록명의자
           $("#tRegSbodtAmt").data("kendoExtNumericTextBox").value(selectedItem.regSbodtAmt);     // 등록부대금액

           /* 보험정보 */
           if(selectedItem.incAapCd == "A"){       // 대행
               $("#incAapCd01").click();
           }else{                               // 본인
               $("#incAapCd02").click();
           }

           $("#incCmpCd").data("kendoExtDropDownList").value(selectedItem.incCmpCd);  //보험회사코드
           $("#incJoinDt").data("kendoExtMaskedDatePicker").value(selectedItem.incJoinDt);   // 보험가입일자
           $("#incAmt").data("kendoExtNumericTextBox").value(selectedItem.incAmt);      // 보험금액

           /* 금융정보 */
           if(selectedItem.fincReqYn == "Y"){
               $("#fincReq").prop('checked', true);
           }else{
               $("#fincReq").prop('checked', false);
           }
           bf_fincReq();

           $("#fincCmpCd").data("kendoExtDropDownList").value(selectedItem.fincCmpCd);     //금융회사코드
           $("#fincItemCd").data("kendoExtDropDownList").value(selectedItem.fincItemCd);   //금융상품코드
           $("#fincReqAmt").data("kendoExtNumericTextBox").value(selectedItem.fincReqAmt); // 금융요청금액
           $("#fincReqDt").data("kendoExtMaskedDatePicker").value(selectedItem.fincReqDt);       // 금융요청일자
           $("#fincEndDt").data("kendoExtMaskedDatePicker").value(selectedItem.fincEndDt);       // 금융만기일자

           /* 파일업로드 */
           $("#fileDocId").val(selectedItem.fileDocId);    // 파일 문서 번호

           $("#fileGrid").data("kendoExtGrid").dataSource.read();


           /* 비고 */
           $("#remark").val(selectedItem.remark);
           // 견적번호 세팅
           $("#estimateNo").val(selectedItem.estimateNo);

           bf_sumCarAmt();  // 차량가격정보 계산
       }
   }

   // 로컬옵션 그리드
   // 체크 이벤트 발생시 모든 합 계산하여 을 optionAmt에 넣어줘야 된다.
   // 후, bf_sumCarAmt() 실행.
   $("#localOptionGrid").kendoExtGrid({
       dataSource:{
           transport:{
               read:{
                   url:"<c:url value='/sal/cnt/contract/selectOptionSearch.do' />"
               },
               parameterMap:function(options, operation) {
                   if (operation === "read") {
                       var params = {};

                       // 딜러코드
                       params["sDlrCd"] = $("#sDlrCd").data("kendoExtDropDownList").value();
                       // 판매사원
                       //params["sSaleEmpNo"] = $("#sSaleEmpNo").data("kendoExtDropDownList").value();
                       // 계약번호
                       params["sContractNo"] = $("#contractNo").val();

                       //console.log('localOptionGrid:params:',kendo.stringify(params) );
                       return kendo.stringify(params);

                   }else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,batch:false
           ,schema:{
               model:{
                   id:"seq",
                   fields:{
                        dlrCd       :{type:"string", editable:false} //딜러코드
                       ,contractNo  :{type:"string", editable:false} //계약번호
                       ,seq         :{type:"string", editable:false} //seq
                       ,optionCd    :{type:"string", editable:true}
                       ,optionNm    :{type:"string", editable:false}
                       ,optionAmt   :{type:"number", editable:true}  // 금액
                   }
               }
           }
          // ,aggregate:[ { field:"optionAmt", aggregate:"sum" } ]
       }
      ,multiSelectWithCheckbox:true
      ,pageable:false
      ,height:120
      ,editable:{
           mode:"incell"
          ,confirmation:false
       }
      ,edit:function(e){
          var cell = e.container.find("input");
          var fieldName;
          if(cell.length > 1){
              fieldName = cell[cell.length-1].getAttribute("name");
          }else{
              fieldName = cell.attr("name");
          }

          if(fieldName === "optionAmt"){
               this.closeCell();
          }
      }
      ,resizable:true
      ,autoBind:false
      //,selectable:"multiple, row"
      //,navigatable:true
      ,sortable:false
      ,columns:[
          {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true, width:100}       // 딜러코드
         ,{field:"contractNo", title:"<spring:message code='global.lbl.contractNo' />", width:100, attributes:{"class":"ac"}, hidden:true}                 //계약번호
         ,{field:"seq", title:"<spring:message code='global.lbl.seq' />", width:100, hidden:true}       //일련번호
         ,{field:"optionCd", title:"<spring:message code='global.lbl.localOption' />", width:100
             , headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
             , template:"#= bf_selectLocalOption(optionCd, optionNm) #"
             , editor:function (container, options){

                 if(options.model.optionCd == ""){
                     $('<input required name="optionCd" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         autoBind:false
                         ,dataTextField:"optionNm"
                         ,dataValueField:"optionCd"
                         ,dataSource:selectOptionGridDSList
                         ,select:function(e){
                             var dataItem = this.dataItem(e.item);

                             var grid = $("#localOptionGrid").data("kendoExtGrid");
                             //var rows = grid.tbody.find("tr");
                             var row  = grid.select();
                             var uid  = row[0].attributes["data-uid"].nodeValue;
                             var dataSourceRow = grid.dataSource.getByUid(uid);

                             dataSourceRow.set("optionAmt", dataItem.salePrc);     // 로컬옵션 판매 금액

                             //var opATot = Number($("#optionAmt").val()) + Number(dataItem.salePrc);
                             //$("#optionAmt").val(opATot);       // 로컬옵션 합계금액
                             bf_addLocaloptionAmt();

                             bf_sumCarAmt();                    // 계산
                         }
                     });
                 }else{
                     if(options.model.modelNm != ""){
                         container.context.innerText = options.model.optionNm;
                     }else{
                         container.context.innerText = selectOptionGridArray.length < 1 ? "":selectOptionGridArray[options.model.modelCd];
                     }
                 }
             }
         }      // 물푼코드
         ,{field:"optionNm", title:"<spring:message code='global.lbl.localOption' />", width:100, hidden:true}
         ,{  // 금액
             field:"optionAmt"
            , title:"<spring:message code='global.lbl.amt' />"
            , width:100
            , format:"{0:n2}"
            , attributes:{"class":"ar"}
            , editable:false
          }
         ,{field:"instReqDt", title:"instReqDt", width:100, hidden:true}        // 장착요청일자
         ,{field:"regUsrId", title:"regUsrId", width:100, hidden:true}
         ,{field:"regDt", title:"regDt", width:100, hidden:true}
         ,{field:"updtUsrId", title:"updtUsrId", width:100, hidden:true}
         ,{field:"updtDt", title:"updtDt", width:100, hidden:true}
      ]
   });

   // 프로모션 그리드
   $("#promotionGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/cnt/contract/selectPromotionSearch.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        // 딜러코드
                        params["sDlrCd"] = $("#sDlrCd").data("kendoExtDropDownList").value();

                        if(onSelectModel != ""){
                            params["sModelCd"] = onSelectModel;
                            onSelectModel = "";
                        }else{
                            params["sModelCd"] = $("#modelCd").data("kendoExtDropDownList").value();
                        }
                        params["sStartContractDt"] = $("#contractDt").data("kendoExtMaskedDatePicker").value();   // 계약일
                        params["sContractNo"] = $("#contractNo").val();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch:false
            ,requestEnd:function(e){
                if(e.type =="read" && e.response.total > 0){
                    //console.log(e.sender._data);
                }
            }
            ,schema:{
                model:{
                    id:"promotionCd",
                    fields:{
                           promotionCd :{type:"string"}
                         , promotionNm:{type:"string"}
                         , promotionTp:{type:"string"}
                         , modelCd    :{type:"string"}
                         , startDt    :{type:"date"}
                         , endDt      :{type:"date"}
                         , applyTp    :{type:"string"}
                         , promotionAmt:{type:"number"}
                         , imsBudnRate:{type:"number"}
                         , dlrBudnRate:{type:"number"}
                         , contractTp :{type:"string"}
                    }
                }
            }
        }
       ,multiSelectWithCheckbox:false
       ,height:140
       ,pageable:false
       ,editable:false
       ,resizable:true
       ,selectable:"multiple, row"
       ,autoBind:false
       ,sortable:false
       ,columns:[
            {field:"promotionCd",  width:10, hidden:true} //프로모션
           ,{       // 표시
                field:"chk", title:"<spring:message code='global.lbl.chk' />", width:45
               ,headerAttributes:{style:"text-align:center;"}
               ,attributes:{style:"text-align:center;"}
               ,template:'<input type="checkbox" class="checkbox" onclick="bf_checkPromotion(this, \'#= promotionCd #\')" id="chkYn" #= chkYn=="Y"? checked="checked":"" #  />'
            }
           ,{field:"promotionNm", title:"<spring:message code='global.lbl.promotionNm' />", width:150, attributes:{"class":"al"}} //프로모션명
           ,{field:"promotionTp",  title:"<spring:message code='global.lbl.promotionType' />", width:130, attributes:{"class":"al"},template:"#= promotionTpObj[promotionTp] #"} //프로모션 유형
           ,{field:"modelCd", width:10, hidden:true}
           ,{field:"startDt",     title:"<spring:message code='global.lbl.startDt' />", hidden:true} //시작일
           ,{field:"endDt",       title:"<spring:message code='global.lbl.EndDt' />", hidden:true} //종료일
           ,{field:"applyTp",     title:"<spring:message code='global.lbl.applyTp' />", width:80, attributes:{"class":"ac"}, template:"#= applyTpObj[applyTp] #"} //적용방법
           ,{field:"promotionAmt",title:"<spring:message code='global.lbl.amt' />/<spring:message code='global.lbl.dcRate' />", width:100,  attributes:{"class":"ar"},format:"{0:##,###.0}"} //금액/할인율
           ,{field:"imsBudnRate", hidden:true}
           ,{field:"dlrBudnRate", hidden:true}
           ,{field:"contractTp", hidden:true}
       ]
   });

   $("#promotionGrid").data("kendoExtGrid").table.on("click", ".checkbox" , selectRow);

   function selectRow() {

       var checked = this.checked,
       row = $(this).closest("tr"),
       grid = $("#promotionGrid").data("kendoExtGrid"),
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

   /*
   // 입출금내역
   $("#payGrid").kendoExtGrid({});
   */


   // 파일 그리드 시작 //
   $("#fileGrid").kendoExtGrid({
       dataSource:{
           transport:{
               read:{
                   url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
               },
               parameterMap:function(options, operation) {
                   if (operation === "read") {
                       var params = {};
                       params["sFileDocNo"] = $("#fileDocId").val();

                       return kendo.stringify(params);
                   }else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema:{
               model:{
                   fields:{
                       fileDocNo:{type:"string"}
                       ,fileNo:{type:"number"}
                       ,fileNm:{type:"string"}
                       ,fileSize:{type:"number"}
                   }
               }
           }
       }
      ,change:function(e){
          var dataItem = this.dataItem(this.select());

          if(dms.string.isNotEmpty(dataItem)){
              dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
          }
      }
      ,autoBind:false
      ,editable:false
      ,height:80
      ,multiSelectWithCheckbox:true
      ,navigatable:false
      ,pageable:false
      ,resizable:false
      ,sortable:false
      ,columns:[
          {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />" }           // 파일명
         ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />" }       // 파일크기
         ,{title:""}

      ]
   });
   // 파일 그리드 종료 //


   fnOnfocus = function(id){
       $("#"+ id +" ").select();
   }


});

//-->
</script>
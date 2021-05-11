<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

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

<!-- 중고차 계약품의관리 -->
<section class="group">
	<div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.usedCarContract' /></h1> <!-- 중고차 계약품의관리 -->
        <div class="btn_right">
            <button id="btnPayPrint" class="btn_m" style="display:none"><spring:message code='sal.btn.payPrint' /></button>         <!-- 결산서출력 -->
            <button id="btnContPrint" class="btn_m" style="display:none"><spring:message code='sal.btn.contPrint' /></button>       <!-- 계약서출력 -->
            <button id="btnCancel" class="btn_m" style="display:none"><spring:message code='global.lbl.contractCancel' /></button>  <!-- 계약취소 -->
            <button id="btnCreate" class="btn_m" style="display:none"><spring:message code='sal.btn.contractCreate' /></button>     <!-- 계약생성 -->
            <button id="btnRemove" class="btn_m" style="display:none"><spring:message code='global.lbl.contractDel' /></button>     <!-- 계약삭제 -->
            <button id="btnRefresh" class="btn_m btn_new"><spring:message code='global.btn.new' /></button>         <!-- 신규 -->
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
            <button id="btnSave" class="btn_m btn_save"><spring:message code='global.btn.save' /></button>          <!-- 저장 -->
            <button id="btnUpdate" class="btn_m btn_modify" style="display:none"><spring:message code='global.btn.update' /></button> <!-- 수정 -->
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
                    <td class="readonly_area">
                        <input id="sSaleEmpNo" readonly class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="sContractCustNo" class="form_input">
                                    <a href="javascript:bf_searchCustomer('search');"><spring:message code='global.lbl.search' /></a>       <!-- 검색 -->
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sContractCustNm" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractStat' /></th>      <!-- 계약상태 -->
                    <td>
                        <input id="sContractStatCd" class="form_comboBox" />
                    </td>
                </tr>
				<tr>
                    <th scope="row"><spring:message code='global.lbl.contractNo' /></th>        <!-- 계약번호 -->
                    <td>
                        <input id="sContractNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.corpCarDstin' /></th>         <!-- 자사차여부 -->
                    <td>
                        <input id="sCorpCarDstinCd" class="form_comboBox" />
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
			</tbody>
		</table>
	</div>

    <!-- 계약내역 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="contGrid"></div>
    </div>
    <!-- 계약내역 그리드 종료 -->
</section>
<!-- //중고차 계약품의관리 -->

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
                            <input id="contractNo" name="contractNo" class="form_input form_readonly" readonly data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.contractDt' /></th>        <!-- 계약일자 -->
                        <td>
                            <input id="contractDt" name="contractDt" class="form_datepicker" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.lv2DlrYn' /></th>        <!-- 2급딜러여부 -->
                        <td>
                            <div class="form_float">
                                <div class="form_left" style="width:24%;">
                                    <input id="lv2DlrYn" name="lv2DlrYn" class="form_comboBox" data-json-obj="true">
                                </div>
                                <div class="form_left" style="width:40%;">
                                    <div class="form_search">
                                        <input id="lv2DlrOrgCd" name="lv2DlrOrgCd" class="form_input" data-json-obj="true">
                                        <!-- 개발진행 예정중입니다. -->
                                        <a href="javascript:alert('<spring:message code='global.info.developIng' />')"><spring:message code='global.btn.search' /></a>       <!-- 조회 -->
                                    </div>
                                </div>
                                <div class="form_right" style="width:36%;">
                                    <input id="lv2DlrOrgNm" readonly class="form_input form_readonly" />
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.salesMngNo' /></th> <!-- 영업대표 -->
                        <td>
                            <input id="saleMngNo" name="saleMngNo" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.payTp' /></th>   <!-- 지불방식 -->
                        <td>
                            <input id="payTp" name="payTp" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.dlReqDt' /></th>   <!-- 인도요청일 -->
                        <td>
                            <input id="dlReqDt" name="dlReqDt" class="form_datepicker" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.salPrsnNm' /></th>   <!-- 판매담당자 -->
                        <td>
                            <input id="saleEmpNo" name="saleEmpNo" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"></th>
                        <td colspan="3"></td>
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
                        <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                        <td colspan="3">
                            <div class="form_float">
                                <div class="form_left">
                                    <div class="form_search">
                                        <input id="custNo_01" readonly class="form_input">
                                        <a href="javascript:bf_searchCustomer('cust');"><spring:message code='global.btn.search' /></a>     <!-- 검색 -->
                                    </div>
                                </div>
                                <div class="form_right">
                                    <input id="custNm_01" readonly class="form_input form_readonly" />
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.custTp' /></th>   <!-- 고객유형 -->
                        <td>
                            <input value="<spring:message code='global.lbl.personal' />" readonly class="form_input form_readonly ac">       <!-- 개인 -->
                        </td>
                        <td colspan="4"></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.ssnCrnTp' /></th>  <!-- 신분증유형 -->
                        <td>
                            <input id="mathDocTp_01" readonly class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.ssnCrnNo' /></th>   <!-- 증서번호 -->
                        <td colspan="3">
                            <input id="ssnCrnNo_01" readonly class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='par.lbl.telNo' /></th>        <!-- 대표전화번호 -->
                        <td>
                            <input id="telNo1_01" readonly class="form_input"/>
                            <input type="hidden" id="telNo2_01">                            <!-- 전화번호2 화면에 없음 -->
                        </td>
                        <th scope="row"><spring:message code='global.lbl.emailNm' /></th>       <!-- 이메일 -->
                        <td>
                            <input id="emailNm_01" readonly class="form_input" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.sung' /></th>  <!-- 성 -->
                        <td>
                            <input id="sungNm_01" readonly class="form_input" />
                            <input type="hidden" id="sungCd_01" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.cityCd' /></th>  <!-- 시 -->
                        <td>
                            <input id="cityNm_01" readonly class="form_input" />
                            <input type="hidden" id="cityCd_01" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.dist' /></th>  <!-- 구 -->
                        <td>
                            <input id="distNm_01" readonly class="form_input" />
                            <input type="hidden" id="distCd_01" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.zipCd' /></th>      <!-- 우편번호 -->
                        <td>
                            <input id="zipCd_01" readonly class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.detlAddr' /></th>   <!-- 상세주소 -->
                        <td>
                            <input id="addrDetlCont_01" readonly class="form_input" />
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
                        <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                        <td colspan="3">
                            <div class="form_float">
                                <div class="form_left">
                                    <div class="form_search">
                                        <input id="custNo_02" readonly class="form_input">
                                        <a href="javascript:bf_searchCustomer('cust');"><spring:message code='global.btn.search' /></a>     <!-- 검색 -->
                                    </div>
                                </div>
                                <div class="form_right">
                                    <input id="custNm_02" readonly class="form_input form_readonly" />
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.custTp' /></th>       <!-- 고객유형 -->
                        <td>
                            <input value="<spring:message code='global.lbl.corporation' />" readonly class="form_input form_readonly ac">        <!-- 법인 -->
                        </td>
                        <td colspan="4"></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.corpSsnCrnTp' /></th>       <!-- 법인유형 -->
                        <td>
                            <input id="mathDocTp_02" readonly class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.ssnCrnNo' /></th>         <!-- 증서번호 -->
                        <td colspan="3">
                            <input id="ssnCrnNo_02" readonly class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='par.lbl.telNo' /></th>            <!-- 회사전화번호 -->
                        <td>
                            <input id="telNo1_02" readonly class="form_input" />
                            <input type="hidden" id="telNo2_02" />    <!-- 전화번호2 화면에 없음 -->

                        </td>
                        <th scope="row"><spring:message code='global.lbl.emailNm' /></th>       <!-- 이메일 -->
                        <td>
                            <input id="emailNm_02" readonly class="form_input" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.sung' /></th>  <!-- 성 -->
                        <td>
                            <input id="sungNm_02" readonly class="form_input" />
                            <input type="hidden" id="sungCd_02" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.cityCd' /></th>  <!-- 시 -->
                        <td>
                            <input id="cityNm_02" readonly class="form_input" />
                            <input type="hidden" id="cityCd_02" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.dist' /></th>  <!-- 구 -->
                        <td>
                            <input id="distNm_02" readonly class="form_input" />
                            <input type="hidden" id="distCd_02" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.zipCd' /></th>      <!-- 우편번호 -->
                        <td>
                            <input id="zipCd_02" readonly class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.detlAddr' /></th>   <!-- 상세주소 -->
                        <td>
                            <input id="addrDetlCont_02" readonly class="form_input" />
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
                    <col style="width:10%;">
                    <col style="width:12%;">
                    <col style="width:8%;">
                    <col style="width:12%;">
                    <col style="width:9%;">
                    <col style="width:13%;">
                    <col style="width:9%;">
                    <col style="width:27%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.vinNum" /></th>    <!-- VIN NO -->
                        <td>
                            <div class="form_search">
                                <input id="vinNo" name="vinNo" readonly class="form_input" data-json-obj="true" />
                                <a href="javascript:bf_searchVinNo();"><spring:message code='global.btn.search' /></a>     <!-- 검색 -->
                            </div>
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.corpCarDstin' /></th>         <!-- 자사차여부 -->
                        <td>
                            <input id="corpCarDstinNm" readonly class="form_input form_readonly" />
                            <input type="hidden" id="corpCarDstinCd" name="corpCarDstinCd" readonly class="form_input form_readonly" data-json-obj="true" />
                        </td>
                        <th scope="row"></th>
                        <td colspan="3"></td>
                    </tr>
                    <tr class="corpCar_01">
                        <th scope="row"><spring:message code='global.lbl.carLine' /></th>                           <!-- 차종 -->
                        <td>
                            <input id="carlineNm" readonly class="form_input form_readonly" />
                            <input type="hidden" id="carlineCd" name="carlineCd" readonly class="form_input form_readonly" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.model' /></th>                             <!-- 모델 -->
                        <td>
                            <input id="modelNm" readonly class="form_input form_readonly" />
                            <input type="hidden" id="modelCd" name="modelCd" readonly class="form_input form_readonly" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.ocn' /></th>                               <!-- OCN -->
                        <td>
                            <input id="ocnNm" readonly class="form_input form_readonly" />
                            <input type="hidden" id="ocnCd" name="ocnCd" readonly class="form_input form_readonly" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.extColor' /></th>                          <!-- 외장색 -->
                        <td>
                            <input id="extColorNm" readonly class="form_input form_readonly" />
                            <input type="hidden" id="extColorCd" name="extColorCd" readonly class="form_input form_readonly" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr class="corpCar_01">
                        <th scope="row"><spring:message code='global.lbl.intColor' /></th>                          <!-- 내장색 -->
                        <td>
                            <input id="intColorNm" readonly class="form_input form_readonly" />
                            <input type="hidden" id="intColorCd" name="intColorCd" readonly class="form_input form_readonly" data-json-obj="true" />
                        </td>
                        <th scope="row"></th>
                        <td colspan="5"></td>
                    </tr>
                    <tr class="corpCar_02">
                        <th scope="row"><spring:message code='global.lbl.brand' /></th>    <!-- 브랜드 -->
                        <td>
                            <input id="carBrandNm" readonly class="form_input form_readonly" />
                            <input type="hidden" id="carBrandCd" name="carBrandCd" readonly class="form_input form_readonly" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.carNm' /></th>    <!-- 차량명 -->
                        <td colspan="3">
                            <input id="carNm" name="carNm" readonly class="form_input form_readonly" data-json-obj="true" />
                        </td>
                        <th scope="row"></th>
                        <td ></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //차량정보 -->

    <!-- 계약가격정보 -->
    <section class="group">
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='sal.title.contractPriceInfo' /></h2>         <!-- 계약가격정보 -->
        </div>
        <div class="table_list table_list_v1">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:14%;">
                    <col style="width:14%;">
                    <col style="width:14%;">
                    <col style="width:14%;">
                    <col style="width:15%;">
                    <col style="width:14%;">
                    <col>
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" class="hasBob"><spring:message code='global.lbl.vehiclePrice' /></th>           <!-- 차량가격 -->
                        <th scope="colgroup" colspan="3" class="hasBob"><spring:message code='sal.lbl.etcAmt' /></th>   <!-- 기타비용 -->
                        <th scope="col" rowspan="2"><strong><spring:message code='sal.lbl.realCarAmt' /></strong></th>  <!--실제차량금액 -->
                        <th scope="col" rowspan="2"><strong><spring:message code='global.lbl.oterAmt' /></strong></th>  <!-- 기타금액<br>합계 -->
                        <th scope="col" rowspan="2"><strong><spring:message code='sal.lbl.realPayAmt' /></strong></th>  <!-- 실제지불금액 -->
                    </tr>
                    <tr>
                        <th scope="col"><spring:message code='sal.lbl.retlAmt' /></th>        <!-- 공장지도가 -->
                        <th scope="col"><spring:message code='sal.lbl.incAmt' /></th>         <!-- 보험료 -->
                        <th scope="col"><spring:message code='sal.lbl.aapAmt' /></th>         <!-- 대행료 -->
                        <th scope="col"><spring:message code='sal.lbl.otherAmt' /></th>       <!-- 부가금액 -->
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="ar child_borderNone"><input id="retlAmt" name="retlAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>    <!-- 공장지도가 E -->
                        <td class="ar child_borderNone"><input id="incAmt" name="incAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>      <!-- 보험료 -->
                        <td class="ar child_borderNone"><input id="aapAmt" name="aapAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>      <!-- 대행료 -->
                        <td class="ar child_borderNone"><input id="vatAmt" name="vatAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></td>      <!-- 부가금액 -->
                        <td class="ar child_borderNone"><strong><input id="realCarAmt" name="realCarAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></strong></td>                 <!-- 실제차량금액 E -->
                        <td class="ar child_borderNone"><strong><input id="etcSumAmt" name="etcSumAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></strong></td>                   <!-- 기타금액합계 F -->
                        <td class="ar td_total child_borderNone"><strong><input id="realPayAmt" name="realPayAmt" class="form_numeric ar" readonly="readonly" data-json-obj="true" /></strong></td>        <!-- 실제지불금액 E+F -->
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //계약가격정보 -->

    <!-- 탭메뉴 전체 영역 -->
    <div id="tabstrip" class="tab_area tab_area_v1">
        <!-- 탭메뉴 -->
        <ul>
            <li id="driverTab" class="k-state-active"><spring:message code='sal.lbl.driver' /></li>     <!-- 실운전자 -->
            <li id="receiptTab"><spring:message code='global.lbl.receipt' /></li>          <!-- 영수증 -->
            <li id="payInfoTab"><spring:message code='sal.lbl.payInfo' /></li>             <!-- 입출금 -->
            <li id="subServiceTab"><spring:message code='sal.lbl.subService' /></li>   <!-- 추가서비스 -->
            <li id="remarkTab"><spring:message code='sal.lbl.fileRemark' /></li>       <!-- 파일 및 비고 -->
            <li id="optionTab"><spring:message code='sal.lbl.optionAmt' /></li>        <!-- 부가비용 -->
            <li id="priceTab"><spring:message code='sal.lbl.price' /></li>             <!-- 가격 -->
        </ul>
        <!-- //탭메뉴 -->

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
                                            <input id="drvCustNo_01" readonly class="form_input" />
                                            <a href="javascript:bf_searchCustomer('drv');"><spring:message code='global.btn.search' /></a>      <!-- 검색 -->
                                        </div>
                                    </div>
                                    <div class="form_right">
                                        <input id="drvCustNm_01" readonly class="form_input form_readonly">
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
                            <th scope="row"><spring:message code='sal.lbl.ssnCrnTp' /></th>      <!-- 신분증유형 -->
                            <td>
                                <input id="drvMathDocTp_01" readonly class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.ssnCrnNo' /></th>       <!-- 증서번호 -->
                            <td colspan="3">
                                <input id="drvSsnCrnNo_01" readonly class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='par.lbl.telNo' /></th>        <!-- 대표전화번호 -->
                            <td>
                                <input id="drvTelNo1_01" readonly class="form_input">
                                <input type="hidden" id="drvTelNo2_01">    <!-- 전화번호2 화면에 없음 -->
                            </td>
                            <th scope="row"><spring:message code='global.lbl.emailNm' /></th>       <!-- 이메일 -->
                            <td>
                                <input id="drvEmailNm_01" readonly class="form_input" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.sung' /></th>      <!-- 성 -->
                            <td>
                                <input id="drvSungNm_01" readonly class="form_input" />
                                <input type="hidden" id="drvSungCd_01" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.cityCd' /></th>      <!-- 시 -->
                            <td>
                                <input id="drvCityNm_01" readonly class="form_input" />
                                <input type="hidden" id="drvCityCd_01" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.dist' /></th>      <!-- 구 -->
                            <td>
                                <input id="drvDistNm_01" readonly class="form_input" />
                                <input type="hidden" id="drvDistCd_01" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.zipCd' /></th>       <!-- 우편번호 -->
                            <td>
                                <input id="drvZipCd_01" readonly class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.detlAddr' /></th>       <!-- 고객주소 -->
                            <td>
                                <input id="drvAddrDetlCont_01" readonly class="form_input" />
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
                                            <input id="drvCustNo_02" readonly class="form_input">
                                            <a href="javascript:bf_searchCustomer('drv');"><spring:message code='global.btn.search' /></a>      <!-- 검색 -->
                                        </div>
                                    </div>
                                    <div class="form_right">
                                        <input id="drvCustNm_02" readonly class="form_input form_readonly" />
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
                                <input id="drvMathDocTp_02" readonly class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.ssnCrnNo' /></th>       <!-- 증서번호 -->
                            <td colspan="3">
                                <input id="drvSsnCrnNo_02" readonly class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='par.lbl.telNo' /></th>            <!-- 회사전화번호 -->
                            <td>
                                <input id="drvTelNo1_02" readonly class="form_input">
                                <input type="hidden" id="drvTelNo2_02">    <!-- 전화번호2 화면에 없음 -->
                            </td>
                            <th scope="row"><spring:message code='global.lbl.emailNm' /></th>       <!-- 이메일 -->
                            <td>
                                <input id="drvEmailNm_02" readonly class="form_input" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.sung' /></th>      <!-- 성 -->
                            <td>
                                <input id="drvSungNm_02" readonly class="form_input" />
                                <input type="hidden" id="drvSungCd_02" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.cityCd' /></th>      <!-- 시 -->
                            <td>
                                <input id="drvCityNm_02" readonly class="form_input" />
                                <input type="hidden" id="drvCityCd_02" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.dist' /></th>      <!-- 구 -->
                            <td>
                                <input id="drvDistNm_02" readonly class="form_input" />
                                <input type="hidden" id="drvDistCd_02" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.zipCd' /></th>   <!-- 우편번호 -->
                            <td>
                                <input id="drvZipCd_02" readonly class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.detlAddr' /></th>   <!-- 상세주소 -->
                            <td>
                                <input id="drvAddrDetlCont_02" readonly class="form_input" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- //법인 -->
        </div>
        <!-- //실운전자 -->

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
                                <input id="contractRcptAmt" name="contractRcptAmt" class="form_numeric ar" data-json-obj="true" />
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
                                <button type="button" class="btn_s"><spring:message code='sal.lbl.scan' /></button>         <!-- 스캔 -->
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
                                    <input id="realRegAmt" name="realRegAmt" class="form_numeric ar" data-json-obj="true" />
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
                                    <input id="purcPreAmt" name="purcPreAmt" onblur="bf_sumRegAmt();" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.realPurcTaxAmt' /></th>       <!-- 실제구입세 -->
                                <td>
                                    <input id="realPurcAmt" name="realPurcAmt" onblur="bf_sumRegAmt();" onfocus="fnOnfocus(this.id);" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.regDifferenceAmt' /></th>     <!-- 차액 -->
                                <td>
                                    <input id="regDifferenceAmt" readonly class="form_numeric form_readonly ar" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.regFeeAmt' /></th>          <!-- 등록수수료 -->
                                <td>
                                    <input id="regFeeAmt" name="regFeeAmt" class="form_numeric ar" data-json-obj="true" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //번호판 등록서비스 -->

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
                                    <input id="incFeeAmt" name="incFeeAmt" class="form_numeric ar" data-json-obj="true"/>
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
                                            <button id="btnIncAdd" type="button"  class="btn_s mt0"><spring:message code='global.btn.rowAdd' /></button>        <!-- 행추가 -->
                                            <button id="btnIncDel" type="button" class="btn_s mt0"><spring:message code='global.btn.rowDel' /></button>         <!-- 행삭제 -->
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
                                <th scope="row"><spring:message code='global.lbl.fincCmp' /></th>       <!-- 금융사 -->
                                <td>
                                    <input id="fincCmpCd" name="fincCmpCd" class="form_comboBox" data-json-obj="true" />
                                </td>

                                <th scope="row"><spring:message code='sal.lbl.fincRpayPrid' /></th>       <!-- 상환기간 -->
                                <td>
                                    <input id="fincRpayPrid" name="fincRpayPrid" maxlength="3" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.fincLoadRate' /></th>    <!-- 대출비율(%) -->
                                <td>
                                    <input id="fincLoanRate" name="fincLoanRate" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.vehiclePrice' /></th>       <!-- 차량가격 -->
                                <td>
                                    <input id="fincCarAmt" readonly class="form_numeric form_readonly ar" />
                                </td>
                                <th scope="row"><spring:message code='sal.lbl.fincFeeAmt' /></th>      <!-- 대출수수료 -->
                                <td>
                                    <input id="fincFeeAmt" name="fincFeeAmt" class="form_numeric ar" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.fincItem' /></th>      <!-- 금융상품 -->
                                <td>
                                    <input id="fincItemCd" name="fincItemCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.fincReqAmt' /></th>        <!-- 신청금액 -->
                                <td colspan="2">
                                    <input id="fincReqAmt" name="fincReqAmt" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                <td></td>
                                <th scope="row"><spring:message code='global.lbl.fincReqDt' /></th>     <!-- 신청일자 -->
                                <td>
                                    <input id="fincReqDt" name="fincReqDt" class="form_datepicker" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.fincEndDt' /></th>     <!-- 만기일자 -->
                                <td>
                                    <input id="fincEndDt" name="fincEndDt" class="form_datepicker" data-json-obj="true" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //금융서비스 -->
        </div>
        <!-- //추가서비스 -->

        <!-- 파일 및 비고 -->
        <div class="mt0">
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

        <!-- 부가비용 -->
        <div class="mt0">
            <div class="header_area">
                <div class="btn_right">
                    <div class="txt_total mt0 child_borderNone" style="display:inline-block;position:relative;top:3px;margin-right:10px;">
                        <!-- 합계 -->
                        <p><spring:message code='global.lbl.total' />:<input id="otherTotAmt" class="form_numeric" readonly="readonly" style="width:80px;" /></p>
                    </div>
                    <button id="btnOptionAdd" type="button" class="btn_s"><spring:message code='global.btn.rowAdd' /></button>          <!-- 행추가 -->
                    <button id="btnOptionDel" type="button" class="btn_s"><spring:message code='global.btn.rowDel' /></button>          <!-- 행삭제 -->
                    <button id="btnOptionCancel" type="button" class="btn_s"><spring:message code='global.btn.cancel' /></button>         <!-- 취소 -->
                </div>
            </div>
            <div class="table_grid">
                <div id="optionGrid"></div>
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
                        <tr>
                            <td class="ac">1</td>
                            <td><spring:message code='sal.lbl.retlAmt' /></td>              <!-- 공장지도가 -->
                            <td class="ar child_borderNone"><input id="prcRetlAmt" class="form_numeric ar" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td class="ac">7</td>
                            <td><spring:message code='sal.lbl.incAmt' /></td>                <!-- 보험료 -->
                            <td class="ar child_borderNone"><input id="prcIncAmt" class="form_numeric ar" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td class="ac">8</td>
                            <td><spring:message code='sal.lbl.prcAapAmt' /></td>              <!-- 차량등록비 -->
                            <td class="ar child_borderNone"><input id="prcAapAmt" class="form_numeric ar" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td class="ac">9</td>
                            <td><spring:message code='sal.lbl.optionAmt' /></td>               <!-- 부가비용 -->
                            <td class="ar child_borderNone"><input id="prcVatAmt" class="form_numeric ar" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td class="ac">10</td>
                            <td><strong><spring:message code='sal.lbl.realCarAmt' /></strong></td>    <!-- 실제차량금액 -->
                            <td class="ar child_borderNone"><strong><input id="prcRealCarAmt" class="form_numeric ar" readonly="readonly" /></strong></td>
                        </tr>
                        <tr>
                            <td class="ac">11</td>
                            <td><strong><spring:message code='global.lbl.oterTotAmt' /></strong></td>        <!-- 기타비용합계 -->
                            <td class="ar child_borderNone"><strong><input id="prcEtcSumAmt" class="form_numeric ar" readonly="readonly" /></strong></td>
                        </tr>
                        <tr>
                            <td class="ac">12</td>
                            <td><strong><spring:message code='sal.lbl.realPayAmt' /></strong></td>        <!-- 실제지불금액 -->
                            <td class="ar td_total child_borderNone"><input id="prcRealPayAmt" class="form_numeric ar" readonly="readonly" /></td>
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
    <!-- 계약고객유형:SAL028 C:계약자, D:실운전자 -->
    <!-- 계약자 고객유형:01:개인, 02:법인 -->
    <input id="custTp" name="custTp" type="hidden" data-json-obj="true" />

    <!--
        계약상태:SAL002
        10      계약등록
        20      계약생성
        50      고객인도
        90      계약삭제
        91      계약해지
    -->
    <input id="contractStatCd" name="contractStatCd" type="hidden" data-json-obj="true" />

    <!-- 실운전자 고객유형 -->
    <input  id="drvCustTp" name="drvCustTp" type="hidden" data-json-obj="true" />

    <!-- 파일업로드 -->
    <input type="hidden" id="fileDocId" name="fileDocId" data-json-obj="true" />

    <!-- 저장 후 선택될 계약번호 -->
    <input id="savedContractNo" value="" />
</span>
</form>

<!-- //중고차 계약품의관리 화면 -->

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
var vCustNo = "";               // 검색 조회 고객

// 차량 및 탁송정보 - 모델 선택 변수. (프로모션 조회)
var onSelectModelCorp = "";
var onSelectModelDlr  = "";

// 계약생성 전 데이터
var bfObj = {};

// 검색 자사차
var corpBrand = "";

//판매사원 리스트
var selectSaleEmpDSList = [];
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
</c:forEach>

//지불방식:SAL071
var amtPayTpList = [];
<c:forEach var="obj" items="${amtPayTpDS}">
    amtPayTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//계약상태
var contractStatCdList = [];
var contractStatObj = {};
<c:forEach var="obj" items="${contractStatCdDS}">
    contractStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    contractStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//자사차여부:SAL118
var corpCarDstinCdList = [];
var corpCarDstinObj = {};
<c:forEach var="obj" items="${corpCarDstinCdDS}">
    corpCarDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    corpCarDstinObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//브랜드 COM019
var carBrandList = [];
var carBrandObj = {};
<c:forEach var="obj" items="${carBrandDS}">
    carBrandList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    carBrandObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 차량등록지역:SAL086
var regDistCdList = [];
<c:forEach var="obj" items="${regDistCdDS}">
    regDistCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 보험회사:SAL127
var incCmpCdList = [];
<c:forEach var="obj" items="${incCmpCdDS}">
    incCmpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 보험유형:SAL019
var insTpList = [];
var insTpObj = {};
<c:forEach var="obj" items="${insTpDS}">
    insTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    insTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 금융사:SAL055
var fincCmpCdList = [];
<c:forEach var="obj" items="${fincCmpCdDS}">
    fincCmpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

// 금융상품 SA_0117T
var fincItemObj = {};
<c:forEach var="obj" items="${fincItemDS}">
    if(fincItemObj.hasOwnProperty("${obj.fincCmpCd}")){
        fincItemObj["${obj.fincCmpCd}"].push({cmmCd:"${obj.fincItemCd}", cmmCdNm:"${obj.fincItemNm}"});
    }else{
        fincItemObj["${obj.fincCmpCd}"] = [];
        fincItemObj["${obj.fincCmpCd}"].push({cmmCd:"${obj.fincItemCd}", cmmCdNm:"${obj.fincItemNm}"});
    }
</c:forEach>

// 수납유형:SAL011
var rectTpList = [];
var rectTpObj = {};
<c:forEach var="obj" items="${rectTpDS}">
    rectTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    rectTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 입출금유형:SAL012
var ioTpList = [];
var ioTpObj = {};
<c:forEach var="obj" items="${ioTpDS}">
    ioTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ioTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 입출금대상유형:SAL013
var ioTargetTpList = [];
var ioTargetTpObj = {};
<c:forEach var="obj" items="${ioTargetTpDS}">
    ioTargetTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ioTargetTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 주요인증문서유형(신분증유형):CRM024
var ssnCrnTpPList = [];        // remark1 - P:개인
var ssnCrnTpCList = [];        // remark1 - C:법인
<c:forEach var="obj" items="${mathDocTpDS}">
    <c:if test="${obj.remark1 eq 'P'}">
      ssnCrnTpPList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>

    <c:if test="${obj.remark1 eq 'C'}">
      ssnCrnTpCList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
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

    $("#btnSearch").kendoButton({ // 조회
         enable:true,
         click:function(e){

             if( ($("#sStartContractDt").data("kendoExtMaskedDatePicker").value() != null && $("#sEndContractDt").data("kendoExtMaskedDatePicker").value() == null)
               ||($("#sEndContractDt").data("kendoExtMaskedDatePicker").value() != null && $("#sStartContractDt").data("kendoExtMaskedDatePicker").value() == null)){
               //적용일을 모두 입력해 주세요
                 dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                 return false;
             }

             var grid = $('#contGrid').data('kendoExtGrid');

             // 01:자사 , 02:타사
             var corpDS = [ {corp:"01", value:"carlineNm"}
                             , {corp:"01", value:"modelNm"}
                             , {corp:"01", value:"ocnNm"}
                             , {corp:"01", value:"extColorNm"}
                             , {corp:"01", value:"intColorNm"}
                             , {corp:"02", value:"carBrandCd"}
                             , {corp:"02", value:"carNm"}
                          ];

             if(corpBrand != ""){
                 $.each(corpDS, function(index, row){
                     if(corpBrand == row.corp){
                         grid.showColumn(row.value);
                     }else{
                         grid.hideColumn(row.value);
                     }
                 });
             }else{
                 $.each(corpDS, function(index, row){
                     grid.showColumn(row.value);
                 });
             }

             grid.dataSource.read();
             refreshAll();
             fn_btnState();  // 버튼상태
         }
    });

    // 저장
    $("#btnSave").kendoButton({
        enable:true,
        click:function(e){

           popupWindow = dms.window.popup({
               windowId:"messagePopup"
               ,title:false
               ,width :300
               ,height:110
               ,content:{
                   url:"<c:url value='/sal/uco/usedCarContract/contractMessagePopup.do' />"
                   ,data:{
                       "type":null
                       ,"autoBind":false
                       , msg:"<spring:message code='global.lbl.create' var='globalLblCreate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblCreate}' />"
                       , btnMsg01:"<spring:message code='global.btn.save' />"
                       , btnMsg02:"<spring:message code='global.btn.cancel' />"
                       ,"callbackFunc":function(data){
                           if (data.msg == "01"){
                               save('create');
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
        enable:true,
        click:function(e){

            popupWindow = dms.window.popup({
                windowId:"messagePopup"
                ,title:false
                ,width :300
                ,height:110
                ,content:{
                    url:"<c:url value='/sal/uco/usedCarContract/contractMessagePopup.do' />"
                    ,data:{
                        "type":null
                        ,"autoBind":false
                        , msg:"<spring:message code='global.lbl.update' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />"
                        , btnMsg01:"<spring:message code='global.btn.update' />"
                        , btnMsg02:"<spring:message code='global.btn.cancel' />"
                        ,"callbackFunc":function(data){
                            if (data.msg == "01"){
                                save('update');
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

            popupWindow = dms.window.popup({
                windowId:"messagePopup"
                ,title:false
                ,width :300
                ,height:110
                ,content:{
                    url:"<c:url value='/sal/uco/usedCarContract/contractMessagePopup.do' />"
                    ,data:{
                        "type":null
                        ,"autoBind":false
                        , msg:"<spring:message code='global.info.refresh' /> <br/> <spring:message code='global.lbl.progress' var='globalLblProgress' /><spring:message code='global.info.andMsg' arguments='${globalLblProgress}' />"
                        , btnMsg01:"<spring:message code='global.btn.new' />"
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

    // 계약생성
    $("#btnCreate").kendoButton({
        enable:true,
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
                    windowId:"messagePopup"
                    ,title:false
                    ,width :300
                    ,height:110
                    ,content:{
                        url:"<c:url value='/sal/uco/usedCarContract/contractMessagePopup.do' />"
                        ,data:{
                            "type":null
                            ,"autoBind":false
                                // xxxx(계약)를(을) 생성 하시겠습니까?
                            , msg:"("+$("#contractNo").val() +")"+" <spring:message code='sal.info.contractCreateMsg' />"
                            , btnMsg01:"<spring:message code='sal.btn.contractCreate' />"
                            , btnMsg02:"<spring:message code='global.btn.cancel' />"
                            ,"callbackFunc":function(data){
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

    $("#btnRemove").kendoButton({  // 계약삭제
        click:function(e){

            popupWindow = dms.window.popup({
                windowId:"messagePopup"
                ,title:false
                ,width :330
                ,height:90
                ,content:{
                    url:"<c:url value='/sal/uco/usedCarContract/contractMessagePopup.do' />"
                    ,data:{
                        "type":null
                        ,"autoBind":false
                                 // xxxx(계약번호) 계약을 취소 하시겠습니까??
                        , msg:"("+$("#contractNo").val() +")"+ "<spring:message code='sal.info.contractClose' />"
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

    $("#btnCancel").kendoButton({  // 계약취소
        click:function(e){

            // 계약생성 단계일시만 가능

            popupWindow = dms.window.popup({
                windowId:"messagePopup"
                ,title:false
                ,width :330
                ,height:90
                ,content:{
                    url:"<c:url value='/sal/uco/usedCarContract/contractMessagePopup.do' />"
                    ,data:{
                        "type":null
                        ,"autoBind":false
                                 // xxxx(계약번호) 계약을 취소 하시겠습니까??
                        , msg:"("+$("#contractNo").val() +")"+ "<spring:message code='sal.info.contractClose' />"
                        , btnMsg01:"<spring:message code='global.lbl.del' />"
                        , btnMsg02:"<spring:message code='global.btn.cancel' />"
                        ,"callbackFunc":function(data){
                            if (data.msg == "01"){
                                cancel();
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

    /* 입출금 관리*/
    $("#btnPayInfoAdd").kendoButton({   // 입출금내역 - 행추가
        click:function(e){

            $('#payInfoGrid').data('kendoExtGrid').dataSource.insert(0, {
                 "dlrCd":""
                ,"contractNo":$("#contractNo").val()
                ,"rcvTp":""
                ,"dpstWdrwTp":""
                ,"dpstWdrwDt":null
                ,"dpstWdrwTargTp":""
                ,"dpstWdrwAmt":0
                ,"remark":""
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
        click:function(e) {
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
                    url:"<c:url value='/sal/uco/usedCarContract/savePayInfo.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(jqXHR, textStatus) {
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
            $('#incGrid').data('kendoExtGrid').dataSource.insert(0, {});
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
        click:function(e) {
            $('#incGrid').data('kendoExtGrid').cancelChanges();
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
        click:function(e) {
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


    $("#custTp").val("01");       // 계약자 고객유형
    $("#drvCustTp").val("01");    // 실운전자 고객유형
    $("#sContractCustNo").on('change', fnCheckCustValue);

    $("#corpCarDstinCd").val("01");
    $("#corpCarDstinNm").val(dms.string.strNvl(corpCarDstinObj["01"]));     // 차량구분

    $(".corpCar_02").hide();
    $(".corpCar_01").show();

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

    //판매담당자
    $("#sSaleEmpNo").kendoExtDropDownList({
        dataTextField:"saleEmpNm"
       ,dataValueField:"saleEmpCd"
       ,dataSource:selectSaleEmpDSList
       ,optionLabel:" "
    });
    //$("#sSaleEmpNo").data("kendoExtDropDownList").value(userId);   // 판매사원

    // 계약상태
    $("#sContractStatCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:contractStatCdList
       ,optionLabel:" "
    });

    // 자사차여부
    $("#sCorpCarDstinCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:corpCarDstinCdList
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           corpBrand = dataItem.cmmCd;
       }
       ,optionLabel:" "
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

    // 탭
    var selectTabId = "driverTab";       // 초기값:실운전자
    $("#tabstrip").kendoExtTabStrip({
        animation:false
       ,select:function(e) {
            selectTabId = e.item.id;
        }
    });

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
       ,dataSource:ynList
       ,index:0
    });


    // 영업대표
    $("#saleMngNo").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:[{"cmmCd":"", "cmmCdNm":"", "useYn":""}, {"cmmCd":"", "cmmCdNm":"", "useYn":""}]
    });

    // 인도요청일
    $("#dlReqDt").kendoExtMaskedDatePicker({
      //value:toDay,
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 지불방식
    $("#payTp").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:amtPayTpList
       ,optionLabel:" "
    });

    // 판매담당자
    $("#saleEmpNo").kendoExtDropDownList({
        dataTextField:"saleEmpNm"
       ,dataValueField:"saleEmpCd"
       ,dataSource:selectSaleEmpDSList
       ,optionLabel:" "
    });


    // 개인:신분증유형
    $("#mathDocTp_01").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ssnCrnTpPList
       ,optionLabel:" "
    });

    // 법인:법인유형
    $("#mathDocTp_02").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ssnCrnTpCList
       ,optionLabel:" "
    });

    // 공장지도가
    $("#retlAmt").kendoExtNumericTextBox({
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

    /* 가격 */
    // 공장지도가
    $("#prcRetlAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       //,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 보험료
    $("#prcIncAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       //,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 대행료
    $("#prcAapAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       //,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 부가금액(부가비용)
    $("#prcVatAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 실제차량금액
    $("#prcRealCarAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       //,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 기타금액합계
    $("#prcEtcSumAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 실제지불금액
    $("#prcRealPayAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2                // 소숫점
       //,min:0.00
       ,value:0.00
       ,spinners:false             // 증,감 화살표
    });

    // 사용자
    // 개인:신분증유형
    $("#drvMathDocTp_01").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ssnCrnTpPList
       ,optionLabel:" "
    });

    // 법인:법인유형
    $("#drvMathDocTp_02").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ssnCrnTpCList
       ,optionLabel:" "
    });

   // 영수금액
   $("#contractRcptAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2                // 소숫점
      //,min:0.00
      ,value:0.00
      ,spinners:false             // 증,감 화살표
   });

   // 영수일자
   $("#contractRcptDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
      ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

   // 등록비 선수금
   $("#regPreAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2                // 소숫점
      //,min:0.00
      ,value:0.00
      ,spinners:false             // 증,감 화살표
   });

   // 실제등록비용
   $("#realRegAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2                // 소숫점
      //,min:0.00
      ,value:0.00
      ,spinners:false             // 증,감 화살표
   });

   // 번호판 등록장소
   $("#regDistCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:regDistCdList
       ,optionLabel:" "
    });

    //등록예상일자
    $("#regExpcDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //구입세 선수금
    $("#purcPreAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2                // 소숫점
      //,min:0.00
      ,value:0.00
      ,spinners:false             // 증,감 화살표
    });

    //실제구입세
    $("#realPurcAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2                // 소숫점
      //,min:0.00
      ,value:0.00
      ,spinners:false             // 증,감 화살표
    });

    //차익
    $("#regDifferenceAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2                // 소숫점
      ,value:0.00
      ,spinners:false             // 증,감 화살표
    });

    //등록수수료
    $("#regFeeAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2                // 소숫점
      //,min:0.00
      ,value:0.00
      ,spinners:false             // 증,감 화살표
    });

   // 번호판 등록처리:대행
   $("#tabRegTp01").click(function(){
       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#regPreAmt").data("kendoExtNumericTextBox").enable(true);       // 등록비 선수금
       $("#realRegAmt").data("kendoExtNumericTextBox").enable(true);      // 실제등록비용
       $("#regDistCd").data("kendoExtDropDownList").enable(true);         // 등록지역
       $("#regExpcDt").data("kendoExtMaskedDatePicker").enable(true);  // 등록예상일자
       $("#purcPreAmt").data("kendoExtNumericTextBox").enable(true);   // 구입세 선수금
       $("#realPurcAmt").data("kendoExtNumericTextBox").enable(true);  // 실제구입세
       $("#regFeeAmt").data("kendoExtNumericTextBox").enable(true);       // 등록수수료
       $("#regTp").val("A");      // SAL126 대행:A , 본인:M
   });
   //번호판 등록처리:본인
   $("#tabRegTp02").click(function(){
       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#regPreAmt").data("kendoExtNumericTextBox").value(0);            // 등록비 선수금
       $("#realRegAmt").data("kendoExtNumericTextBox").value(0);           // 실제등록비용
       $("#regDistCd").data("kendoExtDropDownList").value('');             // 등록지역
       $("#regExpcDt").data("kendoExtMaskedDatePicker").value('');      // 등록예상일자
       $("#purcPreAmt").data("kendoExtNumericTextBox").value(0);        // 구입세 선수금
       $("#realPurcAmt").data("kendoExtNumericTextBox").value(0);        // 실제구입세
       $("#regDifferenceAmt").data("kendoExtNumericTextBox").value(0);     // 차액
       $("#regFeeAmt").data("kendoExtNumericTextBox").value(0);            // 등록수수료
       bf_addRegAmt();  // 번호판 등록비 선수금 계산

       $("#regPreAmt").data("kendoExtNumericTextBox").enable(false);       // 등록비 선수금
       $("#realRegAmt").data("kendoExtNumericTextBox").enable(false);      // 실제등록비용
       $("#regDistCd").data("kendoExtDropDownList").enable(false);         // 등록지역
       $("#regExpcDt").data("kendoExtMaskedDatePicker").enable(false);  // 등록예상일자
       $("#purcPreAmt").data("kendoExtNumericTextBox").enable(false);   // 구입세 선수금
       $("#realPurcAmt").data("kendoExtNumericTextBox").enable(false);   // 실제구입세
       $("#regFeeAmt").data("kendoExtNumericTextBox").enable(false);       // 등록수수료
       $("#regTp").val("M");       // SAL126 대행:A , 본인:M
   });

   // 보험예상금액
   $("#incExpcAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2                // 소숫점
      //,min:0.00
      ,value:0.00
      ,spinners:false             // 증,감 화살표
   });

   // 실제보험금액
   $("#realIncAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2                // 소숫점
      ,value:0.00
      ,spinners:false             // 증,감 화살표
   });

   // 차액
   $("#incDifferenceAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2                // 소숫점
      ,value:0.00
      ,spinners:false             // 증,감 화살표
   });

   // 보험수수료
   $("#incFeeAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2                // 소숫점
      ,value:0.00
      ,spinners:false             // 증,감 화살표
   });

   // 보험회사
   $("#incCmpCd").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:incCmpCdList
      ,optionLabel:" "
   });

   // 보험처리:대행
   $("#incAapTp01").click(function(){
       $(this).siblings("li").removeClass("on");
       $(this).addClass("on");
       $("#incFeeAmt").data("kendoExtNumericTextBox").enable(true);        // 보험수수료
       $("#incCmpCd").data("kendoExtDropDownList").enable(true);           // 보험회사
       $("#incProfitNm").attr("disabled", false);    // 제1수익자
       $("#incRemark").attr("disabled", false);    // 비고

       // 보험 그리드 조회
       $("#incGrid").data('kendoExtGrid').dataSource.read(); // 보험 Grid

       $("#btnIncAdd").show();
       $("#btnIncDel").show();
       $("#btnIncCancel").show();
       $("#incAapTp").val("A");      // SAL126 대행:A , 본인:M
   });
   //보험처리:본인
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

       $("#btnIncAdd").hide();
       $("#btnIncDel").hide();
       $("#btnIncCancel").hide();
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
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:fincCmpCdList
      ,optionLabel:" "   // 전체
   });

   // 상환기간
   $("#fincRpayPrid").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:0                // 소숫점
      //,min:0
      ,max:999
      ,spinners:false             // 증,감 화살표
   });

   // 대출비율(%)
   $("#fincLoanRate").kendoExtNumericTextBox({
       format:"n2"            // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      //,min:0
      ,max:999
      ,spinners:false             // 증,감 화살표
   });

   // 차량가격
   $("#fincCarAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2                // 소숫점
      //,min:0.00
      ,value:0.00
      ,spinners:false             // 증,감 화살표
   });

   //대출 수수료
   $("#fincFeeAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2                // 소숫점
      //,min:0.00
      ,value:0.00
      ,spinners:false             // 증,감 화살표
   });

   // 금융상품
   $("#fincItemCd").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:[]
      ,optionLabel:" "
   });

   // 금융사 change 이벤트
   $("#fincCmpCd").on("change", function (){
       console.log('fincCmpCd Change:',$(this).data("kendoExtDropDownList").value());

       if(!dms.string.isEmpty(fincItemObj[$(this).data("kendoExtDropDownList").value()])){
           $("#fincItemCd").data("kendoExtDropDownList").setDataSource(fincItemObj[$(this).data("kendoExtDropDownList").value()]);
       }else{
           $("#fincItemCd").data("kendoExtDropDownList").setDataSource([]);
       }
   });

   // 신청금액
   $("#fincReqAmt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      //,min:0.00
      ,value:0.00
      ,spinners:false             // 증,감 화살표
   });

   // 신청일자
   $("#fincReqDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

   // 만기일자
   $("#fincEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

   // 부가비용 합계
   $("#otherTotAmt").kendoExtNumericTextBox({
       format:"n2"
      ,decimals:2                // 소숫점
      ,value:0.00
      ,spinners:false             // 증,감 화살표
   });

   //

   $("#tabRegTp02").click();    // 번호판등록 - 최초:본인
   $("#incAapTp02").click();    // 보험처리 - 최초:본인

   // 메인 그리드
    $("#contGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/uco/usedCarContract/selectUsedCarContractSearch.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        // 판매사원
                        params["sSaleEmpNo"] = $("#sSaleEmpNo").data("kendoExtDropDownList").value();
                        // 고객
                        params["sContractCustNo"] = $("#sContractCustNo").val();
                        // 계약상태
                        params["sContractStatCd"] = $("#sContractStatCd").data("kendoExtDropDownList").value();
                        // 계약번호
                        params["sContractNo"] = $("#sContractNo").val();
                        // 자사차여부
                        params["sCorpCarDstinCd"] = $("#sCorpCarDstinCd").data("kendoExtDropDownList").value();
                        // 계약일자
                        params["sStartContractDt"] = $("#sStartContractDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndContractDt"]   = $("#sEndContractDt").data("kendoExtMaskedDatePicker").value();

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
                        ,contractDt    :{type:"date"}                 //계약일
                        ,contractStatCd:{type:"string"}               //계약상태
                        ,contractCustNo:{type:"string"}               //고객번호
                        ,custNm        :{type:"string"}               //고객명
                        ,saleEmpNo     :{type:"string"}               //판매사원번호
                        ,corpCarDstinCd:{type:"string"}               //자사차여부
                        ,carlineNm :{type:"string"}                   //차종명
                        ,modelNm   :{type:"string"}                   //모델명
                        ,ocnNm     :{type:"string"}                   //OCN명
                        ,extColorNm:{type:"string"}                   //외장색
                        ,intColorNm:{type:"string"}                   //내장색명
                        ,carBrandCd:{type:"string"}                   //브랜드
                        ,carNm     :{type:"string"}                   //차량명
                        ,realPayAmt:{type:"number"}                   //판매금액
                        ,vinNo     :{type:"string"}                   //차대번호
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
          {field:"dlrCd", hidden:true}       // 딜러코드
          ,{field:"contractNo", title:"<spring:message code='global.lbl.contractNo' />", width:150}                 //계약번호
          ,{field:"contractDt", title:"<spring:message code='global.lbl.contractDt' />", attributes:{"class":"ac"}, width:90, format:"{0:"+vDtyyyyMMdd+"}"}                   //계약일
          ,{field:"contractStatCd", title:"<spring:message code='global.lbl.contractStat' />", attributes:{"class":"ac"}, width:90, template:"#=contractStatObj[contractStatCd]#" }    //계약상태
          ,{field:"contractCustNo", title:"<spring:message code='global.lbl.contractCustNo' />", width:150}               //고객번호
          ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", attributes:{"class":"ac"}, width:100}    //고객명
          ,{field:"saleEmpNo", title:"<spring:message code='global.lbl.saleEmpNo' />", width:100}    //판매사원번호
          ,{field:"corpCarDstinCd", title:"<spring:message code='sal.lbl.corpCarDstin' />", attributes:{"class":"ac"}, width:100, template:"#= dms.string.strNvl(corpCarDstinObj[corpCarDstinCd]) #"}  // 자사차여부
          ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", width:150}                          //차종명
          ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:250}                             //모델명
          ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocn' />", width:220}                                 //OCN명
          ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />", width:180}                       //외장색
          ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />", width:180}                       //내장색명
          ,{field:"carBrandCd", title:"<spring:message code='global.lbl.brand' />", attributes:{"class":"ac"}, width:100, template:"#= dms.string.strNvl(carBrandObj[carBrandCd]) #"}  // 브랜드
          ,{field:"carNm", title:"<spring:message code='global.lbl.carNm' />", attributes:{"class":"al"}, width:100}  // 차량명
          ,{field:"realPayAmt", title:"<spring:message code='global.lbl.salAmt' />", attributes:{"class":"ar"}, width:80,format:"{0:n2}"}                  // 판매금액
          ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", attributes:{"class":"ac"}, width:80}       // VIN NO

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

           $("#lv2DlrYn").data("kendoExtDropDownList").value(selectedItem.lv2DlrYn == "Y" ? "Y":"N");    //2급딜러여부
           $("#lv2DlrOrgCd").val(selectedItem.lv2DlrOrgCd);     //2급딜러조직코드
           $("#lv2DlrOrgNm").val(selectedItem.lv2DlrOrgNm);     //2급딜러조직
           $("#saleMngNo").data("kendoExtDropDownList").value(selectedItem.saleMngNo);       // 영업관리번호
           $("#dlReqDt").data("kendoExtMaskedDatePicker").value(selectedItem.dlReqDt);      // 인도요청일

           $("#payTp").data("kendoExtDropDownList").value(selectedItem.payTp);       // 지불방식
           $("#saleEmpNo").data("kendoExtDropDownList").value(selectedItem.saleEmpNo);   // 판매담당자

           /* 계약 고객정보 세팅 */
           var custTp = selectedItem.custTp;
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

           $("#custNo_"+custTp).val(selectedItem.custNo);       // 고객코드
           $("#custNm_"+custTp).val(selectedItem.custNm);       // 고객명

           $("#mathDocTp_"+custTp).data("kendoExtDropDownList").value(selectedItem.mathDocTp); // 신분증유형 / 법인유형
           $("#ssnCrnNo_"+custTp).val(selectedItem.ssnCrnNo);  // 증서번호
           $("#telNo1_"+custTp).val(selectedItem.telNo);       // 전화번호1
           $("#telNo2_"+custTp).val(selectedItem.telNo);       // 전화번호2
           $("#emailNm_"+custTp).val(selectedItem.emailNm);    // 이메일명
           $("#sungCd_"+custTp).val(selectedItem.sungCd);    // 성
           $("#sungNm_"+custTp).val(selectedItem.sungNm);    // 성
           $("#cityCd_"+custTp).val(selectedItem.cityCd);    // 시
           $("#cityNm_"+custTp).val(selectedItem.cityNm);    // 시
           $("#distCd_"+custTp).val(selectedItem.distCd);    // 구
           $("#distNm_"+custTp).val(selectedItem.distNm);    // 구
           $("#zipCd_"+custTp).val(selectedItem.zipCd);      // 우편번호
           $("#addrDetlCont_"+custTp).val(selectedItem.addrDetlCont);   // 상세주소

           /* 차량정보 */
           if(selectedItem.vinNo != null &&  selectedItem.vinNo != ""){
               $("#vinNo").val(selectedItem.vinNo);     // vin no
           }

           if(selectedItem.corpCarDstinCd != null &&  selectedItem.corpCarDstinCd != ""){
               $("#corpCarDstinCd").val(selectedItem.corpCarDstinCd);     // 차량구분
               $("#corpCarDstinNm").val(dms.string.strNvl(corpCarDstinObj[selectedItem.corpCarDstinCd]));     // 차량구분

               if(selectedItem.corpCarDstinCd == "01"){
                   $(".corpCar_02").hide();
                   $(".corpCar_01").show();
               }else{
                   $(".corpCar_01").hide();
                   $(".corpCar_02").show();
               }
           }

           if(selectedItem.carlineCd != null &&  selectedItem.carlineCd != ""){
               $("#carlineCd").val(selectedItem.carlineCd); // 차종
           }
           $("#carlineNm").val(selectedItem.carlineNm); // 차종

           if(selectedItem.modelCd != null &&  selectedItem.modelCd != ""){
               $("#modelCd").val(selectedItem.modelCd); // 모델
           }
           $("#modelNm").val(selectedItem.modelNm); // 모델

           if(selectedItem.ocnCd != null &&  selectedItem.ocnCd != ""){
               $("#ocnCd").val(selectedItem.ocnCd); // ocn
           }
           $("#ocnNm").val(selectedItem.ocnNm); // ocn

           if(selectedItem.extColorCd != null &&  selectedItem.extColorCd != ""){
               $("#extColorCd").val(selectedItem.extColorCd); // 외장색
           }
           $("#extColorNm").val(selectedItem.extColorNm);    // 외장색

           if(selectedItem.intColorCd != null &&  selectedItem.intColorCd != ""){
               $("#intColorCd").val(selectedItem.intColorCd); // 내장색
           }
           $("#intColorNm").val(selectedItem.intColorNm);     // 내장색

           $("#carBrandCd").val(selectedItem.carBrandCd);     // 브랜드
           $("#carBrandNm").val(dms.string.strNvl(carBrandObj[selectedItem.carBrandCd]));
           $("#carNm").val(selectedItem.carNm);               // 차량명

           /* 계약가격정보 */
           $("#retlAmt").data("kendoExtNumericTextBox").value(selectedItem.retlAmt != null ? selectedItem.retlAmt:0);                // 공장지도가
           $("#incAmt").data("kendoExtNumericTextBox").value(selectedItem.incAmt != null ? selectedItem.incAmt:0);                   // 보험료
           $("#aapAmt").data("kendoExtNumericTextBox").value(selectedItem.aapAmt != null ? selectedItem.aapAmt:0);                   // 대행료
           $("#vatAmt").data("kendoExtNumericTextBox").value(selectedItem.vatAmt != null ? selectedItem.vatAmt:0);                   // 부가금액
           $("#realCarAmt").data("kendoExtNumericTextBox").value(selectedItem.realCarAmt != null ? selectedItem.realCarAmt:0);       // 실제차량금액
           $("#etcSumAmt").data("kendoExtNumericTextBox").value(selectedItem.etcSumAmt != null ? selectedItem.etcSumAmt:0);          // 기타금액
           $("#realPayAmt").data("kendoExtNumericTextBox").value(selectedItem.realPayAmt != null ? selectedItem.realPayAmt:0);       // 실제지불금액

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
           }
           else{            // 개인
               $("#drvCust_02").hide();
               $("#drvCust_01").show();
           }

           $("#drvCustNo_"+drvCustTp).val(selectedItem.drvCustNo);       // 고객코드
           $("#drvCustNm_"+drvCustTp).val(selectedItem.drvCustNm);       // 고객명

           $("#drvMathDocTp_"+drvCustTp).data("kendoExtDropDownList").value(selectedItem.mathDocTp); // 신분증유형 / 법인유형
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

           /* 영수증 */
           $("#contractPdpstNm").val(selectedItem.contractPdpstNm);
           $("#contractRcptNo").val(selectedItem.contractRcptNo);
           $("#contractRcptAmt").data("kendoExtNumericTextBox").value(selectedItem.contractRcptAmt);
           $("#contractRcptDt").data("kendoExtMaskedDatePicker").value(selectedItem.contractRcptDt);
           $("#contractRcptId").val(selectedItem.contractRcptId);

           /* 입금내역 */
           $("#payInfoGrid").data('kendoExtGrid').dataSource.read();

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
           $("#purcPreAmt").data("kendoExtNumericTextBox").value(selectedItem.purcPreAmt);
           $("#realPurcAmt").data("kendoExtNumericTextBox").value(selectedItem.realPurcAmt);
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

           $("#fincCmpCd").data("kendoExtDropDownList").value(selectedItem.fincCmpCd);
           $("#fincCmpCd").change();
           $("#fincRpayPrid").data("kendoExtNumericTextBox").value(selectedItem.fincRpayPrid);
           $("#fincLoanRate").data("kendoExtNumericTextBox").value(selectedItem.fincLoanRate);
           $("#fincCarAmt").data("kendoExtNumericTextBox").value(selectedItem.realPayAmt);
           $("#fincFeeAmt").data("kendoExtNumericTextBox").value(selectedItem.fincFeeAmt);

           $("#fincItemCd").data("kendoExtDropDownList").value(selectedItem.fincItemCd);
           $("#fincReqAmt").data("kendoExtNumericTextBox").value(selectedItem.fincReqAmt);
           $("#fincReqDt").data("kendoExtMaskedDatePicker").value(selectedItem.fincReqDt);
           $("#fincEndDt").data("kendoExtMaskedDatePicker").value(selectedItem.fincEndDt);

           /* 파일업로드 */
           $("#fileDocId").val(selectedItem.fileDocId);    // 파일 문서 번호
           $("#fileGrid").data("kendoExtGrid").dataSource.read();
           /* 비고 */
           $("#remark").val(selectedItem.remark);

           /* 용품 */

           /* 부가비용 */
           $("#optionGrid").data('kendoExtGrid').dataSource.read();

           /* 가격 */
           $("#prcRetlAmt").data("kendoExtNumericTextBox").value(selectedItem.retlAmt != null ? selectedItem.retlAmt:0);
           $("#prcIncAmt").data("kendoExtNumericTextBox").value(selectedItem.incAmt != null ? selectedItem.incAmt:0);
           $("#prcAapAmt").data("kendoExtNumericTextBox").value(selectedItem.aapAmt != null ? selectedItem.aapAmt:0);
           $("#prcVatAmt").data("kendoExtNumericTextBox").value(selectedItem.vatAmt != null ? selectedItem.vatAmt:0);
           $("#prcRealCarAmt").data("kendoExtNumericTextBox").value(selectedItem.realCarAmt != null ? selectedItem.realCarAmt:0);
           $("#prcEtcSumAmt").data("kendoExtNumericTextBox").value(selectedItem.etcSumAmt != null ? selectedItem.etcSumAmt:0);
           $("#prcRealPayAmt").data("kendoExtNumericTextBox").value(selectedItem.realPayAmt != null ? selectedItem.realPayAmt:0);

           /* 파일업로드 */
           $("#fileDocId").val(selectedItem.fileDocId);    // 파일 문서 번호
           $("#fileGrid").data("kendoExtGrid").dataSource.read();

           /* 비고 */
           $("#remark").val(selectedItem.remark);

           bf_sumCarAmt();  // 차량가격정보 계산

           // 저장 상태일 경우 obj 저장
           if(selectedItem.contractStatCd == "10"){
               bfObj = $("#contForm").serializeObject($("#contForm").serializeArrayInSelector("[data-json-obj='true']"));
           }else{
               bfObj = {};
           }
       }
   }


   // 입출금내역
   $("#payInfoGrid").kendoExtGrid({
       dataSource:{
           transport:{
               read:{
                   url:"<c:url value='/sal/uco/usedCarContract/selectUsedPayInfoSearch.do' />"
               },
               parameterMap:function(options, operation) {
                   if (operation === "read") {
                       var params = {};

                       params["sDlrCd"] = dlrCd;
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
                   id:"seq",
                   fields:{
                          dlrCd         :{type:"string"}
                        , contractNo    :{type:"string"}
                        , seq           :{type:"number"}
                        , rcvTp         :{type:"string", validation:{required:true}}
                        , dpstWdrwTp    :{type:"string", validation:{required:true}}
                        , dpstWdrwDt    :{type:"date", validation:{required:true}}
                        , dpstWdrwTargTp:{type:"string", validation:{required:true}}
                        , dpstWdrwAmt   :{type:"number"}
                        , remark        :{type:"string"}
                   }
               }
           }
       }
       ,multiSelectWithCheckbox:true
       ,height:180
       ,pageable:false
       ,resizable:true
       ,selectable:"multiple, row"
       ,autoBind:false
       ,sortable:false
       ,columns:[
            {field:"dlrCd", hidden:true}       // 딜러코드
           ,{field:"contractNo", hidden:true}       // 계약번호
           ,{field:"seq", hidden:true}       // 순번
           ,{
               field:"rcvTp", title:"<spring:message code='sal.lbl.rcvTp' />", width:100, headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
               ,template:"#= dms.string.strNvl(rectTpObj[rcvTp]) #"
               ,editor:function (container, options){
                   $('<input required name="rcvTp" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       autoBind:false
                       ,dataTextField:"cmmCdNm"
                       ,dataValueField:"cmmCd"
                       ,dataSource:rectTpList
                   });
                   $('<span class="k-invalid-msg" data-for="rcvTp"></span>').appendTo(container);
               }
           }    // 수납유형
          ,{
               field:"dpstWdrwTp", title:"<spring:message code='sal.lbl.dpstWdrwTp' />", width:100, headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
               ,template:"#= dms.string.strNvl(ioTpObj[dpstWdrwTp]) #"
               ,editor:function (container, options){
                   $('<input required name="dpstWdrwTp" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       autoBind:false
                       ,dataTextField:"cmmCdNm"
                       ,dataValueField:"cmmCd"
                       ,dataSource:ioTpList
                   });
                   $('<span class="k-invalid-msg" data-for="dpstWdrwTp"></span>').appendTo(container);
               }
          }    // 입출금유형
         ,{field:"dpstWdrwDt", title:"<spring:message code='sal.lbl.dpsWdrwDt' />", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}" }   // 입출금일자
         ,{
             field:"dpstWdrwTargTp", title:"<spring:message code='sal.lbl.dpstWdrwTargTp' />", width:100, headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
             ,template:"#= dms.string.strNvl(ioTargetTpObj[dpstWdrwTargTp]) #"
             ,editor:function (container, options){
                 $('<input required name="dpstWdrwTargTp" data-bind="value:' + options.field + '"/>')
                 .appendTo(container)
                 .kendoExtDropDownList({
                     autoBind:false
                     ,dataTextField:"cmmCdNm"
                     ,dataValueField:"cmmCd"
                     ,dataSource:ioTargetTpList
                 });
                 $('<span class="k-invalid-msg" data-for="dpstWdrwTargTp"></span>').appendTo(container);
             }
        }    // 입출금대상유형
        ,{field:"dpstWdrwAmt", title:"<spring:message code='sal.lbl.dpstWdrwAmt' />", attributes:{"class":"ar"}, width:90, format:"{0:n2}" }   // 입/출금액
        ,{field:"remark", title:"<spring:message code='global.lbl.reasonCd' />", attributes:{"class":"al"}, width:150}   // 사유
       ]
   });

   // 보험내역 Grid
   $("#incGrid").kendoExtGrid({
       dataSource:{
           transport:{
               read:{
                   url:"<c:url value='/sal/uco/usedCarContract/selectIncSearch.do' />"
               },
               parameterMap:function(options, operation) {
                   if (operation === "read") {
                       var params = {};

                       params["sDlrCd"] = dlrCd;
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
                   id:"incTp",
                   fields:{
                          dlrCd         :{type:"string"}
                        , contractNo    :{type:"string"}
                        , incTp         :{type:"string"}
                        , incExpcAmt    :{type:"number"}
                        , realIncAmt    :{type:"number"}
                        , incPrid       :{type:"number"}
                        , incStartDt    :{type:"date"}
                        , incEndDt      :{type:"date"}
                        , remark        :{type:"string"}
                   }
               }
           }
       }
       ,dataBound:function(e) {
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
       ,multiSelectWithCheckbox:true
       ,height:140
       ,pageable:false
       ,resizable:true
       ,selectable:"multiple, row"
       ,autoBind:false
       ,sortable:false
       ,edit:function(e){
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
       ,columns:[
                   {field:"dlrCd", hidden:true}       // 딜러코드
                  ,{field:"contractNo", hidden:true}       // 계약번호
                  ,{
                      field:"incTp", title:"<spring:message code='sal.lbl.incTp' />", width:100, headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
                      ,editor:function (container, options){
                          $('<input required name="incTp" data-bind="value:' + options.field + '"/>')
                          .appendTo(container)
                          .kendoExtDropDownList({
                              autoBind:false
                              ,dataTextField:"cmmCdNm"
                              ,dataValueField:"cmmCd"
                              ,dataSource:insTpList
                          });
                          $('<span class="k-invalid-msg" data-for="incTp"></span>').appendTo(container);
                      }
                  }    // 보험유형
                  ,{field:"incExpcAmt", title:"<spring:message code='global.lbl.incAmt' />", attributes:{"class":"ar"}, width:90, format:"{0:n2}" }     // 보험금액
                  ,{field:"realIncAmt", title:"<spring:message code='sal.lbl.realIncAmt' />", attributes:{"class":"ar"}, width:90, format:"{0:n2}" }   // 실제보험료
                  ,{field:"incPrid", title:"<spring:message code='sal.lbl.pridMonth' />", attributes:{"class":"ar"}, width:90, format:"{0:n0}" }   // 기간(월)
                  ,{field:"incStartDt", title:"<spring:message code='sal.lbl.orgStartDt' />", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}" }   // 시작일자
                  ,{field:"incEndDt", title:"<spring:message code='sal.lbl.orgEndDt' />", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}" }     // 종료일자
                  ,{field:"remark", title:"<spring:message code='global.lbl.remark' />", attributes:{"class":"al"}, width:150}   // 비고
        ]
   });

   /* 부가비용 그리드 */
   $("#optionGrid").kendoExtGrid({
       dataSource:{
           transport:{
               read:{
                   url:"<c:url value='/sal/uco/usedCarContract/selectOptionSearch.do' />"
               },
               parameterMap:function(options, operation) {
                   if (operation === "read") {
                       var params = {};

                       params["sDlrCd"] = dlrCd;
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
                   id:"seq",
                   fields:{
                          dlrCd         :{type:"string"}
                        , contractNo    :{type:"string"}
                        , seq         :{type:"number"}
                        , addAtcNm    :{type:"string"}
                        , addAtcAmt    :{type:"number"}
                   }
               }
           }
       }
       ,dataBound:function(e) {
           var rows = e.sender.tbody.children();
           var oTotAmt = 0;

           $.each(rows, function(idx, row){
                var item = e.sender.dataItem(row);
                oTotAmt += Number(item.addAtcAmt);
            });

            $("#otherTotAmt").data("kendoExtNumericTextBox").value(oTotAmt);      // 합계
            $("#vatAmt").data("kendoExtNumericTextBox").value(oTotAmt);       // 부가금액
            bf_sumCarAmt();  // 차량가격정보 계산
       }
       ,multiSelectWithCheckbox:true
       ,height:150
       ,pageable:false
       ,resizable:true
       ,selectable:"multiple, row"
       ,autoBind:false
       ,sortable:false
       ,edit:function(e){
           var eles = e.container.find("input");
           var fieldName;
           if(eles.length > 1){
               fieldName = eles[eles.length-1].getAttribute("name");
           }else{
               fieldName = eles.attr("name");
           }

           var input = e.container.find(".k-input");

           if(fieldName === "addAtcAmt"){

               input.blur(function(){
                // 선택된 값
                   var rows = e.sender.select();
                   var selectedItem = e.sender.dataItem(rows[0]);

                   var addAtcAmt = Number(selectedItem.addAtcAmt);

                   if(addAtcAmt > 0 && addAtcAmt != null){

                       var grid = $("#optionGrid").data("kendoExtGrid");
                       var rows = grid.tbody.find("tr");
                       var item, oTotAmt = 0;

                       rows.each(function(index, row) {
                           item = grid.dataItem(rows[index]);

                           if(item.addAtcAmt != null){
                               oTotAmt += Number(item.addAtcAmt);
                           }
                       });

                       $("#otherTotAmt").data("kendoExtNumericTextBox").value(oTotAmt);      // 합계
                       $("#vatAmt").data("kendoExtNumericTextBox").value(oTotAmt);       // 부가금액
                       bf_sumCarAmt();  // 차량가격정보 계산

                   }
               });
           }

       }
       ,columns:[
                   {field:"dlrCd", hidden:true}        // 딜러코드
                  ,{field:"contractNo", hidden:true}   // 계약번호
                  ,{field:"seq", hidden:true}          // 일련번호
                  ,{field:"addAtcNm", title:"<spring:message code='sal.lbl.addAtcNm' />", attributes:{"class":"ar"}, width:150 }                // 부가항목
                  ,{field:"addAtcAmt", title:"<spring:message code='global.lbl.amt' />", attributes:{"class":"ar"}, width:90, format:"{0:n2}" }   // 금액
       ]
   });


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
      //,selectable:"row"
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
    $("#contractDt").data("kendoExtMaskedDatePicker").value(toDay);      // 계약일자
    $("#contractDt").data("kendoExtMaskedDatePicker").enable(true);
    $("#lv2DlrYn").data("kendoExtDropDownList").value('N');            // 2급딜러여부
    $("#lv2DlrOrgCd").val('');
    $("#lv2DlrOrgNm").val('');
    $("#saleMngNo").data("kendoExtDropDownList").value('N');       // 영업대표
    $("#dlReqDt").data("kendoExtMaskedDatePicker").value('');    // 인도요청일

    $("#payTp").data("kendoExtDropDownList").value('');    // 지불방식
    $("#saleEmpNo").data("kendoExtDropDownList").value('');    // 판매담당자

    $("#custTp").val("01");       // 계약자 고객유형
    $("#drvCustTp").val("01");    // 실운전자 고객유형
    $("#contractStatCd").val(""); // 계약상태

    $("#cust_02").hide();
    $("#cust_01").show();
    $("#custNo_01").val("");     // 고객코드
    $("#custNm_01").val("");     // 고객명
    $("#mathDocTp_01").data("kendoExtDropDownList").value("");  //신분증유형
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

    $("#custNo_02").val("");      // 고객코드
    $("#custNm_02").val("");      // 고객명
    $("#mathDocTp_02").data("kendoExtDropDownList").value("");   //신분증유형
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
    $("#vinNo").val('');
    $("#corpCarDstinCd").val('01');         // 차량구분
    $("#corpCarDstinNm").val(dms.string.strNvl(corpCarDstinObj['01']));     // 차량구분
    $(".corpCar_02").hide();
    $(".corpCar_01").show();

    $("#carlineCd").val('');    // 차종
    $("#carlineNm").val('');    // 차종
    $("#modelCd").val('');      // 모델
    $("#modelNm").val('');      // 모델
    $("#ocnCd").val('');        // ocn
    $("#ocnNm").val('');        // ocn
    $("#extColorCd").val('');   // 외장색
    $("#extColorNm").val('');   // 외장색
    $("#intColorCd").val('');   // 내장색
    $("#intColorNm").val('');   // 내장색
    $("#carBrandCd").val('');   // 브랜드
    $("#carBrandNm").val('');
    $("#carNm").val('');        // 차량명


    /* 계약가격정보 */
    $("#retlAmt").data("kendoExtNumericTextBox").value(0);        // 공장지도가 (B)
    $("#incAmt").data("kendoExtNumericTextBox").value(0);         // 보험료
    $("#aapAmt").data("kendoExtNumericTextBox").value(0);         // 대행료
    $("#vatAmt").data("kendoExtNumericTextBox").value(0);         // 부가금액

    $("#realCarAmt").data("kendoExtNumericTextBox").value(0);     // 실제차량금액 (B+C+D+E) = F
    $("#etcSumAmt").data("kendoExtNumericTextBox").value(0);      // 기타금액 합계(G)
    $("#realPayAmt").data("kendoExtNumericTextBox").value(0);     // 실제지불금액 (F+G)

    $("#tabstrip").data("kendoExtTabStrip").select(0);
    selectTabId = "driverTab";      // 실운전자

    /* 실운전자 */
    $("#realDriverSame").prop('checked', false);
    $("#drvCust_02").hide();
    $("#drvCust_01").show();
    $("#drvCustNo_01").val("");     // 고객코드
    $("#drvCustNm_01").val("");     // 고객명
    $("#drvMathDocTp_01").val("");  //신분증유형
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

    $("#drvCustNo_02").val("");      // 고객코드
    $("#drvCustNm_02").val("");      // 고객명
    $("#drvMathDocTp_02").val("");   //신분증유형
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

    /* 영수증 */
    $("#contractPdpstNm").val('');
    $("#contractRcptNo").val('');
    $("#contractRcptAmt").data("kendoExtNumericTextBox").value(0);
    $("#contractRcptDt").data("kendoExtMaskedDatePicker").value('');
    $("#contractRcptId").val('');

    /* 입금내역 */
    $("#payInfoGrid").data('kendoExtGrid').dataSource.data([]);

    /* 추가서비스 */
    $("#tabRegTp02").click();    // 번호판 등록서비스:본인
    $("#incAapTp02").click();    // 보험서비스:본인
    $("#incGrid").data('kendoExtGrid').dataSource.data([]);     // 보험 Grid

    $("#fincReq").prop('checked', false);
    bf_fincReq();
    $("#fincCmpCd").data("kendoExtDropDownList").value('');
    $("#fincCmpCd").change();
    $("#fincRpayPrid").data("kendoExtNumericTextBox").value('');
    $("#fincLoanRate").data("kendoExtNumericTextBox").value('');
    $("#fincCarAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#fincFeeAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#fincItemCd").data("kendoExtDropDownList").value('');
    $("#fincReqAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#fincReqDt").data("kendoExtMaskedDatePicker").value('');
    $("#fincEndDt").data("kendoExtMaskedDatePicker").value('');

    /* 파일업로드 */
    $("#fileDocId").val('');    // 파일 문서 번호
    $("#fileGrid").data('kendoExtGrid').dataSource.data([]);   // 파일업로드
    $("#remark").val('');       /* 비고 */

    /* 용품 */

    /* 부가비용 */
    $("#otherTotAmt").data("kendoExtNumericTextBox").value(0.00);
    $("#optionGrid").data('kendoExtGrid').dataSource.data([]);   // 부가비용

    bf_sumCarAmt();  // 차량가격정보 계산

    $("#savedContractNo").val("");      // 저장 조회용

    bfObj = {};
}

// 검색조건
function reSearch(contNo){
    $("#sContractCustNo").val("");  // 고객번호
    $("#sContractStatCd").data("kendoExtDropDownList").value('');  // 계약상태
    $("#sContractNo").val(contNo);  // 계약번호
    $("#sCorpCarDstinCd").data("kendoExtDropDownList").value('');  // 자사차여부
    $("#sStartContractDt").data("kendoExtMaskedDatePicker").value('');
    $("#sEndContractDt").data("kendoExtMaskedDatePicker").value('');
    corpBrand = "";
}

//실운전자 계약자 정보 초기화
function reDriverData(){
    $("#drvCustTp").val("");       // 고객유형
    $("#drvCustNo_01").val("");    // 개인코드
    $("#drvCustNm_01").val("");    // 개인성명
    $("#drvMathDocTp_01").data("kendoExtDropDownList").value('');
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

    $("#drvCustNo_02").val("");    // 법인코드
    $("#drvCustNm_02").val("");    // 법인명
    $("#drvMathDocTp_02").data("kendoExtDropDownList").value('');
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
   // 실제 차량금액 = 차량가격(B)
   var carAmt   = Number($("#retlAmt").data("kendoExtNumericTextBox").value());
   $("#realCarAmt").data("kendoExtNumericTextBox").value(carAmt);

   var incAmt  = Number($("#incAmt").data("kendoExtNumericTextBox").value());
   var aapAmt  = Number($("#aapAmt").data("kendoExtNumericTextBox").value());
   var vatAmt  = Number($("#vatAmt").data("kendoExtNumericTextBox").value());

   // 기타비용합계 = 보험료 + 대행료 + 부가금액
   var otherTotAmt = incAmt + aapAmt + vatAmt;
   $("#etcSumAmt").data("kendoExtNumericTextBox").value(otherTotAmt);

   // 총판매 금액
   $("#realPayAmt").data("kendoExtNumericTextBox").value(carAmt + otherTotAmt);
   // 차량가격:금융서비스
   $("#fincCarAmt").data("kendoExtNumericTextBox").value(carAmt + otherTotAmt);

   // 가격 정보 탭
   $("#prcRetlAmt").data("kendoExtNumericTextBox").value(carAmt);

   $("#prcIncAmt").data("kendoExtNumericTextBox").value(incAmt);
   $("#prcAapAmt").data("kendoExtNumericTextBox").value(aapAmt);
   $("#prcVatAmt").data("kendoExtNumericTextBox").value(vatAmt);
   $("#prcRealCarAmt").data("kendoExtNumericTextBox").value(carAmt);
   $("#prcEtcSumAmt").data("kendoExtNumericTextBox").value(otherTotAmt);
   $("#prcRealPayAmt").data("kendoExtNumericTextBox").value(carAmt + otherTotAmt);
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
    var purcPreAmt  = $("#purcPreAmt").data("kendoExtNumericTextBox").value();
    var realPurcAmt = $("#realPurcAmt").data("kendoExtNumericTextBox").value();

    if(purcPreAmt == null){
        purcPreAmt = 0;
        $("#purcPreAmt").data("kendoExtNumericTextBox").value(0);
    }

    if(realPurcAmt == null){
        realPurcAmt = 0;
        $("#realPurcAmt").data("kendoExtNumericTextBox").value(0);
    }

    $("#regDifferenceAmt").data("kendoExtNumericTextBox").value( purcPreAmt - realPurcAmt );
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

// 딜러조회
bf_dealerSearchPopup = function(){
    dealerSearchPopupWin = dms.window.popup({
        windowId:"dealerSearchPopupWin"
        ,title:"<spring:message code='cmm.title.dlrSearch'/>"   // 딜러 조회
        , content:{
            url:"<c:url value='/cmm/sci/commonPopup/selectDealerPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"closeAfterSelect":true
                    ,"callbackFunc":function(data){
                        if(data.length >= 1) {
                            $("#dlrCd").val(data[0].dlrCd);
                            $("#dlrNm").val(data[0].dlrNm);
                        }
                    }
                }
        }
    });
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
                            }
                            else{            // 개인
                                $("#cust_02").hide();
                                $("#cust_01").show();
                            }

                            $("#custNo_"+custTp).val(data[0].custNo);       // 고객코드
                            $("#custNm_"+custTp).val(data[0].custNm);       // 고객명

                            $("#mathDocTp_"+custTp).data("kendoExtDropDownList").value(data[0].mathDocTp); // 신분증유형 / 법인유형
                            $("#ssnCrnNo_"+custTp).val(data[0].ssnCrnNo);  // 증서번호
                            $("#telNo1_"+custTp).val(data[0].telNo);       // 전화번호1
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

                            $("#drvCustNo_"+custTp).val(data[0].custNo);       // 고객코드
                            $("#drvCustNm_"+custTp).val(data[0].custNm);       // 고객명

                            $("#drvMathDocTp_"+custTp).val(data[0].mathDocTp); // 신분증유형 / 법인유형
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
                            vCustNo = data[0].custNo;
                        }

                    }
                    popupWindow.close();
                }
            }
        }
    });
}

// 대상 차종 검색
bf_searchVinNo = function(){

    popupWindow = dms.window.popup({
        windowId:"usedCarMasterPopup"
        , title:"<spring:message code='sal.title.carSearch' />"   // 차량 조회
        , content:{
            url:"<c:url value='/sal/cmm/selectUsedCarMasterPopup.do'/>"
            , data:{
                "autoBind":false
                , "type"  :null
                , "callbackFunc":function(data){
                    if(data.length >= 1) {

                        $("#vinNo").val(data[0].vinNo);
                        if(data[0].corpCarDstinCd == "01"){
                            $(".corpCar_02").hide();
                            $(".corpCar_01").show();
                        }else{
                            $(".corpCar_01").hide();
                            $(".corpCar_02").show();
                        }

                        $("#corpCarDstinCd").val(data[0].corpCarDstinCd);
                        $("#corpCarDstinNm").val(dms.string.strNvl(corpCarDstinObj[data[0].corpCarDstinCd]));

                        $("#carlineCd").val(data[0].carlineCd);
                        $("#carlineNm").val(data[0].carlineNm);
                        $("#modelCd").val(data[0].modelCd);
                        $("#modelNm").val(data[0].modelNm);
                        $("#ocnCd").val(data[0].ocnCd);
                        $("#ocnNm").val(data[0].ocnNm);
                        $("#extColorCd").val(data[0].extColorCd);
                        $("#extColorNm").val(data[0].extColorNm);
                        $("#intColorCd").val(data[0].intColorCd);
                        $("#intColorNm").val(data[0].intColorNm);

                        $("#carBrandCd").val(data[0].carBrandCd);   // 브랜드
                        $("#carBrandNm").val(dms.string.strNvl(carBrandObj[data[0].carBrandCd]));
                        $("#carNm").val(data[0].carNm);        // 차량명
                    }
                    popupWindow.close();
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
        }
        else{            // 개인
            $("#drvCust_02").hide();
            $("#drvCust_01").show();
        }
        $("#drvCustNo_"+drvCustTp).val($("#custNo_"+drvCustTp).val());       // 고객코드
        $("#drvCustNm_"+drvCustTp).val($("#custNm_"+drvCustTp).val());       // 고객명

        $("#drvMathDocTp_"+drvCustTp).data("kendoExtDropDownList").value($("#mathDocTp_"+drvCustTp).data("kendoExtDropDownList").value()); // 신분증유형 / 법인유형
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

/** 무결성 검사 **/
function save_Validate(){
    var custTp = $("#custTp").val();
    if( $("#custNo_"+custTp).val() == ""){
        // {고객}를(을) 선택해주세요.:계약고객
        dms.notification.info("<spring:message code='global.lbl.customer' var='globalLblCustomer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCustomer}' />");
        return false;
    }
    var drvCustTp = $("#drvCustTp").val();
    if( $("#drvCustNo_"+custTp).val() == ""){
        // {고객}를(을) 선택해주세요.:실운전자
        dms.notification.info("<spring:message code='global.lbl.customer' var='globalLblCustomer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCustomer}' />");
        return false;
    }

    // 계약고객정보와 동일 체크 시 ( 계약자 = 실운전자 )
    if( $("#realDriverSame").prop('checked') == true ){
        if( $("#custNo_"+custTp).val() != $("#drvCustNo_"+drvCustTp).val() ){
            // {고객}를(을) 선택해주세요.:실운전자
            dms.notification.info("<spring:message code='global.lbl.customer' var='globalLblCustomer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCustomer}' />");
            return false;
        }
    }

     // 2급딜러여부
    if( $("#lv2DlrYn").data("kendoExtDropDownList").value() == "Y" ){
        if( $("#lv2DlrOrgCd").val() == ""){
            // 2급딜러을 선택하여 주세요.
            dms.notification.info("<spring:message code='sal.lbl.lv2DlrOrg' var='salLblLv2DlrOrg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblLv2DlrOrg}' />");
            return false;
        }
    }

    // 인도요청일
    if( $("#dlReqDt").data("kendoExtMaskedDatePicker").value() == "" ){
        dms.notification.info("<spring:message code='global.lbl.dlReqDt' var='globalLblDlReqDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblDlReqDt}' />");
        return false;
    }

    // 지불방식
    if( $("#payTp").data("kendoExtDropDownList").value() == "" ){
        // {지불방식}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='sal.lbl.payTp' var='salLblPayTp' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblPayTp}' />");
        return false;
    }

    if($("#vinNo").val() ==  ""){
     // {VIN NO}를(을) 선택해주세요.
        dms.notification.info("<spring:message code='global.lbl.vinNum' var='globalLblVinNum' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblVinNum}' />");
        return false;
    }

    // 번호판 등록서비스
    if($("#regTp").val() == "A"){

       if( Number($("#regPreAmt").data("kendoExtNumericTextBox").value()) <= 0 ){
           // {등록비 선수금}를(을) 선택해주세요.
           dms.notification.info("<spring:message code='sal.lbl.regPreAmt' var='salLblRegPreAmt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblRegPreAmt}' />");
           return false;
       }

       // 등록장소
       if( $("#regDistCd").data("kendoExtDropDownList").value() == "" ){
           // {등록장소}를(을) 선택해주세요.
           dms.notification.info("<spring:message code='sal.lbl.regDist' var='salLblRegDist' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblRegDist}' />");
           return false;
       }

    }

    // 보험서비스
    if($("#incAapTp").val() == "A"){
        // 보험예상금액
        if( Number($("#incExpcAmt").data("kendoExtNumericTextBox").value()) <= 0 ){
            // {보험예상금액}를(을) 선택해주세요.
            dms.notification.info("<spring:message code='sal.lbl.incExpcAmt' var='salLblIncExpcAmt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblIncExpcAmt}' />");
            return false;
        }
    }

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

    }

    return true;
}


/*********
 * 저장
 *********/
function save(mFlag){

    /** 무결성 검사 **/
    if( !save_Validate() ){
     //  return false;
    }

    var param = {
        "usedCarContractVO":$("#contForm").serializeObject($("#contForm").serializeArrayInSelector("[data-json-obj='true']"))
        ,"payInfoVO":$("#payInfoGrid").data("kendoExtGrid").getCUDData("insertPayInfoList", "updatePayInfoList", "deletePayInfoList")
        ,"incVO":$("#incGrid").data("kendoExtGrid").getCUDData("insertIncList", "updateIncList", "deleteIncList")
        ,"optionVO":$("#optionGrid").data("kendoExtGrid").getCUDData("insertOptionList", "updateOptionList", "deleteOptionList")
        ,"multiFlag":mFlag
    };

    // 로컬옵션 무결성 체크
/*
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
*/

    // 계약상태
    if( $("#contractStatCd").val() == "" ){
        param.usedCarContractVO.contractStatCd = "10";      // 계약등록
    }

    param.usedCarContractVO.contractDt = $("#contractDt").data("kendoExtMaskedDatePicker").value();           // 계약일
    param.usedCarContractVO.dlReqDt = $("#dlReqDt").data("kendoExtMaskedDatePicker").value();                 // 인도요청일
    param.usedCarContractVO.contractRcptDt = $("#contractRcptDt").data("kendoExtMaskedDatePicker").value();   // 영수일자
    param.usedCarContractVO.regExpcDt = $("#regExpcDt").data("kendoExtMaskedDatePicker").value();           // 등록예상일자
    param.usedCarContractVO.fincReqDt = $("#fincReqDt").data("kendoExtMaskedDatePicker").value();             // 신청일자
    param.usedCarContractVO.fincEndDt = $("#fincEndDt").data("kendoExtMaskedDatePicker").value();             // 만기일자

    // 계약고객정보
    var custTp = $("#custTp").val();
    param.usedCarContractVO.custTp = custTp;                            // 고객유형
    param.usedCarContractVO.custNo = $("#custNo_"+custTp).val();         // 고객코드
    param.usedCarContractVO.contractCustNo = $("#custNo_"+custTp).val(); // 고객코드 0201T

    param.usedCarContractVO.custNm = $("#custNm_"+custTp).val();         // 고객명
    param.usedCarContractVO.mathDocTp = $("#mathDocTp_"+custTp).val();   //신분증유형
    param.usedCarContractVO.ssnCrnNo = $("#ssnCrnNo_"+custTp).val();      //증서번호
    param.usedCarContractVO.telNo1 = $("#telNo1_"+custTp).val();         // 전화번호1
    param.usedCarContractVO.telNo2 = $("#telNo2_"+custTp).val();         // 전화번호2
    param.usedCarContractVO.emailNm = $("#emailNm_"+custTp).val();
    param.usedCarContractVO.sungNm = $("#sungNm_"+custTp).val();
    param.usedCarContractVO.sungCd = $("#sungCd_"+custTp).val();
    param.usedCarContractVO.cityNm = $("#cityNm_"+custTp).val();
    param.usedCarContractVO.cityCd = $("#cityCd_"+custTp).val();
    param.usedCarContractVO.distNm = $("#distNm_"+custTp).val();
    param.usedCarContractVO.distCd = $("#distCd_"+custTp).val();
    param.usedCarContractVO.zipCd  = $("#zipCd_"+custTp).val();          // 우편번호
    param.usedCarContractVO.addrDetlCont  = $("#addrDetlCont_"+custTp).val();          // 주소

    // 계약고객정보와 동일 체크
    if( $("#realDriverSame").prop('checked') == true ){
        param.usedCarContractVO.realDriverSameYn = "Y";
    }else{
        param.usedCarContractVO.realDriverSameYn = "N";
    }

    // 실운전자정보
    var drvCustTp = $("#drvCustTp").val();
    param.usedCarContractVO.drvCustTp = drvCustTp;                         // 고객유형
    param.usedCarContractVO.drvCustNo = $("#drvCustNo_"+drvCustTp).val();   // 고객코드
    param.usedCarContractVO.realDriverCustNo = $("#drvCustNo_"+drvCustTp).val();   // 고객코드 0201T

    param.usedCarContractVO.drvCustNm    = $("#drvCustNm_"+drvCustTp).val();      // 고객명
    param.usedCarContractVO.drvMathDocTp = $("#drvMathDocTp_"+drvCustTp).val();   //신분증유형
    param.usedCarContractVO.drvSsnCrnNo  = $("#drvSsnCrnNo_"+drvCustTp).val();    //증서번호
    param.usedCarContractVO.drvTelNo1    = $("#drvTelNo1_"+drvCustTp).val();      // 전화번호1
    param.usedCarContractVO.drvTelNo2    = $("#drvTelNo2_"+drvCustTp).val();      // 전화번호2
    param.usedCarContractVO.drvEmailNm   = $("#drvEmailNm_"+drvCustTp).val();
    param.usedCarContractVO.drvSungNm = $("#drvSungNm_"+drvCustTp).val();
    param.usedCarContractVO.drvSungCd = $("#drvSungCd_"+drvCustTp).val();
    param.usedCarContractVO.drvCityNm = $("#drvCityNm_"+drvCustTp).val();
    param.usedCarContractVO.drvCityCd = $("#drvCityCd_"+drvCustTp).val();
    param.usedCarContractVO.drvDistNm = $("#drvDistNm_"+drvCustTp).val();
    param.usedCarContractVO.drvDistCd = $("#drvDistCd_"+drvCustTp).val();
    param.usedCarContractVO.drvZipCd  = $("#drvZipCd_"+drvCustTp).val();          // 우편번호
    param.usedCarContractVO.drvAddrDetlCont  = $("#drvAddrDetlCont_"+drvCustTp).val();          // 주소

    // 금융신청 체크
    if( $("#fincReq").prop('checked')){
        param.usedCarContractVO.fincReqYn = "Y";
    }else{
        param.usedCarContractVO.fincReqYn = "N";
    }

    $.ajax({
        url:"<c:url value='/sal/uco/usedCarContract/multiContractRes.do' />"
        ,data:JSON.stringify(param)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error) {
            dms.notification.error(error);
        }
        ,success:function(jqXHR, textStatus) {
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
 * 계약생성
 */
function approval(){

    var param = {};
    param.contractNo = $("#contractNo").val();          // 계약번호

    $.ajax({
        url:"<c:url value='/sal/uco/usedCarContract/approval.do' />",
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
            $("#savedContractNo").val(jqXHR);   // 승인한 계약번호
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

        $.ajax({
            url:"<c:url value='/sal/cnt/contractRe/deleteContract.do' />",
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
            url:"<c:url value='/sal/uco/usedCarContract/cancelContract.do' />",
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
        // 계약생성된 이후 삭제처리가 가능합니다.
        dms.notification.info("계약생성된 이후 삭제처리가 가능합니다.");
        return false;
    }

}


/**
 * 버튼 상태 관리
 */
function fn_btnState(state){
    switch(state){
        case '10':     // 계약등록
            $("#btnPayPrint").hide();
            $("#btnContPrint").hide();
            $("#btnCancel").hide();
            $("#btnCreate").show();
            $("#btnRemove").show();
            $("#btnSave").hide();
            $("#btnUpdate").show();

            $("#btnPayInfoSave").show();
        break;
        case '20':     // 계약생성
            $("#btnPayPrint").hide();
            $("#btnContPrint").show();
            $("#btnCancel").show();
            $("#btnCreate").hide();
            $("#btnRemove").hide();
            $("#btnSave").hide();
            $("#btnUpdate").hide();

            $("#btnPayInfoSave").show();
            break;
        case '50':     // 고객인도
            $("#btnPayPrint").show();
            $("#btnContPrint").show();
            $("#btnCancel").hide();
            $("#btnCreate").hide();
            $("#btnRemove").hide();
            $("#btnSave").hide();
            $("#btnUpdate").hide();

            $("#btnPayInfoSave").show();
            break;
        case '90':     // 계약삭제 - 계약생성전
        case '91':     // 계약해지
            $("#btnPayPrint").hide();
            $("#btnContPrint").hide();
            $("#btnCancel").hide();
            $("#btnCreate").hide();
            $("#btnRemove").hide();
            $("#btnSave").hide();
            $("#btnUpdate").hide();

            $("#btnPayInfoSave").hide();
            break;
        default:     // 작성전
            $("#btnPayPrint").hide();
            $("#btnContPrint").hide();
            $("#btnCancel").hide();
            $("#btnCreate").hide();
            $("#btnRemove").hide();
            $("#btnSave").show();
            $("#btnUpdate").hide();

            $("#btnPayInfoSave").hide();
            break;
    }

    $("#btnRefresh").show();
    $("#btnSearch").show();
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
 **************************파일업로드3****************************************
 ***************************************************************************/


 /******************************************
  * 함수영역 - end
  ******************************************/

//-->
</script>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<link rel="stylesheet" href="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/dms/jquery.ui.ext-1.0.js"/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

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
                    <a href="#" onclick="attachment.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="attachment.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>
<!-- *************************************************************************
**************************파일업로드1********************************************
***************************************************************************-->



    <!-- 품목리스트 -->
    <section class="group">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="par.title.itemList" /></h1> --%>
            <div class="btn_left">
                <button id="btnInit" name="btnInit" class="btn_m btn_m_min btn_reset"><spring:message code="par.btn.init" /></button>
            </div>
            <div class="btn_right">
                <button type="button" id="btnEPC" class="btn_m" >EPC</button><!-- lixinfei：EPC按钮 -->
            <dms:access viewId="VIEW-D-11446" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnNew" name="btnNew" class="btn_m btn_m_min"><spring:message code="par.btn.new" /><!-- 신규 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11445" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSave" name="btnSave" class="btn_m btn_m_min"><spring:message code="par.btn.confirm" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11444" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnDelete" name="btnDelete" class="btn_m btn_m_min"><spring:message code="par.btn.del" /><!-- 삭제 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11443" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnExcelImport" name="btnExcelImport" class="btn_m btn_m_min"><spring:message code="par.btn.uploadExcel" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11442" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnExcelExport" name="btnExcelExport" class="btn_m btn_m_min" ><spring:message code="par.btn.excelDownload" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11441" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSearch" class="btn_m btn_m_min btn_search" ><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </dms:access>
            </div>
        </div>
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
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
                    <tr class="hidden">
                        <th scope="row"><spring:message code="par.lbl.dlrCd" /><!-- 딜러코드 --></th>
                        <td>
                            <input type="text" id="sDlrCd"  readonly class="form_input form_readonly" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.bpTpNm" /><!-- 업체유형 --></th>
                        <td>
                            <input id="sBpTp" type="text" class="form_comboBox" />
                            <input id="sSpyrCd" type="text" class="form_comboBox hidden" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.brand" /><!-- 브랜드 --></th>
                        <td>
                            <input id="sBrandCd" name="sBrandCd" type="text" data-type="combo" data-mandatory="true" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></th>
                        <td>
                            <input type="text" id="sItemCd" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                        <td>
                            <input id="sItemNm" type="text" class="form_input" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemBpNm" /><!-- 업체명칭 --></th>
                        <td>
                            <input id="sBpNm" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                        <td>
                            <input id="sCarlineCd" name="sCarlineCd" type="text" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABC Ind --></th>
                        <td>
                            <input id="sAbcInd" name="sAbcInd" type="text" class="form_comboBox" />
                            <input id="sCarlineCd2" name="sCarlineCd2" type="text" class="form_comboBox hidden" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목유형 --></th>
                        <td>
                            <input id="sItemDstinCd" name="sItemDstinCd" type="text" class="form_comboBox" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <!-- 그리드1 -->
            <div id="gridItem" class="grid"></div>
            <!-- 그리드1 -->
        </div>
    </section>
    <!-- //품목리스트 -->

    <section class="group">
        <div id="itemForm">
        <!-- 탭메뉴 전체 영역 -->
        <div id="tabstrip" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li class="k-state-active"><spring:message code="par.title.genInfo" /></li>
                <li><spring:message code="par.title.stockInfo" /></li>
                <li><spring:message code="par.title.pictureInfo" /></li>
                <li><spring:message code="par.title.itemDstinCd" /></li>
                <li><spring:message code="par.title.itemPrc" /></li>
                <li><spring:message code="par.title.comItemCd" /></li>
            </ul>
            <!-- //탭메뉴 -->
            <span class="btn_right_absolute">

            </span>
            <!-- 일반 -->
            <div style="min-height:164px;">
                <div class="btn_right_absolute">
                    <div class="btn_right">
                    </div>
                </div>
                <div class="table_form form_width_100per" id="genInfoForm">
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
                                <th scope="row"><span id="titleItemCd" class="bu_required"><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></span></th>
                                <td>
                                    <input id="itemCd" name="itemCd" type="text" value="" class="form_input form_required"  data-mandatory="true" required data-name="<spring:message code="par.lbl.itemCd" />" maxlength="18" />
                                    <input id="dlrCd" type="text" value="" class="form_input hidden">
                                </td>
                                <th scope="row"><spring:message code="par.lbl.startDt" /><!-- 유효시작일 --></th>
                                <td>
                                    <input id="startDt" type="text" class="form_datepicker" data-type="maskDate" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.oldRplcItemCd" /><!-- 구부품번호 --></th>
                                <td>
                                    <input id="oldRplcItemCd" type="text" value="" class="form_input" maxlength="18" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.oldRplcParCmptYn" /><!-- 구형부품호환여부 --></th>
                                <td>
                                    <input id="oldRplcParCmptYn" type="text" data-type="combo" class="form_comboBox" />
                                    <input id="itemGrpCd" type="text" data-type="combo" class="form_comboBox hidden">
                                    <input id="updtDtStr" type="text" class="form_input hidden" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span id="titleItemNm"  class="bu_required"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></span></th>
                                <td>
                                    <input id="itemNm" name="itemNm" type="text" value="" class="form_input form_required"  data-mandatory="true" required data-name="<spring:message code="par.lbl.itemNm" />" maxlength="50" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.endDt" /><!-- 유효종료일 --></th>
                                <td>
                                    <input id="endDt" type="text" class="form_datepicker" data-type="maskDate" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.newRplcItemCd" /><!-- 신부품번호 --></th>
                                <td>
                                    <input id="newRplcItemCd" type="text" value="" class="form_input" maxlength="18" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.newRplcParCmptYn" /><!-- 신부품호환성 --></th>
                                <td>
                                    <input id="newRplcParCmptYn"  type="text" data-type="combo" class="form_comboBox" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.engNm" /><!-- 영문명칭 --></th>
                                <td>
                                    <input id="itemEnNm" type="text" value="" class="form_input" maxlength="50" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                                <td>
                                    <input id="carlineCd" data-type="combo" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code="par.lbl.lastCmptItemCd" /><!-- 최종호환부품 --></th>
                                <td>
                                    <input id="lastCmptItemCd" type="text" value="" class="form_input" maxlength="18" />
                                    <input id="dlrSelfItemNm" type="text" value="" class="form_input hidden" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.endYn" /><!-- 사용중지 --></th>
                                <td>
                                    <input id="endYn"  type="text" data-type="combo" class="form_comboBox" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.stockUnitCd" /><!-- 재고단위 --></th>
                                <td>
                                    <input id="stockUnitCd" type="text" data-type="combo" class="form_comboBox" />
                                    <input id="carUseUnitCnt" data-type="number" class="form_numeric hidden" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.model" /><!-- 차형 --></th>
                                <td>
                                    <input id="carlineCd2" data-type="combo" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.impTextTp" /><!-- 국산/수입 --></th>
                                <td>
                                    <input id="mobisImpLocalYnTp" data-type="combo" readonly class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.renewDt" /><!-- 갱신일자 --></th>
                                <td>
                                    <input id="renewDt" type="text" class="form_datepicker" data-type="maskDate" />
                                    <input id="parSpecCd" data-type="combo" readonly class="form_comboBox form_readonly hidden" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="par.lbl.brand" /><!-- 브랜드 --></span></th>
                                <td class="required_area">
                                    <input id="brandCd" name="brandCd" type="text" data-type="combo" data-mandatory="true" class="form_comboBox" required data-name="<spring:message code="par.lbl.brand" />">
                                </td>
                                <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목유형 --></th>
                                <td>
                                    <input id="itemDstinCd" name="itemDstinCd" type="text" class="form_comboBox" data-type="combo" >
                                </td>
                                <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABC Class --></th>
                                <td>
                                    <input id="abcInd" type="text" value="" readonly class="form_input form_readonly" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.remark" /><!-- 비고 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="giStrgeStock" type="text" value="" readonly class="form_input form_readonly hidden" />
                                            <span class="txt_from">/</span>
                                        </div>
                                        <div class="date_right">
                                            <input type="text" id="totStockQty" name="totStockQty" readonly class="form_input form_readonly hidden" />
                                        </div>
                                    </div>
                                    <input type="text" id="etc1" name="etc1" class="form_input" maxlength="100" />
                                    <input id="prndYn" type="text" data-type="combo" class="form_comboBox hidden" />
                                 </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.bpTpNm" /><!--  업체유형 --></th>
                                <td>
                                    <input id="bpTp" data-type="combo" data-mandatory="true" readonly class="form_comboBox form_readonly" />
                                    <input id="spyrCd" data-type="combo" data-mandatory="true" readonly class="form_comboBox form_readonly hidden" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.bpCd" /><!-- 업체코드 --></th>
                                <td>
                                     <div class="form_search">
                                        <input type="text" id="bpCd" readonly class="form_input form_readonly" />
                                        <a id="searchCustCd"><!-- 검색 --></a>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="par.lbl.sBpNm" /><!-- 업체명 --></th>
                                <td>
                                    <input type="text" id="bpNm" readonly class="form_input form_readonly" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.itemType" /><!-- 부품분류 --></th>
                                <td>
                                    <input id="itemDstinAmosCd" data-type="combo" data-mandatory="true" readonly class="form_comboBox" />
                                </td>
                            </tr>
                            <tr class="hidden">
                                <th scope="row"><spring:message code="par.lbl.mobisImpLocalYnTp" /><!-- 원산지(Source) --></th>
                                <td>
                                    <input id="impTestTp" type="text" data-type="combo" class="form_comboBox" value="Y" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.sucCd" /><!-- SUC --></th>
                                <td>
                                    <input id="sucCd" data-type="combo" readonly class="form_comboBox form_readonly" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.pncCd" /><!-- PNC --></th>
                                <td>
                                    <input id="pncCd" type="text" value="" class="form_input" />
                                </td>
                                <th scope="row"></th>
                                <td></td>
                            </tr>
                            <tr class="hidden">
                                <th scope="row"><spring:message code="par.lbl.publicCarlineNm" /><!-- 공용차종 --></th>
                                <td colspan="3">
                                    <div class="form_search">
                                        <input type="text" id="comCarlineNm" class="form_input" />
                                        <a id="searchComCarlineNm"><!-- 검색 --></a>
                                    </div>
                                </td>
                                <th scope="row"></th>
                                <td></td>
                            </tr>
                            <tr class="hidden">
                                <th scope="row"><spring:message code="par.lbl.remark" /><!-- 비고--></th>
                                <td colspan="3">
                                    <input id="remark" type="text" class="form_input"/>
                                </td>

                                <th scope="row"></th>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //일반 -->

            <!-- 재고 -->
            <div style="min-height:164px;">
                <div class="btn_right_absolute">
                    <div class="btn_right">
                    </div>
                </div>
                <div class="table_form form_width_100per" id="stockInfoForm">
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
                                <th scope="row"><spring:message code="par.lbl.purcLeadHm" /><!-- 도착주기 --></th>
                                <td>
                                    <input id="purcLeadHm" data-type="number" class="form_numeric ar" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.minPurcQty" /><!-- 최소주문수량 --></th>
                                <td>
                                    <input id="minPurcQty" data-type="number" class="form_numeric ar" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.mm3AvgDmndQty" /><!-- 3개월평균수요량 --></th>
                                <td>
                                    <input id="mm3AvgDmndQty" data-type="number" readonly class="form_numeric form_readonly ar">
                                </td>
                                <th scope="row"><spring:message code="par.lbl.purcSgstQty" /><!-- 구매소요량산출 --></th>
                                <td>
                                    <input id="purcCqtyCalcYn" type="text" data-type="combo" class="form_comboBox" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.strge" /><!-- 부품창고 --></th>
                                <td>
                                    <input id="strgeCdList" type="text"  class="form_input form_readonly" readonly />
                                    <input id="grStrgeCd" type="text" data-type="combo" class="form_comboBox hidden" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.sftyStockQty" /><!-- 최소안전재고 --></th>
                                <td>
                                    <input id="sftyStockQty" data-type="number" class="form_numeric ar" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.mm6AvgDmndQty" /><!-- 6개월평균수요량 --></th>
                                <td>
                                    <input id="mm6AvgDmndQty" data-type="number" readonly class="form_numeric form_readonly ar">
                                </td>
                                <th scope="row"><spring:message code="par.lbl.lastGrDt" /><!-- 최종입고일 --></th>
                                <td class="readonly_area">
                                    <input id="lastGrDt" type="text" value="" readonly class="form_datepicker" data-type="maskDate" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.locCd" /><!-- 위치코드 --></th>
                                <td>
                                    <input id="locCd" type="text" value="" class="form_input form_readonly" />
                                    <input id="giStrgeCd" type="text" data-type="combo" class="form_comboBox hidden" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.sftyStockMaxQty" /><!-- 최대안전재고 --></th>
                                <td>
                                    <input id="maxSftyStockQty" data-type="number" class="form_numeric ar" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.mm12AvgDmndQty" /><!-- 12개월평균수요량 --></th>
                                <td>
                                    <input id="mm12AvgDmndQty" data-type="number" readonly class="form_numeric form_readonly ar">
                                </td>
                                <th scope="row"><spring:message code="par.lbl.lastGiDt" /><!-- 최종출고일 --></th>
                                <td class="readonly_area">
                                    <input id="lastGiDt" type="text" value="" readonly class="form_datepicker" data-type="maskDate" >
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.nonMovingFlg" /><!-- 방치품(Non-Moving 여부) --></th>
                                <td>
                                    <input id="nonMovingFlg" type="text" data-type="combo" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.strgeStockQty" /><!-- 재고수량 --></th>
                                <td>
                                    <input id="strgeStockQty" data-type="number" readonly class="form_numeric form_readonly ar" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.carlineStockQty" /><!-- 대당수량 --></th>
                                <td>
                                    <input id="carlineStockQty" data-type="number" readonly class="form_numeric form_readonly ar" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.stdrdStockQty" /><!-- 적정재고 --></th>
                                <td>
                                    <input id="stdrdStockQty" data-type="number" readonly class="form_numeric form_readonly ar" />
                                </td>

                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.dangYn" /><!-- 위험품 --></th>
                                <td>
                                    <input id="dgrItemYn"  type="text" data-type="combo" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.resvQty" /><!-- 예류수량 --></th>
                                <td>
                                    <input id="resvQty" data-type="number" readonly class="form_numeric form_readonly ar" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.minPackQty" /><!-- 최소포장수량 --></th>
                                <td>
                                    <input id="minPackQty" data-type="number" readonly class="form_numeric form_readonly ar" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.stdrdStockApplyRate" /><!-- 적정재고적용률 --></th>
                                <td>
                                    <input id="stdrdStockApplyRate" data-type="number" readonly class="form_numeric form_readonly ar" />
                                    <input id="stdrdStockCalcYn" type="text" data-type="combo" class="form_comboBox hidden" />
                                    <input id="stockPrsnId" type="text" value="" class="form_input hidden" />
                                    <input id="purcPrsnId" type="text" value="" class="form_input hidden" />
                                    <input id="rentQty" data-type="number" readonly class="form_numeric form_readonly ar hidden" />
                                    <input id="borrowQty" data-type="number" readonly class="form_numeric form_readonly ar hidden" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.paintYn" /><!-- 도색여부 --></th>
                                <td>
                                    <input id="paintYn"  type="text" data-type="combo" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.avlbStockQty" /><!-- 가용수량 --></th>
                                <td>
                                    <input id="avlbStockQty" data-type="number" readonly class="form_numeric form_readonly ar" />
                                </td>
                                <th scope="row"><spring:message code="par.lbl.mjrUseYn" /><!-- 주사용여부 --></th>
                                <td>
                                    <input id="mjrUseYn" type="text" data-type="combo" class="form_comboBox" value="N"/>
                                </td>
                                <th scope="row"><spring:message code="par.lbl.mjrErrYn" /><!-- 주고장여부 --></th>
                                <td>
                                    <input id="mjrErrYn" type="text" data-type="combo" class="form_comboBox"  value="N" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- //재고 -->

            <!-- 사진 -->
            <div style="min-height:164px;">
                <div class="btn_right_absolute">
                    <div class="btn_right">
                    </div>
                </div>
                <div>
                <dms:access viewId="VIEW-D-11440" hasPermission="${dms:getPermissionMask('READ')}">
                    <span class="btn_file" id="attachmentSelect"><spring:message code="par.btn.uploadFile" /><!-- Upload File --><input type="file"></span>
                </dms:access>
                <dms:access viewId="VIEW-D-11439" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnDownloadImg"><spring:message code="par.btn.downloadFile" /><!-- Download File --></button>
                </dms:access>
                </div>
                <!-- Upload 된 사진영역 -->
                <div class="upload_view">
                        <input type="hidden" id="fileDocNo" name="fileDocNo" class="form_file" />
                        <img id="fileDocUrl" src="" alt="" width="300" height="300" />

                </div>
                <!-- //Upload 된 사진영역 -->
            </div>
            <!-- //사진 -->
            <!-- 부품분류 -->
            <div style="min-height:164px;">
                <div class="btn_right_absolute">
                    <div class="btn_right">
                    </div>
                </div>
                <!-- 부품분류정보  -->
                <div class="table_grid">
                    <div id="gridItemDstinInfo"></div>
                </div>
                <!-- 부품분류정보  -->
            </div>
            <!-- //부품분류 -->
            <!-- 부품가격 -->
            <div style="min-height:164px;">
                <div class="btn_right_absolute">
                    <div class="btn_right">
                    </div>
                </div>

                <div class="table_grid">
                <!-- 그리드1 -->
                    <div id="gridItemPrice" class="grid"></div>
                <!-- 그리드1 -->
                </div>

            </div>
            <!-- //부품가격 -->
            <!-- 공용부번 -->
            <div style="min-height:164px;">
                <div class="btn_right_absolute">
                    <div class="btn_right">
                    </div>
                </div>
                <div class="table_grid">
                    <!-- 그리드2 -->
                     <div id="gridComItem" class="grid"></div>
                     <!-- 그리드2 -->
                 </div>
            </div>
            <!-- //공용부번 -->
        </div>
        <!-- //탭메뉴 전체 영역 -->
    </div>

    </section>

<!-- script -->
<script>
        var pCallMenu              = "${pCallMenu}",
            spyrCdList             = [],
            spyrCdMap              = {},
            bpTpList               = [],
            bpTpObj                = {},
            itemDstinCdList        = [],
            itemDstinAmosCdList    = [],
            itemDstinAmosCdList02  = [],
            itemDstinCdObj         = {},
            itemGroupObj           = {},
            stockUnitList          = [],
            stockUnitObj           = {},
            storageList            = [],
            giLocCdObj             = [],
            carlineCdList          = [],
            carlineCdObj           = {},
            carlineCdList2         = [],
            carlineCdMap           = {},
            modelCdList            = [],
            modelCdObj             = {},
            modelCdMap             = {},
            abcIndList             = [],
            abcIndObj              = {},
            abcIndMap              = {},
            comCarlineCdList       = [],
            brandCdList            = [],
            brandCdObj             = {},
            sucList                = [],
            parSpecCdList          = [],
            mobisImpLocalYnTpList  = [],
            useYnList              = [],
            useYnObj               = {},
            popItemObj             = {},
            itemDstin1stCdList     = [],
            itemDstin2ndCdList     = [],
            itemDstin3rdCdList     = [],
            selectCarlinePopupWindow,
            searchItemPopupWindow,
            toDate,
            gCrud;

        toDate = new Date();

        <c:forEach var="obj" items="${bpTpList}" varStatus="status">
            if("01" === "${obj.remark2}"){
                bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
                bpTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
            }
        </c:forEach>

        storageList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${storageList}" varStatus="status">
            storageList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        </c:forEach>
        //location
        var giLocCdObj = [];
        <c:forEach var="obj" items="${giLocCdList}">
        if(giLocCdObj.hasOwnProperty("${obj.strgeCd}")){
            giLocCdObj["${obj.strgeCd}"].push({locCd:"${obj.locCd}", locNm:"${obj.locNm}"});
        }else{
            giLocCdObj["${obj.strgeCd}"] = [];
            giLocCdObj["${obj.strgeCd}"].push({locCd:"${obj.locCd}", locNm:"${obj.locNm}"});
        }
        </c:forEach>

        spyrCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${spyrCdList}" varStatus="status">
            spyrCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>
        //carline2 Map
        $.each(spyrCdList, function(idx, obj){
            spyrCdMap[obj.cmmCd] = obj.cmmCdNm;
        });

        <c:forEach var="obj" items="${itemDstinCdList}" varStatus="status">
            if("${obj.useYn}" !== 'N'){
                itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            }
            itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        <c:forEach var="obj" items="${itemDstinAmosCdList}" varStatus="status">
            itemDstinAmosCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            if("${obj.cmmCd}" !== "01"){
                itemDstinAmosCdList02.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            }
        </c:forEach>

        <c:forEach var="obj" items="${itemGroupList}">
            if(itemGroupObj.hasOwnProperty("${obj.itemDstinCd}")){
                itemGroupObj["${obj.itemDstinCd}"].push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}"});
            }else{
                itemGroupObj["${obj.itemDstinCd}"] = [];
                itemGroupObj["${obj.itemDstinCd}"].push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}"});
            }
        </c:forEach>

        stockUnitList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${stockUnitList}" varStatus="status">
            stockUnitList.push({cmmCd:"${obj.unitExtCd}", cmmCdNm:"${obj.unitExtCd}"});
            stockUnitObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>

        <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
            carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
            comCarlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
            carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
        </c:forEach>

        <c:forEach var="obj" items="${modelCdList}">
        if(modelCdObj.hasOwnProperty("${obj.carlineCd}")){
            modelCdObj["${obj.carlineCd}"].push({cmmCd:"${obj.modelCd}", cmmCdNm:"${obj.modelNm}"});
        }else{
            modelCdObj["${obj.carlineCd}"] = [];
            modelCdObj["${obj.carlineCd}"].push({cmmCd:"${obj.modelCd}", cmmCdNm:"${obj.modelNm}"});
        }
        //carline2 List
        modelCdList.push({
            "cmmCd":"${obj.modelCd}"
            ,"cmmCdNm":"${obj.modelNm}"
        });
        </c:forEach>
        //carline2 Map
        $.each(modelCdList, function(idx, obj){
            modelCdMap[obj.cmmCd] = obj.cmmCdNm;
        });
        //abcIndList
        <c:forEach var="obj" items="${abcIndList}" varStatus="status">
            abcIndList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>
        //abcIndMap
        $.each(abcIndList, function(idx, obj){
            abcIndMap[obj.cmmCd] = obj.cmmCdNm;
        });
        //brandCdList
        brandCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${brandCdList}" varStatus="status">
            if("${obj.useYn}" !== 'N'){
                brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            }
            brandCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        sucList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${sucList}" varStatus="status">
            sucList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        parSpecCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${parSpecCdList}" varStatus="status">
            parSpecCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        mobisImpLocalYnTpList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${mobisImpLocalYnTpList}" varStatus="status">
            mobisImpLocalYnTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>
        //itemDstin1stCdList code list
        itemDstin1stCdList.push({cmmCd:"", cmmCdNm:""});
        <c:forEach var="obj" items="${itemDstin1stCdList}" varStatus="status">
            itemDstin1stCdList.push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}", pentItemDstinCd:"${obj.pentItemDstinCd}"});
        </c:forEach>
        var itemDstin1stCdMap = {};
        $.each(itemDstin1stCdList, function(idx, obj){
            itemDstin1stCdMap[obj.cmmCd] = obj.cmmCdNm;
        });
        //itemDstin2ndCdList code list
        itemDstin2ndCdList.push({cmmCd:"", cmmCdNm:""});
        <c:forEach var="obj" items="${itemDstin2ndCdList}" varStatus="status">
            itemDstin2ndCdList.push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}", pentItemDstinCd:"${obj.pentItemDstinCd}"});
        </c:forEach>
        var itemDstin2ndCdMap = {};
        $.each(itemDstin2ndCdList, function(idx, obj){
            itemDstin2ndCdMap[obj.cmmCd] = obj.cmmCdNm;
        });
        //itemDstin3rdCdList code list
        itemDstin3rdCdList.push({cmmCd:"", cmmCdNm:""});
        <c:forEach var="obj" items="${itemDstin3rdCdList}" varStatus="status">
            itemDstin3rdCdList.push({cmmCd:"${obj.itemGrpCd}", cmmCdNm:"${obj.itemGrpNm}", pentItemDstinCd:"${obj.pentItemDstinCd}"});
        </c:forEach>
        var itemDstin3rdCdMap = {};
        $.each(itemDstin3rdCdList, function(idx, obj){
            itemDstin3rdCdMap[obj.cmmCd] = obj.cmmCdNm;
        });
        //useYnList
        <c:forEach var="obj" items="${useYnList}">
        useYnList.push({
            "cmmCd":"${obj.cmmCd}"
            ,"cmmCdNm":"${obj.cmmCdNm}"
        });
        </c:forEach>
        //useYnObj
        $.each(useYnList, function(idx, obj){
            useYnObj[obj.cmmCd] = obj.cmmCdNm;
        });
        //basePriceCalTpList
        var basePriceCalTpList = [];
        <c:forEach var="obj" items="${basePriceCalTpList}">
        basePriceCalTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>
        var basePriceCalTpMap = {};
        $.each(basePriceCalTpList, function(idx, obj){
            basePriceCalTpMap[obj.cmmCd] = obj.cmmCdNm;
        });

        //itemMaster item excel file upload Popup Func
        var itemMasterExcelUploadPopupWin;
        function selectItemMasterExcelUploadPopupWindow(){

            itemMasterExcelUploadPopupWin = dms.window.popup({
                windowId:"itemMasterExcelUploadPopupWin"
                ,title:""
                ,width:850
                ,height:480
                ,content:{
                    url:"<c:url value='/par/cmm/selectItemMasterInfoExcelUploadPopup.do'/>"
                    ,data:{
                        "autoClose":true
                        ,"callbackFunc":function(data){
                            $("#gridItem").data("kendoExtGrid").dataSource.read();
                            itemMasterExcelUploadPopupWin.close();
                        }
                    }
                }
            });
        }

        var venderSearchPopupWin;
        function selectVenderMasterPopupWindow(){

            if($("#spyrCd").data("kendoExtDropDownList").value() !== '02'){
                dms.notification.warning("<spring:message code='global.info.impos' arguments='BMP 配件' />");
               return false;
            }
            venderSearchPopupWin = dms.window.popup({
                windowId:"venderSearchPopupWin"
                ,title:"<spring:message code = 'par.title.venderSelect'/>"// 거래처 조회
                ,width:840
                ,height:400
                ,content:{
                    url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"bpCd":""
                        ,"bpNm":""
                        ,"bpTp":"03"//기타
                        ,"callbackFunc":function(data){
                            $("#bpCd").val(data[0].bpCd);
                            $("#bpNm").val(data[0].bpNm);
                            $("#bpTp").data("kendoExtDropDownList").value(data[0].bpTp);

                            venderSearchPopupWin.close();
                        }
                    }
                }
            });
        }

    //lixinfei: 点击按钮打开新页签
    $("#btnEPC").kendoButton({
        click:function(e){
            let newWindow = window.open("about:blank");
            newWindow.location.href = 'https://china.snaponepc.com/epc/#/';
        }
    });

    $(document).ready(function() {
        //조회조건 - 품목구분선택
        $("#sItemDstinCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:itemDstinCdList
            ,optionLabel:" "
            ,index:0
        });
        //품목구분선택
        $("#itemDstinCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:itemDstinCdList
            ,optionLabel:" "
            ,index:0
        });
        //AMOS품목구분선택
        $("#itemDstinAmosCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:itemDstinAmosCdList02
            ,optionLabel:" "
            ,index:0
        });

        //조회조건 - 로컬여부선택
        $("#sSpyrCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel: " "
            ,dataSource:spyrCdList
            ,index:0
        });
        //조회조건 - 거래처유형선택
        $("#sBpTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel: " "
            ,dataSource:bpTpList
            ,index:0
        });
        //로컬여부선택
        $("#spyrCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:spyrCdList
            ,index:0
        });
        //거래처유형선택
        $("#bpTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel: " "
            ,dataSource:bpTpList
            ,index:0
        });
        //품목그룹선택
        $("#itemGrpCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:[]
            ,index:0
        });
        //재고단위선택
        $("#stockUnitCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:stockUnitList
            ,index:0
        });
        //입고창고선택
        $("#grStrgeCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:storageList
            ,index:0
        });
        //출고창고선택
        $("#giStrgeCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:storageList
            ,index:0
        });
        //차종(검색))
        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:carlineCdList
            ,optionLabel:" "
            ,index:0
        });
        //차종
        $("#carlineCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:carlineCdList
            ,autoBind:true
            ,optionLabel:" "
            ,index:0
        });
        //sAbcInd
        $("#sAbcInd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:abcIndList
            ,optionLabel:" "
            ,index:0
        });
        //(차형:검색)
        $("#sCarlineCd2").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:[]
            ,optionLabel:" "
            ,index:0
        });
        //차형
        $("#carlineCd2").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:[]
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
        });
        //국산/수입
        $("#impTestTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,autoBind:true
            ,index:0
        });
        //브랜드:검색
        $("#sBrandCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:brandCdList
            ,index:0
        });
        //브랜드
        $("#brandCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:brandCdList
            ,autoBind:true
            ,index:0
        });
        //SUC
        $("#sucCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:sucList
            ,index:0
        });
        //Character Code
        $("#parSpecCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:parSpecCdList
            ,index:0
        });
        //Source
        $("#mobisImpLocalYnTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:mobisImpLocalYnTpList
            ,index:0
        });
        //생산중지
        $("#prndYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });
        //사용중지
        $("#endYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });
        //위험품
        $("#dgrItemYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });
        //도색여부
        $("#paintYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });

        //구부번호환성
        $("#oldRplcParCmptYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });
        //신부번호환성
        $("#newRplcParCmptYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });
        //방치품
        $("#nonMovingFlg").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });
        //적정재고산출
        $("#stdrdStockCalcYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });
        //구매소요량산출
        $("#purcCqtyCalcYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });
        //차량사용단위수
        $("#carUseUnitCnt").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });
        //구매Lead타임
        $("#purcLeadHm").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });
        //최소구매수량
        $("#minPurcQty").kendoExtNumericTextBox({
             format:"n2"
             ,spinners:false
        });
        //소요량 올림구분
        $("#cqtyRaiseTp").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });
        //최소안전재고
        $("#sftyStockQty").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });
        //최대안전재고
        $("#maxSftyStockQty").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });
        //재고수량
        $("#strgeStockQty").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });
        //대당수량
        $("#carlineStockQty").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });
        //적정재고
        $("#stdrdStockQty").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });
        //예류수량
        $("#resvQty").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });
        //최소포장수량
        $("#minPackQty").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });
        //가용수량
        $("#avlbStockQty").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });
        //차출수량
        $("#rentQty").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });
        //차입수량
        $("#borrowQty").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });
        //적정재고적용률
        $("#stdrdStockApplyRate").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });
        //3개월평균소요량
        $("#mm3AvgDmndQty").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });
        //6개월평균소요량
        $("#mm6AvgDmndQty").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });
        //12개월평균소요량
        $("#mm12AvgDmndQty").kendoExtNumericTextBox({
             format:"n2"
            ,spinners:false
        });
        //주사용여부
        $("#mjrUseYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });
        //주고장여부
        $("#mjrErrYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:0
        });
        //날짜(유효시작일,유효종료일,갱신일자,최종입고일,최종출고일)
        $(".form_datepicker").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //tabstrip
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                var selectTabId = e.item.id;
                var selectTabIndex = $(e.item).index();

                if(selectTabIndex === 2){
                    //file view funcion checked.
                    $("#fileDocNo").val();
                    if($("#fileDocNo").val() !== ""){
                        var fileDocUrl = "<c:url value='/cmm/sci/fileUpload/selectFileDownload.do' />" + "?fileDocNo=" + $("#fileDocNo").val() + "&fileNo=" + 1 + "&inline=true";
                        $("#fileDocUrl").attr("src", fileDocUrl);
                    }else{
                        $("#fileDocUrl").attr("src", "");
                    }
                }
                else if(selectTabIndex === 3){
                    //gridItemDstinInfo
                    $('#gridItemDstinInfo').data('kendoExtGrid').dataSource.read();
                }else if(selectTabIndex === 4){
                    //gridItemPrice
                    $("#gridItemPrice").data("kendoExtGrid").dataSource.read();
                }else if(selectTabIndex === 5){
                    //gridComItem
                    $("#gridComItem").data("kendoExtGrid").dataSource.read();
                }
            }
        });
        $("#searchComCarlineNm").on('click', comCarlinePopup);
        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);

        // 조회 버튼.
        $("#btnSearch").kendoButton({
            click:function(e){
                //selectItemMasters Func
                selectItemMasters();
            }
        });
        //btnInit
        $("button[name=btnInit]").kendoButton({
            click:function(e){
                //search area init
                $("#sSpyrCd").data("kendoExtDropDownList").select(0);
                $("#sBpTp").data("kendoExtDropDownList").select(0);
                $("#sItemCd").val("");
                $("#sItemNm").val("");
                $("#sBrandCd").data("kendoExtDropDownList").select(0);

                $("#sBpNm").val("");

                $("#sCarlineCd").data("kendoExtDropDownList").select(0);
                $("#sAbcInd").data("kendoExtDropDownList").select(0);
                $("#sCarlineCd2").data("kendoExtDropDownList").setDataSource([]);
                $("#sCarlineCd2").data("kendoExtDropDownList").select(0);
                $("#sItemDstinCd").data("kendoExtDropDownList").select(0);

                initPage();
            }
        });
        // 신규 버튼.
        $("#btnNew").kendoButton({
            click:function(e){
                initPage();

                var tabStrip = $("#tabstrip").data("kendoExtTabStrip");
                tabStrip.select(0);
                $("#itemCd").focus();
            }
        });
        // 삭제 버튼.
        $("button[name=btnDelete]").kendoButton({
            click:function(e){

                var saveData = '',
                    lCrud    = '',
                    paramUrl = '';

                if(dms.string.isEmpty($("#itemCd").val())){
                    dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                    return false;
                }

                if($("#spyrCd").val() != '02'){
                    dms.notification.warning("<spring:message code='par.err.deleteOnlyLocalItem' />");
                    return false;
                }

                //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
                if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
                    return false;
                }

                delete partsJs.validate.formJs.Hash[''];

                partsJs.validate.formJs.Hash.updtDtStr = $("#updtDtStr").val();

                saveData = JSON.stringify(partsJs.validate.formJs.Hash);

                //삭제 팝업 호출.
                $("#messageId").html("<spring:message code='par.info.delYn' />");
                    conformKendoWindow.content( $(".msgDiv").html());
                    conformKendoWindow.open();
                    $(".yes, .no").click(function(){
                        if($(this).hasClass("yes")){
                            conformKendoWindow.close();

                            $.ajax({
                                url:"<c:url value='/par/pmm/itemMaster/deleteLocalItemMaster.do' />"
                                , type:"POST"
                                , data:saveData
                                , dataType:"json"
                                , contentType:'application/json'
                                , async:false
                                , success:function(result) {

                                    dms.notification.info("<spring:message code='par.info.deleteSuccess' />");

                                    initPage();
                                    // 품목 마스터 조회.
                                    selectItemMasters();
                                }
                                , error:function(jqXHR,status,error) {
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }
                            });
                        }
                        conformKendoWindow.close();
                    }).end();
            }
        });
        //이미지 파일 다운로드.
        $("#btnDownloadImg").kendoButton({
            click:function(e){
                if( dms.string.isNotEmpty($("#fileDocNo").val())){
                    dms.fileManager.download($("#fileDocNo").val(), 1);
                }
            }
        });
        // 저장 버튼.
        $("button[name=btnSave]").kendoButton({
            click:function(e){
              var saveData = '',
                  lCrud    = '',
                  paramUrl = '';
                  //form validate
                  if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
                      return false;
                  }

                  delete partsJs.validate.formJs.Hash[''];

                  var gridItemGroup = $("#gridItemDstinInfo").data("kendoExtGrid");
                  var multiItemGroups = gridItemGroup.getCUDData("insertList", "updateList", "deleteList");

                  //validation itemCd / itemNm / brand
                  if($("#itemCd").val().trim() === ""){
                      //itemCd check message
                      dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
                      return false;
                  }
                  if($("#itemNm").val().trim() === ""){
                      //itemNm check message
                      dms.notification.warning("<spring:message code='par.lbl.itemNm' var='itemNm' /><spring:message code='par.info.issueCheckMsg' arguments='${itemNm}' />");
                      return false;
                  }
                  if($("#brandCd").data("kendoExtDropDownList").value() === ""){
                      //brandCd check message
                      dms.notification.warning("<spring:message code='par.lbl.brand' var='brandCd' /><spring:message code='par.info.issueCheckMsg' arguments='${brandCd}' />");
                      return false;
                  }

                  var itemMasterVO = partsJs.validate.formJs.Hash;
                  itemMasterVO.updtDtStr = $("#updtDtStr").val();

                  var ItemMasterSaveVO = {
                          "saveVO":itemMasterVO
                          , "itemMasterGroupVOList":multiItemGroups
                  }

                  if (gCrud == "C"){
                      paramUrl = "<c:url value='/par/pmm/itemMaster/insertItemMasterItemGroup.do' />";
                  }else if (gCrud == "U"){
                      paramUrl = "<c:url value='/par/pmm/itemMaster/updateItemMasterItemGroup.do' />";
                  }else{
                     return false;
                  }

                  $.ajax({
                        url:paramUrl
                      , type:"POST"
                      , data:JSON.stringify(ItemMasterSaveVO)
                      , dataType:"json"
                      , contentType:'application/json'
                      , async:false
                      , success:function(result) {

                          if (result == true) {
                              var itemCd = '[' + $("#itemCd").val() + ']';
                              dms.notification.success("<spring:message code='global.info.updateSuccessParam' arguments='" + itemCd + "'/>");

                              //selectItemMasters Func call
                              selectItemMasters();

                              selectItemInfoByKey($("#itemCd").val());
                              gCrud = 'U';

                          } else {
                              if(result === 0){
                                  //error message
                                  var itemCd = '[' + $("#itemCd").val() + ']';
                                  dms.notification.error("<spring:message code='global.err.updateFailedParam' arguments='" + itemCd + "'/>");
                              }
                          }
                      }
                      , error:function(jqXHR,status,error) {
                          dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                      }
                  });
            }
        });
        //btnExcelImport
        $("#btnExcelImport").kendoButton({
            click:function(e){
                //selectItemMasterExcelUploadPopupWindow Func call
                selectItemMasterExcelUploadPopupWindow();
            }
        });
        //btnExcelExport
        $("#btnExcelExport").kendoButton({
            click:function(e){

                var sItemDstinCd = $("#sItemDstinCd").data("kendoExtDropDownList").value();

                //excel export all
                dms.ajax.excelExport({
                    "beanName":"itemMasterService"
                    ,"templateFile":"PartItemMasterTarget_Tpl.xlsx"
                    ,"fileName":"PartItemMasterDownload_Tpl.xlsx"
                    ,"sItemCd":$("#sItemCd").val()
                    ,"sItemNm":$("#sItemNm").val()
                    ,"sBpTp":$("#sBpTp").data("kendoExtDropDownList").value()
                    ,"sBrandCd":$("#sBrandCd").data("kendoExtDropDownList").value()
                    ,"sBpNm":$("#sBpNm").val()
                    ,"sItemDstinCd":$("#sItemDstinCd").val()
                    ,"sCarlineCd":$("#sCarlineCd").val()
                    ,"sCarlineCd2":$("#sCarlineCd2").val()
                    ,"sAbcInd":$("#sAbcInd").val()
                });

            }
        });

        //endYn
        $("#endYn").on("change", function (){
            if($(this).prop("checked") === true){
                //endYn true endDt set today data.
                if(dms.string.isEmpty($("#endDt").data("kendoExtMaskedDatePicker").value())){
                    $("#endDt").data("kendoExtMaskedDatePicker").value(new Date());
                }
            }
        });
        //itemDstinCd
        $("#itemDstinCd").on("change", function (){
            $("#itemGrpCd").data("kendoExtDropDownList").setDataSource(itemGroupObj[$(this).data("kendoExtDropDownList").value()]);
        });
        //sCarlineCd onchange event
        $("#sCarlineCd").on("change", function (){
            $("#sCarlineCd2").data("kendoExtDropDownList").setDataSource(modelCdObj[$(this).data("kendoExtDropDownList").value()]);
        });
        //carlineCd onchange event
        $("#carlineCd").on("change", function (){
            $("#carlineCd2").data("kendoExtDropDownList").setDataSource(modelCdObj[$(this).data("kendoExtDropDownList").value()]);
        });
        //gridItem
        $("#gridItem").kendoExtGrid({
            gridId:"G-PAR-0621-180285"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/itemMaster/selectItemMasters.do' />"
                    }
                    , parameterMap:function(options, operation) {

                        if (operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            //search input parameter
                            params["sItemCd"] = $("#sItemCd").val().toUpperCase();    //UPDATE BY TJX 20190904 配件信息输入小写转大写
                            params["sItemNm"] = $("#sItemNm").val();
                            //params["sSpyrCd"] = $("#sSpyrCd").val();
                            params["sBpTp"] = $("#sBpTp").data("kendoExtDropDownList").value();

                            params["sBrandCd"] = $("#sBrandCd").data("kendoExtDropDownList").value();
                            params["sBpNm"] = $("#sBpNm").val();
                            params["sCarlineCd"] = $("#sCarlineCd").val();
                            params["sCarlineCd2"] = $("#sCarlineCd2").val();

                            params["sAbcInd"] = $("#sAbcInd").val();

                            params["sItemDstinCd"] = $("#sItemDstinCd").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,serverPaging:true
                ,schema:{
                    model:{
                        id:"itemCd"
                        ,fields:{
                            dlrCd:{ type:"string" }
                            ,itemCd:{ type:"string" }
                            ,itemNm:{ type:"string" }
                            ,itemEnNm:{ type:"string" }
                            ,itemDstinCd:{ type:"string" }
                            ,bmpPurcPrc:{ type:"number" }
                            ,sucCd:{ type:"string" }
                            ,recomRtprcAmt:{ type:"number" }
                            ,brandCd:{ type:"string" }
                            ,carlineCd:{ type:"string" }
                            ,carlineCd2:{ type:"string" }
                            ,abcInd:{ type:"string" }
                            ,bpTp:{ type:"string" }
                            ,spyrCd:{ type:"string" }
                            ,bpCd:{ type:"string" }
                            ,bpNm:{ type:"string" }
                            ,bpFullNm:{ type:"string" }
                            ,newRplcItemCd:{ type:"string" }
                            ,oldRplcItemCd:{ type:"string" }
                            ,lastCmptItemCd:{ type:"string" }
                            ,stockUnitCd:{ type:"string" }
                            ,nonMovingFlg:{ type:"string" }
                            ,endYn:{ type:"string" }
                            ,dgrItemYn:{ type:"string" }
                            ,renewDt:{ type:"date" }
                            ,updtDt:{ type:"date" }
                            ,startDt:{ type:"date" }
                            ,endDt:{ type:"date" }
                        }
                    }
                }
            }
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    selectItemInfoByKey(selectedItem.itemCd);
                }
            }
            ,editable:false
            ,selectable:"row"
            ,autoBind:false
            ,height:288
            ,filterable:false
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){
                        //update row reselect.
                        if(dataItem.itemCd === $("#itemCd").val()){
                            var multiCheckBox = e.sender.tbody.find(".grid-checkbox-item[data-uid='" + dataItem.uid + "']");
                            e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");

                        }
                    }

                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                });
            }
            ,columns:[
                {field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:100}//sal.lbl.buyName
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:140}
                ,{field:"itemEnNm", title:"<spring:message code='par.lbl.itemNmEng' />", width:140}
                ,{field:"carlineCd", title:"<spring:message code='par.lbl.carLine' />"
                    , template:'#= changeCarlineCd(carlineCd)#', width:100
                }
                ,{field:"carlineCd2", title:"<spring:message code='par.lbl.model' />", width:200, hidden : true
                    ,template:'#if(modelCdMap[carlineCd2] !== undefined ){# #= modelCdMap[carlineCd2]# #}#'
                }
                ,{field:"newRplcItemCd", title:"<spring:message code='par.lbl.newRplcItemCd' />", width:120 }
                ,{field:"lastCmptItemCd", title:"<spring:message code='par.lbl.lastCmptItemCd' />", width:120 }
                ,{field:"stockUnitCd", title:"<spring:message code='par.lbl.unitNm' />", attributes:{"class":"ac"}, template:'#= changeUnitCd(stockUnitCd)#', width:80}
                ,{field:"bpTp", title:"<spring:message code='par.lbl.itemMasterBpTp' />", width:100
                    ,template:'#= changeBpTp(bpTp)#'
                }//bpTp     供应商类型
                ,{field:"spyrCd", title:"<spring:message code='par.lbl.bpCd' />", width:100, hidden:true}//spyrCd
                ,{field:"bpCd", title:"<spring:message code='par.lbl.bpCd' />", width:100}//bpCd     供应商代码
                ,{field:"bpNm", title:"<spring:message code='par.lbl.sBpNm' />", width:140 }//bpNm
                ,{field:"bpFullNm", title:"<spring:message code='par.lbl.sBpFullNm' />", width:140 }//bpNm
                ,{field:"bmpPurcPrc", title:"BMP采购单价(含税)" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}",decimals:2}   //lixinfei: BMP采购单价(含税)
<%--    <spring:message code='par.lbl.purcIncTaxPrcTaxInclude' />--%>
                ,{field:"recomRtprcAmt", title:"指导价(含税)",width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}",decimals:2}//lixinfei: recomRtprcAmt 指导价(含税)
<%--    <spring:message code='par.lbl.recRetailPrcTaxInclude' />--%>
                ,{field:"sucCd", title:"<spring:message code='par.lbl.sucCd' />", width:100}//sucCd
                ,{field:"brandCd", title:"<spring:message code='par.lbl.brand' />", width:80
                    ,template:'#= changeBrandCd(brandCd)#'
                }
                ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.itemDstinCd' />", template:'#= changeItemDstinCd(itemDstinCd)#', width:80 }
                ,{field:"abcInd", title:"<spring:message code='par.lbl.abcInd' />",width:60}
                ,{field:"endYn", title:"<spring:message code='par.lbl.endYn' />", attributes:{"class":"ac"}, template:'#= changeYnCd(endYn)#', width:80}
                ,{field:"renewDt", title:"<spring:message code='par.lbl.updtDt' />", width:100 , format:"{0:<dms:configValue code='dateFormat' />}"}
                ,{field:"startDt", title:"<spring:message code='par.lbl.startDt' />", width:100 , format:"{0:<dms:configValue code='dateFormat' />}"}
                ,{field:"endDt", title:"<spring:message code='par.lbl.endDt' />", width:100 , format:"{0:<dms:configValue code='dateFormat' />}"}
                ,{field:"ptrSpecMemo", title:"<spring:message code='par.lbl.specMemo' />", width:200}
            ]
        });

        //changeItemDstinCd Func
        changeItemDstinCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                if(itemDstinCdObj[val] != undefined){
                    returnVal = itemDstinCdObj[val];
                }
            }
            return returnVal;
        };
        //changeAbcInd Func
        changeAbcInd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                if(changeAbcInd[val] != undefined){
                    returnVal = abcIndObj[val];
                }
            }
            return returnVal;
        };
        //changeCarlineCd Func
        changeCarlineCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                if(carlineCdObj[val] != undefined){
                    returnVal = carlineCdObj[val];
                }
            }
            return returnVal;
        };
        //changeCarlineCd2 Func
        changeCarlineCd2 = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = modelCdObj[val];
            }
            return returnVal;
        };
        //changeBrandCd Func
        changeBrandCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                if(brandCdObj[val] != undefined){
                    returnVal = brandCdObj[val];
                }
            }
            return returnVal;
        };
        //changeYnCd
        changeYnCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = useYnObj[val];
            }
            return returnVal;
        };
        //changeUnitCd Func
        changeUnitCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = stockUnitObj[val];
            }
            return returnVal;
        };

        // 거래처유형
        changeBpTp = function(val){

            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                returnVal = bpTpObj[val];
            }
            return returnVal;
        };
        //gridItemDstinInfo
        $("#gridItemDstinInfo").kendoExtGrid({
            gridId:"G-PAR-0712-161699"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/itemGroup/selectItemGroupLevelsItemGroup.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sDlrCd"] = "";
                            var itemCd = $("#itemCd").val() == "" ? "X":$("#itemCd").val();
                            params["sItemCd"] = itemCd;
                            params["sItemDstinCd"] = "";
                            params["sItemGrpCd"] = "";
                            params["sItemGrpNm"] = "";
                            params["sUseYn"] = "";
                            params["sLvlVal"] = "1";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemGrpCd"
                        ,fields:{
                            dlrCd:{ type:"string" , validation:{required:true} }
                            ,itemDstinCd:{ type:"string" , validation:{required:true} }
                            ,itemGrpCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,itemGrpNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,itemDstin1st:{ type:"string" , validation:{required:true}, editable:true }
                            ,itemDstin2nd:{ type:"string" , validation:{required:true}, editable:true }
                            ,itemDstin3rd:{ type:"string" , validation:{required:true}, editable:true }
                            ,useYn:{ type:"string" , defaultValue:"Y", editable:true }
                            ,dbYn:{ type:"string" , defaultValue:"Y" }
                            ,remark:{ type:"string" }
                            ,regUsrId:{ type:"string" }
                            ,regDt:{ type:"date" }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" }
                        }
                    }
                }
            }
            ,edit:function(e){

                var grid = this,
                fieldName = grid.columns[e.container.index()].field;

                if (e.model.dbYn == "Y") {
                    if(fieldName=="itemGrpCd"){
                        this.closeCell();
                    }
                }
            }
            ,selectable:"row"
            ,autoBind:false
            ,multiSelectWithCheckbox:false
            ,pageable:false
            ,height:142
            ,filterable:false
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){

                        var itemDstin1st = row.children().eq(3);
                        var itemDstin2nd = row.children().eq(4);
                        var itemDstin3rd = row.children().eq(5);

                        itemDstin1st.addClass("bg_white");
                        itemDstin2nd.addClass("bg_white");
                        itemDstin3rd.addClass("bg_white");
                    }

                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                });
            }
            ,columns:[
                {field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:120, sortable:false, attributes:{"class":"ac"},hidden:true} //가격유형
                ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.itemDstinCd' />", width:120, sortable:false, attributes:{"class":"ac"},hidden:true} //가격유형
                ,{field:"itemGrpNm", title:"<spring:message code='par.lbl.partItemGrpNm' />",width:150,attributes:{"class":"editable-cell"}}//itemGrpNm
                ,{field:"itemDstin1st", title:"<spring:message code='par.lbl.itemDstin1st' />"
                    ,width:200
                    ,sortable:false
                    ,editor:function(container, options){

                        var filterItemDstin1stCdList = [];
                        <c:forEach var="obj" items="${itemDstin1stCdList}">
                        if(options.model.itemGrpCd === "${obj.pentItemDstinCd}"){
                            filterItemDstin1stCdList.push({
                                "cmmCd":"${obj.itemGrpCd}"
                                ,"cmmCdNm":"${obj.itemGrpNm}"
                            });
                        }
                        </c:forEach>

                        var input = $('<input id="itemDstin1st" name="itemDstin1st" data-bind="value:' + options.field + '"  />')
                        .appendTo(container);
                        input.kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,valuePrimitive:true
                            ,dataSource:filterItemDstin1stCdList
                            ,optionLabel:" "
                            ,change:function(){
                                var grid = $("#gridItemDstinInfo").data("kendoExtGrid"),
                                model = grid.dataItem(this.element.closest("tr"));

                                model.set("itemDstin2nd", null);
                                model.set("itemDstin3rd", null);
                            }
                        }).appendTo(container);
                    }
                    ,template:'#if( itemDstin1stCdMap[itemDstin1st] !== undefined){# #= itemDstin1stCdMap[itemDstin1st]# #}#'
                }//itemDstin1st
                ,{field:"itemDstin2nd", title:"<spring:message code='par.lbl.itemDstin2nd' />"
                    ,width:200
                    ,sortable:false
                    ,editor:function(container, options){

                        var filterItemDstin2ndCdList = [];
                        <c:forEach var="obj" items="${itemDstin2ndCdList}">
                        if(options.model.itemDstin1st === "${obj.pentItemDstinCd}"){
                            filterItemDstin2ndCdList.push({
                                "cmmCd":"${obj.itemGrpCd}"
                                ,"cmmCdNm":"${obj.itemGrpNm}"
                            });
                        }
                        </c:forEach>

                        var input = $('<input id="itemDstin2nd" name="itemDstin2nd" data-bind="value:' + options.field + '"  />')
                        .appendTo(container);
                        input.kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,valuePrimitive:true
                            ,dataSource:filterItemDstin2ndCdList
                            ,optionLabel:" "
                            ,change:function(){
                                var grid = $("#gridItemDstinInfo").data("kendoExtGrid"),
                                model = grid.dataItem(this.element.closest("tr"));

                                model.set("itemDstin3rd", null);
                            }
                        }).appendTo(container);
                    }
                    ,template:'#if(itemDstin2ndCdMap[itemDstin2nd] !== undefined){# #= itemDstin2ndCdMap[itemDstin2nd]# #}#'
                }//itemDstin2nd
                ,{field:"itemDstin3rd", title:"<spring:message code='par.lbl.itemDstin3rd' />"
                    ,width:200
                    ,sortable:false
                    ,editor:function(container, options){

                        var filterItemDstin3rdCdList = [];
                        <c:forEach var="obj" items="${itemDstin3rdCdList}">
                        if(options.model.itemDstin2nd === "${obj.pentItemDstinCd}"){
                            filterItemDstin3rdCdList.push({
                                "cmmCd":"${obj.itemGrpCd}"
                                ,"cmmCdNm":"${obj.itemGrpNm}"
                            });
                        }
                        </c:forEach>

                        var input = $('<input id="itemDstin3rd" name="itemDstin3rd" data-bind="value:' + options.field + '"  />')
                        .appendTo(container);
                        input.kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,valuePrimitive:true
                            ,dataSource:filterItemDstin3rdCdList
                            ,optionLabel:" "
                        }).appendTo(container);
                    }
                    ,template:'#if(itemDstin3rdCdMap[itemDstin3rd] !== undefined){# #= itemDstin3rdCdMap[itemDstin3rd]# #}#'
                }//itemDstin3rd
            ]
        });
        //gridComItem
        $("#gridComItem").kendoExtGrid({
            gridId:"G-PAR-0802-120303"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/comItemMaster.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};

                            params["sort"] = options.sort;
                            params["sItemCd"] = $("#itemCd").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function (result){
                        if(result.total === 0 ){
                            //dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                        }else{
                            var dataLen = result.data.length;
                            for(var i = 0; i < dataLen; i = i + 1){
                                popItemObj[result.data[i].comItemCd] = result.data[i].comItemNm;
                        }
                        return result.data;
                        }
                    }
                    ,model:{
                         id:"comItemCd"
                        ,fields:{
                            itemCd:{ type:"string" }
                            ,itemNm:{ type:"string" }
                            ,comItemCd:{ type:"string" }
                            ,comItemNm:{ type:"string" }
                            ,itemEnNm:{ type:"string" }
                            ,itemDstinCd:{ type:"string" }
                            ,brandCd:{ type:"string" }
                            ,carlineCd:{ type:"string" }
                            ,carlineCd2:{ type:"string" }
                            ,abcInd:{ type:"string" }
                            ,bpTp:{ type:"string" }
                            ,bpCd:{ type:"string" }
                            ,bpNm:{ type:"string" }
                            ,newRplcItemCd:{ type:"string" }
                            ,oldRplcItemCd:{ type:"string" }
                            ,lastCmptItemCd:{ type:"string" }
                            ,stockUnitCd:{ type:"string" }
                            ,nonMovingFlg:{ type:"string" }
                            ,endYn:{ type:"string" }
                            ,dgrItemYn:{ type:"string" }
                            ,renewDt:{ type:"date" }
                            ,updtDt:{ type:"date" }
                            ,startDt:{ type:"date" }
                            ,endDt:{ type:"date" }
                        }
                    }
                }
            }
            ,height:142
            ,multiSelectWithCheckbox:false
            ,filterable:false
            ,scrollable:true
            ,autoBind:false
            ,pageable:false
            ,editable:false
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){
                    }

                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                });
            }
            ,columns:[
                { field:"comItemCd",title:"<spring:message code='par.lbl.comItemCd' />", width :100 }
                ,{ field:"comItemNm" ,title:"<spring:message code='par.lbl.comItemNm' />", width:140 }
                ,{field:"itemEnNm", title:"<spring:message code='par.lbl.itemNmEng' />", width:140}
                ,{field:"carlineCd", title:"<spring:message code='par.lbl.carLine' />"
                    , template:'#= changeCarlineCd(carlineCd)#', width:100
                }
                ,{field:"carlineCd2", title:"<spring:message code='par.lbl.model' />", width:200, hidden : true
                    ,template:'#if(modelCdMap[carlineCd2] !== undefined ){# #= modelCdMap[carlineCd2]# #}#'
                }
                ,{field:"newRplcItemCd", title:"<spring:message code='par.lbl.newRplcItemCd' />", width:120 }
                ,{field:"lastCmptItemCd", title:"<spring:message code='par.lbl.lastCmptItemCd' />", width:120 }
                ,{field:"stockUnitCd", title:"<spring:message code='par.lbl.unitNm' />", attributes:{"class":"ac"}, template:'#= changeUnitCd(stockUnitCd)#', width:80}
                ,{field:"bpTp", title:"<spring:message code='par.lbl.itemMasterBpTp' />", width:100
                    ,template:'#= changeBpTp(bpTp)#'
                }//bpTp
                ,{field:"bpCd", title:"<spring:message code='par.lbl.bpCd' />", width:100}//bpCd
                ,{field:"bpNm", title:"<spring:message code='par.lbl.bpNm' />", width:140 }//bpNm
                ,{field:"brandCd", title:"<spring:message code='par.lbl.brand' />", width:80
                    ,template:'#= changeBrandCd(brandCd)#'
                }
                ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.itemDstinCd' />", template:'#= changeItemDstinCd(itemDstinCd)#', width:80 }
                ,{field:"abcInd", title:"<spring:message code='par.lbl.abcInd' />",width:60}
                ,{field:"endYn", title:"<spring:message code='par.lbl.endYn' />", attributes:{"class":"ac"}, template:'#= changeYnCd(endYn)#', width:80}
                ,{field:"renewDt", title:"<spring:message code='par.lbl.updtDt' />", width:100 , format:"{0:<dms:configValue code='dateFormat' />}"}
                ,{field:"startDt", title:"<spring:message code='par.lbl.startDt' />", width:100 , format:"{0:<dms:configValue code='dateFormat' />}"}
                ,{field:"endDt", title:"<spring:message code='par.lbl.endDt' />", width:100 , format:"{0:<dms:configValue code='dateFormat' />}"}
            ]
        });
        //gridItemPrice
        $("#gridItemPrice").kendoExtGrid({
            gridId:"G-PAR-0802-120305"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/partsPriceMaster/selectPartsVenderSalPriceTargetMasters.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            //search input parameter
                            var itemCd = $("#itemCd").val() == "" ? "X":$("#itemCd").val();

                            params["sItemCdOnly"] = itemCd;

                            return kendo.stringify(params);
                        }
                    }
                }
                ,serverPaging:true
                ,schema:{
                     model:{
                        id:"itemCd"
                       ,fields:{
                           dlrCd:{ type:"string" ,validation:{required:true} }
                           ,bpCd:{ type:"string" ,editable:false}
                           ,bpNm:{ type:"string" ,editable:false}
                           ,lineNo:{ type:"number" , editable:false}
                           ,itemCd:{ type:"string" , editable:false}
                           ,itemNm:{ type:"string" , editable:false}
                           ,itemDstinCd:{ type:"string" , editable:false}
                           ,carlineCd:{ type:"string" , editable:false}
                           ,abcInd:{ type:"string" , editable:false}
                           ,prcTp:{ type:"string" , editable:false}
                           ,salePrcAmt:{ type:"number" , editable:false}
                           ,purcPrc:{ type:"number" , editable:false}
                           ,prcQty:{ type:"number" , editable:false}
                           ,prcQtyUnitCd:{ type:"string" , editable:false}
                           ,startDt:{ type:"date" , editable:false}
                           ,endDt:{ type:"date" , editable:false}
                           ,applyDt:{ type:"date" , editable:false}
                           ,saleTaxRate:{ type:"number" , editable:false}
                           ,delYn:{ type:"string" , editable:false}
                           ,movingAvgPrc:{ type:"number", editable:false}
                           ,movingAvgTaxDdctPrc:{ type:"number", editable:false}
                           ,retlPrc:{ type:"number"}
                           ,whslPrc:{ type:"number"}
                           ,incPrc:{ type:"number"}
                           ,grtePrc:{ type:"number"}
                           ,retlAddTaxRate:{ type:"number"}
                           ,whslAddTaxRate:{ type:"number"}
                           ,incAddTaxRate:{ type:"number"}
                           ,grteAddTaxRate:{ type:"number"}
                           ,bmpOpnPrc:{ type:"number" , editable:false}
                           ,rectGiPrc:{ type:"number" , editable:false}
                           ,stdPrc:{ type:"number" , editable:false}
                           ,stdPrcCd:{ type:"string" , editable:false}
                           ,etcPrc1:{ type:"number" , editable:false}
                           ,etcPrc2:{ type:"number" , editable:false}
                           ,etcPrc3:{ type:"number" , editable:false}
                           ,taxDdctRetlPrc:{ type:"number" ,editable:false}
                           ,taxDdctWhslPrc:{ type:"number" ,editable:false}
                           ,taxDdctIncPrc:{ type:"number" ,editable:false}
                           ,taxDdctGrtePrc:{ type:"number" ,editable:false}
                           ,taxDdctEtcPrc1:{ type:"number" , editable:false}
                           ,taxDdctEtcPrc2:{ type:"number" , editable:false}
                           ,taxDdctEtcPrc3:{ type:"number" , editable:false}
                        }
                    }
                }
            }
            ,editable:false
            ,selectable:"row"
            ,pageable:false
            ,filterable:false
            ,height:142
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){
                    }

                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                });
            }
            ,columns:[
                {field:"movingAvgPrc", title:"<spring:message code='par.lbl.stockCost' />", width:80, sortable:false, attributes:{"class":"ar"}}
                ,{field:"movingAvgTaxDdctPrc", title:"<spring:message code='par.lbl.stockCost' />(<spring:message code='par.lbl.taxSprt' />)", width:80, sortable:false, attributes:{"class":"ar"}}
                ,{field:"rectGiPrc", title:"<spring:message code='par.lbl.lastGrPrice' />", width:80, sortable:false, attributes:{"class":"ar"}}
                ,{field:"retlPrc", title:"<spring:message code='par.lbl.bestSalePriceCost' />", width:80, sortable:false, attributes:{"class":"ar"}}
                ,{field:"stdPrcCd", title:"<spring:message code='par.lbl.basePrice' />", width:80, sortable:false
                    ,template:'#if(basePriceCalTpMap[stdPrcCd] !== undefined){# #= basePriceCalTpMap[stdPrcCd]# #}#'
                }
                ,{field:"retlPrc", title:"<spring:message code='par.lbl.salePriceCost01' />", width:80, sortable:false, attributes:{"class":"ar"}}
                ,{field:"whslPrc", title:"<spring:message code='par.lbl.salePriceCost02' />", width:80, sortable:false, attributes:{"class":"ar"}}
                ,{field:"incPrc", title:"<spring:message code='par.lbl.salePriceCost03' />", width:80, sortable:false, attributes:{"class":"ar"}}
                ,{field:"grtePrc", title:"<spring:message code='par.lbl.salePriceCost04' />", width:80, sortable:false, attributes:{"class":"ar"}}
            ]
        });

         // 품목 마스터 조회.
        function selectItemMasters(){
            $("#gridItem").data("kendoExtGrid").dataSource.page(1);
        }

        function initPage(){

          //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
            //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
                return false;
            }

            // 품목 정보 Reset
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            partsJs.validate.groupObjAllDataInit();

            $("#spyrCd").data("kendoExtDropDownList").value('02');
            $("#spyrCd").data("kendoExtDropDownList").enable(false);

            $("#prndYn").data("kendoExtDropDownList").value('N');
            $("#endYn").data("kendoExtDropDownList").value('N');
            $("#dgrItemYn").data("kendoExtDropDownList").value('N');
            $("#paintYn").data("kendoExtDropDownList").value('N');
            $("#mjrUseYn").data("kendoExtDropDownList").value('N');
            $("#mjrErrYn").data("kendoExtDropDownList").value('N');
            $("#oldRplcParCmptYn").data("kendoExtDropDownList").value('N');
            $("#newRplcParCmptYn").data("kendoExtDropDownList").value('N');
            $("#nonMovingFlg").data("kendoExtDropDownList").value('N');
            $("#stdrdStockCalcYn").data("kendoExtDropDownList").value('N');
            $("#purcCqtyCalcYn").data("kendoExtDropDownList").value('N');

            $("#itemCd").attr("disabled", false);
            $("#itemNm").attr("disabled", false);
            $("#itemDstinCd").data("kendoExtDropDownList").enable(true);
            $("#itemDstinAmosCd").data("kendoExtDropDownList").setDataSource(itemDstinAmosCdList02);
            $("#itemDstinAmosCd").data("kendoExtDropDownList").enable(true);
            $("#oldRplcItemCd").attr("disabled", false);
            //$("#oldRplcParCmptYn").attr("disabled", false);
            $("#newRplcItemCd").attr("disabled", false);
            //$("#newRplcParCmptYn").attr("disabled", false);
            $("#sucCd").data("kendoExtDropDownList").enable(true);
            $("#lastCmptItemCd").attr("disabled", false);
            $("#carUseUnitCnt").closest(".k-numerictextbox").removeClass("form_readonly");
            $("#carUseUnitCnt").data("kendoExtNumericTextBox").enable(true);
            $("#mobisImpLocalYnTp").data("kendoExtDropDownList").enable(true);
            $("#parSpecCd").data("kendoExtDropDownList").enable(true);
            $("#pncCd").attr("disabled", false);

            $("#bpTp").data("kendoExtDropDownList").enable(false);

            $("#brandCd").data("kendoExtDropDownList").enable(true);

            $("#startDt").data("kendoExtMaskedDatePicker").enable(true);
            $("#endDt").data("kendoExtMaskedDatePicker").enable(true);

            $("#renewDt").data("kendoExtMaskedDatePicker").enable(false);

            $("#oldRplcParCmptYn").data("kendoExtDropDownList").enable(true);
            $("#newRplcParCmptYn").data("kendoExtDropDownList").enable(true);

            $("#gridItemDstinInfo").data("kendoExtGrid").dataSource.data([]);
            $("#gridComItem").data("kendoExtGrid").dataSource.data([]);
            $("#gridItemPrice").data("kendoExtGrid").dataSource.data([]);

            $("button[name=btnDelete]").data("kendoButton").enable(false);

            //영문명칭,차종,단위,차형 수정가능.
            $("#itemEnNm").attr("disabled", false);
            $("#carlineCd").data("kendoExtDropDownList").enable(true);
            $("#stockUnitCd").data("kendoExtDropDownList").enable(true);
            $("#carlineCd2").data("kendoExtDropDownList").enable(true);

            //공구 관리에서 넘어온 경우
            if(!dms.string.isEmpty(pCallMenu)){
                if(pCallMenu === 'TOOL'){
                    $("#sItemDstinCd").data("kendoExtDropDownList").value("07");//Tool(공구)
                }else{
                    $("#sItemDstinCd").data("kendoExtDropDownList").value("02");//Default(부품)
                }
            }else{
                $("#sItemDstinCd").data("kendoExtDropDownList").value("02");//Default(부품)
            }
            //창고
            $("#grStrgeCd").data("kendoExtDropDownList").value("WHP1");//Default(WHP1)
            $("#giStrgeCd").data("kendoExtDropDownList").value("WHP1");//Default(WHP1)

            popItemObj = {};
            gCrud = 'C';

            //신규부품 시 검색조건에서 설정한 부품유형으로 Default설정한다.
            $("#itemDstinCd").data("kendoExtDropDownList").value($("#sItemDstinCd").data("kendoExtDropDownList").value());

            if(pCallMenu === 'TOOL'){
                $("#gridItem thead [data-field=itemCd]").text("<spring:message code='par.lbl.toolCd' />");
                $("#gridItem thead [data-field=itemNm]").text("<spring:message code='par.lbl.toolNm' />");
                $("#titleItemCd").text("<spring:message code='par.lbl.toolCd' />");
                $("#titleItemNm").text("<spring:message code='par.lbl.toolNm' />");
                $("#btnExcelImport").hide();
                $("#btnExcelExport").hide();
            }

            $("#fileDocNo").val("");
            $("#fileDocUrl").attr("src", "");

            $("#impTestTp").data("kendoExtDropDownList").value("Y");
            $("#brandCd").data("kendoExtDropDownList").value("HD");
            $("#stockUnitCd").data("kendoExtDropDownList").value("EA");

        }
        //kendoExtMaskedDatePicker changed event
        function fnChkDateValue(e){
            var elmt = e.sender.element[0],
                id = elmt.id;
            id = '"#' + id +'"';

            if(this.value() == null){
                $(id).data("kendoExtMaskedDatePicker").value('');
            }
        }
        //selectPartsMasterPopupWindow popup open Func
        function selectPartsMasterPopupWindow(){

            searchItemPopupWindow = dms.window.popup({
                windowId:"ItemMasterPopup"
                ,title  :"<spring:message code='par.title.partSearch' />"
                ,content:{
                    url :"<c:url value='/par/cmm/selectSearchItemPopup.do' />"
                    ,data:{
                        "type"        :""
                        ,"autoBind"    :true
                        ,"selectable"  :"multiple"
                        ,"callbackFunc":function(data){

                            var dataLen      = data.length
                                ,gridData     = $("#gridComItem").data("kendoExtGrid")
                                ,dataItem
                                ,popItemData  = {}
                                ,itemList     = []
                                ,tDate
                                ,rows;

                            for(var i = 0; i < dataLen; i = i + 1){

                                popItemData.itemCd          = itemKey;
                                popItemData.comItemCd       = data[i].itemCd;
                                popItemData.comItemNm       = data[i].itemNm;
                                popItemData.carlineCd       = data[i].carlineCd;
                                popItemData.itemDstinCd     = data[i].itemDstinCd;
                                popItemData.avlbStockQty    = data[i].avlbStockQty;
                                popItemData.remark          = '';

                                if(popItemObj.hasOwnProperty(data[i].itemCd)){
                                  //(1) 중복 체크
                                  var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                  dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                              }else if([data[i].itemCd] == itemKey){
                                  //(2) itemCd와 comItemcd가 동일한 부품입니다.
                                  dms.notification.warning("<spring:message code='par.info.duplicateSelection' />");
                              }else{
                                  popItemObj[data[i].itemCd] = data[i].itemNm;
                                  gridData.dataSource.insert(0, {});

                                  dataItem = $("#gridComItem").data("kendoExtGrid").dataSource.data()[0];
                                  dataItem.set('itemCd', itemKey);
                                  dataItem.set('comItemCd', data[i].itemCd);
                                  dataItem.set('comItemNm', data[i].itemNm);
                                  dataItem.set('carlineCd', data[i].carlineCd);
                                  dataItem.set('itemDstinCd', data[i].itemDstinCd);
                                  dataItem.set('itemDstinCd', data[i].itemDstinCd);
                                  dataItem.set('remark','');
                              }
                          }
                          searchItemPopupWindow.close();
                      }
                   }
                }
            });
        }


        function comCarlinePopup() {
            selectCarlinePopupWindow = dms.window.popup({
                windowId:"selectCarlinePopupWindow"
                ,title:"<spring:message code='par.title.carlineSearch'/>"   // 차종 조회
                ,content:{
                    url:"<c:url value='/par/cmm/selectComCarlineListPopup.do'/>"
                    , data:{
                        "autoBind":false
                        ,"comCarlineNm":$("#comCarlineNm").val()
                        ,"callbackFunc":function(data){
                            if(data.length > 0){
                                var carNm;
                                for(var i = 0,dlen = data.length; i < dlen; i = i + 1){
                                    if(i === 0){
                                        carNm = data[i].carlineNm;
                                    }else{
                                        carNm = carNm + '|' + data[i].carlineNm;
                                    }

                                }
                                $("#comCarlineNm").val(carNm);
                            }
                           selectCarlinePopupWindow.close();
                        }
                    }
                }
            });
        }

        function selectItemInfoByKey(pItemCd){
            $.ajax({
                url:"<c:url value='/par/pmm/itemMaster/selectItemMasterByKey.do' />",
                data:JSON.stringify({sItemCd:pItemCd}),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }

            }).done(function(result) {

                //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
                if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
                    return false;
                }

                partsJs.validate.groupObjAllDataSet(result);

                $("#itemGrpCd").data("kendoExtDropDownList").setDataSource(itemGroupObj[result.itemDstinCd]);
                $("#itemGrpCd").data("kendoExtDropDownList").value(result.itemGrpCd);

                $("#itemDstinCd").data("kendoExtDropDownList").value(result.itemDstinCd);

                if($("#spyrCd").data("kendoExtDropDownList").value() === '02'){ //로컬부품인경우
                    $("#itemCd").attr("disabled", true);//로컬부품코드 disabled true
                    $("#itemNm").attr("disabled", false);
                    $("#itemDstinCd").data("kendoExtDropDownList").enable(true);
                    $("#itemDstinAmosCd").data("kendoExtDropDownList").setDataSource(itemDstinAmosCdList02);
                    $("#itemDstinAmosCd").data("kendoExtDropDownList").enable(true);
                    $("#oldRplcItemCd").attr("disabled", false);

                    $("#oldRplcParCmptYn").attr("disabled", false);
                    $("#newRplcItemCd").attr("disabled", false);

                    $("#newRplcParCmptYn").attr("disabled", false);
                    $("#sucCd").data("kendoExtDropDownList").enable(true);
                    $("#lastCmptItemCd").attr("disabled", false);
                    $("#carUseUnitCnt").closest(".k-numerictextbox").removeClass("form_readonly");
                    $("#carUseUnitCnt").data("kendoExtNumericTextBox").enable(true);
                    $("#mobisImpLocalYnTp").data("kendoExtDropDownList").enable(true);
                    $("#parSpecCd").data("kendoExtDropDownList").enable(true);
                    $("#pncCd").attr("disabled", false);
                    $("#brandCd").data("kendoExtDropDownList").enable(true);

                    $("#startDt").data("kendoExtMaskedDatePicker").enable(true);
                    $("#endDt").data("kendoExtMaskedDatePicker").enable(true);
                    $("#oldRplcParCmptYn").data("kendoExtDropDownList").enable(true);
                    $("#newRplcParCmptYn").data("kendoExtDropDownList").enable(true);

                    //영문명칭,차종,단위,차형 수정가능.
                    $("#itemEnNm").attr("disabled", false);
                    $("#carlineCd").data("kendoExtDropDownList").enable(true);
                    $("#stockUnitCd").data("kendoExtDropDownList").enable(true);
                    $("#carlineCd2").data("kendoExtDropDownList").enable(true);

                    $("button[name=btnDelete]").data("kendoButton").enable(true);
                }else{
                    $("#itemCd").attr("disabled", true);
                    $("#itemNm").attr("disabled", true);
                    $("#itemDstinCd").data("kendoExtDropDownList").enable(false);
                    $("#itemDstinAmosCd").data("kendoExtDropDownList").enable(false);
                    $("#itemDstinAmosCd").data("kendoExtDropDownList").setDataSource(itemDstinAmosCdList);
                    $("#oldRplcItemCd").attr("disabled", true);

                    $("#oldRplcParCmptYn").attr("disabled", true);
                    $("#newRplcItemCd").attr("disabled", true);

                    $("#newRplcParCmptYn").attr("disabled", true);
                    $("#sucCd").data("kendoExtDropDownList").enable(false);
                    $("#lastCmptItemCd").attr("disabled", true);
                    $("#carUseUnitCnt").closest(".k-numerictextbox").addClass("form_readonly");
                    $("#carUseUnitCnt").data("kendoExtNumericTextBox").enable(false);
                    $("#mobisImpLocalYnTp").data("kendoExtDropDownList").enable(false);
                    $("#parSpecCd").data("kendoExtDropDownList").enable(false);
                    $("#pncCd").attr("disabled", true);
                    $("#brandCd").data("kendoExtDropDownList").enable(false);

                    $("#startDt").data("kendoExtMaskedDatePicker").enable(false);
                    $("#endDt").data("kendoExtMaskedDatePicker").enable(false);
                    $("#oldRplcParCmptYn").data("kendoExtDropDownList").enable(false);
                    $("#newRplcParCmptYn").data("kendoExtDropDownList").enable(false);

                    //영문명칭,차종,단위,차형 수정불가.
                    $("#itemEnNm").attr("disabled", true);
                    $("#carlineCd").data("kendoExtDropDownList").enable(false);
                    $("#stockUnitCd").data("kendoExtDropDownList").enable(false);
                    $("#carlineCd2").data("kendoExtDropDownList").enable(false);

                    $("button[name=btnDelete]").data("kendoButton").enable(false);
                }

                $("#itemDstinAmosCd").data("kendoExtDropDownList").value(result.itemDstinAmosCd);

                // 'U' update mode
                gCrud = 'U';
                //file download url

                //gridItemDstinInfo
                $('#gridItemDstinInfo').data('kendoExtGrid').dataSource.read();
                //gridItemPrice
                $("#gridItemPrice").data("kendoExtGrid").dataSource.read();
                //gridComItem
                $("#gridComItem").data("kendoExtGrid").dataSource.read();

                //file view funcion checked.
                $("#fileDocNo").val();
                if($("#fileDocNo").val() !== ""){
                    var fileDocUrl = "<c:url value='/cmm/sci/fileUpload/selectFileDownload.do' />" + "?fileDocNo=" + $("#fileDocNo").val() + "&fileNo=" + 1 + "&inline=true";
                    $("#fileDocUrl").attr("src", fileDocUrl);
                }else{
                    $("#fileDocUrl").attr("src", "");
                }

            });
        }

        /* *************************************************************************
         **************************file attachment********************************************
         ***************************************************************************/
         //================================
         var attachment = new Resumable({
             target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
             ,chunkSize:1 * 1024 * 1024
             ,simultaneousUploads:4
             ,testChunks:true
             ,throttleProgressCallbacks:1
             ,method:"octet"
         });
         attachment.assignBrowse($('#attachmentSelect')[0]);

         //file add event
         attachment.on('fileAdded', function(file) {

             $("#progressWindow").kendoWindow({
                 width:"600px"
                 ,height:"300px"
                 ,title:"<spring:message code='global.lbl.fileSend'/>"     //file send
                 ,animation:false
                 ,draggable:false
                 ,visible:false
                 ,resizable:false
                 ,modal:true
             }).data("kendoWindow").center().open();

             $('.resumable-progress, .resumable-list').show();
             $('.resumable-progress .progress-resume-link').hide();
             $('.resumable-progress .progress-pause-link').show();
             //file list output
             $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
             $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

             //업로드 시작
             attachment.upload();

         });
         attachment.on('pause', function() {
             $('.resumable-progress .progress-resume-link').show();
             $('.resumable-progress .progress-pause-link').hide();
         });
         attachment.on('uploadStart', function() {

             var _that = this;

             if (_that.opt["query"] == null) {
                  _that.opt["query"] = {};
             }

             if (dms.string.isEmpty($("#fileDocNo").val())) {

                     $.ajax({
                         url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                         dataType:"json",
                         type:"get",
                         async:false,
                         cache:false,
                         success:function(id) {
                             _that.opt["query"]["resumableSessionId"] = id;
                             $("#fileDocNo").val(id);
                         }
                     });

             } else {
                 var deleteList = [];
                     deleteList.push({"fileDocNo":$("#fileDocNo").val(), "fileNo":1});

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

                         $.ajax({
                             url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                             dataType:"json",
                             type:"get",
                             async:false,
                             cache:false,
                             success:function(id) {
                                 _that.opt["query"]["resumableSessionId"] = id;
                                 $("#fileDocNo").val(id);
                             }
                         });
                     }
                 });
             }


             $('.resumable-progress .progress-resume-link').hide();
             $('.resumable-progress .progress-pause-link').show();
         });
         attachment.on('complete', function() {

             var _that = this;

             $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();

             $("#progressWindow").data("kendoWindow").close();
             attachment.files = [];
             $(".resumable-list").html("");
         });
         attachment.on('fileSuccess', function(file, message) {
             var result = JSON.parse(message);
             if(result.status === "finished") {
                 $("#fileDocNo").val(result.fileDocNo);
                 var fileDocUrl = "<c:url value='/cmm/sci/fileUpload/selectFileDownload.do' />" + "?fileDocNo=" + $("#fileDocNo").val() + "&fileNo=" + 1 + "&inline=true";
                 $("#fileDocUrl").attr("src", fileDocUrl);
             }
         });
         attachment.on('fileError', function(file, message) {
             $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded:' + message + ')');
         });
         attachment.on('fileProgress', function(file) {
             var fileProgress = 0;

             if (file instanceof ResumableChunk) {
                 fileProgress = file.fileObj.progress();
             } else {
                 fileProgress = file.progress();
             }

             $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
             $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
             $('.progress-bar').css({width:Math.min(Math.floor(attachment.progress() * 100), 100)+ '%'});
         });
         /* *************************************************************************
         **************************file attachment****************************************
         ***************************************************************************/

        initPage();

    });
</script>
<!-- //script -->


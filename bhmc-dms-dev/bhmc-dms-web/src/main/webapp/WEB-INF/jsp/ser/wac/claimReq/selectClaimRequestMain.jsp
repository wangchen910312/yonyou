<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

    <!-- 조회승인신청 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">
            <div class="header_area">

                <div class="btn_left">
                    <dms:access viewId="VIEW-D-11743" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!--초기화  -->
                    </dms:access>
                  <%--   <dms:access viewId="VIEW-D-11743" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_s_min5" id="btnInit"><spring:message code="global.btn.init" /></button>
                    </dms:access> --%>
                </div>

                <div class="btn_right">
                    <dms:access viewId="VIEW-D-11747" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11746" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="print" class="btn_m "><spring:message code="global.btn.print" /><!-- 인쇄 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12909" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="printA4" class="btn_m "><spring:message code="ser.btn.printA4" /><!-- A4인쇄 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11745" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m " id="btnExcelExport"><spring:message code="ser.btn.excelDownload" /></button>
                    </dms:access>
                </div>
            </div>
            <form id="form">
                <div id="tabstrip1" class="tab_area mt0">
                    <ul>
                        <li id="claim" class ="k-state-active"><spring:message code="ser.title.claimReq" /></li>
                        <li id="ro"><spring:message code="ser.lbl.roSearch" /></li>
                    </ul>

                    <!-- 클레임신청 -->
                    <div>
                        <div class="table_form" role="search" data-btnid="btnSearch">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:10%;">
                                    <col style="width:24%;">
                                    <col style="width:8%;">
                                    <col style="width:12%;">
                                    <col style="width:8%;">
                                    <col style="width:12%;">
                                    <col style="width:13%;">
                                    <col style="width:13%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><spring:message code="ser.lbl.wrtrDt" /></th><!-- 작성일자 -->
                                        <td>
                                            <div class="form_float">
                                                <div class="date_left">
                                                    <input type="text" id="sClaimFromDt" class="form_datepicker ac" />
                                                    <span class="txt_from">~</span>
                                                </div>
                                                <div class="date_right">
                                                    <input type="text" id="sClaimToDt" class="form_datepicker ac" />
                                                </div>
                                            </div>
                                        </td>
                                        <th scope="row"><spring:message code="ser.lbl.claimStatNm" /></th><!-- 클레임상태 -->
                                        <td>
                                            <input type="text" id="sClaimStatCd" name="sClaimStatCd" class="form_comboBox" />
                                        </td>
                                        <th scope="row"><spring:message code="ser.lbl.claimTp" /></th><!-- 클레임유형 -->
                                        <td>
                                            <input type="text" id="sClaimTp" name="sClaimTp" class="form_comboBox"    />
                                        </td>
                                        <th scope="row" class="th_form"><input type="text" id="sField" name="sField" class="form_comboBox al" style="width:85%;" /></th><!-- 조회 조건-->
                                        <td>
                                            <input type="text" id="sText" name="sText" class="form_input" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="table_grid mt10">
                           <div id="gridClaim" class="grid"></div>
                        </div>
                    </div>
                    <!-- //클레임신청-->

                    <!-- RO -->
                    <div>
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
                                        <th scope="row"><spring:message code="ser.lbl.roDate" /></th><!-- RO일자 -->
                                        <td>
                                            <div class="form_float">
                                                <div class="date_left">
                                                    <input type="text" id="sRoFromDt" class="form_datepicker ac" />
                                                    <span class="txt_from">~</span>
                                                </div>
                                                <div class="date_right">
                                                    <input type="text" id="sRoToDt" class="form_datepicker ac" />
                                                </div>
                                            </div>
                                        </td>
                                        <th scope="row"><spring:message code="ser.lbl.vinNo" /></th><!-- 차대번호 -->
                                        <td>
                                            <input type="text" id="sVinNo" name="sVinNo" class="form_input" />
                                        </td>
                                        <th scope="row"><spring:message code="ser.lbl.roDocNo" /></th><!-- RO 번호 -->
                                        <td>
                                            <input type="text" id="sRoDocNo" name="sRoDocNo" class="form_input" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="table_grid mt10">
                           <div id="gridRo" class="grid" ></div>
                        </div>
                    </div>
                    <!-- //RO -->
                </div>
            </form>
        </section>
        <form id="claimRequestForm">
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                        <dms:access viewId="VIEW-D-11744" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_min5" id="btnInquire"><spring:message code="global.btn.search" /></button>
                        </dms:access>
                        <%-- <dms:access viewId="VIEW-D-11743" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_min5" id="btnInit"><spring:message code="global.btn.init" /></button>
                        </dms:access> --%>
                        <dms:access viewId="VIEW-D-11742" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_min5" id="btnSave"><spring:message code="global.btn.save" /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11741" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" class="btn_s btn_s_min5" id="btnCancel" disabled><spring:message code="global.btn.cancel" /></button>
                        </dms:access>
                        <button type="button" class="btn_s btn_s_min5 btnAuth" id="btnReq" disabled><spring:message code="global.btn.req" /></button>
                        <button type="button" class="btn_s btn_s_min5 btnAuth" id="btnReqCancel" disabled><spring:message code="global.btn.reqCancel" /></button>
<%--                         <dms:access viewId="VIEW-D-11740" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_s_min5 btnAuth" id="btnReq" disabled><spring:message code="global.btn.req" /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11739" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_s_min5 btnAuth" id="btnReqCancel" disabled><spring:message code="global.btn.reqCancel" /></button>
                        </dms:access> --%>
                    </div>
                </div>
                <div class="table_form form_width_100per ">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:11%;">
                            <col style="width:14%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.claimNo" /></th><!-- 클레임번호 -->
                                <td colspan="3">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.4%;">
                                            <input type="text" id="sClaimDocNo" name="sClaimDocNo" class="form_input" /> <!--클레임번호 -->
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.claimTp" /></span></th><!-- 클레임유형 -->
                                <td>
                                    <input type="text" id="claimTp" name="claimTp" class="form_comboBox" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.tecAdvNo" /></th><!-- 기술자문번호 -->
                                <td>
                                    <div class="form_search" style="width:50%;">
                                        <input type="text" id="claimTcavNo" name="claimTcavNo" readonly class="form_input form_readonly" data-json-obj="true" />
                                        <a href="javascript:selectSanbaoTechAprSearchPopupWindow();"></a>
                                    </div>
                                    <dms:access viewId="VIEW-D-11738" hasPermission="${dms:getPermissionMask('READ')}">
                                        <button type="button" class="btn_s btn_search btn_s_min5" id="btnTcavNoDel"><spring:message code="ser.btn.cancel" /></button>
                                    </dms:access>
                                </td>

                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_form mt10">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:11%;">
                            <col style="width:14%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.claimNo" /></th><!-- 클레임번호 -->
                                <td class="readonly_area">
                                    <input type="text" id="claimDocNo" name="claimDocNo" class="form_input" readonly data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.claimStatNm" /></th><!-- 클레임상태 -->
                                <td class="readonly_area">
                                    <input type="text" id="claimStatCd" name="claimStatCd" class="form_comboBox" readonly data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.claimRegDt" /></th><!-- 생성일 -->
                                <td class="readonly_area">
                                    <input type="text" id="regDt" name="regDt" readonly class="form_datepicker ac"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.vinNo" /></th><!-- 차대번호 -->
                                <td class="readonly_area">
                                     <input type="text" id="vinNo" name="vinNo" class="form_input" readonly data-json-obj="true"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.roDocNo" /></th><!-- RO번호 -->
                                <td class="readonly_area">
                                    <input type="text" id="roDocNo" name="roDocNo" class="form_input" readonly data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.roStatus" /></th><!-- RO상태 -->
                                <td class="readonly_area">
                                    <input type="text" id="roStatCd" name="roStatCd" class="form_comboBox" readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.roDate" /></th><!-- RO발행일 -->
                                <td class="readonly_area">
                                    <input type="text" id="roDt" name="roDt" readonly class="form_datepicker ac" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.carLine" /></th><!-- 차종 -->
                                <td class="readonly_area">
                                    <input type="text" id="ltsModelNm" name="ltsModelNm" class="form_input" readonly   />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.enginNo" /></th><!--엔진번호 -->
                                <td class="readonly_area">
                                    <input type="text" id="enginNo" name="enginNo" readonly class="form_input" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.wartDt" /></th><!-- 보증수리일자 -->
                                <td class="readonly_area">
                                    <input type="text" id="wartDt" name="wartDt" readonly class="form_datepicker ac" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.roStartDt" /></span></th><!-- 작업시작일 -->
                                <td class="readonly_area">
                                    <input type="text" id="roStartDt" name="roStartDt" readonly class="form_datepicker ac" data-json-obj="true"/>
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.roEndDt" /></span></th><!-- 작업종료일 -->
                                <td class="readonly_area">
                                    <input type="text" id="roEndDt" name="roEndDt" readonly class="form_datepicker ac" data-json-obj="true"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.runDist" /></th><!-- 주행거리 -->
                                <td colspan="3" class="readonly_area">
                                    <div class="form_float">
                                        <div class="form_left" style="width:18%;"> <!-- 37.4 -->
                                            <input type="text" id="runDistVal" name="runDistVal" class="form_numeric ar" data-json-obj="true"/>

                                        </div>
                                         <div class="form_right" style="width:18.2%;"> <!-- 62.6 -->
                                            <input type="text" id="lastRunDistVal" name="lastRunDistVal" readonly class="form_numeric ar" />
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.pwaDocNo" /></th><!-- PWA -->
                                <td colspan="4">
                                    <div class="form_left" style="width:37.4%">
                                        <div class="form_search" ><!-- 169px -->
                                            <input type="text" id="pwaApproveNo" name="pwaApproveNo" class="form_input form_readonly" readonly data-json-obj="true" />
                                            <a href="javascript:selectPwaApproveSearchPopupWindow();"></a>
                                        </div>
                                     </div>
                                    <div class="form_right" style="width:62.6%;">
                                        <dms:access viewId="VIEW-D-11737" hasPermission="${dms:getPermissionMask('READ')}">
                                            <button type="button" class="btn_s btn_search btn_s_min5" id="btnPwaAprNoDel"><spring:message code="ser.btn.cancel" /></button>
                                        </dms:access>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span id="cauCdSpan" class="bu_required"><spring:message code="ser.lbl.cauCd" /></span></th><!-- 원인 -->
                                <td colspan="3" class="readonly_area">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.4%;">
                                            <input type="text" id="cauCd" name="cauCd" readOnly class="form_input" data-json-obj="true"/> <!-- 원인코드 -->
                                        </div>
                                        <div class="form_right" style="width:62.6%;">
                                            <div class="form_search">
                                                <input type="text" id="cauNm" name="cauNm" readOnly class="form_input" data-json-obj="true" /> <!-- 원인코드명 -->
                                                <a href="javascript:selectPhenCauCodeSearchPopupWindow();"></a>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><span id="phenCdSpan" class="bu_required"><spring:message code="ser.lbl.phenCd" /></span></th><!-- 현상(N) -->
                                <td colspan="3" class="readonly_area">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.4%;">
                                            <input type="text" id="phenCd" name="phenCd" readOnly class="form_input" data-json-obj="true" />
                                        </div>
                                        <div class="form_right" style="width:62.6%;">
                                            <input type="text" id="phenNm" name="phenNm" readOnly class="form_input" data-json-obj="true"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span id="remarkSpan" class="bu_required"><spring:message code="ser.lbl.problem" /></span></th><!-- 문제점 -->
                                <td colspan="3">
                                    <input type="text" id="remark" name="remark"  maxLength="80" class="form_input" data-json-obj="true" /><!-- 索赔单的说明 字数控制在 中文字幕70字内 增加 maxLength="70" 贾明 2018-12-10 -->
                                </td>
                                <th scope="row"><span id="cauItemCdSpan" class="bu_required"><spring:message code="ser.lbl.cauItemCd" /></span></th><!-- 원인부품 -->
                                <td colspan="3" class="readonly_area">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.4%">
                                            <div class="form_search">
                                                <input type="text" id="cauItemCd" name="cauItemCd" readOnly class="form_input" data-json-obj="true" />
                                                 <a href="javascript:partSearchPopupWindow('IP')"></a>
                                            </div>
                                        </div>
                                        <div class="form_right" style="width:62.6%">
                                            <input type="text" id="cauItemNm" name="cauItemNm" readOnly class="form_input" data-json-obj="true"/> <!-- 원인부품명 -->
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span id="cauOperAtcCdSpan" class="bu_required"><spring:message code="ser.lbl.mainLbrCd" /></span></th><!-- OP코드 -->
                                <td colspan="3" class="readonly_area">
                                    <div class="form_float">
                                        <div class="form_left" style="width:37.4%">
                                            <input type="text" id="cauOperAtcCd" name="cauOperAtcCd" readOnly class="form_input" data-json-obj="true" /> <!-- 주작업코드 -->
                                        </div>
                                        <div class="form_right" style="width:62.6%">
                                            <input type="text" id="cauOperAtcNm" name="cauOperAtcNm" readOnly class="form_input form_readonly" data-json-obj="true"/> <!-- 주작업코드명 -->
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.subDistin" /></th><!-- 외주구분 -->
                                <td>
                                    <input type="text" id="subDstinCd" name="subDstinCd" class="form_comboBox" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.prePartTp" /></th><!-- 이전부품유형  -->
                                <td>
                                    <input type="text" id="asParWartDstinCd" name="asParWartDstinCd" class="form_comboBox" data-json-obj="true"/>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.dtcCd" /></th><!-- 고장코드(DTC) -->
                                <td colspan="7">
                                    <div class="form_float">
                                        <div class="form_left" style="width:13%;">
                                            <input type="text" id="dtc1Cd" name="dtc1Cd" class="form_input dtcChk" maxLength="5" data-json-obj="true"/>
                                        </div>
                                        <div class="form_left" style="width:12%;">
                                            <input type="text" id="dtc1UseYn" name="dtc1UseYn" class="form_comboBox" data-json-obj="true"/>
                                        </div>
                                        <div class="form_left" style="width:13%;">
                                            <input type="text" id="dtc2Cd" name="dtc2Cd" class="form_input dtcChk" maxLength="5" data-json-obj="true"/>
                                        </div>
                                        <div class="form_left" style="width:12%;">
                                            <input type="text" id="dtc2UseYn" name="dtc2UseYn" class="form_comboBox"  data-json-obj="true"/>
                                        </div>
                                        <div class="form_left" style="width:13%;">
                                            <input type="text" id="dtc3Cd" name="dtc3Cd" class="form_input dtcChk" maxLength="5" data-json-obj="true"/>
                                        </div>
                                        <div class="form_left" style="width:12%;">
                                            <input type="text" id="dtc3UseYn" name="dtc3UseYn" class="form_comboBox" data-json-obj="true"/>
                                        </div>
                                        <div class="form_left" style="width:13%;">
                                            <input type="text" id="dtc4Cd" name="dtc4Cd" class="form_input dtcChk" maxLength="5" data-json-obj="true"/>
                                        </div>
                                        <div class="form_right" style="width:12%;">
                                            <input type="text" id="dtc4UseYn" name="dtc4UseYn" class="form_comboBox dtcChk" data-json-obj="true"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <section class="group">
                <div class="table_form mt10">
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
                                <th scope="row"><span id="befRoDocNoSpan"><spring:message code="ser.lbl.preRoDocNo" /></span></th><!-- 이전RO번호 -->
                                <td class="bor_none">
                                    <div class="form_search">
                                        <input type="text" id="befRoDocNo" maxlength="18" name="befRoDocNo" readonly class="form_input form_readonly preRoChk" data-json-obj="true"  />
                                        <a href="javascript:selectBefRoNoPopupWindowWindow();"></a>
                                    </div>
                                </td>
                                <th scope="row"><span id="befRoDtSpan"><spring:message code="ser.lbl.preRoDt" /></span></th><!-- 이전RO일자 -->
                                <td>
                                    <input type="text" id="befRoDt" name="befRoDt" class="form_datetimepicker ac" />
                                </td>
                                <th scope="row"><span id="befRunDistValSpan"><spring:message code="ser.lbl.preRunDist" /></span></th><!-- 이전주행거리 -->
                                <td>
                                    <input type="text" id="befRunDistVal" name="befRunDistVal" class="form_numeric ar" data-json-obj="true" />
                                </td>
                                <th scope="row" class="bor_none"></th>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.itemAmt" /></th><!-- 부품금액 -->
                                <td>
                                    <input type="text" id="itemAmt" name="itemAmt" readonly class="form_numeric ar form_readonly" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.lbrAmt" /></th><!-- 공임금액 -->
                                <td>
                                    <input type="text" id="lbrAmt" name="lbrAmt" readonly class="form_numeric ar form_readonly" data-json-obj="true" />
                                </td>
                                <th scope="row"><label><!-- <input type="checkbox" name="subLbrChk" id="subLbrChk" class="form_check"> --> <spring:message code="ser.lbl.subLbrAmt" /></label></th><!-- 외주금액 -->
                                <td>
                                    <input type="text" id="subAmt" name="subAmt" class="form_numeric ar" data-json-obj="true"/>
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.totAmt" /></th><!-- 총금액 -->
                                <td>
                                    <input type="text" id="totAmt" name="totAmt" readonly class="form_numeric ar form_readonly" data-json-obj="true"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- 탭메뉴 전체 영역 -->
            <div id="tabstrip2" class="tab_area">
                <!-- 탭메뉴 -->
                <ul>
                	<!--update by tjx 新增客户主诉内容查询 -->
                	<li class="k-state-active"><spring:message code="ser.lbl.custRemark" /></li>
                    <li ><spring:message code="ser.lbl.lbr" /></li>
                    <li><spring:message code="ser.lbl.item" /></li>
                    <li><spring:message code="ser.lbl.file" /></li>
                </ul>
                <!-- //탭메뉴 -->
                <!--update by tjx 新增客户主诉内容查询 -->
                <div>
	                <div class="table_grid">
	                    <div id="gridCustRemark" class="grid"></div>
	                </div>
                </div>
                <!--update by tjx 新增客户主诉内容查询 -->
                <div>
                     <div class="btn_right_absolute">
                        <dms:access viewId="VIEW-D-11736" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="lbrAdd" class="btn_s btn_s_min5 "><spring:message code="global.btn.add" /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11735" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="lbrDel" class="btn_s btn_s_min5 "><spring:message code="global.btn.rowDel" /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11734" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="lbrCancel" class="btn_s btn_s_min5 "><spring:message code="global.btn.cancel" /></button>
                        </dms:access>
                    </div>
                    <div class="table_grid">
                        <div id="gridLabor" class="grid"></div>
                    </div>
                </div>
                <!-- //정비항목 -->
                <!-- 부품 -->
                <div>
                    <div class="btn_right_absolute">
                        <dms:access viewId="VIEW-D-11733" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="parAdd" class="btn_s btn_s_min5 "><spring:message code="global.btn.add" /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11732" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="parDel" class="btn_s btn_s_min5 "><spring:message code="global.btn.rowDel" /></button>
                        </dms:access>
                        <dms:access viewId="VIEW-D-11731" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="parCancel" class="btn_s btn_s_min5 "><spring:message code="global.btn.cancel" /></button>
                        </dms:access>
                    </div>
                    <div class="table_grid">
                        <div id="gridPart" class="grid"></div>
                    </div>
                </div>
                <!-- 부품 -->
                <!-- 사진 -->
                <div>
                    <!-- 파일업로드관련 include page -->
                    <div class="btn_right_absolute">
                        <dms:access viewId="VIEW-D-11730" hasPermission="${dms:getPermissionMask('READ')}">
                            <span class="btn_file" id="btnFileAdd"><spring:message code="ser.btn.fileUpload" /></span>  <!-- 파일찾기 -->
                        </dms:access>
                        <dms:access viewId="VIEW-D-11729" hasPermission="${dms:getPermissionMask('READ')}">
                            <button type="button" id="btnFileDel" name="btnFileDel" class="btn_s" disabled><spring:message code="global.btn.fileDelete" /></button>
                        </dms:access>
                    </div>
                    <jsp:include page="/WEB-INF/jsp/ser/cmm/file/selectFileInfoNoBtn.jsp"></jsp:include>
                    <!-- 파일업로드관련 include page -->
                </div>
                <!-- 사진 -->
            </div>
            <!-- //탭메뉴 전체 영역 -->
            <!-- //조회승인신청 -->
             <div class="header_area">
                 <div class="btn_right">
                    <dms:access viewId="VIEW-D-11728" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnReturnReason" disabled><spring:message code="ser.btn.returnReasonCont" /></button> <!-- 반송이유 팝업-->
                    </dms:access>
                    <dms:access viewId="VIEW-D-11727" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnRoHistPopup" disabled><spring:message code="ser.btn.btnRoHist" /></button><!--R/O 이력 팝업 -->
                    </dms:access>
                 </div>
             </div>
             <div style="display:none">
             <input type="text" id="dlrCd" name="dlrCd" data-json-obj="true"/>
             <input type="text" id="crNo" name="crNo" data-json-obj="true"/>
             <input type="text" id="ltsModelCd" name="ltsModelCd" data-json-obj="true"/>
             <input type="text" id="carOwnerId" name="carOwnerId" data-json-obj="true"/>
             <input type="text" id="carOwnerNm" name="carOwnerNm" data-json-obj="true"/>
             <input type="text" id="carDstinCd" name="carDstinCd" data-json-obj="true"/>
             <input type="text" id="roGrpNo" name="roGrpNo" data-json-obj="true"/>
             <input type="text" id="roTp" name="roTp" data-json-obj="true"/>
             <input type="text" id="claimVerCd" name="claimVerCd" data-json-obj="true"/>
             <input type="text" id="roWorkTime" name="roWorkTime" value="" /> <!-- 삼보RO 작업시간 설정 -->
             <input type="text" id="orgClaimTcavNo" name="orgClaimTcavNo" value="" />
             <input type="text" id="orgPwaApproveNo" name="orgClaimTcavNo" value="" />
             <input type="text" id="carlineCd" name="carlineCd" value="" />
             <input type="text" id="carRegNo" name="carRegNo" data-json-obj="true" />
             <input type="text" id="claimReqDt" name="claimReqDt" />
             </div>
        </form>
    </div>
</div>
<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->
<!-- script -->
<script type="text/javascript">
var qcVal = 1;//区分有没有点击取消申请按钮，1未点击，2为点击过了  为申请按钮隐藏做准备 贾明 2018-11-13
var qcValR =1;//1时隐藏，2为展示 当选中的状态为返回时，申请按钮设置为隐藏 贾明 2018-11-15
var isDbClice=1;//是否双击 1 不是，2是 贾明 2018-11-15
var claimDocNoVal = 1;// 贾明2018-11-15 索赔单号
var isTablet="${isTablet}";
var _width=920;//web
var _height=630;//web
if(isTablet == "true"){
    _width=950;//tablet
    _height=550;//tablet
}

var roUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForRo.do' />";
var rolbrUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForRoLabour.do' />";
var roPartUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForRoPart.do' />";

var roGoodWillUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForRoGoodWillByKey.do' />";
var roGoodWilllbrUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForRoGoodWillLabour.do' />";
var roGoodWillPartUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForRoGoodWillPart.do' />";

var claimUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForClaim.do' />";
var claimLbrUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForClaimLabour.do' />";
var claimPartUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForClaimPart.do' />";
//客户主诉查询路径
var claimCustRemarkUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForClaimCustRemark.do' />";


/** 원인현상코드 조회 팝업 **/
var phenCauCodeWin;
/** 부품 조회 팝업 **/
var selectShareStockGiItemPopupWindow;
/** PWA 승인번호조회 팝업**/
var pwaApprovePopupWindow;
/** 이전 RO 팝업**/
var befRoNoPopupWindow;
/** 정비이력 조회 팝업 **/
var repairOrderSearchPopup;

/** 미사용 공임 부품  조회 팝업 **/
var repairOrderNotUsedSearchPopup;

/** 삼포 기술제출 조회 팝업 **/
var sanbaoTechApproveWindow;
/** 클레임 반송원인 조회 팝업 **/
var claimRequestReturnPopupWindow;

var selectTabId = "claim";

//var rateList = [];

//클레임 그리드 선택 Row
var gridRow = 0;
var rowClaimDocNo;


/**캠페인 유형**/
var campaignTpList = [];
 <c:forEach var ="obj" items="${campaignTpDs}">
 campaignTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:forEach>

 /**조회조건**/
var searchTpList = [];
 <c:forEach var ="obj" items="${searchTpDs}">
 searchTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:forEach>

 /**RO유형**/
var roTpList = [];
<c:forEach var ="obj" items="${roTpDs}">
  roTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpList, function(obj){return obj.cmmCd;});

/** 임률정보  **/
var rateList = [];
<c:forEach var ="obj" items="${rateDs}">
  rateList.push({
        rpirTp:"${obj.rpirTp}"
        , rpir01:"${obj.gnlRteRate}"
        , rpir02:"${obj.wartRteRate}"
        , rpir03:"${obj.incRteRate}"
        , rpir04:"${obj.intRteRate}"
        , rpir05:"${obj.rwrkRteRate}"
    });
</c:forEach>

/**클레임유형**/
var claimTpList = [];
<c:forEach var ="obj" items="${claimTpDs}">
//claimTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
claimTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"[${obj.cmmCd}]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"}); //khs 최재훈대리가 시킨겁니다.
</c:forEach>
var claimTpMap = dms.data.arrayToMap(claimTpList , function(obj){return obj.cmmCd;});

/**삼보 RO 작업시간 설정**/
<c:forEach var ="obj" items="${roWorkTimeDs}">
  $("#roWorkTime").val("${obj.applyPrid}");
</c:forEach>

/**클레임상태**/
var claimStatList = [];
 <c:forEach var ="obj" items="${claimStatDs}">
 claimStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:forEach>
 var claimStatMap = dms.data.arrayToMap(claimStatList , function(obj){return obj.cmmCd;});

 /**RO 상태**/
 var roStatList = [];
<c:forEach var ="obj" items="${roStatDs}">
roStatList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}", "useYn":"${obj.useYn}"});
</c:forEach>
var roStatCdArr = dms.data.arrayToMap(roStatList, function(obj){return obj.cmmCd;});

/**외주구분 코드**/
var subDstinList = [];
 <c:forEach var ="obj" items="${subDstinDs}">
 subDstinList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}", "useYn":"${obj.useYn}"});
 </c:forEach>

/**이전부품코드**/
var asPartDsList = [];
<c:forEach var ="obj" items="${asPartDs}">
asPartDsList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}", "useYn":"${obj.useYn}"});
</c:forEach>

/** 고장코드**/
var dtcDsList = [];
<c:forEach var ="obj" items="${useYnDs}">
dtcDsList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}", "useYn":"${obj.useYn}"});
</c:forEach>


//주원인 여부
var cauYnList = [];
<c:forEach var ="obj" items="${cauYnDs}">
cauYnList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}", "useYn":"${obj.useYn}"});
</c:forEach>
var cauYnMap = dms.data.arrayToMap(cauYnList , function(obj){return obj.cmmCd;});

/**클레임유형**/
setClaimTpMap = function(value){
    var resultVal = "";
    if( dms.string.strNvl(value) != ""){
       if(claimTpMap[value] != undefined)
        resultVal =  claimTpMap[value].cmmCdNm;
    }
    return resultVal;
};

/**클레임상태**/
setClaimStatMap = function(value){
    var resultVal = "";
    if( dms.string.strNvl(value) != ""){
       if(claimStatMap[value] != undefined)
        resultVal =  claimStatMap[value].cmmCdNm;
    }
    return resultVal;
};
//주원인 여부
setCauYnMap = function(value){
    var resultVal = "";
    if(dms.string.strNvl(value) != ""){
       if(cauYnMap[value] != undefined)
        resultVal =  cauYnMap[value].cmmCdNm;
    }
    return resultVal;
};

//RO유형
roTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roTpCdArr[val] != undefined)
        returnVal = roTpCdArr[val].cmmCdNm;
    }
    return returnVal;
};

//RO상태
roStatCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roStatCdArr[val] != undefined)
        returnVal = roStatCdArr[val].cmmCdNm;
    }
    return returnVal;
};

$(document).ready(function() {

    $("#sClaimDocNo").bind("keyup",function(){
        $(this).val($(this).val().toUpperCase());
     });

    var onlyNumAlpha = new RegExp("[^a-zA-Z0-9]");
    $(".dtcChk").keyup(function(e)
    {
        var contents = $(this).val();
        if(onlyNumAlpha.test(contents)){
            $(this).val('');
        }
    });

    $(".preRoChk").keyup(function(e)
    {
        var contents = $(this).val();
        if(onlyNumAlpha.test(contents)){
            $(this).val('');
        }
    });

    /********************** 팝업  설정 ***************************/
  //부품조회팝업
    partSearchPopupWindow = function (sFlag){

        if($("#ltsModelCd").val() == ""){
            return dms.notification.warning("<spring:message code='global.info.preInquire' />");
        }

        selectShareStockGiItemPopupWindow = dms.window.popup({
            windowId:"partsMasterPopup"
            ,title:"<spring:message code='ser.title.itemInfo' />"   // 품목정보
            ,height : _height //todo khskhs 사이즈변경 완료
            ,content:{
                //url:"<c:url value='/par/cmm/selectShareStockGiItemPopup.do'/>"
                url:"<c:url value='/ser/wac/pwaReq/selectPwaItemSearchPopup.do'/>"
                ,data: {
                     "autoBind":false
                     ,"selectable":(sFlag == "GD") ? "multiple":"row"
                     ,"prcTp" :"04"
                     ,"carlineCd" : ($("#carlineCd").val() != undefined) ? $("#carlineCd").val() : ""
                     ,"sFlag" :sFlag
                     ,"callbackFunc":function(jsonObj){
                        if(jsonObj.length > 0) {

                            var grid = $('#gridPart').data('kendoExtGrid');

                            if(sFlag == 'GD'){
                                $.each(jsonObj, function(idx, data){

                                    var copyData = {};
                                    var result = true;
                                    $.each(grid.dataSource._data , function(i , partData){
                                        if(partData.itemCd == data.itemCd){
                                            result = false;
                                        }
                                    });
                                    if(result){
                                        copyData = {
                                                  dlrCd :data.dlrCd
                                                , itemCd:data.itemCd
                                                , itemNm:data.itemNm
                                                , reqQty:data.itemQty
                                                , itemQty:data.itemQty
                                                , saleUnitCd:data.stockUnitCd
                                                , itemPrc: data.taxDdctGrtePrc
                                                , itemAmt: Number( ( ( ( data.salePrcAmt * data.itemQty ).toFixed(2) ) ).toFixed(2) )  //  ((부품단가 * markup * 수량 ) * tax)
                                                , cauItemYn:"N"
                                                , npnpYn:data.npnpYn
                                                , npnpMaxAmt:data.npnpMaxAmt
                                        };
                                        grid.dataSource.add(copyData);
                                        calLbrTotAmt();
                                    }

                                });
                             }else{
                                 $("#cauItemCd").val(jsonObj[0].itemCd);
                                 $("#cauItemNm").val(jsonObj[0].itemNm);

                                 // 그리드 원인부품 유무 초기화
                                 $.each(grid.dataSource._data, function(idx, data){
                                     grid.dataSource._data[idx].set("cauItemYn","N");
                                 });

                                 // 원인부품 선택한 부품코드가 그리드에 존재하면 원인부품 여부 선택
                                  $.each(jsonObj, function(idx, data){
                                     $.each(grid.dataSource._data , function(i , partData){

                                          if(partData.itemCd == data.itemCd){
                                             grid.dataSource._data[i].set("cauItemYn","Y");
                                         }
                                     });

                                 });

                                  calPartTotAmt();
                                  selectShareStockGiItemPopupWindow.close();

                             }
                        }
                    }
                }
            }
        });
    };

    /** 원인현상코드 조회 팝업 **/
    selectPhenCauCodeSearchPopupWindow = function (e){

        var cauItemMsg = "<spring:message code='ser.lbl.cauItemCd' var='cauItemCd' />"+
                         "<spring:message code='global.info.emptyCheckParam' arguments='${cauItemCd}' />";

        if($("#ltsModelCd").val() == ""){
            return dms.notification.warning("<spring:message code='global.info.preInquire' />");
        }
        if($("#cauItemCd").val()== "" ){ //ser.lbl.part
            return dms.notification.warning(cauItemMsg);
        }

        var paintYn = ($("#claimTp").val() == 'P') ? "P":"C";

        phenCauCodeWin = dms.window.popup({
            windowId:"phenCauCodeSearchPopupWindow"
            , title:"<spring:message code = 'ser.title.cauPhenSearch'/>"    //
            , template:$("#dstinCd").prop("readOnly", false).addClass("form_readonly")
            , height:400
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectNcdCcdCodePopup.do'/>"
                , data: {
                     "autoBind":false
                    ,"paintYn":paintYn //paintYn paint:P , 원인코드:C
                    ,"itemCd":$("#cauItemCd").val()
                    ,"callbackFunc":function(data){
                        $("#cauCd").val(data[0].cauCd);
                        $("#cauNm").val(data[0].cauNm);
                        $("#phenCd").val(data[0].phenCd);
                        $("#phenNm").val(data[0].phenNm);
                    }
                }
            }
        });
    };

    /** PWA 승인번호 조회 팝업 **/
    selectPwaApproveSearchPopupWindow = function (e){

        if($("#vinNo").val() == ""){
            return dms.notification.warning("<spring:message code='global.info.preInquire' />");
        }

        // PWA번호 선택하기전 필수 선택
        /* if( dms.string.isEmpty($("#cauCd").val()) ){
            return dms.notification.warning("<spring:message code='ser.lbl.cauCd' var='ser_lbl_cauCd' /><spring:message code='global.info.required.field' arguments='${ser_lbl_cauCd}' />");
        }

        if( dms.string.isEmpty($("#phenCd").val()) ){
            return dms.notification.warning("<spring:message code='ser.lbl.phenCd' var='ser_lbl_phenCd' /><spring:message code='global.info.required.field' arguments='${ser_lbl_phenCd}' />");
        } */

        if( dms.string.isEmpty($("#cauOperAtcCd").val()) ){
            return dms.notification.warning("<spring:message code='ser.lbl.mainLbrCd' var='mainLbrCd' /><spring:message code='global.info.required.field' arguments='${mainLbrCd}' />");
        }

        if( dms.string.isEmpty($("#cauItemCd").val()) ){
            return dms.notification.warning("<spring:message code='ser.lbl.cauItemCd' var='cauItemCd' /><spring:message code='global.info.required.field' arguments='${cauItemCd}' />");
        }

        var cauItemMsg = "<spring:message code='ser.lbl.vinNo' var='vinNo' />"+
                         "<spring:message code='global.info.emptyCheckParam' arguments='${vinNo}' />";
        /*  if($("#cauItemCd").val()== "" ){ //ser.lbl.part
            return dms.notification.warning(cauItemMsg);
        } */

        if(dms.string.isNotEmpty($("#orgPwaApproveNo").val())){
            return ;
        }

        pwaApprovePopupWindow = dms.window.popup({
            windowId:"pwaApprovePopupWindow"
            , title:"<spring:message code = 'ser.title.pwaList'/>"    //
            , template:$("#dstinCd").prop("readOnly", false).addClass("form_readonly")
            ,height:350
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectPwaApproveSearchPopup.do'/>"
                , data: {
                     "autoBind":true
                    ,"dlrCd":$("#dlrCd").val()
                    ,"vinNo":$("#vinNo").val()
                    ,"roDocNo":$("#roDocNo").val()
                    ,"pwaStatCd":"A"
                    ,"callbackFunc":function(data){
                        if(data.length != 0 ){

                            var cauOperAtcCd = data[0].cauOperAtcCd;
                            var cauItemCd = data[0].cauItemCd;
                            var cauCd = data[0].cauCd;
                            var cauNm = data[0].cauNm;
                            var phenCd = data[0].phenCd;
                            var phenNm = data[0].phenNm;
                            var pwaApproveNo = data[0].pwaApproveNo;
                            var errPhenCont = data[0].errPhenCont;   //PWA中的故障说明

                            if( /* !dms.string.isEmpty($("#cauCd").val()) ||
                                !dms.string.isEmpty($("#phenCd").val()) || */
                                !dms.string.isEmpty($("#cauOperAtcCd").val()) ||
                                !dms.string.isEmpty($("#cauItemCd").val())
                            ){

                                if( /* $("#cauCd").val() != cauCd ||
                                    $("#phenCd").val() != phenCd || */
                                    $("#cauOperAtcCd").val() != cauOperAtcCd ||
                                    $("#cauItemCd").val() != cauItemCd
                                ){
                                    return  dms.notification.warning("<spring:message code='ser.info.claimInfoDiffPwaInfo' />");
                                }else{
                                    $("#cauCd").val(cauCd);
                                    $("#cauNm").val(cauNm);
                                    $("#phenCd").val(phenCd);
                                    $("#phenNm").val(phenNm);
                                    $("#pwaApproveNoYn").val("Y");
                                    $("#orgPwaApproveNo").val(pwaApproveNo);
                                    $("#pwaApproveNo").val(pwaApproveNo);
                                }
                            }else{
                                $("#pwaApproveNoYn").val("Y");
                                $("#orgPwaApproveNo").val(pwaApproveNo);
                                $("#pwaApproveNo").val(pwaApproveNo);
                            }
                            //20200515 update by tjx 索赔申请页面选择PWA单据后，将PWA的故障现像说明写入到索赔单的说明字段内 start
                            $("#remark").val(errPhenCont);   
                            $("#remark").addClass("form_readonly");
			                //20200515 update by tjx 索赔申请页面选择PWA单据后，将PWA的故障现像说明写入到索赔单的说明字段内 end
                        }
                    }
                }
            }
        });
    };

    /** 삼포 기술제출  조회 팝업 **/
    selectSanbaoTechAprSearchPopupWindow = function (e){

        var cauItemMsg = "<spring:message code='ser.lbl.vinNo' var='vinNo' />"+
                         "<spring:message code='global.info.emptyCheckParam' arguments='${vinNo}' />";

        if($("#vinNo").val() == ""){
            return dms.notification.warning("<spring:message code='global.info.preInquire' />");
        }

        if(dms.string.isNotEmpty($("#orgClaimTcavNo").val())){
            return ;
        }

        sanbaoTechApproveSearchPopup = dms.window.popup({
            windowId:"sanbaoTechApproveSearchPopup"
            , title:"<spring:message code = 'ser.title.sanboTecApr'/>"    //
            , template:$("#dstinCd").prop("readOnly", false).addClass("form_readonly")
            , height:380
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectSanbaoTechApproveSearchPopup.do'/>"
                , data: {
                     "autoBind":true
                    ,"dlrCd":$("#dlrCd").val()
                    ,"vinNo":$("#vinNo").val()
                    ,"callbackFunc":function(data){
                        if(data.length != 0 ){
                            $("#claimTcavNo").val(data[0].approveNo);
                        }
                    }
                }
            }
        });
    };

    /** 이전 RO번호 조회 팝업 **/
    selectBefRoNoPopupWindowWindow = function (e){

        var cauItemMsg = "<spring:message code='ser.lbl.cauItemCd' var='cauItemCd' />"+
                         "<spring:message code='global.info.emptyCheckParam' arguments='${cauItemCd}' />";

        if($("#claimTp").val() != "S"){
            return;
        }

        if($("#vinNo").val() == ""){
            return dms.notification.warning("<spring:message code='global.info.preInquire' />");
        }
         if($("#cauItemCd").val()== "" ){ //ser.lbl.part
            return dms.notification.warning(cauItemMsg);
        }

        befRoNoPopupWindow = dms.window.popup({
            windowId:"befRoNoPopupWindow"
            , title:"<spring:message code = 'ser.lbl.roSearch'/>"    //
            , template:$("#dstinCd").prop("readOnly", false).addClass("form_readonly")
            ,height:350
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectPreRepairOrderSearchPopup.do'/>"
                , data: {
                     "autoBind":true
                    ,"dlrCd":$("#dlrCd").val()
                    ,"vinNo":$("#vinNo").val()
                    ,"itemCd":$("#cauItemCd").val()
                    ,"roDocNo":$("#roDocNo").val()
                    ,"roDt":$("#roDt").val()
                    , "callbackFunc":function(data){
                         $("#befRoDocNo").val(data[0].roDocNo);
                         $("#befRoDt").data("kendoExtMaskedDatePicker").value(data[0].roDt);
                         $("#befRunDistVal").data("kendoExtNumericTextBox").value(data[0].runDistVal);
                    }
                }
            }
        });
    };


    /** 정비이력 조회 팝업 **/
    selectRepairOrderSearchPopupWindow = function (e){

         repairOrderSearchPopup = dms.window.popup({
             windowId:"repairOrderSearchPopup"
             , width:_width //todo khskhs 사이즈변경 완료
             , height:550
             , title:"<spring:message code='ser.lbl.roSearch' />"   // RO 조회
             , content:{
                 url:"<c:url value='/ser/cmm/popup/selectRepairOrderHistorySearchPopup.do'/>"
                 , data:{
                     "autoBind":false
                     , "listType":"01"
                     ,"vinNo":$("#vinNo").val()
                     , "callbackFunc":function(data){

                     }
                 }
             }
         });

     };

    /** 미사용 공임 부품  조회 팝업 **/
    selectRepairOrderNotUsedSearchPopupWindow = function (e){

         repairOrderNotUsedSearchPopup = dms.window.popup({
             windowId:"repairOrderNotUsedSearchPopup"
             ,width:820
             ,height:340
             ,modal:true
             ,title:"<spring:message code='ser.lbl.roSearch' />"   // RO 조회
             ,content:{
                 url:"<c:url value='/ser/cmm/popup/selectRepairOrderForClaimSearchPopup.do'/>"
                 , data:{
                     "autoBind":false
                     ,"listType":"01"
                     ,"ltsModelCd":$("#ltsModelCd").val()
                     ,"claimTp":$("#claimTp").val()
                     ,"roDocNo":$("#roDocNo").val()
                     ,"claimDt":$("#regDt").data("kendoExtMaskedDatePicker").value()
                     , "callbackFunc":function(data,bizId){

                         if(bizId == "LBR"){
                             if(data.length > 0) addLbrGrid(data);
                         }else {
                             if(data.length > 0) addPartGrid(data);
                         }

                     }
                 }
             }
         });

     };

     /********************** 초기 데이터  설정 ***************************/

     //클레임 타입 선택 체크
     claimTpCheck = function(e){
         var claimTp = $("#claimTp").val();
         if(claimTp == "C" ||
                 claimTp == "K" ||
                 claimTp == "V" ||
                 claimTp == "R" ||
                 claimTp == "T" ||
                 claimTp == "G"

         ){
             //ser.info.isNotSelectClaimTp  var='dateMsg' ser.lbl.goodWillYn
             //<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />
             if(claimTp == "G"){
                 dms.notification.warning("<spring:message code='ser.lbl.goodWillYn' var='goodWillYn' /><spring:message code='ser.info.isNotSelectClaimTp' arguments='${goodWillYn}'/>");
             }else{
                 dms.notification.warning("<spring:message code='ser.lbl.campaign' var='campaign' /><spring:message code='ser.info.isNotSelectClaimTp' arguments='${campaign}'/>");
             }

             $("#claimTp").data("kendoExtDropDownList").value("");
             return;
         }else{

             setRequiredField(); //필수값 설정

             var gridLbr = $("#gridLabor").data("kendoExtGrid");
             var gridLbrData = gridLbr.dataSource._data;

             $.each(gridLbrData , function(i , gridData){
                 var dstinCd = gridData.dstinCd;
                 var zzCd    = gridData.lbrCd.substr(-2);

                 var lbrQty = Number(gridData.lbrQty);
                 var lbrHm  = Number(gridData.lbrHm);
                 var lbrPrc ;
       //R19051301908索赔申请的时候 工时单价不应该根据索赔类型自动更新机电和钣金喷漆的单价得正常应对80元和104。目前店里选择W类型的情况下 钣金喷漆会变成80。店里选择P类型的时候机电的工时会变成104 贾明 2019-5-13 start
                 if(claimTp == "W" || claimTp == "S" || claimTp == "P" || claimTp == "O" ){
                    lbrPrc = Number(gridData.lbrPrc);
                 } else {
                     lbrPrc = Number(serviceJs.setRpirRate(rateList , $("#roTp").val() , claimTp));
                 }
       //R19051301908索赔申请的时候 工时单价不应该根据索赔类型自动更新机电和钣金喷漆的单价得正常应对80元和104。目前店里选择W类型的情况下 钣金喷漆会变成80。店里选择P类型的时候机电的工时会变成104 贾明 2019-5-13 end
                 //var lbrPrc = Number(serviceJs.setRpirRate(rateList , $("#roTp").val() , claimTp));

                 // ZZ코드인경우 금액 0
                 if(dstinCd == "H" && zzCd == "ZZ"){
                     lbrPrc = 0;
                     lbrAmt = 0;
                 }

                 var lbrAmt = Number(( lbrQty * lbrHm * lbrPrc  ).toFixed(2));

                 gridLbr.dataSource._data[i].set("lbrAmt",lbrAmt);
                 gridLbr.dataSource._data[i].set("lbrPrc",lbrPrc );
                 calLbrTotAmt();

             });
         }

     };

     /**클레임/RO 조회조건 시작일자 **/
     $("#sClaimFromDt,#sRoFromDt").kendoExtMaskedDatePicker({
         format: "<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         ,value:"${sFromDt}"
     });

    /**클레임/RO 조회조건 종료일자**/
     $("#sClaimToDt,#sRoToDt").kendoExtMaskedDatePicker({
         format: "<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         ,value:"${sToDt}"
     });

    //조회조건 :  클레임 유형
     $("#sClaimTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:claimTpList
         //,template:"# if(data.cmmCd != '') { # [#:data.cmmCd#] #:data.cmmCdNm# #}#" //isTablet //khs 최재훈대리가 시킨겁니다.
         ,optionLabel:" "
         ,index:0
     });

     //클레임 유형
     $("#claimTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:claimTpList
         //,template:"# if(data.cmmCd != '') { # [#:data.cmmCd#] #:data.cmmCdNm# #}#" //isTablet /khs 최재훈대리가 시킨겁니다.
         ,optionLabel:" "
         ,index:0
         ,change:claimTpCheck
     });

     // 조회조건 : 검색유형
     $("#sField").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:searchTpList
         ,optionLabel:" "
         ,index:0
     });

     //조회조건 : 클레임 상태
     $("#sClaimStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:claimStatList
         ,optionLabel:" "
         ,index:0
     });

      // 클레임 상태
     $("#claimStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:claimStatList
         ,optionLabel:" "
         ,index:0
     });

     //조회조건 : RO 상태
     $("#roStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:roStatList
         ,optionLabel:" "
         ,index:0
     });

     //외주 구분
     $("#subDstinCd").kendoExtDropDownList({
          dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:subDstinList
         ,optionLabel:" "
         ,index:0
     });

     //이전 부품 유형
     $("#asParWartDstinCd").kendoExtDropDownList({
          dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:asPartDsList
         ,optionLabel:" "
         ,index:0
         ,enable:false
     });

     // 고장코드1,고장코드2,고장코드3,고장코드4
     $("#dtc1UseYn,#dtc2UseYn,#dtc3UseYn,#dtc4UseYn").kendoExtDropDownList({
          dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:dtcDsList
         ,index:2
     });

     /**부품금액,공임금액,총금액**/
     $("#itemAmt,#lbrAmt,#totAmt").kendoExtNumericTextBox({
        format: "n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,min: 0.00
       ,value: 0.00
       ,spinners: false
     });

     /**부품금액,공임금액,외주금액,총금액**/
     $("#subAmt").kendoExtNumericTextBox({
        format: "n2"                // n0:###,###, n2:###,###.##
       ,decimals:2                // 소숫점
       ,min: 0.00
       ,value: 0.00
       ,spinners: false
       ,change : function(e){
           calPartTotAmt();
       }
     });



     /**주행거리 , 최종주행거리, 이전주행거리 **/
     $("#runDistVal,#lastRunDistVal,#befRunDistVal").kendoExtNumericTextBox({
        min: 0
       ,format:"n0" //"{0:##,###}"
       ,value :0
       ,spinners: false             // 증,감 화살표

     });

     /** 클레임생성일,RO일자,이전RO일자,보증적용일자,작업시작일,작업종료일 **/
     $("#regDt,#roDt,#befRoDt,#wartDt,#roStartDt,#roEndDt").kendoExtMaskedDatePicker({
          format: "<dms:configValue code='dateFormat' />"
         ,value: ""
     });

     /********************** 초기 데이터  설정 ***************************/
     /**그리드 공임 추가 **/
     addLbrGrid = function(data){

         var grid = $("#gridLabor").data("kendoExtGrid");

         $.each(data, function(idx, popup){ //popup Labor Code Data
             var popupLbrCd = popup.lbrCd;
             var copyData = {};
             var result = true;

             $.each(grid.dataSource._data , function(i , gridData){ //grid Labor Code Data
                 var lbrCd = gridData.lbrCd;
                  if(lbrCd == popupLbrCd){
                     result = false;
                  }
             });
             if(result){
                 copyData = {
                         dlrCd:data[0].dlrCd
                        ,roDocNo:data[0].roDocNo
                        ,lbrCd:data[0].lbrCd
                        ,lbrNm:data[0].lbrNm
                        ,lbrHm:data[0].lbrHm
                        ,lbrQty:data[0].lbrQty
                        ,lbrPrc:data[0].lbrPrc
                        ,lbrAmt: data[0].lbrAmt
                        ,cauLbrYn:""
                        ,relCauLbrYn:data[0].relCauLbrYn
                        ,dstinCd:data[0].dstinCd
                        ,lbrTp:data[0].lbrTp
                 };
                 grid.dataSource.add(copyData);
                 calLbrTotAmt();
             }

         });

     };

     /**그리드 부품 추가 **/
     addPartGrid = function(data){

         var grid = $("#gridPart").data("kendoExtGrid");

         $.each(data, function(idx, popup){
             var popupItemCd = popup.itemCd;
             var copyData = {};
             var result = true;

             $.each(grid.dataSource._data , function(i , gridData){
                 var itemCd = gridData.itemCd;
                  if(itemCd == popupItemCd){
                     result = false;
                  }
             });

             if(result){
                 copyData = {
                         dlrCd      : data[0].dlrCd
                        ,roDocNo    : data[0].roDocNo
                        ,itemCd     : data[0].itemCd
                        ,itemNm     : data[0].itemNm
                        ,itemQty    : data[0].itemQty
                        ,lbrQty     : data[0].lbrQty
                        ,saleUnitCd : data[0].saleUnitCd
                        ,itemPrc    : data[0].itemPrc
                        ,itemAmt    : data[0].itemAmt
                        ,cauItemYn  : ""
                        ,npnpYn     : data[0].npnpYn
                        ,npnpMaxAmt : data[0].npnpMaxAmt

                 };
                 grid.dataSource.add(copyData);
                 calPartTotAmt();
             }

         });

     };

    /** 반송원인 조회 팝업 **/
    selectClaimRequestReturnPopupWindow = function (e){

        claimRequestReturnPopupWindow = dms.window.popup({
             windowId:"claimRequestReturnPopupWindow"
             , width:_width  //todo khskhs 사이즈변경 완료
             , height:350
             , title:"<spring:message code='ser.lbl.returnReasonCont' />"
             , content:{
                 url:"<c:url value='/ser/cmm/popup/selectClaimRequestReturnPopup.do'/>"
                 , data:{
                     "autoBind":false
                     ,"sClaimDocNo": $("#claimDocNo").val()
                     ,"sRoDocNo": $("#roDocNo").val()
                     , "autoBind":true
                     , "callbackFunc":function(data){

                     }
                 }
             }
         });
     };

    /********************** 팝업  설정 ***************************/



    /********************** 버튼  설정 ***************************/

    /** 조회 버튼**/
    $("#btnSearch").kendoButton({

        click:function(e){

            rowClaimDocNo = "";
            gridRow = 0;
            getSearchData(selectTabId);
        }
    });

    /** 초기화 **/
    $("#btnReset").kendoButton({
        click:function(e){

            initAll();
            $("#form").get(0).reset();

            /**클레임/RO 조회조건 시작일자 **/
            $("#sClaimFromDt,#sRoFromDt").data("kendoExtMaskedDatePicker").value("${sFromDt}");
            $("#sClaimToDt,#sRoToDt").data("kendoExtMaskedDatePicker").value("${sToDt}");


           /*  $("#form").get(0).reset();
            $("#sRcvCpltFromDt").data("kendoExtMaskedDatePicker").value(sRcvCpltFromDt);
            $("#sRcvCpltToDt").data("kendoExtMaskedDatePicker").value(sRcvCpltToDt);
            $("#btnSearch").click(); */
        }
    });

    $("#print").kendoButton({
        click:function(e) {
            //selectLabelPrint.cpt
            var params = "&sDlrCd=${dlrCd}&sClaimDocNo="+$("#claimDocNo").val()+
                         "&sVinNo="+$("#vinNo").val() ;
            parent._createOrReloadTabMenu("<spring:message code='ser.lbl.oldItemTread' />", "<c:url value='/ReportServer?reportlet=ser/selectLabelPrint3.cpt'/>"+params);
           // parent._createOrReloadTabMenu("<spring:message code='ser.lbl.oldItemTread' />", "<c:url value='/ReportServer?reportlet=ser/selectLabelPrintClaim.cpt'/>"+params);
        }
        ,enable:false
    });

    $("#printA4").kendoButton({
        click:function(e) {
            //selectLabelPrint.cpt
            var itemCnt = $("#gridPart").data("kendoExtGrid").dataSource.data().length;
            var params = "&sDlrCd=${dlrCd}&sClaimDocNo="+$("#claimDocNo").val()+
                         "&sVinNo="+$("#vinNo").val();
                         //"sItemCnt="+
            /* var fileCnt = (itemCnt > 10) ? itemCnt : "0"+itemCnt;
            var printFileNm = "selectLabelA4Print"+fileCnt+".cpt";
            parent._createOrReloadTabMenu("<spring:message code='ser.lbl.oldItemTread' />", "<c:url value='/ReportServer?reportlet=ser/"+printFileNm+"'/>"+params); */
            parent._createOrReloadTabMenu("<spring:message code='ser.lbl.oldItemTread' />", "<c:url value='/ReportServer?reportlet=ser/selectLabelA4Print.cpt'/>"+params);
        }
        ,enable:false
    });

    /** 엑셀 버튼**/
    $("#btnExcelExport").kendoButton({

        click:function(e){
        	if(selectTabId == "claim"){
	            dms.ajax.excelExport({
	                "beanName"         : "claimRequestService"
	                ,"templateFile"    : "ClaimRequestList_Tpl.xlsx"
	                ,"fileName"        : "<spring:message code='ser.title.claimReq' />.xlsx"
	                ,"sClaimFromDt"    : $("#sClaimFromDt").val()
	                ,"sClaimToDt"      : $("#sClaimToDt").val()
	                ,"sClaimStatCd"    : $("#sClaimStatCd").val()
	                ,"sClaimTp"        : $("#sClaimTp").val()
	                ,"sField"          : $("#sField").val()
	                ,"sText"           : $("#sText").val()
	            });
        	}else{
        		dms.ajax.excelExport({
                    "beanName"         : "claimRequestService"
                    ,"templateFile"    : "RepairRequestList_Tpl.xls"
                    ,"fileName"        : "<spring:message code='ser.lbl.roSearch' />.xls"
                    ,"sRoFromDt"       : $("#sRoFromDt").val()
                    ,"sRoToDt"         : $("#sRoToDt").val()
                    ,"sVinNo"          : $("#sVinNo").val()
                    ,"sRoDocNo"        : $("#sRoDocNo").val()
                    
                });
        	}
            
        }
    });

    getSearchData = function(selectTabId){
           //console.log("selectTabId",selectTabId);
        if(selectTabId == "claim"){
            if(isTablet == "true"){
                $("#gridClaim").data("kendoExtGrid").dataSource.page(1);
            }else{
                $("#gridClaim").data("kendoExtGrid").dataSource.data([]);
                $("#gridClaim").data("kendoExtGrid").dataSource.page(1);
            }
        }else{
            if(isTablet == "true"){
                $("#gridRo").data("kendoExtGrid").dataSource.page(1);
            }else{
                $("#gridRo").data("kendoExtGrid").dataSource.data([]);
                $("#gridRo").data("kendoExtGrid").dataSource.page(1);
            }
        }
    };

    /** 클레임번호 조회 **/
    $("#sClaimDocNo").keypress(function(e){
        if(e.keyCode === 13){
            e.preventDefault();

            //var params = {"sDlrCd":$("#dlrCd").val() , "sClaimDocNo":$("#sClaimDocNo").val()};
            //searchClaimData(params);
            $("#btnInquire").click();
        }
     });

    /** 조회 버튼**/
    $("#btnInquire").kendoButton({

        click:function(e){

            if(dms.string.strNvl($("#sClaimDocNo").val()) == "") {
                dms.notification.info("<spring:message code='ser.lbl.claimNo' var='sClaimDocNo' /><spring:message code='global.info.required.field' arguments='${sClaimDocNo},' />");
                return false;
            }

            var params = {"sDlrCd":$("#dlrCd").val() , "sClaimDocNo":$("#sClaimDocNo").val()};
            searchClaimData(params);
        }
    });

    /** 초기화 버튼**/
    $("#btnInit").kendoButton({

        click:function(e){

           initAll();
        }
    });

    /** 저장 버튼**/
    $("#btnSave").kendoButton({

        click:function(e){
            sendRequestSave( ($("#claimStatCd").val() == "") ? "O":$("#claimStatCd").val());
            qcVal=1;//当点击保存时，qcVal置为1 贾明 2018-11-13
            if("R"== ($("#claimStatCd").val() == "") ? "O":$("#claimStatCd").val()){
                 qcValR=2;
                 isDbClice=3;
             }
        }
    });

    /** 취소 버튼**/
    $("#btnCancel").kendoButton({

        click:function(e){

            $("#messageId").html("<spring:message code='ser.btn.cancel' var='cancel' />"+
                                 "<spring:message code='global.info.cnfrmMsg' arguments='${cancel}' />" );
            conformKendoWindow.content( $(".msgDiv").html());
            conformKendoWindow.open();
            $(".yes, .no").click(function(){
                if($(this).hasClass("yes")){
                    conformKendoWindow.close();
                    sendRequestSave("C");
                }else{
                    conformKendoWindow.close();
                }
            }).end();
        }

    });

    /** 요청 버튼**/
    $("#btnReq").kendoButton({

        click:function(e){

            $("#messageId").html("<spring:message code='global.btn.req' var='req' />"+
                                 "<spring:message code='global.info.cnfrmMsg' arguments='${req}' />" );
            conformKendoWindow.content( $(".msgDiv").html());
            conformKendoWindow.open();
            $(".yes, .no").click(function(){
                if($(this).hasClass("yes")){
                    conformKendoWindow.close();
                    sendRequestSave("Q");
                }else{
                    conformKendoWindow.close();
                }
            }).end();
        }

    });

    /** 요청취소 버튼**/
    $("#btnReqCancel").kendoButton({

        click:function(e){

            $("#messageId").html("<spring:message code='ser.lbl.reqCancel' var='reqCancel' />"+
                                 "<spring:message code='global.info.cnfrmMsg' arguments='${reqCancel}' />");
            conformKendoWindow.content( $(".msgDiv").html());
            conformKendoWindow.open();
            $(".yes, .no").click(function(){
               if($(this).hasClass("yes")){
                   sendRequestSave("QC");
                   qcVal=2;//取消申请后 ，qcVal为 2 贾明 2018-11-13 
               }
               conformKendoWindow.close();
            }).end();
        }
    });

    /** 공임삭제  **/
    $("#lbrDel").kendoButton({

        click:function (e){
            var grid = $("#gridLabor").data("kendoExtGrid");
            var rows = grid.select();
            var selectedVal = grid.dataItem(rows);

            if(selectedVal != null){
                if(selectedVal.lbrCd == $("#cauOperAtcCd").val() ){

                    $("#cauOperAtcCd").val("");
                    $("#cauOperAtcNm").val("");
                }
            }
            rows.each(function(index, row) {
                grid.removeRow(row);
            });
            calTotAmt();
        }
    });

   /**공임취소 **/
    $("#lbrCancel").kendoButton({
        click:function(e) {
            var griLabor = $('#gridLabor').data('kendoExtGrid');
            griLabor.cancelChanges();
            calTotAmt();
            $.each(griLabor.dataSource._data , function(i , laborData){
                if(laborData.cauLbrYn == "Y"){
                    $("#cauOperAtcCd").val(laborData.lbrCd);
                    $("#cauOperAtcNm").val(laborData.lbrNm);
                }
            });
        }
    });

    /** 부품삭제  **/
    $("#parDel").kendoButton({
        click:function (e){
            var grid = $("#gridPart").data("kendoExtGrid");
            var rows = grid.select();
            var selectedVal = grid.dataItem(rows);
            if(selectedVal != null){
                if(selectedVal.itemCd == $("#cauItemCd").val() ){
                    $("#cauItemCd").val("");
                    $("#cauItemNm").val("");
                }
            }
            rows.each(function(index, row) {
                grid.removeRow(row);
            });
            calTotAmt();
        }
    });

    /**부품취소 **/
    $("#parCancel").kendoButton({
        click:function(e) {
            var gridPart = $('#gridPart').data('kendoExtGrid');
            gridPart.cancelChanges();
            calTotAmt();

            $.each(gridPart.dataSource._data , function(i , partData){
                if(partData.cauItemYn == "Y"){
                    $("#cauItemCd").val(partData.itemCd);
                    $("#cauItemNm").val(partData.itemNm);
                }
            });
        }
    });

    /** 미사용 공임 부품 조회 팝업**/
    $("#lbrAdd,#parAdd").kendoButton({

        click:function(e){
            selectRepairOrderNotUsedSearchPopupWindow();
        }
    });

    /** 정비이력팝업 버튼**/
    $("#btnRoHistPopup").kendoButton({

        click:function(e){
            //selectRepairOrderSearchPopupWindow();
            parent._createOrReloadTabMenu("<spring:message code='ser.menu.serviceHistory'/>", "<c:url value='/ser/svi/serviceHistory/selectServiceHistoryMain.do?vinNo=" + $("#vinNo").val() + "'/>", "VIEW-D-10371"); // 예약접수현황
        }

    });

    /** 반송사유팝업 버튼**/
    $("#btnReturnReason").kendoButton({

        click:function(e){
            selectClaimRequestReturnPopupWindow();
        }

    });

    /** 기술자문 삭제 팝업 버튼**/
    $("#btnTcavNoDel").kendoButton({

        click:function(e){

           var jsonData = {
                   claimDocNo : $("#claimDocNo").val()
                  ,vinNo:$("#vinNo").val()
                  ,pwaApproveNo:$("#claimTcavNo").val()
                  //,pwaApproveNoYn:$("#claimTcavNoYn").val("N")
           };

           deleteApproveNo(jsonData);

           $("#claimTcavNo").val("");
           $("#orgClaimTcavNo").val("");


        }

    });

    /** PWA 승인 번호  삭제 팝업 버튼**/
    $("#btnPwaAprNoDel").kendoButton({

        click:function(e){

           var jsonData = {
                   claimDocNo : $("#claimDocNo").val()
                  ,vinNo:$("#vinNo").val()
                  ,pwaApproveNo:$("#pwaApproveNo").val()
           };

           deleteApproveNo(jsonData);
           //20200515 update by tjx 点击取消删除"说明"的数据并可编辑 start;
           $("#remark").val("");
           $("#remark").removeClass('form_readonly');
	       //20200515 update by tjx 点击取消删除"说明"的数据并可编辑 end;
        }
    });

    deleteApproveNo = function(jsonData){

        $.ajax({
            url:"<c:url value='/ser/wac/claimReq/deleteApproveNo.do' />"
           ,data:JSON.stringify(jsonData)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }
            ,success:function(result , textStatus){

                $("#pwaApproveNo").val("");
                $("#orgPwaApproveNo").val("");
                dms.notification.success("<spring:message code='global.info.success' />");
            }
            ,beforeSend: function(xhr){
                dms.loading.show($("#resizableContainer"));
            }
            ,complete: function(xhr,status){
                dms.loading.hide($("#resizableContainer"));
            }
        });

    };

    /** 초기화 **/
    initAll = function(e){

        $("#claimRequestForm").get(0).reset();
        $("#claimDocNo").val("");
        $("#fileKeyNm").val("");
        
		//客户主诉信息初始化
        $("#gridCustRemark").data("kendoExtGrid").dataSource._destroyed = [];
        $("#gridLabor").data("kendoExtGrid").dataSource._destroyed = [];
        $("#gridPart").data("kendoExtGrid").dataSource._destroyed = [];
        $("#fileGrid").data("kendoExtGrid").dataSource._destroyed = [];

        //客户主诉信息初始化
        $("#gridCustRemark").data("kendoExtGrid").dataSource.data([]);
        $("#gridLabor").data("kendoExtGrid").dataSource.data([]);
        $("#gridPart").data("kendoExtGrid").dataSource.data([]);
        $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
        return true;
    } ;

    /********************** 버튼  설정 ***************************/



    /********************** 데이터 설정 ***************************/
    /** 취소/요청/요청취소 전송 데이터 세팅 - 사용안함.**/
    sendRequestData = function (sFlag){

        if(!saveCheckValue()){
            return;
        }

        var grid = $("#gridClaim").data("kendoExtGrid");

        var formSaveData = $("#claimRequestForm").serializeObject( $("#claimRequestForm").serializeArrayInSelector("[data-json-obj='true']"));

            formSaveData.befRoDt = $("#befRoDt").data("kendoExtMaskedDatePicker").value();
            formSaveData.wartDt = $("#wartDt").data("kendoExtMaskedDatePicker").value();
            formSaveData.roStartDt = $("#roStartDt").data("kendoExtMaskedDatePicker").value();
            formSaveData.roEndDt = $("#roEndDt").data("kendoExtMaskedDatePicker").value();
            formSaveData.roDt = $("#roDt").data("kendoExtMaskedDatePicker").value();
            formSaveData.claimTp = $("#claimTp").val();

         $.ajax({
            url:"<c:url value='/ser/wac/claimReq/updateClaimRequest.do' />"
           ,data:JSON.stringify(formSaveData)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }
            ,success:function(result , textStatus){
                setGridRows(grid);
                getSearchData(selectTabId); // Hearder Grid 조회

                var params = {"sDlrCd":$("#dlrCd").val() , "sClaimDocNo":$("#claimDocNo").val(), "sVinNo":$("#vinNo").val()};
                searchClaimData(params);
                setButtonEnable($("#claimStatCd").val());
                dms.notification.success("<spring:message code='global.info.success' />");
            }
            ,beforeSend: function(xhr){
                dms.loading.show($("#resizableContainer"));
            }
            ,complete: function(xhr,status){
                dms.loading.hide($("#resizableContainer"));
            }
        });

    };

  //todo by LiuJing:
    /** 부품 data 조회하기 전에 SE_0160T 의 ITEM_SALE_PRC 0 인지 판다
        ITEM_SALE_PRC = 0  : PT_0214T 의 BMP_PURC_PRC 가격을 SE_0160T 의 ITEM_SALE_PRC 를 UDPATE
        ITEM_SALE_PRC != 0 : ITEM_SALE_PRC
    **/
    itemSalePrcJudgeUpdate = function(params02){
        $.ajax({
            url:"<c:url value='/ser/wac/claimReq/itemSalePrcJudgeUpdate.do' />"
           ,data:JSON.stringify(params02)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
            ,success:function(textStatus){
                dms.notification.success("<spring:message code='global.info.success' />");
            }
            ,beforeSend: function(xhr){
                dms.loading.show($("#resizableContainer"));
            }
            ,complete: function(xhr,status){
                dms.loading.hide($("#resizableContainer"));
            }
        });
    };

    /** 저장 전송 데이터 세팅**/
    sendRequestSave = function (claimStatCd){

        if(!saveCheckValue() || !checkGridValue()){
            return;
        }

        var grid = $("#gridClaim").data("kendoExtGrid");
        var gridLabor = $("#gridLabor").data("kendoExtGrid");
        var gridPart = $("#gridPart").data("kendoExtGrid");
        var gridPartData = gridPart.dataSource._data;

        var gridLbrData = gridLabor.dataSource._data;
        var itemPrcChkYn = true;

        $.each(gridPartData, function(i , gridData){
            if(dms.string.isNotEmpty(gridData.cauItemYn) && gridData.itemPrc <= 0){
                itemPrcChkYn = false;
                return false;
            }
        });

        if(!itemPrcChkYn) {
            dms.notification.error("<spring:message code='ser.info.notClaimReqByitemPrc' />");
            return false;
        }

        var formSaveData = $("#claimRequestForm").serializeObject( $("#claimRequestForm").serializeArrayInSelector("[data-json-obj='true']"));
            formSaveData.befRoDt   = $("#befRoDt").data("kendoExtMaskedDatePicker").value();
            formSaveData.wartDt    = $("#wartDt").data("kendoExtMaskedDatePicker").value();
            formSaveData.roStartDt = $("#roStartDt").data("kendoExtMaskedDatePicker").value();
            formSaveData.roEndDt   = $("#roEndDt").data("kendoExtMaskedDatePicker").value();
            formSaveData.roDt      = $("#roDt").data("kendoExtMaskedDatePicker").value();
            formSaveData.claimTp   = $("#claimTp").val();
            formSaveData.claimTcavNo  = $("#claimTcavNo").val();
            formSaveData.pwaApproveNo = $("#pwaApproveNo").val();
            formSaveData.claimStatCd  =  claimStatCd;
            formSaveData.claimOrgStatCd =  $("#claimStatCd").val();
            if($("#claimStatCd").val() == "R"){
                formSaveData.claimOrgReqDt   =  kendo.parseDate($("#claimReqDt").val());
            }

        var lbrSaveData = gridLabor.getCUDData("insertList", "updateList", "deleteList"); //claimReqLbrVO
        var partSaveData = gridPart.getCUDData("insertList", "updateList", "deleteList"); //claimReqPartVO

        var searchYn = dms.string.isNotEmpty($("#claimDocNo").val());

        var params =  $.extend(
                 {"claimReqVO":formSaveData}
                ,{"claimReqLbrVO":lbrSaveData}
                ,{"claimReqPartVO":partSaveData}
          );

         $.ajax({
            url:"<c:url value='/ser/wac/claimReq/multiClaimRequests.do' />"
           ,data:JSON.stringify(params)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }
            ,success:function(result , textStatus){

                $("#claimDocNo").val(result);

                if(searchYn) {
                    /*
                    if(claimStatCd != "A"){
                        selectedYn = (dms.string.isEmpty($("#sClaimStatCd").val())  ) ? true: false;
                    }else{
                        selectedYn = false;
                    }
                    gridClaimRow = $("#gridClaim").data("kendoExtGrid").select().index();
                     */

                    setGridRows(grid);

                    $("#gridClaim").data("kendoExtGrid").dataSource.data([]);
                    $("#gridRo").data("kendoExtGrid").dataSource.data([]);
                    $("#gridClaim").data("kendoExtGrid").dataSource.page(1);
                    $("#gridRo").data("kendoExtGrid").dataSource.page(1);

                }else{
                    $("#gridRo").data("kendoExtGrid").dataSource.page(1);
                }
                var params = {"sDlrCd":$("#dlrCd").val() , "sClaimDocNo":$("#claimDocNo").val(), "sVinNo":$("#vinNo").val()};
                searchClaimData(params);
                setButtonEnable(claimStatCd);
                dms.notification.success("<spring:message code='global.info.success' />");
            }
            ,beforeSend: function(xhr){
                dms.loading.show($("#resizableContainer"));
            }
            ,complete: function(xhr,status){
                dms.loading.hide($("#resizableContainer"));
            }
        });

    };
    
     //双击 贾明
      $("#gridClaim").on('dblclick', '.k-grid-content tr', function (e) {
           isDbClice=2;
      });

       //单击 贾明
        $("#gridClaim").on('click', '.k-grid-content tr', function () {
            isDbClice=1;
        });

     var i =0;//贾明索赔申请功能中，返回的单子， 申请按钮不可用
    /**저장된 클레임 데이터 조회 **/
    searchClaimData = function(params){

        var gridLabor =  $("#gridLabor").data("kendoExtGrid");
        var gridPart = $("#gridPart").data("kendoExtGrid");
        //客户主诉信息查询
        var gridCustRemark =  $("#gridCustRemark").data("kendoExtGrid");

        $.ajax({
            url:"<c:url value='/ser/wac/claimReq/selectClaimRequestForClaimByKey.do' />"
           ,data:JSON.stringify(params)
           ,type:"POST"
           ,dataType:"json"
           ,contentType:"application/json"
           ,error:function(jqXHR,status,error) {

              dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }
           ,success:function (result){


               if( dms.string.strNvl(result.vinNo) == ""  ){
                   initAll();
                   dms.notification.info("<spring:message code='global.info.noSearchDataMsg' />");
                   return ;
               }
               //console.log("ee",result);
               setResultDataSetting(result);

               gridLabor.dataSource._destroyed = [];
               gridPart.dataSource._destroyed = [];
               gridCustRemark.dataSource._destroyed = [];
               
               gridLabor.dataSource.transport.options.read.url = claimLbrUrl;
               gridPart.dataSource.transport.options.read.url = claimPartUrl;
               gridCustRemark.dataSource.transport.options.read.url = claimCustRemarkUrl;
               
               gridLabor.dataSource.read();
               gridPart.dataSource.read();
               gridCustRemark.dataSource.read();
               
               $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
               $("#fileGrid").data("kendoExtGrid").dataSource.read();
               //贾明索赔申请功能中，返回的单子， 申请按钮不可用 2018-11-20  start
              var  claimStatCdVal = $("#claimStatCd").val();
              
               if(i==0 && "R"== claimStatCdVal){
                        claimDocNoVal=params.sClaimDocNo;
                        qcValR=1;
                    } else if(i!=0 && "R" == claimStatCdVal){
                        if(claimDocNoVal==params.sClaimDocNo && "R" == claimStatCdVal && 3==isDbClice){
                               qcValR=2;
                              claimDocNoVal=params.sClaimDocNo;
                        }else{
                           qcValR=1;
                          claimDocNoVal=params.sClaimDocNo;
                        }
                    }else {
                      claimDocNoVal=params.sClaimDocNo;
                    }
                    i++;
                 //贾明索赔申请功能中，返回的单子， 申请按钮不可用 2018-11-20  end
             
               setButtonEnable($("#claimStatCd").val());
             
               setRequiredField(); // 필수값 설정

            }

        }) ;
    };


    /** 조회 결과값  세팅**/
    setResultDataSetting =  function (result){

        $("#claimDocNo").val(result.claimDocNo);
        $("#claimTcavNo").val(result.claimTcavNo);
        $("#orgClaimTcavNo").val(result.claimTcavNo);
        $("#pwaApproveNo").val(result.pwaApproveNo);
        $("#orgPwaApproveNo").val(result.pwaApproveNo);
        $("#claimVerCd").val(result.claimVerCd);
        $("#dlrCd").val(result.dlrCd);
        $("#crNo").val(result.crNo);
        $("#roDocNo").val(result.roDocNo);
        $("#roGrpNo").val(result.roGrpNo);
        $("#roTp").val(result.roTp);
        $("#vinNo").val(result.vinNo);
        $("#carRegNo").val(result.carRegNo);
        $("#carDstinCd").val(result.carDstinCd);
        $("#cauCd").val(result.cauCd);
        $("#cauNm").val(result.cauNm);
        $("#phenCd").val(result.phenCd);
        $("#phenNm").val(result.phenNm);
        $("#remark").val(result.remark);
        $("#claimReqDt").val(result.claimReqDt);

        $("#ltsModelCd").val(result.ltsModelCd);
        $("#ltsModelNm").val(result.ltsModelNm);
        $("#carlineCd").val(result.carlineCd);
        $("#cauOperAtcCd").val(result.cauOperAtcCd);
        $("#cauOperAtcNm").val(result.cauOperAtcNm);
        $("#cauItemCd").val(result.cauItemCd);//此处
        $("#cauItemNm").val(result.cauItemNm);
        $("#befRoDocNo").val(result.befRoDocNo);
        $("#enginNo").val(result.enginNo);
        $("#carOwnerId").val(result.carOwnerId);
        $("#carOwnerNm").val(result.carOwnerNm);

        $("#roTp").val(result.roTp);
        $("#dtc1Cd").val(result.dtc1Cd);
        $("#dtc2Cd").val(result.dtc2Cd);
        $("#dtc3Cd").val(result.dtc3Cd);
        $("#dtc4Cd").val(result.dtc4Cd);

        // 캠페인/GoodWill 인경우만  자동세팅
        /* if(dms.string.isNotEmpty($("#crNo").val())){
            $("#claimTp").data("kendoExtDropDownList").enable(false);
        }else{
            $("#claimTp").data("kendoExtDropDownList").enable(true);
        } */

        if( dms.string.isNotEmpty(result.claimTp)){
            $("#claimTp").data("kendoExtDropDownList").enable(false);
        }else{
            $("#claimTp").data("kendoExtDropDownList").enable(true);
        }


        $("#claimTp").data("kendoExtDropDownList").value(result.claimTp);
        $("#asParWartDstinCd").data("kendoExtDropDownList").value(result.asParWartDstinCd);
        $("#claimStatCd").data("kendoExtDropDownList").value(result.claimStatCd);
        $("#subDstinCd").data("kendoExtDropDownList").value(result.subDstinCd);
        $("#roStatCd").data("kendoExtDropDownList").value(result.roStatCd);
        $("#dtc1UseYn").data("kendoExtDropDownList").value(result.dtc1UseYn);
        $("#dtc2UseYn").data("kendoExtDropDownList").value(result.dtc2UseYn);
        $("#dtc3UseYn").data("kendoExtDropDownList").value(result.dtc3UseYn);
        $("#dtc4UseYn").data("kendoExtDropDownList").value(result.dtc4UseYn);

        $("#regDt").data("kendoExtMaskedDatePicker").value(result.regDt);
        $("#roDt").data("kendoExtMaskedDatePicker").value(result.roDt);
        $("#wartDt").data("kendoExtMaskedDatePicker").value(result.wartDt);
        $("#roStartDt").data("kendoExtMaskedDatePicker").value(result.roStartDt);
        $("#roEndDt").data("kendoExtMaskedDatePicker").value(result.roEndDt);
        $("#befRoDt").data("kendoExtMaskedDatePicker").value(result.befRoDt);

        $("#runDistVal").data("kendoExtNumericTextBox").value(result.runDistVal);
        $("#lastRunDistVal").data("kendoExtNumericTextBox").value(result.lastRunDistVal);
        $("#befRunDistVal").data("kendoExtNumericTextBox").value(result.befRunDistVal);
        $("#itemAmt").data("kendoExtNumericTextBox").value(result.itemAmt);
        $("#lbrAmt").data("kendoExtNumericTextBox").value(result.lbrAmt);
        $("#subAmt").data("kendoExtNumericTextBox").value(Number(dms.string.defaultString(result.subAmt, "0" )));
        $("#totAmt").data("kendoExtNumericTextBox").value(result.totAmt);

        $("#fileKeyNm").val(result.fileKeyNm);

    };

    /********************** 데이터 설정 ***************************/


    /********************** 계산로직 설정 ***************************/

 // 요청금액 합계 계산
    calTotAmt = function(){

        var gridLbr = $("#gridLabor").data("kendoExtGrid");
        var gridLbrData = gridLbr.dataSource._data;

        var gridPart = $("#gridPart").data("kendoExtGrid");
        var gridPartData = gridPart.dataSource._data;


     // 전체 공임 금액 계산
        var labrTotAmt=0;
        $.each(gridLbrData , function(i , labrData){
            labrTotAmt += labrData.lbrAmt;

       });

        $("#lbrAmt").data("kendoExtNumericTextBox").value(labrTotAmt);

        // 전체 부품 금액 계산
        var partTotAmt=0;
         $.each(gridPartData , function(i , partData){
             partTotAmt += partData.itemAmt;
        });

         $("#itemAmt").data("kendoExtNumericTextBox").value(partTotAmt);

         var lbrAmt    = Number(dms.string.defaultString($("#lbrAmt").data("kendoExtNumericTextBox").value() , "0" ) );
         var subLbrAmt = Number(dms.string.defaultString($("#subAmt").data("kendoExtNumericTextBox").value() , "0" ) );
         var partAmt   = Number(dms.string.defaultString($("#itemAmt").data("kendoExtNumericTextBox").value() , "0" ) );

        $("#totAmt").data("kendoExtNumericTextBox").value(labrTotAmt + subLbrAmt + partTotAmt);
    };

    //공임 그리드 임률  변경시 재계산
    calLbrGridAmt = function(e){

        var gridLbr = $("#gridLabor").data("kendoExtGrid");
        var gridLbrData = gridLbr.dataSource._data;

        var selectedVal = gridLbr.dataItem(gridLbr.select());

        var lbrQty = Number(selectedVal.lbrQty);
        var lbrHm  = Number(selectedVal.lbrHm);
        var lbrPrc = Number(selectedVal.lbrPrc);
        var lbrAmt = Number((lbrQty* lbrHm * lbrPrc  ).toFixed(2));

        selectedVal.set("lbrAmt",lbrAmt);
        calLbrTotAmt();
    };

 // 요청 공임 금액 합계 계산
    calLbrTotAmt = function(){

        var gridLbr = $("#gridLabor").data("kendoExtGrid");
        var gridLbrData = gridLbr.dataSource._data;

     // 전체 공임 금액 계산
        var labrTotAmt=0;
        $.each(gridLbrData , function(i , labrData){
            if(dms.string.isNotEmpty(labrData.cauLbrYn)){

                labrTotAmt += labrData.lbrAmt;
            }
       });

        $("#lbrAmt").data("kendoExtNumericTextBox").value(labrTotAmt);

         var lbrAmt    = Number(dms.string.defaultString($("#lbrAmt").data("kendoExtNumericTextBox").value() , "0" ) );
         var subLbrAmt = Number(dms.string.defaultString($("#subAmt").data("kendoExtNumericTextBox").value() , "0" ) );
         var partAmt   = Number(dms.string.defaultString($("#itemAmt").data("kendoExtNumericTextBox").value(), "0" ) );

        $("#totAmt").data("kendoExtNumericTextBox").value(lbrAmt + subLbrAmt + partAmt);
    };

    // 부품합계
    calPartTotAmt = function(){

        var gridPart = $("#gridPart").data("kendoExtGrid");
        var selectedVal = gridPart.dataItem(gridPart.select());
        var gridPartData = gridPart.dataSource._data;

        if( selectedVal != null){
            var itemQty = Number(selectedVal.itemQty);
            var itemPrc = Number(selectedVal.itemPrc);
            var npnItemAmt = Number(itemQty * itemPrc).toFixed(2);
            var npnpMaxAmt = Number(selectedVal.npnpMaxAmt);
            var npnpYn = selectedVal.npnpYn;
            if( npnpYn == "Y" ){
                if( npnItemAmt > npnpMaxAmt){
                    selectedVal.set("itemQty",  Number(npnpMaxAmt/itemPrc).toFixed(0));
                    selectedVal.set("itemAmt",  (Number(npnpMaxAmt/itemPrc).toFixed(0) * itemPrc).toFixed(2) );
                    dms.notification.warning("<spring:message code='ser.info.overMayQty'  />" );
                }else{
                    selectedVal.set("itemAmt",  npnItemAmt);
                }
            }
        }

        // 전체 부품 금액 계산
        var partTotAmt=0;
        $.each(gridPartData , function(i , partData){

            if(dms.string.isNotEmpty(partData.cauItemYn)){
                partTotAmt += partData.itemAmt;
            }
        });

        $("#itemAmt").data("kendoExtNumericTextBox").value(partTotAmt);

        var lbrAmt    = Number(dms.string.defaultString($("#lbrAmt").data("kendoExtNumericTextBox").value() , "0" ) );
        var subLbrAmt = Number(dms.string.defaultString($("#subAmt").data("kendoExtNumericTextBox").value() , "0" ) );
        var partAmt   = Number(dms.string.defaultString($("#itemAmt").data("kendoExtNumericTextBox").value() , "0" ) );

        $("#totAmt").data("kendoExtNumericTextBox").value(lbrAmt + subLbrAmt + partAmt);
    };

    /********************** 계산로직 설정 ***************************/


    /********************** 저장 필수값 체크 ***************************/


    saveCheckValue = function (e){

        /**
         1. RO 시작일자 체크 OK
         2. RO 종료일자 체크 OK
         3. RO 시작일 종료일 유효성 체크 OK
         4. 원인/현상코드 체크 ( 캠페인은 제외 ) ok
         5. 비고란 필수 체크 ( 캠페인은 제외) ok
         7. 보증수리 일경우 원인부품 필수값으로
         8. 주작업코드 체크
         9. AS 부품인경우 외주부품구분 코드 필수
         10.AS 부품 :이전RO  , 일자 , 마일리지 필수 값
         11.AS부품이 아닌때  외주부품구분은 A(보증) 만 선택 가능함. "WSR00198"
      // 기준 등록 작업일수 보다 작업 시간이 많을 경우 문제점 필수 값으로 (삼포관련 로직)
        **/

        var msgText;
        var result = true;

        if( dms.string.isEmpty($("#claimTp").val()) ){ //클레임 유형
            msgText = "<spring:message code='ser.lbl.claimTp' var='claimTp' />"+
            "<spring:message code='global.info.chkSelectItemMsg' arguments='${claimTp}' />";

            $("#claimTp").focus();
            result =  false;

        }else if( $("#vinNo").val() == "" ) { //빈번호
            msgText = "<spring:message code='ser.lbl.vinNo' var='global_lbl_vinNo' />"+
                      "<spring:message code='global.info.required.field' arguments='${global_lbl_vinNo}' />";

                      $("#vinNo").focus();
                      result =  false;

        }else if( dms.string.isEmpty($("#roStartDt").val()) ){ //RO시작일자 체크
            msgText = "<spring:message code='ser.lbl.roStartDt' var='roStartDt' />"+
                      "<spring:message code='global.info.confirmMsgParam' arguments='${roStartDt}' />";
                      result =  false;
        }else if( dms.string.isEmpty($("#roEndDt").val()) ){ //RO종료일자 체크
            msgText = "<spring:message code='ser.lbl.roEndDt' var='roEndDt' />"+
                      "<spring:message code='global.info.confirmMsgParam' arguments='${roEndDt}' />";
                      result =  false;
        }else if( $("#roStartDt").val() > $("#roEndDt").val() ){ // 시작일자 > 종료일자
            msgText = "<spring:message code='ser.lbl.roStartDt' var='roStartDt' />"+
                      "<spring:message code='ser.lbl.roEndDt' var='roEndDt' />"+
                      "<spring:message code='global.info.validation.min' arguments='${roEndDt} , ${roStartDt}' />";
                      result =  false;
        }else if( dms.string.isEmpty($("#cauOperAtcCd").val()) ){ //주작업코드 체크
            msgText = "<spring:message code='ser.lbl.mainLbrCd' var='mainLbrCd' />"+
                      "<spring:message code='global.info.required.field' arguments='${mainLbrCd}' />";
                      result =  false;
        }

        // 캠페인또는  GOODWILL 이 아닌경우만 해당
        if( dms.string.isEmpty( $("#crNo").val())  ){
            if( dms.string.isEmpty($("#cauCd").val() ) ){
                msgText = "<spring:message code='ser.lbl.cauCd' var='ser_lbl_cauCd' />"+
                          "<spring:message code='global.info.required.field' arguments='${ser_lbl_cauCd}' />";
                          result =  false;
            }else if( dms.string.isEmpty($("#phenCd").val()) ){
                msgText = "<spring:message code='ser.lbl.phenCd' var='ser_lbl_phenCd' />"+
                          "<spring:message code='global.info.required.field' arguments='${ser_lbl_phenCd}' />";
                          result =  false;
            }else if( dms.string.isEmpty( $("#remark").val() ) ){
                msgText = "<spring:message code='ser.lbl.problem' var='problem' />"+
                          "<spring:message code='global.info.required.field' arguments='${problem}' />";
                          $("#errPhenCont").focus();
                          result =  false;
            }else if( dms.string.isEmpty($("#cauItemCd").val()) ){
                msgText = "<spring:message code='ser.lbl.cauItemCd' var='cauItemCd' />"+
                          "<spring:message code='global.info.required.field' arguments='${cauItemCd}' />";

                         result =  false;
            }
        }

        // DTC CHECK
        if( $("#dtc1UseYn").val() == "Y" && dms.string.isEmpty($("#dtc1Cd").val()) ){
            msgText = "<spring:message code='ser.lbl.dtcCd' var='dtcCd' />"+
                      "<spring:message code='global.info.emptyCheckParam' arguments='${dtcCd}' />";
                      result =  false;
                      $("#dtc1Cd").select();
        }
        if( $("#dtc2UseYn").val() == "Y" && dms.string.isEmpty($("#dtc2Cd").val()) ){
            msgText = "<spring:message code='ser.lbl.dtcCd' var='dtcCd' />"+
                      "<spring:message code='global.info.emptyCheckParam' arguments='${dtcCd}' />";
                      result =  false;
                      $("#dtc2Cd").select();
        }
        if( $("#dtc3UseYn").val() == "Y" && dms.string.isEmpty($("#dtc3Cd").val()) ){
            msgText = "<spring:message code='ser.lbl.dtcCd' var='dtcCd' />"+
                      "<spring:message code='global.info.emptyCheckParam' arguments='${dtcCd}' />";
                      result =  false;
                      $("#dtc3Cd").select();
        }
        if( $("#dtc4UseYn").val() == "Y" && dms.string.isEmpty($("#dtc4Cd").val()) ){
            msgText = "<spring:message code='ser.lbl.dtcCd' var='mainLbrCd' />"+
                      "<spring:message code='global.info.emptyCheckParam' arguments='${dtcCd}' />";
                      result =  false;
                      $("#dtc4Cd").select();
        }


        /*
        AS 부품 체크로직
                외주부품구분 코드 필수
                이전RO  , 일자 , 마일리지 필수 값
        AS부품이 아닌때  외주부품구분은 A(보증) 만 선택 가능함.
        */
        if($("#claimTp").val() == "S"){
            if( dms.string.isEmpty( $("#asParWartDstinCd").val() ) ){
                msgText = "<spring:message code='ser.lbl.prePartTp' var='prePartTp' />"+
                          "<spring:message code='global.info.required.field' arguments='${prePartTp}' />";
                result =  false;

            }else if( dms.string.isEmpty( $("#befRoDocNo").val() ) ){ //이전RO 번호가 없을경우
                msgText = "<spring:message code='ser.lbl.preRoDocNo' var='preRoDocNo' />"+
                          "<spring:message code='global.info.required.field' arguments='${preRoDocNo}' />";
                result =  false;

            }else if( dms.string.isEmpty( $("#befRoDt").val() ) ){
                msgText = "<spring:message code='ser.lbl.preRoDt' var='preRoDt' />"+
                          "<spring:message code='global.info.required.field' arguments='${preRoDt}' />";
                result =  false;

            }else if( dms.string.isEmpty($("#befRunDistVal").val())  ){
                msgText = "<spring:message code='ser.lbl.preRunDist' var='preRunDist' />"+
                          "<spring:message code='global.info.required.field' arguments='${preRunDist}' />";
                result =  false;

            }else if( dms.string.isNotEmpty( $("#befRoDt").val() ) ){
                if($("#befRoDt").val() > $("#roStartDt").val() ){ //ser.info.chkMax
                    msgText = "<spring:message code='ser.lbl.preRoDt' var='preRoDt' />"+
                              "<spring:message code='ser.lbl.roStartDt' var='roStartDt' />"+
                              "<spring:message code='ser.info.chkMax' arguments='${preRoDt},${roStartDt}' />";
                    result =  false;
                };

            }else if( dms.string.isEmpty($("#befRunDistVal").val())  ){
                if($("#befRunDistVal").val() > $("#runDistVal").val() ){ //ser.info.chkMax
                    msgText = "<spring:message code='ser.lbl.preRunDist' var='preRunDist' />"+
                              "<spring:message code='ser.lbl.runDist' var='runDist' />"+
                              "<spring:message code='ser.info.chkMax' arguments='${preRunDist},${runDist}' />";
                    result =  false;
                };
            }
            //이전RO번호 형식 체크(영,숫자만 가능)
            if(onlyNumAlpha.test($("#befRoDocNo").val())){
                return dms.notification.info("<spring:message code='ser.info.preRoDocNoChk'/>");
            }
        }else{
            if( $("#asParWartDstinCd").val() == "B" ){
                msgText = "<spring:message code='ser.lbl.claimTp' var='claimTp' />"+
                          "<spring:message code='ser.lbl.asPartCd' var='asPartCd' />"+
                          "<spring:message code='global.info.isCheckedItem' arguments='${claimTp},${asPartCd}' />";
                result =  false;
            }
        }

        if(!result) dms.notification.warning(msgText);
        return result;

    };


    //공임 그리드 체크로직
    checkGridValue = function(){

        var gridLabor = $("#gridLabor").data("kendoExtGrid");
        var gridLbrData = gridLabor.dataSource._data;

        var zzYn = false;
        var ttYn = false;
        var dstinCd;
        $.each(gridLbrData , function(i , gridData){
            var lbrCd   = gridData.lbrCd;
            var zzCd    = gridData.lbrCd.substr(-2);
            if(gridData.dstinCd == "Z"){
                ttYn = true;
            }
            if(gridData.dstinCd == "H" && zzCd == "ZZ"){
                zzYn = true;
            }
        });


        var subAmt = $("#subAmt").data("kendoExtNumericTextBox").value();
        if( ( zzYn && subAmt == 0.00 ) ){
            dms.notification.warning( "<spring:message code='global.lbl.subLbrAmt' var='subLbrAmt' />"+
                                      "<spring:message code='global.info.emptyCheckParam' arguments='${subLbrAmt}' />");
            $("#subAmt").focus();
            return false;
        }
        if( ( (!zzYn) && subAmt > 0.00 ) ){
        	//20200514 售后索赔提示信息变更 from 售后担当 updateby sunzq3 start
            //dms.notification.warning( "<spring:message code='ser.lbl.subLbrCd' var='subLbrCd' />"+
            //                         "<spring:message code='global.info.emptyCheckParam' arguments='${subLbrCd}' />");
        	dms.notification.warning( "<spring:message code='ser.info.chkSubAmt' />");
			//20200514 售后索赔提示信息变更 from 售后担当 updateby sunzq3 end
            return false;
        }
        if( zzYn && dms.string.isEmpty($("#subDstinCd").val())){
            dms.notification.warning( "<spring:message code='ser.lbl.subDistin' var='subDistin' />"+
                        "<spring:message code='global.info.check.field' arguments='${subDistin}' />");
            $("#subDstinCd").select();
           return false;
        }

        return true;

    };

    /** 필수값 설정 **/
    setRequiredField = function(e){

        if( dms.string.isNotEmpty($("#crNo").val())){
            $("#cauCdSpan").removeClass("bu_required");
            $("#phenCdSpan").removeClass("bu_required");
            $("#remarkSpan").removeClass("bu_required");
            $("#cauItemCdSpan").removeClass("bu_required");
        }else{
            $("#cauCdSpan").addClass("bu_required");
            $("#phenCdSpan").addClass("bu_required");
            $("#remarkSpan").addClass("bu_required");
            $("#cauItemCdSpan").addClass("bu_required");

        }
        if($("#claimTp").val() == "S"){
            $("#befRoDocNoSpan").addClass("bu_required");
            $("#befRoDtSpan").addClass("bu_required");
            $("#befRunDistValSpan").addClass("bu_required");

            $("#befRoDocNo").removeClass("form_readonly");
            $("#befRoDocNo").prop("readonly",false);

            $("#asParWartDstinCd").data("kendoExtDropDownList").enable(true);             //이전부품유형 활성화.
            $("#befRunDistVal").data("kendoExtNumericTextBox").enable(true);
            $("#befRoDt").data("kendoExtMaskedDatePicker").enable(true);
        }else{
            $("#befRoDocNoSpan").removeClass("bu_required");
            $("#befRoDtSpan").removeClass("bu_required");
            $("#befRunDistValSpan").removeClass("bu_required");

            $("#befRoDocNo").addClass("form_readonly");
            $("#befRoDocNo").prop("readonly",true);

            $("#asParWartDstinCd").data("kendoExtDropDownList").enable(false);             //이전부품유형 활성화.
            $("#befRunDistVal").data("kendoExtNumericTextBox").enable(false);
            $("#befRoDt").data("kendoExtMaskedDatePicker").enable(false);

            $("#asParWartDstinCd").data("kendoExtDropDownList").value("");
            $("#befRoDocNo").val("");
            $("#befRunDistVal").data("kendoExtNumericTextBox").value(0);
            $("#befRoDt").data("kendoExtMaskedDatePicker").value("");

        }
    };

  //버튼설정
    setButtonEnable = function (sFlag){

        $("#print").data("kendoButton").enable(true);
        switch(sFlag){
            case "O" :
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(true);
                $("#btnReq").data("kendoButton").enable(qcVal==1?true:false);// 取消申请后，申请按钮设置为不可用 贾明 2018-11-13
                $("#btnReqCancel").data("kendoButton").enable(false);
                $("#btnRoHistPopup").data("kendoButton").enable(true);
                $("#btnReturnReason").data("kendoButton").enable(true);

                $("#claimTp").data("kendoExtDropDownList").enable(false);
                $("#print").data("kendoButton").enable(true);
                $("#printA4").data("kendoButton").enable(true);

                setFileButton("Y");
                      break;
            case "QC" :
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(true);
                $("#btnReq").data("kendoButton").enable(false);//取消申请后，申请按钮设置为不可用 贾明2018-11-13 
                $("#btnReqCancel").data("kendoButton").enable(false);
                $("#btnRoHistPopup").data("kendoButton").enable(true);
                $("#btnReturnReason").data("kendoButton").enable(true);

                $("#claimTp").data("kendoExtDropDownList").enable(false);
                $("#print").data("kendoButton").enable(true);
                $("#printA4").data("kendoButton").enable(true);

                setFileButton("Y");
                      break;
            case "A" :
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnReq").data("kendoButton").enable(false);
                $("#btnReqCancel").data("kendoButton").enable(false);
                $("#btnRoHistPopup").data("kendoButton").enable(true);
                $("#btnReturnReason").data("kendoButton").enable(true);

                $("#claimTp").data("kendoExtDropDownList").enable(false);
                $("#print").data("kendoButton").enable(true);
                $("#printA4").data("kendoButton").enable(true);

                setFileButton("N");
                      break;
             case "C" :
                 $("#btnSave").data("kendoButton").enable(true);
                 $("#btnCancel").data("kendoButton").enable(false);
                 $("#btnReq").data("kendoButton").enable(true);
                 $("#btnReqCancel").data("kendoButton").enable(false);
                 $("#btnRoHistPopup").data("kendoButton").enable(true);
                 $("#btnReturnReason").data("kendoButton").enable(true);

                 $("#claimTp").data("kendoExtDropDownList").enable(true);
                 $("#print").data("kendoButton").enable(true);
                 $("#printA4").data("kendoButton").enable(true);

                 setFileButton("N");
                      break;
             case "S" :
                 $("#btnSave").data("kendoButton").enable(false);
                 $("#btnCancel").data("kendoButton").enable(false);
                 $("#btnReq").data("kendoButton").enable(false);
                 $("#btnReqCancel").data("kendoButton").enable(false);
                 $("#btnRoHistPopup").data("kendoButton").enable(true);
                 $("#btnReturnReason").data("kendoButton").enable(true);

                 $("#claimTp").data("kendoExtDropDownList").enable(false);
                 $("#print").data("kendoButton").enable(true);
                 $("#printA4").data("kendoButton").enable(true);

                 setFileButton("N");
                      break;
            case "Q" :
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnReq").data("kendoButton").enable(false);
                $("#btnReqCancel").data("kendoButton").enable(true);
                $("#btnRoHistPopup").data("kendoButton").enable(true);
                $("#btnReturnReason").data("kendoButton").enable(true);

                $("#claimTp").data("kendoExtDropDownList").enable(false);
                $("#print").data("kendoButton").enable(true);
                $("#printA4").data("kendoButton").enable(true);

                setFileButton("N");
                      break;
            case "R" :
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(true);
                //$("#btnReq").data("kendoButton").enable(true);
                $("#btnReq").data("kendoButton").enable(qcValR==1?false:true);//索赔申请功能中，返回的单子，申请按钮不可用 贾明 2018-11-15
                $("#btnReqCancel").data("kendoButton").enable(false);
                $("#btnRoHistPopup").data("kendoButton").enable(true);
                $("#btnReturnReason").data("kendoButton").enable(true);

                $("#claimTp").data("kendoExtDropDownList").enable(true);
                $("#print").data("kendoButton").enable(true);
                $("#printA4").data("kendoButton").enable(true);

                setFileButton("Y");
                      break;
            default :
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnReq").data("kendoButton").enable(false);
                $("#btnReqCancel").data("kendoButton").enable(false);
                $("#btnRoHistPopup").data("kendoButton").enable(true);
                $("#btnReturnReason").data("kendoButton").enable(true);
                $("#print").data("kendoButton").enable(false);
                $("#printA4").data("kendoButton").enable(false);

                setFileButton("Y");
                break;
        }
    };

    setFileButton("N");

    //RO데이터 조회
    searchRoData = function(params , claimUrl){

        $.ajax({
            //url:"<c:url value='/ser/wac/claimReq/selectClaimRequestForRoByKey.do' />"
            url:claimUrl
           ,data:JSON.stringify(params)
           ,type:"POST"
           ,dataType:"json"
           ,contentType:"application/json"
           ,error:function(jqXHR,status,error) {

              dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }
           ,success:function (result){

               setResultDataSetting(result);

               $("#gridLabor").data("kendoExtGrid").dataSource.transport.options.read.url = rolbrUrl;
               $("#gridPart").data("kendoExtGrid").dataSource.transport.options.read.url = roPartUrl;
               $("#gridLabor").data("kendoExtGrid").dataSource.read();
               $("#gridPart").data("kendoExtGrid").dataSource.read();

               setButtonEnable($("#claimStatCd").val());
               setRequiredField(); // 필수값 세팅
            }

        }) ;
    };

    $("#gridClaim").kendoExtGrid({
        gridId:"G-SER-1011-000153"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/claimReq/selectClaimRequestForClaim.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sClaimFromDt"] = $("#sClaimFromDt").data("kendoExtMaskedDatePicker").value();
                         params["sClaimToDt"]   = $("#sClaimToDt").data("kendoExtMaskedDatePicker").value();
                         params["sClaimStatCd"] = $("#sClaimStatCd").val();
                         params["sClaimTp"] = $("#sClaimTp").val();
                         params["sField"] = $("#sField").val();
                         params["sText"] = $("#sText").val();
                         if($("#sField").val() == "01" && $("#sText").val() != ""){
                             params["sClaimFromDt"] = "";
                             params["sClaimToDt"]   = "";
                         }

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number" }
                       ,dlrCd:{type:"string" }
                       ,vinNo:{type:"string" }
                       ,claimDocNo:{type:"string" }
                       ,claimStartDt:{type:"date" }
                       ,roDocNo:{type:"string" }
                       ,claimTp:{type:"string" }
                       ,crNo:{type:"string" }
                       ,roDt:{type:"date" }
                       ,claimReqDt:{type:"date" }
                    }

                 }//model
           }//schema
        }//dataSource
        ,editable:false
        ,scrollable:true
        ,autoBind:false
        ,sortable:false
        ,selectable:"row"
        ,appendEmptyColumn:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,dataBound: function(e) {
            var selectedVal =  e.sender.dataItem(e.sender.tbody.find("tr")[gridRow]);
            if(selectedVal != null){
                if(rowClaimDocNo  == selectedVal.claimDocNo){
                    e.sender.select(e.sender.tbody.find("tr")[gridRow]);
                }
            }

        }
        ,height:175
        ,change:function (e){
            var selectedVal = this.dataItem(this.select());

            if(selectedVal != null){

                $("#vinNo").val(selectedVal.vinNo);
                $("#dlrCd").val(selectedVal.dlrCd);
                $("#claimDocNo").val(selectedVal.claimDocNo);
                $("#roDocNo").val(selectedVal.roDocNo);
                $("#crNo").val(selectedVal.crNo);

                var params = {};
                params["sVinNo"] = $("#vinNo").val();
                params["sClaimDocNo"] = $("#claimDocNo").val();
                params["sRoDocNo"] = $("#roDocNo").val();
                params["sDlrCd"] = $("#dlrCd").val();
                params["sCrNo"] = $("#crNo").val();
                searchClaimData(params);
            }

        }
        ,columns:[
                {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width: 50,sortable: false, attributes:{"class":"ac"}}
               ,{field:"vinNo",title:"<spring:message code='ser.lbl.vinNo' />", width: 160,sortable: false, attributes :{"class":"al"}  }
               ,{field:"claimDocNo",title:"<spring:message code='ser.lbl.claimNo' />", width:100, attributes :{"class":"al"} }
               ,{field:"claimStartDt" , title:"<spring:message code='ser.lbl.claimRegDt' />", width:120
                   , attributes :{"class":"ac"}
                   , format: "{0:<dms:configValue code='dateFormat' />}"
                }
               ,{field:"roDocNo",title:"<spring:message code='ser.lbl.roDocNo' />", width:120, attributes :{"class":"al"} }
               ,{field:"claimTp",title:"<spring:message code='ser.lbl.claimTp' />", width:90
                   ,attributes :{"class":"ac"}
                   ,template:"#=setClaimTpMap(claimTp)#"
                   ,editor:function(container, options){
                       $('<input required name="claimTp" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField: "cmmCdNm"
                           ,dataValueField: "cmmCd"
                           ,dataSource: claimTpList
                           ,valuePrimitive:true
                       });
                       $('<span class="k-invalid-msg" data-for="claimTp"></span>').appendTo(container);
                      }
                 }
               ,{field:"claimStatCd",title:"<spring:message code='ser.lbl.claimStatNm' />", width:90
                   ,attributes :{"class":"ac"}
                   ,template:"#=setClaimStatMap(claimStatCd)#"
                   ,editor:function(container, options){
                       $('<input required name="claimStatCd" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField: "cmmCdNm"
                           ,dataValueField: "cmmCd"
                           ,dataSource: claimTpList
                           ,valuePrimitive:true
                       });
                       $('<span class="k-invalid-msg" data-for="claimStatCd"></span>').appendTo(container);
                      }
                 }
              ,{field:"cauOperAtcNm", title:"<spring:message code='ser.lbl.mainLbrCd' />" , width:120 , attributes :{"class":"al"}} //주작업코드
              ,{field:"cauItemNm", title:"<spring:message code='ser.lbl.cauItemCd' />" , width:140 , attributes :{"class":"al"}}    //원인푸품코드
              ,{field:"claimReqNm", title:"<spring:message code='ser.lbl.reqUsrNm' />" , width:140 , attributes :{"class":"al"}}    //제출자
              ,{field:"claimReqDt" , title:"<spring:message code='ser.lbl.fincReqDt' />", width:120
                  , attributes :{"class":"ac"}
                  , format: "{0:<dms:configValue code='dateFormat' /> HH:mm}"
               }
             ]

    });


    $("#gridRo").kendoExtGrid({
        gridId:"G-SER-1011-000154"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/claimReq/selectClaimRequestForRo.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sRoFromDt"] = $("#sRoFromDt").data("kendoExtMaskedDatePicker").value();
                         params["sRoToDt"]   = $("#sRoToDt").data("kendoExtMaskedDatePicker").value();
                         params["sVinNo"] = $("#sVinNo").val();
                         params["sRoDocNo"] = $("#sRoDocNo").val();

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number" }
                       ,dlrCd:{type:"string" }
                       ,vinNo:{type:"string" }
                       ,roDocNo:{type:"string" }
                       ,claimTp:{type:"string" }
                       ,crNo:{type:"string" }
                       ,roDt:{type:"date" }
                       ,calcDt:{type:"date" }
                    }

                 }//model
           }//schema
        }//dataSource
        ,editable:false
        ,scrollable:true
        ,autoBind:false
        ,sortable:false
        ,selectable:"row"
        ,height:175
        ,filterable:false                 // 필터링 기능 사용안함
        ,change:function (e){
            var selectedVal = this.dataItem(this.select());

            var sRoDocNo = {};
            sRoDocNo["sRoDocNo"] = selectedVal.roDocNo;
            itemSalePrcJudgeUpdate(sRoDocNo);

            var claimUrl = "<c:url value='/ser/wac/claimReq/selectClaimRequestForRoByKey.do' />";
            var giQtyYn = true;
            initAll();
            $("#vinNo").val(selectedVal.vinNo);
            $("#dlrCd").val(selectedVal.dlrCd);
            $("#roDocNo").val(selectedVal.roDocNo);
            $("#crNo").val(selectedVal.crNo);

            var params = {};
            params["sVinNo"] = $("#vinNo").val();
            params["sRoDocNo"] = $("#roDocNo").val();
            params["sDlrCd"] = $("#dlrCd").val();
            params["sCrNo"] = $("#crNo").val();

            searchRoData(params , claimUrl );
        }
        ,columns:[
                {field:"calcDt", title:"<spring:message code='ser.lbl.calcDt' />", width:125, sortable:false, attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }   // 정산일자
                ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150}  // VIN NO
                ,{field:"calcDocNo", title:"<spring:message code='global.lbl.calcNo' />", width:120}   // 정산번호
                ,{field:"roStatCd", title:"<spring:message code='ser.lbl.roStatus' />", width:100, sortable:false, attributes:{"class":"ac"}
                    ,template: "#=roStatCdGrid(roStatCd)#"
                }   // RO상태
                ,{field:"roDt", title:"<spring:message code='ser.lbl.roDt' />", width:125, sortable:false, attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                }   // RO일자
                ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.roWrtrNm' />", width:100}    // RO발행자
                ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:110}      // RO번호
                ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:80, attributes:{"class":"ac"}
                    ,template: "#=roTpCdGrid(roTp)#"
                }               // RO유형
                ,{field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100}       // 차량번호
                ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:100}  // 찰소유자
                ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:100}       // 방문자
                ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", width:100}  // 차종명칭
                ,{field:"modelNm", title:"<spring:message code='par.lbl.modelNm' />", width:100}      // 모델명칭
                ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", width:100, attributes :{"class":"ar"}, format:"{0:n0}"}         // 현주행거리
                ,{field:"carRunDistVal", title:"<spring:message code='ser.lbl.accuDrivDis' />", attributes :{"class":"ar"}, width:100 , format:"{0:n0}"}    // 누적주행거리
                ,{field:"calcTotAmt", title:"<spring:message code='ser.lbl.finalCalcAmt' />", width:90, attributes:{"class":"ar"}}  // 정산금액
                ,{field:"lbrCalcSumAmt", title:"<spring:message code='ser.lbl.totLbrAmt' />", width:90, attributes:{"class":"ar"}}  // 공임합계금액
                ,{field:"parCalcSumAmt", title:"<spring:message code='ser.lbl.totParAmt' />", width:90, attributes:{"class":"ar"}}  // 부품합계금액
                ,{field:"dcTotAmt", title:"<spring:message code='ser.lbl.dcAmt' />", width:90, attributes:{"class":"ar"}}           // 할인금액
                ,{field:"etcTotAmt", title:"<spring:message code='ser.lbl.etcDcAmt' />", width:90, attributes:{"class":"ar"}}       // 기타할인금액
                ,{field:"crNo", title:"<spring:message code='global.lbl.crNo' />" , width:120 , attributes :{"class":"al"}}         // 캠페인번호
                ,{field:"goodwillYn", title:"<spring:message code='ser.lbl.goodWillYn' />", width:30, attributes :{"class":"al"}, hidden:true}
             ]

    });
    /*update by tjx 客户主诉 */
    $("#gridCustRemark").kendoExtGrid({
        gridId:"G-SER-1011-000190"
        ,dataSource:{
            transport:{
                   read :{
                       url:null
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sRoDocNo"] = $("#roDocNo").val();
                         params["sDlrCd"] = $("#dlrCd").val();

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }
            }
           ,schema:{
                 model:{
                     fields:{
                       lineNo:      {type:"string" ,editable:false}      //主诉代码
                       ,custReqCont: {type:"string", editable:false}      //主诉内容
                    }

                 }
           }
        }
        ,pageable:false
        ,sortable:false
        ,autoBind:false
        ,resizable:true
        ,height:150
        ,selectable:"row"
        ,appendEmptyColumn:true
        ,filterable:false                 
        ,change:function (e){

        }
        ,columns:[
                {field:"lineNo",title:"<spring:message code='ser.lbl.custReqCd' />", width: 150, attributes: {"class":"al"}}
               ,{field:"custReqCont",title:"<spring:message code='ser.lbl.reqCont' />", width: 850, attributes: {"class":"al"}}
             ]

    });
    
    /**공임 그리드 **/
    $("#gridLabor").kendoExtGrid({
        gridId:"G-SER-1011-000155"
        ,dataSource:{
            transport:{
                   read :{
                       url:null
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sRoDocNo"] = $("#roDocNo").val();
                         params["sClaimDocNo"] = $("#claimDocNo").val();
                         params["sDlrCd"] = $("#dlrCd").val();
                         params["sCrNo"] = $("#crNo").val();
                         params["sLtsModelCd"] = $("#ltsModelCd").val();

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                       ,dlrCd:{type:"string" , editable:false}
                       ,lineNo:{type:"number", editable:false, validation:{required:true}}
                       ,lbrCd:{type:"string", editable:false, validation:{required:true}}
                       ,lbrNm:{type:"string" , editable:false}
                       ,lbrHm:{type:"number" , editable:false}
                       ,lbrQty:{type:"number", editable:false}
                       ,lbrPrc:{type:"number"}
                       ,lbrAmt:{type:"number"}
                       ,cauCd:{type:"string" , editable:false}
                       ,phenCd:{type:"string" , editable:false}
                       ,cauLbrYn:{type:"string"}
                       ,dstinCd:{type:"string"}
                       ,lbrTp:{type:"string"}
                       ,lbrCdTp:{type:"string"}
                    }

                 }//model
           }//schema
        }//dataSource
        ,pageable:false
        ,sortable:false
        ,autoBind:false
        ,resizable:true
        ,height:150
        ,selectable:"row"
        ,appendEmptyColumn:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,change:function (e){

        }
         ,edit:function(e){
            var fieldName = $(e.container.find("input")[1]).attr("name");

            var claimTp = $("#claimTp").val();
            if(claimTp != "G" ){
                if(fieldName=="lbrAmt" || fieldName =="lbrPrc" ){
                    this.closeCell();
                }
            }
         }
        ,dataBound:function(e){
            if($("#lbrAmt").val()== "")
            calLbrTotAmt();
        }
        ,columns:[
                {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width: 50, attributes: {"class":"ac"}}
               ,{field:"lbrCd",title:"<spring:message code='ser.lbl.lbrCd' />", width: 150, attributes: {"class":"al"}}
               ,{field:"lbrNm",title:"<spring:message code='ser.lbl.lbrNm' />", width: 250, attributes: {"class":"al"}}
               ,{field:"lbrHm",title:"<spring:message code='ser.lbl.lbrHm' />", width: 100, attributes: {"class":"ar"} }
               ,{field:"lbrQty",title:"<spring:message code='ser.lbl.qty' />", width: 80, attributes: {"class":"ar"} }
               ,{field:"lbrPrc",title:"<spring:message code='ser.lbl.lbrPrc' />", width:100
                   , attributes :{"class":"ar"}
                   , format:"{0:n2}"
                   , editor:function(container, options){
                       $('<input required name="lbrPrc" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtNumericTextBox({
                           format: "n2"                // n0:###,###, n2:###,###.##
                          ,decimals:2                // 소숫점
                          ,min: 1
                          ,value: 0.00
                          ,spinners: false
                          ,change:calLbrGridAmt
                       });
                       $('<span class="k-invalid-msg" data-for="lbrPrc"></span>').appendTo(container);
                    }
               }
               ,{field:"lbrAmt",title:"<spring:message code='ser.lbl.confirmLbrAmt' />", width:120
                   , attributes :{"class":"ar"}
                   , format:"{0:n2}"
                   , editor:function(container, options){
                       $('<input required name="lbrAmt" id="lbrAmt" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtNumericTextBox({
                           format: "n2"                // n0:###,###, n2:###,###.##
                          ,decimals:2                // 소숫점
                          ,min: 1
                          ,value: 0.00
                          ,spinners: false
                       });
                       $('<span class="k-invalid-msg" data-for="lbrAmt"></span>').appendTo(container);
                    }

               }
               ,{field:"cauCd", title:"<spring:message code='ser.lbl.cauCd' />", width:90}      //원인코드
               ,{field:"cauNm", title:"<spring:message code='ser.lbl.cauNm' />", width:90, hidden:true}      //원인코드명
               ,{field:"phenCd", title:"<spring:message code='ser.lbl.phenCd' />", width:90}    //현상코드
               ,{field:"phenNm", title:"<spring:message code='ser.lbl.phenNm' />", width:90, hidden:true}    //현상코드
               ,{field:"cauLbrYn",title:"<spring:message code='ser.lbl.mainLbrCd' />", width:100
                   , attributes :{"class":"ac"}
                   , template:"#= setCauYnMap(cauLbrYn) #"
                   , editor:function(container, options){
                       $('<input name="cauLbrYn" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField: "cmmCdNm"
                           ,valuePrimitive:true
                           ,dataValueField: "cmmCd"
                           ,dataSource: cauYnList
                           ,optionLabel:" "
                           ,change:setMainLbrYn
                       });
                       $('<span class="k-invalid-msg" data-for="cauLbrYn"></span>').appendTo(container);
                      }
                 }
                ,{field:"relCauLbrYn", hidden : true}
                ,{field:"dstinCd", hidden : true}
                ,{field:"lbrTp"  , hidden : true }//정비유형
                ,{field:"lbrCdTp"  , hidden : true }//공임코드유형
             ]

    });

    /**부품 그리드 **/
    $("#gridPart").kendoExtGrid({
        gridId:"G-SER-1011-000156"
        ,dataSource:{
            transport:{
                   read :{
                       url:null
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sRoDocNo"] = $("#roDocNo").val();
                         params["sClaimDocNo"] = $("#claimDocNo").val();
                         params["sDlrCd"] = $("#dlrCd").val();
                         params["sCrNo"] = $("#crNo").val();
                         params["sLtsModelCd"] = $("#ltsModelCd").val();

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false }
                       ,itemCd:{type:"string", editable:false, validation:{required:true} }//부품코드
                       ,itemNm:{type:"string", editable:false }//부품명
                       ,reqQty:{type:"number", editable:false  } //수량
                       ,itemQty:{type:"number", editable:true , validation:{required:true} } //수량
                       ,saleUnitCd:{type:"string", editable:false }//단위
                       ,itemPrc:{type:"number", editable:false } // 단가
                       ,itemAmt:{type:"number", editable:true}//금액
                       ,cauItemYn:{type:"string", editable:true }
                       ,npnpMaxAmt:{type:"number", editable:true }
                       ,npnpYn:{type:"string", editable:true }
                    }

                 }//model
           }//schema
        }//dataSource
        ,pageable:false
        ,autoBind:false
        ,height:150
        ,resizable:false
        ,appendEmptyColumn:true
        ,selectable:"row"
        ,filterable:false                 // 필터링 기능 사용안함
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[0]).attr("name");
            var fieldName2 = $(e.container.find("input")[1]).attr("name");
            var grid = $("#gridPart").data("kendoExtGrid");//.dataSource._data;
            var selectedVal = grid.dataItem(grid.select());

            if(fieldName2=="itemQty" && selectedVal.npnpYn != "Y" ){
                this.closeCell();
            }
            if(fieldName=="itemAmt" ){
                this.closeCell();
            }
        }
        ,dataBound:function(e){
            if($("#itemAmt").val()== "")
            calPartTotAmt();
        }
        ,columns:[
                    {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
                   ,{field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:150, attributes :{"class":"al"}}
                   ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:250, attributes :{"class":"al"}}
                   ,{field:"itemQty", title:"<spring:message code='ser.lbl.itemQty' />", width:80
                       , attributes :{"class":"ar"}
                       , editor:function(container, options){
                           $('<input required name="itemQty" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtNumericTextBox({
                               format: "n0"                // n0:###,###, n2:###,###.##
                              ,decimals:0                // 소숫점
                              ,min: 1
                              ,value: 0
                              ,spinners: false
                              ,change:calPartTotAmt
                           });
                           $('<span class="k-invalid-msg" data-for="itemQty"></span>').appendTo(container);
                        }
                   }
                   ,{field:"saleUnitCd", title:"<spring:message code='ser.lbl.unitCd' />", width:100, attributes :{"class":"ac"}}
                   ,{field:"itemPrc", title:"<spring:message code='ser.lbl.wtPartPrc' />", width:100, attributes :{"class":"ar"}, format:"{0:n2}"}
                   ,{field:"itemAmt", title:"<spring:message code='ser.lbl.itemAmt' />", width:150, attributes :{"class":"ar"}, format:"{0:n2}"}
                   ,{field:"cauItemYn", title:"<spring:message code='ser.lbl.cauItemCd' />", width:100
                       , attributes :{"class":"ac"}
                       , template:"#= setCauYnMap(cauItemYn) #"
                       , editor:function(container, options){
                           $('<input name="cauItemYn" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtDropDownList({
                                dataTextField: "cmmCdNm"
                               ,valuePrimitive:true
                               ,dataValueField: "cmmCd"
                               ,dataSource: cauYnList
                               ,optionLabel:" "
                               ,change:function(e){

                                   var grid = $("#gridPart").data("kendoExtGrid");//.dataSource._data;

                                   var selectedVal = grid.dataItem(grid.select());
                                // 주작업을 변경시 주작업코드 변경
                                   if(selectedVal.cauItemYn == "Y" ){
                                       $("#cauItemCd").val(selectedVal.itemCd);
                                       $("#cauItemNm").val(selectedVal.itemNm);
                                   }else{
                                       if($("#cauItemCd").val() == selectedVal.itemCd){
                                           $("#cauItemCd").val("");
                                           $("#cauItemNm").val("");
                                       }
                                   }
                                   //주작업 코드 변경시 로직
                                   $.each(grid.dataSource._data , function(i , gridData){
                                       if( dms.string.isNotEmpty(gridData.cauItemYn) && dms.string.isNotEmpty(selectedVal.cauItemYn) ){
                                           if($("#cauItemCd").val() == gridData.itemCd){
                                               gridData.set("cauItemYn" , "Y");
                                           }else{
                                               gridData.set("cauItemYn" , "N");
                                           }
                                       }
                                   });
                                   calPartTotAmt();
                                   grid.refresh();
                               }
                           });
                           $('<span class="k-invalid-msg" data-for="cauItemYn"></span>').appendTo(container);
                          }
                     }
                   ,{field:"npnpMaxAmt" , hidden:true}
                   ,{field:"npnpYn", hidden:true}
                 ]

    });

    setMainLbrYn = function(){ //ser.lbl.notSelectMainLbrCd
        var grid = $("#gridLabor").data("kendoExtGrid");//.dataSource._data;
        var selectedVal = grid.dataItem(grid.select());

        if(selectedVal.relCauLbrYn == "N"){
            dms.notification.warning("<spring:message code='ser.lbl.notSelectMainLbrCd' />");

            selectedVal.set("cauLbrYn" ,"");
            return;
        }

        // 주작업을 변경시 주작업코드 변경
        if(selectedVal.cauLbrYn == "Y" ){
            $("#cauOperAtcCd").val(selectedVal.lbrCd);
            $("#cauOperAtcNm").val(selectedVal.lbrNm);
            $("#cauCd").val(selectedVal.cauCd);
            $("#cauNm").val(selectedVal.cauNm);
            $("#phenCd").val(selectedVal.phenCd);
            $("#phenNm").val(selectedVal.phenNm);
        }else{
            if($("#cauOperAtcCd").val() == selectedVal.lbrCd){
                $("#cauOperAtcCd").val("");
                $("#cauOperAtcNm").val("");
                $("#cauCd").val("");
                $("#cauNm").val("");
                $("#phenCd").val("");
                $("#phenNm").val("");
            }
        }
        //주작업 코드 변경시 로직
        $.each(grid.dataSource._data , function(i , gridData){
            if( dms.string.isNotEmpty(gridData.cauLbrYn) && dms.string.isNotEmpty(selectedVal.cauLbrYn) ){
                if( ($("#cauOperAtcCd").val() == gridData.lbrCd)  ){
                    gridData.set("cauLbrYn" , "Y");
                }else{
                    gridData.set("cauLbrYn" , "N");
                }
            }
        });
        calLbrTotAmt();
        grid.refresh();
    };


  //선택된 그리드 Rows
    setGridRows = function(grid){

        rowClaimDocNo = "";
        gridRow = 0;
        var selectedVal = grid.dataItem(grid.select());
        if(selectedVal != null){
            row = grid.select().index();
            rowClaimDocNo = selectedVal.claimDocNo;
        }
    }

    $("#tabstrip1").kendoExtTabStrip({
        animation: false
        ,select: function(e) {
            selectTabId = e.item.id;
            var kendoTab = $("#tabstrip1").kendoExtTabStrip().data("kendoExtTabStrip");
        }
    });

    $("#tabstrip2").kendoExtTabStrip({
        animation: false
    });

    $("#befRunDistVal").data("kendoExtNumericTextBox").enable(false);
    $("#befRoDt").data("kendoExtMaskedDatePicker").enable(false);


    <c:if test="${claimDocNo ne ''}">
    var params = {
             "sClaimDocNo":"${claimDocNo}"
            ,"sRoDocNo":"${roDocNo}"
            ,"sVinNo":"${sVinNo}"
            };
    searchClaimData(params);

    $("#sField").data("kendoExtDropDownList").value("01");
    $("#sText").val("${claimDocNo}");
    getSearchData(selectTabId); // Hearder Grid 조회
    </c:if>

    <c:if test="${claimYn eq 'N'}">
     $(".btnAuth").attr("style","display:none");
    </c:if>
    
    //当 是否有索赔提交权限 claimYn 当为 null 时，申请、取消申请按钮 隐藏 贾明 2019-4-19 start
    <c:if test="${claimYn eq null}">
        $(".btnAuth").attr("style","display:none");
    </c:if>
    //当 是否有索赔提交权限 claimYn  当为 null时，申请、取消申请按钮 隐藏 贾明 2019-4-19 end
    
});
</script>
<!-- //script -->
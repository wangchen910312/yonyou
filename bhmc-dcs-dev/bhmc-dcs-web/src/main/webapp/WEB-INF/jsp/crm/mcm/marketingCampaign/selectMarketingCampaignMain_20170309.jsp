<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- *************************************************************************
**************************파일업로드1:상단에 스크립트 추가 ***********************
***************************************************************************-->
<%//TODO[이인문] 파일업로드 플러그인으로 변경 필요 %>
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
**************************파일업로드1:상단에 스크립트 추가 ***********************
***************************************************************************-->

      <!-- 기본정보 -->
      <div id="resizableContainer">
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.campaignMng" /></h1><!-- 캠페인 관리 -->
                    <div class="btn_right">
                    <dms:access viewId="VIEW-I-12534" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnCopyVehic" ><spring:message code="global.btn.copy" /></button> <!-- 복사 -->
                    </dms:access>
                    <dms:access viewId="VIEW-I-12533" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnViewDetail" ><spring:message code='global.btn.detail' /><!-- 상세 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-I-12532" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
                    </dms:access>
                    <dms:access viewId="VIEW-I-12531" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_add" id="btnAddVehic" ><spring:message code="global.btn.add" /></button> <!-- 추가 -->
                    </dms:access>
                    <dms:access viewId="VIEW-I-12530" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_print" id="btnPrintVehic" ><spring:message code="global.btn.print" /></button> <!-- 인쇄 -->
                    </dms:access>
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
                                <th scope="row"><spring:message code="global.lbl.crNm" /><!-- 캠페인명 --></th>
                                <td>
                                    <input id="sMakNm" name="sMakNm" class="form_input" style="width:100%" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.cpiCd" /><!-- 캠페인 코드 --></th>
                                <td>
                                    <input id="sCrNo" name="sCrNo" type="hidden">
                                    <input id="sMakCd" name="sMakCd" class="form_input" style="width:100%" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.hostCd" /><!-- 주최 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="form_left" >
                                            <input id="sHostCd" class="form_comboBox" />
                                        </div>
                                        <div class="form_right">
                                            <input id="sHostTeamCd" class="form_comboBox" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.statNm" /><!-- 상태 --></th>
                                <td>
                                    <input id="sStatCd" class="form_comboBox" style="width:100%" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.campaignDt" /><!-- 캠페인일자 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartDt" class="form_datepicker ac">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndDt" class="form_datepicker ac">
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="global.lbl.type" /><!-- 유형 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="form_left" >
                                            <input id="sMakTpCd" class="form_comboBox" />
                                        </div>
                                        <div class="form_right">
                                            <input id="sMakSubTpCd" class="form_comboBox" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid">
                    <div id="mcdGrid" class="resizable_grid"></div>
                </div>

                <section id="window" class="pop_wrap">
                <!-- 탭메뉴 전체 영역 -->
                <div id="tabstrip" class="tab_area">
                    <!-- 탭메뉴 -->
                    <ul>
                        <li id="defaultInfoTab" class="k-state-active"><spring:message code="global.title.defaultInfo" /><!-- 기본정보 --></li>
                        <li id="planTab"><spring:message code="global.title.plan" /> <!-- 방안 --></li>
                        <li id="goalTab"><spring:message code="global.title.goal" /> <!-- 목표 --></li>
                        <li id="targetTab"><spring:message code="global.title.target" /> <!-- 대상 --></li>
                        <li id="budgetTab"><spring:message code="global.title.budget" /> <!-- 예산 --></li>
                        <li id="progressTab"><spring:message code="crm.title.sign" /> <!-- 결재 --></li>
                        <li id="resultTab"><spring:message code="global.title.result" /> <!-- 결과 --></li>
                        <li id="workTab"><spring:message code="ser.title.lbrOperInfo" /> <!-- 작업정보 --></li>
                        <li id="vinTab"><spring:message code="ser.title.vinInfo" /> <!-- VIN정보 --></li>
                        <li id="laborTab"><spring:message code="ser.title.lbrInfo" /> <!-- 공임정보 --></li>
                        <li id="itemsTab"><spring:message code="ser.title.itemInfo" /> <!-- 부품정보 --></li>
                        <li id="dlrTab"><spring:message code="crm.title.targetDlr" /> <!-- 대상 딜러 --></li>
                    </ul>
                    <div id="defaultInfoTabDiv" class="mt0">
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="global.title.defaultInfo" /></h2><!-- 기본정보 -->
                            <div class="btn_right">
							<dms:access viewId="VIEW-I-12536" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s" id="btnSaveVehic" ><spring:message code="global.btn.save" /></button> <!-- 저장 -->
							</dms:access>
							<dms:access viewId="VIEW-I-12535" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s" id="btnCancelVehic"><spring:message code="crm.btn.campaignCancel" /></button> <!-- 캠페인취소 -->
							</dms:access>				                    
                            </div>
                        </div>
                        <div class="table_form">
                            <form id="defaultInfoForm" >
                                <table>
                                    <caption></caption>
                                    <colgroup>
                                        <col style="width:14%;">
                                        <col style="width:22%;">
                                        <col style="width:10%;">
                                        <col style="width:23%;">
                                        <col style="width:10%;">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.crNo" /><!-- 캠페인번호 --></th>
                                            <td>
                                                <input id="dlrCd" name="dlrCd" type="hidden">
                                                <input id="pltCd" name="pltCd" type="hidden">
                                                <input id="delYn" name="delYn" type="hidden" value="N">
                                                <input id="crNo"  name="crNo"  type="hidden">
                                                <input id="makCd" name="makCd" value="" disabled="disabled" class="form_input form_readonly" style="width:100%">
                                            </td>
                                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.hostCd" /></span> <!-- 주최 --></th>
                                            <td class="required_area">
                                                <div class="form_float">
                                                    <div class="form_left" >
                                                        <input id="hostCd" name="hostCd" value="" class="form_comboBox" />
                                                    </div>
                                                    <div class="form_right">
                                                        <input id="hostTeamCd" name="hostTeamCd" value="" class="form_comboBox" />
                                                    </div>
                                                </div>
                                            </td>
                                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.type" /></span> <!-- 유형 --></th>
                                            <td class="required_area">
                                                <div class="form_float">
                                                    <div class="form_left" >
                                                        <input id="makTpCd" name="makTpCd" value="" class="form_comboBox" />
                                                    </div>
                                                    <div class="form_right">
                                                        <input id="makSubTpCd" name="makSubTpCd" value="" class="form_comboBox" />
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.crNm" /></span> <!-- 캠페인명 --></th>
                                            <td class="required_area" colspan="5">
                                                <input id="makNm" name="makNm" value="" class="form_input" style="width:100%" onKeyUp="txtLimit(this, '500');">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><span class="bu_required"><spring:message code='global.lbl.startDt' /></span></th>       <!-- 시작일 -->
                                            <td class="required_area">
                                                <input id="startDt" name="startDt" class="form_datepicker ac" style="width:100%" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><span class="bu_required"><spring:message code='global.lbl.EndDt' /></span></th>       <!-- 종료일 -->
                                            <td class="required_area">
                                                <input id="endDt" name="endDt" class="form_datepicker ac" style="width:100%" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.term" /><!-- 기간 --></th>
                                            <td>
                                                <input id="prid" name="prid" value="" disabled="disabled" class="form_input form_readonly ac" style="width:90%"> <spring:message code="global.lbl.day" />
                                            </td>
                                        </tr>
                                        <tr>
<%--
                                            <th scope="row"><spring:message code="global.lbl.rcpeAutoYn" /><!-- 대상자 자동추출 여부 --></th>
                                            <td>
                                                <input id="rcpeAutoYn" name="rcpeAutoYn" value="" class="form_comboBox" style="width:100%" />
                                            </td>
--%>
                                            <th scope="row"><spring:message code="global.lbl.aapCmpNm" /><!-- 대행업체 --></th>
                                            <td colspan="3">
                                                <input id="placeNm" name="placeNm" type="hidden">
                                                <input id="rcpeAutoYn" name="rcpeAutoYn" type="hidden">
                                                <input id="aapCmpNm" name="aapCmpNm" value="" class="form_input" style="width:100%" onKeyUp="txtLimit(this, '50');">
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.budgetAmt" /><!-- 예산 --></th>
                                            <td>
                                                <input id="budgetAmt" name="budgetAmt" class="form_numeric ar" maxlength="10" style="width:100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.statNm" /></span><!-- 상태 --></th>
                                            <td class="required_area">
                                                <input id="statCd" name="statCd" value="" class="form_comboBox" style="width:100%" />
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.targCustCnt" /><!-- 목표인수 --></th>
                                            <td>
                                                <input type="number" id="targCustCnt" name="targCustCnt" class="form_numeric ac" maxlength="10" style="width:100%" />
                                            </td>
                                            <th colspan="2"></th>
                                            <%--
                                            <th scope="row"><spring:message code="global.lbl.pgssRate" /><!-- 진도 --></th>
                                            <td>
                                                <input id="pgssRate" name="pgssRate" value="" disabled="disabled" class="form_input form_readonly ac" style="width:90%"> %
                                            </td>
                                            --%>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='ser.lbl.creStartDt' /></th>       <!-- 생산시작일자 -->
                                            <td>
                                                <input id="creStartDt" name="creStartDt" class="form_datepicker ac" style="width:100%" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code='ser.lbl.creEndDt' /></th>       <!-- 생산종료일자 -->
                                            <td>
                                                <input id="creEndDt" name="creEndDt" class="form_datepicker ac" style="width:100%" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code="ser.lbl.endYn" /><!-- 종료여부 --></th>
                                            <td>
                                                <input id="crEndTp" name="crEndTp" value="" class="form_comboBox" style="width:100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code='ser.lbl.saleStartDt' /></th>       <!-- 판매시작일자 -->
                                            <td>
                                                <input id="saleStartDt" name="saleStartDt" class="form_datepicker ac" style="width:100%" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code='ser.lbl.saleEndDt' /></th>       <!-- 판매종료일자 -->
                                            <td>
                                                <input id="saleEndDt" name="saleEndDt" class="form_datepicker ac" style="width:100%" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code="ser.lbl.crIsaNm" /><!-- 시행처 --></th>
                                            <td>
                                                <input id="pcDstinCd"  name="pcDstinCd"  type="hidden"><!-- 승상용구분코드 -->
                                                <input id="crIsaNm" name="crIsaNm" value="" class="form_input" style="width:100%" onKeyUp="txtLimit(this, '20');">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.remark" /><!-- 비고 --></th>
                                            <td colspan="5">
                                                <textarea id="makCont" name="makCont" rows="4" cols="" class="form_textarea" style="width:100%" onKeyUp="txtLimit(this, '4000');"></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일 --></th>
                                            <td>
                                                <input id="regDt" name="regDt" value="" disabled="disabled" class="form_input form_readonly ac" style="width:100%">
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.updtDt" /><!-- 수정일 --></th>
                                            <td>
                                                <input id="updtDt" name="updtDt" value="" disabled="disabled" class="form_input form_readonly ac" style="width:100%">
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.regUsrId" /><!-- 등록자 --></th>
                                            <td>
                                                <input id="regUsrId" name="regUsrId" value="" disabled="disabled" class="form_input form_readonly ac" style="width:100%">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div> <!-- 기본정보 -->
                    <div id="planTabDiv" class="mt0">
                        <form id="planForm" >
                            <div class="clfix">
                                <div class="header_area">
                                    <div class="btn_right">
				                    <dms:access viewId="VIEW-I-12539" hasPermission="${dms:getPermissionMask('READ')}">
                                        <button type="button" class="btn_s" id="btnActiveSave" ><spring:message code="global.btn.save" /></button> <!-- 저장 -->
				                    </dms:access>
				                    <dms:access viewId="VIEW-I-12538" hasPermission="${dms:getPermissionMask('READ')}">
                                        <button type="button" class="btn_s" id="btnActivePrint" ><spring:message code="global.btn.print" /></button> <!-- 인쇄 -->
				                    </dms:access>
                                    </div>
                                </div>
                                <div class="table_form">
                                    <table>
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:8.7%;">
                                            <col style="width:89.3%;">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.activeNm" /></span><!-- 활동명칭 --></th>
                                                <td class="required_area">
                                                    <input id="hDlrCd" name="hDlrCd" type="hidden">
                                                    <input id="hPltCd" name="hPltCd" type="hidden">
                                                    <input id="hMakCd" name="hMakCd" type="hidden">
                                                    <input type="hidden" id="activeFileDocNo" name="activeFileDocNo"  data-json-obj="true"/>
                                                    <input id="activeNm" name="activeNm" value="" class="form_input" style="width:100%" onKeyUp="txtLimit(this, '100');">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.activeCont" /></span><!-- 요약설명 --></th>
                                                <td class="required_area">
                                                    <textarea id="activeCont" name="activeCont" rows="2" cols="" class="form_textarea" style="height:120px;" onKeyUp="txtLimit(this, '2000');"></textarea>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <section class="left_areaStyle">
                                    <div class="header_area">
                                        <h2 class="title_basic"><spring:message code="global.lbl.talkPlan" /></h2><!-- 화술방안 -->
                                        <div class="btn_right">
					                    <dms:access viewId="VIEW-I-12537" hasPermission="${dms:getPermissionMask('READ')}">
                                            <button type="button" class="btn_s" id="btnTalkPlanSearch" ><spring:message code="crm.btn.talkPlanSearch" /><!-- 화술방안 조회 --></button>
					                    </dms:access>
                                        </div>
                                    </div>
                                    <div class="table_form">
                                        <table>
                                            <caption></caption>
                                            <colgroup>
                                                <col style="width:18%;">
                                                <col style="width:82%;">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="row"><spring:message code="global.lbl.talkPlan" /><!-- 화술방안 --></th>
                                                    <td>
                                                        <textarea id="talkPlan" name="talkPlan" rows="4" cols="" class="form_textarea" style="height:206px;" onKeyUp="txtLimit(this, '4000');"></textarea>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </section>
                                <section class="right_areaStyle">
                                    <div class="header_area">
                                        <h2 class="title_basic"><spring:message code="global.btn.fileUpload" /></h2><!-- 파일업로드 -->
                                        <div class="btn_right">
					                    <dms:access viewId="VIEW-I-12544" hasPermission="${dms:getPermissionMask('READ')}">
                                            <span class="btn_file" id="fileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
					                    </dms:access>
					                    <dms:access viewId="VIEW-I-12543" hasPermission="${dms:getPermissionMask('READ')}">
                                            <button type="button" class="btn_s" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
					                    </dms:access>
                                        </div>
                                    </div>
                                    <div class="table_grid">
                                        <div id="fileGrid">
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </form>
<%--
                        <div class="header_area">
                            <h1 class="title_basic"><spring:message code="global.title.activePlan" /></h1><!-- 활동방안 -->
                            <div class="btn_right">
                              <button class="btn_s" id="btnSpSearch" ><spring:message code="global.btn.proSearch" /></button><!-- 판매 프로모션 조회 -->
                              <button class="btn_s btn_add" id="btnActiveAdd"><spring:message code="global.btn.add" /></button>
                              <button class="btn_s btn_del" id="btnActiveDel"><spring:message code="global.btn.del" /></button>
                            </div>
                        </div>

                        <div class="table_grid mt10">
                            <div id="activeGrid"></div>
                        </div>
--%>

<%--
                        <!-- 운전자정보 -->
                        <section class="right_areaStyle">
                            <div class="header_area">
                                <h1 class="title_basic"><spring:message code="global.title.adarPlan" /><!-- 광고 홍보 방안 --></h1>
                                <div class="btn_right">
                                    <button type="button" id="btnSmts" class="btn_s"><spring:message code="global.btn.produceAdSearch" /><!-- 제조사 광고 일정 조회 --></button>
                                </div>
                            </div>
                            <div class="table_form form_width_100per">
                                <form id="plan1Form" >
                                    <table>
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:20%;">
                                            <col style="width:20%;">
                                            <col style="width:15%;">
                                            <col style="width:45%;">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.adInvtHm" /></span><!-- 광고투자시간 --></th>
                                                <td class="required_area">
                                                    <input id="vAdInvtHm" name="vAdInvtHm" class="form_input ac" maxlength="10" style="width:100%" />
                                                </td>
                                                <th scope="row"><spring:message code="global.lbl.adMediaCd" /><!-- 매체 --></th>
                                                <td>
                                                    <input id="vAdMediaCd" name="vAdMediaCd" value="" class="form_comboBox" style="width:100%" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row"><span class="bu_required"><spring:message code="global.lbl.adCostAmt" /></span><!-- 광고비용 --></th>
                                                <td class="required_area">
                                                    <input id="vAdCostAmt" name="vAdCostAmt" class="form_numeric ar" maxlength="10" style="width:100%" />
                                                </td>
                                                <th scope="row"><spring:message code="global.lbl.adStartEndDt" /><!-- 광고일정 --></th>
                                                <td>
                                                    <input id="vAdStartDt" class="form_datepicker ac" style="width:45%">
                                                    ~
                                                    <input id="vAdEndDt" class="form_datepicker ac" style="width:45%">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </section>
                        <!-- //차량정보 -->
--%>
                    </div> <!-- 방안 -->
                    <div id="goalTabDiv" class="mt0">
                        <!-- 그리드 기능 버튼 시작 -->
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="global.title.goal" /></h2><!-- 목표 -->
                            <div class="btn_right">
		                    <dms:access viewId="VIEW-I-12542" hasPermission="${dms:getPermissionMask('READ')}">
                                <button class="btn_s" id="btnGoalSave"><spring:message code="global.btn.save" /></button>
		                    </dms:access>
		                    <dms:access viewId="VIEW-I-12541" hasPermission="${dms:getPermissionMask('READ')}">
                                <button class="btn_s" id="btnGoalAdd"><spring:message code="global.btn.rowAdd" /></button>
		                    </dms:access>
		                    <dms:access viewId="VIEW-I-12540" hasPermission="${dms:getPermissionMask('READ')}">
                                <button class="btn_s" id="btnGoalDel"><spring:message code="global.btn.rowDel" /></button>
		                    </dms:access>
                            </div>
                        </div>
                        <!-- 그리드 기능 버튼 종료 -->

                        <div class="table_grid">
                            <div id="goalGrid"></div>
                        </div>
                    </div> <!-- 목표 -->
                    <div id="targetTabDiv" class="mt0">
                        <section class="group">
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code='crm.title.crmTargExtract' /></h2><!-- 대상자 추출 조건 설정 -->
                            <div class="btn_right">
                                <!--<button class="btn_m" id="btnBatch">대상자추출 배치</button>-->
                                <!--<button class="btn_m" id="btnBatchIf">인터페이스 배치</button>-->                                
		                    <dms:access viewId="VIEW-I-12549" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s" id="btnRcpeExtr" ><spring:message code='crm.btn.rcpeExtrMapping' /><!-- 대상자 추출 --></button>
		                    </dms:access>
		                    <dms:access viewId="VIEW-I-12548" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s" id="btnTargetSave" ><spring:message code='global.btn.save' /><!-- 저장 --></button>
		                    </dms:access>
		                    <dms:access viewId="VIEW-I-12547" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s" id="btnTargetAdd" ><spring:message code='global.btn.add' /><!-- 추가 --></button>
		                    </dms:access>
		                    <dms:access viewId="VIEW-I-12546" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s" id="btnTargetDelete" ><spring:message code='global.btn.del' /><!-- 삭제 --></button>
		                    </dms:access>
		                    <dms:access viewId="VIEW-I-12545" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s" id="btnExcelImport"><spring:message code="crm.btn.excellCustUpload" /><!-- 고객 업로드 --></button>
		                    </dms:access>
                            </div>
                        </div>
                        <div class="table_form">
                            <form id="targetForm" >
                                <table>
                                    <caption></caption>
                                    <colgroup>
                                        <col style="width:20%;">
                                        <col style="width:10%;">
                                        <col style="width:18%;">
                                        <col style="width:25%;">
                                        <col style="width:17%;">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.custExtrAutoYn' /><!-- 고객추출자동여부 --></span></th>
                                            <td class="required_area">
                                                <input id="tDlrCd" name="tDlrCd" type="hidden">
                                                <input id="tMakCd" name="tMakCd" type="hidden">
                                                <input id="extrDgreCnt" name="extrDgreCnt" type="hidden">
                                                <input id="realTargetCnt" name="realTargetCnt" type="hidden">
                                                <input id="custExtrAutoYn" name="custExtrAutoYn" value="" class="form_comboBox" required style="width:100%" />
                                            </td>
<%--
                                            <th scope="row"><spring:message code='crm.lbl.custExtrCycleCont' /><!-- 고객추출주기 --></th>
                                            <td>
                                                <span class="form_search">
                                                    <input type="text" id="custExtrCycleCont" name="custExtrCycleCont" class="form_input form_readonly" style="width:100%" />
                                                    <a href="javascript:;" id="custSearch" ></a>
                                                </span>
                                            </td>
--%>
                                            <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.custExtrTermNo' /><!-- 고객추출조건 --></span></th>
                                            <td class="required_area">
                                                <input id="custExtrTitleNm" name="custExtrTitleNm" type="hidden">
                                                <input id="custExtrTermNo" name="custExtrTermNo" value="" class="form_comboBox" style="width:100%" />
                                            </td>
                                            <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.dupYn' /><!-- 중복 --></span></th>
                                            <td class="required_area">
                                                <input id="dupYn" name="dupYn" value="" class="form_comboBox" required style="width:100%" />
                                            </td>
                                        </tr>
                                        <!-- ###################################################### 추출주기설정 1/5 HTML 추가 시작 1/5 -->
                                        <tr>
                                            <th scope="row"><spring:message code='crm.lbl.custExtrCycleCont' /><!-- 고객추출주기 --></th>
                                            <td colspan="5">
                                                <button type="button" class="btn_s" id="btnCycleDay" ><spring:message code='crm.btn.allDay' /><!-- 매일 --></button>
                                                <button type="button" class="btn_s" id="btnCycleWeek" ><spring:message code='crm.btn.allWeek' /><!-- 매주 --></button>
                                                <button type="button" class="btn_s btn_select" id="btnCycleSelect" ><spring:message code='global.btn.select' /><!-- 선택 --></button>
                                                <input id="cycleDatepicker" name="cycleDatepicker" class="form_datepicker multi_datepicker" />
                                                <input type="hidden" id="custExtrCycleTp" name="custExtrCycleTp" data-json-obj="true" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" ></th>
                                            <td class="vt" colspan="5">
                                                <div id="weekSelect" style="display:none;">
                                                <c:forEach var="obj" items="${custExtrCycleWeekList}">
                                                    <label class="label_check" style="width:45px;margin:0 0 2px;"><input type="checkbox" id="custExtrCycleWeek_<c:out value='${obj.cmmCd}' />" name="custExtrCycleWeek" class="form_check" value="<c:out value='${obj.cmmCd}' />" data-json-obj="true" /> <c:out value="${obj.cmmCdNm}" /></label>
                                                </c:forEach>
                                                </div>
                                                <div id="cycleDtTxtArea" style="display:none;">
                                                    <textarea rows="2" cols="" id="cycleDt" name="cycleDt" class="form_textarea" maxlength="1000" ></textarea>
                                                </div>
                                            </td>
                                        </tr>
                                        <!-- ###################################################### 추출주기설정 1/5 HTML 추가 종료 -->
                                    </tbody>
                                </table>
                            </form>
                        </div>
                        </section>

                        <section class="group">
                            <div class="header_area">
                                <h2 class="title_basic"><spring:message code='crm.title.extractList' /></h2><!-- 추출 실행 목록 -->
                            </div>
                            <div class="table_grid">
                                <div id="targetGrid"></div>
                            </div>
                        </section>
                    </div> <!-- 대상 -->
                    <div id="budgetTabDiv" class="mt0">
                        <!-- 그리드 기능 버튼 시작 -->
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="global.title.budgetInfo" /></h2><!-- 예산(위안)정보 -->
                            <div class="btn_right">
		                    <dms:access viewId="VIEW-I-12553" hasPermission="${dms:getPermissionMask('READ')}">
                                <button class="btn_s" id="btnBudgetSave"><spring:message code="global.btn.save" /></button>
		                    </dms:access>
		                    <dms:access viewId="VIEW-I-12552" hasPermission="${dms:getPermissionMask('READ')}">
                                <button class="btn_s" id="btnBudgetAdd"><spring:message code="global.btn.rowAdd" /></button>
		                    </dms:access>
		                    <dms:access viewId="VIEW-I-12551" hasPermission="${dms:getPermissionMask('READ')}">
                                <button class="btn_s" id="btnBudgetDel"><spring:message code="global.btn.rowDel" /></button>
		                    </dms:access>
		                    <dms:access viewId="VIEW-I-12550" hasPermission="${dms:getPermissionMask('READ')}">
                                <button class="btn_s" id="btnBudgetExcelExport"><spring:message code="global.btn.excelExport" /></button>
		                    </dms:access>
                            </div>
                        </div>
                        <!-- 그리드 기능 버튼 종료 -->

                        <div class="table_grid">
                            <div id="budgetGrid"></div>
                        </div>
                    </div> <!-- 예산 -->
                    <div id="progressTabDiv" class="mt0">
                        <section class="group">
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="crm.title.sign" /></h2><!-- 결재 -->
                            <div class="btn_right">
		                    <dms:access viewId="VIEW-I-12556" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s" id="btnEval"><spring:message code="crm.btn.eval" /></button><!-- 심사 -->
		                    </dms:access>
		                    <dms:access viewId="VIEW-I-12555" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s" id="btnReject"><spring:message code="global.btn.appRollback" /></button><!-- 반려 -->
		                    </dms:access>
		                    <dms:access viewId="VIEW-I-12554" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s" id="btnEvalReq"><spring:message code="crm.btn.submitReq" /></button><!-- 제출신청 -->
		                    </dms:access>
<%--                            <button type="button" class="btn_s"  id="btnEvalAdd"><spring:message code="global.btn.rowAdd" /></button><!-- 추가 -->
                                <button type="button" class="btn_s"  id="btnEvalDel"><spring:message code="global.btn.rowDel" /></button><!-- 삭제 --> --%>
                            </div>
                        </div>

                        <div class="table_grid">
                            <input id="apprDocNo" name="apprDocNo" type="hidden"><!-- 결재문서번호 -->
                            <input id="signDocId" name="signDocId" type="hidden"><!-- 결재양식ID -->
                            <input id="signCont" name="signCont" type="hidden"><!-- 결재의견 -->
                            <div id="signLineGrid"></div>
                        </div>
                        </section>
                    </div> <!-- 실사진도 -->
                    <div id="resultTabDiv" class="mt0">

                        <div class="clfix">
                            <!-- 목표결과정보 -->
                            <section class="left_areaStyle">
                                <div class="header_area">
                                    <h2 class="title_basic"><spring:message code="global.title.campaignResult" /></h2><!-- 캠페인 결과 -->
                                </div>
                                <div class="table_grid">
                                    <div id="resultGoalGrid"></div>
                                </div>
<%--
                                <div class="header_area">
                                    <h2 class="title_basic"><spring:message code="global.title.campaignPrsn" /><!-- 캠페인 담당자 의견 --></h2>
                                </div>
                                <div class="table_form form_width_100per">
                                    <table>
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:100%;">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <textarea maxlength="4000" id="prsnOpnCont" name="prsnOpnCont" rows="" cols="" disabled="disabled" class="form_textarea form_readonly" style="height:180px;"></textarea>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
--%>
                            </section>

                            <!-- 캠페인담당자의견정보 -->
                            <section class="right_areaStyle">
                                <div class="header_area">
                                    <h2 class="title_basic"><spring:message code="global.title.crop" /><!-- 업체평가 --></h2>
                                </div>
                                <div class="table_grid">
                                    <div id="resultCorpGrid"></div>
                                </div>
<%--
                                <div class="header_area">
                                    <h2 class="title_basic"><spring:message code="global.title.person" /></h2><!-- 직원 설문 -->
                                </div>
                                <div class="table_grid">
                                    <div id="resultPersonGrid"></div>
                                </div>
--%>
                            </section>
                        </div>

                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="global.title.campaignPrsn" /><!-- 캠페인 책임자 의견 --></h2>
                        </div>
                        <div class="table_form form_width_100per">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:100%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>
                                            <textarea maxlength="4000" id="prsnOpnCont" name="prsnOpnCont" rows="" cols="" disabled="disabled" class="form_textarea form_readonly" style="height:170px;"></textarea>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div> <!-- 결과 -->
                    <div id="workTabDiv" class="mt0">
                        <!-- 그리드 기능 버튼 시작 -->
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="ser.title.lbrOperInfo" /></h2><!-- 작업정보 -->
                        </div>
                        <!-- 그리드 기능 버튼 종료 -->

                        <div class="table_grid">
                            <div id="workGrid"></div>
                        </div>
                    </div> <!-- 작업정보 -->
                    <div id="vinTabDiv" class="mt0">
                        <!-- 그리드 기능 버튼 시작 -->
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="ser.title.vinInfo" /></h2><!-- VIN정보 -->
                        </div>
                        <!-- 그리드 기능 버튼 종료 -->

                        <div class="table_grid">
                            <div id="vinGrid"></div>
                        </div>
                    </div> <!-- VIN정보 -->
                    <div id="laborTabDiv" class="mt0">
                        <!-- 그리드 기능 버튼 시작 -->
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="ser.title.lbrInfo" /></h2><!-- 공임정보 -->
                        </div>
                        <!-- 그리드 기능 버튼 종료 -->

                        <div class="table_grid">
                            <div id="laborGrid"></div>
                        </div>
                    </div> <!-- 공임정보 -->
                    <div id="itemsTabDiv" class="mt0">
                        <!-- 그리드 기능 버튼 시작 -->
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="ser.title.itemInfo" /></h2><!-- 부품정보 -->
                        </div>
                        <!-- 그리드 기능 버튼 종료 -->

                        <div class="table_grid">
                            <div id="itemsGrid"></div>
                        </div>
                    </div> <!-- 부품정보 -->
                    <div id="dlrTabDiv" class="mt0">
                        <!-- 그리드 기능 버튼 시작 -->
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="crm.title.targetDlr" /></h2><!-- 대상 딜러 -->

                            <div class="btn_right">
		                    <dms:access viewId="VIEW-I-12559" hasPermission="${dms:getPermissionMask('READ')}">
                                <button class="btn_s" id="btnTargetOff"><spring:message code="global.btn.targetOff" /></button>
		                    </dms:access>
		                    <dms:access viewId="VIEW-I-12558" hasPermission="${dms:getPermissionMask('READ')}">
                                <button class="btn_s" id="btnTargetOn"><spring:message code="global.btn.targetOn" /></button>
		                    </dms:access>
		                    <dms:access viewId="VIEW-I-12557" hasPermission="${dms:getPermissionMask('READ')}">
                                <button class="btn_s" id="btnDlrSave"><spring:message code="global.btn.save" /></button>
		                    </dms:access>
                            </div>
                        </div>
                        <!-- 그리드 기능 버튼 종료 -->

                        <div class="table_grid">
                            <div id="dlrGrid"></div>
                        </div>
                    </div> <!-- 대상 딜러 -->
                </div>
                </section>

            </section>
      </div>
      <!-- //기본정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">


    var isGridReload = false      // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
      , resultKey                 // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
    ;


    // 캠페인목록에서 makCd 가지고 온경우 해당 grid dataBound 시 makCd 찾아서 선택, 상세조회 이벤트 준다
//    <c:if test="${makCd != ''}">
//        var  isGridReload = true
//           , resultKey = "<c:out value='${makCd}' />"
//        ;
//    </c:if>

    var hostList     = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var hostTeamList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var makTpList    = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var makSubTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var statList     = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var budGetList   = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];


    <c:forEach var="obj" items="${hostList}">
        hostList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${hostTeamList}">
        hostTeamList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${makTpList}">
        makTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${makSubTpList}">
        makSubTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${statList}">
        statList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //예산코드 Array
    <c:forEach var="obj" items="${budGetList}">
        budGetList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //예산코드 Map
    var budGetMap = [];
    $.each(budGetList, function(idx, obj){
        budGetMap[obj.cmmCd] = obj.cmmCdNm;
    });

    //그리드 고객추출조건 콤보 DataSource
    var targExtractList = [{"custExtrTermNo":"", "custExtrTermNm":""}]; //고객추출조건번호

    <c:forEach var="obj" items="${targExtractList}">
    targExtractList.push({"custExtrTermNo":"${obj.custExtrTermNo}" , "custExtrTermNm":"${obj.custExtrTermNm}"});
    </c:forEach>


    // 차종
    var carLineCdDSList = [];
    var carLineCdObj = {};
    <c:forEach var="obj" items="${carLineCdInfo}">
        carLineCdDSList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
        carLineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
    </c:forEach>

    // 그리드 모델 콤보 DataSource
    var modelCdDSList = [];
    var modelCdObj = {};


    //결재유형  Array
    var arrSignTp = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${arrSignTp}">
    arrSignTp.push({
        "cmmCd":"${obj.cmmCd}"
        ,"cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>

    var arrSignTpMap = dms.data.arrayToMap(arrSignTp, function(obj){ return obj.cmmCd; });

    //결재진행상태  Array
    var arrSignStatCd = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${arrSignStatCd}">
    arrSignStatCd.push({
        "cmmCd":"${obj.cmmCd}"
        ,"cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>

    var arrSignStatCdMap = dms.data.arrayToMap(arrSignStatCd, function(obj){ return obj.cmmCd; });

    //결재처리코드  Array
    var arrSignProcCd = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${arrSignProcCd}">
    arrSignProcCd.push({
        "cmmCd":"${obj.cmmCd}"
        ,"cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>

    var arrSignProcCdMap = dms.data.arrayToMap(arrSignProcCd, function(obj){ return obj.cmmCd; });

    function callBackFunc(){
        //var customerForm = $("#tabFormIframe").contents().find("#customerForm").html();
        //$("#tabstrip-1", parent.document).html(customerForm);
        //$("#tabFormIframe").contents().find("#customerForm").html();
    }

    //고객 추출주기의 버튼을 잠근다.
    function cycleCheckDisTrue(){
        $("#btnCycleDay").prop("disabled",true);
        $("#btnCycleWeek").prop("disabled",true);
        $("#btnCycleSelect").prop("disabled",true);
        $("#cycleDatepicker").prop("disabled",true);
        //$("#cycleDatepicker").addClass("form_readonly");
        var cycleDatepicker = $("#cycleDatepicker").data("kendoDatePicker");
        cycleDatepicker.enable(false);
        cycleFormInit();

        //체크박스
        $("input[name=custExtrCycleWeek]:checkbox").prop("checked",false);

        // 날짜 선택 텍스트 박스
        $("#cycleDt").val("");
        $("#cycleDtTxtArea").hide();
    }

    //고객 추출주기의 버튼을 푼다.
    function cycleCheckDisFalse(){
        $("#btnCycleDay").prop("disabled",false);
        $("#btnCycleWeek").prop("disabled",false);
        $("#btnCycleSelect").prop("disabled",false);
        $("#cycleDatepicker").prop("disabled",false);
        var cycleDatepicker = $("#cycleDatepicker").data("kendoDatePicker");
        cycleDatepicker.enable(true);
        $("input[name=custExtrCycleWeek]:checkbox").prop("disabled",false);
        /* var cycleDatepicker = $("#cycleDatepicker").data("kendoDatePicker");
        cycleDatepicker.open(); */
    }

    var mode = "N";

    function resetDefualtForm(){
        $("#tDlrCd").val("");
        $("#hDlrCd").val("");
        $("#dlrCd").val("");
        $("#hPltCd").val("");
        $("#pltCd").val("");
        $("#hMakCd").val("");
        $("#tMakCd").val("");
        $("#makCd").val("");
        $("#makNm").val("");
        $("#hostCd").data("kendoExtDropDownList").select(0);
//        $("#hostTeamCd").data("kendoExtDropDownList").select(0);

        $("#hostTeamCd").data("kendoExtDropDownList").setDataSource([]);
        $("#hostTeamCd").data("kendoExtDropDownList").enable(false);

        $("#makTpCd").data("kendoExtDropDownList").select(0);
//        $("#makSubTpCd").data("kendoExtDropDownList").select(0);

        $("#makSubTpCd").data("kendoExtDropDownList").setDataSource([]);
        $("#makSubTpCd").data("kendoExtDropDownList").enable(false);

        $("#makCont").val("");
//        $("#rcpeAutoYn").data("kendoExtDropDownList").value("N");
        $("#rcpeAutoYn").val("N");
        $("#startDt").val("");
        $("#endDt").val("");
        $("#prid").val("");
        $("#placeNm").val("");
        $("#aapCmpNm").val("");
        $("#budgetAmt").data("kendoExtNumericTextBox").value(0);     // 예산

        $("#statCd").data("kendoExtDropDownList").value("01");
        $("#statCd").data("kendoExtDropDownList").readonly(true);
        $("#statCd").parent().addClass("readonly_area");

        $("#targCustCnt").data("kendoExtNumericTextBox").value(0);   // 목표인수
//        $("#pgssRate").val("");
        $("#regDt").val("");
        $("#updtDt").val("");
        $("#regUsrId").val("");

        $("#activeNm").val("");
        $("#activeCont").val("");
        $("#talkPlan").val("");
        $("#activeFileDocNo").val("");//파일 일련번호
        $("#apprDocNo").val("");//결재문서번호
        $("#signDocId").val("");//결재양식ID
        $("#signCont").val("");//결재의견

        $("#crNo").val(""); // 캠페인번호(정비용)
        $("#creStartDt").val(""); // 생산시작일자(정비용)
        $("#creEndDt").val(""); // 생산종료일자(정비용)
        $("#saleStartDt").val(""); // 판매시작일자(정비용)
        $("#saleEndDt").val(""); // 판매종료일자(정비용)
        $("#crEndTp").data("kendoExtDropDownList").value("N"); // 종료여부(정비용)
        $("#crIsaNm").val(""); // 캠페인리콜시행처명(정비용)
        $("#pcDstinCd").val(""); // 승상용구분코드(정비용)

        $("#fileGrid").data("kendoExtGrid").dataSource.data([]);  //파일


        $("#goalGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#goalGrid").data("kendoExtGrid").dataSource.page(1);


        $("#targetGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#targetGrid").data("kendoExtGrid").dataSource.page(1);

        initTargetForm();

        if($("#custExtrAutoYn").data("kendoExtDropDownList").value() == "Y"){
            cycleCheckDisFalse();
        }else{
            cycleCheckDisTrue();
        }


        $("#budgetGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#budgetGrid").data("kendoExtGrid").dataSource.page(1);


        $("#signLineGrid").data("kendoExtGrid").dataSource._destroyed = [];

        if( $("#apprDocNo").val() != null && $("#apprDocNo").val() != "" ) {
            $("#signLineGrid").data("kendoExtGrid").dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectSignLineExs.do' />";
        }else{
            $("#signLineGrid").data("kendoExtGrid").dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectDocLineExs.do' />";
        }

        $("#signLineGrid").data("kendoExtGrid").dataSource.page(1);

        $("#signCont").val("");


        $("#resultGoalGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#resultGoalGrid").data("kendoExtGrid").dataSource.page(1);

//        $("#resultPersonGrid").data("kendoExtGrid").dataSource._destroyed = [];
//        $("#resultPersonGrid").data("kendoExtGrid").dataSource.page(1);

        $("#resultCorpGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#resultCorpGrid").data("kendoExtGrid").dataSource.page(1);

        $("#prsnOpnCont").val("");

        $("#workGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#workGrid").data("kendoExtGrid").dataSource.page(1);

        $("#vinGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#vinGrid").data("kendoExtGrid").dataSource.page(1);

        $("#laborGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#laborGrid").data("kendoExtGrid").dataSource.page(1);

        $("#itemsGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#itemsGrid").data("kendoExtGrid").dataSource.page(1);

        $("#dlrGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#dlrGrid").data("kendoExtGrid").dataSource.page(1);
    }

    //시작일자와 종료일자를 비교하여 그 사이 기간 구하기
    function f_betweenDate(startDt, endDt){

        if(startDt != "" && endDt != ""){
            var startDay = startDt;
            var endDay   = endDt;

            var dataArry1 = startDay.split("-");
            var dataArry2 = endDay.split("-");

            var dateObj1  = new Date(dataArry1[0], Number(dataArry1[1])-1, dataArry1[2]);
            var dateObj2  = new Date(dataArry2[0], Number(dataArry2[1])-1, dataArry2[2]);

            var day = 1000*60*60*24;
            var month = day*30;
            var year = month*12;

            var betweenDay = ((dateObj2.getTime() - dateObj1.getTime()) / day) + 1;
            var betweenMonth = (dateObj2.getTime() - dateObj1.getTime()) / month;

            $("#prid").val(betweenDay);
//            return betweenDay;
        }
    }

  //예산 및 제조사지원금액 합계 계산
    function budgetGridSum() {
        var budgetGridBudgetAmtSum = 0;
        var budgetGridCorpBudnRateSum = 0;
        var budgetGridImsSuptAmtSum = 0;
        var gridDataList = $("#budgetGrid").data("kendoExtGrid").dataSource.data();
        $(gridDataList).each(function(idx, item){
            budgetGridBudgetAmtSum += item.budgetAmt;
            budgetGridCorpBudnRateSum += item.corpBudnRate;
            budgetGridImsSuptAmtSum += item.imsSuptAmt;
        });
        $("#budgetGridBudgetAmtSum").html(kendo.toString(budgetGridBudgetAmtSum, 'n0'));
        $("#budgetGridCorpBudnRateSum").html(kendo.toString(budgetGridCorpBudnRateSum, 'n0'));
        $("#budgetGridImsSuptAmtSum").html(kendo.toString(budgetGridImsSuptAmtSum, 'n0'));
    }

    /**
    * 직원설문에 대한 설문내용 조회
    */
/*
    $(document).on("click", ".personEmpNm", function(e){

         var grid = $("#resultPersonGrid").data("kendoExtGrid"),
         row = $(e.target).closest("tr");
         var dataItem = grid.dataItem(row);

         marketingCampaignServeyPopup = dms.window.popup({
             windowId:"marketingCampaignServeyPopup"
             , title:"<spring:message code='global.title.person'/>"
             ,height:510
             , content:{
                 url:"<c:url value='/crm/mcm/marketingCampaign/selectMarketingCampaignSurveyPopup.do?dlrCd="+dataItem.dlrCd+"&makCd="+dataItem.makCd+
                         "&ivstTp="+dataItem.ivstTp+"&empId="+dataItem.empId+"&stsfIvstSeq="+dataItem.stsfIvstSeq+"&subyTmplSeq="+dataItem.subyTmplSeq+"'/>"
                 , data:{

                 }
             }
         });
     });
*/

    /**
     * 업체평가에 대한 설문내용 조회
     */
     $(document).on("click", ".corpEmpNm", function(e){

          var grid = $("#resultCorpGrid").data("kendoExtGrid"),
          row = $(e.target).closest("tr");
          var dataItem = grid.dataItem(row);

          marketingCampaignServeyPopup = dms.window.popup({
              windowId:"marketingCampaignServeyPopup"
              , title:"<spring:message code='global.title.crop'/>"
              ,width:800
              ,height:510
              , content:{
                  url:"<c:url value='/crm/mcm/marketingCampaign/selectMarketingCampaignSurveyPopup.do?dlrCd="+dataItem.dlrCd+"&makCd="+dataItem.makCd+
                          "&ivstTp="+dataItem.ivstTp+"&empId="+dataItem.empId+"&stsfIvstSeq="+dataItem.stsfIvstSeq+"&subyTmplSeq="+dataItem.subyTmplSeq+"'/>"
                  , data:{

                  }
              }
          });
      });

    /**
    * 캠페인 마스터 그리드 - 참여인력 조회 팝업
    */
    $(document).on("click", ".popTargExtractList", function(e){

        var grid = $("#mcdGrid").data("kendoExtGrid"),
        row = $(e.target).closest("tr");
        var dataItem = grid.dataItem(row);

        targExtractSearchPopupWin = dms.window.popup({
            windowId:"targExtractSearchPopupWin"
            ,title:"<spring:message code='crm.title.rcpeList'/>"   // 대상자 목록
            ,content:{
                url:"<c:url value='/crm/cmm/crmTargExtract/selectCrmTargExtractSearchPopup.do?dlrCd="+dataItem.dlrCd+"&makCd="+dataItem.makCd+"'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    ,"callbackFunc":function(data){

                    }
                }
            }
         })

     });

    /**
     * 대상자 그리드 - 대상자수 조회 팝업
     */
     $(document).on("click", ".popTargExtractDetailList", function(e){

         var grid = $("#targetGrid").data("kendoExtGrid"),
         row = $(e.target).closest("tr");
         var dataItem = grid.dataItem(row);

         targExtractDetailSearchPopupWin = dms.window.popup({
             windowId:"targExtractDetailSearchPopupWin"
             ,title:"<spring:message code='crm.title.rcpeList'/>"   // 대상자 목록
             ,width:800
             ,content:{
                 url:"<c:url value='/crm/cmm/crmTargExtract/selectCrmTargExtractDetailSearchPopup.do?dlrCd="+dataItem.dlrCd+"&makCd="+dataItem.makCd+"&extrDgreCnt="+dataItem.extrDgreCnt+"&statCd="+$("#statCd").data("kendoExtDropDownList").value()+"'/>"
                 , data:{
                     "autoBind":false
                     , "type"  :null
                     ,"callbackFunc":function(data){

                     }
                 }
             }
          })

      });

    //사용자 팝업 조회
    var userSearchPopupWin;
    function userSearchPopup() {

        var grid = $("#signLineGrid").data("kendoExtGrid");
        //var rows = grid.tbody.find("tr");
        var row  = grid.select();
        var uid  = row[0].attributes["data-uid"].nodeValue;
        var dataSourceRow = grid.dataSource.getByUid(uid);



        userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"callbackFunc":function(data){
//                        dms.notification.info(JSON.stringify(data));

                        dataSourceRow.set("signUsrId", data[0].usrId);
                        dataSourceRow.set("signUsrNm", data[0].usrNm);


                    }
                }
            }

        });
    }

    var popupWindow;

    // 주기 설정 팝업
    $("#custSearch").click(function(){

        //고객자동추출여부가 "Y"일 경우만 팝업 호출
        if($("#custExtrAutoYn").val() == "Y"){
            popupWindow = dms.window.popup({
                windowId:"cronPopup"
                , title:"<spring:message code='crm.lbl.cronSetting' />"   // 주기설정
                , height:600
                , content:{
                    url:"<c:url value='/crm/cmm/cronMaker/selectCronMakerPopup.do'/>"
                    , data:{
                        "autoBind" :false
                        , "type"   :null
                        , "cronTxt":$("#custExtrCycleCont").val()
                        , "callbackFunc":function(data){

                            if ( dms.string.isNotEmpty(data) ) {
                                $("#custExtrCycleCont").val(data);
                            }
                            popupWindow.close();
                        }
                    }
                }
            });
        }
    });

    var targetUploadPopupWin;

    // 대상자 입력폼 초기화
    function initTargetForm(){

        $("#extrDgreCnt").val("");
        $("#custExtrAutoYn").data("kendoExtDropDownList").value("N");
//        $("#custExtrCycleCont").val("");
        $("#realTargetCnt").val("");
        $("#custExtrTermNo").data("kendoExtDropDownList").select(1);
        $("#dupYn").data("kendoExtDropDownList").value("Y");

        // ###################################################### 추출주기설정 4/5 초기화 시작
        // 요일 선택 체크박스 영역 초기화
        $("#weekSelect").hide();
        $("input[name=custExtrCycleWeek]:checkbox").prop("checked",false);

        // 날짜 선택 텍스트 박스
        $("#cycleDtTxtArea").hide();
        custExtrCycleDt = [];
        $("#cycleDt").val("");

        // 버튼 값 초기화
        $("#custExtrCycleTp").val("");
        // 버튼 활성화 클래스 초기화
        $("#btnCycleDay").removeClass("btn_active");
        $("#btnCycleWeek").removeClass("btn_active");
        $("#btnCycleSelect").removeClass("btn_active");
        // ###################################################### 추출주기설정 4/5 초기화 종료

    }

    // 고객추출조건(입력부). 필터를 지정하면 저장후 value 선택시 버그 있음. 따라서 함수로 만들어서 저장후 드롭다운리스트를 다시 드려줌.
    var custExtrTermNoDDL = function(){
        $("#custExtrTermNo").kendoExtDropDownList({
            dataSource:targExtractList
            , dataTextField:"custExtrTermNm"
            , dataValueField:"custExtrTermNo"
            , optionLabel:" "
            , filter:"contains"
            //, filtering:onFiltering
            , index:0
        });
    };

    //화술방안 조회
    var talkPlanSearchPopupWin;
    $("#btnTalkPlanSearch").click(function(){

        talkPlanSearchPopupWin = dms.window.popup({
           windowId:"talkPlanSearchPopupWin"
           ,width:800
           ,title:"<spring:message code='crm.title.talkPlan.search'/>"   // 화술방안 조회
           ,content:{
               url:"<c:url value='/crm/mcm/marketingCampaign/selectTalkPlanPopup.do'/>"
               , data:{
                   "autoBind":false
                   , "type"  :null
                   ,"callbackFunc":function(data){
                       if (data.length >= 1) {
                           console.log("Return to User Popup");
                           console.log(data[0]);
                           $("#talkPlan").val(data[0].talkPlan);
                       }
                   }
               }
           }
        })
    });


    // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
    $("#mcdGrid").on("dblclick", "tr.k-state-selected", function (e) {

        var gridId = e.delegateTarget.id
          , grid = $("#"+gridId+"").data("kendoExtGrid")
          , selectedItem = grid.dataItem(grid.select())
        ;

        if ( dms.string.isNotEmpty(selectedItem) ){

            var win = $("#window").data("kendoWindow");
            win.center();
            win.open();

            // 상세조회 후 팝업오픈
//            viewDetail(selectedItem);

        } else {
            // 선택해주세요.
            dms.notification.success("<spring:message code='crm.info.chkSelectItemMsg' />");
            return;
        }

    });


    // 팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
    function viewDetail(selectedItem){

        if (selectedItem != null) {

            var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
            tabStrip.enable(tabStrip.tabGroup.children().eq(1));
            tabStrip.enable(tabStrip.tabGroup.children().eq(2));
            tabStrip.enable(tabStrip.tabGroup.children().eq(3));
            tabStrip.enable(tabStrip.tabGroup.children().eq(4));
            tabStrip.enable(tabStrip.tabGroup.children().eq(5));
            tabStrip.enable(tabStrip.tabGroup.children().eq(6));
            tabStrip.enable(tabStrip.tabGroup.children().eq(7));
            tabStrip.enable(tabStrip.tabGroup.children().eq(8));
            tabStrip.enable(tabStrip.tabGroup.children().eq(9));
            tabStrip.enable(tabStrip.tabGroup.children().eq(10));
            tabStrip.enable(tabStrip.tabGroup.children().eq(11));

            var kendoTab = $("#tabstrip").data("kendoExtTabStrip").select();

            mode = "U";

            if(selectedItem.statCd != "03" && selectedItem.statCd != "05"){
                $("#btnSaveVehic").data("kendoButton").enable(true);
                $("#btnCancelVehic").data("kendoButton").enable(true);
                $("#btnActiveSave").data("kendoButton").enable(true);
                $("#fileSelect").show();
                $("#fileDelete").show();
                $("#btnGoalSave").data("kendoButton").enable(true);
                $("#btnGoalAdd").data("kendoButton").enable(true);
                $("#btnGoalDel").data("kendoButton").enable(true);
                $("#btnRcpeExtr").data("kendoButton").enable(true);
                $("#btnTargetSave").data("kendoButton").enable(true);
                $("#btnTargetAdd").data("kendoButton").enable(true);
                $("#btnTargetDelete").data("kendoButton").enable(true);
                $("#btnExcelImport").data("kendoButton").enable(true);
                $("#btnBudgetSave").data("kendoButton").enable(true);
                $("#btnBudgetAdd").data("kendoButton").enable(true);
                $("#btnBudgetDel").data("kendoButton").enable(true);
                $("#btnTargetOff").data("kendoButton").enable(true);
                $("#btnTargetOn").data("kendoButton").enable(true);
                $("#btnDlrSave").data("kendoButton").enable(true);
            } else {
                $("#btnSaveVehic").data("kendoButton").enable(false);
                $("#btnCancelVehic").data("kendoButton").enable(false);
                $("#btnActiveSave").data("kendoButton").enable(false);
                $("#fileSelect").hide();
                $("#fileDelete").hide();
                $("#btnGoalSave").data("kendoButton").enable(false);
                $("#btnGoalAdd").data("kendoButton").enable(false);
                $("#btnGoalDel").data("kendoButton").enable(false);
                $("#btnRcpeExtr").data("kendoButton").enable(false);
                $("#btnTargetSave").data("kendoButton").enable(false);
                $("#btnTargetAdd").data("kendoButton").enable(false);
                $("#btnTargetDelete").data("kendoButton").enable(false);
                $("#btnExcelImport").data("kendoButton").enable(false);
                $("#btnBudgetSave").data("kendoButton").enable(false);
                $("#btnBudgetAdd").data("kendoButton").enable(false);
                $("#btnBudgetDel").data("kendoButton").enable(false);
                $("#btnTargetOff").data("kendoButton").enable(false);
                $("#btnTargetOn").data("kendoButton").enable(false);
                $("#btnDlrSave").data("kendoButton").enable(false);
            }

            // 상태
            $("#statCd").data("kendoExtDropDownList").value(selectedItem.statCd);
            $("#statCd").data("kendoExtDropDownList").readonly(true);
            $("#statCd").parent().addClass("readonly_area");

            if (kendoTab[0].id == "defaultInfoTab") {

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);
                // 캠페인명
                $("#makNm").val(selectedItem.makNm);
                // 주최
                $("#hostCd").data("kendoExtDropDownList").value(selectedItem.hostCd);
                $("#hostTeamCd").data("kendoExtDropDownList").enable(true);
                onSelectHostCdSet(selectedItem.hostCd);

                // 주최부문
                $("#hostTeamCd").data("kendoExtDropDownList").value(selectedItem.hostTeamCd);
                // 유형
                $("#makTpCd").data("kendoExtDropDownList").value(selectedItem.makTpCd);
                $("#makSubTpCd").data("kendoExtDropDownList").enable(true);
                onSelectMakTpCdSet(selectedItem.makTpCd);

                // 서브유형
                $("#makSubTpCd").data("kendoExtDropDownList").value(selectedItem.makSubTpCd);
                // 비고
                $("#makCont").val(selectedItem.makCont);
                // 시작일
                //$("#startDt").val(kendo.toString(kendo.parseDate(selectedItem.startDt), "<dms:configValue code='dateFormat' />"));
                //var startDt = selectedItem.startDt == null || selectedItem.startDt == "" ? "":selectedItem.startDt.substring(0,4) + "-" + selectedItem.startDt.substring(4,6) + "-" + selectedItem.startDt.substring(6,8);
                $("#startDt").data("kendoExtMaskedDatePicker").value(selectedItem.startDt);
                // 종료일
                //$("#endDt").val(kendo.toString(kendo.parseDate(selectedItem.endDt), "<dms:configValue code='dateFormat' />"));
                //var endDt = selectedItem.endDt == null || selectedItem.endDt == "" ? "":selectedItem.endDt.substring(0,4) + "-" + selectedItem.endDt.substring(4,6) + "-" + selectedItem.endDt.substring(6,8);
                $("#endDt").data("kendoExtMaskedDatePicker").value(selectedItem.endDt);
                // 기간
                $("#prid").val(selectedItem.prid);
                // 장소명
                $("#placeNm").val(selectedItem.placeNm);
                // 대상자 자동추출 여부
//                $("#rcpeAutoYn").data("kendoExtDropDownList").value(selectedItem.rcpeAutoYn);
                $("#rcpeAutoYn").val(selectedItem.rcpeAutoYn);
                // 대행업체명
                $("#aapCmpNm").val(selectedItem.aapCmpNm);
                // 예산
                $("#budgetAmt").data("kendoExtNumericTextBox").value(selectedItem.budgetAmt);

                // 목표인수
                $("#targCustCnt").data("kendoExtNumericTextBox").value(selectedItem.targCustCnt);
                // 진도율
//                $("#pgssRate").val(selectedItem.pgssRate);
                // 등록일
                $("#regDt").val(selectedItem.regDt);
                // 수정일
                $("#updtDt").val(selectedItem.updtDt);
                // 등록자
                $("#regUsrId").val(selectedItem.regUsrId);

                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 생산시작일자(정비용)
                $("#creStartDt").data("kendoExtMaskedDatePicker").value(selectedItem.creStartDt);
                // 생산종료일자(정비용)
                $("#creEndDt").data("kendoExtMaskedDatePicker").value(selectedItem.creEndDt);
                // 판매시작일자(정비용)
                $("#saleStartDt").data("kendoExtMaskedDatePicker").value(selectedItem.saleStartDt);
                // 판매종료일자(정비용)
                $("#saleEndDt").data("kendoExtMaskedDatePicker").value(selectedItem.saleEndDt);
                // 종료여부(정비용)
                $("#crEndTp").data("kendoExtDropDownList").value(selectedItem.crEndTp);
                // 캠페인리콜시행처명(정비용)
                $("#crIsaNm").val(selectedItem.crIsaNm);
                // 승상용구분코드(정비용)
                $("#pcDstinCd").val(selectedItem.pcDstinCd);

                // 캠페인명 포커스
                $("#makNm").focus();

            } else if (kendoTab[0].id == "planTab"){

                // 딜러코드(HIDDEN)
                $("#hDlrCd").val(selectedItem.dlrCd);
                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드(HIDDEN)
                $("#hPltCd").val(selectedItem.pltCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인코드(HIDDEN)
                $("#hMakCd").val(selectedItem.makCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인코드
                $("#makCd").val(selectedItem.makCd);
                // 활동명칭
                $("#activeNm").val(selectedItem.activeNm);
                // 요약설명
                $("#activeCont").val(selectedItem.activeCont);
                //화술방안
                $("#talkPlan").val(selectedItem.talkPlan);
                //파일키
                $("#activeFileDocNo").val(selectedItem.activeFileDocNo);
                //파일 그리드 조회
                $("#fileGrid").data("kendoExtGrid").dataSource.read();

                // 활동명칭 포커스
                $("#activeNm").focus();

            } else if (kendoTab[0].id == "goalTab") {

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);

                // 목표 그리드 조회
                var grid = $("#goalGrid").data("kendoExtGrid");
                grid.dataSource.page(1);

            } else if (kendoTab[0].id == "targetTab") {

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                $("#tDlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);
                $("#tMakCd").val(selectedItem.makCd);

                $("#extrDgreCnt").val("");
                $("#realTargetCnt").val("");

                //고객추출조건(입력부).   targExtractList
                custExtrTermNoDDL();

                if($("#custExtrAutoYn").data("kendoExtDropDownList").value() == "Y"){
                    cycleCheckDisFalse();
                }else{
                    cycleCheckDisTrue();
                }

                // 대상자 그리드 조회
                var grid = $("#targetGrid").data("kendoExtGrid");
                grid.dataSource.page(1);

            } else if (kendoTab[0].id == "budgetTab") {

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);

                // 예산 그리드 조회
                var grid = $("#budgetGrid").data("kendoExtGrid");
                grid.dataSource.page(1);

            } else if (kendoTab[0].id == "progressTab") {

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);
                // 결재문서번호
                $("#apprDocNo").val(selectedItem.apprDocNo);
                // 결재양식ID
                $("#signDocId").val(selectedItem.signDocId);


                // 활동심사 그리드 조회
                var grid = $("#signLineGrid").data("kendoExtGrid");

                if( $("#apprDocNo").val() != null && $("#apprDocNo").val() != "" ) {
                    grid.dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectSignLineExs.do' />";
                }else{
                    grid.dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectDocLineExs.do' />";
                }

                grid.dataSource.page(1);

                $("#signCont").val("");

            } else if (kendoTab[0].id == "resultTab") {

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);

                // 결과-목표 그리드 조회
                var gridGoal = $("#resultGoalGrid").data("kendoExtGrid");
                gridGoal.dataSource.page(1);

                // 결과-직원설문 그리드 조회
    //            var gridPerson = $("#resultPersonGrid").data("kendoExtGrid");
    //            gridPerson.dataSource.page(1);

                // 결과-업체평가 그리드 조회
                var gridCorp = $("#resultCorpGrid").data("kendoExtGrid");
                gridCorp.dataSource.page(1);

                // 결과-담당자 의견 조회
                $.ajax({
                    url:"<c:url value='/crm/mcm/campaignResult/selectPrsnContByKey.do' />"
                    ,data:JSON.stringify({"sDlrCd":selectedItem.dlrCd, "sMakCd":selectedItem.makCd})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {
    //                    dms.notification.error(jqXHR.responseJSON.errors);
                        $("#prsnOpnCont").val("");
                    }
                    ,success:function(jqXHR, textStatus) {
                        $("#prsnOpnCont").val(jqXHR.prsnOpnCont);
                    }
                });

            } else if (kendoTab[0].id == "workTab") {

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);

                // 작업정보(정비용) 그리드 조회
                var grid = $("#workGrid").data("kendoExtGrid");
                grid.dataSource.page(1);

            } else if (kendoTab[0].id == "vinTab") {

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);

                //VIN정보(정비용) 그리드 조회
                var grid = $("#vinGrid").data("kendoExtGrid");
                grid.dataSource.page(1);

            } else if (kendoTab[0].id == "laborTab") {

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);

                // 공임정보(정비용) 그리드 조회
                var grid = $("#laborGrid").data("kendoExtGrid");
                grid.dataSource.page(1);

            } else if (kendoTab[0].id == "itemsTab") {

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);

                // 부품정보(정비용) 그리드 조회
                var grid = $("#itemsGrid").data("kendoExtGrid");
                grid.dataSource.page(1);

            } else if (kendoTab[0].id == "dlrTab") {

                // 딜러코드
                $("#dlrCd").val(selectedItem.dlrCd);
                // 사업장코드
                $("#pltCd").val(selectedItem.pltCd);
                // 캠페인번호(정비용)
                $("#crNo").val(selectedItem.makCd);
                // 캠페인번호
                $("#makCd").val(selectedItem.makCd);

                // 대상 딜러 그리드 조회
                var grid = $("#dlrGrid").data("kendoExtGrid");
                grid.dataSource.page(1);

            }
        } else {

            var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
            tabStrip.disable(tabStrip.tabGroup.children().eq(1));
            tabStrip.disable(tabStrip.tabGroup.children().eq(2));
            tabStrip.disable(tabStrip.tabGroup.children().eq(3));
            tabStrip.disable(tabStrip.tabGroup.children().eq(4));
            tabStrip.disable(tabStrip.tabGroup.children().eq(5));
            tabStrip.disable(tabStrip.tabGroup.children().eq(6));
            tabStrip.disable(tabStrip.tabGroup.children().eq(7));
            tabStrip.disable(tabStrip.tabGroup.children().eq(8));
            tabStrip.disable(tabStrip.tabGroup.children().eq(9));
            tabStrip.disable(tabStrip.tabGroup.children().eq(10));
            tabStrip.disable(tabStrip.tabGroup.children().eq(11));

            mode = "N";
        }
    }

    // 문자열 byte 체크
    var txtLimit = function(obj, limitByte) {

        var currLen = 0;
        var size = 0;
        var charCode, chr = null;
        for( var i = 0 ; i < obj.value.length ; i++ ) {

            chr = obj.value.charAt(i);
            charCode = chr.charCodeAt(0);

            if (charCode <= 0x00007F) size += 1; else
            if (charCode <= 0x0007FF) size += 2; else
            if (charCode <= 0x00FFFF) size += 3;
            else size += 4;

            //console.log("charCode:",charCode+" | size:",size)
            if(size > limitByte ){

                var rtnVal = "";

                for( var j = 0 ; j < currLen ; j++ ) {
                    rtnVal += obj.value.charAt(j);
                }

                obj.value = rtnVal;
                // 텍스트를 {?} byte 초과하여 작성할 수 없습니다.
                dms.notification.warning("<spring:message code='crm.info.byteLimitInfo' arguments='"+limitByte+"' />");
                return false;

            };

            currLen++;
        };
    };


    /* ###################################################### 추출주기설정 2/5 script 추가 시작  */

    var custExtrCycleDt = [];
    // 달력 박스 표시
    function isInArray(date, dates) {
        for(var idx = 0, length = dates.length; idx < length; idx++) {
            var d = dates[idx];
            if (date.getFullYear() == d.getFullYear() &&
                date.getMonth() == d.getMonth() &&
                date.getDate() == d.getDate()) {
                return true;
            }
        }
        return false;
    };

    // 추출주기 화면 초기화 - 화면만 초기화 하고 체크박스, 날짜 선택 값은 초기화 하지 않는다.
    function cycleFormInit() {

        // 요일 선택 체크박스 영역 초기화
        $("#weekSelect").hide();

        // 날짜 선택 텍스트 박스
        $("#cycleDtTxtArea").hide();

        // 버튼 값 초기화
        $("#custExtrCycleTp").val("");

        // 버튼 활성화 클래스 초기화
        $("#btnCycleDay").removeClass("btn_active");
        $("#btnCycleWeek").removeClass("btn_active");
        $("#btnCycleSelect").removeClass("btn_active");

    };

    function dtToString(custExtrCycleDt){

        var custExtrCycleDt = custExtrCycleDt;
        var firstChk = false;
        var cycleDtTxt = "";

        $("#cycleDt").val("");

        $.each(custExtrCycleDt, function(index, obj) {
            if(firstChk){
                cycleDtTxt += ", ";
            }
            cycleDtTxt += kendo.toString(obj,"<dms:configValue code='dateFormat' />");
            firstChk = true;
        });
         $("#cycleDt").val(cycleDtTxt);

    };

    $(document).ready(function() {

        //레이어 팝업
        $("#openButton").click(function(){
            var win = $("#window").data("kendoWindow");
            win.center();
            win.open();
        });
        $("#window").kendoWindow({
            pinned:true,
            modal:true,
            resizable:false,
            visible:false,
            animation:false,
            title:"<spring:message code='crm.title.campaignInfo' />",
            width:"950px",
            height:"500px"
        }).data("kendoWindow");




        // 매일
        $("#btnCycleDay").kendoButton({
            click:function(e){

                //추출주기 화면 초기화
                cycleFormInit();
                $("#btnCycleDay").addClass("btn_active");
                $("#custExtrCycleTp").val("D");

            }
        });
        // 매주
        $("#btnCycleWeek").kendoButton({
            click:function(e){

                //추출주기 화면 초기화
                cycleFormInit();
                $("#btnCycleWeek").addClass("btn_active");
                $("#custExtrCycleTp").val("W");
                $("#weekSelect").show();

            }
        });
        // 선택
        $("#btnCycleSelect").kendoButton({
            click:function(e){

                //추출주기 화면 초기화
                cycleFormInit();
                $("#btnCycleSelect").addClass("btn_active");
                $("#custExtrCycleTp").val("S");
                $("#cycleDtTxtArea").show();

                var cycleDatepicker = $("#cycleDatepicker").data("kendoDatePicker");
                cycleDatepicker.open();

            }
        });

        var cycleDatepicker = $("#cycleDatepicker").kendoDatePicker({
            animation:false,
            dates:custExtrCycleDt,
            month:{
                content:'# if (isInArray(data.date, data.dates)) { #' +
                             '<em class="calendarBg">#= data.value #</em>' +
                         '# } else { #' +
                             '#= data.value #' +
                         '# } # '
            },
            open:function (e) {

                //추출주기 화면 초기화 (  $("#btnCycleSelect").click() 이벤트 주면 무한루프돔 )
                cycleFormInit();
                $("#btnCycleSelect").addClass("btn_active");
                $("#custExtrCycleTp").val("S");
                $("#cycleDtTxtArea").show();

                if ( custExtrCycleDt.length > 0 ) {

                    //$("table tbody .k-state-selected").removeClass("k-state-selected k-state-focused");
                    //$("table tbody .k-state-focused").removeClass("k-state-selected k-state-focused");

                    var cycleDatepicker = $("#cycleDatepicker").data("kendoDatePicker");
                    cycleDatepicker.setOptions({
                        dates:custExtrCycleDt
                        ,month:{
                            content:'# if (isInArray(data.date, data.dates)) { #' +
                                         '<em name="calendarBg" class="calendarBg">#= data.value #</em>' +
                                     '# } else { #' +
                                         '#= data.value #' +
                                     '# } # '
                        }
                    });

                    // 기존에 선택된 날짜 포커싱되는거 삭제
                    $("table tr .k-state-selected").removeClass("k-state-selected k-state-focused");

                };

            }
        }).getKendoDatePicker();

        cycleDatepicker.dateView.options.change = function(e){

            // 선택한 셀 표시
            this._cell.addClass("calendarChek");

            var selectDate = this.value();
            var insertDt = false;

            $.each(custExtrCycleDt, function(index, obj) {
                // 선택된 날짜와 데이터소스와 비교해서 동일한 날짜가 있으면 지워준다.
                if ( kendo.toString(selectDate,"<dms:configValue code='dateFormat' />") === kendo.toString(obj,"<dms:configValue code='dateFormat' />") ){
                    insertDt = true;
                    custExtrCycleDt.splice(index,1);
                }

            });

            // 선택된 날짜 List에 추가
            if(!insertDt){
                custExtrCycleDt.push(selectDate);
            }else{
                // 클릭시 전체 영역 표시되는 빨간 박스 삭제
                this._cell.removeClass("calendarChek k-state-selected k-state-focused");
                // 데이터소스에서 추가된 클래스가 삭제가 안되서 <div class="calSelected"></div>14 영역을 날리고 날짜를 다시 쓴다
                var cellTxt = this._cell.children().text();
                this._cell.children().html("");
                this._cell.children().html(cellTxt);
            }

            // 최종 선택된 날짜를 텍스트 박스에 뿌려준다.
            dtToString(custExtrCycleDt);

        };

/* ###################################################### 추출주기설정 2/5 script 추가 종료 */


/*************************************************************
드랍다운 리스트 셋팅
*************************************************************/

    //달력목록
    var calendarList = [{"calendarId":"", "calendarNm":""}];
    <c:forEach var="obj" items="${calendarList}">
    calendarList.push({"calendarId":"${obj.calendarId}", "calendarNm":"${obj.calendarNm}"});
    </c:forEach>

    //캘린더
    $("#calendarId").kendoExtDropDownList({
        dataTextField:"calendarNm"
        ,dataValueField:"calendarId"
        ,dataSource:calendarList
        ,optionLabel:""
        ,index:0
    });

    // 시작일
    $("#sStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 종료일
    $("#sEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 시작일(입력부)
    $("#startDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        , change:function(e){
            f_betweenDate(e.sender._oldText, $("#endDt").val());
        }
    });

    // 종료일(입력부)
    $("#endDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        , change:function(e){
            f_betweenDate($("#startDt").val(), e.sender._oldText);
        }
    });

    // 생산시작일자-정비용(입력부)
    $("#creStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 생산종료일자-정비용(입력부)
    $("#creEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 판매시작일자-정비용(입력부)
    $("#saleStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 판매종료일자-정비용(입력부)
    $("#saleEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 주최.   hostList
    $("#sHostCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
//        , optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
        ,dataSource:hostList
        , select:onSelectHostCdSearch
    });

    // 주최부문.   hostTeamList
    $("#sHostTeamCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "  // 전체
//        , dataSource:hostTeamList
    });

    $("#sHostTeamCd").data("kendoExtDropDownList").enable(false);

    // 유형.   makTpList
    $("#sMakTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
//        , optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
        , dataSource:makTpList
        , select:onSelectMakTpCdSearch
    });

    // 유형상세.   makSubTpList
    $("#sMakSubTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "  // 선택
    });

    $("#sMakSubTpCd").data("kendoExtDropDownList").enable(false);

    // 상태.   statList
    $("#sStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
//        , optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
        , dataSource:statList
    });

    // 주최(입력부).   hostList
    $("#hostCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
//        , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:hostList
        , select:onSelectHostCd
    });

    // 주최부문(입력부).   hostTeamList
    $("#hostTeamCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "  // 선택
//        , dataSource:hostTeamList
    });

    $("#hostTeamCd").data("kendoExtDropDownList").enable(false);

    // 유형(입력부).   makTpList
    $("#makTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
//        , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:makTpList
        , select:onSelectMakTpCd
    });

    // 유형상세(입력부).   makSubTpList
    $("#makSubTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "  // 선택
    });

    $("#makSubTpCd").data("kendoExtDropDownList").enable(false);
/*
    // 대상자 자동추출여부(입력부).
    $("#rcpeAutoYn").kendoExtDropDownList({
        dataSource:['Y','N']
        ,autoBind:false
        ,index:0
    });
*/
    // 상태(입력부).   statList
    $("#statCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
//        , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:statList
    });

    $("#statCd").data("kendoExtDropDownList").value("01");
    $("#statCd").data("kendoExtDropDownList").readonly(true);
    $("#statCd").parent().addClass("readonly_area");

    // 예산
    $("#budgetAmt").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 목표인수
    $("#targCustCnt").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 종료여부-정비용(입력부).
    $("#crEndTp").kendoExtDropDownList({
        dataSource:['Y','N']
        ,autoBind:false
        ,index:0
    });





    // 고객추출자동여부(입력부).
    $("#custExtrAutoYn").kendoExtDropDownList({
        dataSource:['Y','N']
        ,autoBind:false
        ,index:0
        , select:function(e){
            var dataItem = this.dataItem(e.item);
            if(dataItem == "Y"){
                cycleCheckDisFalse();
            }else{
                cycleCheckDisTrue();
            }
        }
    });

    //고객추출조건(입력부).   targExtractList
    custExtrTermNoDDL();

    // 중복여부(입력부).
    $("#dupYn").kendoExtDropDownList({
        dataSource:['Y','N']
        ,autoBind:false
        ,index:0
    });




    // 탭 선택시 이벤트
    $("#tabstrip").kendoExtTabStrip({
        animation:false
        , select:function(e) {
            var selectTabId = e.item.id;
            var grid = $('#mcdGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            if(selectedItem != null){

                mode = "U";

                if(selectedItem.statCd != "03" && selectedItem.statCd != "05"){
                    $("#btnSaveVehic").data("kendoButton").enable(true);
                    $("#btnCancelVehic").data("kendoButton").enable(true);
                    $("#btnActiveSave").data("kendoButton").enable(true);
                    $("#fileSelect").show;
                    $("#fileDelete").show;
                    $("#btnGoalSave").data("kendoButton").enable(true);
                    $("#btnGoalAdd").data("kendoButton").enable(true);
                    $("#btnGoalDel").data("kendoButton").enable(true);
                    $("#btnRcpeExtr").data("kendoButton").enable(true);
                    $("#btnTargetSave").data("kendoButton").enable(true);
                    $("#btnTargetAdd").data("kendoButton").enable(true);
                    $("#btnTargetDelete").data("kendoButton").enable(true);
                    $("#btnExcelImport").data("kendoButton").enable(true);
                    $("#btnBudgetSave").data("kendoButton").enable(true);
                    $("#btnBudgetAdd").data("kendoButton").enable(true);
                    $("#btnBudgetDel").data("kendoButton").enable(true);
                    $("#btnTargetOff").data("kendoButton").enable(true);
                    $("#btnTargetOn").data("kendoButton").enable(true);
                    $("#btnDlrSave").data("kendoButton").enable(true);
                } else {
                    $("#btnSaveVehic").data("kendoButton").enable(false);
                    $("#btnCancelVehic").data("kendoButton").enable(false);
                    $("#btnActiveSave").data("kendoButton").enable(false);
                    $("#fileSelect").hide();
                    $("#fileDelete").hide();
                    $("#btnGoalSave").data("kendoButton").enable(false);
                    $("#btnGoalAdd").data("kendoButton").enable(false);
                    $("#btnGoalDel").data("kendoButton").enable(false);
                    $("#btnRcpeExtr").data("kendoButton").enable(false);
                    $("#btnTargetSave").data("kendoButton").enable(false);
                    $("#btnTargetAdd").data("kendoButton").enable(false);
                    $("#btnTargetDelete").data("kendoButton").enable(false);
                    $("#btnExcelImport").data("kendoButton").enable(false);
                    $("#btnBudgetSave").data("kendoButton").enable(false);
                    $("#btnBudgetAdd").data("kendoButton").enable(false);
                    $("#btnBudgetDel").data("kendoButton").enable(false);
                    $("#btnTargetOff").data("kendoButton").enable(false);
                    $("#btnTargetOn").data("kendoButton").enable(false);
                    $("#btnDlrSave").data("kendoButton").enable(false);
                }

                // 상태
                $("#statCd").data("kendoExtDropDownList").value(selectedItem.statCd);
                $("#statCd").data("kendoExtDropDownList").readonly(true);
                $("#statCd").parent().addClass("readonly_area");

                if (selectTabId == "defaultInfoTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);
                    // 캠페인명
                    $("#makNm").val(selectedItem.makNm);
                    // 주최
                    $("#hostCd").data("kendoExtDropDownList").value(selectedItem.hostCd);
                    $("#hostTeamCd").data("kendoExtDropDownList").enable(true);
                    onSelectHostCdSet(selectedItem.hostCd);

                    // 주최부문
                    $("#hostTeamCd").data("kendoExtDropDownList").value(selectedItem.hostTeamCd);
                    // 유형
                    $("#makTpCd").data("kendoExtDropDownList").value(selectedItem.makTpCd);
                    $("#makSubTpCd").data("kendoExtDropDownList").enable(true);
                    onSelectMakTpCdSet(selectedItem.makTpCd);

                    // 서브유형
                    $("#makSubTpCd").data("kendoExtDropDownList").value(selectedItem.makSubTpCd);
                    // 비고
                    $("#makCont").val(selectedItem.makCont);
                    // 시작일
                    //$("#startDt").val(kendo.toString(kendo.parseDate(selectedItem.startDt), "<dms:configValue code='dateFormat' />"));
                    //var startDt = selectedItem.startDt == null || selectedItem.startDt == "" ? "":selectedItem.startDt.substring(0,4) + "-" + selectedItem.startDt.substring(4,6) + "-" + selectedItem.startDt.substring(6,8);
                    $("#startDt").data("kendoExtMaskedDatePicker").value(selectedItem.startDt);
                    // 종료일
                    //$("#endDt").val(kendo.toString(kendo.parseDate(selectedItem.endDt), "<dms:configValue code='dateFormat' />"));
                    //var endDt = selectedItem.endDt == null || selectedItem.endDt == "" ? "":selectedItem.endDt.substring(0,4) + "-" + selectedItem.endDt.substring(4,6) + "-" + selectedItem.endDt.substring(6,8);
                    $("#endDt").data("kendoExtMaskedDatePicker").value(selectedItem.endDt);
                    // 기간
                    $("#prid").val(selectedItem.prid);
                    // 장소명
                    $("#placeNm").val(selectedItem.placeNm);
                    // 대상자 자동추출 여부
//                    $("#rcpeAutoYn").data("kendoExtDropDownList").value(selectedItem.rcpeAutoYn);
                    $("#rcpeAutoYn").val(selectedItem.rcpeAutoYn);
                    // 대행업체명
                    $("#aapCmpNm").val(selectedItem.aapCmpNm);
                    // 예산
                    $("#budgetAmt").data("kendoExtNumericTextBox").value(selectedItem.budgetAmt);

                    // 목표인수
                    $("#targCustCnt").data("kendoExtNumericTextBox").value(selectedItem.targCustCnt);
                    // 진도율
//                    $("#pgssRate").val(selectedItem.pgssRate);
                    // 등록일
                    $("#regDt").val(selectedItem.regDt);
                    // 수정일
                    $("#updtDt").val(selectedItem.updtDt);
                    // 등록자
                    $("#regUsrId").val(selectedItem.regUsrId);

                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 생산시작일자(정비용)
                    $("#creStartDt").data("kendoExtMaskedDatePicker").value(selectedItem.creStartDt);
                    // 생산종료일자(정비용)
                    $("#creEndDt").data("kendoExtMaskedDatePicker").value(selectedItem.creEndDt);
                    // 판매시작일자(정비용)
                    $("#saleStartDt").data("kendoExtMaskedDatePicker").value(selectedItem.saleStartDt);
                    // 판매종료일자(정비용)
                    $("#saleEndDt").data("kendoExtMaskedDatePicker").value(selectedItem.saleEndDt);
                    // 종료여부(정비용)
                    $("#crEndTp").data("kendoExtDropDownList").value(selectedItem.crEndTp);
                    // 캠페인리콜시행처명(정비용)
                    $("#crIsaNm").val(selectedItem.crIsaNm);
                    // 승상용구분코드(정비용)
                    $("#pcDstinCd").val(selectedItem.pcDstinCd);

                    $("#makNm").focus();

                } else if (selectTabId == "planTab"){

                    // 딜러코드(HIDDEN)
                    $("#hDlrCd").val(selectedItem.dlrCd);
                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드(HIDDEN)
                    $("#hPltCd").val(selectedItem.pltCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인코드(HIDDEN)
                    $("#hMakCd").val(selectedItem.makCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인코드
                    $("#makCd").val(selectedItem.makCd);
                    // 활동명칭
                    $("#activeNm").val(selectedItem.activeNm);
                    // 요약설명
                    $("#activeCont").val(selectedItem.activeCont);
                    //화술방안
                    $("#talkPlan").val(selectedItem.talkPlan);
                    //파일키
                    $("#activeFileDocNo").val(selectedItem.activeFileDocNo);
                    //파일 그리드 조회
                    $("#fileGrid").data("kendoExtGrid").dataSource.read();

                    // 활동명칭 포커스
                    $("#activeNm").focus();

                } else if (selectTabId == "goalTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);

                    // 목표 그리드 조회
                    var grid = $("#goalGrid").data("kendoExtGrid");
                    grid.dataSource.page(1);

                } else if (selectTabId == "targetTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    $("#tDlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);
                    $("#tMakCd").val(selectedItem.makCd);

                    $("#extrDgreCnt").val("");
                    $("#realTargetCnt").val("");

                    //고객추출조건(입력부).   targExtractList
                    custExtrTermNoDDL();

                    if($("#custExtrAutoYn").data("kendoExtDropDownList").value() == "Y"){
                        cycleCheckDisFalse();
                    }else{
                        cycleCheckDisTrue();
                    }

                    // 대상자 그리드 조회
                    var grid = $("#targetGrid").data("kendoExtGrid");
                    grid.dataSource.page(1);

                } else if (selectTabId == "budgetTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);

                    // 예산 그리드 조회
                    var grid = $("#budgetGrid").data("kendoExtGrid");
                    grid.dataSource.page(1);

                } else if (selectTabId == "progressTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);
                    // 결재문서번호
                    $("#apprDocNo").val(selectedItem.apprDocNo);
                    // 결재양식ID
                    $("#signDocId").val(selectedItem.signDocId);

                    // 활동심사 그리드 조회
                    var grid = $("#signLineGrid").data("kendoExtGrid");

                    if( $("#apprDocNo").val() != null && $("#apprDocNo").val() != "" ) {
                        grid.dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectSignLineExs.do' />";
                    }else{
                        grid.dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectDocLineExs.do' />";
                    }

                    grid.dataSource.page(1);

                    $("#signCont").val("");

                } else if (selectTabId == "resultTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);

                    // 결과-목표 그리드 조회
                    var gridGoal = $("#resultGoalGrid").data("kendoExtGrid");
                    gridGoal.dataSource.page(1);

                    // 결과-직원설문 그리드 조회
//                    var gridPerson = $("#resultPersonGrid").data("kendoExtGrid");
//                    gridPerson.dataSource.page(1);

                    // 결과-업체평가 그리드 조회
                    var gridCorp = $("#resultCorpGrid").data("kendoExtGrid");
                    gridCorp.dataSource.page(1);

                    // 결과-담당자 의견 조회
                    $.ajax({
                        url:"<c:url value='/crm/mcm/campaignResult/selectPrsnContByKey.do' />"
                        ,data:JSON.stringify({"sDlrCd":selectedItem.dlrCd, "sMakCd":selectedItem.makCd})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error) {
//                          dms.notification.error(jqXHR.responseJSON.errors);
                            $("#prsnOpnCont").val("");
                        }
                        ,success:function(jqXHR, textStatus) {
                            $("#prsnOpnCont").val(jqXHR.prsnOpnCont);
                        }
                    });

                } else if (selectTabId == "workTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);

                    // 작업정보(정비용) 그리드 조회
                    var grid = $("#workGrid").data("kendoExtGrid");
                    grid.dataSource.page(1);

                } else if (selectTabId == "vinTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);

                    //VIN정보(정비용) 그리드 조회
                    var grid = $("#vinGrid").data("kendoExtGrid");
                    grid.dataSource.page(1);

                } else if (selectTabId == "laborTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);

                    // 공임정보(정비용) 그리드 조회
                    var grid = $("#laborGrid").data("kendoExtGrid");
                    grid.dataSource.page(1);

                } else if (selectTabId == "itemsTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);

                    // 부품정보(정비용) 그리드 조회
                    var grid = $("#itemsGrid").data("kendoExtGrid");
                    grid.dataSource.page(1);

                } else if (selectTabId == "dlrTab") {

                    // 딜러코드
                    $("#dlrCd").val(selectedItem.dlrCd);
                    // 사업장코드
                    $("#pltCd").val(selectedItem.pltCd);
                    // 캠페인번호(정비용)
                    $("#crNo").val(selectedItem.makCd);
                    // 캠페인번호
                    $("#makCd").val(selectedItem.makCd);

                    // 대상 딜러 그리드 조회
                    var grid = $("#dlrGrid").data("kendoExtGrid");
                    grid.dataSource.page(1);

                }

            } else {
                mode = "N";
            }
        }
    });

/*************************************************************
이벤트 정의
*************************************************************/

    // 조회버튼
    $("#btnSearch").kendoButton({
        click:function(e) {

            var grid = $("#mcdGrid").data("kendoExtGrid");
            grid.dataSource.page(1);

            mode = "N";
            resetDefualtForm();

        }
    });


    // 상세정보
    $("#btnViewDetail").kendoButton({
        click:function(e){

            var grid = $("#mcdGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            if ( dms.string.isNotEmpty(selectedItem) ){

                var win = $("#window").data("kendoWindow");
                win.center();
                win.open();

                viewDetail(selectedItem);

            } else {

                // 선택해주세요.
                dms.notification.success("<spring:message code='crm.info.chkSelectItemMsg' />");
                return;
            }

        }
        , enable:true
    });



    // 기본정보 탭
    // 추가 - mcdGrid
     $("#btnAddVehic").kendoButton({
         click:function(e) {
             $("#tabstrip").data("kendoExtTabStrip").select(0);

             $("#mcdGrid").data("kendoExtGrid").dataSource.read();

             mode = "N";
             resetDefualtForm();

             $("#btnSaveVehic").data("kendoButton").enable(true);
             $("#btnCancelVehic").data("kendoButton").enable(false);
             $("#btnActiveSave").data("kendoButton").enable(true);
             $("#fileSelect").show;
             $("#fileDelete").show;
             $("#btnGoalSave").data("kendoButton").enable(true);
             $("#btnGoalAdd").data("kendoButton").enable(true);
             $("#btnGoalDel").data("kendoButton").enable(true);
             $("#btnRcpeExtr").data("kendoButton").enable(true);
             $("#btnTargetSave").data("kendoButton").enable(true);
             $("#btnTargetAdd").data("kendoButton").enable(true);
             $("#btnTargetDelete").data("kendoButton").enable(true);
             $("#btnExcelImport").data("kendoButton").enable(true);
             $("#btnBudgetSave").data("kendoButton").enable(true);
             $("#btnBudgetAdd").data("kendoButton").enable(true);
             $("#btnBudgetDel").data("kendoButton").enable(true);
             $("#btnTargetOff").data("kendoButton").enable(true);
             $("#btnTargetOn").data("kendoButton").enable(true);
             $("#btnDlrSave").data("kendoButton").enable(true);


             var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
             tabStrip.disable(tabStrip.tabGroup.children().eq(1));
             tabStrip.disable(tabStrip.tabGroup.children().eq(2));
             tabStrip.disable(tabStrip.tabGroup.children().eq(3));
             tabStrip.disable(tabStrip.tabGroup.children().eq(4));
             tabStrip.disable(tabStrip.tabGroup.children().eq(5));
             tabStrip.disable(tabStrip.tabGroup.children().eq(6));
             tabStrip.disable(tabStrip.tabGroup.children().eq(7));
             tabStrip.disable(tabStrip.tabGroup.children().eq(8));
             tabStrip.disable(tabStrip.tabGroup.children().eq(9));
             tabStrip.disable(tabStrip.tabGroup.children().eq(10));
             tabStrip.disable(tabStrip.tabGroup.children().eq(11));


             var win = $("#window").data("kendoWindow");
             win.center();
             win.open();

         }
         , enable:true
     });

     //버튼 - 저장 - mcdGrid
     $("#btnSaveVehic").kendoButton({
        click:function(e){

            // 화면 필수 체크
            if ( dms.string.isEmpty($("#hostCd").val())){
                dms.notification.warning("<spring:message code='global.lbl.hostCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#hostCd").focus();
                return false;
            }

            //주최코드가 [02 딜러]일 경우 저장하지 못하도록 한다.
            if ($("#hostCd").val() == "02"){
                dms.notification.warning("<spring:message code='crm.info.noDealerCorpSave'/>");
                $("#hostCd").focus();
                return false;
            }

            //유형코드가 [03 정비]일 경우 저장하지 못하도록 한다.
            if ($("#makTpCd").val() == "03"){
                dms.notification.warning("<spring:message code='crm.info.noLbrSave'/>");
                $("#makTpCd").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#hostTeamCd").val())){
                dms.notification.warning("<spring:message code='global.lbl.hostTeamCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#hostTeamCd").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#makTpCd").val())){
                dms.notification.warning("<spring:message code='global.lbl.type' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#makTpCd").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#makSubTpCd").val())){
                dms.notification.warning("<spring:message code='global.lbl.type' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#makSubTpCd").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#makNm").val())){
                dms.notification.warning("<spring:message code='global.lbl.crNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#makNm").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#startDt").val())){
                dms.notification.warning("<spring:message code='global.lbl.startDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#startDt").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#endDt").val())){
                dms.notification.warning("<spring:message code='global.lbl.EndDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#endDt").focus();
                return false;
            }

            if (Number($("#startDt").val().replace(/-/g, '')) > Number($("#endDt").val().replace(/-/g, ''))){
                dms.notification.warning("<spring:message code='cmm.info.endDateGreat'/>");
                $("#startDt").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#statCd").val())){
                dms.notification.warning("<spring:message code='global.lbl.statNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#statCd").focus();
                return false;
            }

            if(!dms.string.isEmpty($("#creStartDt").data("kendoExtMaskedDatePicker").value()) || !dms.string.isEmpty($("#creEndDt").data("kendoExtMaskedDatePicker").value())){
                if ( dms.string.isEmpty($("#creStartDt").data("kendoExtMaskedDatePicker").value())){
                    dms.notification.warning("<spring:message code='ser.lbl.creStartDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#creStartDt").focus();
                    return false;
                }

                if ( dms.string.isEmpty($("#creEndDt").data("kendoExtMaskedDatePicker").value())){
                    dms.notification.warning("<spring:message code='ser.lbl.creEndDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#creEndDt").focus();
                    return false;
                }

                if (Number($("#creStartDt").val().replace(/-/g, '')) > Number($("#creEndDt").val().replace(/-/g, ''))){
                    dms.notification.warning("<spring:message code='cmm.info.endDateGreat'/>");
                    $("#creStartDt").focus();
                    return false;
                }
            }

            if(!dms.string.isEmpty($("#saleStartDt").data("kendoExtMaskedDatePicker").value()) || !dms.string.isEmpty($("#saleEndDt").data("kendoExtMaskedDatePicker").value())){
                if ( dms.string.isEmpty($("#saleStartDt").data("kendoExtMaskedDatePicker").value())){
                    dms.notification.warning("<spring:message code='ser.lbl.saleStartDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#saleStartDt").focus();
                    return false;
                }

                if ( dms.string.isEmpty($("#saleEndDt").data("kendoExtMaskedDatePicker").value())){
                    dms.notification.warning("<spring:message code='ser.lbl.saleEndDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#saleEndDt").focus();
                    return false;
                }

                if (Number($("#saleStartDt").val().replace(/-/g, '')) > Number($("#saleEndDt").val().replace(/-/g, ''))){
                    dms.notification.warning("<spring:message code='cmm.info.endDateGreat'/>");
                    $("#saleStartDt").focus();
                    return false;
                }
            }

            $("#makCd").prop("disabled", false);
            $("#prid").prop("disabled", false);

            var json = $("#defaultInfoForm").serializeObject();

            //기간 셋팅
//            json.prid = f_betweenDate(json.startDt, json.endDt);

            json.startDt     = $("#startDt").data("kendoExtMaskedDatePicker").value();
            json.endDt       = $("#endDt").data("kendoExtMaskedDatePicker").value();
            json.creStartDt  = $("#creStartDt").data("kendoExtMaskedDatePicker").value();
            json.creEndDt    = $("#creEndDt").data("kendoExtMaskedDatePicker").value();
            json.saleStartDt = $("#saleStartDt").data("kendoExtMaskedDatePicker").value();
            json.saleEndDt   = $("#saleEndDt").data("kendoExtMaskedDatePicker").value();

//            json.budgetAmt = $("#budgetAmt").data("kendoExtNumericTextBox").value();

            console.log("defaultInfoForm"+JSON.stringify(json));

            var url = "";

            if(mode == "N"){
                url = "<c:url value='/crm/mcm/marketingCampaign/insertMarketingCampaigns.do' />";
            }else{
                url = "<c:url value='/crm/mcm/marketingCampaign/updateMarketingCampaigns.do' />";
            }
            $.ajax({
                url:url
                ,dataType:"json"
                ,type:"POST"
                ,contentType:"application/json"
                ,data:JSON.stringify(json)
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(data) {

                    $("#makCd").val(data);
                    $("#crNo").val(data);
                    resultKey = data;
                    isGridReload = true;

                    dms.notification.success("<spring:message code='global.info.success'/>");
                    $("#mcdGrid").data("kendoExtGrid").dataSource.read();

                    if($("#makCd").val() == ""){
                        mode = "N";

                        var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
                        tabStrip.disable(tabStrip.tabGroup.children().eq(1));
                        tabStrip.disable(tabStrip.tabGroup.children().eq(2));
                        tabStrip.disable(tabStrip.tabGroup.children().eq(3));
                        tabStrip.disable(tabStrip.tabGroup.children().eq(4));
                        tabStrip.disable(tabStrip.tabGroup.children().eq(5));
                        tabStrip.disable(tabStrip.tabGroup.children().eq(6));
                        tabStrip.disable(tabStrip.tabGroup.children().eq(7));
                        tabStrip.disable(tabStrip.tabGroup.children().eq(8));
                        tabStrip.disable(tabStrip.tabGroup.children().eq(9));
                        tabStrip.disable(tabStrip.tabGroup.children().eq(10));
                        tabStrip.disable(tabStrip.tabGroup.children().eq(11));

                    }else{
                        mode = "U";

                        var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
                        tabStrip.enable(tabStrip.tabGroup.children().eq(1));
                        tabStrip.enable(tabStrip.tabGroup.children().eq(2));
                        tabStrip.enable(tabStrip.tabGroup.children().eq(3));
                        tabStrip.enable(tabStrip.tabGroup.children().eq(4));
                        tabStrip.enable(tabStrip.tabGroup.children().eq(5));
                        tabStrip.enable(tabStrip.tabGroup.children().eq(6));
                        tabStrip.enable(tabStrip.tabGroup.children().eq(7));
                        tabStrip.enable(tabStrip.tabGroup.children().eq(8));
                        tabStrip.enable(tabStrip.tabGroup.children().eq(9));
                        tabStrip.enable(tabStrip.tabGroup.children().eq(10));
                        tabStrip.enable(tabStrip.tabGroup.children().eq(11));

                    }
//                    resetDefualtForm();
                }
                ,beforeSend:function(xhr){
                    dms.loading.show($("#window"));
                }
                ,complete:function(xhr,status){
                    dms.loading.hide($("#window"));
                }
            });

            $("#makCd").prop("disabled", true);
            $("#prid").prop("disabled", true);
        }
        , enable:true
     });

    //버튼 - 복사 - mcdGrid
     $("#btnCopyVehic").kendoButton({
        click:function(e){

            var grid = $('#mcdGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            if(selectedItem != null){

                //주최코드가 [02 딜러]일 경우 복사를 못하도록 한다.
                if(selectedItem.hostCd == "02"){

                    //주최가 딜러인 캠페인은 복사할 수 없습니다.
                    dms.notification.info("<spring:message code='crm.info.noDealerCorpCopy'/>");

                //유형코드가 [03 정비]일 경우 복사를 못하도록 한다.
                } else if(selectedItem.makTpCd == "03"){

                    //유형이 정비인 캠페인은 복사할 수 없습니다.
                    dms.notification.info("<spring:message code='crm.info.noLbrCopy'/>");

                } else {

                    $("#tabstrip").data("kendoExtTabStrip").select(0);

                    $("#mcdGrid").data("kendoExtGrid").dataSource.read();

                    mode = "N";

                    $("#btnSaveVehic").data("kendoButton").enable(true);
                    $("#btnCancelVehic").data("kendoButton").enable(false);
                    $("#btnActiveSave").data("kendoButton").enable(true);
                    $("#fileSelect").show;
                    $("#fileDelete").show;
                    $("#btnGoalSave").data("kendoButton").enable(true);
                    $("#btnGoalAdd").data("kendoButton").enable(true);
                    $("#btnGoalDel").data("kendoButton").enable(true);
                    $("#btnRcpeExtr").data("kendoButton").enable(true);
                    $("#btnTargetSave").data("kendoButton").enable(true);
                    $("#btnTargetAdd").data("kendoButton").enable(true);
                    $("#btnTargetDelete").data("kendoButton").enable(true);
                    $("#btnExcelImport").data("kendoButton").enable(true);
                    $("#btnBudgetSave").data("kendoButton").enable(true);
                    $("#btnBudgetAdd").data("kendoButton").enable(true);
                    $("#btnBudgetDel").data("kendoButton").enable(true);
                    $("#btnTargetOff").data("kendoButton").enable(true);
                    $("#btnTargetOn").data("kendoButton").enable(true);
                    $("#btnDlrSave").data("kendoButton").enable(true);


                    var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
                    tabStrip.disable(tabStrip.tabGroup.children().eq(1));
                    tabStrip.disable(tabStrip.tabGroup.children().eq(2));
                    tabStrip.disable(tabStrip.tabGroup.children().eq(3));
                    tabStrip.disable(tabStrip.tabGroup.children().eq(4));
                    tabStrip.disable(tabStrip.tabGroup.children().eq(5));
                    tabStrip.disable(tabStrip.tabGroup.children().eq(6));
                    tabStrip.disable(tabStrip.tabGroup.children().eq(7));
                    tabStrip.disable(tabStrip.tabGroup.children().eq(8));
                    tabStrip.disable(tabStrip.tabGroup.children().eq(9));
                    tabStrip.disable(tabStrip.tabGroup.children().eq(10));
                    tabStrip.disable(tabStrip.tabGroup.children().eq(11));


                    // 딜러코드
                    $("#dlrCd").val("");
                    // 사업장코드
                    $("#pltCd").val("");
                    // 캠페인번호
                    $("#makCd").val("");

                    var makNm = selectedItem.makNm + "-<spring:message code='global.btn.copy'/>";

                    // 캠페인명
                    $("#makNm").val(makNm);
                    // 주최
                    $("#hostCd").data("kendoExtDropDownList").value(selectedItem.hostCd);
                    $("#hostTeamCd").data("kendoExtDropDownList").enable(true);
                    onSelectHostCdSet(selectedItem.hostCd);

                    // 주최부문
                    $("#hostTeamCd").data("kendoExtDropDownList").value(selectedItem.hostTeamCd);
                    // 유형
                    $("#makTpCd").data("kendoExtDropDownList").value(selectedItem.makTpCd);
                    $("#makSubTpCd").data("kendoExtDropDownList").enable(true);
                    onSelectMakTpCdSet(selectedItem.makTpCd);

                    // 서브유형
                    $("#makSubTpCd").data("kendoExtDropDownList").value(selectedItem.makSubTpCd);
                    // 비고
                    $("#makCont").val(selectedItem.makCont);
                    // 시작일
                    //$("#startDt").val(kendo.toString(kendo.parseDate(selectedItem.startDt), "<dms:configValue code='dateFormat' />"));
                    //var startDt = selectedItem.startDt == null || selectedItem.startDt == "" ? "":selectedItem.startDt.substring(0,4) + "-" + selectedItem.startDt.substring(4,6) + "-" + selectedItem.startDt.substring(6,8);
                    $("#startDt").data("kendoExtMaskedDatePicker").value("");
                    // 종료일
                    //$("#endDt").val(kendo.toString(kendo.parseDate(selectedItem.endDt), "<dms:configValue code='dateFormat' />"));
                    //var endDt = selectedItem.endDt == null || selectedItem.endDt == "" ? "":selectedItem.endDt.substring(0,4) + "-" + selectedItem.endDt.substring(4,6) + "-" + selectedItem.endDt.substring(6,8);
                    $("#endDt").data("kendoExtMaskedDatePicker").value("");
                    // 기간
                    $("#prid").val(0);
                    // 장소명
                    $("#placeNm").val(selectedItem.placeNm);
                    // 대상자 자동추출 여부
//                    $("#rcpeAutoYn").data("kendoExtDropDownList").value(selectedItem.rcpeAutoYn);
                    $("#rcpeAutoYn").val(selectedItem.rcpeAutoYn);
                    // 대행업체명
                    $("#aapCmpNm").val(selectedItem.aapCmpNm);
                    // 예산
                    $("#budgetAmt").data("kendoExtNumericTextBox").value(selectedItem.budgetAmt);

                    // 상태
                    $("#statCd").data("kendoExtDropDownList").value("01");
                    $("#statCd").data("kendoExtDropDownList").readonly(true);
                    $("#statCd").parent().addClass("readonly_area");

                    // 목표인수
                    $("#targCustCnt").data("kendoExtNumericTextBox").value(selectedItem.targCustCnt);
                    // 진도율
//                    $("#pgssRate").val(selectedItem.pgssRate);
                    // 등록일
                    $("#regDt").val("");
                    // 수정일
                    $("#updtDt").val("");
                    // 등록자
                    $("#regUsrId").val("");

                    // 캠페인번호(정비용)
                    $("#crNo").val("");
                    // 생산시작일자(정비용)
                    $("#creStartDt").data("kendoExtMaskedDatePicker").value("");
                    // 생산종료일자(정비용)
                    $("#creEndDt").data("kendoExtMaskedDatePicker").value("");
                    // 판매시작일자(정비용)
                    $("#saleStartDt").data("kendoExtMaskedDatePicker").value("");
                    // 판매종료일자(정비용)
                    $("#saleEndDt").data("kendoExtMaskedDatePicker").value("");
                    // 종료여부(정비용)
                    $("#crEndTp").data("kendoExtDropDownList").value("N");
                    // 캠페인리콜시행처명(정비용)
                    $("#crIsaNm").val(selectedItem.crIsaNm);
                    // 승상용구분코드(정비용)
                    $("#pcDstinCd").val(selectedItem.pcDstinCd);

                    $("#makNm").focus();


                    var win = $("#window").data("kendoWindow");
                    win.center();
                    win.open();
                }


            }else{
                //캠페인 목록을 먼저 선택해 주십시오.
                dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
            }
        }
        , enable:true
     });

     //버튼 - 캠페인취소
     $("#btnCancelVehic").kendoButton({
         click:function(e){

             var grid = $('#mcdGrid').data('kendoExtGrid');
             var selectedItem = grid.dataItem(grid.select());
             if(selectedItem!=null) {

                 if ( $("#statCd").val() != "01" ){
                     //캠페인취소는 진행상태가 '계획중'일 경우만 취소가 가능합니다.
                     dms.notification.warning("<spring:message code='crm.err.campaignCancelStat'/>");
                     return false;
                 }

                 //주최코드가 [02 딜러]일 경우 저장하지 못하도록 한다.
                 if ($("#hostCd").val() == "02"){
                     dms.notification.warning("<spring:message code='crm.info.noDealerCorpSave'/>");
                     $("#hostCd").focus();
                     return false;
                 }

                 //유형코드가 [03 정비]일 경우 저장하지 못하도록 한다.
                 if ($("#makTpCd").val() == "03"){
                     dms.notification.warning("<spring:message code='crm.info.noLbrSave'/>");
                     $("#makTpCd").focus();
                     return false;
                 }

                 var params = {};
                 params["dlrCd"] = $("#dlrCd").val();
                 params["makCd"] = $("#makCd").val();

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
                                     // 선택한 캠페인을 취소처리 하시겠습니까?
                             , msg:"<spring:message code='crm.info.campaignCancelConfirm'/>"
                             , btnMsg01:"<spring:message code='global.btn.confirm' />"
                             , btnMsg02:"<spring:message code='global.lbl.cancel' />"

                             ,"callbackFunc":function(data){
                                 if (data.msg == "01"){   // 확인

                                     $.ajax({
                                         url:"<c:url value='/crm/mcm/marketingCampaign/updateCampaignCancel.do' />"
                                         ,data:JSON.stringify(params)
                                         ,type:'POST'
                                         ,dataType:'json'
                                         ,contentType:'application/json'
                                         ,error:function(jqXHR, status, error) {
                                             dms.notification.error(jqXHR.responseJSON.errors);
                                         }
                                         ,success:function(jqXHR, textStatus) {

                                             resultKey = $("#makCd").val();
                                             isGridReload = true;

                                             grid.dataSource.read();

                                             //정상적으로 반영 되었습니다.
                                             dms.notification.success("<spring:message code='global.info.success'/>");
                                         }
                                         ,beforeSend:function(xhr){
                                             dms.loading.show($("#window"));
                                         }
                                         ,complete:function(xhr,status){
                                             dms.loading.hide($("#window"));
                                         }
                                     });

                                 }else{
                                     return false;
                                 }
                             }
                         }
                     }
                 });
/*
                 // 선택한 캠페인을 취소처리 하시겠습니까?
                 if (confirm("<spring:message code='crm.info.campaignCancelConfirm'/>")) {
                     $.ajax({
                         url:"<c:url value='/crm/mcm/marketingCampaign/updateCampaignCancel.do' />"
                         ,data:JSON.stringify(params)
                         ,type:'POST'
                         ,dataType:'json'
                         ,contentType:'application/json'
                         ,error:function(jqXHR, status, error) {
                             dms.notification.error(jqXHR.responseJSON.errors);
                         }
                         ,success:function(jqXHR, textStatus) {

                             resultKey = $("#makCd").val();
                             isGridReload = true;

                             grid.dataSource.read();

                             //정상적으로 반영 되었습니다.
                             dms.notification.success("<spring:message code='global.info.success'/>");
                         }
                     });
                 }
*/
             } else {
                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
             }
        }
     });





     // 활동방안 탭
     // 저장 버튼
     $("#btnActiveSave").kendoButton({
         click:function(e){

             var grid = $('#mcdGrid').data('kendoExtGrid');
             var selectedItem = grid.dataItem(grid.select());
             if(selectedItem!=null) {
                 // 화면 필수 체크(활동명칭)
                 if ( dms.string.isEmpty($("#activeNm").val())){
                     dms.notification.warning("<spring:message code='global.lbl.activeNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#activeNm").focus();
                     return false;
                 }

                 // 화면 필수 체크(요약설명)
                 if ( dms.string.isEmpty($("#activeCont").val())){
                     dms.notification.warning("<spring:message code='global.lbl.activeCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#activeCont").focus();
                     return false;
                 }

                 var gridActive = $("#mcdGrid").data("kendoExtGrid");

                 var saveData = gridActive.getCUDData("insertList", "updateList", "deleteList");
                 var formSaveData = $("#planForm").serializeObject();

                 var params =  $.extend(
                     {"marketingCampaignVO":formSaveData}
                     ,{"marketingCampaignSaveVO":saveData}
                 );

                 console.log(JSON.stringify(params));
                 $.ajax({
                      url:"<c:url value='/crm/mcm/marketingCampaign/multiActives.do' />"
                     ,data:JSON.stringify(params)
                     ,type:'POST'
                     ,dataType:'json'
                     ,async:false
                     ,contentType:'application/json'
                     ,error:function(jqXHR,status,error) {
                         dms.notification.error(jqXHR.responseJSON.errors);
                     }
                     ,success:function(jqXHR, textStatus) {
                         //정상적으로 반영 되었습니다.
                         dms.notification.success("<spring:message code='global.info.success'/>");

                         resultKey = $("#makCd").val();
                         isGridReload = true;

                         if($("#makCd").val() == ""){
                             mode = "N";
                         }else{
                             mode = "U";
                         }

                         grid.dataSource.read();
                     }
                     ,beforeSend:function(xhr){
                         dms.loading.show($("#window"));
                     }
                     ,complete:function(xhr,status){
                         dms.loading.hide($("#window"));
                     }
                 });

             } else {
                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
             }
         }
     });


/*
     // 인쇄
     $("#btnPrintVehic").kendoButton({
         click:function(e){

             var grid = $('#mcdGrid').data('kendoExtGrid');

             var selectedItem = grid.dataItem(grid.select());

             console.log("selectedItem ::",selectedItem)
             if(selectedItem != null) {

                 var idccReportParam =  "&sDlrCdParam="+selectedItem.dlrCd+"&sMakCdParam="+selectedItem.makCd;
                 var idccReportUrl = "<c:url value='/ReportServer?reportlet=crm/marketingCampaign/selectMarketingCampaignMainPrint.cpt' />"+idccReportParam;
                 //var idccReportUrl = "<c:url value='/crm/mcm/marketingCampaign/selectMarketingCampaignPrint.do' />";
                 var newWindow=open(idccReportUrl,"",'top=0,left=0,width=925,height=1200,toolbar=1,location=1,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');
             } else {

                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");

             };

         }
     });
*/



        // 목표탭
        //버튼 - 추가
        $("#btnGoalAdd").kendoButton({
            click:function(e) {
                var grid = $('#mcdGrid').data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());
                if(selectedItem!=null) {
                    var dlrCd = selectedItem.dlrCd;
                    var pltCd = selectedItem.pltCd;
                    var makCd = selectedItem.makCd;
                    if(makCd!="") {
                        $('#goalGrid').data('kendoExtGrid').dataSource.insert(0, {
                             "dlrCd":dlrCd
                            ,"pltCd":pltCd
                            ,"makCd":makCd
                        });
                    }
                } else {
                    //캠페인 목록을 먼저 선택해 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
                }
            }
        });

        //버튼 - 삭제
        $("#btnGoalDel").kendoButton({
            click:function(e) {

                var grid = $('#mcdGrid').data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());
                if(selectedItem!=null) {
                    var gridGoal = $("#goalGrid").data("kendoExtGrid");
                    var rows = gridGoal.select();

                    if (rows.length < 1) {
                        //목록을 선택하여 주십시오.
                        dms.notification.info("<spring:message code='global.info.required.select'/>");
                        return;
                    }

                    rows.each(function(index, row) {
                        gridGoal.removeRow(row);
                    });
                } else {
                    //캠페인 목록을 먼저 선택해 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
                }
            }
        });

        //버튼 - 저장
        $("#btnGoalSave").kendoButton({
            click:function(e) {

                var grid = $('#mcdGrid').data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());
                if(selectedItem!=null) {
                    var gridGoal = $("#goalGrid").data("kendoExtGrid");

                    var saveData = gridGoal.getCUDData("insertList", "updateList", "deleteList");
                    if (gridGoal.cudDataLength == 0) {
                        //변경된 정보가 없습니다.
                        dms.notification.info("<spring:message code='global.info.required.change'/>");
                        return;
                    }

                    if (gridGoal.gridValidation()) {

        //                var venderDs = gridBudget.dataSource;
        //                var iRowCnt = venderDs.total();
        //                for(var i = 0 ;i < iRowCnt ;i++){
        //                    venderDs.at(i).imsSuptAmt = Number(venderDs.at(i).budgetAmt) * (Number(venderDs.at(i).corpBudnRate) / 100);
        //                }

                        $.ajax({
                            url:"<c:url value='/crm/mcm/marketingCampaign/multiGoals.do' />",
                            data:JSON.stringify(saveData),
                            type:'POST',
                            dataType:'json',
                            contentType:'application/json',
                            error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            },
                            success:function(jqXHR, textStatus) {

                                gridGoal.dataSource._destroyed = [];
                                gridGoal.dataSource.page(1);

                                //정상적으로 반영 되었습니다.
                                dms.notification.success("<spring:message code='global.info.success'/>");
                            }
                            ,beforeSend:function(xhr){
                                dms.loading.show($("#window"));
                            }
                            ,complete:function(xhr,status){
                                dms.loading.hide($("#window"));
                            }
                        });
                    }else{
                        //입력값을 확인하여 주십시오.
                        dms.notification.warning("<spring:message code='global.info.check.input'/>");
                    }
                } else {
                    //캠페인 목록을 먼저 선택해 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
                }
            }
        });




     // 대상자 리스트 탭
     // 대상자 추가
     $("#btnTargetAdd").kendoButton({
         click:function(e){
             initTargetForm();

             if($("#custExtrAutoYn").data("kendoExtDropDownList").value() == "Y"){
                 cycleCheckDisFalse();
             }else{
                 cycleCheckDisTrue();
             }
         }
     });

    //버튼 - 대상자 저장
     $("#btnTargetSave").kendoButton({
        click:function(e){

            var grid = $('#mcdGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            if(selectedItem!=null) {
                // 화면 필수 체크
                if ( dms.string.isEmpty($("#custExtrAutoYn").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.custExtrAutoYn' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#custExtrAutoYn").focus();
                    return false;
                }

                if ( dms.string.isEmpty($("#custExtrTermNo").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.custExtrTermNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#custExtrTermNo").focus();
                    return false;
                }

                if ( dms.string.isEmpty($("#dupYn").val())){
                    dms.notification.warning("<spring:message code='crm.lbl.dupYn' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    $("#dupYn").focus();
                    return false;
                }


                //추출조건제목 셋팅
                $("#custExtrTitleNm").val($("#custExtrTermNo").data("kendoExtDropDownList").text());

                var json = $("#targetForm").serializeObject();


                // ###################################################### 추출주기설정 3/5 추가 시작

                delete json.cycleDatepicker;
                delete json.cycleDt;

                if($("#custExtrAutoYn").val() == "Y"){

                    json.custExtrCycleDt = custExtrCycleDt;

                    console.log("추출주기-선택날짜 ::",json.custExtrCycleDt);


                    // 요일 1개만 선택일경우..
                    if ( typeof json.custExtrCycleWeek === 'string' ) {
                        var tmpWeek = [];
                        tmpWeek.push(json.custExtrCycleWeek);
                        json.custExtrCycleWeek = tmpWeek;
                    };

                    if ( $("#custExtrCycleTp").val() === "W" && !$("input[name=custExtrCycleWeek]:checkbox").is(":checked") ) {
                            // {주}을(를) 확인하여 주세요.
                            dms.notification.error("<spring:message code='crm.lbl.week' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                            return false;

                    } else if ( $("#custExtrCycleTp").val() === "S" && !custExtrCycleDt.length > 0 ) {
                            // {일}을(를) 확인하여 주세요.
                            dms.notification.error("<spring:message code='crm.lbl.day' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                            return false;

                    };

                }
                // ###################################################### 추출주기설정 3/5 추가 종료


                json.custExtrAutoYn = $("#custExtrAutoYn").data("kendoExtDropDownList").value();
                json.custExtrTermNo = $("#custExtrTermNo").data("kendoExtDropDownList").value();
                json.dupYn          = $("#dupYn").data("kendoExtDropDownList").value();

                console.log("targetForm"+JSON.stringify(json));

                var cnt = 0;
                var gridTarget = $("#targetGrid").data("kendoExtGrid");
                var evalDs = gridTarget.dataSource;
                var iRowCnt = evalDs.total();
                for(var i = 0; i < iRowCnt; i++){
                    if(evalDs.at(i).custExtrTermNo == $("#custExtrTermNo").data("kendoExtDropDownList").value()){
                        cnt = cnt + 1;
                    }
                }

                //동일한 고객추출조건으로 저장하고자 할 경우 confirm문으로 확인후 진행한다.
                if(cnt > 0){

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
                                        // 동일한 고객추출조건으로 저장하고자 할 경우 confirm문으로 확인후 진행한다.
                                , msg:"<spring:message code='crm.info.custExtrAutoYnConfirm'/>"
                                , btnMsg01:"<spring:message code='global.btn.confirm' />"
                                , btnMsg02:"<spring:message code='global.lbl.cancel' />"

                                ,"callbackFunc":function(data){
                                    if (data.msg == "01"){   // 확인

                                        $.ajax({
                                            url:"<c:url value='/crm/mcm/marketingCampaign/multiTargets.do' />"
                                            ,dataType:"json"
                                            ,type:"POST"
                                            ,contentType:"application/json"
                                            ,data:JSON.stringify(json)
                                            ,error:function(jqXHR,status,error) {
                                                dms.notification.error(jqXHR.responseJSON.errors);
                                            }
                                            ,success:function(data) {
                                                $("#extrDgreCnt").val("");
                                                $("#realTargetCnt").val("");

                                                dms.notification.success("<spring:message code='global.info.success'/>");
                                                gridTarget.dataSource.read();

                                            }
                                            ,beforeSend:function(xhr){
                                                dms.loading.show($("#window"));
                                            }
                                            ,complete:function(xhr,status){
                                                dms.loading.hide($("#window"));
                                            }
                                        });

                                    }else{
                                        return false;
                                    }
                                }
                            }
                        }
                    });
/*
                    if (confirm("<spring:message code='crm.info.custExtrAutoYnConfirm'/>")) {
                        $.ajax({
                            url:"<c:url value='/crm/mcm/marketingCampaign/multiTargets.do' />"
                            ,dataType:"json"
                            ,type:"POST"
                            ,contentType:"application/json"
                            ,data:JSON.stringify(json)
                            ,error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            }
                            ,success:function(data) {
                                $("#extrDgreCnt").val(data.extrDgreCnt);

                                dms.notification.success("<spring:message code='global.info.success'/>");
                                gridTarget.dataSource.read();

                            }
                        });
                    }
*/
                }else{
                    $.ajax({
                        url:"<c:url value='/crm/mcm/marketingCampaign/multiTargets.do' />"
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json"
                        ,data:JSON.stringify(json)
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                        ,success:function(data) {
                            $("#extrDgreCnt").val("");
                            $("#realTargetCnt").val("");

                            dms.notification.success("<spring:message code='global.info.success'/>");
                            gridTarget.dataSource.read();

                        }
                        ,beforeSend:function(xhr){
                            dms.loading.show($("#window"));
                        }
                        ,complete:function(xhr,status){
                            dms.loading.hide($("#window"));
                        }
                    });
                }

            } else {
                //캠페인 목록을 먼저 선택해 주십시오.
                dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
            }
        }
        , enable:true
     });

     // 대상자 삭제
     $("#btnTargetDelete").kendoButton({
         click:function(e){

             // TODO 추출 대상자 확인후 추출 대상자가 없으면 삭제.
             var grid = $('#mcdGrid').data('kendoExtGrid');
             var selectedItem = grid.dataItem(grid.select());
             if(selectedItem!=null) {

                 dlrCd = $("#dlrCd").val();
                 makCd = $("#makCd").val();
                 extrDgreCnt = $("#extrDgreCnt").val();
                 realTargetCnt = $("#realTargetCnt").val();

                 if (dms.string.isEmpty(extrDgreCnt)) {
                     //목록을 선택하여 주십시오.
                     dms.notification.warning("<spring:message code='global.info.required.select'/>");
                     return;

                 } else if (realTargetCnt > 0) {

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
                                         // 추출된 대상자가 존재합니다. 삭제하시겠습니까?
                                 , msg:"<spring:message code='crm.info.targOnNotDelConfirm'/>"
                                 , btnMsg01:"<spring:message code='global.btn.confirm' />"
                                 , btnMsg02:"<spring:message code='global.lbl.cancel' />"

                                 ,"callbackFunc":function(data){
                                     if (data.msg == "01"){   // 확인

                                         var param = {
                                                 "dlrCd":dlrCd
                                                 ,"makCd":makCd
                                                 ,"extrDgreCnt":extrDgreCnt
                                                 };

                                         $.ajax({
                                                 url:"<c:url value='/crm/mcm/marketingCampaign/deleteTargetEx.do' />"
                                                 ,data:JSON.stringify(param)      //파라미터
                                                 ,type:'POST'                        //조회요청
                                                 ,dataType:'json'                  //json 응답
                                                 ,contentType:'application/json'   //문자열 파라미터
                                                 ,error:function(jqXHR,status,error){
                                                     dms.notification.error(jqXHR.responseJSON.errors);
                                                 }
                                                 ,success:function(data) {
                                                     dms.notification.success("<spring:message code='global.info.success'/>");
                                                     $("#extrDgreCnt").val("");
                                                     $("#realTargetCnt").val("");

                                                     resultKey = $("#makCd").val();
                                                     isGridReload = true;

                                                     grid.dataSource.read();

                                                     $("#targetGrid").data("kendoExtGrid").dataSource.read();
                                                 }
                                                 ,beforeSend:function(xhr){
                                                     dms.loading.show($("#window"));
                                                 }
                                                 ,complete:function(xhr,status){
                                                     dms.loading.hide($("#window"));
                                                 }
                                         });

                                     }else{
                                         return false;
                                     }
                                 }
                             }
                         }
                     });

                 } else {

                     var param = {
                             "dlrCd":dlrCd
                             ,"makCd":makCd
                             ,"extrDgreCnt":extrDgreCnt
                             };

                     $.ajax({
                             url:"<c:url value='/crm/mcm/marketingCampaign/deleteTarget.do' />"
                             ,data:JSON.stringify(param)      //파라미터
                             ,type:'POST'                        //조회요청
                             ,dataType:'json'                  //json 응답
                             ,contentType:'application/json'   //문자열 파라미터
                             ,error:function(jqXHR,status,error){
                                 dms.notification.error(jqXHR.responseJSON.errors);
                             }
                             ,success:function(data) {
                                 dms.notification.success("<spring:message code='global.info.success'/>");
                                 $("#extrDgreCnt").val("");
                                 $("#realTargetCnt").val("");
                                 $("#targetGrid").data("kendoExtGrid").dataSource.read();
                             }
                             ,beforeSend:function(xhr){
                                 dms.loading.show($("#window"));
                             }
                             ,complete:function(xhr,status){
                                 dms.loading.hide($("#window"));
                             }
                     });
                 }

             } else {
                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
             }

         }

     });

     //버튼 - 엑셀 Import
     $("#btnExcelImport").kendoButton({
         click:function(e) {
             targetUploadPopupWin = dms.window.popup({
                 title:"<spring:message code='crm.btn.excellCustUpload' />"
                 ,width:800
                 ,windowId:"targetUploadPopupWin"
                 ,content:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectTargetUploadPopup.do?dlrCd="+$("#dlrCd").val()+"&makCd="+$("#makCd").val()+"'/>"
                     ,data:{
                         "callbackFunc":function(){
                             $("#extrDgreCnt").val("");
                             $("#realTargetCnt").val("");

                             resultKey = $("#makCd").val();
                             isGridReload = true;

                             $('#mcdGrid').data('kendoExtGrid').dataSource.read();
                             $('#targetGrid').data('kendoExtGrid').dataSource.read();

                             targetUploadPopupWin.close();
                         }
                     }
                 }
             });
         }
     });

     //버튼 - 대상자 추출
     $("#btnRcpeExtr").kendoButton({
         click:function(e){

             var grid = $('#mcdGrid').data('kendoExtGrid');
             var selectedItem = grid.dataItem(grid.select());
             if(selectedItem!=null) {

                 if ( dms.string.isEmpty($("#custExtrAutoYn").val())){
                     dms.notification.warning("<spring:message code='crm.lbl.custExtrAutoYn' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#custExtrAutoYn").focus();
                     return false;
                 }

                 if($("#custExtrAutoYn").val() == "Y"){
                     //대상자를 자동으로 추출하는 경우는 해당하면에서 대상자를 추출할 수 없습니다.
                     dms.notification.warning("<spring:message code='crm.err.custExtrAutoYnExtrNot'/>");
                     return false;
                 }

                 if ( dms.string.isEmpty($("#custExtrTermNo").val())){
                     dms.notification.warning("<spring:message code='crm.lbl.custExtrTermNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#custExtrTermNo").focus();
                     return false;
                 }

                 if ( dms.string.isEmpty($("#dupYn").val())){
                     dms.notification.warning("<spring:message code='crm.lbl.dupYn' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#dupYn").focus();
                     return false;
                 }



                 var params = {};
                 params["dlrCd"] = $("#dlrCd").val();
                 params["makCd"] = $("#makCd").val();
                 params["extrDgreCnt"] = $("#extrDgreCnt").val() == "" || $("#extrDgreCnt").val() == null ? 0:$("#extrDgreCnt").val();
                 params["custExtrAutoYn"] = $("#custExtrAutoYn").data("kendoExtDropDownList").value();
                 params["custExtrTermNo"] = $("#custExtrTermNo").data("kendoExtDropDownList").value();
                 params["custExtrTitleNm"] = $("#custExtrTermNo").data("kendoExtDropDownList").text();
                 params["dupYn"] = $("#dupYn").data("kendoExtDropDownList").value();
                 params["realTargetCnt"] = $("#realTargetCnt").val();

               //신규로 대상자를 추출하는 지 알아보기 위한 변수
                 var extrDgreCnt   = $("#extrDgreCnt").val() == "" || $("#extrDgreCnt").val() == null ? 0 : $("#extrDgreCnt").val();
                 var realTargetCnt = $("#realTargetCnt").val() == "" || $("#realTargetCnt").val() == null ? 0 : $("#realTargetCnt").val();

                 var cnt = 0;
                 var gridTarget = $("#targetGrid").data("kendoExtGrid");
                 var evalDs = gridTarget.dataSource;
                 var iRowCnt = evalDs.total();
                 for(var i = 0; i < iRowCnt; i++){
                     if(evalDs.at(i).custExtrTermNo == $("#custExtrTermNo").data("kendoExtDropDownList").value() && evalDs.at(i).realTargetCnt > 0){
                         cnt = cnt + 1;
                     }
                 }

                 //동일한 고객추출조건으로 대상자를 생성하고자 할 경우 confirm문으로 확인후 진행한다.
                 if(cnt > 0){

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
                                         // 동일한 고객추출조건으로 대상자를 생성하고자 할 경우 confirm문으로 확인후 진행한다.
                                 , msg:"<spring:message code='crm.info.custExtrAutoYnConfirm'/>"
                                 , btnMsg01:"<spring:message code='global.btn.confirm' />"
                                 , btnMsg02:"<spring:message code='global.lbl.cancel' />"

                                 ,"callbackFunc":function(data){
                                     if (data.msg == "01"){   // 확인

                                         $.ajax({
                                             url:"<c:url value='/crm/mcm/marketingCampaign/insertTargetExtractSave.do' />"
                                             ,data:JSON.stringify(params)
                                             ,type:'POST'
                                             ,dataType:'json'
                                             ,contentType:'application/json'
                                             ,error:function(jqXHR, status, error) {
                                                 dms.notification.error(jqXHR.responseJSON.errors);
                                             }
                                             ,success:function(jqXHR, textStatus) {

                                                 resultKey = $("#makCd").val();
                                                 isGridReload = true;

                                                 grid.dataSource.read();

                                                 gridTarget.dataSource.read();

                                                 //정상적으로 반영 되었습니다.
                                                 dms.notification.success("<spring:message code='global.info.success'/>");
                                                 $("#extrDgreCnt").val("");
                                                 $("#realTargetCnt").val("");
                                             }
                                             ,beforeSend:function(xhr){
                                                 dms.loading.show($("#window"));
                                                 dms.notification.info("<spring:message code='crm.info.proceIng'/>");
                                             }
                                             ,complete:function(xhr,status){
                                                 dms.loading.hide($("#window"));
                                             }
                                         });

                                     }else{
                                         return false;
                                     }
                                 }
                             }
                         }
                     });
/*
                     if (confirm("<spring:message code='crm.info.custExtrAutoYnConfirm'/>")) {
                         $.ajax({
                             url:"<c:url value='/crm/mcm/marketingCampaign/insertTargetExtractSave.do' />"
                             ,data:JSON.stringify(params)
                             ,type:'POST'
                             ,dataType:'json'
                             ,contentType:'application/json'
                             ,error:function(jqXHR, status, error) {
                                 dms.notification.error(jqXHR.responseJSON.errors);
                             }
                             ,success:function(jqXHR, textStatus) {

                                 resultKey = $("#makCd").val();
                                 isGridReload = true;

                                 grid.dataSource.read();

                                 gridTarget.dataSource.read();

                                 //정상적으로 반영 되었습니다.
                                 dms.notification.success("<spring:message code='global.info.success'/>");
                             }
                         });
                     }
*/
                 }else{
                     // 신규로 대상자추출까지 수행할 때
                     if(extrDgreCnt <= 0 || realTargetCnt > 0){
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
                                             // 신규로 추출조건과 추출대상자를 한꺼번에 생성하고자 할 경우 confirm문으로 확인후 진행한다.
                                     , msg:"<spring:message code='crm.info.custExtrNewConfirm'/>"
                                     , btnMsg01:"<spring:message code='global.btn.confirm' />"
                                     , btnMsg02:"<spring:message code='global.lbl.cancel' />"

                                     ,"callbackFunc":function(data){
                                         if (data.msg == "01"){   // 확인

                                             $.ajax({
                                                 url:"<c:url value='/crm/mcm/marketingCampaign/insertTargetExtractSave.do' />"
                                                 ,data:JSON.stringify(params)
                                                 ,type:'POST'
                                                 ,dataType:'json'
                                                 ,contentType:'application/json'
                                                 ,error:function(jqXHR, status, error) {
                                                     dms.notification.error(jqXHR.responseJSON.errors);
                                                 }
                                                 ,success:function(jqXHR, textStatus) {

                                                     resultKey = $("#makCd").val();
                                                     isGridReload = true;

                                                     grid.dataSource.read();

                                                     gridTarget.dataSource.read();

                                                     //정상적으로 반영 되었습니다.
                                                     dms.notification.success("<spring:message code='global.info.success'/>");
                                                     $("#extrDgreCnt").val("");
                                                     $("#realTargetCnt").val("");
                                                 }
                                                 ,beforeSend:function(xhr){
                                                     dms.loading.show($("#window"));
                                                     dms.notification.info("<spring:message code='crm.info.proceIng'/>");
                                                 }
                                                 ,complete:function(xhr,status){
                                                     dms.loading.hide($("#window"));
                                                 }
                                             });

                                         }else{
                                             return false;
                                         }
                                     }
                                 }
                             }
                         });
                     }else{
                         $.ajax({
                             url:"<c:url value='/crm/mcm/marketingCampaign/insertTargetExtractSave.do' />"
                             ,data:JSON.stringify(params)
                             ,type:'POST'
                             ,dataType:'json'
                             ,contentType:'application/json'
                             ,error:function(jqXHR, status, error) {
                                 dms.notification.error(jqXHR.responseJSON.errors);
                             }
                             ,success:function(jqXHR, textStatus) {

                                 resultKey = $("#makCd").val();
                                 isGridReload = true;

                                 grid.dataSource.read();

                                 gridTarget.dataSource.read();

                                 //정상적으로 반영 되었습니다.
                                 dms.notification.success("<spring:message code='global.info.success'/>");
                                 $("#extrDgreCnt").val("");
                                 $("#realTargetCnt").val("");
                             }
                             ,beforeSend:function(xhr){
                                 dms.loading.show($("#window"));
                                 dms.notification.info("<spring:message code='crm.info.proceIng'/>");
                             }
                             ,complete:function(xhr,status){
                                 dms.loading.hide($("#window"));
                             }
                         });
                     }
                 }

             } else {
                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
             }
        }
     });

     // 대상자추출 배치
     $("#btnBatch").kendoButton({
         click:function(e){

             var gridTarget = $("#targetGrid").data("kendoExtGrid");

             $.ajax({
                     url:"<c:url value='/bat/crm/mcm/markingCampaignBatchService.do' />"
                     //,data:JSON.stringify(param)      //파라미터
                     ,type:'POST'                        //조회요청
                     ,dataType:'json'                  //json 응답
                     ,contentType:'application/json'   //문자열 파라미터
                     ,error:function(jqXHR,status,error){
                         dms.notification.error(jqXHR.responseJSON.errors);
                     }
                     ,success:function(jqXHR, textStatus) {

                         gridTarget.dataSource.read();

                         //정상적으로 반영 되었습니다.
                         dms.notification.success("<spring:message code='global.info.success'/>");
                         $("#extrDgreCnt").val("");
                         $("#realTargetCnt").val("");
                     }
                     ,beforeSend:function(xhr){
                         dms.loading.show($("#window"));
                         dms.notification.info("<spring:message code='crm.info.proceIng'/>");
                     }
                     ,complete:function(xhr,status){
                         dms.loading.hide($("#window"));
                     }
             });
         }
     });


     // 인터페이스 배치
     $("#btnBatchIf").kendoButton({
         click:function(e){

             var gridTarget = $("#targetGrid").data("kendoExtGrid");

             $.ajax({
                     url:"<c:url value='/bat/crm/mcm/markingCampaignDcsIfBatchService.do' />"
                     //,data:JSON.stringify(param)      //파라미터
                     ,type:'POST'                        //조회요청
                     ,dataType:'json'                  //json 응답
                     ,contentType:'application/json'   //문자열 파라미터
                     ,error:function(jqXHR,status,error){
                         dms.notification.error(jqXHR.responseJSON.errors);
                     }
                     ,success:function(jqXHR, textStatus) {

                         gridTarget.dataSource.read();

                         //정상적으로 반영 되었습니다.
                         dms.notification.success("<spring:message code='global.info.success'/>");
                         $("#extrDgreCnt").val("");
                         $("#realTargetCnt").val("");
                     }
                     ,beforeSend:function(xhr){
                         dms.loading.show($("#window"));
                         dms.notification.info("<spring:message code='crm.info.proceIng'/>");
                     }
                     ,complete:function(xhr,status){
                         dms.loading.hide($("#window"));
                     }
             });
         }
     });




     // 예산탭
     //버튼 - 추가
     $("#btnBudgetAdd").kendoButton({
         click:function(e) {
             var grid = $('#mcdGrid').data('kendoExtGrid');
             var selectedItem = grid.dataItem(grid.select());
             if(selectedItem!=null) {
                 var dlrCd = selectedItem.dlrCd;
                 var pltCd = selectedItem.pltCd;
                 var makCd = selectedItem.makCd;
                 if(makCd!="") {
                     $('#budgetGrid').data('kendoExtGrid').dataSource.insert(0, {
                          "dlrCd":dlrCd
                         ,"pltCd":pltCd
                         ,"makCd":makCd
                         ,"budgetCd":""
                     });
                 }
             } else {
                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
             }
         }
     });

     //버튼 - 삭제
     $("#btnBudgetDel").kendoButton({
         click:function(e) {

             var grid = $('#mcdGrid').data('kendoExtGrid');
             var selectedItem = grid.dataItem(grid.select());
             if(selectedItem!=null) {
                 var gridBudget = $("#budgetGrid").data("kendoExtGrid");
                 var rows = gridBudget.select();

                 if (rows.length < 1) {
                     //목록을 선택하여 주십시오.
                     dms.notification.info("<spring:message code='global.info.required.select'/>");
                     return;
                 }

                 rows.each(function(index, row) {
                     gridBudget.removeRow(row);
                 });
             } else {
                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
             }
         }
     });

     //버튼 - 저장
     $("#btnBudgetSave").kendoButton({
         click:function(e) {

             var grid = $('#mcdGrid').data('kendoExtGrid');
             var selectedItem = grid.dataItem(grid.select());
             if(selectedItem!=null) {
                 var gridBudget = $("#budgetGrid").data("kendoExtGrid");

                 var saveData = gridBudget.getCUDData("insertList", "updateList", "deleteList");
                 if (gridBudget.cudDataLength == 0) {
                     //변경된 정보가 없습니다.
                     dms.notification.info("<spring:message code='global.info.required.change'/>");
                     return;
                 }

                 if (gridBudget.gridValidation()) {

//                     var venderDs = gridBudget.dataSource;
//                     var iRowCnt = venderDs.total();
//                     for(var i = 0 ;i < iRowCnt ;i++){
//                         venderDs.at(i).imsSuptAmt = Number(venderDs.at(i).budgetAmt) * (Number(venderDs.at(i).corpBudnRate) / 100);
//                     }

                     $.ajax({
                         url:"<c:url value='/crm/mcm/marketingCampaign/multiBudgets.do' />",
                         data:JSON.stringify(saveData),
                         type:'POST',
                         dataType:'json',
                         contentType:'application/json',
                         error:function(jqXHR,status,error) {
                             dms.notification.error(jqXHR.responseJSON.errors);
                         },
                         success:function(jqXHR, textStatus) {

                             gridBudget.dataSource._destroyed = [];
                             gridBudget.dataSource.page(1);

                             //정상적으로 반영 되었습니다.
                             dms.notification.success("<spring:message code='global.info.success'/>");
                         }
                         ,beforeSend:function(xhr){
                             dms.loading.show($("#window"));
                         }
                         ,complete:function(xhr,status){
                             dms.loading.hide($("#window"));
                         }
                     });
                 }else{
                     //입력값을 확인하여 주십시오.
                     dms.notification.warning("<spring:message code='global.info.check.input'/>");
                 }
             } else {
                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
             }
         }
     });

    //버튼 - 엑셀저장(예산)
     $("#btnBudgetExcelExport").kendoButton({
         click:function(e) {

             dms.ajax.excelExport({
                 "beanName":"marketingCampaignService"
                 ,"templateFile":"MarketingCampaign_Tpl.xlsx"
                 ,"fileName":"MarketingCampaign.xlsx"
                 ,"sDlrCd":$("#dlrCd").val()
                 ,"sPltCd":$("#pltCd").val()
                 ,"sMakCd":$("#makCd").val()
             });

         }
     });




     // 심사진도 탭
     //버튼 - 심사요청
     $("#btnEvalReq").kendoButton({
         click:function(e) {

             var saveData    = "";
             var cnt         = 0;

             var gridEval = $("#signLineGrid").data("kendoExtGrid");
    /*         var evalDs = gridEval.dataSource;
             var iRowCnt = evalDs.total();
             for(var i = 0; i < iRowCnt; i++){
                 if(evalDs.at(i).lastSignYn == "Y"){
                     cnt = cnt + 1;
                 }
             }

             if(cnt == 0){
                 //최종결재자가 존재하지 않습니다.
                 dms.notification.info("최종결재자가 존재하지 않습니다.");
                 return;
             }else if(cnt > 1){
                 //최종결재자는 한명만 존재해야 합니다.
                 dms.notification.info("최종결재자는 한명만 존재해야 합니다.");
                 return;
             }

             if(evalDs.at(iRowCnt - 1).lastSignYn != "Y"){
                 //최종결재자는 맨 마지막 사람이어야 합니다.
                 dms.notification.info("최종결재자는 맨 마지막 사람이어야 합니다.");
                 return;
             }*/

             var params = {};
             params["tempSaveYn"] = "N";
             params["signDocId"] = $("#signDocId").val();
             params["refDocNo"] = $("#makCd").val();
             params["reqTitleNm"] = $("#makNm").val();


             var saveData2 = gridEval.dataSource.view();

             params["insertedSignLienVO"] = saveData2;

             $("#insertedSignLienVO").val(saveData2);

             $.ajax({
                 url:"<c:url value='/crm/mcm/marketingCampaign/insertSignEx.do' />"
               , data:JSON.stringify(params)
               , type:'POST'
               , dataType:'json'
               , async:false
               , contentType:'application/json'
               , error:function(jqXHR,status,error) {
                     dms.notification.error(jqXHR.responseJSON.errors);
                 }
               , success:function(jqXHR, textStatus) {
                     $("#apprDocNo").val(jqXHR);

                     gridEval.dataSource._destroyed = [];

                     if( $("#apprDocNo").val() != null && $("#apprDocNo").val() != "" ) {
                         gridEval.dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectSignLineExs.do' />";
                     }else{
                         gridEval.dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectDocLineExs.do' />";
                     }

                     gridEval.dataSource.page(1);

                     $("#signCont").val("");

                     resultKey = $("#makCd").val();
                     isGridReload = true;

                     $("#mcdGrid").data("kendoExtGrid").dataSource.read();

                     //정상적으로 반영 되었습니다.
                     dms.notification.success("<spring:message code='global.info.success'/>");
               }
               ,beforeSend:function(xhr){
                   dms.loading.show($("#window"));
               }
               ,complete:function(xhr,status){
                   dms.loading.hide($("#window"));
               }
             });
         }
     });

     //버튼 - 심사
     $("#btnEval").kendoButton({
         click:function(e) {
             var saveData    = "";

             if($("#signCont").val()=="") {
                 // 화면 필수 체크(결재의견)
                 dms.notification.warning("<spring:message code='global.lbl.signCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 return;
             }

             var params = {};

             params["signDocNo"] = $("#apprDocNo").val();
             params["signCont"] = $("#signCont").val();
             params["signStatCd"] = "03";
             params["signRsltCd"] = "03";

             $.ajax({
                 url:"<c:url value='/crm/mcm/marketingCampaign/updateSignLineEx.do' />"
               , data:JSON.stringify(params)
               , type:'POST'
               , dataType:'json'
               , async:false
               , contentType:'application/json'
               , error:function(jqXHR,status,error) {
                     dms.notification.error(jqXHR.responseJSON.errors);
                 }
               , success:function(jqXHR, textStatus) {
                     $("#signLineGrid").data("kendoExtGrid").dataSource._destroyed = [];

                     if( $("#apprDocNo").val() != null && $("#apprDocNo").val() != "" ) {
                         $("#signLineGrid").data("kendoExtGrid").dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectSignLineExs.do' />";
                     }else{
                         $("#signLineGrid").data("kendoExtGrid").dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectDocLineExs.do' />";
                     }

                     $("#signLineGrid").data("kendoExtGrid").dataSource.page(1);

                     $("#signCont").val("");

                     resultKey = $("#makCd").val();
                     isGridReload = true;

                     $("#mcdGrid").data("kendoExtGrid").dataSource.read();

                     //정상적으로 반영 되었습니다.
                     dms.notification.success("<spring:message code='global.info.success'/>");
               }
               ,beforeSend:function(xhr){
                   dms.loading.show($("#window"));
               }
               ,complete:function(xhr,status){
                   dms.loading.hide($("#window"));
               }
             });
         }
     });

     //버튼 - 반려
     $("#btnReject").kendoButton({
         click:function(e) {
             var saveData    = "";

             if($("signCont").val()=="") {
                 // 화면 필수 체크(결재의견)
                 dms.notification.warning("<spring:message code='global.lbl.signCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 return;
             }

             var params = {};

             params["signDocNo"] = $("#apprDocNo").val();
             params["signCont"] = $("#signCont").val();
             params["signStatCd"] = "03";
             params["signRsltCd"] = "02";

             $.ajax({
                 url:"<c:url value='/crm/mcm/marketingCampaign/updateSignLineEx.do' />"
               , data:JSON.stringify(params)
               , type:'POST'
               , dataType:'json'
               , async:false
               , contentType:'application/json'
               , error:function(jqXHR,status,error) {
                     dms.notification.error(jqXHR.responseJSON.errors);
                 }
               , success:function(jqXHR, textStatus) {
                     $("#signLineGrid").data("kendoExtGrid").dataSource._destroyed = [];

                     if( $("#apprDocNo").val() != null && $("#apprDocNo").val() != "" ) {
                         $("#signLineGrid").data("kendoExtGrid").dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectSignLineExs.do' />";
                     }else{
                         $("#signLineGrid").data("kendoExtGrid").dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectDocLineExs.do' />";
                     }

                     $("#signLineGrid").data("kendoExtGrid").dataSource.page(1);

                     $("#signCont").val("");

                     resultKey = $("#makCd").val();
                     isGridReload = true;

                     $("#mcdGrid").data("kendoExtGrid").dataSource.read();

                     //정상적으로 반영 되었습니다.
                     dms.notification.success("<spring:message code='global.info.success'/>");
               }
               ,beforeSend:function(xhr){
                   dms.loading.show($("#window"));
               }
               ,complete:function(xhr,status){
                   dms.loading.hide($("#window"));
               }
             });
         }
     });





     //대상 딜러탭
     //버튼 - 대상제외
     $("#btnTargetOff").kendoButton({
         click:function(e) {
             var grid = $('#mcdGrid').data('kendoExtGrid');
             var selectedItem = grid.dataItem(grid.select());
             if(selectedItem!=null) {
                 var gridDlr = $('#dlrGrid').data('kendoExtGrid');
                 var gridDlrDs = gridDlr.dataSource;
                 var gridDlrData = gridDlrDs.view();

                 //체크박스가 선택이 안되어 있으면  선택하라는 메시지를 보여준다.
                 if($("input.flagYn:checked", "#dlrGrid").length <= 0 ){
                     // 체크박스를 체크하여 주십시오.
                     dms.notification.warning("<spring:message code='crm.info.checkBox.check'/>");
                     return false;
                 }

                 //선택된 데이터를 기준으로 대상여부를 'N'으로 수정한다.
                 for(var i = 0; i < gridDlrData.length; i++){
                     if(gridDlrData[i].flagYn == "Y"){
                         gridDlr.dataSource._data[i].set("targYn","N");
                     }
                 }

             } else {
                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
             }
         }
     });


     //버튼 - 대상선정
     $("#btnTargetOn").kendoButton({
         click:function(e) {
             var grid = $('#mcdGrid').data('kendoExtGrid');
             var selectedItem = grid.dataItem(grid.select());
             if(selectedItem!=null) {
                 var gridDlr = $('#dlrGrid').data('kendoExtGrid');
                 var gridDlrDs = gridDlr.dataSource;
                 var gridDlrData = gridDlrDs.view();

                 //체크박스가 선택이 안되어 있으면  선택하라는 메시지를 보여준다.
                 if($("input.flagYn:checked", "#dlrGrid").length <= 0 ){
                     // 체크박스를 체크하여 주십시오.
                     dms.notification.warning("<spring:message code='crm.info.checkBox.check'/>");
                     return false;
                 }

                 //선택된 데이터를 기준으로 대상여부를 'N'으로 수정한다.
                 for(var i = 0; i < gridDlrData.length; i++){
                     if(gridDlrData[i].flagYn == "Y"){
                         gridDlr.dataSource._data[i].set("targYn","Y");
                     }
                 }

             } else {
                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
             }
         }
     });


     //버튼 - 저장
     $("#btnDlrSave").kendoButton({
         click:function(e){
             var grid = $('#mcdGrid').data('kendoExtGrid');
             var selectedItem = grid.dataItem(grid.select());
             if(selectedItem!=null) {
/*
                 //체크박스가 선택이 안되어 있으면  선택하라는 메시지를 보여준다.
                 if($("input.flagYn:checked", "#dlrGrid").length <= 0 ){
                     // 체크박스를 체크하여 주십시오.
                     dms.notification.warning("<spring:message code='crm.info.checkBox.check'/>");
                     return false;
                 }
*/
                 var gridDlr = $("#dlrGrid").data("kendoExtGrid");

                 var params = {};
                 params["tDlrCd"] = $("#dlrCd").val();
                 params["tMakCd"] = $("#makCd").val();

                 var dlrDs = gridDlr.dataSource.view();
                 var iRowCnt = dlrDs.length;
                 for(var i = 0; i < iRowCnt; i++){
                     //체크박스가 체크되어 있고 공임코드가 없을때 필수입력 체크를 한다.
                     if(/*dlrDs[i].flagYn == "Y" &&*/dlrDs[i].targYn == "Y" && (dlrDs[i].lbrCd == "" || dlrDs[i].lbrCd == null || dlrDs[i].lbrCd == undefined)){
                         // 필수입력입니다.
                         dms.notification.warning("<spring:message code='ser.lbl.lbrCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                         return false;
                     }else{
                         dlrDs[i].dlrCd = $("#dlrCd").val();
                         dlrDs[i].makCd = $("#makCd").val();
                     }
                 }

                 var saveData = gridDlr.dataSource.data();

                 console.log(saveData);

                 params["insertDlrCdVO"] = saveData;

//                 console.log(JSON.stringify({"insertDlrCdVO":saveData}));

                 $.ajax({
                     url:"<c:url value='/crm/mcm/marketingCampaign/saveDlrCdData.do' />"
                     ,data:JSON.stringify(params)
                     ,type:'POST'
                     ,dataType:'json'
                     ,contentType:'application/json'
                     ,error:function(jqXHR, status, error) {
                         dms.notification.error(jqXHR.responseJSON.errors);
                     }
                     ,success:function(jqXHR, textStatus) {

                         gridDlr.dataSource._destroyed = [];
                         gridDlr.dataSource.page(1);

                         //정상적으로 반영 되었습니다.
                         dms.notification.success("<spring:message code='global.info.success'/>");
                     }
                     ,beforeSend:function(xhr){
                         dms.loading.show($("#window"));
                     }
                     ,complete:function(xhr,status){
                         dms.loading.hide($("#window"));
                     }
                 });
             } else {
                 //캠페인 목록을 먼저 선택해 주십시오.
                 dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
             }
        }
     });


/*************************************************************
 * DataSource 영역
 *************************************************************/

/*************************************************************
 *   그리드 셋팅
*************************************************************/

     //그리드 설정(캠페인 마스터)
     $("#mcdGrid").kendoExtGrid({
         gridId:"G-CRM-0722-123001"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectMarketingCampaigns.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         params["recordCountPerPage"]    = options.pageSize;
                         params["pageIndex"]             = options.page;
                         params["firstIndex"]            = options.skip;
                         params["lastIndex"]             = options.skip + options.take;
                         params["sort"]                  = options.sort;

                         params["sMakNm"]      = $("#sMakNm").val();
                         params["sMakCd"]      = $("#sMakCd").val();
                         params["sHostCd"]     = $("#sHostCd").val();
                         params["sHostTeamCd"] = $("#sHostTeamCd").val();
                         params["sMakTpCd"]    = $("#sMakTpCd").val();
                         params["sMakSubTpCd"] = $("#sMakSubTpCd").val();
                         params["sStatCd"]     = $("#sStatCd").val();
                         params["sStartDt"]    = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                         params["sEndDt"]      = $("#sEndDt").data("kendoExtMaskedDatePicker").value();

                         console.log(params);
                         return kendo.stringify(params);

                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                 errors:"error"
                 ,data :"data"
                 ,total:"total"
                 ,model:{
                     id:"makCd"
                     ,fields:{
                         rnum:{type:"number", editable:false}
                         , makCd:{type:"string", editable:false}
                         , makNm:{type:"string", editable:false}
//                         , regDt:{type:"date", editable:false}
                         , regDtFormat:{type:"date", editable:false}
                         , hostCd:{type:"string", editable:false}
                         , hostNm:{type:"string", editable:false}
                         , hostTeamCd:{type:"string", editable:false}
                         , hostTeamNm:{type:"string", editable:false}
                         , statCd:{type:"string", editable:false}
                         , statNm:{type:"string", editable:false}
                         , makTpCd:{type:"string", editable:false}
                         , makTpSubTpNm:{type:"string", editable:false}
                         , targCustCnt:{type:"number", editable:false}
                         , realCustCnt:{type:"number", editable:false}
//                         , pgssRate:{type:"number", editable:false}
                         , startDt:{type:"date", editable:false}
                         , startDtFormat:{type:"date", editable:false}
                         , endDt:{type:"date", editable:false}
                         , endDtFormat:{type:"date", editable:false}
                         , budgetAmt:{type:"number", editable:false}
                         , regUsrId:{type:"string", editable:false}
                         , saleStartDt:{type:"date", editable:false}
                         , saleStartDtFormat:{type:"date", editable:false}
                         , saleEndDt:{type:"date", editable:false}
                         , saleEndDtFormat:{type:"date", editable:false}
                         , creStartDt:{type:"date", editable:false}
                         , creStartDtFormat:{type:"date", editable:false}
                         , creEndDt:{type:"date", editable:false}
                         , creEndDtFormat:{type:"date", editable:false}
                         , crEndTp:{type:"string", editable:false}
                         , activeNm:{type:"string", editable:false}
                         , activeCont:{type:"string", editable:false}
                         , adInvtHm:{type:"string", editable:false}
                         , adMediaCd:{type:"string", editable:false}
                         , adCostAmt:{type:"number", editable:false}
                         , adStartDt:{type:"string", editable:false}
                         , adEndDt:{type:"string", editable:false}
                         , dlrCd:{type:"string", editable:false}
                         , pltCd:{type:"string", editable:false}
                     }
                 }
                 ,parse:function(d) {
                     if(d.data){
                         $.each(d.data, function(idx, elem) {
                             elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                             elem.startDtFormat = kendo.parseDate(elem.startDt, "<dms:configValue code='dateFormat' />");
                             elem.endDtFormat = kendo.parseDate(elem.endDt, "<dms:configValue code='dateFormat' />");
                             elem.saleStartDtFormat = kendo.parseDate(elem.saleStartDt, "<dms:configValue code='dateFormat' />");
                             elem.saleEndDtFormat = kendo.parseDate(elem.saleEndDt, "<dms:configValue code='dateFormat' />");
                             elem.creStartDtFormat = kendo.parseDate(elem.creStartDt, "<dms:configValue code='dateFormat' />");
                             elem.creEndDtFormat = kendo.parseDate(elem.creEndDt, "<dms:configValue code='dateFormat' />");
                         });
                     }
                     return d;
                 }
             }
             ,requestEnd:function(e){
                 if (e.type !== "read"){
                     //this.page(1);
                 }
             }
         }
         ,dataBound:function(e) {

             // 캠페인목록에서 makCd 가지고 온경우 해당 grid dataBound 시 makCd 찾아서 선택, 상세조회 이벤트 준다
             var grid = $("#mcdGrid").data("kendoExtGrid")
             , rows = grid.tbody.find("tr")
             , gridData
             , selectRow

             if ( isGridReload && dms.string.isNotEmpty(resultKey) ) {

                 rows.each(function(index, row) {

                     gridData = grid.dataSource.at(index);

                     if ( gridData.makCd === resultKey ) {
                         selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(index);
                         grid.select(selectRow);
                     }
                 });

                 isGridReload = false;

             }

         }
         ,change:function(e){

             var selectedItem = this.dataItem(this.select());

             viewDetail(selectedItem);
         }

         ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"makCd", title:"<spring:message code='global.lbl.crNo' />", width:130, attributes:{"class":"ac"}}       // 캠페인코드
            ,{field:"makNm", title:"<spring:message code='global.lbl.crNm' />", width:200}      // 캠페인명
//            ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100, attributes:{"class":"ac"}
//                ,format:"{0:<dms:configValue code='dateFormat' />}"
//            }
            ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:150
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.regDt, '<dms:configValue code='dateTimeFormat' />') #"
            }
            ,{field:"hostCd", title:"<spring:message code='global.lbl.hostCd' />", hidden:true}                       // 주최
            ,{field:"hostNm", title:"<spring:message code='global.lbl.hostCd' />", width:100, attributes:{"class":"ac"}}       // 주최
            ,{field:"hostTeamCd", title:"<spring:message code='global.lbl.hostTeamCd' />", hidden:true}                       // 주최부문
            ,{field:"hostTeamNm", title:"<spring:message code='global.lbl.hostTeamCd' />", width:100, attributes:{"class":"ac"}}       // 주최부문
            ,{field:"statCd", title:"<spring:message code='global.lbl.statNm' />", hidden:true}   // 상태
            ,{field:"statNm", title:"<spring:message code='global.lbl.statNm' />", width:100, attributes:{"class":"ac"}}   // 상태
            ,{field:"makTpCd", title:"<spring:message code='global.lbl.type' />", hidden:true}    // 유형
            ,{field:"makTpSubTpNm", title:"<spring:message code='global.lbl.type' />", width:150, attributes:{"class":"ac"}}    // 유형
            ,{field:"targCustCnt", title:"<spring:message code='global.lbl.targCustCnt' />", width:100, attributes:{"class":"ac"}}    // 목표인수
            ,{field:"realCustCnt", title:"<spring:message code='global.lbl.useper' />", width:100, attributes:{"class":"ac"}
                ,template:function(dataItem){
                    var spanObj = "<a href='#' class='popTargExtractList'>"+dataItem.realCustCnt+"</a>";
                    return spanObj;
                }
            } // 참여인력
//            ,{field:"pgssRate", title:"<spring:message code='global.lbl.pgssRate' />", width:100, attributes:{"class":"ac"}}       // 진도
//            ,{field:"startDt", title:"<spring:message code='global.lbl.startDt' />", width:100, attributes:{"class":"ac"}
//                ,format:"{0:<dms:configValue code='dateFormat' />}"
//            }
//            ,{field:"endDt", title:"<spring:message code='global.lbl.EndDt' />", width:100, attributes:{"class":"ac"}
//                ,format:"{0:<dms:configValue code='dateFormat' />}"
//            }
            ,{field:"startDtFormat", title:"<spring:message code='global.lbl.startDt' />", width:100
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.startDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"endDtFormat", title:"<spring:message code='global.lbl.EndDt' />", width:100
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.endDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"budgetAmt", title:"<spring:message code='global.lbl.budgetAmt' />", width:100, attributes:{"class":"ar"},  format:"{0:##,###}"}    // 예산
            ,{field:"regUsrId", title:"<spring:message code='global.lbl.regUsrId' />", width:100, attributes:{"class":"ac"}}    // 등록자
//            ,{field:"creStartDt", title:"<spring:message code='ser.lbl.creStartDt' />", width:100, attributes:{"class":"ac"}
//                ,format:"{0:<dms:configValue code='dateFormat' />}"
//            } // 생산시작일자
//            ,{field:"creEndDt", title:"<spring:message code='ser.lbl.creEndDt' />", width:100, attributes:{"class":"ac"}
//                ,format:"{0:<dms:configValue code='dateFormat' />}"
//            } // 생산종료일자
//            ,{field:"saleStartDt", title:"<spring:message code='ser.lbl.saleStartDt' />", width:100, attributes:{"class":"ac"}
//                ,format:"{0:<dms:configValue code='dateFormat' />}"
//            } // 판매시작일자
//            ,{field:"saleEndDt", title:"<spring:message code='ser.lbl.saleEndDt' />", width:100, attributes:{"class":"ac"}
//                ,format:"{0:<dms:configValue code='dateFormat' />}"
//            } // 판매종료일자
            ,{field:"creStartDtFormat", title:"<spring:message code='ser.lbl.creStartDt' />", width:100
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.creStartDt == null ? '':data.creStartDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"creEndDtFormat", title:"<spring:message code='ser.lbl.creEndDt' />", width:100
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.creEndDt == null ? '':data.creEndDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"saleStartDtFormat", title:"<spring:message code='ser.lbl.saleStartDt' />", width:100
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.saleStartDt == null ? '':data.saleStartDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"saleEndDtFormat", title:"<spring:message code='ser.lbl.saleEndDt' />", width:100
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#= kendo.toString(data.saleEndDt == null ? '':data.saleEndDt, '<dms:configValue code='dateFormat' />') #"
            }
            ,{field:"crEndTp", title:"<spring:message code='ser.lbl.endYn' />", width:100, attributes:{"class":"ac"}}       // 종료여부
            ,{field:"activeNm", title:"활동명칭", hidden:true} // 활동명칭
            ,{field:"activeCont", title:"요약설명", hidden:true} // 요약설명
            ,{field:"adInvtHm", title:"광고투자시간", hidden:true} // 광고투자시간
            ,{field:"adMediaCd", title:"매체", hidden:true} // 매체
            ,{field:"adCostAmt", title:"광고비용", hidden:true} // 광고비용
            ,{field:"adStartDt", title:"광고시작일자", hidden:true
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            } // 광고시작일자
            ,{field:"adEndDt", title:"광고종료일자", hidden:true
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            } // 광고종료일자
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
            ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}                       // 사업장코드
         ]
         , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
         , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
         , appendEmptyColumn:false          //빈컬럼 적용. default:false
         , enableTooltip:true               //Tooltip 적용, default:false
         ,navigatable:true
     });





    //그리드 설정(목표)
     $("#goalGrid").kendoExtGrid({
         gridId:"G-CRM-0722-123002"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectGoals.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         params["sort"]         = options.sort;

                         params["sDlrCd"]       = $("#dlrCd").val();
                         params["sPltCd"]       = $("#pltCd").val();
                         params["sMakCd"]       = $("#makCd").val();

                         console.log(params);
                         return kendo.stringify(params);

                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                 model:{
                     id:"seq"
                     ,fields:{
                         rnum:{type:"number", editable:false}
                         , makCd:{type:"string", editable:false}
                         , seq:{type:"string", editable:false}
                         , targCd:{type:"string", editable:false}
                         , targNm:{type:"string", validation:{required:true}}
                         , targCntVal:{type:"number", validation:{required:true}}
                         , dlrCd:{type:"string"}
                         , pltCd:{type:"string"}
                     }
                 }
             }
         }
         ,edit:function(e) {
             if(!e.model.isNew()) {
                 if (!dms.string.isEmpty(e.model.targCd) && e.sender.columns[e.container.index()].field == "targNm") {
                     this.closeCell();
                 }
             }
             e.container.find("input[name=targNm]").keyup(function(){
                 txtLimit(this, '200');
             });
         }
         ,dataBound:function(e) {
             var that = this;
             var rows = that.tbody.find("tr");
             rows.each(function(idx, row){
                 var dataItem = that.dataItem(row);
                 if (!dms.string.isEmpty(dataItem.targCd)) {
                     $("input.grid-checkbox-item", row).prop("disabled", true);
                 }
             });
         }
         ,change:function(e) {
             var that = this;
             var rows = that.select();
             rows.each(function(idx, row) {
                 var dataItem = that.dataItem(row);
                 if (!dms.string.isEmpty(dataItem.targCd)) {
                     $(row).removeClass('k-state-selected k-state-selecting');
                 }
             });
         }
         , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
         , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         , multiSelectWithCheckbox:true     //멀티선택 적용. default:false
         , appendEmptyColumn:true           //빈컬럼 적용. default:false
         , enableTooltip:true               //Tooltip 적용, default:false
         ,pageable:false
         ,sortable:false
         ,filterable:false
         ,height:400
         ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"makCd", title:"<spring:message code='global.lbl.crNo' />", hidden:true}       // 캠페인코드
            ,{field:"seq", title:"<spring:message code='global.lbl.budgetCd' />", hidden:true}
            ,{field:"targCd", title:"<spring:message code='global.lbl.targ' />", hidden:true}
            ,{field:"targNm", title:"<spring:message code='global.lbl.targ' />", width:700}       // 상세내역
            ,{field:"targCntVal", title:"<spring:message code='global.lbl.targCntVal' />", width:100, attributes:{"class":"ac"}}   // 자사분담율
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
            ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}                       // 사업장코드
         ]
     });





    //대상자 그리드 설정
    $("#targetGrid").kendoExtGrid({
        gridId:"G-CRM-0722-123003"
        ,dataSource:{
              transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectTargets.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         params["sort"]         = options.sort;

                         params["sDlrCd"]       = $("#dlrCd").val();
                         params["sPltCd"]       = $("#pltCd").val();
                         params["sMakCd"]       = $("#makCd").val();

                         console.log(params);
                         return kendo.stringify(params);

                     } else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                 model:{
                     id:"extrDgreCnt"
                     ,fields:{
                         extrDgreCnt:{type:"string", editable:false}
                         ,custExtrTermNo:{type:"string", editable:false}
                         ,custExtrTitleNm:{type:"string", editable:false}
                         ,extrStatCd:{type:"string", editable:false}
                         ,realTargetCnt:{type:"number", editable:false}
                         ,extrDt:{type:"date", editable:false}
                         ,custExtrAutoYn:{type:"string", editable:false}
//                         ,custExtrCycleCont:{type:"string", editable:false}
                         ,custExtrCycleTp:{type:"string", editable:false} /* 고객추출주기유형 */
                         ,dupYn:{type:"string", editable:false}
                     }
                 }
             }
         }
         ,change:function(e){

             var selectedItem = this.dataItem(this.select());

             if (selectedItem != null) {

                 //고객추출조건(입력부).   targExtractList
                 custExtrTermNoDDL();

                 // 추출차수
                 $("#extrDgreCnt").val(selectedItem.extrDgreCnt);
                 // 추출조건번호
                 $("#custExtrTermNo").data("kendoExtDropDownList").value(selectedItem.custExtrTermNo);
                 $("#custExtrTermNo").data("kendoExtDropDownList").text(selectedItem.custExtrTitleNm);
                 // 추출조건제목
                 $("#custExtrTitleNm").val(selectedItem.custExtrTitleNm);
                 // 고객추출자동여부
                 $("#custExtrAutoYn").data("kendoExtDropDownList").value(selectedItem.custExtrAutoYn);

                 if(selectedItem.custExtrAutoYn == "Y"){
                     cycleCheckDisFalse();
                 }else{
                     cycleCheckDisTrue();
                 }

                 // 고객추출주기
//                 $("#custExtrCycleCont").val(selectedItem.custExtrCycleCont);
                 // 중복여부
                 $("#dupYn").data("kendoExtDropDownList").value(selectedItem.dupYn);
                 //고객대상자 수
                 $("#realTargetCnt").val(selectedItem.realTargetCnt);


                 // ###################################################### 추출주기설정 5/5 상세 조회 시작
                 cycleFormInit();
                 custExtrCycleDt = [];
                 $("#cycleDt").val("");
                 $("input[name=custExtrCycleWeek]:checkbox").prop("checked",false);

                 if( selectedItem.custExtrCycleTp === "S") {

                     $("#btnCycleSelect").click();

                     var cycleDatepicker = $("#cycleDatepicker").data("kendoDatePicker");
                     cycleDatepicker.close();

                     var tmpCustExtrCycleDt = [];
                     // 날짜선택
                     var resultArray = selectedItem.custExtrCycleCont.split(',');
                     $.each(resultArray, function(idx, row){
                         tmpCustExtrCycleDt.push(kendo.parseDate(row.trim(), "yyyyMMdd"));
                     });

                     custExtrCycleDt = tmpCustExtrCycleDt;

                     // 최종 선택된 날짜를 텍스트 박스에 뿌려준다.
                     dtToString(custExtrCycleDt);

                 } else if( selectedItem.custExtrCycleTp === "W") {

                     $("#btnCycleWeek").click();

                     // 요일 체크박스 체크
                     var resultArray = selectedItem.custExtrCycleCont.split(',');
                     $("input[name=custExtrCycleWeek]:checkbox").prop("checked", false);
                     $.each(resultArray, function(idx, row){
                         $("#custExtrCycleWeek_"+row.trim()).prop("checked", true);
                     });

                 } else if( selectedItem.custExtrCycleTp === "D") {

                     $("#btnCycleDay").click();

                 };

                 // 상세 조회 후 달력 클릭시 자꾸 이전에 선택된 달력 날짜가 찍힘. 그래서 초기화.
                 if ( custExtrCycleDt.length == 0 ) {

                     var cycleDatepicker = $("#cycleDatepicker").data("kendoDatePicker");
                     cycleDatepicker.setOptions({
                          month:{
                              empty:'-'
                          }
                     });

                 };

                 var param = {
                         "sSeq":"0"
                         };

                 $.ajax({
                         url:"<c:url value='/crm/css/satisFactionManage/selectSatisFactionBatchCnt.do' />"
                         ,data:JSON.stringify(param)      //파라미터
                         ,type:'POST'                        //조회요청
                         ,dataType:'json'                  //json 응답
                         ,contentType:'application/json'   //문자열 파라미터
                         //,async:false
                         ,error:function(jqXHR,status,error){
                             dms.notification.error(jqXHR.responseJSON.errors);
                         }
                 }).done(function(body) {

                     console.log("배치 작업 수량:",body);

                 });
                 // ###################################################### 추출주기설정 5/5 상세 조회 종료

             }

         }
         ,dataBound:function (e) {



         }
         , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
         , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
         , appendEmptyColumn:true           //빈컬럼 적용. default:false
         , enableTooltip:true               //Tooltip 적용, default:false
         ,sortable:false
         ,filterable:false
         ,height:290
         ,columns:[
             {field:"extrDgreCnt", hidden:true}
             ,{field:"custExtrTermNo", hidden:true}
             ,{field:"custExtrTitleNm", title:"<spring:message code='crm.lbl.custExtrTermNo' />", width:200 ,attributes:{"class":"al"}}
             ,{field:"extrStatCd", title:"<spring:message code='crm.lbl.extrStatCd' />", width:100 ,attributes:{"class":"ac"}}
             ,{field:"realTargetCnt", title:"<spring:message code='crm.lbl.pointExtUsrCnt' />", width:100, attributes:{"class":"ac"}
                 ,template:function(dataItem){
                     var spanObj = "<a href='#' class='popTargExtractDetailList'>"+dataItem.realTargetCnt+"</a>";
                     return spanObj;
                 }
             }
             ,{field:"extrDt", title:"<spring:message code='crm.lbl.extrDt' />", width:100 ,attributes:{"class":"ac"}
                       ,format:"{0:<dms:configValue code='dateFormat' />}"
             }
             ,{field:"custExtrAutoYn", title:"<spring:message code='crm.lbl.custExtrAutoYn' />", width:100 ,attributes:{"class":"ac"}}
             ,{//고객추출주기유형
                 field:"custExtrCycleTp" , title:"<spring:message code='crm.lbl.custExtrCycleTp'/>" , width:100
                 ,attributes:{"class":"ac"}
                 ,template:function(dataItem){

                     var custExtrCycleTpNm = "";
                     var custExtrCycleTp = dataItem.custExtrCycleTp;
                     if ( custExtrCycleTp === "D" ) {
                         custExtrCycleTpNm = "<spring:message code='crm.btn.allDay' />";     //매일
                     } else if ( custExtrCycleTp === "W" ) {
                         custExtrCycleTpNm = "<spring:message code='crm.btn.allWeek' />";    //매주
                     } else if ( custExtrCycleTp === "S" ) {
                         custExtrCycleTpNm = "<spring:message code='global.btn.select' />";  //선택
                     };
                     return custExtrCycleTpNm;

                 }
             }
             ,{ field:"custExtrCycleCont", hidden:true }     // TODO 추후 삭제
             ,{field:"dupYn", title:"<spring:message code='crm.lbl.dupYn' />", width:100 ,attributes:{"class":"ac"}}
         ]

    });





     //그리드 설정(예산)
     $("#budgetGrid").kendoExtGrid({
         gridId:"G-CRM-0722-123004"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectBudgets.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         params["sort"]         = options.sort;

                         params["sDlrCd"]       = $("#dlrCd").val();
                         params["sPltCd"]       = $("#pltCd").val();
                         params["sMakCd"]       = $("#makCd").val();

                         console.log(params);
                         return kendo.stringify(params);

                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                     model:{
                         id:"budgetCd"
                         ,fields:{
                             makCd:{type:"string", editable:false}
                             , budgetCd:{type:"string", validation:{required:true}}
                             , budgetDetlCont:{type:"string"}
                             , budgetAmt:{type:"number", validation:{required:true}}
                             , corpBudnRate:{type:"number", validation:{required:true}}
                             , imsSuptAmt:{type:"number", validation:{required:true}}
                             , dlrCd:{type:"string"}
                             , pltCd:{type:"string"}
                         }
                     }
             }
//              ,aggregate:[{ field:"budgetAmt", aggregate:"sum" },
//                            { field:"imsSuptAmt", aggregate:"sum" }]
         }
         ,edit:function(e) {
             e.container.find("input[name=budgetDetlCont]").keyup(function(){
                 txtLimit(this, '1000');
             });
             e.container.find("input[name=budgetAmt]").keyup(function(){
                 var data = e.model;

                 data.set("budgetAmt", Number($(this).val().replace(/\,/gi,"")));
                 //data.set("imsSuptAmt", Number($(this).val()) * (Number(data.corpBudnRate)/100));
                 //data.set("imsSuptAmt", Number(data.budgetAmt) * (Number(data.corpBudnRate)/100));
                 budgetGridSum();
             });
             e.container.find("input[name=corpBudnRate]").keyup(function(){
                 var data = e.model;

                 data.set("corpBudnRate", Number($(this).val().replace(/\,/gi,"")));
                 //data.set("imsSuptAmt", Number(data.budgetAmt) * (Number($(this).val())/100));
                 //data.set("imsSuptAmt", Number(data.budgetAmt) * (Number(data.corpBudnRate)/100));

                 budgetGridSum();
             });
             e.container.find("input[name=imsSuptAmt]").keyup(function(){
                 var data = e.model;

                 data.set("imsSuptAmt", Number($(this).val().replace(/\,/gi,"")));

                 budgetGridSum();
             });
         }
         ,dataBound:budgetGridSum
         , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
         , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         , multiSelectWithCheckbox:true     //멀티선택 적용. default:false
         , appendEmptyColumn:false          //빈컬럼 적용. default:false
         , enableTooltip:true               //Tooltip 적용, default:false
         ,pageable:false
         ,sortable:false
         ,filterable:false
         ,height:400
         ,editableOnlyNew:true
         ,editableOnlyNewExcludeColumns:["budgetDetlCont","budgetAmt","corpBudnRate","imsSuptAmt"]
         ,columns:[
            {field:"makCd", title:"<spring:message code='global.lbl.crNo' />", hidden:true}       // 캠페인코드
            ,{field:"budgetCd", title:"<spring:message code='global.lbl.budgetCd' />", width:80
                ,editor:function(container, options) {
                    $('<input required name="budgetCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:budGetList
                    });
                    $('<span class="k-invalid-msg" data-for="budgetCd"></span>').appendTo(container);
                }
                ,template:'#if(budgetCd !== "") {# #= budGetMap[budgetCd]# #}#'
                ,footerTemplate:"<spring:message code='global.lbl.total' />"
                ,footerAttributes:{style:"text-align:center;"}
            }
            ,{field:"budgetDetlCont", title:"<spring:message code='global.lbl.budgetDetlCont' />"}       // 상세내역
            ,{field:"budgetAmt", title:"<spring:message code='global.lbl.budgetAmt' />", width:150, attributes:{"class":"ar"},  format:"{0:##,###}"
              //,footerTemplate:"#=kendo.toString(sum, 'n0')#"
              ,footerTemplate:"<span id='budgetGridBudgetAmtSum'></span>"
              ,footerAttributes:{style:"text-align:right;"}
            }    // 예산(위안)
            ,{field:"corpBudnRate", title:"<spring:message code='global.lbl.corpBudnRate' />", width:150, attributes:{"class":"ar"},  format:"{0:##,###}"
//               ,footerTemplate:"#=kendo.toString(sum, 'n0')#"
              ,footerTemplate:"<span id='budgetGridCorpBudnRateSum'></span>"
              ,footerAttributes:{style:"text-align:right;"}
            }   // 본딜러부담(위안)
            ,{field:"imsSuptAmt", title:"<spring:message code='global.lbl.imsSuptAmt' />", width:150, attributes:{"class":"ar"},  format:"{0:##,###}"
//               ,footerTemplate:"#=kendo.toString(sum, 'n0')#"
              ,footerTemplate:"<span id='budgetGridImsSuptAmtSum'></span>"
              ,footerAttributes:{style:"text-align:right;"}
            }    // 제조사부담(위안)
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
            ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}                       // 사업장코드
         ]
     });





    //결재 라인 그리드 설정
    $("#signLineGrid").kendoExtGrid({
        gridId:"G-CRM-0722-123005"
        ,dataSource:{
              transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectDocLineExs.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         params["sort"]         = options.sort;

                         params["sSignDocId"] = $("#signDocId").val();
                         if( $("#apprDocNo").val() != "" ) {
                             params["sSignDocNo"] = $("#apprDocNo").val();
                         }

                         return kendo.stringify(params);

                     } else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                 model:{
                     id:"signDocLineNo"
                     ,fields:{
                         rnum:{type:"number", editable:false}
                         ,signDocId:{type:"string", validation:{required:true}}
                         ,signDocLineNo:{type:"string",editable:false}
                         ,signTp:{type:"string", validation:{required:true}}
                         ,signUsrId:{type:"string", validation:{required:true}}
                         ,signUsrNm:{type:"string", validation:{required:true}}
                         ,signPstiCd:{type:"string", validation:{required:true}}
                         ,signPstiNm:{type:"string", validation:{required:true}}
                         ,signDeptCd:{type:"string", validation:{required:true}}
                         ,signDeptNm:{type:"string", validation:{required:true}}
                         ,signStatCd:{type:"string", editable:false}
                         ,signRsltCd:{type:"string", editable:false}
                         ,signDt    :{type:"date", editable:false}
                         ,signCont  :{type:"string"}
                     }
                 }
             }
         }
         ,edit:function(e) {
             var data = e.model;

             if (($("#apprDocNo").val() == "" || $("#apprDocNo").val() == null || data.signUsrId != "${userId}" || data.signStatCd != "02") &&
                 e.sender.columns[e.container.index()].field == "signCont") {
                 this.closeCell();
             }

             e.container.find("input[name=signCont]").keyup(function(){
                 txtLimit(this, '4000');
                 $("#signCont").val($(this).val());
             });
         }
         ,change:function(e){

             var selectedItem = this.dataItem(this.select());

             if (selectedItem != null) {
                 // 결재의견
                 $("#signCont").val(selectedItem.signCont);
             }

         }
         ,dataBound:function (e) {

             var evalDs = this.dataSource;
             var iRowCnt = evalDs.total();

             if( $("#apprDocNo").val() != "" && $("#apprDocNo").val() != null ){

                 for(var i = 0; i < iRowCnt; i++){
                     if(evalDs.at(i).signUsrId == "${userId}" && evalDs.at(i).signStatCd == "02"){
                         $("#btnEval").data("kendoButton").enable(true);
                         $("#btnReject").data("kendoButton").enable(true);
                         $("#btnEvalReq").data("kendoButton").enable(false);
                         break;
                     }else if(evalDs.at(i).signStatCd == "04"){
                         $("#btnEval").data("kendoButton").enable(false);
                         $("#btnReject").data("kendoButton").enable(false);
                         $("#btnEvalReq").data("kendoButton").enable(true);
                         break;
                     }else{
                         $("#btnEval").data("kendoButton").enable(false);
                         $("#btnReject").data("kendoButton").enable(false);
                         $("#btnEvalReq").data("kendoButton").enable(false);
                     }
                 }
//                 $("#btnEvalAdd").data("kendoButton").enable(false);
//                 $("#btnEvalDel").data("kendoButton").enable(false);
             }else{
                 if($("#statCd").val() != "03" && $("#statCd").val() != "05"){
                     $("#btnEval").data("kendoButton").enable(false);
                     $("#btnReject").data("kendoButton").enable(false);
                     $("#btnEvalReq").data("kendoButton").enable(true);
//                     $("#btnEvalAdd").data("kendoButton").enable(true);
//                     $("#btnEvalDel").data("kendoButton").enable(true);
                 }else{
                     $("#btnEval").data("kendoButton").enable(false);
                     $("#btnReject").data("kendoButton").enable(false);
                     $("#btnEvalReq").data("kendoButton").enable(false);
//                     $("#btnEvalAdd").data("kendoButton").enable(true);
//                     $("#btnEvalDel").data("kendoButton").enable(true);
                 }

             }

         }
         , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
         , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
         , appendEmptyColumn:true           //빈컬럼 적용. default:false
         , enableTooltip:true               //Tooltip 적용, default:false
         ,editableOnlyNew:true
         ,editableOnlyNewExcludeColumns:["signUsrNm", "signCont"]
         ,sortable:false
         ,filterable:false
         ,height:400
         ,columns:[
             {field:"signDocId", hidden:true}
             ,{field:"signDocLineNo", title:"<spring:message code='global.lbl.signDocLineNo' />", width:100 ,attributes:{"class":"ac"}}
             ,{field:"lastSignYn", title:"<spring:message code='global.lbl.final' />", width:100 ,attributes:{"class":"ac"}
                 ,editor:function(container, options) {
                     $('<input required name="lastSignYn" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         autoBind:true
                         ,dataSource:['Y','N']
                         ,index:0
                     });
                     $('<span class="k-invalid-msg" data-for="lastSignYn"></span>').appendTo(container);
                 }
              }
             ,{field:"signTp", title:"<spring:message code='global.lbl.gubun' />", width:100
                 ,template:"# if(arrSignTpMap[signTp] != null) { # #= arrSignTpMap[signTp].cmmCdNm# # }#"
                 ,editor:function(container, options) {
                      $('<input required name="signTp" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtDropDownList({
                          autoBind:false
                          ,dataTextField:"cmmCdNm"
                          ,dataValueField:"cmmCd"
                          ,dataSource:arrSignTp
                      });
                      $('<span class="k-invalid-msg" data-for="signTp"></span>').appendTo(container);
                 }
              }
             ,{field:"signUsrNm", title:"<spring:message code='crm.lbl.applyUsr' />", width:200
                 ,editor:function(container, options) {
                     $('<div class="form_search"><input id="signUserNm" type="text" data-bind="value:' + options.field + '" class="form_input" /><a id="btnUserSearch" href="javascript:userSearchPopup();">검색</a></div>')
                     .kendoAutoComplete({
                             minLength:2
                             ,template:"[#:data.usrId#]#:data.usrNm#"
                             ,dataTextField:"usrId"
                             ,dataSource:{
                                 serverFiltering:true
                                 ,transport:{
                                     read:{
                                          url:"<c:url value='/cmm/sci/user/selectUsersForSuggest.do' />"
                                          ,dataType:"json"
                                          ,type:"POST"
                                          ,contentType:"application/json"
                                     }
                                     ,parameterMap:function(options, operation)
                                     {
                                         if (operation === "read") {
                                             return kendo.stringify({
                                                 "sText":$("#signUsrNm").data("kendoAutoComplete").value()
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
                         })

                     .appendTo(container)
                     $('<span class="k-invalid-msg" data-for="signUsrNm"></span>').appendTo(container);



                 }

             }
             ,{field:"signStatCd", title:"<spring:message code='global.lbl.statNm' />", width:100
                 ,template:"# if(arrSignStatCdMap[signStatCd] != null) { # #= arrSignStatCdMap[signStatCd].cmmCdNm# # }#"
                     ,editor:function(container, options) {
                          $('<input required name="signStatCd" data-bind="value:' + options.field + '"/>')
                          .appendTo(container)
                          .kendoExtDropDownList({
                              autoBind:false
                              ,dataTextField:"cmmCdNm"
                              ,dataValueField:"cmmCd"
                              ,dataSource:arrSignStatCd
                          });
                          $('<span class="k-invalid-msg" data-for="signStatCd"></span>').appendTo(container);
                     }
             }
             ,{field:"signRsltCd", title:"<spring:message code='global.lbl.result' />", width:100
                 ,template:"# if(arrSignProcCdMap[signRsltCd] != null) { # #= arrSignProcCdMap[signRsltCd].cmmCdNm# # }#"
                     ,editor:function(container, options) {
                          $('<input required name="signRsltCd" data-bind="value:' + options.field + '"/>')
                          .appendTo(container)
                          .kendoExtDropDownList({
                              autoBind:false
                              ,dataTextField:"cmmCdNm"
                              ,dataValueField:"cmmCd"
                              ,dataSource:arrSignProcCd
                          });
                          $('<span class="k-invalid-msg" data-for="signRsltCd"></span>').appendTo(container);
                     }
             }
             ,{field:"signDt", title:"<spring:message code='global.lbl.dateTime' />", width:200
                 ,attributes:{"class":"ac tooltip-disabled"}
                 ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
             }
             ,{field:"signCont", title:"<spring:message code='crm.lbl.cont' />", width:600 ,attributes:{"class":"al"}}
         ]

    });




     //그리드 설정(결과-목표)
     $("#resultGoalGrid").kendoExtGrid({
         gridId:"G-CRM-0722-123006"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectResultGoals.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         params["sort"]         = options.sort;

                         params["sDlrCd"]       = $("#dlrCd").val();
                         params["sPltCd"]       = $("#pltCd").val();
                         params["sMakCd"]       = $("#makCd").val();

                         console.log(params);
                         return kendo.stringify(params);

                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                 model:{
                     id:"seq"
                     ,fields:{
                         rnum:{type:"number", editable:false}
                         , makCd:{type:"string", editable:false}
                         , seq:{type:"string", editable:false}
                         , targCd:{type:"string", editable:false}
                         , targNm:{type:"string", editable:false}
                         , targCntVal:{type:"number", editable:false}
                         , targRsltVal:{type:"number", editable:false}
                         , dlrCd:{type:"string"}
                         , pltCd:{type:"string"}
                     }
                 }
             }
         }
         , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
         , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
         , appendEmptyColumn:true           //빈컬럼 적용. default:false
         , enableTooltip:true               //Tooltip 적용, default:false
         ,pageable:false
         ,sortable:false
         ,filterable:false
         ,height:190
         ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"makCd", title:"<spring:message code='global.lbl.crNo' />", hidden:true}       // 캠페인코드
            ,{field:"seq", title:"<spring:message code='global.lbl.budgetCd' />", hidden:true}
            ,{field:"targCd", title:"<spring:message code='global.lbl.targ' />", hidden:true}
            ,{field:"targNm", title:"<spring:message code='global.lbl.targ' />", width:200}       // 상세내역
            ,{field:"targCntVal", title:"<spring:message code='global.lbl.targCntVal' />", width:100, attributes:{"class":"ac"}}   // 목표수치
            ,{field:"targRsltVal", title:"<spring:message code='global.lbl.result' />", width:100, attributes:{"class":"ac"}}   // 목표결과
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
            ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}                       // 사업장코드
         ]
     });
/*
     //그리드 설정(결과-직원설문결과)
     $("#resultPersonGrid").kendoExtGrid({
         gridId:"G-CRM-0722-123007"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectResultPersons.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         params["sort"]         = options.sort;

                         params["sDlrCd"]       = $("#dlrCd").val();
                         params["sPltCd"]       = $("#pltCd").val();
                         params["sMakCd"]       = $("#makCd").val();

                         console.log(params);
                         return kendo.stringify(params);

                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                 model:{
                     id:"seq"
                     ,fields:{
                         rnum:{type:"number", editable:false}
                         , makCd:{type:"string", editable:false}
                         , empNm:{type:"string", editable:false}
                         , stsfIvstDt:{type:"date", editable:false}
                         , stsfIvstScoreVal:{type:"number", editable:false}
                         , dlrCd:{type:"string"}
                         , pltCd:{type:"string"}
                     }
                 }
             }
         }
         , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
         , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
         , appendEmptyColumn:true           //빈컬럼 적용. default:false
         , enableTooltip:true               //Tooltip 적용, default:false
         ,pageable:false
         ,height:190
         ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"makCd", title:"<spring:message code='global.lbl.crNo' />", hidden:true}       // 캠페인코드
            ,{field:"empNm", title:"<spring:message code='global.lbl.name' />", width:100, attributes:{"class":"al"}
                ,template:function(dataItem){
                    var spanObj = "<a href='#' class='personEmpNm'>"+dataItem.empNm+"</a>";
                    return spanObj;
                }
            }
            ,{field:"stsfIvstDt", title:"<spring:message code='global.lbl.stsfIvstDtEx' />", width:100, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"stsfIvstScoreVal", title:"<spring:message code='global.lbl.value' />", width:100, attributes:{"class":"ac"}}   // 목표결과
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
            ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}                       // 사업장코드
         ]
     });
*/
    //그리드 설정(결과-업체평가결과)
     $("#resultCorpGrid").kendoExtGrid({
         gridId:"G-CRM-0722-123008"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectResultCorps.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         params["sort"]         = options.sort;

                         params["sDlrCd"]       = $("#dlrCd").val();
                         params["sPltCd"]       = $("#pltCd").val();
                         params["sMakCd"]       = $("#makCd").val();

                         console.log(params);
                         return kendo.stringify(params);

                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                 model:{
                     id:"seq"
                     ,fields:{
                         rnum:{type:"number", editable:false}
                         , makCd:{type:"string", editable:false}
                         , empNm:{type:"string", editable:false}
                         , stsfIvstDt:{type:"date", editable:false}
                         , stsfIvstScoreVal:{type:"number", editable:false}
                         , dlrCd:{type:"string"}
                         , pltCd:{type:"string"}
                     }
                 }
             }
         }
         , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
         , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
         , appendEmptyColumn:true           //빈컬럼 적용. default:false
         , enableTooltip:true               //Tooltip 적용, default:false
         ,pageable:false
         ,sortable:false
         ,filterable:false
         ,height:190
         ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"makCd", title:"<spring:message code='global.lbl.crNo' />", hidden:true}       // 캠페인코드
            ,{field:"empNm", title:"<spring:message code='global.lbl.name' />", width:100, attributes:{"class":"al"}
                ,template:function(dataItem){
                    var spanObj = "<a href='#' class='corpEmpNm'>"+dataItem.empNm+"</a>";
                    return spanObj;
                }
            }
            ,{field:"stsfIvstDt", title:"<spring:message code='global.lbl.stsfIvstDtEx' />", width:100, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"stsfIvstScoreVal", title:"<spring:message code='global.lbl.value' />", width:100, attributes:{"class":"ac"}}   // 목표결과
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
            ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}                       // 사업장코드
         ]
     });





     //그리드 설정(작업정보-정비용)
     $("#workGrid").kendoExtGrid({
         gridId:"G-CRM-0722-123009"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectWorks.do' />"
                 }//read
                 ,parameterMap:function(options , operation){

                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sCrNo"]      = $("#crNo").val();

                         console.log("read:"+ JSON.stringify(params));
                         return kendo.stringify(params);

                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 } //parameterMap
             }//transport
             ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number"}
                       ,crTp:{type:"string"}
                       ,crNo:{type:"string"}
                       ,crNm:{type:"string"}
                       ,crStartDt:{type:"date"}
                       ,crEndDt:{type:"date"}
                       ,creStartDt:{type:"date"}
                       ,creEndDt:{type:"date"}
                       ,saleStartDt:{type:"date"}
                       ,slaeEndDt:{type:"date"}
                       ,crEndTp:{type:"string"}
                       ,crIsaNm:{type:"string"}
                       ,pcDstinCd:{type:"string"}
                       ,lbrCd:{type:"string"}
                       ,lbrNm:{type:"string"}
                       ,cauItemCd:{type:"string"}
                       ,cauItemNm:{type:"string"}
                       ,cauCd:{type:"string"}
                       ,cauNm:{type:"string"}
                       ,phenCd:{type:"string"}
                       ,phenNm:{type:"string"}
                    } //fields
                 }//model
             }//schema
         }//dataSource
        ,autoBind:false
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        , appendEmptyColumn:false          //빈컬럼 적용. default:false
        , enableTooltip:true               //Tooltip 적용, default:false
        ,height:400
        ,editable:false
        ,scrollable:true
        ,sortable:false
        ,filterable:false
        ,columns:[
                   {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
                  ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:60, attributes:{"class":"ac"}}
                  ,{field:"pcDstinCd", title:"<spring:message code='ser.lbl.pcDstinCd' />", width:70, attributes:{"class":"ac"}}
                  ,{field:"lbrCd", title:"<spring:message code='ser.lbl.mainLbrCd' />", width:80, attributes:{"class":"ac"}}
                  ,{field:"lbrNm", title:"<spring:message code='ser.lbl.mainLbrNm' />", width:150, attributes:{"class":"al"}}
                  ,{field:"cauItemCd", title:"<spring:message code='ser.lbl.cauItemCd' />", width:90, attributes:{"class":"ac"}}
                  ,{field:"cauItemNm", title:"<spring:message code='ser.lbl.cauItemNm' />", width:150, attributes:{"class":"al"}}
                  ,{field:"cauCd", title:"<spring:message code='ser.lbl.cauCd' />", width:70, attributes:{"class":"ac"}}
                  ,{field:"cauNm", title:"<spring:message code='ser.lbl.cauNm' />", width:150, attributes:{"class":"al"}}
                  ,{field:"phenCd", title:"<spring:message code='ser.lbl.phenCd' />", width:70, attributes:{"class":"ac"}}
                  ,{field:"phenNm", title:"<spring:message code='ser.lbl.phenNm' />", width:150, attributes:{"class":"ac"}}
                 ]

     });





     //그리드 설정(VIN정보-정비용)
     $("#vinGrid").kendoExtGrid({
         gridId:"G-CRM-0722-123010"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectVins.do' />"
                 }//read
                 ,parameterMap:function(options , operation){

                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sCrNo"]      = $("#crNo").val();

                         console.log("read:"+ JSON.stringify(params));
                         return kendo.stringify(params);

                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 } //parameterMap
             }//transport
             ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number"}
                       ,vinNo:{type:"string"}
                       ,ltsModelCd:{type:"string"}
                       ,ltsModelNm:{type:"string"}
                    } //fields
                 }//model
             }//schema
         }//dataSource
        ,autoBind:false
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        , appendEmptyColumn:false          //빈컬럼 적용. default:false
        , enableTooltip:true               //Tooltip 적용, default:false
        ,scrollable:true
        ,editable:false
        ,height:400
        ,autoBind:false
        ,sortable:false
        ,filterable:false
        ,columns:[
                    {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
                   ,{field:"vinNo",title:"<spring:message code='ser.lbl.vinNo' />",width:150,attributes:{"class":"ac"}}
                   ,{field:"ltsModelCd",title:"<spring:message code='ser.lbl.ltsModelCd' />",width:100,attributes:{"class":"ac"}}
                   ,{field:"ltsModelNm",title:"<spring:message code='ser.lbl.ltsModelNm' />",width:250,attributes:{"class":"ac"}}
                  ]

     });





     //그리드 설정(공임정보-정비용)
     $("#laborGrid").kendoExtGrid({
         gridId:"G-CRM-0722-123011"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectLabors.do' />"
                 }//read
                 ,parameterMap:function(options , operation){

                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sCrNo"]      = $("#crNo").val();

                         console.log("read:"+ JSON.stringify(params));
                         return kendo.stringify(params);

                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 } //parameterMap
             }//transport
             ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum  :{type:"number"}
                       ,lbrCd :{type:"string"}
                       ,lbrNm :{type:"string"}
                       ,lbrQty:{type:"number"}
                       ,lbrHm :{type:"number"}
                       ,lbrAmt:{type:"number"}
                    } //fields
                 }//model
             }//schema
         }//dataSource
        ,autoBind:false
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        , appendEmptyColumn:false          //빈컬럼 적용. default:false
        , enableTooltip:true               //Tooltip 적용, default:false
        ,editable:false
        ,scrollable:true
        ,height:400
        ,autoBind:false
        ,sortable:false
        ,filterable:false
        ,columns:[
                   {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
                   ,{field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:50, attributes:{"class":"ac"}}
                   ,{field:"lbrNm", title:"<spring:message code='ser.lbl.lbrNm' />", width:250, attributes:{"class":"al"}}
                   ,{field:"lbrQty", title:"<spring:message code='ser.lbl.qty' />", width:50, attributes:{"class":"ar"}}
                   ,{field:"lbrHm", title:"<spring:message code='ser.lbl.lbrTime' />", width:80, attributes:{"class":"ar"}}
                   ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.lbrAmt' />", width:80, attributes:{"class":"ar"}}
                  ]

     });





     //그리드 설정(부품정보-정비용)
     $("#itemsGrid").kendoExtGrid({
         gridId:"G-CRM-0722-123012"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectItems.do' />"
                 }//read
                 ,parameterMap:function(options , operation){

                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sCrNo"]      = $("#crNo").val();

                         console.log("read:"+ JSON.stringify(params));
                         return kendo.stringify(params);

                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 } //parameterMap
             }//transport
             ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum  :{type:"number"}
                       ,lbrCd :{type:"string"}
                       ,cauItemCd :{type:"string"}
                       ,cauItemNm :{type:"string"}
                       ,ltsModelCd :{type:"string"}
                       ,ltsModelNm :{type:"string"}
                       ,itemQty:{type:"number"}
                    } //fields
                 }//model
             }//schema
         }//dataSource
        ,autoBind:false
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        , appendEmptyColumn:false          //빈컬럼 적용. default:false
        , enableTooltip:true               //Tooltip 적용, default:false
        ,scrollable:true
        ,editable:false
        ,height:400
        ,autoBind:false
        ,sortable:false
        ,filterable:false
        ,columns:[
                   {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
                   ,{field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:50, attributes:{"class":"ac"}}
                   ,{field:"cauItemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:50, attributes:{"class":"ac"}}
                   ,{field:"cauItemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:200, attributes:{"class":"al"}}
                   ,{field:"ltsModelCd", title:"<spring:message code='ser.lbl.ltsModelCd' />", width:60, attributes:{"class":"ac"}}
                   ,{field:"ltsModelNm", title:"<spring:message code='ser.lbl.ltsModelNm' />", width:100, attributes:{"class":"al"}}
                   ,{field:"itemQty", title:"<spring:message code='ser.lbl.itemQty' />", width:50, attributes:{"class":"ar"}}
                  ]

     });





     //그리드 설정(대상 딜러)
     $("#dlrGrid").kendoExtGrid({
         gridId:"G-CRM-0817-081501"
         ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/mcm/marketingCampaign/selectDlrs.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sDlrCd"]       = $("#dlrCd").val();
                         params["sPltCd"]       = $("#pltCd").val();
                         params["sMakCd"]       = $("#makCd").val();

                         console.log(params);
                         return kendo.stringify(params);

                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                 model:{
                     id:"targDlrCd"
                     ,fields:{
                         makCd:{type:"string", editable:false}
                         , flagYn:{type:"string", editable:true}
                         , targDlrCd:{type:"string", editable:false}
                         , targDlrNm:{type:"string", editable:false}
                         , targYn:{type:"string", validation:{required:true}}
                         , lbrCd:{type:"string"}
                         , dlrCd:{type:"string"}
                         , pltCd:{type:"string"}
                     }
                 }
             }
         }
         ,edit:function(e) {

         }
         ,autoBind:false
         , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
         , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         , multiSelectWithCheckbox:false    //멀티선택 적용. default:false
         , appendEmptyColumn:true           //빈컬럼 적용. default:false
         , enableTooltip:true               //Tooltip 적용, default:false
//         ,pageable:false
         ,sortable:false
         ,scrollable:true
         ,filterable:false
         ,height:400
         ,columns:[
            {field:"makCd", title:"<spring:message code='global.lbl.crNo' />", hidden:true} // 캠페인코드
            ,{
                     title:"&nbsp;"
                    ,width:45
                    ,attributes:{"class":"ac"}
                    ,template:'<input type="checkbox" #= flagYn == "Y"? \'checked="checked"\':"" # class="flagYn" data-uid="#= uid #" />'
                    ,headerTemplate:"<input type='checkbox' class='checkAll' />"
            }
            ,{field:"targDlrCd", title:"<spring:message code='crm.lbl.dlrCd' />", width:100, attributes:{"class":"ac"}}   // 딜러코드
            ,{field:"targDlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:300, attributes:{"class":"al"}}   // 딜러명
            ,{field:"targYn", title:"<spring:message code='par.lbl.targYn' />", width:100, attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="targYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:true
                        ,dataSource:['Y','N']
                        ,index:0
                    });
                    $('<span class="k-invalid-msg" data-for="targYn"></span>').appendTo(container);
                }
             } // 대상여부
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
            ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}                       // 사업장코드
         ]
     });





     /*****************************************************************************
      **************************파일업로드3:파일 다운로드  ****************************
      *******************************************************************************/
      $("#fileGrid").on("dblclick", "tr.k-state-selected", function (e) {

         var grid = $("#fileGrid").data("kendoExtGrid");
         var selectedItem = grid.dataItem(grid.select());

         if( dms.string.isNotEmpty(selectedItem) ){

             var fileDocNo = selectedItem.fileDocNo;
             var fileNo = selectedItem.fileNo;
             location.href = "<c:url value='/cmm/sci/fileUpload/selectFileDownload.do' />" + "?fileDocNo=" + fileDocNo + "&fileNo=" + fileNo;

         }

      });
     /*****************************************************************************
      **************************파일업로드3:파일 다운로드  ****************************
      *******************************************************************************/

      /* *************************************************************************
       **************************파일업로드4:그리드 kendo 스크립트 추가 ***************
       ***************************************************************************/
           // 파일 그리드 시작 //
           $("#fileGrid").kendoExtGrid({
               gridId:"G-CRM-0722-123013"
               ,dataSource:{
                   transport:{
                       read:{
                           url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                       },
                       parameterMap:function(options, operation) {
                           if (operation === "read") {

                               var params = {};

                               // 캠페인 리스트 그리드의 선택된 파일키
                               var mcdGrid = $("#mcdGrid").data("kendoExtGrid");
                               var selectedItem = mcdGrid.dataItem(mcdGrid.select());
                               if ( dms.string.isNotEmpty(selectedItem) ) {
                                   params["sFileDocNo"] = selectedItem.activeFileDocNo;
                               } else {
                                   return;
                               }

                               console.log("fileGrid:"+kendo.stringify(params));
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
              ,autoBind:false
              ,editable:false
              ,height:218
              , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
              , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
              , multiSelectWithCheckbox:true     //멀티선택 적용. default:false
              , appendEmptyColumn:true           //빈컬럼 적용. default:false
              , enableTooltip:true               //Tooltip 적용, default:false
              ,navigatable:false
              ,pageable:false
              ,sortable:false
              ,filterable:false
              ,selectable:"multiple"
              ,columns:[
                  {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />" }           // 파일명
                 ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />" }       // 파일크기
              ]
          });
          // 파일 그리드 종료 //
       /* *************************************************************************
       **************************파일업로드4:그리드 kendo 스크립트 추가 ***************
       ***************************************************************************/

       /* *************************************************************************
        **************************파일업로드5:스크립트 추가 $(document).ready 안쪽*****
        ***************************************************************************/
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

        /* *************************************************************************
         **************************파일업로드5:스크립트 추가 $(document).ready 안쪽*****
         ***************************************************************************/

});





/* *************************************************************************
 **************************파일업로드6:스크립트 추가 $(document).ready 밖 *****
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
         ,pinned:true
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

     if (dms.string.isEmpty($("#activeFileDocNo").val())) {
         $.ajax({
             url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
             dataType:"json",
             type:"get",
             async:false,
             cache:false,
             success:function(id) {
                 _that.opt["query"]["resumableSessionId"] = id;
                 $("#activeFileDocNo").val(id);                                    // 파일업로드7:업로드 완료후  마스터 테이블의 fileDocNo 를 변경해준다
//alert(id);
//console.log(id);
             }
         });
     } else {
         _that.opt["query"]["resumableSessionId"] = $("#activeFileDocNo").val();   // 파일업로드8:기존꺼에 추가할경우 fileDocNo 설정
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
 **************************파일업로드6:스크립트 추가 $(document).ready 밖 *****
 ***************************************************************************/





/**
 * 차종에 따른 모델 조회
 */
function selectGridCarlineCd(e) {
    var dataItem = this.dataItem(e.item);
    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/svo/askHelpCar/selectModel.do"
        ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
        ,async:false
    });

    console.log("selectGridCarlineCd", responseJson.data);
    modelCdDSList = responseJson.data;

    modelCdObj = [];

    if(modelCdDSList != null ){
        $.each(modelCdDSList, function(idx, obj){
            modelCdObj[obj.modelCd] = obj.modelNm;
        });
    }
};

//1 Grid- 차종의 template 정의
function bf_selectCarLine(carlineCd) {
    if(carlineCd == ""){
        return "";
    }else{
        return carLineCdObj[carlineCd];
    }
}

//2 Grid- 모델의 template 정의
function bf_selectModel(modelCd, modelNm){
    if(modelNm != ""){
        return modelNm;
    }
    if(modelCd == ""){
        return "";
    }
    return modelCdObj[modelCd];
}




/**
 * 주최에 따른 주최 Sub 조회(조회조건)
 */
function onSelectHostCdSearch(e) {

    console.log(e);
    var dataItem = this.dataItem(e.item);

    $("#sHostTeamCd").data("kendoExtDropDownList").setDataSource([]);
    $("#sHostTeamCd").data("kendoExtDropDownList").enable(true);

    if(dataItem.cmmCd == ""){
        $("#sHostTeamCd").data("kendoExtDropDownList").setDataSource([]);
        $("#sHostTeamCd").data("kendoExtDropDownList").enable(false);
        return false;
    }

    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/crm/mcm/marketingCampaign/selectHostCdList.do"
        ,data:JSON.stringify({"cmmCd":dataItem.cmmCd})
        ,async:false
    });

    $("#sHostTeamCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

};

/**
 * 주최에 따른 주최 Sub 조회(입력부)
 */
function onSelectHostCd(e) {

    console.log(e);
    var dataItem = this.dataItem(e.item);

    $("#hostTeamCd").data("kendoExtDropDownList").setDataSource([]);
    $("#hostTeamCd").data("kendoExtDropDownList").enable(true);

    if(dataItem.cmmCd == ""){
        $("#hostTeamCd").data("kendoExtDropDownList").setDataSource([]);
        $("#hostTeamCd").data("kendoExtDropDownList").enable(false);
        return false;
    }

    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/crm/mcm/marketingCampaign/selectHostCdList.do"
        ,data:JSON.stringify({"cmmCd":dataItem.cmmCd})
        ,async:false
    });

    $("#hostTeamCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

};

/**
 * 주최에 따른 주최 Sub 조회(값 셋팅시에만 사용함)
 */
function onSelectHostCdSet(value) {

  var responseJson = dms.ajax.getJson({
      url:_contextPath + "/crm/mcm/marketingCampaign/selectHostCdList.do"
      ,data:JSON.stringify({"cmmCd":value})
      ,async:false
  });

  $("#hostTeamCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

};



/**
* 유형에 따른 유형 Sub 조회(조회조건)
*/
function onSelectMakTpCdSearch(e) {

  console.log(e);
   var dataItem = this.dataItem(e.item);

   $("#sMakSubTpCd").data("kendoExtDropDownList").setDataSource([]);
   $("#sMakSubTpCd").data("kendoExtDropDownList").enable(true);

   if(dataItem.cmmCd == ""){
       $("#sMakSubTpCd").data("kendoExtDropDownList").setDataSource([]);
       $("#sMakSubTpCd").data("kendoExtDropDownList").enable(false);
       return false;
   }

   var responseJson = dms.ajax.getJson({
       url:_contextPath + "/crm/mcm/marketingCampaign/selectMakTpCdList.do"
       ,data:JSON.stringify({"cmmCd":dataItem.cmmCd})
       ,async:false
   });

   $("#sMakSubTpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

};

/**
* 유형에 따른 유형 Sub 조회(입력부)
*/
function onSelectMakTpCd(e) {

   console.log(e);
    var dataItem = this.dataItem(e.item);

    $("#makSubTpCd").data("kendoExtDropDownList").setDataSource([]);
    $("#makSubTpCd").data("kendoExtDropDownList").enable(true);

    if(dataItem.cmmCd == ""){
        $("#makSubTpCd").data("kendoExtDropDownList").setDataSource([]);
        $("#makSubTpCd").data("kendoExtDropDownList").enable(false);
        return false;
    }

    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/crm/mcm/marketingCampaign/selectMakTpCdList.do"
        ,data:JSON.stringify({"cmmCd":dataItem.cmmCd})
        ,async:false
    });

    $("#makSubTpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

};

/**
* 유형에 따른 유형 Sub 조회(값 셋팅시에만 사용함)
*/
function onSelectMakTpCdSet(value) {

    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/crm/mcm/marketingCampaign/selectMakTpCdList.do"
        ,data:JSON.stringify({"cmmCd":value})
        ,async:false
    });

    $("#makSubTpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

};

//대상 딜러 그리드 체크박스 체크 이벤트
$("#dlrGrid").on("click", "input.flagYn", function(e){

    var dlrGrid = $("#dlrGrid").data("kendoExtGrid");
    var uid = $(this).data("uid");

    if($(this).prop("checked") == true){
        dlrGrid.dataSource.getByUid(uid).set("flagYn", "Y");
    }else{
        dlrGrid.dataSource.getByUid(uid).set("flagYn", "N");
    }

});

//대상 딜러 그리드 전체선택/해제 이벤트
$("#dlrGrid").on("click", "input.checkAll", function(e){

    var dlrGrid = $("#dlrGrid").data("kendoExtGrid");

    if($(this).prop("checked") == true){
        $("input.flagYn", "#dlrGrid").prop("checked", true);
        $.each(dlrGrid.dataSource.view(), function(idx, dataItem){
            dataItem.set("flagYn", "Y");
        });
    }else{
        $("input.flagYn", "#dlrGrid").prop("checked", false);
        $.each(dlrGrid.dataSource.view(), function(idx, dataItem){
            dataItem.set("flagYn", "N");
        });
    }

});

</script>
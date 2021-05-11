<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

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
                        <button type="button" class="btn_m" id="btnCopyVehic"><spring:message code="global.btn.copy" /></button> <!-- 복사 -->
                    </dms:access>
                    <dms:access viewId="VIEW-I-12532" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
                    </dms:access>
                    <dms:access viewId="VIEW-I-12531" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_new" id="btnAddVehic" ><spring:message code="global.btn.new" /></button> <!-- 신규  -->
                    </dms:access>
                    <dms:access viewId="VIEW-I-12533" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_modify" id="btnViewDetail" ><spring:message code='global.btn.update' /><!-- 상세 --></button>
                    </dms:access>
                    <!-- 인쇄 20170426 DCS에서 캠페인 출력물은 빼라 -->
                    <dms:access viewId="VIEW-I-12949" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_excel" id="btnCtlCamMgmtExcelExp" ><spring:message code='global.btn.excelExport' /><!-- 엑셀다운로드 Excel下?--></button>
                    </dms:access>
                    </div>
                </div>

                <div class="table_form" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:17%;">
                            <col style="width:8%;">
                            <col style="width:15%;">
                            <col style="width:8%;">
                            <col style="width:15%;">
                            <col style="width:8%;">
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
                                    <input id="sHostCd" class="form_comboBox" style="width:100%"/>
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
                            </tr>
                            <tr>
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
                                <th scope="row"><spring:message code="global.lbl.statNm" /><!-- 상태 --></th>
                                <td>
                                    <input id="sStatCd" class="form_comboBox" style="width:100%" />
                                </td>
                                <th></th>
                                <td></td>
                                <th></th>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="mcdGrid" class="resizable_grid"></div>
                </div>

                <section id="window" class="pop_wrap">
                <!-- 탭메뉴 전체 영역 -->
                <div id="tabstrip" class="tab_area">
                    <!-- 탭메뉴 -->
                    <ul>
                        <li id="defaultInfoTab" class="k-state-active"><spring:message code="global.title.defaultInfo" /><!-- 기본정보 0 --></li>
                        <li id="planTab"><spring:message code="global.title.plan" /><!-- 방안 1 --></li>
                        <li id="goalTab"><spring:message code="global.title.goal" /><!-- 목표 2 --></li>
                        <li id="targetTab"><spring:message code="global.title.target" /><!-- 대상 3 --></li>
                        <li id="budgetTab"><spring:message code="crm.lbl.budget" /><!-- 예산 4--></li>
                        <li id="bhmcLbrTab"><spring:message code="ser.lbl.labor" /><!-- 제조사 : 공임  5 workTab --></li>
                        <li id="bhmcItemTab"><spring:message code="ser.lbl.chgItem" /><!-- 제조사 : 부품  6 itemsTab--></li>
                        <li id="vinTab"><spring:message code="ser.title.vinInfo" /><!-- VIN정보 9 --></li>
                        <li id="progressTab"><spring:message code="crm.title.sign" /><!-- 결재 10--></li>
                        <li id="resultTab"><spring:message code="global.title.result" /><!-- 결과 11--></li>
                        <li id="dlrTab"><spring:message code="crm.title.targetDlr" /><!-- 대상 딜러 --></li>
                    </ul>
                    <div id="defaultInfoTabDiv" class="mt0">
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="global.title.defaultInfo" /></h2><!-- 기본정보 -->
                            <div class="btn_right">
                            <dms:access viewId="VIEW-I-12536" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s" id="btnSaveVehic" ><spring:message code="global.btn.save" /></button> <!-- 저장 -->
                            </dms:access>
                            <dms:access viewId="VIEW-I-12535" hasPermission="${dms:getPermissionMask('READ')}">
                                <button type="button" class="btn_s" id="btnCancelVehic"><spring:message code="global.btn.del" /></button> <!-- 삭제 -->
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
                                                <input id="delYn" name="delYn" type="hidden" value="N">
                                                <input id="crNo"  name="crNo"  type="hidden">
                                                <input id="docId" name="docId" type="hidden">
                                                <input id="makCd" name="makCd" value="" readonly class="form_input form_readonly" style="width:100%">
                                            </td>
                                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.hostCd" /></span> <!-- 주최 --></th>
                                            <td class="required_area">
                                                <div>
                                                    <div>
                                                        <input id="hostCd" name="hostCd" value="" class="form_comboBox" />
                                                    </div>
                                                </div>
                                            </td>
                                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.type" /></span> <!-- 유형 --></th>
                                            <td class="required_area">
                                                <div class="form_float">
                                                    <div class="form_left" >
                                                        <input id="makTpCd" name="makTpCd" value="" class="form_comboBox" />
                                                        <input type="hidden" id="befMakTpCd" name="befMakTpCd" />
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
                                            <th scope="row"><spring:message code="crm.lbl.period" /><!-- 일수 --></th>
                                            <td>
                                                <input id="prid" name="prid" value="" disabled="disabled" class="form_input form_readonly ar" style="width:90%"> <spring:message code="crm.lbl.day" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.aapCmpNm" /><!-- 대행업체 --></th>
                                            <td colspan="3">
                                                <input id="placeNm" name="placeNm" type="hidden">
                                                <input id="rcpeAutoYn" name="rcpeAutoYn" type="hidden">
                                                <input id="aapCmpNm" name="aapCmpNm" value="" class="form_input" style="width:100%" onKeyUp="txtLimit(this, '50');">
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.budgetAmt" /><!-- 예산 --></th>
                                            <td>
                                                <input id="budgetAmt" name="budgetAmt" disabled="disabled" class="form_numeric form_readonly ar" maxlength="10" style="width:100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.statNm" /></span><!-- 상태 --></th>
                                            <td class="required_area">
                                                <input id="statCd" name="statCd" value="" class="form_comboBox" style="width:100%" />
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.targCustCnt" /><!-- 목표인수 --></th>
                                            <td>
                                                <input type="number" id="targCustCnt" name="targCustCnt" class="form_numeric ar" maxlength="10" style="width:100%" />
                                            </td>
                                            <th scope="row" colspan="2"></th>
                                        </tr>
                                        <tr id="serviceInfo1">
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
                                        <tr id="serviceInfo2">
                                            <th scope="row"><spring:message code='ser.lbl.saleStartDt' /></th>       <!-- 판매시작일자 -->
                                            <td>
                                                <input id="saleStartDt" name="saleStartDt" class="form_datepicker ac" style="width:100%" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code='ser.lbl.saleEndDt' /></th>       <!-- 판매종료일자 -->
                                            <td>
                                                <input id="saleEndDt" name="saleEndDt" class="form_datepicker ac" style="width:100%" data-json-obj="true" />
                                            </td>
                                            <th scope="row" id="crIsaNmTxt" ><spring:message code="ser.lbl.crIsaNm" /><!-- 시행처 --></th>
                                            <td>
                                                <input id="pcDstinCd" name="pcDstinCd" type="hidden" /><!-- 승상용구분코드 -->
                                                <input id="crIsaNm" name="crIsaNm" value="" type="hidden" class="form_input" style="width:100%" onKeyUp="txtLimit(this, '20');" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.detail" /></span><!-- 설명개요 --></th>
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
                                                <th scope="row"><spring:message code="global.lbl.crNm" /><!-- 캠페인명 --></th>
                                                <td class="required_area">
                                                    <input id="activeNm" name="activeNm" disabled="disabled" class="form_input form_readonly" style="width:100%" onKeyUp="txtLimit(this, '100');">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row"><spring:message code="crm.lbl.detail" /><!-- 설명개요 --></th>
                                                <td class="required_area">
                                                    <textarea id="activeCont" name="activeCont" rows="2" cols="" disabled="disabled" class="form_textarea form_readonly" style="height:120px;" onKeyUp="txtLimit(this, '2000');"></textarea>
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
                                            <input type="hidden" id="activeFileDocNo" name="activeFileDocNo"  data-json-obj="true"/>
                                        </div>
                                    </div>
                                    <div class="table_grid">
                                        <div id="fileGrid">
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </form>
                    </div> <!-- 방안 -->
                    <div id="goalTabDiv" class="mt0">
                        <!-- 그리드 기능 버튼 시작 -->
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="global.title.goal" /></h2><!-- 목표 -->
                            <div class="btn_right">
                                <button class="btn_s" id="btnGoalAdd"><spring:message code="global.btn.rowAdd" /></button>
                                <button class="btn_s" id="btnGoalDel"><spring:message code="global.btn.rowDel" /></button>
                                <button class="btn_s" id="btnGoalSave"><spring:message code="global.btn.save" /></button>
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
                                <button type="button" class="btn_s" id="btnTargetSave" ><spring:message code='crm.btn.rcpeExtrAdd' /><!-- 조건저장 --></button>
                                <button type="button" class="btn_s" id="btnTargetDelete" ><spring:message code='global.btn.del' /><!-- 삭제 추출--></button>
                                <button type="button" class="btn_s" id="btnRcpeExtr" ><spring:message code='crm.btn.rcpeExtrMapping' /><!-- 추출 실행 --></button>
                                <button type="button" class="btn_s" id="btnCtlExcelExport"><spring:message code="global.btn.excelExport" /><!-- 엑셀Export --></button>
                            </div>
                        </div>
                        <div class="table_form">
                           <input id="custExtrOverWriteChk" name="custExtrOverWriteChk" type="hidden">
                           <form id="targetForm" >
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
                                            <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.custExtrAutoYn' /><!-- 고객추출자동여부 --></span></th>
                                            <td class="required_area">
                                                <input id="extrDgreCnt" name="extrDgreCnt" type="hidden">
                                                <input id="realTargetCnt" name="realTargetCnt" type="hidden">
                                                <input id="custExtrAutoYn" name="custExtrAutoYn" value="" class="form_comboBox" required style="width:100%" />
                                            </td>
                                            <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.custExtrTermNo' /><!-- 고객추출조건  --></span></th>
                                            <td class="required_area">
                                                <input id="custExtrTitleNm" name="custExtrTitleNm" type="hidden">
                                                <input id="custExtrTermNo" name="custExtrTermNo" value="" class="form_comboBox" style="width:100%; z-index:50000;" />
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
                            <div class="table_grid" style="display:none;">
                                <div id="targExcelGrid"></div>
                            </div>
                        </section>
                    </div> <!-- 대상 -->
                    <div id="budgetTabDiv" class="mt0">
                        <!-- 그리드 기능 버튼 시작 -->
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="global.title.budgetInfo" /></h2><!-- 예산(위안)정보 -->
                            <div class="btn_right">
                            <dms:access viewId="VIEW-I-12553" hasPermission="${dms:getPermissionMask('READ')}">
                                <button class="btn_s" id="btnBudgetSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                            </dms:access>
                            <dms:access viewId="VIEW-I-12552" hasPermission="${dms:getPermissionMask('READ')}">
                                <button class="btn_s" id="btnBudgetAdd"><spring:message code="global.btn.rowAdd" /><!-- 행추가 --></button>
                            </dms:access>
                            <dms:access viewId="VIEW-I-12551" hasPermission="${dms:getPermissionMask('READ')}">
                                <button class="btn_s" id="btnBudgetDel"><spring:message code="global.btn.rowDel" /><!-- 행삭제 --></button>
                            </dms:access>
                            <dms:access viewId="VIEW-I-12550" hasPermission="${dms:getPermissionMask('READ')}">
                                <button class="btn_s" id="btnBudgetExcelExport"><spring:message code="global.btn.excelExport" /><!-- 엑셀Export --></button>
                            </dms:access>
                            </div>
                        </div>
                        <!-- 그리드 기능 버튼 종료 -->

                        <div class="table_grid">
                            <div id="budgetGrid"></div>
                        </div>
                    </div> <!-- 예산 -->

                    <!-- 제조사 작업정보 -->
                    <div id="bhmcLbrTabDiv" class="mt0">
                        <div class="table_grid">
                            <div id="bhmcLbrGrid" class="mt10"></div>
                        </div>
                    </div>

                    <!-- 제조사 부품정보 -->
                    <div id="bhmcItemTabDiv" class="mt0">
                        <div class="table_grid" >
                            <div id="bhmcItemGrid" class="mt10"></div>
                        </div>
                    </div> <!-- 부품정보 -->

                    <div id="vinTabDiv" class="mt0">
                        <!-- 그리드 기능 버튼 시작 -->
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="ser.title.vinInfo" /></h2><!-- VIN정보 -->
                            <div class="btn_right">
                                <button type="button" class="btn_s" id="btnLtsModelExcelImport"><spring:message code="crm.btn.excelLtsModelUpload" /><!-- LTS MODEL 업로드 --></button>
                                <button type="button" class="btn_s" id="btnVinNoExcelImport"><spring:message code="crm.btn.excelVinUpload" /><!-- VIN 업로드 --></button>
                            </div>
                        </div>
                        <!-- 그리드 기능 버튼 종료 -->

                        <div class="table_grid">
                            <div id="vinGrid"></div>
                        </div>
                    </div> <!-- VIN정보 -->

                    <div id="progressTabDiv" class="mt0">
                        <section class="group">
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="crm.title.sign" /></h2><!-- 결재 -->
                            <div class="btn_right">
                                <button type="button" class="btn_s" id="btnEvalReq"><spring:message code="crm.btn.submitReq" /></button><!-- 제출신청 -->
                                <button type="button" class="btn_s" id="btnEval"><spring:message code="crm.btn.eval" /></button><!-- 심사 -->
                                <button type="button" class="btn_s" id="btnReject"><spring:message code="global.btn.appRollback" /></button><!-- 반려 -->
                            </div>
                        </div>
                        <div class="table_grid">
                            <input id="apprDocNo" name="apprDocNo" type="hidden"><!-- 결재문서번호 -->
                            <input id="signDocId" name="signDocId" type="hidden"><!-- 결재양식ID -->
                            <input id="signCont" name="signCont" type="hidden"><!-- 결재의견 -->
                            <div id="signLineGrid"></div>
                        </div>
                        </section>
                    </div> <!-- //결재 -->

                    <div id="resultTabDiv" class="mt0">
                        <div class="clfix">
                            <!-- 목표결과정보 -->
                            <section>
                                <div class="header_area">
                                    <h2 class="title_basic"><spring:message code="global.title.campaignResult" /></h2><!-- 캠페인 결과 -->
                                </div>
                                <div class="table_grid">
                                    <div id="resultGoalGrid"></div>
                                </div>
                            </section>
                        </div>
                        <div class="clfix">
                            <section class="left_areaStyle">
                                <div class="header_area">
                                   <h2 class="title_basic"><spring:message code="global.title.campaignPrsn" /><!-- 캠페인 책임자 의견 --></h2>
                                </div>
                                <div class="table_form">
                                    <table>
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width:100%;">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <td class="required_area">
                                                    <textarea maxlength="4000" id="prsnOpnCont" name="prsnOpnCont" rows="" cols="" disabled="disabled" class="form_textarea form_readonly" style="height:170px;"></textarea>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </section>
                            <section class="right_areaStyle">
                              <div class="header_area">
                                  <h2 class="title_basic"><spring:message code="global.lbl.file" /></h2>
                              </div>
                              <div class="table_grid">
                                <div id="fileResultGrid"></div>
                              </div>
                            </section>
                        </div>
                    </div> <!-- 결과 -->
                    <div id="dlrTabDiv" class="mt0">
                        <div class="clfix">
                            <div class="left_areaStyle" style="width:45%">
                                <div class="header_area mt5">
                                    <div class="btn_right mt10">
                                    </div>
                                </div>
                                <div class="table_grid mt10">
                                    <div id="dlrGrid"></div>
                                </div>
                            </div>
                            <ul class="promotion_btn pt_v1" style="padding-top:150px;">
                                <li><button class="btn_s btn_next" id="btnAddR"></button></li>
                                <li><button class="btn_s btn_prev" id="btnDelR"></button></li>
                            </ul>
                            <div class="right_areaStyle" style="width:45%">
                                <div class="header_area">
                                    <div class="btn_right">
                                        <button id="btnDlrSelect" class="btn_s btn_Select"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                                    </div>
                                </div>
                                <div class="table_grid" >
                                    <div id="targDlrGrid"></div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- 대상 딜러 -->
                </div>
                </section>

            </section>
      </div>
      <!-- //기본정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">

    var talkPlanSearchPopupWin;
    var targetUploadPopupWin;
    var vinUploadPopupWin;
    var selectShareStockGiItemPopupWindow;

    // 읽기전용 초기화
    function initReadOnlyForm() {

        // 캠페인번호, 주최, 일수, 예산, 시행처는 처음부터 읽기전용
        $("#makTpCd").data("kendoExtDropDownList").enable(true);
        $("#makSubTpCd").data("kendoExtDropDownList").enable(false);
        $("#makNm").attr("readOnly", false).removeClass("form_readonly");
        $("#startDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#endDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#aapCmpNm").attr("readOnly", false).removeClass("form_readonly");
        $("#statCd").data("kendoExtDropDownList").enable(false);
        $("#targCustCnt").data("kendoExtNumericTextBox").enable(true);
        $("#makCont").attr("readOnly", false).removeClass("form_readonly");
        $("#regDt").attr("readOnly", true).addClass("form_readonly");
        $("#updtDt").attr("readOnly", true).addClass("form_readonly");
        $("#regUsrId").attr("readOnly", true).addClass("form_readonly");
        //정비인경우 form 항목 추가
        $("#creStartDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#creEndDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#saleStartDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#saleEndDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#crEndTp").data("kendoExtDropDownList").enable(true);
        //버튼읽기전용
        $("#btnSaveVehic").data("kendoButton").enable(true);//기본정보
        $("#btnCancelVehic").data("kendoButton").enable(false);
        $("#btnActiveSave").data("kendoButton").enable(true);//방안
        $("#btnTalkPlanSearch").data("kendoButton").enable(true);
        $("#fileSelect").show();
        $("#fileDelete").show();
        $("#btnGoalSave").data("kendoButton").enable(true);//목표
        $("#btnGoalAdd").data("kendoButton").enable(true);
        $("#btnGoalDel").data("kendoButton").enable(true);
        $("#btnRcpeExtr").data("kendoButton").enable(true);//대상
        $("#btnTargetSave").data("kendoButton").enable(true);
        $("#btnTargetDelete").data("kendoButton").enable(true);
        $("#btnBudgetSave").data("kendoButton").enable(true);//예산
        $("#btnBudgetAdd").data("kendoButton").enable(true);
        $("#btnBudgetDel").data("kendoButton").enable(true);
        $("#btnBudgetExcelExport").data("kendoButton").enable(true);
        $("#btnEvalReq").data("kendoButton").enable(true);
        $("#btnEval").data("kendoButton").enable(true);
        $("#btnReject").data("kendoButton").enable(true);
        $("#btnVinNoExcelImport").data("kendoButton").enable(true);//VIN정보
        $("#btnLtsModelExcelImport").data("kendoButton").enable(true);

    };

    // 값 초기화
    function resetDefualtForm(){

        $("#dlrCd").val("");
        $("#makCd").val("");
        $("#makNm").val("");
        $("#hostCd").data("kendoExtDropDownList").setDataSource(dms.data.cmmCdFilter(hostList));
        $("#hostCd").data("kendoExtDropDownList").select(1);
        $("#makTpCd").data("kendoExtDropDownList").select(0);
        $("#befMakTpCd").val("");
        $("#makSubTpCd").data("kendoExtDropDownList").setDataSource([]);
        $("#startDt").data("kendoExtMaskedDatePicker").value("");
        $("#endDt").data("kendoExtMaskedDatePicker").value("");
        $("#prid").val("");
        $("#placeNm").val("");
        $("#aapCmpNm").val("");
        $("#rcpeAutoYn").val("N");
        $("#budgetAmt").data("kendoExtNumericTextBox").value(0);     // 예산

        $("#statCd").data("kendoExtDropDownList").value("01");
        $("#targCustCnt").data("kendoExtNumericTextBox").value(0);   // 목표인수
        $("#makCont").val("");
        $("#regDt").val("");
        $("#updtDt").val("");
        $("#regUsrId").val("");
        $("#crNo").val("");
        $("#creStartDt").data("kendoExtMaskedDatePicker").value("");
        $("#creEndDt").data("kendoExtMaskedDatePicker").value("");
        $("#saleStartDt").data("kendoExtMaskedDatePicker").value("");
        $("#saleEndDt").data("kendoExtMaskedDatePicker").value("");
        $("#crEndTp").data("kendoExtDropDownList").value("N"); // 종료여부(정비용)

        $("#pcDstinCd").val("");
        $("#crIsaNm").val("");

        $("#activeNm").val("");
        $("#activeCont").val("");
        $("#talkPlan").val("");
        $("#activeFileDocNo").val("");
        $("#apprDocNo").val("");
        $("#signDocId").val("");
        $("#signCont").val("");//결재의견

        $("#prsnOpnCont").val("");
        $("#docId").val("");

        $("#fileGrid").data("kendoExtGrid").dataSource.data([]);  //파일
        $("#fileResultGrid").data("kendoExtGrid").dataSource.data([]);  //파일결과

        $("#goalGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#targetGrid").data("kendoExtGrid").dataSource._destroyed = [];

        // ###################################################### 추출주기설정 4/5 초기화 시작
        $("#extrDgreCnt").val("");
        $("#realTargetCnt").val("");
        $("#custExtrTermNo").data("kendoExtDropDownList").select(1);
        $("#dupYn").data("kendoExtDropDownList").value("Y");
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
        if($("#custExtrAutoYn").data("kendoExtDropDownList").value() == "Y"){
            cycleCheckDisFalse();
        }else{
            cycleCheckDisTrue();
        }
        // ###################################################### 추출주기설정 4/5 초기화 종료

        $("#budgetGrid").data("kendoExtGrid").dataSource._destroyed = [];

        $("#signLineGrid").data("kendoExtGrid").dataSource._destroyed = [];
        if( $("#apprDocNo").val() != null && $("#apprDocNo").val() != "" ) {
            $("#signLineGrid").data("kendoExtGrid").dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectSignLineExs.do' />";
        }else{
            $("#signLineGrid").data("kendoExtGrid").dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectDocLineExs.do' />";
        }

        $("#resultGoalGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#dlrGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#targDlrGrid").data("kendoExtGrid").dataSource._destroyed = [];

        // 정비 캠페인그리드
        $("#bhmcLbrGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#bhmcItemGrid").data("kendoExtGrid").dataSource._destroyed = [];
        $("#vinGrid").data("kendoExtGrid").dataSource._destroyed = [];

    }

    // 탭 초기화
    function initTab(selectedItem) {

        var tabStrip = $("#tabstrip").kendoExtTabStrip({animation:false}).data("kendoExtTabStrip");
        tabStrip.select(0);

        // 신규 ( 첫번째 탭 선택, 다른 기본탭은 비활성화 )
        if ( dms.string.isEmpty(selectedItem) ) {

            tabStrip.disable(tabStrip.tabGroup.children());
            tabStrip.enable(tabStrip.tabGroup.children().eq(0),true);

            //제조사 정비탭 숨기기
            $("#bhmcLbrTab").hide();
            $("#bhmcLbrTabDiv").hide();
            $("#bhmcItemTab").hide();
            $("#bhmcItemTabDiv").hide();
            $("#vinTab").hide();
            $("#vinTabDiv").hide();
            $("#serviceInfo1").hide();
            $("#serviceInfo2").hide();

        } else {

            tabStrip.enable(tabStrip.tabGroup.children(),true);

            console.log("selectedItem.hostCd : ",selectedItem.hostCd)
            console.log("selectedItem.makTpCd : ",selectedItem.makTpCd)
            // 제조사 (공인,교환부품), 딜러(정비항목,부품수령)에 따라 탭 hide or show

            if ( selectedItem.makTpCd === "03" ) {
                $("#bhmcLbrTab").show();
                $("#bhmcLbrTabDiv").show();
                $("#bhmcItemTab").show();
                $("#bhmcItemTabDiv").show();
                $("#vinTab").show();
                $("#vinTabDiv").show();
            } else {
                $("#bhmcLbrTab").hide();
                $("#bhmcLbrTabDiv").hide();
                $("#bhmcItemTab").hide();
                $("#bhmcItemTabDiv").hide();
                $("#vinTab").hide();
                $("#vinTabDiv").hide();
            };
            // 제조사 (공인,교환부품), 딜러(정비항목,부품수령)에 따라 탭 hide or show
        };

    };

    // 팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
    function viewDetail(makCd){

        var win = $("#window").data("kendoWindow");
        win.center();
        win.open();
        mode = "N";

        // 상세 조회
        if ( dms.string.isNotEmpty(makCd) ) {

            $.ajax({
                    url:"<c:url value='/crm/mcm/marketingCampaign/selectMarketingCampaignByKey.do' />"
                    ,data:JSON.stringify({"sMakCd":makCd})      //파라미터
                    ,type:'POST'                        //조회요청
                    ,dataType:'json'                  //json 응답
                    ,contentType:'application/json'   //문자열 파라미터
                    ,async:false
                    ,error:function(jqXHR,status,error){
                        win.close();
                        // {캠페인정보}을(를) 확인하여 주세요.
                        dms.notification.warning("<spring:message code='crm.info.campaignInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                        return;
                    }
            }).done(function(selectedItem) {

                if ( dms.string.isNotEmpty(selectedItem.makCd) ) {

                    mode = "U";

                    initTab(selectedItem);
                    initReadOnlyForm();

                    $("#dlrCd").val(selectedItem.dlrCd);
                    $("#makNm").val(selectedItem.makNm);    // 캠페인명
                    $("#makCd").val(selectedItem.makCd);
                    $("#statCd").data("kendoExtDropDownList").value(selectedItem.statCd);
                    $("#hostCd").data("kendoExtDropDownList").setDataSource(hostList);
                    $("#hostCd").data("kendoExtDropDownList").value(selectedItem.hostCd);
                    $("#makTpCd").data("kendoExtDropDownList").value(selectedItem.makTpCd);
                    $("#befMakTpCd").val(selectedItem.makTpCd);
                    onSelectMakTpCdSet(selectedItem.makTpCd);
                    $("#makSubTpCd").data("kendoExtDropDownList").value(selectedItem.makSubTpCd);
                    $("#startDt").data("kendoExtMaskedDatePicker").value(selectedItem.startDt);
                    $("#endDt").data("kendoExtMaskedDatePicker").value(selectedItem.endDt);
                    $("#prid").val(selectedItem.prid);
                    $("#placeNm").val(selectedItem.placeNm);
                    $("#rcpeAutoYn").val(selectedItem.rcpeAutoYn);
                    $("#aapCmpNm").val(selectedItem.aapCmpNm);
                    $("#budgetAmt").data("kendoExtNumericTextBox").value(selectedItem.budgetAmt);
                    $("#targCustCnt").data("kendoExtNumericTextBox").value(selectedItem.targCustCnt);
                    $("#makCont").val(selectedItem.makCont);
                    $("#regDt").val(selectedItem.regDt);
                    $("#updtDt").val(selectedItem.updtDt);
                    $("#regUsrId").val(selectedItem.regUsrId);
                    $("#crNo").val(selectedItem.makCd);
                    $("#creStartDt").data("kendoExtMaskedDatePicker").value(selectedItem.creStartDt);
                    $("#creEndDt").data("kendoExtMaskedDatePicker").value(selectedItem.creEndDt);
                    $("#saleStartDt").data("kendoExtMaskedDatePicker").value(selectedItem.saleStartDt);
                    $("#saleEndDt").data("kendoExtMaskedDatePicker").value(selectedItem.saleEndDt);
                    $("#crEndTp").data("kendoExtDropDownList").value(selectedItem.crEndTp);
                    $("#pcDstinCd").val(selectedItem.pcDstinCd);
                    $("#crIsaNm").val(selectedItem.crIsaNm);
                    $("#activeNm").val(selectedItem.makNm);// 캠페인명
                    $("#activeCont").val(selectedItem.makCont);// 개요설명
                    $("#talkPlan").val(selectedItem.talkPlan);//화술방안
                    $("#activeFileDocNo").val(selectedItem.activeFileDocNo);//파일키
                    $("#apprDocNo").val(selectedItem.apprDocNo);// 결재문서번호
                    $("#signDocId").val(selectedItem.signDocId);// 결재양식ID

                    // show : 계획중(01) / 심사반려(04) / 취소(05)
                    if ( selectedItem.statCd !== "02" && selectedItem.statCd !== "03" && selectedItem.statCd !== "06" ) {

                        $("#btnCancelVehic").data("kendoButton").enable(true);

                        if(selectedItem.makTpCd !== "03"){//정비
                            $("#btnVinNoExcelImport").data("kendoButton").enable(false);
                            $("#btnLtsModelExcelImport").data("kendoButton").enable(false);
                        };

                    // hide : 심사중(02) / 활동중(03) / 활동완료(06)
                    } else {

                        $("#btnCancelVehic").data("kendoButton").enable(false);
                        $("#btnActiveSave").data("kendoButton").enable(false);
                        $("#fileSelect").hide();
                        $("#fileDelete").hide();
                        $("#btnGoalSave").data("kendoButton").enable(false);
                        $("#btnGoalAdd").data("kendoButton").enable(false);
                        $("#btnGoalDel").data("kendoButton").enable(false);
                        $("#btnRcpeExtr").data("kendoButton").enable(false);
                        $("#btnTargetSave").data("kendoButton").enable(false);
                        $("#btnTargetDelete").data("kendoButton").enable(false);
                        $("#btnBudgetSave").data("kendoButton").enable(false);
                        $("#btnBudgetAdd").data("kendoButton").enable(false);
                        $("#btnBudgetDel").data("kendoButton").enable(false);
                        $("#btnVinNoExcelImport").data("kendoButton").enable(false);
                        $("#btnLtsModelExcelImport").data("kendoButton").enable(false);
                        $("#makTpCd").data("kendoExtDropDownList").enable(false);
                        $("#makSubTpCd").data("kendoExtDropDownList").enable(false);
                        $("#makNm").attr("readOnly", true).addClass("form_readonly");
                        $("#startDt").data("kendoExtMaskedDatePicker").enable(false);
                        if (selectedItem.hostCd == "01") {
                            $("#btnSaveVehic").data("kendoButton").enable(false);
                            $("#endDt").data("kendoExtMaskedDatePicker").enable(false);
                        }
                        $("#aapCmpNm").attr("readOnly", true).addClass("form_readonly");
                        $("#targCustCnt").data("kendoExtNumericTextBox").enable(false);
                        $("#makCont").attr("readOnly", true).addClass("form_readonly");
                        $("#creStartDt").data("kendoExtMaskedDatePicker").enable(false);
                        $("#creEndDt").data("kendoExtMaskedDatePicker").enable(false);
                        $("#saleStartDt").data("kendoExtMaskedDatePicker").enable(false);
                        $("#saleEndDt").data("kendoExtMaskedDatePicker").enable(false);
                        $("#crEndTp").data("kendoExtDropDownList").enable(false);
                        $("#crIsaNm").attr("readOnly", true).addClass("form_readonly");

                    };

                } else {
                    // makCd로 조회후 조회 결과가 없을경우
                    win.close();
                    // {캠페인정보}을(를) 확인하여 주세요.
                    dms.notification.warning("<spring:message code='crm.info.campaignInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    return;

                };

            });

        };

    };

    var isGridReload = false      // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
      , resultKey                 // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
    ;
    var hostList     = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var makTpList    = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var makTpDenySerList    = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var makSubTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var statList     = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var lbrList      = [{"lbrCd":"", "lbrNm":""}];
    var lbrMap       = [];

    <c:forEach var="obj" items="${hostList}">
        hostList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${makTpList}">
        makTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        <c:if test="${obj.cmmCd != '03'}">
          makTpDenySerList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:if>
    </c:forEach>

    <c:forEach var="obj" items="${makSubTpList}">
        makSubTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${statList}">
        statList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var statMap = dms.data.arrayToMap(statList, function(obj){ return obj.cmmCd; });


    //고객추출
    var targExtractDupMap = []; //고객추출조건번호
    targExtractDupMap['Y'] = '否';
    targExtractDupMap['N'] = '是';

    //결재 결과 처리코드  Array
    var arrSignProcCd = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${arrSignProcCd}">
    arrSignProcCd.push({"cmmCd":"${obj.cmmCd}","cmmCdNm":"${obj.cmmCdNm}"});
    </c:forEach>
    var arrSignProcCdMap = dms.data.arrayToMap(arrSignProcCd, function(obj){ return obj.cmmCd; });

    //##################### 정비 코드 #####################
    //공통코드:임률정보
    var rateList = [];
    <c:forEach var ="obj" items="${rateDs}">
        rateList.push({rpirTp:"${obj.rpirTp}", rpir01:"${obj.gnlRteRate}", rpir02:"${obj.wartRteRate}", rpir03:"${obj.incRteRate}", rpir04:"${obj.intRteRate}", rpir05:"${obj.rwrkRteRate}"});
    </c:forEach>

    //공통코드:정비유형(수리유형)
    var lbrTpCdList  = []; //기본 수리유형
    <c:forEach var="obj" items="${lbrTpCdList}">
      lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd;});

     // 정비유형(수리유형)
    lbrTpCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(lbrTpCdArr[val] != undefined)
            returnVal = lbrTpCdArr[val].cmmCdNm;
        }
        return returnVal;
    };

    /** 캠페인 유형 **/
    var crTpList = [];
    <c:forEach var="obj" items="${campaignDs}">
        crTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var crTpMap = dms.data.arrayToMap(crTpList, function(obj){return obj.cmmCd;});
    crTpCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(crTpMap[val] != undefined)
            returnVal = crTpMap[val].cmmCdNm;
        }
        return returnVal;
    };

    setKendoDate = function( dtValue){
        return kendo.toString(kendo.parseDate(dtValue),"<dms:configValue code='dateFormat' />");
    };
    //##################### 정비 코드 #####################

    //고객 추출주기의 버튼을 잠근다.
    function cycleCheckDisTrue(){
        $("#btnCycleDay").prop("disabled",true);
        $("#btnCycleWeek").prop("disabled",true);
        $("#btnCycleSelect").prop("disabled",true);
        $("#cycleDatepicker").prop("disabled",true);
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
    }

    var mode = "N";

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
        }
    }

    //검색조건:캠페인 일자 시작일-종료일 날짜 비교
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

        $("#budgetAmt").val(budgetGridBudgetAmtSum);
    }

    //캠페인 마스터 그리드 - 참여인력 조회 팝업
    $(document).on("click", ".popTargExtractList", function(e){

        var grid = $("#mcdGrid").data("kendoExtGrid"),
        row = $(e.target).closest("tr");
        var dataItem = grid.dataItem(row);

        targExtractSearchPopupWin = dms.window.popup({
            windowId:"targExtractSearchPopupWin"
            ,title:"<spring:message code='crm.title.rcpeList'/>"   // 대상자 목록
            ,height:540
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

    //대상자 그리드 - 대상자수 조회 팝업
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

    //고객링크
    $(document).on("click", ".linkCustExtrTermNo", function(e){

        var grid = $("#targetGrid").data("kendoExtGrid"),
        row = $(e.target).closest("tr");
        var dataItem = grid.dataItem(row);

        window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.crmTargExtractDetail' />", "<c:url value='/crm/cmm/crmTargExtract/selectCrmTargExtractDetailMain.do' />?sDlrCd="+dataItem.dlrCd+"&sCustExtrTermNo="+dataItem.custExtrTermNo); // RO Main
    });

    // 고객추출조건(입력부). 필터를 지정하면 저장후 value 선택시 버그 있음. 따라서 함수로 만들어서 저장후 드롭다운리스트를 다시 드려줌.
    $("#custExtrTermNo").kendoExtDropDownList({
            dataSource: {
                transport: {
                    read: {
                        url : "<c:url value='/crm/mcm/marketingCampaign/selectTargExtractList.do'/>"
                        , type: "POST"
                        , dataType: "json"
                    }
                },
                schema: {
                    model: {
                        fields: {
                            custExtrTermNm: { type: "string" },
                            custExtrTermNo: { type: "string" }
                        }
                    }
                }
            }
            , dataTextField:"custExtrTermNm"
            , dataValueField:"custExtrTermNo"
            , open: function(e) {
                var custExtrTermDS = $("#custExtrTermNo").data("kendoExtDropDownList").dataSource;
                custExtrTermDS.read();
            }
            , optionLabel:" "
            , index:0
            , filter:"contains"
            , valuePrimitive: true
    });

    // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
    $("#mcdGrid").on("dblclick", "tr.k-state-selected", function (e) {
        var gridId = e.delegateTarget.id
          , grid = $("#"+gridId+"").data("kendoExtGrid")
          , selectedItem = grid.dataItem(grid.select())
        ;
        viewDetail(selectedItem.makCd);

    });

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

        $("#weekSelect").hide();// 요일 선택 체크박스 영역 초기화
        $("#cycleDtTxtArea").hide();// 날짜 선택 텍스트 박스
        $("#custExtrCycleTp").val("");// 버튼 값 초기화
        $("#btnCycleDay").removeClass("btn_active");    // 버튼 활성화 클래스 초기화
        $("#btnCycleWeek").removeClass("btn_active");   // 버튼 활성화 클래스 초기화
        $("#btnCycleSelect").removeClass("btn_active"); // 버튼 활성화 클래스 초기화

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

    //유형에 따른 유형 Sub 조회(조회조건)
    function onSelectMakTpCdSearch(e) {

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

    //유형에 따른 유형 Sub 조회(입력부)
    function onSelectMakTpCd(e) {
        var dataItem = this.dataItem(e.item);
        onSelectMakTpCdSet(dataItem.cmmCd);
    };

    //유형에 따른 유형 Sub 조회(값 셋팅시에만 사용함)
    function onSelectMakTpCdSet(value) {

        console.log("value : ",value)

        var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
        var makCd = $("#makCd").val();
        var statCd = $("#statCd").data("kendoExtDropDownList").value();
        var hostCd = $("#hostCd").data("kendoExtDropDownList").value();

        // 딜러 > 정비 인경우 시행처 삭제
        if ( hostCd === "01" ) {
            $("#crIsaNmTxt").removeClass("hidden");
            $("#crIsaNm").removeClass("hidden");
        } else if ( hostCd === "02"){
            $("#crIsaNmTxt").addClass("hidden");
            $("#crIsaNm").addClass("hidden");
        };
        if(value == "03"){
            $("#serviceInfo1").show();
            $("#serviceInfo2").show();
        }else{
            $("#serviceInfo1").hide();
            $("#serviceInfo2").hide();
        }
        if(value == ''){
            $("#makSubTpCd").data("kendoExtDropDownList").setDataSource([]);
            $("#makSubTpCd").data("kendoExtDropDownList").enable(false);
        }else{
            $("#makSubTpCd").data("kendoExtDropDownList").setDataSource([]);
            if (statCd === '02' || statCd === '03'  || statCd === '06' ){
                $("#makSubTpCd").data("kendoExtDropDownList").enable(false);
            } else {
                $("#makSubTpCd").data("kendoExtDropDownList").enable(true);
            }

            var responseJson = dms.ajax.getJson({
                url:_contextPath + "/crm/mcm/marketingCampaign/selectMakTpCdList.do"
                ,data:JSON.stringify({"cmmCd":value})
                ,async:false
            });
            $("#makSubTpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    };

    //직무명 조회
    function fn_getTaskNm(usrId) {

        var responseRlt;
        var param = {};
        param["sUsrId"] = usrId;

        $.ajax({
            url:"<c:url value='/crm/mcm/marketingCampaign/selectUsersForTaskName.do' />"
           ,data:kendo.stringify(param)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,async:false
           ,success:function(result) {
               responseRlt = result;
           }
           ,error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }
        });

        return responseRlt;

    };

    //대상자자동추출 상태 체크
    function custExtrAutoYn(val){
        var targetGrid = $("#targetGrid").data("kendoExtGrid");
        var evalDs = targetGrid.dataSource;
        var iRowCnt = evalDs.total();
        var custExtrAutoYn;

        if (iRowCnt > 0) {
            $.each(targetGrid.dataSource.view(), function(idx, dataItem){
                custExtrAutoYn = dataItem.custExtrAutoYn;
                console.log(dataItem);
                if (val == "N"){    // N 대상자자동추출
                    if (val != custExtrAutoYn) {
                     // 대상자자동추출조건이 'Y'로 된 추출이 있습니다.
                        $("#custExtrAutoYn").data("kendoExtDropDownList").value(" ");
                        dms.notification.info("<spring:message code='crm.info.alreadyCustExtrAutoY'/>");
                        return false;
                    }
                } else if(val == "Y") {  // Y 대상자자동추출
                    if (val != custExtrAutoYn) {
                        // 대상자자동추출조건이 'N'으로 된 추출이 있습니다.
                        $("#custExtrAutoYn").data("kendoExtDropDownList").value(" ");
                        dms.notification.info("<spring:message code='crm.info.alreadyCustExtrAutoN'/>");
                        return false;
                    }
                }
            });
        }
    }

    function gridCommonParams() {
        // 그리드 상세 조회 및 엑셀export 수량 확인을 위한 공통 param
        var params = {};

        params["sMakNm"] = $("#sMakNm").val();
        params["sMakCd"] = $("#sMakCd").val();
        params["sHostCd"] = $("#sHostCd").val();
        params["sMakTpCd"] = $("#sMakTpCd").val();
        params["sMakSubTpCd"] = $("#sMakSubTpCd").val();
        params["sStatCd"] = $("#sStatCd").val();
        params["sStartDt"] = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
        params["sEndDt"] = $("#sEndDt").data("kendoExtMaskedDatePicker").value();

        return params;

    };

    // 추가 시, targDlrGrid에  데이터가 존재 유무 체크.
    function isTargetModelGrid(dlrCd){
        var flag = false;
        var targDlrGrid = $('#targDlrGrid').data('kendoExtGrid');
        var rows = targDlrGrid.tbody.find("tr");

        rows.each(function(index, row){
            var data = targDlrGrid.dataItem(row);

            if(dlrCd == data.targDlrCd){
                flag = true;
            }
        });
        return flag;
    };

    $(document).ready(function() {

        // 탭 선택시 이벤트
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            , select:function(e) {

                var selectTabId = e.item.id;

                var dlrCd = $("#dlrCd").val();
                var makCd = $("#makCd").val();
                var hostCd = $("#hostCd").val();

                if ( dms.string.isNotEmpty(makCd) ) {

                    mode = "U";

                    if (selectTabId == "defaultInfoTab") {

                        // 딜러 > 정비 인경우 시행처 삭제
                        if ( hostCd === "01" ) {
                            $("#crIsaNmTxt").removeClass("hidden");
                            $("#crIsaNm").removeClass("hidden");
                        } else if ( hostCd === "02"){
                            $("#crIsaNmTxt").addClass("hidden");
                            $("#crIsaNm").addClass("hidden");
                        };

                    } else if (selectTabId == "planTab"){
                        $("#fileGrid").data("kendoExtGrid").dataSource.read();//파일 그리드 조회
                    } else if (selectTabId == "goalTab") {
                        // 목표 그리드 조회
                        $("#goalGrid").data("kendoExtGrid").dataSource.page(1);
                    } else if (selectTabId == "targetTab") {

                        $("#extrDgreCnt").val("");
                        $("#realTargetCnt").val("");
                        if($("#custExtrAutoYn").data("kendoExtDropDownList").value() == "Y"){
                            cycleCheckDisFalse();
                        }else{
                            cycleCheckDisTrue();
                        }
                        // 대상자 그리드 조회
                        var grid = $("#targetGrid").data("kendoExtGrid").dataSource.page(1);
                    } else if (selectTabId == "budgetTab") {
                        // 예산 그리드 조회
                        $("#budgetGrid").data("kendoExtGrid").dataSource.page(1);
                    } else if (selectTabId == "progressTab") {
                        // 결재 그리드 조회
                        var grid = $("#signLineGrid").data("kendoExtGrid");
                        if( $("#apprDocNo").val() != null && $("#apprDocNo").val() != "" ) {
                            grid.dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectSignLineExs.do' />";
                        }else{
                            grid.dataSource.transport.options.read.url = "<c:url value='/crm/mcm/marketingCampaign/selectDocLineExs.do' />";
                        }
                        grid.dataSource.page(1);
                        $("#signCont").val("");

                    } else if (selectTabId == "resultTab") {

                        // 결과-목표 그리드 조회
                        $("#resultGoalGrid").data("kendoExtGrid").dataSource.page(1);

                        // 결과-담당자 의견 조회
                        $.ajax({
                            url:"<c:url value='/crm/mcm/campaignResult/selectPrsnContByKey.do' />"
                            ,data:JSON.stringify({"sDlrCd":dlrCd, "sMakCd":makCd})
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,error:function(jqXHR,status,error) {
                                $("#prsnOpnCont").val("");
                                $("#docId").val("");
                                $("#fileResultGrid").data("kendoExtGrid").dataSource.data([]);  // 첨부파일
                            }
                            ,success:function(jqXHR, textStatus) {
                                console.log(jqXHR);
                                $("#prsnOpnCont").val(jqXHR.prsnOpnCont);
                                $("#docId").val(jqXHR.docId);
                                if (dms.string.isNotEmpty(jqXHR.docId)) {
                                    $("#fileResultGrid").data("kendoExtGrid").dataSource.page(1);
                                };
                            }
                        });

                    } else if (selectTabId == "bhmcLbrTab") {   //제조사 작업정보(정비용) 그리드 조회
                        var grid = $("#bhmcLbrGrid").data("kendoExtGrid").dataSource.page(1);
                    } else if (selectTabId == "bhmcItemTab") {  // 제조사 부품정보(정비용) 그리드 조회
                        $("#bhmcItemGrid").data("kendoExtGrid").dataSource.page(1);
                    } else if (selectTabId == "vinTab") {       //VIN정보(정비용) 그리드 조회
                        $("#vinGrid").data("kendoExtGrid").dataSource.page(1);
                    } else if (selectTabId == "dlrTab") {       //대상딜러  그리드 조회
                        $("#dlrGrid").data("kendoExtGrid").dataSource.page(1);
                        $("#targDlrGrid").data("kendoExtGrid").dataSource.page(1);
                    };

                } else {
                    mode = "N";
                }
            }
        });

        $("#window").kendoWindow({
            animation:false
            ,draggable:true
            ,modal:false
            ,resizable:false
            ,visible:false
            ,title:"<spring:message code='crm.title.campaignInfo' />"
            ,width:"950px"
            ,height:"500px"
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
//     $("#sStartDt").on('change', {from:$("#sStartDt"), to:$("#sEndDt")}, fnChkSearchDate);   // 시작일은 종료일보다 클수가 없다.
//     $("#sEndDt").on('change', {from:$("#sStartDt"), to:$("#sEndDt")}, fnChkSearchDate);     // 시작일은 종료일보다 클수가 없다.
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
        ,dataValueField:"cmmCd"
        ,dataSource:hostList
    });
    // 유형.   makTpList
    $("#sMakTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:makTpList
        , select:onSelectMakTpCdSearch
    });
    // 유형상세.   makSubTpList
    $("#sMakSubTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "  // 선택
        , enable:false
    });
    // 상태.   statList
    $("#sStatCd").kendoExtDropDownList({
        dataSource:dms.data.cmmCdFilter(statList)
        ,dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , index:1
    });
    // 주최(입력부).   hostList
    $("#hostCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:hostList
//         , open: function(e) {
//             $("#hostCd").data("kendoExtDropDownList").setDataSource(dms.data.cmmCdFilter(hostList));
//         }
//         , close: function(e) {
//             $("#hostCd").data("kendoExtDropDownList").setDataSource(hostList);
//         }
        ,enable:false
    });
    // 유형(입력부).   makTpList
    $("#makTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:makTpDenySerList
        , select:onSelectMakTpCd
        , open: function(e) {
            // 유형 입력시 정비는 제외
            $("#makTpCd").data("kendoExtDropDownList").setDataSource(makTpDenySerList);
        }
    });
    // 유형상세(입력부).   makSubTpList
    $("#makSubTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "  // 선택
        , enable:false
    });
    // 상태(입력부).   statList
    $("#statCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
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
        //,autoBind:false
        , optionLabel:" "
        , index:0
        , change:function(e){
            var dataItem = this.dataItem(e.item);
            if(dataItem == "Y"){
                custExtrAutoYn(dataItem);
                cycleCheckDisFalse();
                $("#dupYn").data("kendoExtDropDownList").value(" ");
                $("#dupYn").data("kendoExtDropDownList").enable(true);
            }else{
                custExtrAutoYn(dataItem);
                cycleCheckDisTrue();
                $("#dupYn").data("kendoExtDropDownList").value("Y");
                $("#dupYn").data("kendoExtDropDownList").enable(false);
            }
        }
    });
    // 중복여부(입력부).
    $("#dupYn").kendoExtDropDownList({
        dataTextField: "text"
        ,dataValueField: "value"
        ,dataSource:[{value:'Y', text:'否'},{value:'N',text:'是'}]
        ,autoBind:false
        ,index:0
    });


    //메인 - 복사
    $("#btnCopyVehic").kendoButton({
       click:function(e){

           var grid = $('#mcdGrid').data('kendoExtGrid');
           var selectedItem = grid.dataItem(grid.select());

           if(selectedItem != null){

               var json = {};
               json.makCd = selectedItem.makCd;
               json.statCd = "01";
               json.makNm = selectedItem.makNm + "-<spring:message code='global.btn.copy'/>";
               json.hostCd = selectedItem.hostCd;

               var activeFileDocNo = selectedItem.activeFileDocNo
               if ( dms.string.isNotEmpty(activeFileDocNo) ) {
                   json.activeFileDocNo = activeFileDocNo;
               }

               if ( selectedItem.makTpCd === "03" ) {
                   //유형이 [정비]인 캠페인은 해당 화면에서 신규저장이 불가능 하므로 복사할 수 없습니다.
                   dms.notification.warning("<spring:message code='crm.info.noMakeTpCopy'/>");
                   return false;
               };

               console.log("defaultInfoForm"+JSON.stringify(json));

               var url = "<c:url value='/crm/mcm/marketingCampaign/copyMarketingCampaign.do' />";

               $.ajax({
                   url : url
                   ,dataType : "json"
                   ,type : "POST"
                   ,contentType : "application/json"
                   ,data : JSON.stringify(json)
                   ,error: function(jqXHR,status,error) {
                       dms.notification.error(jqXHR.responseJSON.errors);
                   }
                   ,success : function(data) {

                       resultKey = data;
                       isGridReload = true;
                       $("#mcdGrid").data("kendoExtGrid").dataSource.read();
                       var win = $("#window").data("kendoWindow");
                       win.close();
                       dms.notification.success("<spring:message code='global.info.success'/>");
                       mode = "N";
                       $("#makCd").val(data);   //20170426 확인
                       $("#crNo").val(data);
                   }
               });
           }else{
               //캠페인 목록을 먼저 선택해 주십시오.
               dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
           }

       }
       , enable:true
    });
    //메인 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            if(dms.date.isValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                    ,$("#sEndDt").data("kendoExtMaskedDatePicker").value())){
                $("#mcdGrid").data("kendoExtGrid").dataSource.page(1);
                mode = "N";
                resetDefualtForm();
            }else{
                dms.notification.warning('<spring:message code="global.err.checkDateValue"/>');
                $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                $("#sEndDt").focus();
            }
        }
    });
    //메인 - 신규       20170426 확인
    $("#btnAddVehic").kendoButton({
        click:function(e) {

            mode = "N";
            initReadOnlyForm();
            resetDefualtForm();
            initTab();
            viewDetail();

        }
        , enable:true
    });
    //메인 - 수정
    $("#btnViewDetail").kendoButton({
        click:function(e){

            var grid = $("#mcdGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            if ( dms.string.isNotEmpty(selectedItem) ){

                viewDetail(selectedItem.makCd);

            } else {
                // 선택해주세요.
                dms.notification.success("<spring:message code='crm.info.chkSelectItemMsg' />");
                return;
            }

        }
        , enable:true
    });
    //메인 - 엑셀Export     --20170426
    $("#btnCtlCamMgmtExcelExp").kendoButton({
        click:function(e) {

            var grid = $("#mcdGrid").data("kendoExtGrid");
            var sysDateExcelNm = new Date();
            var sysDtVal;
            sysDtVal = sysDateExcelNm.getFullYear()+"-";
            sysDtVal += sysDateExcelNm.getMonth()+1;
            sysDtVal += "-"+sysDateExcelNm.getDate();
            sysDtVal += "-"+sysDateExcelNm.getHours()+sysDateExcelNm.getMinutes()+sysDateExcelNm.getSeconds();

            console.log("Excel Export mcdGrid : "+ sysDateExcelNm);

            dms.ajax.excelExport({
                "beanName":"marketingCampaignService"
                ,"templateFile":"CampaignMgmtListExp_Tpl.xlsx"
                ,"fileName":"<spring:message code='crm.title.campaign' />_"+sysDtVal+".xlsx"
                ,"sMakNm":$("#sMakNm").val()
                ,"sMakCd":$("#sMakCd").val()
                ,"sHostCd":$("#sHostCd").val()
                ,"sMakTpCd":$("#sMakTpCd").val()
                ,"sMakSubTpCd":$("#sMakSubTpCd").val()
                ,"sStatCd":$("#sStatCd").val()
                ,"sStartDt":setKendoDate($("#sStartDt").data("kendoExtMaskedDatePicker").value())
                ,"sEndDt":setKendoDate($("#sEndDt").data("kendoExtMaskedDatePicker").value())
                ,"sExcelTp":"CampaignMgmtList"
            });
        }
    });

    //기본정보탭 - 저장
    $("#btnSaveVehic").kendoButton({
       click:function(e){

           // 화면 필수 체크
           if ( dms.string.isEmpty($("#hostCd").val())){
               dms.notification.warning("<spring:message code='global.lbl.hostCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
               $("#hostCd").focus();
               return false;
           }
           /*//주최코드가 [01 제조사]일 경우 저장하지 못하도록 한다.
             if ($("#hostCd").val() == "01"){
               dms.notification.warning("<spring:message code='crm.info.noMakeCorpSave'/>");
               $("#hostCd").focus();
               return false;
           }*/
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
           if ( dms.string.isEmpty($("#makCont").val())){
               dms.notification.warning("<spring:message code='crm.lbl.detail' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
               $("#makCont").focus();
               return false;
           }

           $("#makCd").prop("disabled", false);
           $("#prid").prop("disabled", false);

           var json = $("#defaultInfoForm").serializeObject();
           json.startDt     = $("#startDt").data("kendoExtMaskedDatePicker").value();
           json.endDt       = $("#endDt").data("kendoExtMaskedDatePicker").value();
           json.creStartDt  = $("#creStartDt").data("kendoExtMaskedDatePicker").value();
           json.creEndDt    = $("#creEndDt").data("kendoExtMaskedDatePicker").value();
           json.saleStartDt = $("#saleStartDt").data("kendoExtMaskedDatePicker").value();
           json.saleEndDt   = $("#saleEndDt").data("kendoExtMaskedDatePicker").value();
           json.makTpCd      = $("#makTpCd").data("kendoExtDropDownList").value();
           //json.statCd      = $("#statCd").data("kendoExtDropDownList").value(); 20170426
           json.makSubTpCd   = $("#makSubTpCd").data("kendoExtDropDownList").value();
           json.hostCd      = $("#hostCd").val();
           var url = "<c:url value='/crm/mcm/marketingCampaign/updateMarketingCampaigns.do' />";

           if(mode == "N"){
               url = "<c:url value='/crm/mcm/marketingCampaign/insertMarketingCampaigns.do' />";
           }
           console.log("##### : ",json);
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

                   resultKey = data;
                   isGridReload = true;
                   $("#mcdGrid").data("kendoExtGrid").dataSource.read();
                   var win = $("#window").data("kendoWindow");
                   win.close();
                   dms.notification.success("<spring:message code='global.info.success'/>");
                   $("#makCd").val(data);   // 20170426
                   $("#crNo").val(data);

               }
               ,beforeSend:function(xhr){
                   dms.loading.show($("#window"));
               }
               ,complete:function(xhr,status){
                   dms.loading.hide($("#window"));
               }
           });

       }
       , enable:true
    });
    //기본정보탭 - 삭제
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

                //주최코드가 [01 제조사]일 경우 저장하지 못하도록 한다.
                if ($("#hostCd").val() == "01"){
                    dms.notification.warning("<spring:message code='crm.info.noMakeCorpSave'/>");
                    $("#hostCd").focus();
                    return false;
                }

                var params = {};
                params["dlrCd"] = $("#dlrCd").val();
                params["makCd"] = $("#makCd").val();

                // 캠페인 취소 confirm
                dms.window.confirm({
                    message:"<spring:message code='crm.info.campaignCancelConfirm'/>"
                    ,callback:function(result){
                        if(result){//확인버튼 클릭 로직
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

                                    var win = $("#window").data("kendoWindow");
                                    win.close();
                                }
                                ,beforeSend:function(xhr){
                                    dms.loading.show($("#window"));
                                }
                                ,complete:function(xhr,status){
                                    dms.loading.hide($("#window"));
                                }
                            });
                        }else{
                            //취소버튼 클릭 로직
                        }
                    }
                });
                // 캠페인 취소 confirm
            } else {
                //캠페인 목록을 먼저 선택해 주십시오.
                dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
            }
       }
    });

    //방안탭 - 저장
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

                var formSaveData = $("#planForm").serializeObject();
                formSaveData.dlrCd = $("#dlrCd").val();
                formSaveData.makCd = $("#makCd").val();
                //console.log("params : ",formSaveData)
                $.ajax({
                     url:"<c:url value='/crm/mcm/marketingCampaign/multiActives.do' />"
                    ,data:JSON.stringify(formSaveData)
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
                        mode = "U";

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
    //방안탭 - 화술방안 조회
    $("#btnTalkPlanSearch").kendoButton({
       click:function(e){

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
                               $("#talkPlan").val(data[0].talkPlan);
                           }
                       }
                   }
               }
           });

       }
    });

    //목표탭 - 행추가
    $("#btnGoalAdd").kendoButton({
        click:function(e) {
            var grid = $('#mcdGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            if(selectedItem!=null) {
                var dlrCd = selectedItem.dlrCd;
                var makCd = selectedItem.makCd;
                if(makCd!="") {
                    $('#goalGrid').data('kendoExtGrid').dataSource.insert(0, {
                         "dlrCd":dlrCd
                        ,"makCd":makCd
                    });
                }
            } else {
                //캠페인 목록을 먼저 선택해 주십시오.
                dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
            }
        }
    });
    //목표탭 - 행삭제
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
    //목표탭 - 저장
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

    //대상탭 - 조건저장
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

               // N으로 등록은 1건만 등록이 가능함. 체크
               var custExtrAutoYn = $("#custExtrAutoYn").data("kendoExtDropDownList").value();
               if (custExtrAutoYn == "N") {   // if Start - custExtrAutoYn Is N
                   custExtrAutoNProcess("btnTargetSave");
               } else {   // if else Start - custExtrAutoYn Is Y
                   btnTargetSave();
               } // if End - custExtrAutoYn

           } else {
               //캠페인 목록을 먼저 선택해 주십시오.
               dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
           }
       }
       , enable:true
    });
    //대상탭 - 삭제
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

                    // 대상자 삭제 confirm
                    dms.window.confirm({
                        message:"<spring:message code='crm.info.targOnNotDelConfirm'/>"        // 추출된 대상자가 존재합니다. 삭제하시겠습니까?
                        ,callback:function(result){
                            if(result){

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
                                //취소버튼 클릭 로직
                                return;
                            }
                        }
                    });
                    // 대상자 삭제 confirm

                } else {

                    var param = {
                            "dlrCd":dlrCd
                            ,"makCd":makCd
                            ,"extrDgreCnt":extrDgreCnt
                            };
                    console.log("deleteTarget:::");
                    console.log(param);
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
    //대상탭 - 추출 실행
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

                // N으로 등록은 1건만 등록이 가능함. 체크
                var custExtrAutoYn = $("#custExtrAutoYn").data("kendoExtDropDownList").value();
                if (custExtrAutoYn == "N") {   // if Start - custExtrAutoYn Is N
                    custExtrAutoNProcess("btnRcpeExtr");
                } else {   // if else Start - custExtrAutoYn Is Y
                    btnRcpeExtr();
                } // if End - custExtrAutoYn



            } else {
                //캠페인 목록을 먼저 선택해 주십시오.
                dms.notification.info("<spring:message code='global.info.required.selectCampaign'/>");
            }
       }
    });
    //대상탭 - 엑셀Export        20170426
    $("#btnCtlExcelExport").kendoButton({
        click:function(e) {
               var sDlrCd = $("#dlrCd").val();
               var sMakCd = $("#makCd").val();
               var grid = $("#targExcelGrid").data("kendoExtGrid");
//                if ( grid.dataSource.data.length == 0 ){
//                    dms.notification.warning("<spring:message code='global.info.noSearchDataMsg'/>");
//                    return false;
//                }
               var sysDateExcelNm = new Date();
               var sysDtVal;
               sysDtVal = sysDateExcelNm.getFullYear()+"-";
               sysDtVal += sysDateExcelNm.getMonth()+1;
               sysDtVal += "-"+sysDateExcelNm.getDate();
               sysDtVal += "-"+sysDateExcelNm.getHours()+sysDateExcelNm.getMinutes()+sysDateExcelNm.getSeconds();

               console.log("Excel Export : " + sMakCd +" : " + sysDateExcelNm);
               dms.ajax.excelExport({
                   "beanName":"marketingCampaignService"
                   ,"templateFile":"CampaignExtractCustRlt_Tpl.xlsx"
                   ,"fileName":"<spring:message code='crm.lbl.rcpeExtrSeq' />_"+sysDtVal+".xlsx"
                   ,"sDlrCd":sDlrCd
                   ,"sMakCd":sMakCd
                   ,"sExcelTp":"CampaignExtractCustRlt"
               });
        }
    });

    var btnTargetSave = function() {
        console.log("대상자자동추출 조건저장:::");
        //추출조건제목 셋팅
        $("#custExtrTitleNm").val($("#custExtrTermNo").data("kendoExtDropDownList").text());

        var json = $("#targetForm").serializeObject();
        json.dlrCd = $("#dlrCd").val()
        json.makCd  = $("#makCd").val()

        // ###################################################### 추출주기설정 3/5 추가 시작
        delete json.cycleDatepicker;
        delete json.cycleDt;

        if($("#custExtrAutoYn").val() == "Y"){

            json.custExtrCycleDt = custExtrCycleDt;

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

            // 저장 confirm
            dms.window.confirm({
                message:"<spring:message code='crm.info.custExtrAutoYnConfirm'/>"       // 동일한 고객추출조건으로 저장하고자 할 경우 confirm문으로 확인후 진행한다.
                ,callback:function(result){
                    if(result){

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
                        //취소버튼 클릭 로직
                        return;
                    }
                }
            });
            // 저장 confirm

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
    };

    var custExtrAutoNProcess = function(val) {
        console.log("N으로 등록은 1건만 등록이 가능함. 체크:::");
        var targetGrid = $("#targetGrid").data("kendoExtGrid");
        var evalDs = targetGrid.dataSource;
        var iRowCnt = evalDs.total();
        var custExtrAutoYnDataItem;
        var beforeChkExtAndPlay = "false";
        var custExtrAutoYn = $("#custExtrAutoYn").data("kendoExtDropDownList").value();

        if (iRowCnt > 0) {
            $.each(targetGrid.dataSource.view(), function(idx, dataItem){
                //console.log("custExtrAutoYnDataItem ::: " + dataItem.custExtrAutoYnDataItem);
                console.log("dataItem.custExtrAutoYn ::: " + dataItem.custExtrAutoYn);
                custExtrAutoYnDataItem = dataItem.custExtrAutoYn;
                if (custExtrAutoYn == custExtrAutoYnDataItem) {
                       console.log("dataItem.custExtrAutoYn Equals....::: ");
                       beforeChkExtAndPlay = "true";
                }
            });
        }
        if (beforeChkExtAndPlay == "true") {   // if Start - beforeChkExtAndPlay
            var msg = "<spring:message code='crm.info.alreadyCustExtrAutoNConfirm'/>";  // 이미 고객추출조건이 있습니다. 대상자수동추출은 한 건만 가능합니다. 삭제하고 등록하시겠습니까?
            if (val != "btnTargetSave") {
                msg = "<spring:message code='crm.info.custExtrAutoYnConfirm'/>";   // 이미 해당 고객추출조건으로 생성된 데이터가 존재합니다. 다시 생성하시겠습니까?
            }
         // 저장 confirm
            dms.window.confirm({
                message:msg
                ,callback:function(result){
                    if(result){
                        var param = {};
                        var dlrCd = $("#dlrCd").val();
                        var makCd = $("#makCd").val();
                        var extrDgreCnt;
                        var realTargetCnt;
                        $.each(targetGrid.dataSource.view(), function(idx, dataItem){
                         // 추출차수
                            console.log("N 중복껀 삭제 시작 : " + idx);
                            extrDgreCnt = dataItem.extrDgreCnt;
                            //고객대상자 수
                            realTargetCnt = dataItem.realTargetCnt;

                            param = {
                                    "dlrCd":dlrCd
                                    ,"makCd":makCd
                                    ,"extrDgreCnt":extrDgreCnt
                                    };
                            if (realTargetCnt != 0 ) {
                                console.log("deleteTargetEx:::");
                                $.ajax({
                                    url:"<c:url value='/crm/mcm/marketingCampaign/deleteTargetEx.do' />"
                                    ,data:JSON.stringify(param)      //파라미터
                                    ,type:'POST'                        //조회요청
                                    ,dataType:'json'                  //json 응답
                                    ,contentType:'application/json'   //문자열 파라미터
                                    ,async:false
                                    ,error:function(jqXHR,status,error){
                                        dms.notification.error(jqXHR.responseJSON.errors);
                                    }
                                    ,success:function(data) {
                                        $("#extrDgreCnt").val("");
                                        $("#realTargetCnt").val("");
                                    }
                                    ,complete:function(xhr, status) {
                                        console.log("deleteTargetEx.do Done!!!!");
                                    }
                                });
                           } else {
                               console.log("deleteTarget:::");
                               $.ajax({
                                    url:"<c:url value='/crm/mcm/marketingCampaign/deleteTarget.do' />"
                                    ,data:JSON.stringify(param)      //파라미터
                                    ,type:'POST'                        //조회요청
                                    ,dataType:'json'                  //json 응답
                                    ,contentType:'application/json'   //문자열 파라미터
                                    ,async:false
                                    ,error:function(jqXHR,status,error){
                                        dms.notification.error(jqXHR.responseJSON.errors);
                                    }
                                    ,success:function(data) {
                                        $("#extrDgreCnt").val("");
                                        $("#realTargetCnt").val("");
                                    }
                                    ,complete:function(xhr, status) {
                                        console.log("deleteTarget.do Done!!!!");
                                    }
                                });
                           }
                        });

                       $("#custExtrOverWriteChk").val("Y");
                       targetGrid.dataSource.data([]);
                        if (val == "btnTargetSave") {
                            console.log("btnTargetSave - custExtrAutoNProcess");
                            btnTargetSave();
                        } else {
                            console.log("btnRcpeExtr - custExtrAutoNProcess");
                            btnRcpeExtr();
                        }

                        $("#custExtrOverWriteChk").val("");

                        $("#window").data("kendoWindow").refresh();

                    }else{
                        //취소버튼 클릭 로직
                        return;
                    }
                }
            });
            // 저장 confirm

        } else {   // else Start - beforeChkExtAndPlay
            if (val == "btnTargetSave") {
                btnTargetSave();
            } else {
                btnRcpeExtr();
            }
            $("#custExtrOverWriteChk").val("");
        }      // end Start - beforeChkExtAndPlay


    };

    var btnRcpeExtr = function() {
        console.log("대상자자동추출 추출실행:::");
        var grid = $('#mcdGrid').data('kendoExtGrid');
            var params = {};
            params["dlrCd"] = $("#dlrCd").val();
            params["makCd"] = $("#makCd").val();
            params["extrDgreCnt"] = $("#extrDgreCnt").val() == "" || $("#extrDgreCnt").val() == null ? 0 : $("#extrDgreCnt").val();
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

            console.log("cnt :: " + cnt);
            //동일한 고객추출조건으로 대상자를 생성하고자 할 경우 confirm문으로 확인후 진행한다.
            var custExtrOverWriteChk = $("#custExtrOverWriteChk").val();
            console.log("custExtrOverWriteChk : " + custExtrOverWriteChk);
            if(cnt > 0){

                if (custExtrOverWriteChk != "Y") {
                    // 대상자 추출 confirm
                    dms.window.confirm({
                        message:"<spring:message code='crm.info.custExtrAutoYnConfirm'/>"      // 동일한 고객추출조건으로 대상자를 생성하고자 할 경우 confirm문으로 확인후 진행한다.
                        ,callback:function(result){
                            if(result){

                                var gridTargetD = $("#targetGrid").data("kendoExtGrid");
                                var selectedItemT = gridTargetD.dataItem(gridTargetD.select());
                                if (selectedItemT != null) {

                                    var dlrCd = $("#dlrCd").val();
                                    var makCd = $("#makCd").val();
                                    var extrDgreCntD = $("#extrDgreCnt").val();
                                    var realTargetCntD = $("#realTargetCnt").val();

                                    console.log("extrDgreCntD : " + extrDgreCntD);
                                    console.log("realTargetCntD : " + realTargetCntD);
                                    if (realTargetCntD > 0) {

                                        // 대상자 삭제 confirm
                                        var param = {
                                                "dlrCd":dlrCd
                                                ,"makCd":makCd
                                                ,"extrDgreCnt":extrDgreCntD
                                                };
                                        console.log("realTargetCntD param : ");
                                        console.log(param);

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
                                                    //dms.notification.success("<spring:message code='global.info.success'/>");
                                                    $("#extrDgreCnt").val("");
                                                    $("#realTargetCnt").val("");
                                                }
                                        });
                                        // 대상자 삭제 confirm

                                    } else {

                                        var param = {
                                                "dlrCd":dlrCd
                                                ,"makCd":makCd
                                                ,"extrDgreCnt":extrDgreCntD
                                                };

                                        console.log("extrDgreCntD param : ");
                                        console.log(param);
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
                                                    //dms.notification.success("<spring:message code='global.info.success'/>");
                                                    $("#extrDgreCnt").val("");
                                                    $("#realTargetCnt").val("");
                                                }
                                        });
                                    }

                                }

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
                                //취소버튼 클릭 로직
                                return;
                            }
                        }
                    });
                    // 대상자 추출 confirm

                } else {
                var gridTargetD = $("#targetGrid").data("kendoExtGrid");
                 var selectedItemT = gridTargetD.dataItem(gridTargetD.select());
                 if (selectedItemT != null) {

                     var dlrCd = $("#dlrCd").val();
                     var makCd = $("#makCd").val();
                     var extrDgreCntD = $("#extrDgreCnt").val();
                     var realTargetCntD = $("#realTargetCnt").val();

                     console.log("extrDgreCntD : " + extrDgreCntD);
                     console.log("realTargetCntD : " + realTargetCntD);
                     if (realTargetCntD > 0) {

                         // 대상자 삭제 confirm
                         var param = {
                                 "dlrCd":dlrCd
                                 ,"makCd":makCd
                                 ,"extrDgreCnt":extrDgreCntD
                                 };
                         console.log("realTargetCntD param : ");
                         console.log(param);

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
                                     //dms.notification.success("<spring:message code='global.info.success'/>");
                                     $("#extrDgreCnt").val("");
                                     $("#realTargetCnt").val("");

                                 }
                         });
                         // 대상자 삭제 confirm

                     } else {

                         var param = {
                                 "dlrCd":dlrCd
                                 ,"makCd":makCd
                                 ,"extrDgreCnt":extrDgreCntD
                                 };

                         console.log("extrDgreCntD param : ");
                         console.log(param);

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
                                     $("#extrDgreCnt").val("");
                                     $("#realTargetCnt").val("");
                                 }
                         });
                     }

                 }

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

            }else{
                // 신규로 대상자추출까지 수행할 때
                console.log("extrDgreCnt::" + extrDgreCnt);
                console.log("realTargetCnt::" + realTargetCnt);
                if(extrDgreCnt <= 0 || realTargetCnt > 0){

                    if (custExtrOverWriteChk != "Y") {    // if Start - custExtrOverWriteChk
                        // 대상자 추출 confirm
                        dms.window.confirm({
                            message:"<spring:message code='crm.info.custExtrNewConfirm'/>"     // 신규로 추출조건과 추출대상자를 한꺼번에 생성하고자 할 경우 confirm문으로 확인후 진행한다.
                            ,callback:function(result){
                                if(result){

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
                                    //취소버튼 클릭 로직
                                    return;
                                }
                            }
                        });
                        // 대상자 추출 confirm
                    } else {           // else Start - custExtrOverWriteChk
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
                    }          // if End - custExtrOverWriteChk
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

    };

    //예산탭 - 저장
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

                            selectedItem.budgetAmt = Number($("#budgetGridBudgetAmtSum").val().replace(/\,/gi,""));

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
    //예산탭 - 행추가
    $("#btnBudgetAdd").kendoButton({
        click:function(e) {
            var grid = $('#mcdGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            if(selectedItem!=null) {
                var dlrCd = selectedItem.dlrCd;
                var makCd = selectedItem.makCd;
                if(makCd!="") {
                    $('#budgetGrid').data('kendoExtGrid').dataSource.insert(0, {
                         "dlrCd":dlrCd
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
    //예산탭 - 행삭제
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
    //예산탭 - 엑셀Export    20170426
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

    //결재탭 - 제출신청
    $("#btnEvalReq").kendoButton({
        click:function(e) {

            var saveData    = "";
            var cnt         = 0;

            var gridEval = $("#signLineGrid").data("kendoExtGrid");
            var signVO = {}

            var evalDs = gridEval.dataSource;
            var iRowCnt = evalDs.total();

            var lastSignYn = evalDs.at(0).lastSignYn;
            var signDocId = evalDs.at(0).signDocId;
            var signDocLineNo = evalDs.at(0).signDocLineNo;
            var signTp = evalDs.at(0).signTp;
            var signUsrId = evalDs.at(0).signUsrId;
            var signUsrNm = evalDs.at(0).signUsrNm;

            signVO["lastSignYn"] = lastSignYn;
            signVO["signDocId"] = signDocId;
            signVO["signDocLineNo"] = signDocLineNo;
            signVO["signTp"] = signTp;
            signVO["signUsrId"] = signUsrId;
            signVO["signUsrNm"] = signUsrNm;


            var params = {};
            params["tempSaveYn"] = "N";
            params["makCd"] = $("#makCd").val();
            params["reqTitleNm"] = $("#makNm").val();
            params["signLineVO"] = signVO;

            if ( dms.string.isEmpty($("#makNm").val())){
                dms.notification.warning("<spring:message code='global.lbl.crNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
//                 $("#makNm").focus();
                return false;
            }
            if ( dms.string.isEmpty($("#startDt").val())){
                dms.notification.warning("<spring:message code='global.lbl.startDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
//                 $("#startDt").focus();
                return false;
            }
            if ( dms.string.isEmpty($("#endDt").val())){
                dms.notification.warning("<spring:message code='global.lbl.EndDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
//                 $("#endDt").focus();
                return false;
            }
            if (Number($("#startDt").val().replace(/-/g, '')) > Number($("#endDt").val().replace(/-/g, ''))){
                dms.notification.warning("<spring:message code='cmm.info.endDateGreat'/>");
//                 $("#startDt").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#makCont").val())){
                dms.notification.warning("<spring:message code='crm.lbl.detail' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
//                 $("#makCont").focus();
                return false;
            }


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
    //결재탭 - 심사
    $("#btnEval").kendoButton({
        click:function(e) {
            var lineGrid = $("#signLineGrid").data("kendoExtGrid");
            var selectedItem = lineGrid.dataItem(lineGrid.select());
            if(selectedItem == null) {
                // 결재선을(를) 선택하여 주십시오.
                dms.notification.warning("<spring:message code='global.title.signLine' var='returnMsg' /><spring:message code='global.info.validation.select' arguments='${returnMsg}' />");
                return;
            }
            var signDocNo = selectedItem.signDocNo;
            if(dms.string.isEmpty(selectedItem.signCont)){
                // 화면 필수 체크(결재의견)
                dms.notification.warning("<spring:message code='global.lbl.signCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return;
            }
            if(dms.string.isEmpty(signDocNo)){
                // 화면 필수 체크(문서번호)
                dms.notification.warning("<spring:message code='global.lbl.signDocNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return;
            }
            var params = {};
            params["signDocNo"] = signDocNo;
            params["signCont"] = selectedItem.signCont;
            params["signDocId"] = selectedItem.signDocId;
            params["signDocLineNo"] = selectedItem.signDocLineNo;
            params["signStatCd"] = "03";
            params["signRsltCd"] = "04";

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
    //결재탭 - 반려
    $("#btnReject").kendoButton({
        click:function(e) {
            var lineGrid = $("#signLineGrid").data("kendoExtGrid");
            var selectedItem = lineGrid.dataItem(lineGrid.select());
            if(selectedItem == null) {
                // 결재선을(를) 선택하여 주십시오.
                dms.notification.warning("<spring:message code='global.title.signLine' var='returnMsg' /><spring:message code='global.info.validation.select' arguments='${returnMsg}' />");
                return;
            }
            var signDocNo = selectedItem.signDocNo;
            if(dms.string.isEmpty(selectedItem.signCont)){
                // 화면 필수 체크(결재의견)
                dms.notification.warning("<spring:message code='global.lbl.signCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return;
            }
            if(dms.string.isEmpty(signDocNo)){
                // 화면 필수 체크(문서번호)
                dms.notification.warning("<spring:message code='global.lbl.signDocNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return;
            }
            var params = {};
            params["signDocNo"] = signDocNo;
            params["signCont"] = selectedItem.signCont;
            params["signDocId"] = selectedItem.signDocId;
            params["signDocLineNo"] = selectedItem.signDocLineNo;
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

    //VIN 정보탭 - LTS MODEL 업로드
    $("#btnVinNoExcelImport").kendoButton({

        click:function(e) {
            vinUploadPopupWin = dms.window.popup({
                title:"<spring:message code='crm.btn.excelVinUpload' />"
                ,width:800
                ,height : 400
                ,modal : true
                ,windowId:"vinUploadPopupWin"
                ,content:{
                    url:"<c:url value='/crm/mcm/marketingCampaign/selectVinUploadPopup.do?dlrCd="+$("#dlrCd").val()+"&makCd="+$("#makCd").val()+"'/>"
                    ,data:{
                        "uploadFlag" : "VIN"
                       ,"callbackFunc":function(){
                            $('#vinGrid').data('kendoExtGrid').dataSource.read();
                            vinUploadPopupWin.close();
                        }
                    }
                }
            });
        }
    });
    //VIN 정보탭 - VIN 업로드
    $("#btnLtsModelExcelImport").kendoButton({
        click:function(e) {
            vinUploadPopupWin = dms.window.popup({
                title:"<spring:message code='crm.btn.excelLtsModelUpload' />"
                ,width:800
                ,height : 400
                ,modal : true
                ,windowId:"vinUploadPopupWin"
                ,content:{
                    url:"<c:url value='/crm/mcm/marketingCampaign/selectVinUploadPopup.do?dlrCd="+$("#dlrCd").val()+"&makCd="+$("#makCd").val()+"'/>"
                    ,data:{
                        "uploadFlag" : "LTS"
                       ,"callbackFunc":function(){
                            $('#vinGrid').data('kendoExtGrid').dataSource.read();
                            vinUploadPopupWin.close();
                        }
                    }
                }
            });
        }
    });

    //대상 딜러탭 - 저장
    $("#btnDlrSelect").kendoButton({
        click:function(e) {
            var grid = $('#mcdGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            if(selectedItem!=null) {
                var targDlrGrid = $("#targDlrGrid").data("kendoExtGrid");
                var saveData = targDlrGrid.getCUDData("insertList", "updateList", "deleteList");

                if (targDlrGrid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                };

                var params = {};
                params["dlrCd"] = $("#dlrCd").val();
                params["makCd"] = $("#makCd").val();
                params["insertDlrCdVO"] = targDlrGrid.dataSource.data();

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

                        targDlrGrid.dataSource._destroyed = [];
                        targDlrGrid.dataSource.page(1);

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

    // 추가
    $("#btnAddR").kendoButton({
        click:function(e){

            var mcdGrid = $('#mcdGrid').data('kendoExtGrid');
            var selectedItem = mcdGrid.dataItem(mcdGrid.select());

            if ( selectedItem != null && selectedItem.statCd != "02" && selectedItem.statCd != "03" && selectedItem.statCd != "06" ) {

                var dlrGrid = $("#dlrGrid").data("kendoExtGrid");
                var selectRows = dlrGrid.select();

                if(selectRows.length > 0){

                    $.each(selectRows, function(idx, val){
                        var data = dlrGrid.dataItem(val);

                        if(!isTargetModelGrid(data.dlrCd)){
                            $("#targDlrGrid").data("kendoExtGrid").dataSource.insert(idx, {
                                 targDlrCd  : data.dlrCd
                                ,targDlrNm  : data.dlrNm
                                ,targYn     : "Y"
                                ,flagYn     : "Y"
                                ,makCd      : $("#makCd").val()
                            });
                        }
                    });

                }

            }
        }
    });

    // 삭제
    $("#btnDelR").kendoButton({
        click:function(e){

            var mcdGrid = $("#mcdGrid").data("kendoExtGrid");
            var selectedItem = mcdGrid.dataItem(mcdGrid.select());

            if ( selectedItem != null && selectedItem.statCd != "02" && selectedItem.statCd != "03" && selectedItem.statCd != "06" ) {

                var targDlrGrid = $("#targDlrGrid").data("kendoExtGrid");
                var rows = targDlrGrid.select();

                if(rows.length  == 0 ){
                    //삭제할 데이터가 없습니다.
                    dms.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.notExistData' arguments='${del},' />");
                    return false;
                }

                rows.each(function(index, row) {
                    targDlrGrid.removeRow(row);
                });

            };

        }
    });


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
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
                        params = $.extend(params, gridCommonParams());
                        console.log(kendo.stringify(params));
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
                        , regDt:{type:"date", editable:false}
                        , regDtFormat:{type:"date", editable:false}
                        , hostCd:{type:"string", editable:false}
                        , hostNm:{type:"string", editable:false}
                        , statCd:{type:"string", editable:false}
                        , statNm:{type:"string", editable:false}
                        , makTpCd:{type:"string", editable:false}
                        , makTpSubTpNm:{type:"string", editable:false}
                        , targCustCnt:{type:"number", editable:false}
                        , realCustCnt:{type:"number", editable:false}
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
        ,columns:[
           {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
           ,{field:"makCd", title:"<spring:message code='global.lbl.crNo' />", width:130, attributes:{"class":"ac"}, sortable:true}       // 캠페인코드
           ,{field:"makNm", title:"<spring:message code='global.lbl.crNm' />", width:200, sortable:true}      // 캠페인명
           ,{field:"hostCd", title:"<spring:message code='global.lbl.hostCd' />", hidden:true}                       // 주최
           ,{field:"hostNm", title:"<spring:message code='global.lbl.hostCd' />", width:100, attributes:{"class":"ac"}, sortable:false}       // 주최
           ,{field:"statCd", title:"<spring:message code='global.lbl.statNm' />", hidden:true, sortable:false}   // 상태
           ,{field:"statNm", title:"<spring:message code='global.lbl.statNm' />", width:100, attributes:{"class":"ac"}, sortable:false}   // 상태
           ,{field:"makTpCd", title:"<spring:message code='global.lbl.type' />", hidden:true, sortable:false}    // 유형
           ,{field:"makTpSubTpNm", title:"<spring:message code='global.lbl.type' />", width:150, attributes:{"class":"ac"}, sortable:false}    // 유형
           ,{field:"targCustCnt", title:"<spring:message code='global.lbl.targCustCnt' />", width:100, attributes:{"class":"ar"}, format:"{0:##,###}", sortable:true}    // 목표인수
           ,{field:"realCustCnt", title:"<spring:message code='global.lbl.useper' />", width:100, attributes:{"class":"ar"}, format:"{0:##,###}", sortable:true
               ,template:function(dataItem){
                   var spanObj = "<a href='#' class='popTargExtractList'>"+kendo.format("{0:##,###}", dataItem.realCustCnt)+"</a>";
                   return spanObj;
               }
           } // 참여인력
           ,{field:"startDtFormat", title:"<spring:message code='global.lbl.startDt' />", width:100, sortable:true
               ,attributes:{"class":"ac tooltip-disabled"}
               ,template:"#if (startDtFormat !== null ){# #= kendo.toString(data.startDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
           }
           ,{field:"endDtFormat", title:"<spring:message code='global.lbl.EndDt' />", width:100, sortable:true
               ,attributes:{"class":"ac tooltip-disabled"}
               ,template:"#if (endDtFormat !== null ){# #= kendo.toString(data.endDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
           }
           ,{field:"budgetAmt", title:"<spring:message code='global.lbl.budgetAmt' />", width:100, attributes:{"class":"ar"},  format:"{0:##,###}", sortable:true}    // 예산
           ,{field:"regUsrId", title:"<spring:message code='global.lbl.regUsrId' />", width:100, attributes:{"class":"ac"}, sortable:true}    // 등록자
           ,{field:"creStartDtFormat", title:"<spring:message code='ser.lbl.creStartDt' />", width:100, sortable:true
               ,attributes:{"class":"ac tooltip-disabled"}
               ,template:"#= kendo.toString(data.creStartDt == null ? '':data.creStartDt, '<dms:configValue code='dateFormat' />') #"
           }
           ,{field:"creEndDtFormat", title:"<spring:message code='ser.lbl.creEndDt' />", width:100, sortable:true
               ,attributes:{"class":"ac tooltip-disabled"}
               ,template:"#= kendo.toString(data.creEndDt == null ? '':data.creEndDt, '<dms:configValue code='dateFormat' />') #"
           }
           ,{field:"saleStartDtFormat", title:"<spring:message code='ser.lbl.saleStartDt' />", width:100, sortable:true
               ,attributes:{"class":"ac tooltip-disabled"}
               ,template:"#= kendo.toString(data.saleStartDt == null ? '':data.saleStartDt, '<dms:configValue code='dateFormat' />') #"
           }
           ,{field:"saleEndDtFormat", title:"<spring:message code='ser.lbl.saleEndDt' />", width:100, sortable:true
               ,attributes:{"class":"ac tooltip-disabled"}
               ,template:"#= kendo.toString(data.saleEndDt == null ? '':data.saleEndDt, '<dms:configValue code='dateFormat' />') #"
           }
           ,{field:"crEndTp", title:"<spring:message code='ser.lbl.endYn' />", width:100, attributes:{"class":"ac"}, sortable:true}       // 종료여부
           ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
           ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:120, sortable:true
               ,attributes:{"class":"ac tooltip-disabled"}
               ,template:"#= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') #"
           }
        ]
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        ,appendEmptyColumn:false          //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        , navigatable:true
        , selectable:"row"
    });

    //그리드 - 목표
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
                        params["sort"] = options.sort;
                        params["sDlrCd"] = $("#dlrCd").val();
                        params["sMakCd"] = $("#makCd").val();
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
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        //,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        , pageable:false
        , sortable:false
        , filterable:false
        , selectable:"multiple"
        , height:400
        , columns:[
           {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
           ,{field:"makCd", title:"<spring:message code='global.lbl.crNo' />", hidden:true}       // 캠페인코드
           ,{field:"seq", title:"<spring:message code='global.lbl.budgetCd' />", hidden:true}
           ,{field:"targCd", title:"<spring:message code='global.lbl.targ' />", hidden:true}
           ,{field:"targNm", title:"<spring:message code='global.lbl.targ' />", width:700}       // 상세내역
           ,{field:"targCntVal", title:"<spring:message code='global.lbl.targCntVal' />", width:100, attributes:{"class":"ar"}}   // 자사분담율
           ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
        ]
    });

    //그리드 - 대상
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
                         params["sort"] = options.sort;
                         params["sDlrCd"] = $("#dlrCd").val();
                         params["sMakCd"] = $("#makCd").val();
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

                 // 추출차수
                 $("#extrDgreCnt").val(selectedItem.extrDgreCnt);
                 // 추출조건번호
                 $("#custExtrTermNo").data("kendoExtDropDownList").value(selectedItem.custExtrTermNo);
                 $("#custExtrTermNo").data("kendoExtDropDownList").text(selectedItem.custExtrTitleNm);
                 // 추출조건제목
                 $("#custExtrTitleNm").val(selectedItem.custExtrTitleNm);
                 // 고객추출자동여부
                 console.log("custExtrAutoYn YY : " + selectedItem.custExtrAutoYn);
                 $("#custExtrAutoYn").data("kendoExtDropDownList").value(selectedItem.custExtrAutoYn);

                 if(selectedItem.custExtrAutoYn == "Y"){
                     cycleCheckDisFalse();
                 }else{
                     cycleCheckDisTrue();
                 }
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


                 });
                 // ###################################################### 추출주기설정 5/5 상세 조회 종료
             }
         }
         ,dataBound:function (e) {

         }
         ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
         ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
         ,appendEmptyColumn:true           //빈컬럼 적용. default:false
         ,enableTooltip:true               //Tooltip 적용, default:false
         , sortable:false
         , filterable:false
         , height:290
         , autoBind:false
         , columns:[
             {field:"extrDgreCnt", hidden:true}
             ,{field:"custExtrTermNo", hidden:true}
             ,{field:"custExtrTitleNm", title:"<spring:message code='crm.lbl.custExtrTermNo' />", width:200 ,attributes:{"class":"al"}
                 ,template:function(dataItem){
                     var spanObj = "<a href='#' class='linkCustExtrTermNo'>"+dataItem.custExtrTitleNm+"</a>";
                     return spanObj;
                 }
             }
             ,{field:"extrStatCd", title:"<spring:message code='crm.lbl.extrStatCd' />", width:100 ,attributes:{"class":"ac"}}
             ,{field:"realTargetCnt", title:"<spring:message code='crm.lbl.pointExtUsrCnt' />", width:100, attributes:{"class":"ar"}
                 ,template:function(dataItem){
                     var spanObj = "<a href='#' class='popTargExtractDetailList'>"+kendo.format("{0:##,###}", dataItem.realTargetCnt)+"</a>";
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
             ,{field:"dupYn", title:"<spring:message code='crm.lbl.dupYn' />", width:100 ,attributes:{"class":"ac"}
                ,template:'#if(dupYn !== "") {# #= targExtractDupMap[dupYn]# #}#'
             }
         ]
    });
    //대상자 excel 내보니기 그리드 설정
    $("#targExcelGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/crm/cmm/crmTargExtract/selectCrmTargExtractPopups.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sMakCd"] = $("#makCd").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"string", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,makCd:{type:"string", editable:false}
                        ,custNo:{type:"string", editable:false}
                        ,custNm:{type:"string", editable:false}
                        ,hpNo:{type:"string", editable:false}
                        ,addrDetlCont:{type:"string", editable:false}
                        ,emailNm:{type:"string", editable:false}
                        ,wechatId:{type:"string", editable:false}
                    }
                }
            }
        }
        ,filterable:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
            ,{field:"dlrCd", hidden:true}
            ,{field:"makCd", hidden:true}
            ,{field:"custNo", hidden:true}
            ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100, attributes:{"class":"ac"}}
            ,{field:"hpNo", title:"<spring:message code='global.lbl.cellphone' />", width:100, attributes:{"class":"ac"}}
            ,{field:"addrDetlCont", title:"<spring:message code='par.lbl.addr' />", width:300, attributes:{"class":"al"}}
            ,{field:"emailNm", title:"<spring:message code='global.lbl.emailNm' />", width:200, attributes:{"class":"al"}}
            ,{field:"wechatId", title:"<spring:message code='global.lbl.wechat' />", width:150, attributes:{"class":"al"}}
        ]
        ,height:290
    });

    //그리드 - 예산
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
                        params["sort"] = options.sort;
                        params["sDlrCd"] = $("#dlrCd").val();
                        params["sMakCd"] = $("#makCd").val();
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
                        }
                    }
            }
//             ,aggregate:[{ field:"budgetAmt", aggregate:"sum" },
//                           { field:"imsSuptAmt", aggregate:"sum" }]
        }
        ,edit:function(e) {
            console.log(e.container);
            e.container.find("input[name=budgetDetlCont]").keyup(function(){
                txtLimit(this, '1000');
            });
            e.container.find("input[name=budgetAmt]").change(function(){
                var data = e.model;
                data.set("budgetAmt", Number($(this).val().replace(/\,/gi,"")));
                data.set("corpBudnRate", Number($(this).val()) - (Number(data.imsSuptAmt)));
                budgetGridSum();
            });
            e.container.find("input[name=corpBudnRate]").change(function(){
                var data = e.model;
                data.set("corpBudnRate", Number($(this).val().replace(/\,/gi,"")));
                data.set("imsSuptAmt", Number(data.budgetAmt) - (Number($(this).val())));
                budgetGridSum();
            });
            e.container.find("input[name=imsSuptAmt]").change(function(){
                var data = e.model;
                data.set("imsSuptAmt", Number($(this).val().replace(/\,/gi,"")));
                data.set("corpBudnRate", Number(data.budgetAmt) - (Number($(this).val())));
                budgetGridSum();
            });
        }
        , dataBound:budgetGridSum
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
        ,appendEmptyColumn:false          //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        , pageable:false
        , sortable:false
        , filterable:false
        , height:400
        , editableOnlyNew:true
        , autoBind:false
        , editableOnlyNewExcludeColumns:["budgetCd","budgetDetlCont","budgetAmt","corpBudnRate","imsSuptAmt"]
        , columns:[
           {field:"makCd", title:"<spring:message code='global.lbl.crNo' />", hidden:true}       // 캠페인코드
           ,{field:"budgetCd", title:"<spring:message code='global.lbl.budgetCd' />", width:80} //비용항목
           ,{field:"budgetDetlCont", title:"<spring:message code='global.lbl.budgetDetlCont' />"}       // 상세내역
           ,{field:"budgetAmt", title:"<spring:message code='global.lbl.budgetAmt' />", width:150, attributes:{"class":"ar"},  format:"{0:##,###}"
             //,footerTemplate:"#=kendo.toString(sum, 'n0')#"
             ,footerTemplate:"<span id='budgetGridBudgetAmtSum'></span>"
             ,footerAttributes:{style:"text-align:right;"}
           }    // 예산(위안)
           ,{field:"corpBudnRate", title:"<spring:message code='global.lbl.corpBudnRate' />", width:150, attributes:{"class":"ar"},  format:"{0:##,###}"
//              ,footerTemplate:"#=kendo.toString(sum, 'n0')#"
             ,footerTemplate:"<span id='budgetGridCorpBudnRateSum'></span>"
             ,footerAttributes:{style:"text-align:right;"}
           }   // 본딜러부담(위안)
           ,{field:"imsSuptAmt", title:"<spring:message code='global.lbl.imsSuptAmt' />", width:150, attributes:{"class":"ar"},  format:"{0:##,###}"
//              ,footerTemplate:"#=kendo.toString(sum, 'n0')#"
             ,footerTemplate:"<span id='budgetGridImsSuptAmtSum'></span>"
             ,footerAttributes:{style:"text-align:right;"}
           }    // 제조사부담(위안)
           ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
        ]
    });

    //그리드 - 결재
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
                         console.log("params : ",kendo.stringify(params))
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
         ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
         ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
         ,appendEmptyColumn:true           //빈컬럼 적용. default:false
         ,enableTooltip:true               //Tooltip 적용, default:false
         ,editableOnlyNew:true
         ,editableOnlyNewExcludeColumns:["signUsrNm", "signCont"]
         ,sortable:false
         ,filterable:false
         ,height:400
         ,autoBind:false
         ,columns:[
               {field:"signDocId", hidden:true}
               ,{field:"signDocLineNo", title:"<spring:message code='crm.lbl.abbreviationForNumber' />", width:100 ,attributes:{"class":"ac"}}
               ,{field:"signRsltCd", title:"<spring:message code='global.lbl.result' />", width:60, attributes:{"class":"ac"}
                   ,template:"# if(arrSignProcCdMap[signRsltCd] != null) { # #= arrSignProcCdMap[signRsltCd].cmmCdNm# # }#"
               }
               ,{field:"signUsrNm", title:"<spring:message code='crm.lbl.applyUsr' />", width:100, attributes:{"class":"ac"}}
               ,{field:"signCont", title:"<spring:message code='crm.lbl.cont' />", width:600 ,attributes:{"class":"al"}}
               ,{field:"taskNm", title:"<spring:message code='global.lbl.task' />", width:100, attributes:{"class":"ac"}
                   ,template:'#= fn_getTaskNm(signUsrId)#'
               }
               ,{field:"signDt", title:"<spring:message code='global.lbl.dateTime' />", width:200
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
               }
         ]

    });

    //그리드 - 결과 - 캠페인 결과
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
                        params["sort"] = options.sort;
                        params["sDlrCd"] = $("#dlrCd").val();
                        params["sMakCd"] = $("#makCd").val();
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
                    }
                }
            }
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,pageable:false
        ,sortable:false
        ,filterable:false
        ,height:190
        ,columns:[
           {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
           ,{field:"makCd", title:"<spring:message code='global.lbl.crNo' />", hidden:true}       // 캠페인코드
           ,{field:"seq", title:"<spring:message code='global.lbl.budgetCd' />", hidden:true}
           ,{field:"targCd", title:"<spring:message code='global.lbl.targ' />", hidden:true}
           ,{field:"targNm", title:"<spring:message code='global.lbl.targ' />"}       // 상세내역
           ,{field:"targCntVal", title:"<spring:message code='global.lbl.targCntVal' />", width:60, attributes:{"class":"ar"}}   // 목표수치
           ,{field:"targRsltVal", title:"<spring:message code='global.lbl.result' />", width:60, attributes:{"class":"ar"}}   // 목표결과
           ,{title:"<spring:message code='crm.lbl.achievementRate' />", width:60, attributes:{"class":"ar"}
              , template:function(data){
                   var rate = 0;
                   if(data.targCntVal != null && data.targRsltVal != null){
                       if(Number(data.targCntVal) > 0){
                           rate = ((Number(data.targRsltVal)/Number(data.targCntVal))*100).toFixed(0);
                       }else{
                           rate = 0;
                       }
                   }
                   return rate+"%";
               }
           }   // 달성률
           ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
        ]
    });

    //그리드 - 딜러/제조사 - VIN 정보
    $("#vinGrid").kendoExtGrid({
        gridId:"G-CRM-1202-000005"
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
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
       ,appendEmptyColumn:false          //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,scrollable:true
       ,editable:false
       ,height:400
       ,autoBind:false
       ,sortable:false
       ,filterable:false
       ,columns:[
                   {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
                  ,{field:"vinNo",title:"<spring:message code='ser.lbl.vinNo' />",width:150,attributes:{"class":"al"}}
                  ,{field:"ltsModelCd",title:"<spring:message code='ser.lbl.ltsModelCd' />",width:100,attributes:{"class":"al"}}
                  ,{field:"ltsModelNm",title:"<spring:message code='ser.lbl.ltsModelNm' />",width:250,attributes:{"class":"al"}}
                 ]
    });



    //그리드 - 제조사 - 공임
    $("#bhmcLbrGrid").kendoExtGrid({
        gridId:"G-CRM-1202-000001"
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
                        params["pageIndex"]  = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"]  = options.skip + options.take;
                        params["sort"]       = options.sort;

                        params["sCrNo"]      = $("#crNo").val();
                        params["sHostCd"]    = "01"

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
                       rnum:{type:"number", editable:false}
                      ,crTp:{type:"string", editable:false}
                      ,crNo:{type:"string", editable:false}
                      ,crNm:{type:"string", editable:false}
                      ,pcDstinCd:{type:"string", editable:false}
                      ,lbrCd:{type:"string", editable:false}
                      ,lbrNm:{type:"string", editable:false}
                      ,cauItemCd:{type:"string"}
                      ,cauItemNm:{type:"string", editable:false}
                      ,cauCd:{type:"string"}
                      ,cauNm:{type:"string", editable:false}
                      ,phenCd:{type:"string"}
                      ,phenNm:{type:"string", editable:false}
                      ,dlrCd:{type:"string", editable:false}
                   } //fields
                }//model
            }//schema
        }//dataSource
        ,change:function(e){

            var selectedItem = this.dataItem(this.select());

            if (selectedItem != null) {
                // 추출차수
                $("#lbrCd").val(selectedItem.lbrCd);
            }
        }
       ,autoBind:false
       ,editable:false
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
       ,appendEmptyColumn:true          //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,height:400
       ,scrollable:true
       ,sortable:false
       ,filterable:false
       ,columns:[
                  {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
                 ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:100, attributes:{"class":"ac"}, hidden:true} //캠페인번호
                 ,{field:"lbrCd", title:"<spring:message code='ser.lbl.laborCd' />", width:100, attributes:{"class":"ac"}} //공임코드
                 ,{field:"lbrNm", title:"<spring:message code='ser.lbl.laborNm' />", width:200, attributes:{"class":"al"}} //공임명
                 ,{field:"cauItemCd", title:"<spring:message code='ser.lbl.cauItem' />", width:100, attributes:{"class":"ac"}}//원인부품코드
                 ,{field:"cauItemNm", title:"<spring:message code='ser.lbl.cauItemNm' />", width:150, attributes:{"class":"al"}, hidden:true}//원인부품명
                 ,{field:"phenCd", title:"<spring:message code='ser.lbl.phenCd' />", width:80, attributes:{"class":"ac"}}//현상코드
                 ,{field:"phenNm", title:"<spring:message code='ser.lbl.phenNm' />", width:150, attributes:{"class":"ac"}, hidden:true}//현상명
                 ,{field:"cauCd", title:"<spring:message code='ser.lbl.cauCd' />", width:80, attributes:{"class":"ac"}}//원인코드
                 ,{field:"cauNm", title:"<spring:message code='ser.lbl.cauNm' />", width:150, attributes:{"class":"al"}, hidden:true}//원인코드명
                 ,{field:"lbrQty", title:"<spring:message code='ser.lbl.qty' />", width:80, attributes:{"class":"ar"},format:"{0:n0}", hidden:true }//공임수량
                 ,{field:"lbrHm", title:"<spring:message code='ser.lbl.lbrTime' />", width:80, attributes:{"class":"ar"},format:"{0:n2}"} //공임시간
                 ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.confirmLbrAmt' />", width:120, attributes:{"class":"ar"},  format:"{0:n2}"} //공임금액
                 ,{field:"dlrCd", hidden:true}       // 딜러코드
                ]

    });
    //그리드 - 제조사 - 교환부품
    $("#bhmcItemGrid").kendoExtGrid({
        gridId:"G-CRM-1202-000003"
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
                        params["sHostCd"]      = "01"

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
                       rnum  :{type:"number",editable:false}
                      ,lbrCd :{type:"string", validation:{required:true}}
                      ,cauItemCd :{type:"string",editable:false}
                      ,cauItemNm :{type:"string",editable:false}
                      ,ltsModelCd :{type:"string",editable:false}
                      ,ltsModelNm :{type:"string",editable:false}
                      ,itemQty:{type:"number",editable:false}
                      ,creStartDt:{type:"date",editable:false}
                      ,creEndDt:{type:"date",editable:false}
                   } //fields
                }//model
            }//schema
        }//dataSource
       ,change:function(e){

           var selectedItem = this.dataItem(this.select());

           if (selectedItem != null) {

               // 공임코드
               $("#lbrCd1").val(selectedItem.lbrCd);
               // 부품코드
               $("#cauItemCd").val(selectedItem.cauItemCd);
               // LTS모델코드
               $("#ltsModelCd").val(selectedItem.ltsModelCd);
           }
       }
       ,editableOnlyNew:true
       ,editableOnlyNewExcludeColumns:[]
       ,autoBind:false
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
       ,appendEmptyColumn:true           //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,scrollable:true
       ,height:400
       ,sortable:false
       ,filterable:false
       ,columns:[
                  {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
                 ,{field:"lbrCd", title:"<spring:message code='ser.lbl.laborCd' />", width:100 , attributes:{"class":"al"}} // 공임코드
                 ,{field:"cauItemCd", title:"<spring:message code='ser.lbl.chgItemCd' />", width:100, attributes:{"class":"al"}}//부품코드
                 ,{field:"cauItemNm", title:"<spring:message code='ser.lbl.chgItemNm' />", width:200, attributes:{"class":"al"}}//부품명
                 ,{field:"itemQty", title:"<spring:message code='ser.lbl.itemQty' />", width:80, attributes:{"class":"ar"},  format:"{0:n2}"}
                 ,{field:"ltsModelCd", title:"<spring:message code='ser.lbl.ltsModel' />", width:100, attributes:{"class":"ac"}}//lts model code
                 ,{field:"creStartDt", title:"<spring:message code='ser.lbl.prdStartDt' />", width:120, attributes:{"class":"ac"}
                       ,format:"{0:<dms:configValue code='dateFormat' />}"
                 }//생산시작일
                 ,{field:"creEndDt", title:"<spring:message code='ser.lbl.prdEndDt' />", width:120, attributes:{"class":"ac"}
                       ,format:"{0:<dms:configValue code='dateFormat' />}"
                  }//생산종료일
                ]

    });

    // 파일 그리드 시작
    $("#fileResultGrid").kendoExtGrid({
        gridId:"G-CRM-0101-121213"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        // 캠페인 리스트 그리드의 선택된 파일키
                        var docId = $("#docId").val();
                        if ( dms.string.isNotEmpty(docId) ) {
                            params["sFileDocNo"] = docId;
                        } else {
                            return;
                        }

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
        ,height:180
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
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
    //파일업로드3:파일 다운로드  ****************************
    $("#fileResultGrid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#fileResultGrid").data("kendoExtGrid");
       var dataItem = grid.dataItem(grid.select());

       if(dms.string.isNotEmpty(dataItem)){
           dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
       }
    });

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
                        params["sFileDocNo"] = $("#activeFileDocNo").val();

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
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
       ,appendEmptyColumn:true           //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
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
    //파일 다운로드
    $("#fileGrid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#fileGrid").data("kendoExtGrid");
       var dataItem = grid.dataItem(grid.select());

       if(dms.string.isNotEmpty(dataItem)){
           dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
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

    // 결재목록에서 참조문서보기 클릭해서 파라미터가지고 페이지 조회한경우 상세조회 팝업을 열어준다
    <c:if test="${!empty makCd}">
        viewDetail("${makCd}");
    </c:if>

    //그리드 설정(딜러)
    $("#dlrGrid").kendoExtGrid({
        gridId:"G-CRM-0425-143800"
        ,dataSource:{
            transport:{
                read:{
                     url:"<c:url value='/cmm/cmp/dealer/selectDealers.do' />"
                }
                ,parameterMap:function(options, operation)
                {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"] = $("#sDlrCd").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                   id:"dlrCd"
                   ,fields:{
                       rnum:{type:"number"}
                       ,dlrCd:{ type:"string" }
                       ,dlrNm:{ type:"string" }
                  }
               }
            }
        }
        ,editable:false
        ,pageable:false
        ,appendEmptyColumn:true
        ,height:400
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:250}
            /*
            ,{field:"dlrGrpCd", title:"<spring:message code='global.lbl.dlrGrpCd' />", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"ownRgstNm", title:"<spring:message code='global.lbl.ownRgstNm' />", width:150}
            ,{field:"telNo", title:"<spring:message code='global.lbl.telNo' />", width:100}
            ,{field:"faxNo", title:"<spring:message code='global.lbl.faxNo' />", width:100}
            ,{field:"callCenTelNo", title:"<spring:message code='global.lbl.callCenTelNo' />", width:100}
            ,{field:"emgcCenTelNo", title:"<spring:message code='global.lbl.emgcCenTelNo' />", width:100}
            ,{field:"serDlrTelNo", title:"<spring:message code='global.lbl.serDlrTelNo' />", width:100}
            ,{field:"smsRemainAmount", title:"<spring:message code='global.lbl.smsRemainAmount' />", width:100
                ,attributes:{"class":"ac"}
            }
            ,{field:"smsRemainCnt", title:"<spring:message code='global.lbl.smsRemainCnt' />", width:100
                ,attributes:{"class":"ac"}
            }
             */
        ]
    });

    //그리드 설정(대상 딜러)
    $("#targDlrGrid").kendoExtGrid({
        gridId:"G-CRM-0424-211300"
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
                        params["sMakCd"]       = $("#makCd").val();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"dlrCd"
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
        ,dataBound:function(e){

            var mcdGrid = $("#mcdGrid").data("kendoExtGrid");
            var selectedItem = mcdGrid.dataItem(mcdGrid.select());

            if ( selectedItem !=null && selectedItem.statCd != "02" && selectedItem.statCd != "03" && selectedItem.statCd != "06" ) {
                $("[type=checkbox]", "#targDlrGrid").prop("disabled", false);
            } else {
                $("[type=checkbox]", "#targDlrGrid").prop("disabled", true);
            };

        }
        ,autoBind:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
        ,pageable:false
        ,sortable:false
        ,scrollable:true
        ,filterable:false
        ,selectable:"multiple"
        ,height:400
        ,columns:[
            {field:"makCd", title:"<spring:message code='global.lbl.crNo' />", hidden:true} // 캠페인코드
           ,{field:"targDlrCd", title:"<spring:message code='crm.lbl.dlrCd' />", width:80, attributes:{"class":"ac"}}   // 딜러코드
           ,{field:"targDlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:250, attributes:{"class":"al"}}   // 딜러명
        ]
    });

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

     //console.log("resumableSessionId:" + _that.opt["query"]["resumableSessionId"]);

     $("#progressWindow").data("kendoWindow").close();
     r.files = [];
     $(".resumable-list").html("");
 });
 r.on('fileSuccess', function(file, message) {

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
</script>
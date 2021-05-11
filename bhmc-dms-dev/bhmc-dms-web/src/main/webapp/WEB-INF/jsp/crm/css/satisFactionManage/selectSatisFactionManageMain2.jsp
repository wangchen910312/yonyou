<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>
<div id="resizableContainer">
    <!-- 만족도 조사 관리 -->
    <section class="group">

        <!-- 조회 조건 타이틀 시작 -->
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="crm.menu.satisfactionMng" /><!-- 만족도 조사관리 --></h1>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11161" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_call" id="btnRcpeExtrMapping"><spring:message code="crm.btn.rcpeExtrMapping" /><!-- 추출 실행--></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11162" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_modifi" id="btnDetail"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11163" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11164" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_add" id="btnAdd"><spring:message code="global.btn.add" /><!-- 추가 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11165" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_print" id="btnSatisFacMngPrint"><spring:message code="global.btn.print" /><!-- 인쇄 --></button>
            </dms:access>
            </div>
        </div>
        <!-- 조회 조건 타이틀 종료 -->

        <!-- 조회 조건 시작 -->
        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:9%;">
                    <col style="width:18%;">
                    <col style="width:10%;">
                    <col style="width:18%;">
                    <col style="width:8%;">
                    <col style="width:14%;">
                    <col style="width:9%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="crm.lbl.stsfIvstNm"/><!-- 만족도 조사 명 --></th>
                        <td>
                            <input id="sStsfIvstNm" name="sStsfIvstNm" type="text" class="form_input" maxlength="33">
                        </td>
                        <th scope="row"><spring:message code="crm.lbl.stsfIvstMthCd" /><!-- 만족도 조사 유형 --></th>
                        <td>
                            <input id="sStsfIvstMthCd" name="sStsfIvstMthCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="crm.lbl.stsfIvstExpdCd" /><!-- 만족도 조사 수단 --></th>
                        <td>
                            <input id="sStsfIvstExpdCd" name="sStsfIvstExpdCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="crm.lbl.stsfIvstTpCd" /><!-- 만족도 조사타입 --></th>
                        <td>
                            <input id="sStsfIvstTpCd" name="sStsfIvstTpCd" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input type="text" id="sStartRegDt" name="sStartRegDt" class="form_datepicker" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input type="text" id="sEndRegDt" name="sEndRegDt" class="form_datepicker" />
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='crm.lbl.stsfDtPlan'/><!-- 만족도조사 시행일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input type="text" id="sStsfStartDt" name="sStsfStartDt" class="form_datepicker" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input type="text" id="sStsfEndDt" name="sStsfEndDt" class="form_datepicker" />
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="crm.lbl.useYn" /><!-- 사용여부 --></th>
                        <td>
                            <input id="sUseYn" name="sUseYn" class="form_comboBox" />
                        </td>
                        <th scope="row"></th>
                        <td>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 조회 조건 종료 -->

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <!-- 만족도 조사 그리드 시작 -->
        <div class="table_grid">
            <div id="satisFactionManageGrid" class="resizable_grid"></div>
        </div>
        <!-- 만족도 조사 그리드 종료 -->
    </section>
</div>

<section id="satisFactionManageWindow" class="pop_wrap"><!-- 만족도 조사 상세 팝업-->

    <div id="mainTab" class="tab_area">
        <ul>
            <li id="satisFactionManageInfo" class="k-state-active" ><spring:message code="crm.title.stsfIvstDetail" /><!-- 만족도 조사 상세 --></li>
            <li id="satisFactionTargetInfo"><spring:message code='crm.menu.satisFactionPresent' /><!-- 만족도 조사 대상 관리 --></li>
            <li id="satisFactionResult"><spring:message code='global.lbl.stsfIvstRsltCont' /><!-- 만족도 조사결과 --></li>
        </ul>

        <div id="satisFactionManageTabInfo" class="mt0"><!-- 만족도 조사 상세 탭 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="crm.title.stsfIvstDetail" /></h2> <!-- 만족도 조사 상세 -->
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-13189" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_s btn_save" id="btnSurveyPreview"><spring:message code="crm.btn.surveyPreview" /><!-- 설문미리보기 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11174" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_s btn_save" id="btnSatisFacMngSave"><spring:message code="global.btn.save" /></button> <!-- 저장 -->
                    </dms:access>
                    </div>
                </div>
                <div class="table_form" id="stsfForm">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:13%;">
                            <col style="width:14%;">
                            <col style="width:11%;">
                            <col style="width:14%;">
                            <col style="width:10%;">
                            <col style="width:14%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody id="salesActiveMgmtForm" >
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.stsfIvstNm' /><!-- 만족도 조사명 --></span></th>
                                <td class="required_area" colspan="3">
                                    <input type="hidden" id="dlrCd" name="dlrCd" data-json-obj="true" data-name="<spring:message code="global.lbl.dlrCd" />" />
                                    <input type="hidden" id="seq" name="seq" data-json-obj="true" data-name="<spring:message code="crm.lbl.stsfIvstNm" />" />
                                    <input type="hidden" id="editYn" name="editYn" data-json-obj="true" data-name="" />
                                    <input id="stsfIvstNm" name="stsfIvstNm" class="form_input" maxlength="33" data-json-obj="true" required data-name="<spring:message code="crm.lbl.stsfIvstNm" />" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.stsfIvstTpCd' /><!-- 조사타입 --></span></th>
                                <td class="required_area">
                                    <input id="stsfIvstTpCd" name="stsfIvstTpCd" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.stsfIvstTpCd" />" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.stsfIvstMthCd' /><!-- 만족도 조사 유형 --></span></th>
                                <td class="required_area">
                                    <input id="stsfIvstMthCd" name="stsfIvstMthCd" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.stsfIvstMthCd" />" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.custTargYn' /></span><!-- 대상 --></th>
                                <td>
                                    <input id="custTargYn" name="custTargYn" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="global.lbl.custTargYn" />" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.stsfIvstExpdCd' /><!-- 만족도 조사수단 --></span></th>
                                <td class="required_area">
                                    <input id="stsfIvstExpdCd" name="stsfIvstExpdCd" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.stsfIvstExpdCd" />" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.startDt' /><!-- 시작일 --></span></th>
                                <td class="required_area">
                                    <input id="startDt" name="startDt" class="form_datepicker" data-json-obj="true" required data-name="<spring:message code="crm.lbl.startDt" />" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.endDt' /><!-- 종료일 --></span></th>
                                <td class="required_area">
                                    <input id="endDt" name="endDt" class="form_datepicker" data-json-obj="true" required data-name="<spring:message code="crm.lbl.endDt" />" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span id="custExtrAutoYnArea" class="bu_required"><spring:message code='crm.lbl.rcpeExtrSeq' /><!-- 대상자 추출 --></span></th>
                                <td class="required_area">
                                    <input id="custExtrAutoYn" name="custExtrAutoYn" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.custExtrAutoYn" />" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.subyTmplNm' /></span><!--  설문지명 --></th>
                                <td>
                                    <input id="subyTmplSeq" name="subyTmplSeq" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="global.lbl.custTargYn" />" />
                                </td>
                                <!-- ###################################################### 추출주기설정 1/5 HTML 추가 시작 1/5 -->
                                <th scope="row"><spring:message code='crm.lbl.custExtrCycleCont' /><!-- 고객추출주기 --></th>
                                <td colspan="3">
                                    <button type="button" class="btn_s" id="btnCycleDay" ><spring:message code='crm.btn.allDay' /><!-- 매일 --></button>
                                    <button type="button" class="btn_s" id="btnCycleWeek" ><spring:message code='crm.btn.allWeek' /><!-- 매주 --></button>
                                    <button type="button" class="btn_s btn_select" id="btnCycleSelect" ><spring:message code='global.btn.select' /><!-- 선택 --></button>
                                    <input id="cycleDatepicker" name="cycleDatepicker" class="form_datepicker multi_datepicker" />
                                    <input type="hidden" id="custExtrCycleTp" name="custExtrCycleTp" data-json-obj="true" />
                                </td>
                                <!-- ###################################################### 추출주기설정 1/5 HTML 추가 종료 -->
                            </tr>
                            <tr>
                                <th scope="row"><span id="rcpeExtrSeqArea" class="bu_required"><spring:message code='crm.lbl.rcpeExtrSeqCondition'/></span></th><!-- 대상자 추출조건 -->
                                <td class="required_area" colspan="3">
                                    <input id="rcpeExtrSeq" name="rcpeExtrSeq" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.rcpeExtrSeq" />" />
                                </td>
                                <th scope="row" ></th>
                                <td class="vt" colspan="3">
                                    <div id="weekSelect" style="display:none;">
                                    <c:forEach var="obj" items="${custExtrCycleWeekList}">
                                        <label class="label_check" style="width:43px;margin:0 0 2px;"><input type="checkbox" id="custExtrCycleWeek_<c:out value='${obj.cmmCd}' />" name="custExtrCycleWeek" class="form_check" value="<c:out value='${obj.cmmCd}' />" data-json-obj="true" /> <c:out value="${obj.cmmCdNm}" /></label>
                                    </c:forEach>
                                    </div>
                                    <div id="cycleDtTxtArea" style="display:none;">
                                        <textarea rows="2" cols="" id="cycleDt" name="cycleDt" class="form_textarea" maxlength="1000" disabled ></textarea>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.lastExtrDt' /><!-- 최근추출일 --></th>
                                <td>
                                    <input type="text" id="lastExtrDt" name="lastExtrDt" class="form_datepicker form_readonly" disabled />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.useYn' /><!-- 사용여부 --></span></th>
                                <td class="required_area">
                                    <input id="useYn" name="useYn" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.useYn" />" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.regUsrId' /><!-- 등록자 --></th>
                                <td>
                                    <input type="text" id="regUsrNm" name="regUsrNm" class="form_input form_readonly" disabled />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일 --></th>
                                <td>
                                    <input id="regDt" name="regDt" class="form_datepicker form_readonly" disabled />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.stsfCont'/></th><!-- 설명/화술 -->
                                <td colspan="7">
                                    <textarea rows="5" cols="" id="stsfCont" name="stsfCont" class="form_textarea" maxlength="1330" data-json-obj="true" data-name="<spring:message code="crm.lbl.custCareCont" />" ></textarea>
                                </td>
                            </tr>
                            <tr class="targExtractArea hidden" >
                                <th scope="row" rowspan="12"><spring:message code='crm.lbl.rcpeExtrSeqCondition'/><!-- 대상자 추출조건 --></th>
                                <td colspan="3">
                                    <a href="javascript:f_addInput('CRM7500318');"><spring:message code="ser.lbl.calcEndDt" /><!-- 정비 일자 --></a>
                                </td>
                                <td colspan="4" rowspan="12" style="vertical-align:top; padding-top:5px;">
                                    <div id="CRM7500318">
                                        <div class="target_btn"><button id="CRM7500318_del" class="btn_s btn_target_delete">delete</button></div>
                                        <div class="target_title2"><spring:message code="ser.lbl.calcEndDt" /></div><!-- 정산완료일 -->
                                        <div class="target_content2">
                                            <input id="CRM7500318_fleg" name="CRM7500318_fleg" type="hidden" value="N">
                                            <div class="form_float">
                                                <div class="date_left">
                                                    <input id="CRM7500318-01" name="CRM7500318-01" class="form_datepicker ac">
                                                    <span class="txt_from">~</span>
                                                </div>
                                                <div class="date_right">
                                                    <input id="CRM7500318-02" name="CRM7500318-02" class="form_datepicker ac">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="target_empty"></div>
                                    </div>
                                    <div id="CRM7500319">
                                        <div class="target_btn"><button id="CRM7500319_del" class="btn_s btn_target_delete">delete</button></div>
                                        <div class="target_title2"><spring:message code="ser.lbl.calcEndDt" /></div><!-- 정산완료일 -->
                                        <div class="target_content2">
                                            <input id="CRM7500319_fleg" name="CRM7500319_fleg" type="hidden" value="N">
                                            <div class="form_float">
                                                    <spring:message code="crm.lbl.RoCalcEndAfter" /><!-- 정산 완료일 후 00 일 -->
                                                    <input id="CRM7500319-01" name="CRM7500319-01" type="nember" value="" class="form_numeric ar" style="width:22%">
                                                    <spring:message code="global.lbl.day" /><!-- 일 -->
                                            </div>
                                        </div>
                                        <div class="target_empty"></div>
                                    </div>
                                    <div id="CRM7500320">
                                        <div class="target_btn"><button id="CRM7500320_del" class="btn_s btn_target_delete">delete</button></div>
                                        <div class="target_title2"><spring:message code="crm.lbl.runDistVal" /></div><!-- 주행 거리 -->
                                        <div class="target_content2">
                                            <input id="CRM7500320_fleg" name="CRM7500320_fleg" type="hidden" value="N">
                                            <div class="form_float">
                                                <div class="date_left">
                                                    <input id="CRM7500320-01" name="CRM7500320-01" type="nember" value="" class="form_numeric ar" style="width:84%">Km
                                                    <span class="txt_from">~</span>
                                                </div>
                                                <div class="date_right">
                                                    <input id="CRM7500320-02" name="CRM7500320-02" type="nember" value="" class="form_numeric ar" style="width:82%">Km
                                                </div>
                                            </div>
                                        </div>
                                        <div class="target_empty"></div>
                                    </div>
                                    <div id="CRM7500321">
                                        <div class="target_btn"><button id="CRM7500321_del" class="btn_s btn_target_delete">delete</button></div>
                                        <div class="target_title2"><spring:message code="crm.lbl.lbrAmt" /></div><!-- 정비금액 -->
                                        <div class="target_content2">
                                            <input id="CRM7500321_fleg" name="CRM7500321_fleg" type="hidden" value="N">
                                            <div class="form_float">
                                                <div class="date_left">
                                                    <input id="CRM7500321-01" name="CRM7500321-01" type="nember" value="" class="form_numeric ar">
                                                    <span class="txt_from">~</span>
                                                </div>
                                                <div class="date_right">
                                                    <input id="CRM7500321-02" name="CRM7500321-02" type="nember" value="" class="form_numeric ar">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="target_empty"></div>
                                    </div>
                                    <div id="CRM7500323">
                                        <div class="target_btn"><button id="CRM7500323_del" class="btn_s btn_target_delete">delete</button></div>
                                        <div class="target_title2"><spring:message code="par.lbl.invResvWorkType" /></div><!-- 정비위탁유형 -->
                                        <div class="target_content2">
                                            <input id="CRM7500323_fleg" name="CRM7500323_fleg" type="hidden" value="N">
                                            <select id="CRM7500323-01" name="CRM7500323-01" multiple="multiple" data-bind="value:values" class="form_comboBox" ></select>
                                        </div>
                                        <div class="target_empty"></div>
                                    </div>
                                    <div id="CRM7500355">
                                        <div class="target_btn"><button id="CRM7500355_del" class="btn_s btn_target_delete">delete</button></div>
                                        <div class="target_title2"><spring:message code="ser.lbl.lbrTp" /></div><!-- 수리 유형 -->
                                        <div class="target_content2">
                                            <input id="CRM7500355_fleg" name="CRM7500355_fleg" type="hidden" value="N">
                                            <select id="CRM7500355-01" name="CRM7500355-01" multiple="multiple" data-bind="value:values" class="form_comboBox"></select>
                                        </div>
                                        <div class="target_empty"></div>
                                    </div>
                                    <div id="CRM7500351">
                                        <div class="target_btn"><button id="CRM7500351_del" class="btn_s btn_target_delete">delete</button></div>
                                        <div class="target_title2"><spring:message code="crm.lbl.LastRoDt" /></div><!-- 最后1次维修时间 마지막번수리시간 -->
                                        <div class="target_content2">
                                            <input id="CRM7500351_fleg" name="CRM7500351_fleg" type="hidden" value="N">
                                            <spring:message code="crm.lbl.RoCalcEndAfter" /><!-- 정산 완료일 후 00 일 -->
                                            <input id="CRM7500351-01" name="CRM7500351-01" type="nember" value="" class="form_numeric ar" style="width:22%">
                                            <spring:message code="global.lbl.day" /><!-- 일 -->
                                        </div>
                                        <div class="target_empty"></div>
                                    </div>
                                    <div id="CRM7500352">
                                        <div class="target_btn"><button id="CRM7500352_del" class="btn_s btn_target_delete">delete</button></div>
                                        <div class="target_title2"><spring:message code="crm.lbl.nextRoDt" />(<spring:message code="global.lbl.bef" />)</div><!-- 下次保养时间 다음번 보양시간 -->
                                        <div class="target_content2">
                                            <input id="CRM7500352_fleg" name="CRM7500352_fleg" type="hidden" value="N">
                                            <input id="CRM7500352-01" name="CRM7500352-01" type="nember" value="" class="form_numeric ar" style="width:22%">
                                            <spring:message code="global.lbl.day" /><!-- 일 -->
                                        </div>
                                        <div class="target_empty"></div>
                                    </div>
                                    <div id="CRM7500359">
                                        <div class="target_btn"><button id="CRM7500359_del" class="btn_s btn_target_delete">delete</button></div>
                                        <div class="target_title2"><spring:message code='ser.lbl.dlrRoTp' /></div><!-- 자체RO유형 -->
                                        <div class="target_content2">
                                            <input id="CRM7500359_fleg" name="CRM7500359_fleg" type="hidden" value="N">
                                            <select id="CRM7500359-03" name="CRM7500359-03" multiple="multiple" data-bind="value:values" class="form_comboBox" ></select>
                                        </div>
                                        <div class="target_empty"></div>
                                    </div>

                                </td>
                            </tr>
                            <tr class="targExtractArea hidden" >
                                <td colspan="4">
                                    <a href="javascript:f_addInput('CRM7500319');"><spring:message code="crm.lbl.lbrDtAfter" /><!-- 정비 일자 --></a>
                                </td>
                            </tr>
                            <tr class="targExtractArea hidden" >
                                <td colspan="4">
                                    <a href="javascript:f_addInput('CRM7500320');"><spring:message code="crm.lbl.runDistVal" /><!-- 주행 거리 --></a>
                                </td>
                            </tr>
                            <tr class="targExtractArea hidden" >
                                <td colspan="4">
                                    <a href="javascript:f_addInput('CRM7500321');"><spring:message code="crm.lbl.lbrAmt" /></a>
                                </td>
                            </tr>
                            <tr class="targExtractArea hidden" >
                                <td colspan="4">
                                    <a href="javascript:f_addInput('CRM7500323');"><spring:message code="par.lbl.invResvWorkType" /><!-- 정비위탁유형 --></a>
                                </td>
                            </tr>
                            <tr class="targExtractArea hidden" >
                                <td colspan="4">
                                    <a href="javascript:f_addInput('CRM7500355');"><spring:message code="ser.lbl.lbrTp" /><!-- 수리유형 --></a>
                                </td>
                            </tr>
                            <tr class="targExtractArea hidden" >
                                <td colspan="4">
                                    <a href="javascript:f_addInput('CRM7500351');"><spring:message code="crm.lbl.LastRoDt" /><!-- 最后1次维修时间 마지막번수리시간 --></a>
                                </td>
                            </tr>
                            <tr class="targExtractArea hidden" >
                                <td colspan="4">
                                    <a href="javascript:f_addInput('CRM7500352');"><spring:message code="crm.lbl.nextRoDt" /><!-- 下次保养时间 다음번 보양시간 --></a>
                                </td>
                            </tr>
                            <tr class="targExtractArea hidden" >
                                <td colspan="4">
                                    <a href="javascript:f_addInput('CRM7500359');"><spring:message code="ser.lbl.dlrRoTp" /><!-- //자체RO유형 --></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>

        <div id="satisFactionTargetTabInfo" class="mt0"><!-- 만족도 조사 대상 관리 탭 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='crm.menu.satisFactionPresent' /><!-- 만족도 조사 대상 관리 --></h2>
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-11175" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_save" id="btnSave"><spring:message code='global.btn.save' /></button><!-- 저장 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-11176" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_del" id="btnDel"><spring:message code='global.btn.rowDel' /></button> <!-- 행삭제 -->
                    </dms:access>
                    </div>
                </div>
                <div class="table_grid">
                    <div id="presentDetailGrid"></div>
                </div>
            </section>
        </div>

        <div id="satisFactionResult" class="mt0"><!-- 만족도 조사 결과 탭 -->

            <div id="subTab" class="tab_area">
                <ul>
                    <li id="shortQuestionResultInfo" class="k-state-active" ><spring:message code='crm.lbl.shortQuestSummary' /><!-- 객관식 요약 --></li>
                    <li id="shortQuestionResultDtlInfo"><spring:message code='crm.lbl.shortQuestDtl' /><!-- 객관식 상세 --></li>
                    <li id="multipleQuestionResultDtlInfo"><spring:message code='crm.lbl.multipleQuestDtl' /><!-- 주관식 상세 --></li>
                </ul>

                <div id="shortQuestionResultTabInfo" class="mt0"><!-- 객관식 요약 탭 -->
                    <section class="group">
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code='crm.lbl.shortQuestSummary' /><!-- 객관식 요약 --></h2>
                            <div class="btn_right">
                                <button type="button" class="btn_s" id="btnExcelExportS"><spring:message code="global.btn.excelExport" /><!-- 엑셀Export --></button>
                            </div>
                        </div>
                        <!-- 설문 -->
                        <div style="height:245px;">
                            <form id="surveyInfoForm">
                                <input type="hidden" id="seq" name="seq" /><!-- 만족도조사 설문일때 사용 -->
                                <div class="survey">
                                    <h2 id="surveyName"></h2>
                                    <div class="table_form">
                                        <table>
                                            <caption></caption>
                                            <colgroup>
                                                <col style="width:5%;">
                                                <col style="width:20%;">
                                                <col>
                                                <col style="width:10%;">
                                                <col style="width:10%;">
                                            </colgroup>
                                            <tbody id="survey_content_table">
                                                <tr>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- //설문 -->
                    </section>
                </div>

                <div id="shortQuestionResultDtlTabInfo" class="mt0"><!-- 객관식 상세  탭 -->
                    <section class="group">
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code='crm.lbl.shortQuestDtl' /><!-- 객관식 상세 --></h2>
                            <div class="btn_right">
                                <button type="button" class="btn_s" id="btnExcelExportM"><spring:message code="global.btn.excelExport" /><!-- 엑셀Export --></button>
                            </div>
                        </div>
                        <div class="table_grid">
                            <div id="shortQuestionResultsGrid"></div>
                        </div>
                    </section>
                </div>

                <div id="multipleQuestionResultTabInfo" class="mt0"><!-- 주관식 상세 관리 탭 -->
                    <section class="group">
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code='crm.lbl.multipleQuestDtl' /><!-- 주관식 상세 --></h2>
                            <div class="btn_right">
                                <button type="button" class="btn_s" id="btnExcelExportC"><spring:message code="global.btn.excelExport" /><!-- 엑셀Export --></button>
                            </div>
                        </div>
                        <div class="table_grid">
                            <div id="multipleQuestionResultsGrid"></div>
                        </div>
                    </section>
                </div>

            </div>

        </div>

    </div>

</section> <!-- end  class="pop_wrap" -->

<script type="text/javascript">

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

    function fnShortQuestionResults() {

        var satisFactionManageGrid = $("#satisFactionManageGrid").data("kendoExtGrid");
        var selectedItem = satisFactionManageGrid.dataItem(satisFactionManageGrid.select());
        if(selectedItem === null){
            return;
        }

        var params = {
                "sSeq":selectedItem.seq
                ,"sQestTp":"M"
        };
        //console.log("params : ",params);
        //return;
        $.ajax({
            url:"<c:url value='/crm/css/satisFactionManage/selectShortQuestionResults.do'/>",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            }
        }).done(function(result) {

            $("#surveyName").empty();
            $("#survey_content_table").empty();

            var questionList = result["questionList"];
            var questionListCnt = result["questionListCnt"];
            var answerList = result["answerList"];
            var answerListCnt = result["answerListCnt"];
            var subyTmplSeq = result["subyTmplSeq"];
            var stsfIvstY = result["stsfIvstY"];
            var stsfIvstN = result["stsfIvstN"];

            var template = "";
            var result = "";
            var data = [];
            var lastIdx;

            $("#surveyName").text(result["stsfIvstNm"]);
            $("#subyTmplSeq").val(subyTmplSeq);

            var headTmpl =
                                    '<tr>'+
                                        '<td colspan="4" style="padding-left:10px;"><h3>#:index #. #:qestCont # #:answSelCntCont #</h3></td>'+
                                    '</tr>';
            var singleTmpl =
                                    '<tr>'+
                                        '<td></td>'+
                                        '<td style="text-align:left;">[#:sIdx #] #:answCont #</td>'+
                                        '<td><div style="width:#:resultPer #%;height:10px;background-color:#:bgColor#;"></div></td>'+
                                        '<td style="text-align:right;">#:resultCnt # <spring:message code="crm.lbl.count"/></td>'+
                                        '<td style="text-align:left;">[#:resultPer # %]</td>'+
                                    '</tr>';

            var multiTmpl =
                                    '<tr>'+
                                        '<td></td>'+
                                        '<td style="text-align:left;">[#:mIdx #] #:answCont #</td>'+
                                        '<td><div style="width:#:resultPer #%;height:10px;background-color:#:bgColor#;"></div></td>'+
                                        '<td style="text-align:right;">#:resultCnt # <spring:message code="crm.lbl.count"/></td>'+
                                        '<td style="text-align:left;">[#:resultPer # %]</td>'+
                                    '</tr>';

            var stsfIvstYnTmpl =
                                    '<tr>'+
                                        '<td colspan="4" style="padding-left:10px;"><h3><spring:message code="crm.lbl.stsfIvstYn"/></h3></td>'+
                                    '</tr>'+
                                    '<tr>'+
                                        '<td></td>'+
                                        '<td style="text-align:left;"><spring:message code="crm.lbl.satisfaction"/></td>'+
                                        '<td></td>'+
                                        '<td style="text-align:right;">'+stsfIvstY+' <spring:message code="crm.lbl.count"/></td>'+
                                        '<td style="text-align:left;"></td>'+
                                    '</tr>'+
                                    '<tr>'+
                                        '<td></td>'+
                                        '<td style="text-align:left;"><spring:message code="crm.lbl.dissatisfied"/></td>'+
                                        '<td></td>'+
                                        '<td style="text-align:right;">'+stsfIvstN+' <spring:message code="crm.lbl.count"/></td>'+
                                        '<td style="text-align:left;"></td>'+
                                    '</tr>';

            if ( answerListCnt < 1 ) {
                // 객관식요약 / 객관식 상세  / 주관식 상세
                template = kendo.template(headTmpl);
                data = {
                        index:1
                        ,qestCont:"<spring:message code='crm.title.stsfPresentResult' var='arguMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${arguMsg}'/>"       // // {만족도 조사 설문결과} 이(가) 없습니다.
                        ,answSelCntCont:""
                }
                result += template(data);

            } else {

                $("#btnExcelExportS").data("kendoButton").enable(true);
                $("#btnExcelExportM").data("kendoButton").enable(true);
                $("#btnExcelExportC").data("kendoButton").enable(true);

                //문제 for
                for(var i=0;i < questionList.length;i++){
                    var subyTmplSeq = questionList[i].subyTmplSeq;
                    var subyTmplQestSeq = questionList[i].subyTmplQestSeq;
                    //체크박스의 경우 선택할수 있는  갯수가 정해져 있을경우 문제옆에 선택가능한 갯수를 표현해 준다.
                    var answSelCntCont = "";
                    if ( questionList[i].qestTpCd == "02" && questionList[i].answSelCnt > 0 ) {
                        answSelCntCont = '( <spring:message code="crm.lbl.selected" arguments="'+questionList[i].answSelCnt+'" /> )';
                    };

                    template = kendo.template(headTmpl);
                    data = {
                            index:(i+1)
                            ,qestCont:questionList[i].qestCont
                            ,answSelCntCont:answSelCntCont
                    }
                    result += template(data);
                    lastIdx = (data.index)+1;

                    var sIdx = 0;       // 객관식 질문 idx (sortOrder)
                    var mIdx = 0;       // 주관식 질문 idx (itemSeq)
                    //답변 for
                    for(var j=0;j < answerList.length;j++){

                        if(questionList[i].qestTpCd == "01"){
                            //객관식 단답형
                            if(subyTmplSeq == answerList[j].subyTmplSeq && subyTmplQestSeq == answerList[j].subyTmplQestSeq){
                                template = kendo.template(singleTmpl);
                                data = {subyTmplSeq:answerList[j].subyTmplSeq
                                        ,subyTmplQestSeq:answerList[j].subyTmplQestSeq
                                        , itemSeq:answerList[j].itemSeq
                                        , answCont:answerList[j].answCont
                                        , answScoreVal:answerList[j].answScoreVal
                                        , qestWgtVal:questionList[i].qestWgtVal
                                        , qestTpCd:questionList[i].qestTpCd
                                        , resultCnt:answerList[j].resultCnt
                                        , resultPer:answerList[j].resultPer
                                        , sIdx:answerList[j].sortOrder
                                        , bgColor:"#2484d4"
                                }
                                result += template(data);
                            }
                        }else if(questionList[i].qestTpCd == "02"){
                            //객관식 다답형
                            if(subyTmplSeq == answerList[j].subyTmplSeq && subyTmplQestSeq == answerList[j].subyTmplQestSeq){
                                template = kendo.template(multiTmpl);
                                data = {subyTmplSeq:answerList[j].subyTmplSeq
                                        ,subyTmplQestSeq:answerList[j].subyTmplQestSeq
                                        , itemSeq:answerList[j].itemSeq
                                        , answCont:answerList[j].answCont
                                        , answScoreVal:answerList[j].answScoreVal
                                        , qestWgtVal:questionList[i].qestWgtVal
                                        , qestTpCd:questionList[i].qestTpCd
                                        , resultCnt:answerList[j].resultCnt
                                        , resultPer:answerList[j].resultPer
                                        , mIdx:answerList[j].sortOrder
                                        , bgColor:"#2484d4"
                                }
                                result += template(data)
                            }

                        }
                    }
                }

                //만족여부 추가
                result += stsfIvstYnTmpl;

            };

            $("#survey_content_table").append(result);

        });
        // 만족도 조사 설문조사

    };

    var shortQuestGridColumns = [];
    var multipleQuestGridColumns = [];

    function gridCommonParams(sQestTp) {
        // 그리드 상세 조회 및 엑셀export 수량 확인을 위한 공통 param

        var params = {};

        if ( dms.string.isEmpty(sQestTp) ) {

            return;
        } else {

            params["sDlrCd"] = $("#dlrCd").val();
            params["sStsfIvstSeq"] = $("#seq").val();;
            params["sQestTp"] = sQestTp

        };

        return params;

    };

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
    }


    // 초기화 ( 데이터 초기화, 읽기전용상태 초기화 )
    function initStsfDetail(){

        $("#editYn").val("Y"); //수정모드
        $("#dlrCd").val(""); //딜러코드
        $("#seq").val(""); //만족도조사 일련번호
        $("#subyTmplSeq").data("kendoExtDropDownList").value("");                          //설문지 일련번호
        $("#subyTmplSeq").data("kendoExtDropDownList").enable(true);
        $("#stsfIvstNm").val("").attr("readonly", false).removeClass("form_readonly");  //만족도 조사명
        $("#stsfIvstTpCd").data("kendoExtDropDownList").value("");                         //조사타입
        $("#stsfIvstTpCd").data("kendoExtDropDownList").readonly(false);
        $("#stsfIvstTpCd").parent().removeClass("readonly_area");
        $("#stsfIvstMthCd").data("kendoExtDropDownList").value("");                        //유형
        $("#stsfIvstMthCd").data("kendoExtDropDownList").readonly(false);
        $("#stsfIvstMthCd").parent().removeClass("readonly_area");
        $("#custTargYn").data("kendoExtDropDownList").value("Y");                          //고객대상여부
        $("#custTargYn").data("kendoExtDropDownList").readonly(false);
        $("#custTargYn").parent().removeClass("readonly_area");
        $("#stsfIvstExpdCd").data("kendoExtDropDownList").value("");                       //만족도 조사수단
        $("#stsfIvstExpdCd").data("kendoExtDropDownList").readonly(false);
        $("#stsfIvstExpdCd").parent().removeClass("readonly_area");

        var sysDate = new Date("<c:out value='${sysStartDate}' />");
        var yy = sysDate.getFullYear();
        var mm = sysDate.getMonth();
        var dd = sysDate.getDate();

        $("#startDt").parent().removeClass("readonly_area");                                     //시작일
        var startDt = $("#startDt").data("kendoExtMaskedDatePicker")
        startDt.value("");
        startDt.readonly(false);
        startDt.min(new Date(yy,mm,dd));
        startDt.max(new Date(2099, 11, 31));

        $("#endDt").parent().removeClass("readonly_area");                                       //종료일
        var endDt = $("#endDt").data("kendoExtMaskedDatePicker")
        endDt.value("");
        endDt.readonly(false);
        endDt.min(new Date(yy,mm,dd));
        endDt.max(new Date(2099, 11, 31));

        $("#custExtrAutoYn").data("kendoExtDropDownList").readonly(false);                 //대상자 추출
        $("#custExtrAutoYn").parent().removeClass("readonly_area");
        $("#custExtrAutoYn").data("kendoExtDropDownList").value("N");
        $("#subyTmplSeq").data("kendoExtDropDownList").readonly(false);                    //설문지명
        $("#subyTmplSeq").parent().removeClass("readonly_area");
        $("#rcpeExtrSeq").data("kendoExtDropDownList").value("");                          //고객 추출조건
        $("#rcpeExtrSeq").data("kendoExtDropDownList").readonly(false);
        $("#rcpeExtrSeq").parent().removeClass("readonly_area");
        $("#lastExtrDt").data("kendoExtMaskedDatePicker").value("");                    //최근추출일
        $("#stsfCont").val("").attr("readonly", false).removeClass('form_readonly');    //설명/화술

        $("#custExtrCycleWeek").val(""); //주기설정
        $("#useYn").data("kendoExtDropDownList").value("N"); //사용여부
        $("#useYn").data("kendoExtDropDownList").enable(true);
        $("#regUsrNm").val(""); //등록자
        $("#regDt").data("kendoExtMaskedDatePicker").value(""); //등록일

        // ###################################################### 추출주기설정 4/5 초기화 시작
        // 요일 선택 체크박스 영역 초기화
        $("#weekSelect").hide();
        $("input[name=custExtrCycleWeek]:checkbox").prop("checked",false);

        // 날짜 선택 텍스트 박스
        $("#cycleDtTxtArea").hide();
        custExtrCycleDt = [];
        $("#cycleDt").val("");

        // 버튼 값 초기화
        $("#btnRcpeExtrMapping").data("kendoButton").enable(false);
        $("#btnSatisFacMngPrint").data("kendoButton").enable(false);

        $("#btnExcelExportS").data("kendoButton").enable(false);
        $("#btnExcelExportM").data("kendoButton").enable(false);
        $("#btnExcelExportC").data("kendoButton").enable(false);


        $("#custExtrCycleTp").val("");
        // 버튼 활성화 클래스 초기화
        $("#btnCycleDay").removeClass("btn_active");
        $("#btnCycleWeek").removeClass("btn_active");
        $("#btnCycleSelect").removeClass("btn_active");
        // ###################################################### 추출주기설정 4/5 초기화 종료

        cycleCheckDisTrue();

        //탭 선택 초기화
        var mainTabStrip = $("#mainTab").data("kendoExtTabStrip");
        mainTabStrip.select(0);
        $("#presentDetailGrid").data("kendoExtGrid").dataSource.data([]);

        // 고객추출조건 초기화
        $("#CRM7500318-01").data("kendoExtMaskedDatePicker").value("");
        $("#CRM7500318-02").data("kendoExtMaskedDatePicker").value("");
        $("#CRM7500319-01").data("kendoExtNumericTextBox").value("");
        $("#CRM7500320-01").data("kendoExtNumericTextBox").value("");
        $("#CRM7500320-02").data("kendoExtNumericTextBox").value("");
        $("#CRM7500321-01").data("kendoExtNumericTextBox").value("");
        $("#CRM7500321-02").data("kendoExtNumericTextBox").value("");
        $("#CRM7500323-01").data("kendoMultiSelect").value("");
        $("#CRM7500355-01").data("kendoMultiSelect").value("");
        $("#CRM7500351-01").data("kendoExtNumericTextBox").value("");
        $("#CRM7500352-01").data("kendoExtNumericTextBox").value("");
        $("#CRM7500359-03").data("kendoMultiSelect").value("");

        $("#CRM7500318-01").data("kendoExtMaskedDatePicker").readonly(false);
        $("#CRM7500318-02").data("kendoExtMaskedDatePicker").readonly(false);
        $("#CRM7500319-01").data("kendoExtNumericTextBox").readonly(false);
        $("#CRM7500320-01").data("kendoExtNumericTextBox").readonly(false);
        $("#CRM7500320-02").data("kendoExtNumericTextBox").readonly(false);
        $("#CRM7500321-01").data("kendoExtNumericTextBox").readonly(false);
        $("#CRM7500321-02").data("kendoExtNumericTextBox").readonly(false);
        $("#CRM7500323-01").data("kendoMultiSelect").readonly(false);
        $("#CRM7500355-01").data("kendoMultiSelect").readonly(false);
        $("#CRM7500351-01").data("kendoExtNumericTextBox").readonly(false);
        $("#CRM7500352-01").data("kendoExtNumericTextBox").readonly(false);
        $("#CRM7500359-03").data("kendoMultiSelect").readonly(false);

        $("#CRM7500318-01").parent().removeClass("readonly_area");
        $("#CRM7500318-02").parent().removeClass("readonly_area");
        $("#CRM7500319-01").parent().removeClass("readonly_area");
        $("#CRM7500320-01").parent().removeClass("readonly_area");
        $("#CRM7500320-02").parent().removeClass("readonly_area");
        $("#CRM7500321-01").parent().removeClass("readonly_area");
        $("#CRM7500321-02").parent().removeClass("readonly_area");
        $("#CRM7500323-01").parent().removeClass("readonly_area");
        $("#CRM7500323-01").parent().find("div").removeClass("form_readonly");
        $("#CRM7500355-01").parent().removeClass("readonly_area");
        $("#CRM7500355-01").parent().find("div").removeClass("form_readonly");
        $("#CRM7500351-01").parent().removeClass("readonly_area");
        $("#CRM7500352-01").parent().removeClass("readonly_area");
        $("#CRM7500359-03").parent().removeClass("readonly_area");
        $("#CRM7500359-03").parent().find("div").removeClass("form_readonly");

        $("#CRM7500318_del").removeClass("hidden");
        $("#CRM7500319_del").removeClass("hidden");
        $("#CRM7500320_del").removeClass("hidden");
        $("#CRM7500321_del").removeClass("hidden");
        $("#CRM7500323_del").removeClass("hidden");
        $("#CRM7500355_del").removeClass("hidden");
        $("#CRM7500351_del").removeClass("hidden");
        $("#CRM7500352_del").removeClass("hidden");
        $("#CRM7500359_del").removeClass("hidden");

        $(".targExtractArea").addClass("hidden")

        f_showHideInput();
    };

    //검색조건 초기화
    function searchInit(){

        $("#sStsfIvstNm").val(""); //만족도 조사명
        $("#sStsfIvstTpCd").data("kendoExtDropDownList").value(""); //만족도 조사타입
        $("#sStsfIvstMthCd").data("kendoExtDropDownList").value(""); //만족도 조사 유형
        $("#sStsfIvstExpdCd").data("kendoExtDropDownList").value(""); //만족도 조사수단

    };

    // form - 읽기전용
    function readonlyForm(){

        $("#stsfIvstNm").attr("readonly", true).addClass("form_readonly");      //만족도 조사명
        $("#stsfIvstTpCd").data("kendoExtDropDownList").readonly(true);            //만족도 조사타입
        $("#stsfIvstTpCd").parent().addClass("readonly_area");
        $("#stsfIvstMthCd").data("kendoExtDropDownList").readonly(true);           //유형
        $("#stsfIvstMthCd").parent().addClass("readonly_area");
        $("#custTargYn").data("kendoExtDropDownList").readonly(true);              //고객대상여부
        $("#custTargYn").parent().addClass("readonly_area");
        $("#stsfIvstExpdCd").data("kendoExtDropDownList").readonly(true);          //만족도 조사수단
        $("#stsfIvstExpdCd").parent().addClass("readonly_area");
        $("#startDt").data("kendoExtMaskedDatePicker").readonly(true);          //시작일
        $("#startDt").parent().addClass("readonly_area");
        $("#endDt").data("kendoExtMaskedDatePicker").readonly(true);            //종료일
        $("#endDt").parent().addClass("readonly_area");
        $("#custExtrAutoYn").data("kendoExtDropDownList").readonly(true);          //대상자 추출
        $("#custExtrAutoYn").parent().addClass("readonly_area");
        $("#subyTmplSeq").data("kendoExtDropDownList").readonly(true);             //설문지명
        $("#subyTmplSeq").parent().addClass("readonly_area");
        $("#rcpeExtrSeq").data("kendoExtDropDownList").readonly(true);             //대상자 추출조건
        $("#rcpeExtrSeq").parent().addClass("readonly_area");
        $("#stsfCont").attr("readonly", true).addClass('form_readonly');        //설명/화술

        $("#CRM7500318-01").data("kendoExtMaskedDatePicker").readonly(true);
        $("#CRM7500318-02").data("kendoExtMaskedDatePicker").readonly(true);
        $("#CRM7500319-01").data("kendoExtNumericTextBox").readonly(true);
        $("#CRM7500320-01").data("kendoExtNumericTextBox").readonly(true);
        $("#CRM7500320-02").data("kendoExtNumericTextBox").readonly(true);
        $("#CRM7500321-01").data("kendoExtNumericTextBox").readonly(true);
        $("#CRM7500321-02").data("kendoExtNumericTextBox").readonly(true);
        $("#CRM7500323-01").data("kendoMultiSelect").readonly(true);
        $("#CRM7500355-01").data("kendoMultiSelect").readonly(true);
        $("#CRM7500351-01").data("kendoExtNumericTextBox").readonly(true);
        $("#CRM7500352-01").data("kendoExtNumericTextBox").readonly(true);
        $("#CRM7500359-03").data("kendoMultiSelect").readonly(true);

        $("#CRM7500318-01").parent().addClass("readonly_area");
        $("#CRM7500318-02").parent().addClass("readonly_area");
        $("#CRM7500319-01").parent().addClass("readonly_area");
        $("#CRM7500320-01").parent().addClass("readonly_area");
        $("#CRM7500320-02").parent().addClass("readonly_area");
        $("#CRM7500321-01").parent().addClass("readonly_area");
        $("#CRM7500321-02").parent().addClass("readonly_area");
        $("#CRM7500323-01").parent().addClass("readonly_area");
        $("#CRM7500323-01").parent().find("div").addClass("form_readonly");
        $("#CRM7500355-01").parent().addClass("readonly_area");
        $("#CRM7500355-01").parent().find("div").addClass("form_readonly");
        $("#CRM7500351-01").parent().addClass("readonly_area");
        $("#CRM7500352-01").parent().addClass("readonly_area");
        $("#CRM7500359-03").parent().addClass("readonly_area");
        $("#CRM7500359-03").parent().find("div").addClass("form_readonly");

        $("#CRM7500318_del").addClass("hidden");
        $("#CRM7500319_del").addClass("hidden");
        $("#CRM7500320_del").addClass("hidden");
        $("#CRM7500321_del").addClass("hidden");
        $("#CRM7500323_del").addClass("hidden");
        $("#CRM7500355_del").addClass("hidden");
        $("#CRM7500351_del").addClass("hidden");
        $("#CRM7500352_del").addClass("hidden");
        $("#CRM7500359_del").addClass("hidden");

    };

    // 날짜 검증
    function fnChkDateValue(e){

        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

        //등록시작일
        if(id === 'sStsfStartDt'){
            frYY = this.value().getFullYear();
            frMM = this.value().getMonth();
            frDD = this.value().getDate();
            $("#sStsfEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'sStsfEndDt'){//등록종료일
            toYY = this.value().getFullYear();
            toMM = this.value().getMonth();
            toDD = this.value().getDate();
            $("#sStsfStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }else if(id === 'sStartRegDt'){
            frYY = this.value().getFullYear();
            frMM = this.value().getMonth();
            frDD = this.value().getDate();
            $("#sEndRegDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'sEndRegDt'){//등록종료일
            toYY = this.value().getFullYear();
            toMM = this.value().getMonth();
            toDD = this.value().getDate();
            $("#sStartRegDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }else if(id === 'startDt'){
            frYY = this.value().getFullYear();
            frMM = this.value().getMonth();
            frDD = this.value().getDate();
            $("#endDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'endDt'){//등록종료일
            toYY = this.value().getFullYear();
            toMM = this.value().getMonth();
            toDD = this.value().getDate();
            $("#startDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }
    };


    // 대상자 추출 confirm
    function callRcpeExtrMappint(selectedItem){
        if(selectedItem != null){
            //대상자 추출전 추출한 적이 있는지 확인

            /*
            // 시작일 > 오늘날짜  || 종료일 < 오늘날짜
            if ( selectedItem.editYn === "N" ) {
                //{시작일}와(과) {종료일}를(을) 확인해주세요.{2}
                dms.notification.info("<spring:message code='crm.lbl.startDt' var='startDt' /><spring:message code='crm.lbl.endDt' var='endDt' /><spring:message code='global.info.confirmMsgParam2' arguments='${startDt},${endDt}' />");
                return;
            }
            */

            //대상자 추출 시작
            if(
                !dms.string.isEmpty(selectedItem.seq)
                    && ( selectedItem.rcpeExtrSeqChkCnt > 0 )
                    && selectedItem.useYn === "Y"
                    ){

                var params = {};
                params["dlrCd"] = selectedItem.dlrCd;
                params["seq"] = selectedItem.seq;
                params["stsfIvstSeq"] = selectedItem.seq;//만족도조사 일련번호
                params["subyTmplSeq"] = selectedItem.subyTmplSeq;//설문템플릿 일련번호
                params["rcpeExtrSeq"] = selectedItem.rcpeExtrSeq;//고객추출조건번호
                params["stsfIvstTpCd"] = selectedItem.stsfIvstTpCd;//만족도 조사 타입

                var url = "<c:url value='/crm/css/satisFactionManage/selectCallRcpeExtrMapping2.do' />";

                $.ajax({
                    url:url
                    ,data:JSON.stringify(params)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        //console.log(jqXHR);
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success:function(result){
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                    ,beforeSend:function(xhr) {
                        dms.loading.show();
                    }
                    ,complete:function(xhr, status) {
                        dms.loading.hide();
                    }
                }).done(function(result) {
                    //console.log("callProc Done!!!!");
                    $("#btnSearch").click();
                });
            }else{
                //대상자 추출을 진행할 수 없습니다.
                dms.notification.info("<spring:message code='crm.info.noRcpeExtrMapping'/>");
                return;
            }
        }else{
            //만족도 조사를 선택하세요.
            dms.notification.info("<spring:message code='global.lbl.custStsfSurvey' var='custStsfSurvey' /><spring:message code='global.info.check.field' arguments='${custStsfSurvey}' />");
            return;
        }
    };

    $(document).ready(function() {

        $("#mainTab").kendoExtTabStrip({
            animation:false
            , select:function(e) {

                // 만족도 조사결과 탭 초기화
                $("#surveyName").empty();
                $("#survey_content_table").empty();
                $("#shortQuestionResultsGrid").data("kendoExtGrid").dataSource.data([]);
                $("#multipleQuestionResultsGrid").data("kendoExtGrid").dataSource.data([]);

                var selectTabId = e.item.id;

                if (selectTabId === "satisFactionTargetInfo") {

                    if ( dms.string.isNotEmpty($("#seq").val()) ){
                        $("#presentDetailGrid").data("kendoExtGrid").dataSource.page(1);
                        // {만족도 조사 명}을(를) 확인하여 주세요.
                        //dms.notification.warning("<spring:message code='crm.lbl.stsfIvstNm' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                        //return;
                    };
                } else if (selectTabId === "satisFactionResult") {

                    fnShortQuestionResults();   // 객관식 요약
                    subTabStrip.select(0);

                };

            }
        });

        var mainTabStrip = $("#mainTab").data("kendoExtTabStrip");
        mainTabStrip.select(0);

        $("#subTab").kendoExtTabStrip({
            animation:false
            , height:100
            , select:function(e) {

                var selectTabId = e.item.id;

                if (selectTabId === "shortQuestionResultInfo") {

                    fnShortQuestionResults();   // 객관식 요약

                } else if (selectTabId === "shortQuestionResultDtlInfo") {      // 객관식 상세

                    $("#shortQuestionResultsGrid").data("kendoExtGrid").setOptions({ columns:shortQuestGridColumns } );
                    $("#shortQuestionResultsGrid").data("kendoExtGrid").dataSource.page(1);

                } else if (selectTabId === "multipleQuestionResultDtlInfo") {   // 주관식 상세

                    $("#multipleQuestionResultsGrid").data("kendoExtGrid").setOptions({ columns:multipleQuestGridColumns } );
                    $("#multipleQuestionResultsGrid").data("kendoExtGrid").dataSource.page(1);

                };

            }
        }).data("kendoExtTabStrip");
        var subTabStrip = $("#subTab").data("kendoExtTabStrip");
        subTabStrip.select(0);

        $("#sStsfStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"

        });

        $("#sStsfEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#sStartRegDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"

        });

        $("#sEndRegDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"

        });

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

    });
/* ###################################################### 추출주기설정 2/5 script 추가 종료 */

    // 사용여부 DS
    var useYnDs = [{text:"N",value:"N"},{text:"Y", value:"Y"}];

    //1.그리드 질문유형 콤보 DataSource
    var surveyTmplList = [{"subyTmplSeq":"", "subyTmplNm":"", "useYn":""}];
    <c:forEach var="obj" items="${surveyTmplList}">
        surveyTmplList.push({"subyTmplSeq":"${obj.subyTmplSeq}", "subyTmplNm":"${obj.subyTmplNm}", "useYn":"${obj.delYn}"});
    </c:forEach>
    var surveyTmplMap = dms.data.arrayToMap(surveyTmplList, function(obj){ return obj.subyTmplSeq; });

    //2.그리드 만족도조사 유형 콤보  DataSource
    var stsfIvstMthCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${stsfIvstMthCdList}">
        stsfIvstMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //3.그리드 만족도 조사수단 콤보 DataSource
    var stsfIvstExpdCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${stsfIvstExpdCdList}">
        stsfIvstExpdCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //4.그리드 고객추출조건 콤보 DataSource
    var targExtractList = [{"custExtrTermNo":"", "custExtrTermNm":""}];
    var targExtractListMap = [];
    <c:forEach var="obj" items="${targExtractList}">
        targExtractList.push({"custExtrTermNo":"${obj.custExtrTermNo}" , "custExtrTermNm":"${obj.custExtrTermNm}"});
        targExtractListMap["${obj.custExtrTermNo}"] = "${obj.custExtrTermNm}";
    </c:forEach>

    //5.그리드 만족도 조사타입 콤보 DataSource
    var stsfIvstTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${stsfIvstTpCdList}">
        stsfIvstTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //대상자 자동추출
    var custExtrAutoYnList = [{"cmmCd":"Y" , "cmmCdNm":"<spring:message code='crm.lbl.custExtrAutoYes' />"},{"cmmCd":"N" , "cmmCdNm":"<spring:message code='crm.lbl.custExtrAutoNo' />"}];
    var custExtrAutoYnArr = [];
    custExtrAutoYnArr["Y"] = "<spring:message code='crm.lbl.custExtrAutoYes' />";
    custExtrAutoYnArr["N"] = "<spring:message code='crm.lbl.custExtrAutoNo' />";
    custExtrAutoYnArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = custExtrAutoYnArr[val];
        }
        return returnVal;
    };

    // 대상 DS
    var custTargYnDs = [{text:"<spring:message code='crm.lbl.cropEvaltSheet' />",value:"N"},{text:"<spring:message code='global.info.customer' />", value:"Y"}];
    var custTargYnArr = [];
    custTargYnArr["Y"] = "<spring:message code='global.info.customer' />";
    custTargYnArr["N"] = "<spring:message code='crm.lbl.cropEvaltSheet' />";
    custTargYnArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = custTargYnArr[val];
        }
        return returnVal;
    };

    // 템플릿 - SMS
    var smsTemplateDs = [];
    var smsTemplateArr = [];
    <c:forEach var="obj" items="${smsTemplateList}">
        smsTemplateDs.push({text:"${obj.tmplNm}", value:"${obj.tmplId}", tmplCont:"${obj.tmplCont}"});
        smsTemplateArr["${obj.tmplId}"] = "${obj.tmplNm}";
    </c:forEach>
    smsTemplateArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = smsTemplateArr[val];
        }
        return returnVal;
    };

    // 만족도 조사명 ds
    var satisFactionTitleDs = [];
    var satisFactionTitleArr = [];
    <c:forEach var="obj" items="${satisFactionTitleList}">
        satisFactionTitleDs.push({text:"${obj.stsfIvstNm}", value:"${obj.seq}"});
        satisFactionTitleArr["${obj.seq}"] = "${obj.stsfIvstNm}";
    </c:forEach>
    satisFactionTitleArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = satisFactionTitleArr[val];
        }
        return returnVal;
    };

    // 필터를 지정하면 저장후 value 선택시 버그 있음. 따라서 함수로 만들어서 저장후 드롭다운리스트를 다시 드려줌.
    var rcpeExtrSeqDDL = function(){
        /* $("#custExtrTermNo").kendoExtDropDownList({
            dataSource:custExtrTermNoDs
            , dataTextField:"text"
            , dataValueField:"value"
            , optionLabel:" "
            , filter:"contains"
            //, filtering:onFiltering
            , index:0
        }); */

        // 고객추출조건
        $("#rcpeExtrSeq").kendoExtDropDownList({
            dataTextField:"custExtrTermNm"
            , dataValueField:"custExtrTermNo"
            , dataSource:targExtractList
            , optionLabel:""
            , filter:"contains"
        });
    };

    // 팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
    function viewPopup(){
        var win = $("#satisFactionManageWindow").data("kendoWindow");
        win.center();
        win.open();
    };

    // 팝업 종료 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
    function closePopup(){
        var win = $("#satisFactionManageWindow").data("kendoWindow");
        win.close();
    };


    // 만족도 유형 데이터를 조회한다.
    function onSelectStsfIvstMthCdSet(cmmCd) {

        var param ={
                "sCmmCd":cmmCd
        };

        var stsfIvstMthCdDs = [];
        if ( dms.string.isNotEmpty(cmmCd) ) {

            var responseJson = dms.ajax.getJson({
                url:_contextPath + "/crm/css/satisFactionManage/selectStsfIvstMthCdList.do"
                ,data:JSON.stringify(param)
                ,async:false
            });

            stsfIvstMthCdDs = responseJson.data;

        } else {

            stsfIvstMthCdDs = [];

        };

        $("#stsfIvstMthCd").data("kendoExtDropDownList").setDataSource(stsfIvstMthCdDs);

    };

    // 만족도 조사 수단이 전시장 / 고객 휴게소 방문 (03) 인경우 대상자 추출/설문지명/대상자 추출조건은 비활성화
    function stsfIvstExpdCdEnabled(){

        var custTargYn = $("#custTargYn").data("kendoExtDropDownList");                //고객대상여부
        var stsfIvstExpdCd = $("#stsfIvstExpdCd").data("kendoExtDropDownList");        //만족도 조사 수단
        var custExtrAutoYn = $("#custExtrAutoYn").data("kendoExtDropDownList");        //대상자 추출
        var rcpeExtrSeq = $("#rcpeExtrSeq").data("kendoExtDropDownList");              //대상자 추출조건
        var stsfIvstTpCd = $("#stsfIvstTpCd").data("kendoExtDropDownList");              //대상자 추출조건

        if ( custTargYn.value() === "N" ) {
            stsfIvstExpdCd.value("03")
            stsfIvstExpdCd.enable(false);
        } else {
            stsfIvstExpdCd.enable(true);
        };

        if ( stsfIvstExpdCd.value() === "03" ) {
            // 비활성화
            custExtrAutoYn.value("N");
            custExtrAutoYn.enable(false);
            rcpeExtrSeq.enable(false);
            rcpeExtrSeq.value("");
            $("#custExtrAutoYnArea").removeClass("bu_required");
            $("#rcpeExtrSeqArea").removeClass("bu_required");
            cycleFormInit()
            cycleCheckDisTrue();
        } else {

            if ( stsfIvstTpCd.value() !== "01" ) {
                // 활성화
                custExtrAutoYn.enable(true);
                rcpeExtrSeq.enable(true);
                $("#custExtrAutoYnArea").addClass("bu_required");
                $("#rcpeExtrSeqArea").addClass("bu_required");
            }
        };

    };

    // 상세조회 후 팝업오픈
    function viewDetail(seq){

        initStsfDetail();       // 초기화
        //startDtMinSet();     //달력 min 설정
        var mainTabStrip = $("#mainTab").data("kendoExtTabStrip");

        if( dms.string.isNotEmpty(seq) ){

            // 탭 활성화
            mainTabStrip.enable(mainTabStrip.tabGroup.children());

            // 만족도 조사 상세 조회
            var param = {
                    "sSeq":seq
                    };

            //console.log("만족도 조사 상세 파람 : ",JSON.stringify(param));
            $.ajax({
                    url:"<c:url value='/crm/css/satisFactionManage/selectSatisFactionManageByKey.do' />"
                    ,data:JSON.stringify(param)      //파라미터
                    ,type:'POST'                        //조회요청
                    ,dataType:'json'                  //json 응답
                    ,contentType:'application/json'   //문자열 파라미터
                    ,async:false
                    ,error:function(jqXHR,status,error){
                        dms.notification.error("<spring:message code='crm.lbl.dtlInfo' var='arg' /><spring:message code='crm.info.findFail' arguments='${arg}' />");
                    }
            }).done(function(body) {

                //console.log("만족도 조사 상세 조회 결과:",body);

                // 대상자추출 드롭다운 리스트
                rcpeExtrSeqDDL()

                $("#dlrCd").val(body.dlrCd); //딜러코드
                var seq = body.seq;
                $("#seq").val(seq); //만족도조사 일련번호
                $("#stsfIvstNm").val(body.stsfIvstNm); //만족도조사명
                var stsfIvstTpCd = body.stsfIvstTpCd;
                $("#stsfIvstTpCd").data("kendoExtDropDownList").value(stsfIvstTpCd); //조사타입
                $("#stsfIvstTpCd").data("kendoExtDropDownList").trigger("select");
                $("#stsfIvstMthCd").data("kendoExtDropDownList").value(body.stsfIvstMthCd); //유형
                $("#stsfIvstExpdCd").data("kendoExtDropDownList").value(body.stsfIvstExpdCd); //만족도 조사수단
                var rcpeExtrSeq = body.rcpeExtrSeq;
                $("#rcpeExtrSeq").data("kendoExtDropDownList").value(rcpeExtrSeq); //대상자 추출조건
                $("#custExtrAutoYn").data("kendoExtDropDownList").value(body.custExtrAutoYn); //고객추출자동여부
                $("#custTargYn").data("kendoExtDropDownList").value(body.custTargYn); //고객대상여부
                $("#custExtrCycleWeek").val(body.custExtrCycleWeek); //주기설정
                $("#custExtrCycleWeek").attr("readonly", true); //만족도조사명dd
                $("#stsfCont").val(body.stsfCont); //설명/화술
                $("#lastExtrDt").data("kendoExtMaskedDatePicker").value(body.lastExtrDt); //마지막 추출일
                $("#useYn").data("kendoExtDropDownList").value(body.useYn); //고객추출자동여부
                $("#regUsrNm").val(body.regUsrNm); //등록자
                $("#regDt").data("kendoExtMaskedDatePicker").value(body.regDt); //등록일

                // ####### 만족도 조사 대상자 추출 조건 조회 후 set 시작 ( 위치 변경 금지 !!)
                if ( stsfIvstTpCd === "01" ) {

                    // 만족도 조사 상세 조회
                    var param = {
                            "sSeq":seq
                            };
                    //console.log("만족도 조사 상세 파람 : ",JSON.stringify(param));
                    $.ajax({
                            url:"<c:url value='/crm/css/satisFactionManage/selectCrmTargExtractDetails.do' />"
                            ,data:JSON.stringify(param)      //파라미터
                            ,type:'POST'                        //조회요청
                            ,dataType:'json'                  //json 응답
                            ,contentType:'application/json'   //문자열 파라미터
                            ,async:false
                            ,error:function(jqXHR,status,error){
                                dms.notification.error("<spring:message code='crm.lbl.dtlInfo' var='arg' /><spring:message code='crm.info.findFail' arguments='${arg}' />");
                            }
                    }).done(function(body) {

                        //console.log("body :::::::: ",body)

                        var targList = body.data;
                        var targExtractValMap = [];
                        var detlExtrTermCdTmp;
                        $.each(targList, function(idx, row){
                            targExtractValMap[row.detlExtrTermCd] = row.termVal1;
                            detlExtrTermCdTmp = row.detlExtrTermCd.split("-")
                            f_addInput(detlExtrTermCdTmp[0]);
                        });

                        $("#CRM7500318-01").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500318-01"]);
                        $("#CRM7500318-02").data("kendoExtMaskedDatePicker").value(targExtractValMap["CRM7500318-02"]);
                        $("#CRM7500319-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500319-01"]);
                        $("#CRM7500320-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500320-01"]);
                        $("#CRM7500320-02").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500320-02"]);
                        $("#CRM7500321-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500321-01"]);
                        $("#CRM7500321-02").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500321-02"]);
                        if(targExtractValMap["CRM7500323-01"] != "" && targExtractValMap["CRM7500323-01"] != null){
                            $("#CRM7500323-01").data("kendoMultiSelect").value(targExtractValMap["CRM7500323-01"].split(","));
                        };
                        if(targExtractValMap["CRM7500355-01"] != "" && targExtractValMap["CRM7500355-01"] != null){
                            $("#CRM7500355-01").data("kendoMultiSelect").value(targExtractValMap["CRM7500355-01"].split(","));
                        };
                        $("#CRM7500351-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500351-01"]);
                        $("#CRM7500352-01").data("kendoExtNumericTextBox").value(targExtractValMap["CRM7500352-01"]);
                        if(targExtractValMap["CRM7500359-01"] != "" && targExtractValMap["CRM7500359-01"] != null){
                            $("#CRM7500359-03").data("kendoMultiSelect").value(targExtractValMap["CRM7500359-01"].split(","));
                        };

                    });
                };
                // ####### 만족도 조사 대상자 추출 조건 조회 후 set 종료

                $("#btnSatisFacMngPrint").data("kendoButton").enable(true);

                if ( body.custExtrAutoYn == "Y" ) {
                    cycleCheckDisFalse();
                } else if ( body.custExtrAutoYn === "N" && body.stsfIvstExpdCd !== "03" ) {
                    cycleCheckDisTrue();
                    $("#btnRcpeExtrMapping").data("kendoButton").enable(true);
                }

                // min 옵션 다시 설정 ( 안해주면 지난날짜 안나옴 )
                var startDt = $("#startDt").data("kendoExtMaskedDatePicker");
                var endDt = $("#endDt").data("kendoExtMaskedDatePicker");

                var editYn = body.editYn;
                $("#editYn").val(editYn); //수정가능여부(위치 변경 금지!! 정비-추출조건 view 확인후 editYn set해야함)

                //수정가능
                if( editYn === "Y" ){

                    $("#subyTmplSeq").data("kendoExtDropDownList").setDataSource(dms.data.cmmCdFilter(surveyTmplList));
                    $("#subyTmplSeq").data("kendoExtDropDownList").value(body.subyTmplSeq); //설문지 일련번호

                } else if (editYn === "N" ){

                    // min 옵션 다시 설정 ( 안해주면 지난날짜 안나옴 )
                    startDt.min(new Date(body.startDt));
                    endDt.min(new Date(body.endDt));

                    //수정불가능
                    readonlyForm();
                    cycleCheckDisTrue();
                    $("input[name=custExtrCycleWeek]:checkbox").prop("disabled", true);

                    $("#subyTmplSeq").data("kendoExtDropDownList").setDataSource(surveyTmplList);
                    $("#subyTmplSeq").data("kendoExtDropDownList").value(body.subyTmplSeq); //설문지 일련번호

                };

                // min 옵션 다시 설정 ( 안해주면 지난날짜 안나옴 )
                startDt.value(body.startDt);
                endDt.value(body.endDt);

                // ###################################################### 추출주기설정 5/5 상세 조회 시작
                cycleFormInit();
                custExtrCycleDt = [];
                $("#cycleDt").val("");
                $("input[name=custExtrCycleWeek]:checkbox").prop("checked",false);

                if( body.custExtrCycleTp === "S") {

                    $("#btnCycleSelect").click();

                    var cycleDatepicker = $("#cycleDatepicker").data("kendoDatePicker");
                    cycleDatepicker.close();

                    var tmpCustExtrCycleDt = [];
                    // 날짜선택
                    var resultArray = body.custExtrCycleCont.split(',');
                    $.each(resultArray, function(idx, row){
                        tmpCustExtrCycleDt.push(kendo.parseDate(row.trim(), "<dms:configValue code='dateFormat' />"));
                    });

                    custExtrCycleDt = tmpCustExtrCycleDt;

                    // 최종 선택된 날짜를 텍스트 박스에 뿌려준다.
                    dtToString(custExtrCycleDt);

                } else if( body.custExtrCycleTp === "W") {

                    $("#btnCycleWeek").click();

                    // 요일 체크박스 체크
                    if(dms.string.strNvl(body.custExtrCycleCont)!=""){
                        var resultArray = body.custExtrCycleCont.split(',');
                        $("input[name=custExtrCycleWeek]:checkbox").prop("checked", false);
                        $.each(resultArray, function(idx, row){
                            $("#custExtrCycleWeek_"+row.trim()).prop("checked", true);
                        });
                    }

                } else if( body.custExtrCycleTp === "D") {

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
                // ###################################################### 추출주기설정 5/5 상세 조회 종료

            });
            //ajax 종료
        } else {

            // TODO 신규 등록인경우 필터가 적용된 DDL 필요
            $("#subyTmplSeq").data("kendoExtDropDownList").setDataSource(dms.data.cmmCdFilter(surveyTmplList));

            // 추가인경우 1번탭 제외하고 disable 처리
            mainTabStrip.disable(mainTabStrip.tabGroup.children());
            mainTabStrip.enable(mainTabStrip.tabGroup.children().eq(0),true);

        };

        // 팝업오픈;
        viewPopup();

    };



$(document).ready(function() {

     // ************************** 그리드 팝업 호출 / 팝업 설정 ****************************
    $("#satisFactionManageWindow").kendoWindow({
        animation:false
        ,draggable:true
        ,modal:false
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='crm.menu.satisfactionMng' />"      // 만족도 조사 관리
        ,width:"950px"
        //,height:"300px"
    }).data("kendoWindow");

    // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
    $("#satisFactionManageGrid").on("dblclick", "tr.k-state-selected", function (e) {

        var gridId = e.delegateTarget.id
           , grid = $("#"+gridId+"").data("kendoExtGrid")
           , selectedItem = grid.dataItem(grid.select())
        ;

        if ( dms.string.isNotEmpty(selectedItem) ){
            viewDetail(selectedItem.seq);
        } else {
            //만족도 조사를 선택하세요.
            dms.notification.info("<spring:message code='global.lbl.custStsfSurvey' var='custStsfSurvey' /><spring:message code='global.info.check.field' arguments='${custStsfSurvey}' />");
            return;
        }
    });

    rcpeExtrSeqDDL();

    // 시작일
    $("#startDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });
    //종료일
    $("#endDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });
    //마지막 추출일
    $("#lastExtrDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    //등록일
    $("#regDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 검색조건 - 유형
    $("#sStsfIvstMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:stsfIvstMthCdList
    });

    // 검색조건 - 조사수단
    $("#sStsfIvstExpdCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:stsfIvstExpdCdList
    });

    // 검색조건 - 타입
    $("#sStsfIvstTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:stsfIvstTpCdList
    });

    // 유형
    $("#stsfIvstMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    });

    // 조사수단
    $("#stsfIvstExpdCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:stsfIvstExpdCdList
        , change:function(e) {

            stsfIvstExpdCdEnabled();

        }
    });

    // 타입
    $("#stsfIvstTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:stsfIvstTpCdList
        , select:function(e){
            var dataItem = this.dataItem(e.item);

            var cmmCd = dataItem.cmmCd;

            $("#stsfIvstMthCd").data("kendoExtDropDownList").value("");
            onSelectStsfIvstMthCdSet(cmmCd);

            if ( cmmCd === "01" ) {
                $("#rcpeExtrSeq").data("kendoExtDropDownList").enable(false);
                $(".targExtractArea").removeClass("hidden")
                $("#rcpeExtrSeq").data("kendoExtDropDownList").value("");
            } else {
                $("#rcpeExtrSeq").data("kendoExtDropDownList").enable(true);
                $(".targExtractArea").addClass("hidden")
            };

        }
    });

    //조회조건 - 배치활성여부
    $("#useYn").kendoExtDropDownList({
        dataSource:useYnDs
        , dataTextField:"text"
        , dataValueField:"value"
        , index:0
    });

    //사용여부 콤보박스
    $("#sUseYn").kendoExtDropDownList({
        dataSource:useYnDs
        , dataTextField:"text"
        , dataValueField:"value"
        ,optionLabel:" "   // 전체
    });

    // 대상자자동추출
    $("#custExtrAutoYn").kendoExtDropDownList({
        dataSource:custExtrAutoYnList
        , dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , index:0
        , select:function(e){
            var dataItem = this.dataItem(e.item);
            if(dataItem.cmmCd == "Y"){
                cycleCheckDisFalse();
            }else{
                cycleCheckDisTrue();
            }
        }
    });

    // 고객대상여부
    $("#custTargYn").kendoExtDropDownList({
        dataSource:custTargYnDs
        , dataTextField:"text"
        , dataValueField:"value"
        , index:0
        , change:function(e) {
            stsfIvstExpdCdEnabled();
        }
    });

    //설문지명
    $("#subyTmplSeq").kendoExtDropDownList({
        dataSource:dms.data.cmmCdFilter(surveyTmplList)
        //,template:"[#:data.subyTmplSeq#] #:data.subyTmplNm#"
        ,dataValueField:"subyTmplSeq"
        ,dataTextField:"subyTmplNm"
    });

    //만족도 조사 기능버튼 시작=======================================================================================

    //버튼 - 대상자추출
    $("#btnRcpeExtrMapping").kendoButton({
       click:function(e){

           var satisFactionManageGrid = $("#satisFactionManageGrid").data("kendoExtGrid");
           var selectedItem = satisFactionManageGrid.dataItem(satisFactionManageGrid.select());

           if(selectedItem != null){

               if(selectedItem.custExtrAutoYn == "Y"){
                   //대상자 추출이 자동입니다.
                   dms.notification.info("<spring:message code='crm.info.autoRcpeExtrMapping'/>");
                   return;
               }

               if(selectedItem.stsfIvstExpdCd === "03"){
                   //전시장/방문 고객은 대상자를 추출할 수 없습니다.
                   dms.notification.info("<spring:message code='crm.info.extrNotTarget'/>");
                   return;
               }

               if(selectedItem.lastExtrDt != null){

                   // 대상자 추출 confirm
                   dms.window.confirm({
                       message:"<spring:message code='crm.info.lastExtrDtProcess'/>"
                       ,callback:function(result){
                           if(result){

                               callRcpeExtrMappint(selectedItem);

                           }else{
                               //취소버튼 클릭 로직
                               return;
                           }
                       }
                   });
                   // 대상자 추출 confirm

               }else{
                   callRcpeExtrMappint(selectedItem);
               }
           }else{
               //만족도 조사를 선택하세요.
               dms.notification.info("<spring:message code='global.lbl.custStsfSurvey' var='custStsfSurvey' /><spring:message code='global.info.check.field' arguments='${custStsfSurvey}' />");
               return;
           }
       }
        , enable:false
    });

    //버튼 - 인쇄
    $("#btnSatisFacMngPrint").kendoButton({
       click:function(e){
           var satisFactionManageGrid = $("#satisFactionManageGrid").data("kendoExtGrid");
           var selectedItem = satisFactionManageGrid.dataItem(satisFactionManageGrid.select());
           if(selectedItem != null){
               if(selectedItem.subyTmplSeq != null) {

                   var printParam =  "&sDlrCdParam="+selectedItem.dlrCd+"&sSubyTmplSeqParam="+selectedItem.subyTmplSeq;
                   var printReportUrl = "<c:url value='/ReportServer?reportlet=crm/satisfactionReport/selectSurveyViewPrint.cpt' />"+printParam;
                   var newWindow=open(printReportUrl,"",'top=0,left=0,width=925,height=1200,toolbar=1,location=1,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');

               }
           }else{
               //만족도 조사를 선택하세요.
               dms.notification.info("<spring:message code='global.lbl.custStsfSurvey' var='custStsfSurvey' /><spring:message code='global.info.check.field' arguments='${custStsfSurvey}' />");
               return;
           }
       }
        , enable:false
    });
    //버튼 - 만족도 조사 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            if(crmJs.isDateValidPeriod($("#sStsfStartDt").data("kendoExtMaskedDatePicker").value()
                    ,$("#sStsfEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                if(crmJs.isDateValidPeriod($("#sStartRegDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndRegDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    $('#satisFactionManageGrid').data('kendoExtGrid').dataSource.page(1);
                }else{
                    $("#sEndRegDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndRegDt").focus();
                }
            }else{
                $("#sStsfEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                $("#sStsfEndDt").focus();
            }
        }
    });

    //버튼 - 만족도 조사 추가
    $("#btnAdd").kendoButton({
        click:function(e){
            viewDetail();
        }
    });


    //버튼 - 만족도 조사 삭제
    $("#btnSatisFacMngDel").kendoButton({
        click:function(e) {
            var satisFactionManageGrid = $("#satisFactionManageGrid").data("kendoExtGrid");
            var rows = satisFactionManageGrid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                satisFactionManageGrid.removeRow(row);
            });
        }
    });

    //버튼 - 설문미리보기
    $("#btnSurveyPreview").kendoButton({
        click:function(e) {

            var subyTmplSeq = $("#subyTmplSeq").data("kendoExtDropDownList").value();
            if ( dms.string.isNotEmpty(subyTmplSeq) ) {
                var printParam = "&sDlrCdParam="+"<c:out value='${dlrCd}' />"+"&sSubyTmplSeqParam="+subyTmplSeq;
                var printReportUrl = "<c:url value='/ReportServer?reportlet=crm/satisfactionReport/selectSurveyViewPrint.cpt' />"+printParam;
                var newWindow=open(printReportUrl,"",'top=0,left=0,width=925,height=1200,toolbar=1,location=1,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');
            } else {
                //{설문지명}을(를) 선택하세요.
                dms.notification.info("<spring:message code='crm.lbl.subyTmplNm' var='custStsfSurvey' /><spring:message code='global.info.check.field' arguments='${custStsfSurvey}' />");
                return;
            };

        }
    });

    //버튼 - 만족도 조사 저장
    $("#btnSatisFacMngSave").kendoButton({
        click:function(e) {

            /**
            *   validation 확인
            *   1.[고객대상여부 : N] 인경우는 [만족도 조사 수단 : 전시장/고객 휴게소 방문] 만 선택 가능
            *   2.[만족도 조사 수단 : 전시장/고객 휴게소] 인경우는 [대상자 추출 : 수동] / [대상자 추출조건 : 선택불가] / [고객추출주기 : 선택불가]
            *   3.[대상자 추출 : 자동] 인경우는 [고객추출주기 : 선택]
            *   4. 필수값 : 만족도 조사명, 조사 타입, 유형, 고객대상여부, 시작일, 종료일, 설문지명, 사용여부,
            **/

            //만족도 조사명
            if ( dms.string.isEmpty($("#stsfIvstNm").val())) {
                dms.notification.warning("<spring:message code='crm.lbl.stsfIvstNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            //조사 타입
            var stsfIvstTpCd = $("#stsfIvstTpCd").data("kendoExtDropDownList").value();
            if ( dms.string.isEmpty(stsfIvstTpCd)) {
                dms.notification.warning("<spring:message code='crm.lbl.stsfIvstTpCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            //조사 유형
            if ( dms.string.isEmpty($("#stsfIvstMthCd").data("kendoExtDropDownList").value())) {
                dms.notification.warning("<spring:message code='crm.lbl.stsfIvstMthCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            }

            //만족도 조사수단
            var stsfIvstExpdCd = $("#stsfIvstExpdCd").data("kendoExtDropDownList").value();

            if ( dms.string.isEmpty(stsfIvstExpdCd) ) {

                dms.notification.warning("<spring:message code='crm.lbl.stsfIvstExpdCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;

            } else if ( stsfIvstExpdCd != "03" ) {

                //대상자 추출
                var custExtrAutoYn = $("#custExtrAutoYn").data("kendoExtDropDownList").value();
                if ( dms.string.isEmpty(custExtrAutoYn) ) {
                    dms.notification.warning("<spring:message code='crm.lbl.custExtrAutoYn' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                } else if ( custExtrAutoYn === "Y" ) {
                    if ( dms.string.isEmpty($("#custExtrCycleTp").val()) ) {
                        // 고객추출주기 을를 선택해주세요
                        dms.notification.warning("<spring:message code='crm.lbl.custExtrCycleCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    };
                };

                //대상자 추출조건
                if ( stsfIvstTpCd !== "01" && dms.string.isEmpty($("#rcpeExtrSeq").data("kendoExtDropDownList").value()) ) {
                    dms.notification.warning("<spring:message code='crm.lbl.rcpeExtrSeqCondition' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                };

            };

            //시작일
            if ( dms.string.isEmpty($("#startDt").data("kendoExtMaskedDatePicker").value())) {
                dms.notification.warning("<spring:message code='global.lbl.startDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            };

            //종료일
            if ( dms.string.isEmpty($("#endDt").data("kendoExtMaskedDatePicker").value())) {
                dms.notification.warning("<spring:message code='global.lbl.endDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            };

            //설문지명
            if ( dms.string.isEmpty($("#subyTmplSeq").data("kendoExtDropDownList").value())) {
                dms.notification.warning("<spring:message code='crm.lbl.subyTmplNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            };
            // form 데이터
            var param =
                    $("#stsfForm").serializeObject(
                        $("#stsfForm").serializeArrayInSelector("[data-json-obj='true']")
                        ,{"crmTargExtractVO":params}
                    );

            // ###################################################### 추출주기설정 3/5 추가 시작
            param.custExtrCycleDt = custExtrCycleDt;

            //console.log("추출주기-선택날짜 ::",param.custExtrCycleDt);

            if ( $("#custExtrCycleTp").val() === "W" ) {

                if ( !$("input[name=custExtrCycleWeek]:checkbox").is(":checked") ) {
                    // {주}을(를) 확인하여 주세요.
                    dms.notification.error("<spring:message code='crm.lbl.week' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    return;
                } else {

                    // 요일 1개만 선택일경우..
                    var tmpWeek = [];
                    if ( typeof param.custExtrCycleWeek === 'string' ) {

                        tmpWeek.push(param.custExtrCycleWeek);

                    // 체크박스를 disable 하기 때문에 undefined 가 나올수 있음.
                    } else if ( typeof param.custExtrCycleWeek === 'undefined' ) {

                        $("input[name=custExtrCycleWeek]:checked").each(function(){
                            tmpWeek.push($(this).val());
                        });

                    } else if ( typeof param.custExtrCycleWeek === 'object' ) {

                        $("input[name=custExtrCycleWeek]:checked").each(function(){
                            tmpWeek.push($(this).val());
                        });

                    };

                    param.custExtrCycleWeek = tmpWeek;

                };

            } else if ( $("#custExtrCycleTp").val() === "S" && !custExtrCycleDt.length > 0 ) {
                    // {일}을(를) 확인하여 주세요.
                    dms.notification.error("<spring:message code='crm.lbl.day' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    return;
            };
            // ###################################################### 추출주기설정 3/5 추가 종료

            //console.log("param.custExtrCycleDt ::",JSON.stringify(param.custExtrCycleDt))

            param.startDt = $("#startDt").data("kendoExtMaskedDatePicker").value();
            param.endDt = $("#endDt").data("kendoExtMaskedDatePicker").value();

            param.subyTmplSeq = $("#subyTmplSeq").data("kendoExtDropDownList").value();
            param.stsfIvstMthCd = $("#stsfIvstMthCd").data("kendoExtDropDownList").value();
            param.stsfIvstExpdCd = $("#stsfIvstExpdCd").data("kendoExtDropDownList").value();
            param.stsfIvstTpCd = stsfIvstTpCd;
            param.rcpeExtrSeq = $("#rcpeExtrSeq").data("kendoExtDropDownList").value();
            param.useYn = $("#useYn").data("kendoExtDropDownList").value();
            param.custTargYn = $("#custTargYn").data("kendoExtDropDownList").value();
            param.custExtrAutoYn = $("#custExtrAutoYn").data("kendoExtDropDownList").value();

            //만족도 조사 일련번호
            var url = "<c:url value='/crm/css/satisFactionManage/insertSatisFactionManage2.do' />";
            if ( !dms.string.isEmpty($("#seq").val())) {
                url = "<c:url value='/crm/css/satisFactionManage/updateSatisFactionManage2.do' />";
            };

            /*
            ** 조사타입이 정비인경우 대상자 추출조건 validation 시작
            */
            if ( stsfIvstTpCd === "01" ) {

                //정비정보-정비 일자
                if($("#CRM7500318_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500318-01").val())){
                        dms.notification.warning("<spring:message code='ser.lbl.calcEndDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500318-01").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500318-02").val())){
                        dms.notification.warning("<spring:message code='ser.lbl.calcEndDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500318-02").focus();
                        return false;
                    }
                }

                //정비정보-정비 일자(후 일수)
                if ($("#CRM7500319_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500319-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500319-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='ser.lbl.calcEndDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500319-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //정비정보-주행 거리
                if ($("#CRM7500320_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500320-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500320-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.runDistVal' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500320-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if($("#CRM7500320-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500320-02").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.runDistVal' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500320-02").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //정비정보-정비 금액
                if ($("#CRM7500321_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500321-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500321-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.lbrAmt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500321-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                    // 화면 필수 체크
                    if($("#CRM7500321-02").data("kendoExtNumericTextBox").value() == null || $("#CRM7500321-02").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.lbrAmt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500321-02").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //정비정보-정비위탁유형
                if($("#CRM7500323_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500323-01").val())){
                        dms.notification.warning("<spring:message code='par.lbl.invResvWorkType' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500323-01").focus();
                        return false;
                    }
                }

                //정비정보-수리유형
                if($("#CRM7500355_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500355-01").val())){
                        dms.notification.warning("<spring:message code='ser.lbl.lbrTp' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500355-01").focus();
                        return false;
                    }
                }

                //정비정보-最后1次维修时间 마지막번 정비 일자
                if($("#CRM7500351_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500351-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500351-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.LastRoDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500351-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                }

                //정비정보-下次保养时间 다음 보양일자
                if($("#CRM7500352_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if($("#CRM7500352-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500352-01").data("kendoExtNumericTextBox").value() == 0){
                        dms.notification.warning("<spring:message code='crm.lbl.nextRoDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500352-01").data("kendoExtNumericTextBox").focus();
                        return false;
                    }
                };

                //[정비일자+정비위탁유형]
                if($("#CRM7500359_fleg").val() == "Y"){
                    // 화면 필수 체크
                    if ( dms.string.isEmpty($("#CRM7500359-03").val())){
                        dms.notification.warning("<spring:message code='ser.lbl.dlrRoTp' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#CRM7500359-03").focus();
                        return false;
                    };
                };

                if ( $("#CRM7500318_fleg").val() == "N" && $("#CRM7500319_fleg").val() == "N" &&
                        $("#CRM7500320_fleg").val() == "N" && $("#CRM7500321_fleg").val() == "N" &&
                        $("#CRM7500323_fleg").val() == "N" && $("#CRM7500355_fleg").val() == "N" &&
                        $("#CRM7500351_fleg").val() == "N" && $("#CRM7500352_fleg").val() == "N" &&
                        $("#CRM7500359_fleg").val() == "N"
                        ) {
                    dms.notification.warning("<spring:message code='crm.info.noExtrTerms'/>"); //대상자 추출조건을 하나 이상 등록해 주세요.
                    return;
                };


                //추출조건 상세
                var json = {};

                //정비 일자
                json["CRM7500318"] = $("#CRM7500318-01").val() != "" && $("#CRM7500318-01").val() != null ? $("#CRM7500318-01").val() + "|" + $("#CRM7500318-02").val():"";

                //정비 일자(후 일수)
                json["CRM7500319"] = $("#CRM7500319-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500319-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500319-01").data("kendoExtNumericTextBox").value():"";

                //주행 거리
                json["CRM7500320"] = $("#CRM7500320-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500320-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500320-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500320-02").data("kendoExtNumericTextBox").value():"";

                //정비 금액
                json["CRM7500321"] = $("#CRM7500321-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500321-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500321-01").data("kendoExtNumericTextBox").value() + "|" + $("#CRM7500321-02").data("kendoExtNumericTextBox").value():"";

                //정비위탁유형
                json["CRM7500323"] = $("#CRM7500323-01").data("kendoMultiSelect").value() != "" && $("#CRM7500323-01").data("kendoMultiSelect").value() != null ?$("#CRM7500323-01").data("kendoMultiSelect").value():"";

                //수리유형
                json["CRM7500355"] = $("#CRM7500355-01").data("kendoMultiSelect").value() != "" && $("#CRM7500355-01").data("kendoMultiSelect").value() != null ?$("#CRM7500355-01").data("kendoMultiSelect").value():"";

                //最后1次维修时间 마지막번 정비 일자
                json["CRM7500351"] = $("#CRM7500351-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500351-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500351-01").data("kendoExtNumericTextBox").value():"";

                //下次保养时间 다음 보양일자
                json["CRM7500352"] = $("#CRM7500352-01").data("kendoExtNumericTextBox").value() != null && $("#CRM7500352-01").data("kendoExtNumericTextBox").value() != 0 ? $("#CRM7500352-01").data("kendoExtNumericTextBox").value():"";

                //[정비일자+정비위탁유형]
                json["CRM7500359"] = $("#CRM7500359-03").data("kendoMultiSelect").value() != "" && $("#CRM7500359-03").data("kendoMultiSelect").value() != null ?$("#CRM7500359-03").data("kendoMultiSelect").value():"";


                var params = [];
                var idx = 0;

                $.each(json, function(key, value){

                    if(value != ""){
                        obj = {};
                        obj["dlrCd"] = $("dlrCd").val();
                        obj["custExtrTermNo"] = $("custExtrTermNo").val();
                        obj["detlExtrTermCd"] = key;

                        if (value.constructor === Array) {
                            obj["termVal1"] = value.join(",");
                        } else {
                            obj["termVal1"] = value;
                        }

                        params.push(obj);

                        idx++;
                    }
                });
                param.extractSaveList = params;
            };
            /*
            ** 조사타입이 정비인경우 대상자 추출조건 validation 종료
            */

            //console.log("saveParam : ",JSON.stringify(param));
            //return;

            $.ajax({
                url:url
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    //console.log(jqXHR);
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(result){
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    initStsfDetail();
                    searchInit();
                    $('#satisFactionManageGrid').data('kendoExtGrid').dataSource.page(1);

                    //팝업 닫기
                    closePopup();

                }
                ,beforeSend:function(xhr) {
                    dms.loading.show($("#satisFactionManageWindow"));
                }
                ,complete:function(xhr, status) {
                    dms.loading.hide($("#satisFactionManageWindow"));
                }
            }).done(function(result) {
                //console.log("stsfFactionManageSave Done!!!!");
            });

        }
    });

    //btn - 상세
    $("#btnDetail").kendoButton({
        click:function(e){
            var grid = $("#satisFactionManageGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            if ( dms.string.isNotEmpty(selectedItem) ){

                viewDetail(selectedItem.seq);

            } else {

                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
        ,enable:false
    });


    //만족도 조사 기능버튼 종료=======================================================================================


    //만족도 조사 대상 관리 버튼 시작=======================================================================================
        //버튼 - 행삭제
        $("#btnDel").kendoButton({
            click:function(e) {
                var grid = $("#presentDetailGrid").data("kendoExtGrid");
                var rows = grid.select();

                var that = this;
                var stsfIvstDtCnt = 0;
                var callCenSendDtCnt = 0;

                rows.each(function(index, row) {
                    var dataItem = grid.dataItem(row)
                    if(dataItem.stsfIvstDt != ""){
                        stsfIvstDtCnt = stsfIvstDtCnt + 1;
                    };
                    if(dataItem.callCenSendDt != ""){
                        callCenSendDtCnt = callCenSendDtCnt + 1;
                    };

                });

                if(stsfIvstDtCnt == 0 && callCenSendDtCnt == 0){
                    grid.removeRow(row);
                }else{
                    //이미 만족도조사가 되었거나, 콜센터에 전송 되었습니다.
                    dms.notification.info("<spring:message code='crm.info.satisFactionUserNoDelete'/>");
                    return;
                }
            }
        });

        //버튼 - 저장
        $("#btnSave").kendoButton({
            click:function(e) {
                //설문조사결과가 있는 대상자를 제외한 인원만 삭제 가능합니다. 진행하시겠습니까?
                //if (confirm("<spring:message code='crm.info.presentUsrDel'/>") == true ){
                    var grid = $("#presentDetailGrid").data("kendoExtGrid");
                    var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
                    if (grid.cudDataLength == 0) {
                        //변경된 정보가 없습니다.
                        dms.notification.info("<spring:message code='global.info.required.change'/>");
                        return;
                    }

                    if (grid.gridValidation()) {
                        $.ajax({
                            url:"<c:url value='/crm/css/satisFactionManage/multiExtrUsrs.do' />",
                            data:JSON.stringify(saveData),
                            type:'POST',
                            dataType:'json',
                            contentType:'application/json',
                            error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            },
                            success:function(jqXHR, textStatus) {
                                grid.dataSource.page(1);
                                //정상적으로 반영 되었습니다.
                                dms.notification.success("<spring:message code='global.info.success'/>");
                                $('#presentDetailGrid').data('kendoExtGrid').dataSource.page(1);
                            }
                            ,beforeSend:function(xhr) {
                                dms.loading.show();
                            }
                            ,complete:function(xhr, status) {
                                dms.loading.hide();
                            }
                        });
                    }else{
                        //입력값을 확인하여 주십시오.
                        dms.notification.warning("<spring:message code='global.info.check.input'/>");
                    }//end if
                //}//end if
            }//end click
        });

    //만족도 조사 대상 관리 버튼 종료=======================================================================================


    //만족도 조사 그리드
    $("#satisFactionManageGrid").kendoExtGrid({
        gridId:"G-CRM-0721-113208"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/crm/css/satisFactionManage/selectSatisFactionManages.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sStsfIvstNm"] = $("#sStsfIvstNm").val();
                        params["sStsfIvstTpCd"] = $("#sStsfIvstTpCd").data("kendoExtDropDownList").value();
                        params["sStsfIvstMthCd"] = $("#sStsfIvstMthCd").data("kendoExtDropDownList").value();
                        params["sStsfIvstExpdCd"] = $("#sStsfIvstExpdCd").data("kendoExtDropDownList").value();
                        params["sUseYn"] = $("#sUseYn").data("kendoExtDropDownList").value();
                        params["sStartRegDt"] = $("#sStartRegDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndRegDt"] = $("#sEndRegDt").data("kendoExtMaskedDatePicker").value();
                        params["sStsfStartDt"] = $("#sStsfStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sStsfEndDt"] = $("#sStsfEndDt").data("kendoExtMaskedDatePicker").value();
                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"seq"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,seq:{type:"number", editable:false}
                        ,subyTmplSeq:{type:"number"} /* 설문 템플릿 */
                        ,startDt:{type:"date", validation:{required:true}} /* 시작일자 */
                        ,startDtFormat:{type:"date", validation:{required:true}} /* 시작일자 */
                        ,endDt:{type:"date", validation:{required:true}} /* 종료일자 */
                        ,endDtFormat:{type:"date", validation:{required:true}} /* 종료일자 */
                        ,lastExtrDt:{type:"date", validation:{required:true}} /* 마지막 추출일 */
                        ,lastExtrDtFormat:{type:"date", validation:{required:true}} /* 마지막 추출일 */
                        ,regDt:{type:"date", validation:{required:true}} /* 등록일 */
                        ,regDtFormat:{type:"date", validation:{required:true}} /* 등록일 */
                        ,stsfCustCnt:{type:"number", validation:{required:true}}    //대상자수
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.startDtFormat= kendo.parseDate(elem.startDt, "<dms:configValue code='dateFormat' />");
                            elem.endDtFormat= kendo.parseDate(elem.endDt, "<dms:configValue code='dateFormat' />");
                            elem.lastExtrDtFormat = kendo.parseDate(elem.lastExtrDt, "<dms:configValue code='dateFormat' />");
                            elem.regDtFormat= kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
        ,selectable:"row"
        ,multiSelectWithCheckbox:false
        ,editable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,change:function(e){
            var selectedItem = this.dataItem(this.select());
            if ( dms.string.isNotEmpty(selectedItem.seq) ) {
                $("#btnDetail").data("kendoButton").enable(true);
                $("#btnSatisFacMngPrint").data("kendoButton").enable(true);

                if ( selectedItem.custExtrAutoYn === "N" && selectedItem.stsfIvstExpdCd !== "03" ) {
                    $("#btnRcpeExtrMapping").data("kendoButton").enable(true);
                } else {
                    $("#btnRcpeExtrMapping").data("kendoButton").enable(false);
                };

            };
        }
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:50, sortable:false, attributes:{"class":"ac"}}
            ,{field:"stsfIvstNm", title:"<spring:message code='crm.lbl.stsfIvstNm'/>",width:150, attributes:{"class":"al"}}// 만족도 조사명
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
            ,{field:"stsfIvstMthCdNm", title:"<spring:message code='crm.lbl.stsfIvstMthCd'/>", attributes:{"class":"ac"},width:100,sortable:false}  //만족도 조사 유형
            ,{field:"stsfIvstExpdCdNm", title:"<spring:message code='crm.lbl.stsfIvstExpdCd'/>", attributes:{"class":"ac"},width:110,sortable:false} //만족도 조사 수단
            ,{field:"stsfIvstTpCdNm", title:"<spring:message code='crm.lbl.stsfIvstTpCd'/>", attributes:{"class":"ac"},width:100,sortable:false} //조사 타입
            ,{//설문 템플릿
                field:"subyTmplSeq"
                ,title:"<spring:message code='crm.lbl.subyTmplNm' />"
                ,width:170
                ,template:"# if(surveyTmplMap[subyTmplSeq] != null) { # #= surveyTmplMap[subyTmplSeq].subyTmplNm# # }#"
            }
            ,{//대상자 추출명
                field:"rcpeExtrSeq"
                ,title:"<spring:message code='crm.lbl.rcpeExtrNm' />"
                ,width:100
                ,attributes:{"class":"al"}
                ,template:'#if(rcpeExtrSeq !== "" && rcpeExtrSeq !== null){# #= targExtractListMap[rcpeExtrSeq]# #}#'
            }
            ,{//시작일
                field:"startDtFormat"
                ,title:"<spring:message code='global.lbl.startDt' />"
                ,width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,template:"#if(startDtFormat !== '' && startDtFormat !== null){# #= kendo.toString(data.startDt, '<dms:configValue code='dateFormat' />') # #}else{# - #}#"
            }
            ,{//종료일
                field:"endDtFormat"
                ,title:"<spring:message code='global.lbl.endDt' />"
                ,width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,template:"#if(endDtFormat !== '' && endDtFormat !== null){# #= kendo.toString(data.endDt, '<dms:configValue code='dateFormat' />') # #}else{# - #}#"
            }
            ,{//사용여부
                field:"useYn"
                , title:"<spring:message code='global.lbl.useYn' />"
                , width:80
                ,attributes:{"class":"ac"}
            }
            ,{//대상
                field:"custTargYn"
                , title:"<spring:message code='global.lbl.custTargYn'/>"
                , width:120
                ,attributes:{"class":"ac"}
                ,template:'#= custTargYnArrVal(custTargYn)#'
            }
            ,{//대상자 자동추출
                field:"custExtrAutoYn"
                , title:"<spring:message code='crm.lbl.custExtrAutoYn'/>"
                , width:120
                ,attributes:{"class":"ac"}
                ,template:'#= custExtrAutoYnArrVal(custExtrAutoYn)#'
            }
            ,{//최근추출일
                field:"lastExtrDtFormat"
                ,title:"<spring:message code='crm.lbl.lastExtrDt' />"
                ,width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,template:"#if(lastExtrDtFormat !== '' && lastExtrDtFormat !== null){# #= kendo.toString(data.lastExtrDt, '<dms:configValue code='dateFormat' />') # #}else{# - #}#"
            }
            ,{//대상자수
                field:"stsfCustCnt"
                ,title:"<spring:message code='crm.lbl.stsfCustCnt' />"
                ,width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n0}"
            }
            ,{//등록일
                field:"regDtFormat"
                ,title:"<spring:message code='global.lbl.regDt' />"
                ,width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,template:"#if(regDtFormat !== '' && regDtFormat !== null){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #}else{# - #}#"
            }
            ,{//설명/화술
                field:"stsfCont"
                , title:"<spring:message code='crm.lbl.stsfCont'/>"
                , width:150
                , hidden:true
            }
        ]

    });




    /*************************************************************
     *   그리드 셋팅
    *************************************************************/
    //만족도 조사 대상 관리 그리드 설정
    $("#presentDetailGrid").kendoExtGrid({
        gridId:"G-CRM-0103-102500"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/crm/css/satisFactionManage/selectSurveyCustResults.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"]    = options.pageSize;
                        params["pageIndex"]             = options.page;
                        params["firstIndex"]            = options.skip;
                        params["lastIndex"]             = options.skip + options.take;
                        params["sort"]                  = options.sort;

                        params["sDlrCd"] = $("#dlrCd").val();
                        params["sSeq"] = $("#seq").val();;

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
                            rnum:{type:"string", editable:false}
                            ,seq:{type:"number"} // 일련번호
                            ,stsfIvstDt:{type:"date"} //만족도조사일
                            ,stsfIvstDtFormat:{type:"date", editable:false}
                            ,stsfIvstScoreVal:{type:"number"} //만족도 조사점수
                            ,callCenSendDt:{type:"date"}//콜센터 전송일
                            ,callCenSendDtFormat:{type:"date", editable:false}
                            ,regDt:{type:"date"} //등록일
                            ,regDtFormat:{type:"date", editable:false}
                        }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.stsfIvstDtFormat = kendo.parseDate(elem.stsfIvstDt, "<dms:configValue code='dateFormat' />");
                                elem.callCenSendDtFormat = kendo.parseDate(elem.callCenSendDt, "<dms:configValue code='dateFormat' />");
                                elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                            });
                        }
                        return d;
                    }
            }
        }
        ,dataBound:function(e) {

            var totalCnt = e.sender.dataSource._total;
            if ( totalCnt > 0 ) {

                $("#btnSave").data("kendoButton").enable(true);
                $("#btnDel").data("kendoButton").enable(true)

            } else {

                $("#btnSave").data("kendoButton").enable(false);
                $("#btnDel").data("kendoButton").enable(false)

            }

        }
        ,multiSelectWithCheckbox:true
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:fa
        ,editable:false
        ,height:292
        ,autoBind:false
        ,sortable:true
        ,columns:[
           {field:"rnum", title:"<spring:message code='global.lbl.no' />" ,width:50, sortable:false, attributes:{"class":"ac"}}// 캠페인코드
           ,{field:"custNm", title:"<spring:message code='global.lbl.custNm'/>", attributes:{"class":"al"}, width:100}//고격명
           ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo'/>", attributes:{"class":"ac"}, width:100}//전화번호
           ,{field:"purcMngNm", title:"<spring:message code='crm.lbl.companyContacts'/>", attributes:{"class":"al"}, width:100}//구매담당자 명
           ,{field:"useCustNm", title:"<spring:message code='crm.lbl.driver'/>", attributes:{"class":"al"}, width:100}//방문자명
           ,{field:"useHpNo", title:"<spring:message code='crm.lbl.driverHp'/>", attributes:{"class":"ac"}, width:100}//방문자 이동전화
           ,{field:"mngUsrNm", title:"<spring:message code='crm.lbl.saAndsc'/>", attributes:{"class":"al"}, width:100}//담당자
           ,{field:"stsfIvstDtFormat", title:"<spring:message code='crm.lbl.stsfIvstDt' />"
               ,attributes:{"class":"ac tooltip-disabled"}
               ,width:150
               ,template:'#if(data.stsfIvstDt !== "" && data.stsfIvstDt !== null){# #= kendo.toString(data.stsfIvstDt, "<dms:configValue code="dateTimeFormat" />") # #}#'
           }
           ,{field:"usrNm", title:"<spring:message code='global.lbl.stsfIvstEmpId'/>", attributes:{"class":"al"}, width:100}//만족도 조사인
           ,{field:"stsfIvstYnNm", title:"<spring:message code='crm.lbl.stsfIvstYn'/>",attributes:{"class":"ac"},width:80,sortable:false}              // 만족여부
           ,{field:"cmplReasonCont", title:"<spring:message code='crm.lbl.cmplReasonCont' />", width:80 // 총결
               ,attributes:{"class":"al"}
           }
           ,{field:"callCenSendDtFormat", title:"<spring:message code='crm.lbl.callCenSendDt' />"
               ,attributes:{"class":"ac tooltip-disabled"}
               ,width:150
               ,template:'#if(data.callCenSendDt !== "" && data.callCenSendDt !== null){# #= kendo.toString(data.callCenSendDt, "<dms:configValue code="dateTimeFormat" />") # #}#'
           }
           ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />"
               ,attributes:{"class":"ac tooltip-disabled"}
               ,width:100
               ,template:"#= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') #"
           }
        ]
    });

    // 객관식 상세 그리드 시작 //
    $("#shortQuestionResultsGrid").kendoExtGrid({
        dataSource:{
            requestEnd:function(e) {
                if (e.response.total > 0) {
                    var columnList = e.response.columnList;
                    var sColumn = [];
                    sColumn = shortQuestGridColumns.concat(sColumn);

                    $.each(columnList, function(idx, headerCont) {

                       var column = {};
                       column["field"] = "Q"+(idx+1);
                       column["title"] = headerCont;
                       column["width"] = 80;
                       column["attributes"] = {"class":"ac"};
                       sColumn.push(column);

                    });

                    $("#shortQuestionResultsGrid").data("kendoExtGrid").setOptions({ columns:sColumn } );
                }
            }
            ,transport:{
                read:{
                    url:"<c:url value='/crm/css/satisFactionManage/selectMultipleQuestionResults.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"]    = options.pageSize;
                        params["pageIndex"]             = options.page;
                        params["firstIndex"]            = options.skip;
                        params["lastIndex"]             = options.skip + options.take;
                        params["sort"]                  = options.sort;

                        params = $.extend(params, gridCommonParams("M"));
                        //console.log("객관식 결과 요약param: ",kendo.stringify(params));

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                errors:"error"
                ,data:"data"
                ,total:"total"
                ,model:{
                    id:"rnum"
                    ,fields:{
                        seq:{type:"string"}
                        , regDt:{type:"date"}
                    }
                }
            }
        }
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />" ,width:50,sortable:false, attributes:{"class":"ac"}}
            ,{field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd' />", width:80 // 딜러코드
                ,attributes:{"class":"al"}, hidden:true
            }
            ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100 // 고객명
                ,attributes:{"class":"al"}
            }
            ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />", width:100 // 휴대전화
                ,attributes:{"class":"al"}
            }
            ,{field:"purcMngNm", title:"<spring:message code='crm.lbl.companyContacts'/>", attributes:{"class":"al"}, width:100}//구매담당자 명
            ,{field:"useCustNm", title:"<spring:message code='crm.lbl.driver'/>", attributes:{"class":"al"}, width:100}//방문자명
            ,{field:"useHpNo", title:"<spring:message code='crm.lbl.driverHp'/>", attributes:{"class":"ac"}, width:100}//방문자 이동전화
            ,{field:"mngUsrNm", title:"<spring:message code='crm.lbl.saAndsc'/>", attributes:{"class":"al"}, width:100}//담당자
            ,{field:"stsfIvstDt", title:"<spring:message code='crm.lbl.stsfIvstDt' />", width:120 // 만족도 조사일
                ,attributes:{"class":"al"}
            }
            ,{field:"usrNm", title:"<spring:message code='global.lbl.stsfIvstEmpId' />", width:100 // 만족도 조사인
                ,attributes:{"class":"al"}
            }
            ,{field:"stsfIvstYnNm", title:"<spring:message code='crm.lbl.stsfIvstYn' />", width:80 // 만족여부
                ,attributes:{"class":"al"}
            }
            ,{field:"cmplReasonCont", title:"<spring:message code='crm.lbl.cmplReasonCont' />", width:80 // 총결
                ,attributes:{"class":"al"}
            }
        ]
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
        ,filterable:false
        ,reorderable:true
        ,editable:false
        ,navigatable:false
        ,autoBind:false
        ,sortable:false
        ,resizable:true
        ,selectable:"row"
        ,height:245
    });
    shortQuestGridColumns = $("#shortQuestionResultsGrid").data("kendoExtGrid").columns;
    // 객관식 상세 그리드 종료 //

    // 주관식 상세 그리드 시작 //
    $("#multipleQuestionResultsGrid").kendoExtGrid({
        dataSource:{
            requestEnd:function(e) {
                if (e.response.total > 0) {
                    var columnList = e.response.columnList;
                    var sColumn = [];
                    sColumn = multipleQuestGridColumns.concat(sColumn);

                    $.each(columnList, function(idx, headerCont) {

                       var column = {};
                       column["field"] = "Q"+(idx+1);
                       column["title"] = headerCont;
                       column["width"] = 80;
                       column["attributes"] = {"class":"ac"};
                       sColumn.push(column);
                    });

                    $("#multipleQuestionResultsGrid").data("kendoExtGrid").setOptions({ columns:sColumn } );
                }
            }
            ,transport:{
                read:{
                    url:"<c:url value='/crm/css/satisFactionManage/selectMultipleQuestionResults.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"]    = options.pageSize;
                        params["pageIndex"]             = options.page;
                        params["firstIndex"]            = options.skip;
                        params["lastIndex"]             = options.skip + options.take;
                        params["sort"]                  = options.sort;

                        params = $.extend(params, gridCommonParams("C"));
                        //console.log("주관식 결과 요약param: ",kendo.stringify(params));

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                errors:"error"
                ,data:"data"
                ,total:"total"
                ,model:{
                    id:"rnum"
                    ,fields:{
                        seq:{type:"string"}
                        , regDt:{type:"date"}
                    }
                }
            }
        }
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />" ,width:50,sortable:false, attributes:{"class":"ac"}}
            ,{field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd' />", width:80 // 딜러코드
                ,attributes:{"class":"al"}, hidden:true
            }
            ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100 // 고객명
                ,attributes:{"class":"al"}
            }
            ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />", width:100 // // 휴대전화
                ,attributes:{"class":"ac"}
            }
            ,{field:"purcMngNm", title:"<spring:message code='crm.lbl.companyContacts'/>", attributes:{"class":"al"}, width:100}//구매담당자 명
            ,{field:"useCustNm", title:"<spring:message code='crm.lbl.driver'/>", attributes:{"class":"al"}, width:100}//방문자명
            ,{field:"useHpNo", title:"<spring:message code='crm.lbl.driverHp'/>", attributes:{"class":"ac"}, width:100}//방문자 이동전화
            ,{field:"mngUsrNm", title:"<spring:message code='crm.lbl.saAndsc'/>", attributes:{"class":"al"}, width:100}//담당자
            ,{field:"stsfIvstDt", title:"<spring:message code='crm.lbl.stsfIvstDt' />", width:120 // 만족도조사일
                ,attributes:{"class":"al"}
            }
            ,{field:"usrNm", title:"<spring:message code='global.lbl.stsfIvstEmpId' />", width:100 // 만족도 조사인
                ,attributes:{"class":"al"}
            }
            ,{field:"stsfIvstYnNm", title:"<spring:message code='crm.lbl.stsfIvstYn' />", width:80 // 만족여부
                ,attributes:{"class":"al"}
            }
            ,{field:"cmplReasonCont", title:"<spring:message code='crm.lbl.cmplReasonCont' />", width:80 // 총결
                ,attributes:{"class":"al"}
            }
        ]
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
        ,filterable:false
        ,reorderable:true
        ,editable:false
        ,navigatable:false
        ,autoBind:false
        ,sortable:false
        ,resizable:true
        ,selectable:"row"
        ,height:245
    });
    multipleQuestGridColumns = $("#multipleQuestionResultsGrid").data("kendoExtGrid").columns;
    // 주관식 상세 그리드 종료 //

    //버튼 - 엑셀Export ( 객관식 요약 )
    $("#btnExcelExportS").kendoButton({
        click:function(e){
            fnStsfRsltExport("S");
        }
        ,enable:false
    });

    //버튼 - 엑셀Export ( 객관식 )
    $("#btnExcelExportM").kendoButton({
        click:function(e){
            fnStsfRsltExport("M");
        }
        ,enable:false
    });

    //버튼 - 엑셀Export ( 주관식 )
    $("#btnExcelExportC").kendoButton({
        click:function(e){
            fnStsfRsltExport("C");
        }
        ,enable:false
    });

    // 엑셀Export ( 주관식 / 객관식 )
    function fnStsfRsltExport(param) {

        var type = param;       // S:요약 / M:객관식 / C:주관식
        var dlrCd = $("#dlrCd").val();
        var sStsfIvstSeq = $("#seq").val();;
        var templateFile;
        var fileName;
        var sysDateExcelNm = "${sysDateExcelNm}";

        if ( dms.string.isEmpty(sStsfIvstSeq) ) {
            // 만족도조사 일련번호
            dms.notification.warning("<spring:message code='crm.lbl.stsfIvstSeq' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
            return;
        };

        if ( dms.string.isEmpty(type) ) {
            // 대상자 추출타입
            dms.notification.warning("<spring:message code='crm.info.targExtType' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
            return;
        };

        if ( type === "S" ) {

            fileName = "<spring:message code='crm.lbl.shortQuestSummary' />"
            templateFile = "StsfResultSummary.xlsx";

            dms.ajax.excelExport({
                "beanName":"satisFactionMobileResultService"
                ,"templateFile":templateFile
                ,"fileName":"<spring:message code='global.lbl.stsfIvstRsltCont' />_"+fileName+"_"+sysDateExcelNm+".xlsx"
                ,"sExportTp":type
                ,"sQestTp":type
                ,"sDlrCd":dlrCd
                ,"sStsfIvstSeq":sStsfIvstSeq
            });

        } else {

            var params = {};
            params = gridCommonParams(type);

            // 만족도 조사 답안결과 ( sQestTp : C(주관식) / M(객관식) ) 엑셀Export 수량 데이터를 조회한다.
            $.ajax({
                url:"<c:url value='/crm/css/satisFactionManage/selectMultipleQuestionResultsExcelExportCnt.do' />",
                data:JSON.stringify(params),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(resultCnt) {

                    //console.log("resultCnt : ",resultCnt)
                    <c:set value="10000" var="maxCnt" />;
                    var excelMaxExportCnt = <c:out value="${maxCnt}"/>;

                    if ( resultCnt > excelMaxExportCnt ) {
                        // {엑셀Export}는 { *** 个数} 를 초과할 수 없습니다.
                        dms.notification.warning("<spring:message code='crm.info.excelExport' var='returnMsg1' /><spring:message code='crm.info.maxExcelExportCnt' arguments='${maxCnt}' var='returnMsg2' /><spring:message code='crm.info.maxInfoChk' arguments='${returnMsg1}, ${returnMsg2}' />");
                        return;
                    };

                    if ( type === "M" ) {
                        fileName = "<spring:message code='crm.lbl.shortQuestDtl' />"
                        templateFile = "StsfResultDetailM.xlsx";
                    } else if ( type === "C" ) {
                        fileName = "<spring:message code='crm.lbl.multipleQuestDtl' />"
                        templateFile = "StsfResultDetailC.xlsx";
                    };

                    dms.ajax.excelExport({
                        "beanName":"satisFactionMobileResultService"
                        ,"templateFile":templateFile
                        ,"fileName":"<spring:message code='global.lbl.stsfIvstRsltCont' />_"+fileName+"_"+sysDateExcelNm+".xlsx"
                        ,"sExportTp":type
                        ,"sQestTp":type
                        ,"sDlrCd":dlrCd
                        ,"sStsfIvstSeq":sStsfIvstSeq
                    });

                }
            });

        };

    };

    //정비위탁유형
    var lbrTps = [];
    <c:forEach var="obj" items="${lbrTps}">
        lbrTps.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //수리유형
    var rePairTps = [];
    <c:forEach var="obj" items="${rePairTps}">
        rePairTps.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //공통코드:딜러 자체RO 유형
    var dlrRoTpList = [];
    <c:forEach var="obj" items="${dlrRoTpDs}">
        dlrRoTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    // 정비 일자 FROM
    $("#CRM7500318-01").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    // 정비 일자 TO
    $("#CRM7500318-02").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 정비 일자(후 일수)
    $("#CRM7500319-01").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 주행 거리 (from)
    $("#CRM7500320-01").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 주행 거리 (to)
    $("#CRM7500320-02").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 정비 금액 (from)
    $("#CRM7500321-01").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 정비 금액 (to)
    $("#CRM7500321-02").kendoExtNumericTextBox({
        format:"n0"
       ,decimals:0                // 소숫점
       ,min:0
       ,value:0
       ,spinners:false             // 증,감 화살표
    });

    // 정비위탁유형
    $("#CRM7500323-01").kendoMultiSelect({
        dataSource:dms.data.cmmCdFilter(lbrTps),
        valuePrimitive:true,
        placeholder:"",
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd"
    });

    // 수리 유형
    $("#CRM7500355-01").kendoMultiSelect({
        dataSource:dms.data.cmmCdFilter(rePairTps),
        valuePrimitive:true,
        placeholder:"",
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd"
    });

    // 最后1次维修时间 마지막번 정비 일자 FR
    $("#CRM7500351-01").kendoExtNumericTextBox({
        format:"n0"
        ,decimals:0                // 소숫점
        ,min:0
        ,value:0
        ,spinners:false             // 증,감 화살표
    });

    // 下次保养时间 다음 보양일자 FROM
    $("#CRM7500352-01").kendoExtNumericTextBox({
        format:"n0"
        ,decimals:0                // 소숫점
        ,min:0
        ,value:0
        ,spinners:false             // 증,감 화살표
    });

    // 자체RO유형
    $("#CRM7500359-03").kendoMultiSelect({
        dataSource:dms.data.cmmCdFilter(dlrRoTpList),
        valuePrimitive:true,
        placeholder:"",
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd"
    });

    console.log("dlrRoTpList : ",dlrRoTpList)

    //[정비 일자] 조건 입력부 비활성화
    $("#CRM7500318_del").kendoButton({
        click:function(e){
            $("#CRM7500318_fleg").val("N");
            $("#CRM7500318-01").val("");
            $("#CRM7500318-02").val("");
            $("#CRM7500318").hide();
        }
    });

    //[정비 일자(후 일수)] 조건 입력부 비활성화
    $("#CRM7500319_del").kendoButton({
        click:function(e){
            $("#CRM7500319_fleg").val("N");
            $("#CRM7500319-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500319").hide();
        }
    });

    //[주행 거리] 조건 입력부 비활성화
    $("#CRM7500320_del").kendoButton({
        click:function(e){
            $("#CRM7500320_fleg").val("N");
            $("#CRM7500320-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500320-02").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500320").hide();
        }
    });

    //[정비 금액] 조건 입력부 비활성화
    $("#CRM7500321_del").kendoButton({
        click:function(e){
            $("#CRM7500321_fleg").val("N");
            $("#CRM7500321-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500321-02").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500321").hide();
        }
    });

    //[정비위탁유형] 조건 입력부 비활성화
    $("#CRM7500323_del").kendoButton({
        click:function(e){
            $("#CRM7500323_fleg").val("N");
            $("#CRM7500323-01").data("kendoMultiSelect").value("");
            $("#CRM7500323").hide();
        }
    });

    //[수리유형] 조건 입력부 비활성화
    $("#CRM7500355_del").kendoButton({
        click:function(e){
            $("#CRM7500355_fleg").val("N");
            $("#CRM7500355-01").data("kendoMultiSelect").value("");
            $("#CRM7500355").hide();
        }
    });

    //[最后1次维修时间 마지막번 정비 일자] 조건 입력부 비활성화
    $("#CRM7500351_del").kendoButton({
        click:function(e){
            $("#CRM7500351_fleg").val("N");
            $("#CRM7500351-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500351").hide();
        }
    });

    //[下次保养时间 다음 보양일자] 조건 입력부 비활성화
    $("#CRM7500352_del").kendoButton({
        click:function(e){
            $("#CRM7500352_fleg").val("N");
            $("#CRM7500352-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500352").hide();
        }
    });

    //[정비일자+정비위탁유형]
    $("#CRM7500359_del").kendoButton({
        click:function(e){
            $("#CRM7500359_fleg").val("N");
            $("#CRM7500359-03").data("kendoMultiSelect").value("");
            $("#CRM7500359").hide();
        }
    });

    f_showHideInput();

}); //end Ready


    //조건에 따른 입력부 활성화
    function f_addInput(value){

        if( $("#editYn").val() === "Y" ) {

            //정비정보
            if(value == 'CRM7500318'){
                $("#CRM7500318").show();
                $("#CRM7500318_fleg").val("Y");
            }else if(value == 'CRM7500319'){
                console.log("value : ",value)
                $("#CRM7500319").show();
                $("#CRM7500319_fleg").val("Y");
            }else if(value == 'CRM7500320'){
                $("#CRM7500320").show();
                $("#CRM7500320_fleg").val("Y");
            }else if(value == 'CRM7500321'){
                $("#CRM7500321").show();
                $("#CRM7500321_fleg").val("Y");
            }else if(value == 'CRM7500323'){
                $("#CRM7500323").show();
                $("#CRM7500323_fleg").val("Y");
            }else if(value == 'CRM7500355'){
                $("#CRM7500355").show();
                $("#CRM7500355_fleg").val("Y");
            }else if(value == 'CRM7500351'){
                $("#CRM7500351").show();
                $("#CRM7500351_fleg").val("Y");
            }else if(value == 'CRM7500352'){
                $("#CRM7500352").show();
                $("#CRM7500352_fleg").val("Y");
            }else if(value == 'CRM7500359'){
                $("#CRM7500359").show();
                $("#CRM7500359_fleg").val("Y");
            };

        };

    };

    function f_showHideInput(){

        //[정비 일자]
        if($("#CRM7500318-01").val() == "" || $("#CRM7500318-01").val() == null){
            $("#CRM7500318_fleg").val("N");
            $("#CRM7500318-01").val("");
            $("#CRM7500318-02").val("");
            $("#CRM7500318").hide();

        }else{
            $("#CRM7500318").show();
            $("#CRM7500318_fleg").val("Y");
        }

        //[정비 일자(후 일수)]
        if($("#CRM7500319-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500319-01").data("kendoExtNumericTextBox").value() == 0){
            $("#CRM7500319_fleg").val("N");
            $("#CRM7500319-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500319").hide();
        }else{
            $("#CRM7500319").show();
            $("#CRM7500319_fleg").val("Y");
        }

        //[주행 거리]
        if($("#CRM7500320-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500320-01").data("kendoExtNumericTextBox").value() == 0){
            $("#CRM7500320_fleg").val("N");
            $("#CRM7500320-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500320-02").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500320").hide();
        }else{
            $("#CRM7500320").show();
            $("#CRM7500320_fleg").val("Y");
        }

        //[정비 금액]
        if($("#CRM7500321-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500321-01").data("kendoExtNumericTextBox").value() == 0){
            $("#CRM7500321_fleg").val("N");
            $("#CRM7500321-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500321-02").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500321").hide();
        }else{
            $("#CRM7500321").show();
            $("#CRM7500321_fleg").val("Y");
        }

        //[정비위탁유형]
        if($("#CRM7500323-01").val() == "" || $("#CRM7500323-01").val() == null){
            $("#CRM7500323_fleg").val("N");
            $("#CRM7500323-01").data("kendoMultiSelect").value("");
            $("#CRM7500323").hide();
        }else{
            $("#CRM7500323").show();
            $("#CRM7500323_fleg").val("Y");
        }

        //[수리유형]
        if($("#CRM7500355-01").val() == "" || $("#CRM7500355-01").val() == null){
            $("#CRM7500355_fleg").val("N");
            $("#CRM7500355-01").data("kendoMultiSelect").value("");
            $("#CRM7500355").hide();
        }else{
            $("#CRM7500355").show();
            $("#CRM7500355_fleg").val("Y");
        }

        //[最后1次维修时间 마지막번 정비 일자]
        if($("#CRM7500351-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500351-01").data("kendoExtNumericTextBox").value() == 0){
            $("#CRM7500351_fleg").val("N");
            $("#CRM7500351-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500351").hide();
        }else{
            $("#CRM7500351").show();
            $("#CRM7500351_fleg").val("Y");
        }

        //[下次保养时间 다음 보양일자]
        if($("#CRM7500352-01").data("kendoExtNumericTextBox").value() == null || $("#CRM7500352-01").data("kendoExtNumericTextBox").value() == 0){
            $("#CRM7500352_fleg").val("N");
            $("#CRM7500352-01").data("kendoExtNumericTextBox").value(0);
            $("#CRM7500352").hide();
        }else{
            $("#CRM7500352").show();
            $("#CRM7500352_fleg").val("Y");
        }


        //[정비일자+정비위탁유형]
        if($("#CRM7500359-03").val() == "" || $("#CRM7500359-03").val() == null){
            $("#CRM7500359_fleg").val("N");
            $("#CRM7500359-03").data("kendoMultiSelect").value("");
            $("#CRM7500359").hide();
        }else{
            $("#CRM7500359").show();
            $("#CRM7500359_fleg").val("Y");
        }


    };

</script>
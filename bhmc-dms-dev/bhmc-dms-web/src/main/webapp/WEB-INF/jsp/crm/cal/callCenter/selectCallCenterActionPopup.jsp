<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

        <section id="window" class="pop_wrap">

            <!-- 상단탭 시작 -->
            <div id="mainTab" class="tab_area">
                <ul>
                    <li id="callInfoTab" class="k-state-active" ><spring:message code="global.title.record" /><!-- CALL 정보 --></li>
                    <li id="smsHisTab"><spring:message code='global.lbl.msgHistory' /><!-- 메시지이력 --></li>
                    <li id="callHisTab"><spring:message code="crm.title.OBHistory" /> <!-- OB이력 --></li>
                </ul>
                <span class="btn_right_absolute2">
                <dms:access viewId="VIEW-D-11376" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnRoResv" class="btn_m"><spring:message code='crm.lbl.lbrResv' /><!-- 정비예약 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11377" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnCtlNextStepBefore" type="button" class="btn_m hidden"><spring:message code="global.btn.visitResv" /><!-- 내방예약 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11378" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnOBCall" class="btn_m hidden"><spring:message code="global.btn.callSend" /><!-- 전화걸기 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-11379" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnCallCenterSave" class="btn_m btn_save"><spring:message code="global.btn.save" /><!-- 저장 --></button>
                </dms:access>
                </span>
                <!-- 콜정보 -->
                <div id="callInfoTabInfo">
                    <section class="group">
                        <div class="table_form">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:9%;">
                                    <col style="width:15%;">
                                    <col style="width:9%;">
                                    <col style="width:15%;">
                                    <col style="width:10%;">
                                    <col style="width:15%;">
                                    <col style="width:10%;">
                                    <col style="width:17%;">
                                </colgroup>
                                <tbody id="callCenterActionInfoForm" >
                                    <input type="hidden" id="callSeq" name="callSeq" data-json-obj="true" required data-name="<spring:message code="crm.lbl.callSeq" />" />
                                    <input type="hidden" id="bizCd" name="bizCd" data-json-obj="true" required data-name="<spring:message code="global.lbl.wrkTp" />" />
                                    <input type="hidden" id="refTableNm" name="refTableNm" data-json-obj="true" required data-name="<spring:message code="global.lbl.refTableNm" />" />
                                    <input type="hidden" id="refKeyNm" name="refKeyNm" data-json-obj="true" required data-name="<spring:message code="global.lbl.refKeyNm" />" />
                                    <input type="hidden" id="subyTmplSeq" name="subyTmplSeq"/>
                                    <input type="hidden" id="callHisSeq" name="callHisSeq"/>
                                    <input type="hidden" id="callDialNum" name="callDialNum"/>
                                    <input type="hidden" id="callPrsnId" name="callPrsnId"/>

                                    <tr>
                                        <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                                        <td>
                                            <input type="text" id="custNm" name="custNm" class="form_input form_readonly" readonly />
                                            <input type="hidden" id="custNo" name="custNo" data-json-obj="true" required data-name="<spring:message code="global.lbl.custNo" />" />
                                        </td>
                                        <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 이동전화 --></th>
                                        <td>
                                            <input id="hpNo" name="hpNo" class="form_input form_readonly" readonly />
                                        </td>
                                        <th scope="row"><spring:message code="global.lbl.callCnt" /><!-- CALL횟수 --></th>
                                        <td>
                                            <input type="text" id="callCnt" name="callCnt" readonly class="form_input form_readonly" data-json-obj="true" required data-name="<spring:message code="global.lbl.callCnt" />" />
                                        </td>
                                        <th scope="row"><spring:message code="crm.lbl.callProcEndYn" /><!-- 콜센터처리완료여부 --></th>
                                        <td>
                                            <input type="checkbox" id="callProcEndYn" name="callProcEndYn" class="form_check" data-json-obj="true" data-name="<spring:message code="crm.lbl.callProcEndYn" />" />
                                        </td>
                                    </tr>
                                    <tr id="stsfInfoArea" class="hidden">
                                        <th scope="row" id="stsfInfoTxt1"><spring:message code="global.lbl.carDriver" /><!-- 차량운전자 --></th>
                                        <td>
                                            <input type="text" id="driverNm" name="driverNm" class="form_input form_readonly" readonly />
                                        </td>
                                        <th scope="row" id="stsfInfoTxt2"><spring:message code="global.lbl.driverHpNo" /><!-- 운전자핸드폰 --></th>
                                        <td id="stsfInfoTxt3">
                                            <input id="driverHpNo" name="driverHpNo" class="form_input form_readonly" readonly />
                                        </td>
                                        <th scope="row"></th>
                                        <td>
                                        </td>
                                        <th scope="row"></th>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.callDt" /><!-- 통화시간 --></span></th>
                                        <td colspan="3">
                                            <div class="form_float">
                                                <div class="date_left">
                                                    <input id="callStartDt" name="callStartDt" class="form_datepicker" data-json-obj="true" required type="date" data-name="<spring:message code="crm.lbl.callStartDt" />" />
                                                    <span class="txt_from">~</span>
                                                </div>
                                                <div class="date_right">
                                                    <input id="callEndDt" name="callEndDt" class="form_datepicker" data-json-obj="true" required type="date" data-name="<spring:message code="crm.lbl.callEndDt" />" />
                                                </div>
                                            </div>
                                        </td>
                                        <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.callRsltCd" /><!-- 콜결과 --></span></th>
                                        <td>
                                            <input id="callRsltCd" name="callRsltCd" class="form_comboBox" data-json-obj="true" required data-name="<spring:message code="crm.lbl.callRsltCd" />" />
                                        </td>
                                        <th scope="row"><spring:message code="crm.lbl.nextCallDt" /><!-- 다음Call시간 --></th>
                                        <td>
                                            <input id="scheCallDt" name="scheCallDt" class="form_datepicker" data-json-obj="true" type="date" data-name="<spring:message code="crm.lbl.nextCallDt" />" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="crm.lbl.recFileId" /><!-- 녹취파일 --></th>
                                        <td colspan="3">
                                            <input type="text" id="recFileId" name="recFileId" readonly class="form_input form_readonly">
                                        </td>
                                        <th scope="row"><spring:message code="crm.lbl.callCont" /><!-- 콜내용 --></th>
                                        <td colspan="3" rowspan="2">
                                            <textarea rows="2" cols="" id="callCont" name="callCont" class="form_textarea" data-json-obj="true" data-name="<spring:message code="crm.lbl.callCont" />" ></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" id="stsfCallTitleArea" ><spring:message code="crm.lbl.callVsitResvDt" /><!-- 만족도조사일 --></th>
                                        <td colspan="3">
                                            <input id="callVsitResvDt" name="callVsitResvDt" class="form_datepicker" type="date" data-name="<spring:message code="crm.lbl.callVsitResvDt" />" />
                                        </td>
                                        <th></th>
                                        <td></td>
                                        <th></th>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <td></td>
                                        <th></th>
                                        <td></td>
                                        <th></th>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <td></td>
                                        <th></th>
                                        <td></td>
                                        <th></th>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </section>
                </div>
                <!-- //콜정보 -->
                <!-- SMS -->
                <div id="smsHisTabInfo" class="mt0">
                  <section class="group">
                      <div class="header_area">
                      </div>
                      <div class="table_grid">
                        <div id="msgHistoryGrid" class="grid"></div>
                      </div>
                  </section>
                </div>
                <!-- //SMS -->
                <!-- OB 이력 -->
                <div id="callHisTabInfo" class="mt0">
                  <section class="group">
                      <div class="header_area">
                      </div>
                      <div class="table_grid">
                        <div id="callHisGrid" class="grid"></div>
                      </div>
                  </section>
                </div>
                <!-- //OB 이력 -->
            </div>
            <!-- // 상단탭 종료 -->

            <!-- 하단탭 시작 -->
            <div id="subTab" class="tab_area">
                <ul>
                    <li id="campaignInfoTab" style="display:none;" ><spring:message code="crm.title.campaignInfo" /><!-- 캠페인정보 --></li>
                    <li id="campaignTalkPlanTab" style="display:none;" ><spring:message code="global.lbl.talkPlan" /><!-- 화술방안 --></li>

                    <li id="satisFactionInfoTab" style="display:none;" ><spring:message code="crm.title.callSatisFaction" /><!-- 만족도조사 상세정보 --></li>
                    <li id="surveyInfoTab" style="display:none;" ><spring:message code="crm.menu.satisFaction" /><!-- 만족도 조사 설문 --></li>

                    <li id="custCareInfoTab" style="display:none;" ><spring:message code="crm.title.custCareInfo" /><!-- 고객케어 상세정보 --></li>

                    <li id="custInfoTab"><spring:message code="global.lbl.custInfo" /><!-- 고객정보 --></li>
                    <li id="haveCarTab"><spring:message code="global.lbl.haveCar" /> <!-- 보유차량 --></li>
                    <li id="lbrHistoryTab"><spring:message code="ser.lbl.lbrHistory" /> <!-- 정비이력 --></li>
                </ul>

                <!-- 캠페인 정보 탭 상세 -->
                <div id="campaignInfoTabInfo" style="display:none;" >
                    <section class="group">
                        <div class="table_form">
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
                                            <input id="activeFileDocNo"  name="activeFileDocNo"  type="hidden">
                                            <input id="makCd" name="makCd" value="" disabled="disabled" class="form_input form_readonly" style="width:100%">
                                        </td>
                                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.hostCd" /></span> <!-- 주최 --></th>
                                        <td class="required_area">
                                            <div class="form_float">
                                                <div class="form_left" >
                                                    <input id="hostCd" name="hostCd" value="" class="form_comboBox" />
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
                                            <input id="makNm" name="makNm" value="" disabled="disabled" class="form_input form_readonly" style="width:100%" onKeyUp="txtLimit(this, '500');">
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
                                            <input id="aapCmpNm" name="aapCmpNm" value="" disabled="disabled" class="form_input form_readonly" style="width:100%" onKeyUp="txtLimit(this, '50');">
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
                                        <th scope="row" id="crIsaNmTxt"><spring:message code="ser.lbl.crIsaNm" /><!-- 시행처 --></th>
                                        <td>
                                            <input id="pcDstinCd"  name="pcDstinCd"  type="hidden"><!-- 승상용구분코드 -->
                                            <input id="crIsaNm" name="crIsaNm" value="" class="form_input form_readonly" style="width:100%" onKeyUp="txtLimit(this, '20');">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.detail" /></span><!-- 설명개요 --></th>
                                        <td colspan="5">
                                            <textarea id="makCont" name="makCont" rows="3" cols="" class="form_textarea form_readonly" readonly style="width:100%; height:75px;" onKeyUp="txtLimit(this, '4000');"></textarea>
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
                        </div>
                    </section>
                </div>
                <!-- //캠페인 정보 탭 상세 -->

                <!-- 캠페인 - 화술방안 탭 상세 -->
                <div id="campaignTalkPlanTabInfo" style="display:none;" >
                    <div class="clfix">
                        <section class="left_areaStyle">
                            <%-- <div class="header_area">
                                <h2 class="title_basic"><spring:message code="global.lbl.talkPlan" /></h2><!-- 화술방안 -->
                            </div> --%>
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
                                                <textarea id="talkPlan" name="talkPlan" rows="4" cols="" class="form_textarea form_readonly" readonly style="height:200px;"></textarea>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                        <section class="right_areaStyle">
                            <%-- <div class="header_area">
                                <h2 class="title_basic"><spring:message code="global.lbl.attachedFile" /><!-- 첨부파일 --></h2>
                            </div> --%>
                            <div class="table_grid">
                                <div id="fileGrid">
                                </div>
                            </div>
                        </section>
                    </div>
                </div> <!-- 방안 -->

                <!-- // 캠페인 - 화술방안 탭 상세 -->

                <!-- 만족도 조사 정보 상세 -->
                <div id="satisFactionInfoTabInfo" style="display:none;" >
                    <section class="group">
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
                                        <th scope="row"><spring:message code="crm.lbl.stsfIvstNm" /><!-- 만족도 조사 명 --></th>
                                        <td colspan="5">
                                            <input type="text" id="stsfIvstNm" name="stsfIvstNm" value="" readonly class="form_input form_readonly">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code='crm.lbl.stsfIvstMthCd' /><!-- 만족도 조사 유형 --></th>
                                        <td>
                                            <input type="text" id="stsfIvstMthCd" name="stsfIvstMthCd" value="" readonly class="form_input form_readonly">
                                        </td>
                                        <th scope="row"><spring:message code="crm.lbl.startDt" /><!-- 시작일 --></th>
                                        <td>
                                            <input id="startStftDt" name="startStftDt" readonly class="form_datepicker" style="width:100%" />
                                        </td>
                                        <th scope="row"><spring:message code="crm.lbl.endDt" /><!-- 종료일 --></th>
                                        <td>
                                            <input id="endStftDt" name="endStftDt" readonly class="form_datepicker" style="width:100%" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </section>
                </div>
                <!-- // 만족도 조사 정보 상세 -->

                <!-- 만족도 조사 설문 상세 -->
                <div id="surveyInfoTabInfo" class="mt0" style="display:none;" >
                    <!-- 조회 조건 타이틀 시작 -->
                    <div class="header_area">
                        <div class="btn_right">
                        <dms:access viewId="VIEW-D-11380" hasPermission="${dms:getPermissionMask('READ')}">
                            <button class="btn_s btn_save" id="btnSurveySave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                        </dms:access>
                        </div>
                    </div>
                    <!-- 조회 조건 타이틀 종료 -->

                    <!-- 설문 -->
                    <div>
                        <form id="surveyInfoForm">
                            <input type="hidden" id="seq" name="seq" /><!-- 만족도조사 설문일때 사용 -->
                            <div class="survey">
                                <h2 id="surveyName"></h2>
                                <div id="survey_content" class="survey_content" style="overflow-y:auto;height:auto;">
                                    <ul>

                                    </ul>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- //설문 -->
                </div>
                <!-- // 만족도 조사 설문 상세 -->

                <!-- 고객케어 상세정보 탭 상세 -->
                <div id="custCareInfoTabInfo" style="display:none;" >
                    <section class="group">
                        <div class="table_form">
                            <table>
                                <caption></caption>
                                <colgroup>
                                    <col style="width:9%;">
                                    <col style="width:39%;">
                                    <col style="width:10%;">
                                    <col style="width:42%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><spring:message code="crm.lbl.custCareNm" /><!-- 고객케어명 --></th>
                                        <td colspan="3">
                                            <input type="text" id="custCareNm" name="custCareNm" value="" readonly class="form_input form_readonly">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><spring:message code="crm.lbl.custCareCont" /><!-- 고객케어내용 --></th>
                                        <td colspan="3">
                                            <textarea rows="12" cols="" id="custCareCont" name="custCareCont" readonly class="form_textarea form_readonly" style="height:188px;"></textarea>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </section>
                </div>
                <!-- // 고객케어 상세정보 탭 상세 -->

                <!-- 고객정보 탭 상세 -->
                <div id="custInfoTabInfo" class="mt0">

                    <section class="group">
                        <div class="header_area">
                        </div>
                        <div id="personalDiv">
                            <div class="table_form form_width_100per">
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
                                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></span></th>
                                            <td>
                                                <input id="custNmSearch" name="custNmSearch" type="text" value="" class="form_input form_readonly" readOnly maxlength="30" /> <!--  onKey_down -->
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.custTp" /><!-- 고객유형 --></th>
                                            <td>
                                                <input id="custTp" name="custTp" class="form_comboBox" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.custNo" /><!-- 고객번호 --></th>
                                            <td class="readonly_area">
                                                <input id="custNoPopup" name="custNoPopup" type="text" class="form_input form_readonly"  readonly data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.custCd" /><!-- 잠재/보유고객 --></th>
                                            <td class="readonly_area">
                                                <input id="custCd" name="custCd" class="form_comboBox form_readonly " readOnly data-json-obj="true" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.sex" /><!-- 성별 --></th>
                                            <td>
                                                <input id="sexCd" name="sexCd"  class="form_comboBox" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><span class="custCdReq"><spring:message code="global.lbl.mathDocTp" /><!-- 증서유형 --></span></th>
                                            <td>
                                                <input id="mathDocTp" name="mathDocTp" class="form_comboBox"  data-json-obj="true" />
                                            </td>
                                            <th scope="row"><span class="custCdReq"><spring:message code="global.lbl.ssnCrnNo" /></span><!-- 증서번호  --></th>
                                            <td>
                                                <input id="ssnCrnNo" name="ssnCrnNo" type="text" value="" class="form_input form_readonly" readOnly maxlength="30" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code="crm.lbl.scId" /><!-- 판매고문 --></th>
                                            <td class="readonly_area">
                                                <input id="mngScNm" name="mngScNm" type="text" value="" class="form_input"  readonly />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="table_form form_width_100per mt5">
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
                                            <th scope="row"><input type="radio" checked name="prefCommMthCdRadio" value="01" ><span class="bu_required"><spring:message code="global.lbl.hpNo" /><!-- 이동전화 --></span></th>
                                            <td>
                                                <input id="hpNoPopup" name="hpNoPopup" type="text" class="form_input numberic getCustDupByKey form_readonly" readOnly data-type="mobile" pattern="\d" maxlength="11" data-json-obj="true" />
                                            </td>
                                            <td colspan="3">
                                                <label class="label_check ml5"><input id="hpNoInvldYn" name="hpNoInvldYn" type="checkbox" class="form_check" onclick="return false;" unchecked readOnly disabled data-json-obj="true" /> <spring:message code="global.lbl.hpNoInvld" /><!-- 법인 검증 무효 --></label>&nbsp;&nbsp;&nbsp;
                                                <label class="label_check ml5"><input id="hpNoAddImposYn" name="hpNoAddImposYn" type="checkbox" class="form_check" unchecked disabled data-json-obj="true" /> <spring:message code="global.lbl.hpNoAddImpos" /><!-- 딜러 갱신 불가 --></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><input type="radio" name="prefCommMthCdRadio" value="02" ><spring:message code="global.lbl.homeTelNo" /><!-- 고정(유선)전화 --></th>
                                            <td>
                                                <input id="telNo" name="telNo" type="text" value="" class="form_input numberic form_readonly" readOnly data-type="tel" maxlength="20" data-json-obj="true" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.emailNm" /><!-- 이메일 --></th>
                                            <td colspan="3">
                                                <input type="email" id="emailNm" name="emailNm" class="form_input form_readonly" readOnly maxlength="40" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.wechatId" /><!-- wechat id --></th>
                                            <td>
                                                <input id="wechatId" name="wechatId" type="text" value="" class="form_input form_readonly" readOnly maxlength="20" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.qq" /><!-- QQ --></th>
                                            <td>
                                                <input id="qqId" name="qqId" type="text" value="" class="form_input numberic form_readonly" readOnly maxlength="30" data-json-obj="true" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="table_form form_width_100per mt5">
                                <table>
                                    <colgroup>
                                        <col style="width:10%;">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row"><spring:message code='global.lbl.rejectRecv' /></th> <!-- 수신거부  -->
                                            <td>
                                                <label class="label_check ml5"><input id="smsReceiveYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code="global.lbl.sms" /></label>&nbsp;&nbsp;&nbsp;
                                                <label class="label_check ml5"><input id="hpNoReceiveYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code="global.lbl.hpNo" /></label>&nbsp;&nbsp;&nbsp;
                                                <label class="label_check ml5"><input id="telReceiveYn" name="telReceiveYn" type="checkbox" class="form_check" unchecked data-json-obj="true" /> <spring:message code="global.lbl.homeTelNo" /></label>&nbsp;&nbsp;&nbsp;
                                                <label class="label_check ml5"><input id="emailReceiveYn" name="emailReceiveYn" type="checkbox" class="form_check" unchecked readOnly data-json-obj="true" /> <spring:message code='global.lbl.email' /></label>&nbsp;&nbsp;&nbsp;
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div> <!-- PersonalDiv End-->
                        <div id="corporateDiv"  style="display:none"> <!-- corporateDiv Start -->
                            <div class="table_form form_width_100per">
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
                                            <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.corporation" /><!-- 회사명 --></span></th>
                                            <td>
                                                <input id="custNmSearchC" name="custNmSearchC" type="text" value="" class="form_input form_readonly" readOnly />
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.custTp" /><!-- 고객유형 --></th>
                                            <td>
                                                <input id="custTpC" name="custTpC" class="form_comboBox" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.custNo" /><!-- 고객번호 --></th>
                                            <td class="required_area">
                                                <input id="custNoC" name="custNoC" type="text" value="" class="form_input form_readonly" readonly data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.custCd" /><!-- 잠재/보유고객 --></th>
                                            <td class="readonly_area">
                                                <input id="custCdC" name="custCdC" class="form_comboBox form_readonly " readOnly data-json-obj="true" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="table_form form_width_100per mt5">
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
                                            <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.corpPurcMng" /><!-- 구매담당자명 --></span></th>
                                            <td>
                                                <input id="purcMngNm" name="purcMngNm" type="text" value="" class="form_input form_readonly" readOnly maxlength="30" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><span class="custCdReq"><spring:message code="global.lbl.mathDocTp" /><!-- 증서유형 --></span></th>
                                            <td>
                                                <input id="mathDocTpC" name="mathDocTpC" class="form_comboBox"  data-json-obj="true" />
                                            </td>
                                            <th scope="row"><span class="custCdReq"><spring:message code="global.lbl.ssnCrnNo" /><!-- 증서번호 --></span></th>
                                            <td>
                                                <input id="ssnCrnNoC" name="ssnCrnNoC" type="text" value="" class="form_input form_readonly" readOnly maxlength="30" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code="sal.lbl.salesAdvisor" /><!-- 판매고문 --></th>
                                            <td class="readonly_area">
                                                <input id="mngScNmC" name="mngScNmC" type="text" value="" class="form_input"  readonly />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="crm.lbl.custSourceLocation" /><!-- 고객출처 --></th>
                                            <td>
                                                <input id="custHoldTpC" name="custHoldTpC" class="form_comboBox" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code="crm.lbl.taxpayerNo" /><!-- 납세인식별번호 --></th>
                                            <td>
                                                <input id="taxpayerNo" name="taxpayerNo" class="form_input form_readonly" readOnly maxlength="40" data-json-obj="true" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="table_form form_width_100per mt5">
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
                                            <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.corpPurcMngHpno" /><!-- 이동전화 --></span></th>
                                            <td>
                                                <input id="hpNoC" name="hpNoC" type="text" class="form_input numberic getCustDupByKey form_readonly" readOnly data-type="mobile" pattern="\d" maxlength="11" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.officeTelNo" /><!-- 유선전화 --></th>
                                            <td>
                                                <input id="officeTelNoC" name="officeTelNoC" type="text" value="" class="form_input form_readonly" readOnly data-type="tel" maxlength="30" pattern="\d" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.fax" /><!-- FAX --></th>
                                            <td>
                                                <input id="officeFaxNoC" name="officeFaxNoC" type="text" value="" class="form_input numberic form_readonly" readOnly data-type="tel" maxlength="20" pattern="\d" data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.emailNm" /><!-- 이메일 --></th>
                                            <td>
                                                <input id="emailNmC" name="emailNmC" type="email" value="" class="form_input form_email form_readonly" readOnly maxlength="40" data-json-obj="true" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.bizCondition" /><!-- 업종 --></th>
                                            <td>
                                              <input id="bizcondCdC" name="bizcondCdC" class="form_comboBox"  data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.cmpScale" /><!-- 회사규모 --></th>
                                            <td>
                                              <input id="cmpScaleContC" name="cmpScaleContC" class="form_input form_readonly" readOnly data-json-obj="true" />
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.cmpTp" /><!-- 회사유형 --></th>
                                            <td>
                                              <input id="cmpTpC" name="cmpTpC" class="form_comboBox"  data-json-obj="true" />
                                            </td>
                                            <th></th>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="global.lbl.group" /></th> <!-- 그룹 -->
                                            <td colspan="3">
                                              <select id="custGroupsC" name="custGroupsC" multiple="multiple" class="form_comboBox form_readonly" ></select>
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.tag" /></th> <!-- 태그  -->
                                            <td colspan="3">
                                              <select id="custTagsC" name="custTagsC" multiple="multiple" class="form_comboBox form_readonly" ></select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>  <!-- corporateDiv End -->

                        <!-- 주소정보 시작 -->
                        <div class="table_form form_width_100per mt5">
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
                                        <th scope="row"><spring:message code="crm.lbl.addrNm" /><!-- 주소 --></th>
                                        <td colspan="6">
                                            <input id="addrFull" name="addrFull" class="form_input form_readonly" readOnly />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- 주소정보 종료 -->
                    </section>  <!-- customerForm 마침 -->

                </div>
                <!-- // 고객정보 탭 상세 정료 -->

                <!-- 보유차량 탭 상세 -->
                <div id="haveCarTabInfo" class="mt0">
                    <section class="group">
                        <div class="header_area">
                        </div>
                        <div class="table_grid">
                            <div id="haveCarGrid" class="grid"></div>
                        </div>
                    </section>
                </div>
                <!-- // 보유차량 탭 상세 -->

                <!-- 정비이력 탭 상세 -->
                <div id="lbrHistoryTabInfo" class="mt0">
                    <section class="group">
                        <div class="header_area">
                        </div>
                        <div class="table_grid">
                            <div id="lbrGrid" class="grid"></div>
                        </div>
                    </section>
                </div>
                <!-- // 정비이력 탭 상세 -->

            </div>
            <!-- // 하단탭 종료 -->
        </section>
        <!-- //콜센터실행-->


<!--  ************************** nextChkDiv **************************** -->
        <section id="nextChkDiv" class="pop_wrap"> <!-- nextChkDiv Start -->
            <div class="header_area">
                <div class="btn_right">
                    <button type="button" id="btnNextSubmit" class="btn_m"><spring:message code="crm.btn.submit" /><!-- 제출 --></button>
                </div>
            </div>
            <div>
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:40%;">
                            <col style="width:60%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.visitAppointDt" /></th> <!-- //  방문예약시간  ??到店?? -->
                                <td colspan="2">
                                    <input id="vsitResvDt" name="vsitResvDt" class="form_datetimepicker" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.prsn' /></th> <!-- 담당자 -->
                                <td colspan="2">
                                    <input id="usersRoleCrmR03" name="usersRoleCrmR03" type="text" class="form_comboBox" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
<!--  ************************** nextChkDiv **************************** -->

        <!--  ************************** 녹취파일 팝업 **************************** -->
        <section id="vocRecFilePopup" class="pop_wrap">
            <div class="header_area">
                <audio id="audioPlayer" controls style="width:100%;" ></audio>
            </div>
        </section>
        <!--  ************************** 녹취파일 팝업 **************************** -->

    <script>

        var options = parent.callcenterPopupWindow.options.content.data
        ,callSeq = options.callSeq
        ,bizCd = options.bizCd
        ,popupWindow
        ,obCallPopupWindow
        ;

        // 폼 초기화 시작
        function initForm(){

            // 고객정보 탭 form 초기화 시작
            $("#custNmSearch").val("");
            $("#custTp").data("kendoExtDropDownList").value("");
            $("#custNoPopup").val("");
            $("#custCd").data("kendoExtDropDownList").value("");
            $("#sexCd").data("kendoExtDropDownList").value("");
            $("#mathDocTp").data("kendoExtDropDownList").value("");
            $("#ssnCrnNo").val("");
            $("#mngScNm").val("");
            $("input:radio[name=prefCommMthCdRadio]").prop("checked",true);
            $("#hpNoPopup").val("");
            $("#telNo").val("");
            $("#emailNm").val("");
            $("#wechatId").val("");
            $("#qqId").val("");
            $("#addrFull").val("");
            $("#hpNoInvldYn").prop("checked", false);
            $("#hpNoAddImposYn").prop("checked", false);
            $("#smsReceiveYn").prop("checked", false);
            $("#hpNoReceiveYn").prop("checked", false);
            $("#telReceiveYn").prop("checked", false);
            $("#emailReceiveYn").prop("checked", false);
            $("#custNmSearchC").val("");
            $("#custTpC").data("kendoExtDropDownList").value("");
            $("#custNoC").val("");
            $("#custCdC").data("kendoExtDropDownList").value("");
            $("#purcMngNm").val("");
            $("#mathDocTpC").data("kendoExtDropDownList").value("");
            $("#ssnCrnNoC").val("");
            $("#mngScNmC").val("");
            $("#custHoldTpC").data("kendoExtDropDownList").value("");
            $("#taxpayerNo").val("");
            $("#hpNoC").val("");
            $("#officeTelNoC").val("");
            $("#officeFaxNoC").val("");
            $("#emailNmC").val("");
            $("#bizcondCdC").data("kendoExtDropDownList").value("");
            $("#cmpScaleContC").val("");
            $("#cmpTpC").data("kendoExtDropDownList").value("");
            $("input:radio[name=prefCommMthCdRadio]").prop("disabled", true);
            $("#hpNoInvldYn").prop("disabled", true);
            $("#hpNoAddImposYn").prop("disabled", true);
            $("#smsReceiveYn").prop("disabled", true);
            $("#hpNoReceiveYn").prop("disabled", true);
            $("#telReceiveYn").prop("disabled", true);
            $("#emailReceiveYn").prop("disabled", true);
            // 고객정보 탭 form 초기화 종료

            // 내방예약  버튼 및 추가정보 팝업
            $("#btnCtlNextStepBefore").addClass("hidden");
            $("#vsitResvDt").data("kendoExtMaskedDateTimePicker").value("");
            $("#usersRoleCrmR03").data("kendoExtDropDownList").value();  // 책임자

            // CALL 정보
            $("#callSeq").val("");
            $("#callHisSeq").val("");
            $("#bizCd").val("");
            $("#refTableNm").val("");
            $("#refKeyNm").val("");
            $("#custNo").val("");
            $("#custNm").val("");
            $("#hpNo").data("kendoMaskedTextBox").value("");
            $("#callCnt").val("");
            $("#callPrsnId").val("");
            $("#callRsltCd").data("kendoExtDropDownList").enable(true);
            $("#callRsltCd").data("kendoExtDropDownList").value("");
            $("#scheCallDt").data("kendoExtMaskedDateTimePicker").enable(true);
            $("#scheCallDt").data("kendoExtMaskedDateTimePicker").value("");
            $("#callStartDt").data("kendoExtMaskedDateTimePicker").enable(true);
            $("#callStartDt").data("kendoExtMaskedDateTimePicker").value("");
            $("#callEndDt").data("kendoExtMaskedDateTimePicker").enable(true);
            $("#callEndDt").data("kendoExtMaskedDateTimePicker").value("");
            $("#callCont").val("").attr("disabled", false).removeClass('form_readonly');
            $("#recFileId").val("");
            $("#callDialNum").val("");
            //$("#callVsitResvDt").data("kendoExtMaskedDateTimePicker").enable(false);
            $("#callVsitResvDt").data("kendoExtMaskedDateTimePicker").value("");
            $("#callProcEndYn:checkbox").prop("disabled", false).prop("checked",false);

            // 캠페인
            $("#dlrCd").val("");
            $("#pltCd").val("");
            $("#delYn").val("");
            $("#crNo").val("");
            $("#makCd").val("");
            $("#hostCd").data("kendoExtDropDownList").value("");
            $("#makTpCd").data("kendoExtDropDownList").value("");
            $("#makSubTpCd").data("kendoExtDropDownList").value("");
            $("#makNm").val("");
            $("#startDt").data("kendoExtMaskedDatePicker").value("");
            $("#endDt").data("kendoExtMaskedDatePicker").value("");
            $("#prid").val("");
            $("#placeNm").val("");
            $("#rcpeAutoYn").val("");
            $("#aapCmpNm").val("");
            $("#budgetAmt").data("kendoExtNumericTextBox").value("");
            $("#statCd").data("kendoExtDropDownList").value("");
            $("#targCustCnt").data("kendoExtNumericTextBox").value("");

            //serviceInfo1
            $("#creStartDt").data("kendoExtMaskedDatePicker").value("");
            $("#creEndDt").data("kendoExtMaskedDatePicker").value("");
            $("#crEndTp").data("kendoExtDropDownList").value("");

            //serviceInfo2
            $("#saleStartDt").data("kendoExtMaskedDatePicker").value("");
            $("#saleEndDt").data("kendoExtMaskedDatePicker").value("");
            $("#pcDstinCd").val("");
            $("#crIsaNm").val("");
            $("#fileList").empty();

            // 만족도 조사
            $("#stsfIvstNm").val("");
            $("#stsfIvstMthCd").val("");
            $("#startStftDt").data("kendoExtMaskedDatePicker").value("");
            $("#endStftDt").data("kendoExtMaskedDatePicker").value("");
            $("#seq").val("");

            // 고객케어
            $("#custCareNm").val("");
            $("#custCareCont").val("");

        };
        // 폼 초기화 종료

        // 현재시간 가져오기
        function getSysdate(){

            var setSysdate = "";

            $.ajax({
                url:"<c:url value='/crm/cmm/selectSysDate.do' />",
                type:'POST',
                async:false,
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(jqXHR, textStatus) {
                    setSysdate = jqXHR;
                }
            });

            return setSysdate;

        }

        $("#callStartDt").dblclick(function(){
            $("#callStartDt").data("kendoExtMaskedDateTimePicker").value(getSysdate());
        });

        $("#callEndDt").dblclick(function(){
            $("#callEndDt").data("kendoExtMaskedDateTimePicker").value(getSysdate());
        });

        /******************************************************
        * 고객정보 탭 (스크립트1)- 시작
        *****************************************************/
        var custTpList = [];
        var custCdList = [];
        var mathDocTpList = [];
        var mathDocTpListC = [];
        var sexCdList = [];
        var custHoldTpList = [];
        var bizcondCdList = [];
        var cmpTpList = [];
        var groupDS = [];
        var custGroupsC = [];
        var defaultGroups = [];
        var custTagsC = [];
        var tagDS = [];

        <c:forEach var="obj" items="${custTpList}">
            custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        <c:forEach var="obj" items="${custCdList}">
            custCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

     <c:forEach var="obj" items="${mathDocTpList}">
         <c:if test="${obj.remark1 == 'P'}">
             mathDocTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         </c:if>

         <c:if test="${obj.remark1 == 'C'}">
             mathDocTpListC.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         </c:if>
     </c:forEach>

        <c:forEach var="obj" items="${sexCdList}">
            sexCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        <c:forEach var="obj" items="${custHoldTpList}">
            custHoldTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        <c:forEach var="obj" items="${bizcondCdList}">
            bizcondCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        <c:forEach var="obj" items="${cmpTpList}">
            cmpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        <c:forEach var="obj" items="${custGroups}">
            custGroupsC.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
        </c:forEach>
        var defaultGroupCDatasourceSetting = function(e){
            groupDS = [];
            var selectedGroups = $("#custGroupsC").data("kendoMultiSelect").value();

            if(selectedGroups.length == 0){
                return;
            }

            $.each(custGroupsC, function(index, data){
                if(selectedGroups.indexOf(data.grpSeq) > -1){
                    defaultGroups.push(data);
                    groupDS.push({"grpSeq":data.grpSeq,"grpTp":"001"});
                }
            });
        };

        <c:forEach var="obj" items="${custTags}">
            custTagsC.push({"grpSeq":"${obj.grpSeq}", "grpNm":"${obj.grpNm}"});
        </c:forEach>
        var defaultTagCDatasourceSetting = function(e){
            tagDS = [];
            var selectedTags = $("#custTagsC").data("kendoMultiSelect").value();

            if(selectedTags.length == 0){
                return;
            }

            $.each(custTagsC, function(index, data){
                if(selectedTags.indexOf(data.grpSeq) > -1){
                    tagDS.push({"grpSeq":data.grpSeq,"grpTp":"002"});
                }
            });
        };
        /******************************************************
        * 고객정보 탭 (스크립트1)- 끝
        ******************************************************/

        $("#mainTab").kendoExtTabStrip({
            animation:false
            , select:function(e) {

                var selectTabId = e.item.id;

                //메시지이력
                if (selectTabId === "smsHisTab") {

                    if ( dms.string.isEmpty($("#callSeq").val()) ){
                        // {콜번호}을(를) 선택해주세요.
                        dms.notification.warning("<spring:message code='crm.lbl.callSeq' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                        return;
                    }

                    if ( dms.string.isEmpty($("#custNo").val()) ){
                        // {고객번호}을(를) 선택해주세요.
                        dms.notification.warning("<spring:message code='global.lbl.custNo' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                        return;
                    }

                    $("#msgHistoryGrid").data("kendoExtGrid").dataSource.page(1);

                //OB이력
                } else if (selectTabId === "callHisTab") {

                    if ( dms.string.isEmpty($("#callSeq").val()) ){
                        // {콜번호}을(를) 선택해주세요.
                        dms.notification.warning("<spring:message code='crm.lbl.callSeq' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                        return;
                    }

                    $("#callHisGrid").data("kendoExtGrid").dataSource.page(1);

                };

            }
        });
        var mainTabStrip = $("#mainTab").data("kendoExtTabStrip");
        mainTabStrip.select(0);

        $("#subTab").kendoExtTabStrip({
            animation:false
            , select:function(e) {

                var selectTabId = e.item.id;

                //console.log("selectTabId :::",selectTabId)

                //고객정보
                if (selectTabId === "custInfoTab") {

                    // 고객정보 탭 상세 조회 시작
                    var custNo = $("#custNo").val();
                    if ( dms.string.isEmpty(custNo) ){
                        dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                        return false;
                    }

                    // form 데이터
                    var param = {};
                    param["sCustNo"] = custNo; // $("#custNo").val();
                    param["sSearchRange"] = "MY";

                    $.ajax({
                        url:"<c:url value='/crm/cif/customerInfo/customerSearch.do' />"
                        ,data:JSON.stringify(param)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,beforeSend:function(xhr){
                            dms.loading.show();
                        }
                        ,error:function(jqXHR,status,error){
                            dms.notification.warning(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        , success:function(result){

                            if (result.custInfoDS.length != 0 ){

                                $("#custNmSearch").val(result.custInfoDS[0].custNm);
                                $("#custTp").data("kendoExtDropDownList").value(result.custInfoDS[0].custTp);
                                $("#custNoPopup").val(result.custInfoDS[0].custNo);
                                $("#custCd").data("kendoExtDropDownList").value(result.custInfoDS[0].custCd);
                                $("#sexCd").data("kendoExtDropDownList").value(result.custInfoDS[0].sexCd);
                                $("#mathDocTp").data("kendoExtDropDownList").value(result.custInfoDS[0].mathDocTp);
                                $("#ssnCrnNo").val(result.custInfoDS[0].ssnCrnNo);
                                $("#mngScNm").val(result.custInfoDS[0].mngScNm);
                                $("input:radio[name=prefCommMthCdRadio][value='"+result.custInfoDS[0].prefCommMthCd+"']").prop("checked",true);

                                $("#hpNoPopup").val(result.custInfoDS[0].hpNo);
                                $("#telNo").val(result.custInfoDS[0].telNo);
                                $("#emailNm").val(result.custInfoDS[0].emailNm);
                                $("#wechatId").val(result.custInfoDS[0].wechatId);
                                $("#qqId").val(result.custInfoDS[0].qqId);

                                $("#addrFull").val(result.custInfoDS[0].addrFull);

                                // CheckBox
                                var hpNoInvldYn = result.custInfoDS[0].hpNoInvldYn;
                                var hpNoAddImposYn = result.custInfoDS[0].hpNoAddImposYn;
                                var smsReceiveYn = result.custInfoDS[0].smsReceiveYn;
                                var hpNoReceiveYn = result.custInfoDS[0].hpNoReceiveYn;
                                var telReceiveYn = result.custInfoDS[0].telReceiveYn;
                                var emailReceiveYn = result.custInfoDS[0].emailReceiveYn;

                                if (hpNoInvldYn == 'Y') {
                                    $("#hpNoInvldYn").prop("checked", true);
                                };
                                if (hpNoAddImposYn == 'Y'){ $("#hpNoAddImposYn").prop("checked", true) };

                                if (smsReceiveYn == 'Y'){ $("#smsReceiveYn").prop("checked", true) };
                                if (hpNoReceiveYn == 'Y'){ $("#hpNoReceiveYn").prop("checked", true) };
                                if (telReceiveYn == 'Y'){ $("#telReceiveYn").prop("checked", true) };
                                if (emailReceiveYn == 'Y'){ $("#emailReceiveYn").prop("checked", true) };

                                // 법인 Div Set
                                var custTpVal = result.custInfoDS[0].custTp;

                                if (custTpVal == '02') {

                                    $("#custNmSearchC").val(result.custInfoDS[0].custNm);
                                    $("#custTpC").data("kendoExtDropDownList").value(result.custInfoDS[0].custTp);
                                    $("#custNoC").val(result.custInfoDS[0].custNo);
                                    $("#custCdC").data("kendoExtDropDownList").value(result.custInfoDS[0].custCd);
                                    $("#purcMngNm").val(result.custInfoDS[0].purcMngNm);
                                    $("#mathDocTpC").data("kendoExtDropDownList").value(result.custInfoDS[0].mathDocTp);
                                    $("#ssnCrnNoC").val(result.custInfoDS[0].ssnCrnNo);
                                    $("#mngScNmC").val(result.custInfoDS[0].mngScNm);
                                    $("#custHoldTpC").data("kendoExtDropDownList").value(result.custInfoDS[0].custHoldTp);

                                    $("#taxpayerNo").val(result.custInfoDS[0].taxpayerNo);
                                    $("#hpNoC").val(result.custInfoDS[0].hpNo);
                                    $("#officeTelNoC").val(result.custInfoDS[0].officeTelNo);
                                    $("#officeFaxNoC").val(result.custInfoDS[0].officeFaxNo);
                                    $("#emailNmC").val(result.custInfoDS[0].emailNm);
                                    $("#bizcondCdC").data("kendoExtDropDownList").value(result.custInfoDS[0].bizcondCd);
                                    $("#cmpScaleContC").val(result.custInfoDS[0].cmpScaleCont);
                                    $("#cmpTpC").data("kendoExtDropDownList").value(result.custInfoDS[0].cmpTp);

                                    $("#personalDiv").hide();
                                    $("#corporateDiv").show();

                                } else {
                                    $("#personalDiv").show();
                                    $("#corporateDiv").hide();
                                };

                            }

                            if (result.groupDS.length != 0 ){
                                groupSeq = "";
                                var groupDsItem;
                                for(i=0 ;  i < result.groupDS.length ; i++){
                                    groupDsItem = result.groupDS[i];
                                    if (i==0){
                                        groupSeq = groupDsItem.grpSeq;
                                    }else{
                                        groupSeq = groupSeq+","+groupDsItem.grpSeq;
                                    }
                                }
                                if (result.custInfoDS[0].custTp == '01') {

                                } else {
                                    if (result.groupDS.length == 1) {
                                        $("#custGroupsC").data("kendoMultiSelect").value(groupSeq);
                                    } else {
                                        $("#custGroupsC").data("kendoMultiSelect").value(groupSeq.split(","));
                                    }
                                    defaultGroupCDatasourceSetting();
                                }
                            }

                            if (result.tagDS.length != 0 ){
                                tagSeq = "";
                                var tagDsItem;
                                for(i=0 ;  i < result.tagDS.length ; i++){
                                    tagDsItem = result.tagDS[i];
                                    if (i==0){
                                        tagSeq = tagDsItem.grpSeq;
                                    }else{
                                        tagSeq = tagSeq+","+tagDsItem.grpSeq;
                                    }
                                }

                                if (result.custInfoDS[0].custTp == '01') {

                                } else {
                                    if (result.tagDS.length == 1) {
                                        $("#custTagsC").data("kendoMultiSelect").value(tagSeq);
                                    } else {
                                        $("#custTagsC").data("kendoMultiSelect").value(tagSeq.split(","));
                                    }
                                    defaultTagCDatasourceSetting();
                                }
                            }

                        }
                        ,complete:function(xhr, status) {
                            dms.loading.hide();
                        }
                    }).done(function(result) {

                    });
                    // 고객정보 탭 상세 조회 종료

                //보유차량
                } else if (selectTabId === "haveCarTab") {

                    if ( dms.string.isEmpty($("#custNo").val())){
                        dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                        $("#custNo").focus();
                        return false;
                    } else {

                        $("#haveCarGrid").data("kendoExtGrid").dataSource.page(1);

                    };

                //정비이력
                } else if (selectTabId === "lbrHistoryTab") {

                    if ( dms.string.isEmpty($("#custNo").val())){
                        dms.notification.warning("<spring:message code='global.lbl.custNo' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                        $("#custNo").focus();
                        return false;
                    } else {

                        $("#lbrGrid").data("kendoExtGrid").dataSource.page(1);
                    }

                };

            }
        });
        var subTabStrip = $("#subTab").data("kendoExtTabStrip");
        subTabStrip.select(0);

        // 업무코드에 따른 tab show/hide
        function subTabView(bizCd) {

            var subTabStrip =  $("#subTab").data("kendoExtTabStrip");

            $("#campaignInfoTab").css("display","none");
            $("#campaignTalkPlanTab").css("display","none");
            $("#satisFactionInfoTab").css("display","none");
            $("#surveyInfoTab").css("display","none");
            $("#custCareInfoTab").css("display","none");

            $("#stsfCallTitleArea").text("");

            // 05:만족도 / 06:캠페인 / 09:고객케어
            var bizCd = bizCd;
            if ( bizCd == "05" ) {

                $("#stsfCallTitleArea").text("<spring:message code='crm.lbl.stsfIvstDt' />");

                $("#satisFactionInfoTab").css("display","inline-block");
                $("#surveyInfoTab").css("display","inline-block");
                subTabStrip.select(2);

            }else if ( bizCd == "06" ) {

                $("#stsfCallTitleArea").text("<spring:message code='crm.lbl.callVsitResvDt' />");

                $("#campaignInfoTab").css("display","inline-block");
                $("#campaignTalkPlanTab").css("display","inline-block");
                subTabStrip.select(0);

            } else if ( bizCd == "09" ) {

                $("#stsfCallTitleArea").text("<spring:message code='crm.lbl.callVsitResvDt' />");

                $("#vsitDtArea1").css("display","inline-block");
                $("#vsitDtArea2").css("display","inline-block");

                $("#custCareInfoTab").css("display","inline-block");
                subTabStrip.select(4);

            };

        };

        // 첨부파일 다운로드
        function recFileDown() {

            var dlrCd
              , recFileId
              , callHisSeq
            ;

            var grid = $('#callHisGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());

            if ( selectedItem !== null ) {
                recFileId = selectedItem.recFileId;
                callHisSeq = selectedItem.callHisSeq;
                dlrCd = selectedItem.dlrCd;
            };

            if (  dms.string.isNotEmpty(recFileId) ) {

                if (  callHisSeq <= 0  ) {
                    // {콜센터이력일련번호}을(를) 확인하여 주세요.
                    dms.notification.warning("<spring:message code='crm.lbl.callHisSeq' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
                    return;
                };

                $("#audioPlayer").attr("src", "<c:url value='/crm/cal/callCenter/selectRecordFileDownload.do' />?callHisSeq="+callHisSeq+"&dlrCd="+dlrCd);
                var win = $("#vocRecFilePopup").data("kendoWindow");
                win.center();
                win.open();

                // 오디오 팝업에서 x버튼을 눌렸을때 오디오 재생 종료
                $("#vocRecFilePopup").parent().find(".k-window-actions").on("   click", function(){
                    $("#audioPlayer")[0].pause();
                    $("#audioPlayer")[0].currentTime = 0;
                });

            } else {
                return;
            };

        };

        // 콜결과 DS
        var callRsltCdDs = [];
        <c:forEach var="obj" items="${callRsltCdList}">
            callRsltCdDs.push({"text":"${obj.cmmCdNm}", "value":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
        </c:forEach>

        // 만족도 조사 유형
        var stsfIvstMthCdArr = [];
        <c:forEach var="obj" items="${stsfIvstMthCdList}">
            stsfIvstMthCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>
        stsfIvstMthCdArrVal = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = stsfIvstMthCdArr[val];
            }
            return returnVal;
        };

        // 담당자
        var usersRoleCrmR03 = [];
        <c:forEach var="obj" items="${usersRoleCrmR03}">
            usersRoleCrmR03.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
        </c:forEach>

        /******************************************************
        * 보유차량 그리드 (DataSource)- 시작
        ******************************************************/
        // 보유차량 - 브랜드
        var purcCarBrandCdMap       = [];
        <c:forEach var="obj" items="${purcCarBrandCdDS}">
            purcCarBrandCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>
        /******************************************************
        * 보유차량 그리드 (DataSource)- 종료
        ******************************************************/

        /**
         * hyperlink in grid event
         */
        $(document).on("click", ".linkVin", function(e){
            var grid = $("#haveCarGrid").data("kendoExtGrid"),
            row = $(e.target).closest("tr");
            var dataItem = grid.dataItem(row);
            parent.window.parent._createOrReloadTabMenu("<spring:message code='sal.menu.vehicleMasterMgmt' />", "<c:url value='/sal/veh/vehicleMaster/selectVehicleMasterMain.do' />?sSerFg=Y&sVinNo="+dataItem.vinNo, "VIEW-D-10396"); // vinNo
        });

        // 부모창에서 호출
        function fn_custVinSearchRlt(data) {

            if (data.length >= 1) {
                var vinNo = data[0].vinNo;
                if ( dms.string.isNotEmpty(vinNo) ) {
                    parent.window.parent._createOrReloadTabMenu("<spring:message code='ser.menu.reserCreate' />", "<c:url value='/ser/rev/reservationReceipt/selectReservationReceiptMain.do' />?sVinNo="+vinNo, "VIEW-D-10332");
                };
            };

        };

        var ncarDstinCdMap = [];
        <c:forEach var="obj" items="${ncarDstinCdList}">
            ncarDstinCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        $(document).ready(function() {

            // ************************** 녹취파일 팝업 ****************************
            $("#vocRecFilePopup").kendoWindow({
                animation:false
                ,draggable:true
                ,modal:false
                ,resizable:false
                ,visible:false
                ,title:"<spring:message code='crm.lbl.recFileId' />"      //녹취파일
                ,width:"900px"
                ,height:"50px"
            }).data("kendoWindow");
            // ************************** 녹취파일 팝업 ****************************

            /********************************************* 탭 설정 시작 */
            $("#mainTab").kendoExtTabStrip({
                animation:false
            });
            $("#subTab").kendoExtTabStrip({
                animation:false
            });
            /********************************************* 탭 설정 종료 */

            /********************************************* CALL 정보 시작 */
            // 이동전화
            $("#hpNo").kendoMaskedTextBox({
                mask:"00000000000000"
                , promptChar:" "
            });
            // 콜결과
            $("#callRsltCd").kendoExtDropDownList({
                dataSource:dms.data.cmmCdFilter(callRsltCdDs)
                , dataTextField:"text"
                , dataValueField:"value"
                , optionLabel:" "
                , index:0
            });
            // 내방예약일자
            $("#callVsitResvDt").kendoExtMaskedDateTimePicker({
                format:"<dms:configValue code='dateFormat' /> HH:mm"
                ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,minTime:"08:00"
                ,maxTime:"24:00"
            });
            $("#callVsitResvDt").data("kendoExtMaskedDateTimePicker").enable(false);

            // 다음Call시간
            $("#scheCallDt").kendoExtMaskedDateTimePicker({
                format:"<dms:configValue code='dateFormat' /> HH:mm"
                ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,minTime:"08:00"
                ,maxTime:"24:00"
                ,interval:1
            });
            // 콜시작일자
            $("#callStartDt").kendoExtMaskedDateTimePicker({
                format:"<dms:configValue code='dateTimeFormat' />"
                ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,minTime:"08:00"
                ,maxTime:"24:00"
                ,interval:1
            });
            // 콜종료일자
            $("#callEndDt").kendoExtMaskedDateTimePicker({
                format:"<dms:configValue code='dateTimeFormat' />"
                ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,minTime:"08:00"
                ,maxTime:"24:00"
                ,interval:1
            });
            /********************************************* CALL 정보 종료 */

            /********************************************* 만족도 조사 정보 시작 */
            // 만족도 조사 시작일
            $("#startStftDt").kendoExtMaskedDatePicker({
                format:"<dms:configValue code='dateFormat' />"
            });
            $("#startStftDt").data("kendoExtMaskedDatePicker").enable(false);
            // 만족도 조사 종료일
            $("#endStftDt").kendoExtMaskedDatePicker({
                format:"<dms:configValue code='dateFormat' />"
            });
            $("#endStftDt").data("kendoExtMaskedDatePicker").enable(false);
            /********************************************* 만족도 조사 정보 종료 */

            /********************************************* 내방예약 팝업 시작 */
            // 내방예약 팝업 호출 버튼
            $("#btnCtlNextStepBefore").kendoButton({
                click:function(e) {

                    $("#vsitResvDt").data("kendoExtMaskedDateTimePicker").value("");
                    $("#usersRoleCrmR03").data("kendoExtDropDownList").value();

                    var custNo = $("#custNo").val();

                    // 고객번호
                    if ( dms.string.isEmpty(custNo) ) {
                        dms.notification.warning("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                        return false;
                    };

                    // div 띄우기
                    var nextChkDiv = $("#nextChkDiv").data("kendoWindow");
                    nextChkDiv.center();
                    nextChkDiv.open();

                 }
            });

            // 방문예약 정보 제출 버튼
            $("#btnNextSubmit").kendoButton({
                click:function(e) {

                    var callPrsnId = $("#callPrsnId").val();        // 콜ID담당자
                    var usersRoleCrmR03 = $("#usersRoleCrmR03").data("kendoExtDropDownList").value();  // 책임자
                    var vsitResvDt = $("#vsitResvDt").data("kendoExtMaskedDateTimePicker").value();
                    var custNo = $("#custNo").val();
                    var bizCd = $("#bizCd").val();
                    var refKeyNm = $("#refKeyNm").val();

                    if ( dms.string.isEmpty($("#callSeq").val()) ){
                        // {콜번호}을(를) 선택해주세요.
                        dms.notification.warning("<spring:message code='crm.lbl.callSeq' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                        return;
                    };

                    if ( dms.string.isEmpty(custNo) ){
                        // {고객번호}을(를) 선택해주세요.
                        dms.notification.warning("<spring:message code='global.lbl.custNo' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                        return;
                    };

                    // 콜ID담당자
                    if ( dms.string.isEmpty(callPrsnId) ) {
                        dms.notification.warning("<spring:message code='crm.lbl.callPrsnId' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                        return false;
                    };

                    // 내방예약시간 여부
                    if ( dms.string.isEmpty(vsitResvDt)) {
                        dms.notification.warning("<spring:message code='crm.lbl.visitAppointDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' /> ");
                        return false;
                    };

                    var saveData ={};

                    saveData.callVsitResvDt = vsitResvDt;
                    saveData.mngScId = usersRoleCrmR03;
                    saveData.custNo = custNo;
                    saveData.bizCd = bizCd;
                    saveData.refKeyNm = refKeyNm;
                    //saveData.makCd = $("#makCd").val();

                    //console.log("내방예약 : ",JSON.stringify(saveData));

                    //return;

                    $.ajax({
                        url:"<c:url value='/crm/cal/callCenter/updateCallCenterVsitResv.do' />"
                        ,data:JSON.stringify(saveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error){
                            //console.log("error !!!");
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            //var nextChkDiv = $("#nextChkDiv").data("kendoWindow");
                            //nextChkDiv.close();
                        },
                        success:function(result){
//                             console.log(result);
//                             console.log("success!!!!");
                            dms.notification.success("<spring:message code='global.info.success'/>");
                            $("#callVsitResvDt").data("kendoExtMaskedDateTimePicker").value(vsitResvDt);
                            var nextChkDiv = $("#nextChkDiv").data("kendoWindow");
                            nextChkDiv.close();

                        }
                        ,beforeSend:function(xhr) {
                            dms.loading.show($("#window"));
                        }
                        ,complete:function(xhr, status) {
                            dms.loading.hide($("#window"));
                        }
                    }).done(function(result) {
                        //console.log("Done!!!!");
                    });


                }
            });

            // 방문예약 팝업 윈도우
            $("#nextChkDiv").kendoWindow({
                 animation:false
                ,draggable:true
                ,modal:false
                ,resizable:false
                ,visible:false
                ,title:"<spring:message code='global.title.addInfo' />"      // 추가정보
                ,width:"300px"
                ,height:"110px"
            }).data("kendoWindow");

            $("#usersRoleCrmR03").kendoExtDropDownList({
                dataTextField:"usrNm"
                , dataValueField:"usrId"
                , optionLabel:" "
                , dataSource:usersRoleCrmR03
                , index:0
                , filter:"contains"
                , filtering:function(e){
                    var filter = e.filter;
                }
            });

            $("#vsitResvDt").kendoExtMaskedDateTimePicker({
                format:"<dms:configValue code='dateFormat' /> HH:mm"
                ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,minTime:"08:00"
                ,maxTime:"24:00"
            });
            /********************************************* 방문예약 팝업 종료 */


            /******************************************************
            * 고객정보 탭 (스크립트2)- 시작
            ******************************************************/
            // 고객유형 드랍다운 리스트.   custTpList    (CRM001)
            $("#custTp").kendoExtDropDownList({
                dataTextField:"cmmCdNm"
                , dataValueField:"cmmCd"
                , dataSource:custTpList
                , index:0
            });
            $("#custTp").data("kendoExtDropDownList").enable(false);

            // 고객유형 드랍다운 리스트.   custTpList    (CRM001)
            $("#custTpC").kendoExtDropDownList({
                dataTextField:"cmmCdNm"
                , dataValueField:"cmmCd"
                , dataSource:custTpList
                , index:0
            });
            $("#custTpC").data("kendoExtDropDownList").enable(false);

            // 잠재/보유고객      custCd              (CRM023)
            $("#custCd").kendoExtDropDownList({
                dataTextField:"cmmCdNm"
                , dataValueField:"cmmCd"
                , dataSource:custCdList
                , index:0
            });
            $("#custCd").data("kendoExtDropDownList").enable(false);

            // 잠재/보유고객      custCdC              (CRM023)
            $("#custCdC").kendoExtDropDownList({
                dataTextField:"cmmCdNm"
                , dataValueField:"cmmCd"
                , dataSource:custCdList
                , index:0
            });
            $("#custCdC").data("kendoExtDropDownList").enable(false);

            // 신분증유형            mathDocTp       (CRM024)
            $("#mathDocTp").kendoExtDropDownList({
               dataTextField:"cmmCdNm"
               , dataValueField:"cmmCd"
               , optionLabel:" "
               , dataSource:mathDocTpList
               , index:0
            });
            $("#mathDocTp").data("kendoExtDropDownList").enable(false);

            // 신분증유형            mathDocTpC       (CRM024)
            $("#mathDocTpC").kendoExtDropDownList({
               dataTextField:"cmmCdNm"
               , dataValueField:"cmmCd"
               , dataSource:mathDocTpListC
               , index:0
            });
            $("#mathDocTpC").data("kendoExtDropDownList").enable(false);

            // 성별                       sexCd                   (COM017)
            $("#sexCd").kendoExtDropDownList({
               dataTextField:"cmmCdNm"
               , dataValueField:"cmmCd"
               , dataSource:sexCdList
               , index:0
            });
            $("#sexCd").data("kendoExtDropDownList").enable(false);

            // 고객확보유형1      custHoldTpC      (CRM008)
            $("#custHoldTpC").kendoExtDropDownList({
                dataTextField:"cmmCdNm"
                , dataValueField:"cmmCd"
                , optionLabel:" "
                , dataSource:custHoldTpList
                , index:0
            });
            $("#custHoldTpC").data("kendoExtDropDownList").enable(false);

            // 업종                  bizcondCdC
            $("#bizcondCdC").kendoExtDropDownList({
               dataTextField:"cmmCdNm"
               , dataValueField:"cmmCd"
               , dataSource:bizcondCdList
               , index:0
            });
            $("#bizcondCdC").data("kendoExtDropDownList").enable(false);

            // 회사유형                  cmpTpC
            $("#cmpTpC").kendoExtDropDownList({
               dataTextField:"cmmCdNm"
               , dataValueField:"cmmCd"
               , dataSource:cmpTpList
               , index:0
            });
            $("#cmpTpC").data("kendoExtDropDownList").enable(false);

            // 그룹
            $("#custGroupsC").kendoMultiSelect({
                dataSource:custGroupsC,
                valuePrimitive:true,
                placeholder:"",
                dataTextField:"grpNm",
                dataValueField:"grpSeq",
                dataBound:defaultGroupCDatasourceSetting,
                change:defaultGroupCDatasourceSetting
            });
            $("#custGroupsC").data("kendoMultiSelect").enable(false);

            // 태그
            $("#custTagsC").kendoMultiSelect({
                dataSource:custTagsC,
                valuePrimitive:true,
                placeholder:"",
                dataTextField:"grpNm",
                dataValueField:"grpSeq",
                dataBound:defaultTagCDatasourceSetting,
                change:defaultTagCDatasourceSetting
            });
            $("#custTagsC").data("kendoMultiSelect").enable(false);
            /******************************************************
            * 고객상세정보 탭 (스크립트2)- 끝
            ******************************************************/


            /********************************************* 팝업 버튼 시작 */
            // 정비예약
            $("#btnRoResv").kendoButton({
                click:function(e){

                    var custNo = $("#custNo").val();

                    if ( dms.string.isNotEmpty(custNo) ){

                        var iframe = "callcenterPopupWindow";
                        var autoBind = "N";
                        var type = "";

                        parent.fn_custVinSearchPopUp(iframe, autoBind, type, custNo);

                    } else {

                        // [콜번호]을(를) 선택해주세요.
                        dms.notification.warning("<spring:message code='crm.lbl.callSeq' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                        return;
                    }

                }
                , enable:false
            });

            // 전화걸기
            $("#btnOBCall").kendoButton({
                click:function(e){

                    // 전화걸기 클릭시 통화시간 비활성화
                    $("#callStartDt").data("kendoExtMaskedDateTimePicker").enable(false);
                    $("#callEndDt").data("kendoExtMaskedDateTimePicker").enable(false);

                    var callSeq = $("#callSeq").val()
                      , hpNo = $("#hpNo").val()         // 고객 이동 전화번호
                      , driverHpNo = $("#driverHpNo").val()         // 고객 이동 전화번호
                    ;

                    if ( dms.string.isNotEmpty(driverHpNo) ){
                        hpNo = driverHpNo;
                    };

                    if ( dms.string.isEmpty(callSeq) ){
                        // {콜번호}을(를) 선택해주세요.
                        dms.notification.warning("<spring:message code='crm.lbl.callSeq' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                        return;
                    };

                    callDeviceInit();   // 전화걸기시 디바이스 상태를 초기화해줌.

                    obCallPopupWindow = dms.window.popup({
                        windowId:"obCallPopupWindow"
                        //, title:false       // 타이틀 false 하면 드래그가 안됨
                        , title:"<spring:message code='crm.title.OBcall' />"        //전화걸기
                        , width:"250px"
                        , height:"460px"
                        , close:function(){
                        }
                        , content:{
                            url:"<c:url value='/crm/cmm/dialPad/selectDialPadPopup.do'/>"
                            , data:{
                                "autoBind":false
                                , "custNo" : custNo
                                , "hpNo" : hpNo
                                , "callbackFunc" : function(data){

                                    callDeviceInit();   // 전화팝업 closer시 디바이스 상태를 초기화해줌.

                                    if( data !== null){

                                        // 통화 완료 시 정보set
                                        $("#callStartDt").data("kendoExtMaskedDateTimePicker").value(data.callStartDt);
                                        $("#callEndDt").data("kendoExtMaskedDateTimePicker").value(data.callEndDt);
                                        $("#callHisSeq").val(data.callHisSeq);   // 콜센터 IB/OB/부재중 저장SEQ
                                        $("#recFileId").val(data.callFileNm);    // 첨부파일명
                                        $("#callDialNum").val(data.callDialNum);
                                        $("#hpNo").data("kendoMaskedTextBox").value(data.callDialNum);

                                        obCallPopupWindow.close();
                                        // 전송 / 이 완료 되었습니다.
                                        //dms.notification.success("<spring:message code='global.btn.transmission' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");
                                    };

                                }
                            }
                        }
                    });

                    /*
                    $("#obCallPopupWindow").parent().find(".k-widget").bind("keydown", function(){
                        return false;
                    });

                    $("#obCallPopupWindow").parent().find(".k-window-titlebar").bind("keydown", function(){
                        return false;
                    });
                     */

                    $("#obCallPopupWindow").parent().find(".k-window-actions").on("click", function(){

                        dms.window.confirm({
                            message:"<spring:message code='crm.info.callDialCloseConfirm'/>"            // 통화 정보가 저장되지 않습니다. 닫으시겠습니까? [번역]
                            ,callback:function(result){

                                if(result){
                                    obCallPopupWindow.close();
                                }else{
                                    return false;
                                }
                                return false;

                            }
                        });

                        return false;

                    });

                }
                , enable:false
            });

            // 콜센터실행 정보저장
            var validator = $("#callCenterActionInfoForm").kendoExtValidator().data("kendoExtValidator");
            $("#btnCallCenterSave").kendoButton({
                click:function(e){

                    if (validator.validate()) {

                        // 통화시간 확인
                        var callStartDt = $("#callStartDt").data("kendoExtMaskedDateTimePicker").value()
                          , callEndDt = $("#callEndDt").data("kendoExtMaskedDateTimePicker").value()
                          , maxCallCnt = "<c:out value='${callcenterMaxCall}' />"       // max 콜 확인
                          , callCnt = parseInt($("#callCnt").val())+1                   // max 콜 확인
                        ;

                        if ( dms.string.isEmpty(callStartDt) ) {
                            // 통화시작시간 / 을(를) 확인하여 주세요.
                            dms.notification.warning("<spring:message code='crm.lbl.callStartDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                            return;
                        };
                        if ( dms.string.isEmpty(callEndDt) ) {
                            // 통화종료시간 / 을(를) 확인하여 주세요.
                            dms.notification.warning("<spring:message code='crm.lbl.callEndDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                            return;
                        };
                        if ( callStartDt > callEndDt ) {
                            // 통화시간 / 을(를) 확인하여 주세요.
                            dms.notification.warning("<spring:message code='crm.lbl.callDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                            return;
                        };

                        //console.log("maxCallCnt:"+maxCallCnt+" ::callCnt:",callCnt);
                        //return;

                        if ( callCnt >= maxCallCnt ) {

                            dms.window.confirm({
                                message:"<spring:message code='crm.err.maxCallConfirm'/>"            // 최대 콜을 초과하였습니다. 무응답으로 콜센터 처리를 완료하겠습니까?
                                ,callback:function(result){
                                    if(result){
                                        //확인버튼 클릭 로직
                                        callCenterSave(true);
                                    }else{
                                        //취소버튼 클릭 로직
                                        return;
                                    }
                                }
                            });

                        } else {
                            callCenterSave(false);
                        };

                    }
                    // validatrion 종료
                }
            });
            /********************************************* 메인 그리드 버튼 종료 */

            // 콜 저장
            function callCenterSave(maxCallChk){

                var validator = $("#callCenterActionInfoForm").kendoExtValidator().data("kendoExtValidator");

                if (validator.validate()) {

                    // 통화시간 확인
                    var callStartDt = $("#callStartDt").data("kendoExtMaskedDateTimePicker").value()
                      , callEndDt = $("#callEndDt").data("kendoExtMaskedDateTimePicker").value()
                      , scheCallDt = $("#scheCallDt").data("kendoExtMaskedDateTimePicker").value()
                      , callRsltCd = $("#callRsltCd").data("kendoExtDropDownList").value()
                      , recFileId = $("#recFileId").val()
                      , callDialNum = $("#callDialNum").val()
                      , callHisSeq = $("#callHisSeq").val()
                      , hpNo = $("#hpNo").val()
                      , callProcEndYn = "N";
                    ;

                    if ( dms.string.isEmpty(callStartDt) ) {
                        // 통화시작시간 / 을(를) 확인하여 주세요.
                        dms.notification.warning("<spring:message code='crm.lbl.callStartDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                        return;
                    };
                    if ( dms.string.isEmpty(callEndDt) ) {
                        // 통화종료시간 / 을(를) 확인하여 주세요.
                        dms.notification.warning("<spring:message code='crm.lbl.callEndDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                        return;
                    };
                    if ( callStartDt > callEndDt ) {
                        // 통화시간 / 을(를) 확인하여 주세요.
                        dms.notification.warning("<spring:message code='crm.lbl.callDt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                        return;
                    };

                    if ( maxCallChk ) {

                        callRsltCd = "06";      // 맥스콜 지나면 연결안됨
                        callProcEndYn = "Y";
                        scheCallDt = null;

                    } else if ( !maxCallChk ) {

                        // 처리완료여부 확인
                        if ( $("#callProcEndYn").is(":checked") ) {
                            callProcEndYn = "Y";
                        };

                        if ( callProcEndYn === "Y" ) {

                            //console.log("callProcEndYn : ",callProcEndYn)
                            // [콜센터처리완료여부]을(를) 확인하여 주세요.
                            if ( dms.string.isNotEmpty(scheCallDt) ) {
                                dms.notification.warning("<spring:message code='crm.lbl.callProcEndYn' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                return;
                            };

                        };

                    };

                    var saveData =
                        $("#callCenterActionInfoForm").serializeObject(
                            $("#callCenterActionInfoForm").serializeArrayInSelector("[data-json-obj='true']")
                    );

                    saveData.callRsltCd = callRsltCd;
                    saveData.callProcEndYn = callProcEndYn;
                    saveData.callStartDt = callStartDt;
                    saveData.callEndDt = callEndDt;
                    saveData.scheCallDt = scheCallDt;
                    saveData.recFileId = recFileId;
                    saveData.callHisSeq = callHisSeq;
                    saveData.callDialNum = callDialNum;
                    saveData.hpNo = hpNo;

                    var callVsitResvDt = $("#callVsitResvDt").data("kendoExtMaskedDateTimePicker").value();

                    // 만족도 조사(05):만족도 조사일 / 캠페인(06),고객케어(09):내방예약일 view     - html show/hide 가 잘 안되서 저장시점에서 수정.
                    var bizCd = saveData.bizCd;
                    if ( bizCd == "05" ) {
                        saveData.stsfIvstDt = callVsitResvDt
                    } else if ( bizCd == "06" ) {
                        saveData.callVsitResvDt = callVsitResvDt
                    } else if ( bizCd == "09" ) {
                        saveData.callVsitResvDt = callVsitResvDt
                    };

                    //console.log("saveData:" + JSON.stringify(saveData));
                    //return;
                    $.ajax({
                        url:"<c:url value='/crm/cal/callCenter/updateCallCenterAction.do' />",
                        data:JSON.stringify(saveData),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        async:false,
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(jqXHR, textStatus) {

                            //console.log("저장완료---------");
                            //console.log(textStatus);
                            //console.log(jqXHR);

                            if(textStatus == "success" && jqXHR === true ){

                                options.callbackFunc($("#callSeq").val());
                            }else{
                                // 저장정보 / 을(를) 확인하여 주세요.
                                dms.notification.warning("<spring:message code='crm.info.saveInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                            }

                        }
                        ,beforeSend:function(xhr) {
                            dms.loading.show($("#window"));
                        }
                        ,complete:function(xhr, status) {
                            dms.loading.hide($("#window"));
                        }
                    });
                    // ajax 종료

                };
                // validator 종료

            };// 저장 종료


        /******************************************************
        * 캠페인 상세정보 탭 (스크립트)- 시작
        ******************************************************/

        var hostList     = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
        var makTpList    = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
        var statList     = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];

        <c:forEach var="obj" items="${hostList}">
            hostList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        <c:forEach var="obj" items="${makTpList}">
            makTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        <c:forEach var="obj" items="${statList}">
            statList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>


        // 주최(입력부).   hostList
        $("#hostCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:hostList
        });
        $("#hostCd").data("kendoExtDropDownList").enable(false);

        // 유형(입력부).   makTpList
        $("#makTpCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:makTpList
        });
        $("#makTpCd").data("kendoExtDropDownList").enable(false);

        // 유형상세(입력부).   makSubTpList
        $("#makSubTpCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "  // 선택
        });
        $("#makSubTpCd").data("kendoExtDropDownList").enable(false);

        // 상태(입력부).   statList
        $("#statCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:statList
        });
        $("#statCd").data("kendoExtDropDownList").enable(false);
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
        $("#targCustCnt").data("kendoExtNumericTextBox").enable(false);

        // 종료여부-정비용(입력부).
        $("#crEndTp").kendoExtDropDownList({
            dataSource:['Y','N']
            ,autoBind:false
            ,index:0
        });
        $("#crEndTp").data("kendoExtDropDownList").enable(false);

        // 시작일(입력부)
        $("#startDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        $("#startDt").data("kendoExtMaskedDatePicker").enable(false);

        // 종료일(입력부)
        $("#endDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        $("#endDt").data("kendoExtMaskedDatePicker").enable(false);

        // 생산시작일자-정비용(입력부)
        $("#creStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        $("#creStartDt").data("kendoExtMaskedDatePicker").enable(false);

        // 생산종료일자-정비용(입력부)
        $("#creEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        $("#creEndDt").data("kendoExtMaskedDatePicker").enable(false);

        // 판매시작일자-정비용(입력부)
        $("#saleStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        $("#saleStartDt").data("kendoExtMaskedDatePicker").enable(false);

        // 판매종료일자-정비용(입력부)
        $("#saleEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        $("#saleEndDt").data("kendoExtMaskedDatePicker").enable(false);

        /**
        * 유형에 따른 유형 Sub 조회(값 셋팅시에만 사용함)
        */
        function onSelectMakTpCdSet(value) {

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

            var responseJson = dms.ajax.getJson({
                url:_contextPath + "/crm/mcm/marketingCampaign/selectMakTpCdList.do"
                ,data:JSON.stringify({"cmmCd":value})
                ,async:false
            });
            $("#makSubTpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
            $("#makSubTpCd").data("kendoExtDropDownList").enable(false);

        };


        /******************************************************
        * 캠페인 상세정보 탭 (스크립트)- 종료
        ******************************************************/

             // 만족도 조사 저장 종료 kjlee
             $("#btnSurveySave").kendoButton({
                 click:function(e){

                     var questionCnt = 0;
                     var radioCnt = 0;
                     var checkboxCnt = 0;
                     var textAreaCnt = 0;
                     $("#btnSurveySave").data("kendoButton").enable(true);
                     if($("#seq").val() == ""){
                         //만족도 조사(을)를 선택해 주시기 바랍니다.
                         $("#btnSurveySave").data("kendoButton").enable(true);
                         dms.notification.warning("<spring:message code='global.lbl.custStsfSurvey' var='custStsfSurvey' /><spring:message code='global.info.check.field' arguments='${custStsfSurvey}' />");
                         return;
                     }

                     if($("#custNo").val() == ""){
                         //고객명(을)를 선택해 주시기 바랍니다.
                         $("#btnSurveySave").data("kendoButton").enable(true);
                         dms.notification.warning("<spring:message code='global.lbl.custNm' var='custNm' /><spring:message code='global.info.check.field' arguments='${custNm}' />");
                         return;
                     }

                     if($('#searchFlag').val() == "F"){
                         //설문하기(을)를 클릭해 주시기 바랍니다.
                         $("#btnSurveySave").data("kendoButton").enable(true);
                         dms.notification.warning("<spring:message code='crm.btn.playSurvey' var='playSurvey' /><spring:message code='global.info.check.field' arguments='${playSurvey}' />");
                         return;
                     }

                     var nameArr = [];
                     var val = [];
                     var seq = $("#seq").val();
                     var strArr = [];
                     var stsfIvstYn = $("input:radio[name=stsfIvstYn]:checked").val();

                     $(":radio[name ^='rad_']").each(function(index){
                         nameArr[index] = $(this).attr("name");
                     });

                     var uniqueNames = [];

                     $.each(nameArr,function(i,el){
                         if($.inArray(el,uniqueNames) === -1)
                             uniqueNames.push(el)
                     });


                     questionCnt = uniqueNames.length;

                     //라디오 문제 선택 건수
                     radioCnt = validChk(uniqueNames,"noTxt");

                     var params = [];
                     var idx = 0;
                     for(var k=0; k<uniqueNames.length;k++){
                         var rad_nm = uniqueNames[k];
                         if($("input:radio[name="+rad_nm+"]").is(":checked")){

                             obj = {};
                             obj["stsfIvstRsltSeq"] = $("#refKeyNm").val();//만족도 조사 결과 일련번호
                             obj["stsfIvstSeq"] = seq;//만족도 조사 일련번호
                             obj["subyTmplSeq"] = $("input:radio[name="+rad_nm+"]:checked").attr("data-sts");//설문 템플릿 일련번호
                             obj["qestSeq"] = $("input:radio[name="+rad_nm+"]:checked").attr("data-stqs");//질문 일련번호
                             obj["qestWgtVal"] = $("input:radio[name="+rad_nm+"]:checked").attr("data-qwv");//질문 가중치
                             obj["qestTpCd"] = $("input:radio[name="+rad_nm+"]:checked").attr("data-qtc");//질문 유형코드
                             obj["answSeq"] = $("input:radio[name="+rad_nm+"]:checked").attr("data-is");//질문일련번호
                             obj["answScoreVal"] = $("input:radio[name="+rad_nm+"]:checked").attr("data-score");
                             obj["custNo"] = $("#custNo").val();
                             obj["custNm"] = $("#custNm").val();
                             obj["sbjvAnswCont"] = "";
                             params.push(obj);
                             idx++;
                         }
                     }

                     nameArr = [];
                     $(":checkbox[name ^='chk_']").each(function(index){
                         nameArr[index] = $(this).attr("name");
                     });

                     uniqueNames = [];

                     $.each(nameArr,function(i,el){
                         if($.inArray(el,uniqueNames) === -1)
                             uniqueNames.push(el)
                     });

                     questionCnt = questionCnt + uniqueNames.length;

                     //CheckBox 문제 선택 건수
                     checkboxCnt = validChk(uniqueNames,"noTxt");

                     var chkCnt = 0;
                     var result = false;
                     var asc = 0;
                     var qIdx = 0;
                     var checkedCnt = 0;
                     $(":checkbox[name ^='chk_']").each(function(index){
                         if($(this).is(":checked")){
                             obj = {};
                             obj["stsfIvstRsltSeq"] = $("#refKeyNm").val();//만족도 조사 결과 일련번호
                             obj["stsfIvstSeq"] = seq;//만족도 조사 일련번호
                             obj["subyTmplSeq"] = $(this).attr("data-sts");//설문 템플릿 일련번호
                             obj["qestSeq"] = $(this).attr("data-stqs");//질문 일련번호
                             obj["qestWgtVal"] = $(this).attr("data-qwv");//질문 가중치
                             obj["qestTpCd"] = $(this).attr("data-qtc");//질문 유형코드
                             obj["answSeq"] = $(this).attr("data-is");//답변 일련번호
                             obj["answScoreVal"] = $(this).attr("data-score");
                             obj["sbjvAnswCont"] = "";
                             obj["custNo"] = $("#custNo").val();
                             obj["custNm"] = $("#custNm").val();
                             params.push(obj);
                             idx++;
                         }

                         //다중선택시 답변선택가능 갯수 validation 설정
                         asc = $(this).attr("data-asc");
                         qIdx = $(this).attr("data-qIdx");
                         checkedCnt = $("input[name ^= chk_"+$(this).attr("data-sts")+"_"+$(this).attr("data-stqs")+"]:checked").length;

                         if ( asc > 0 && checkedCnt > asc) {
                             result = true;
                             $("#p_chk_"+$(this).attr("data-sts")+"_"+$(this).attr("data-stqs")).parent('div').attr("style","color:red;");
                             return false;
                         } else {
                             $("#p_chk_"+$(this).attr("data-sts")+"_"+$(this).attr("data-stqs")).parent('div').attr("style","color:;");
                         };

                     });


                     if(result){
                         // {qIdx}번 문항은 {asc}건 이하로만 선택해주세요.
                         $("#btnSurveySave").data("kendoButton").enable(true);
                         dms.notification.warning("<spring:message code='crm.err.surveyOverCheck' arguments='"+qIdx+", "+asc+"' />");
                         return;
                     }

                     //textArea Validation시작
                     nameArr = [];
                     $("textarea[name ^='txt_']").each(function(i){
                         nameArr[i] = $(this).attr("id");
                     });

                     uniqueNames = [];

                     $.each(nameArr,function(i,el){
                         if($.inArray(el,uniqueNames) === -1)
                             uniqueNames.push(el)
                     });
                     questionCnt = questionCnt + uniqueNames.length;

                     for(var p=0; p<uniqueNames.length;p++){
                         var txt_nm = uniqueNames[p];

                         if($('#'+txt_nm+'').val() != ""){
                             textAreaCnt++;
                             obj = {};
                             obj["stsfIvstRsltSeq"] = $("#refKeyNm").val();//만족도 조사 결과 일련번호
                             obj["stsfIvstSeq"] = seq;//만족도 조사 일련번호
                             obj["subyTmplSeq"] = $('#'+txt_nm+'').attr("data-sts");//설문 템플릿 일련번호
                             obj["qestSeq"] = $('#'+txt_nm+'').attr("data-stqs");//질문 일련번호
                             obj["qestWgtVal"] = $('#'+txt_nm+'').attr("data-qwv");//질문 가중치
                             obj["qestTpCd"] = $('#'+txt_nm+'').attr("data-qtc");//질문 유형코드
                             obj["answSeq"] = null;//답변 일련번호
                             obj["answScoreVal"] = 0;
                             obj["sbjvAnswCont"] = $('#'+txt_nm+'').val();
                             obj["custNo"] = $("#custNo").val();
                             obj["custNm"] = $("#custNm").val();
                             params.push(obj);
                             idx++;
                         }
                     };
                     if (dms.string.isEmpty(stsfIvstYn)) {
                         // {만족여부} 을(를) 선택하세요.
                         $("#btnSurveySave").data("kendoButton").enable(true);
                         dms.notification.warning("<spring:message code='crm.lbl.stsfIvstYn' var='returnMsg' /><spring:message code='global.info.check.field' arguments='${returnMsg}' />");
                         return;
                     };

                  var answeredCnt = radioCnt + checkboxCnt + textAreaCnt;
                  var noAnsweredCnt = questionCnt - answeredCnt;
                  var confirmMsg ="<spring:message code='crm.lbl.answer'/>: "+answeredCnt+"<spring:message code='crm.lbl.count'/>,"+" <spring:message code='crm.lbl.noAnswer'/>: "+noAnsweredCnt+"<spring:message code='crm.lbl.count'/>"+"<br/>"+"<spring:message code='crm.lbl.toSave'/>";

                  dms.window.confirm({
                      title:""
                      ,message:confirmMsg
                      ,confirmBtnText:"<spring:message code='global.lbl.yes'/>"
                      ,cancelBtnText:"<spring:message code='global.lbl.n'/>"
                      ,callback:function(result){

                          if(result){
                              var satisFactionMobileResultVO = {};
                              satisFactionMobileResultVO["stsfIvstSeq"] = seq;//만족도 조사 일련번호
                              satisFactionMobileResultVO["stsfIvstRsltSeq"] = $("#refKeyNm").val();//만족도 조사 결과 일련번호
                              satisFactionMobileResultVO["subyTmplSeq"] = $("#subyTmplSeq").val(); //설문 템플릿 일련번호
                              satisFactionMobileResultVO["custNo"] = $("#custNo").val(); //고객번호

                              satisFactionMobileResultVO["stsfIvstYn"] = stsfIvstYn;
                              satisFactionMobileResultVO["cmplReasonCont"] = $("#cmplReasonCont").val();

                              //if(!validChk(uniqueNames,"txt")){
                                  //return;
                              //}

                              //console.log("insertList : ",params);
                              //return;

                              //var json = $("#surveyInfoForm").serializeObject();
                              //dms.loading.show();
                              $.ajax({
                                  url:"<c:url value='/crm/css/satisFactionMobile/multiUsrAnswerSurveys.do'/>"
                                  ,dataType:"json"
                                  ,type:"POST"
                                  ,contentType:"application/json"
                                  , beforeSend:function(xhr){
                                      dms.loading.show();
                                  }
                                  ,data:JSON.stringify({"insertList":params, "satisFactionMobileResultVO":satisFactionMobileResultVO})
                                  ,error:function(jqXHR,status,error) {
                                      dms.notification.error(jqXHR.responseJSON.errors);
                                  }
                                  ,success:function(data) {

                                      if ( data.result === "SUCCESS" ) {
                                          // 만족도 조사 저장후 처리:콜센터러치완료 , 만족도조사일 SET
                                          $("#callProcEndYn").prop("checked",true);
                                          $("#callProcEndYn:checkbox").prop("disabled", true);
                                          $("#callVsitResvDt").data("kendoExtMaskedDateTimePicker").value(data.resultDt);

                                          //정상적으로 반영 되었습니다.
                                          dms.notification.success("<spring:message code='global.info.success'/>");
                                          $("#btnSurveySave").data("kendoButton").enable(false);

                                          //dms.loading.hide();
                                          $(".survey_content > ul").empty();
                                          //var htmladd = "<tr><th colspan='2'><h1 class='title_basic'  align='center'><spring:message code='crm.info.surveySucess'/> </h1></th></tr>";
                                          var htmladd = '<li><p class="txt_thanks"><spring:message code="crm.info.surveySucess"/></p></li>';
                                          $(".survey_content > ul").append(htmladd);
                                          $('#searchFlag').val("F");

                                      } else if ( data.result === "FAIL" ) {
                                          // {만족도 조사결과}등록 실패되었습니다.
                                          dms.notification.warning("<spring:message code='global.lbl.stsfIvstRsltCont' var='custStsfSurvey' /><spring:message code='global.err.regFailedParam' arguments='${custStsfSurvey}' />");
                                      } else {
                                          // {만족도 조사결과}을(를) 확인하여 주세요.
                                          dms.notification.warning("<spring:message code='global.lbl.stsfIvstRsltCont' var='custStsfSurvey' /><spring:message code='global.info.confirmMsgParam' arguments='${custStsfSurvey}' />");
                                      };
                                  }
                                  ,complete:function(xhr, status) {
                                      $("#btnSurveySave").data("kendoButton").enable(true);
                                      dms.loading.hide();
                                  }
                              });
                          }else{
                              return false;
                          }
                          return false;
                      }
                  });
                 }
             });

             // 만족도 조사 응답 건수
             function validChk(uniqueNames,txt){
                 var nm = "";
                 var cnt = 0;
                 for(var j=0; j<uniqueNames.length;j++){
                     nm = uniqueNames[j];
                     if(txt == "noTxt"){
                         if($("input[name="+nm+"]").is(":checked")){
                             //응답했으면  .
                             cnt++;
                         }
                     }
                 }
                 return cnt;
             }
             // 만족도 조사 응답 건수


            // 메시지이력 그리드 - 시작
            $("#msgHistoryGrid").kendoExtGrid({
                gridId:"G-CRM-0725-094500"
                ,dataSource:{
                    transport:{
                        read:{
                            url:"<c:url value='/crm/cal/callCenter/selectMsgHistorys.do' />"
                        },
                        parameterMap:function(options, operation) {
                            if (operation === "read") {

                                var params = {};

                                params["recordCountPerPage"]    = options.pageSize;
                                params["pageIndex"]             = options.page;
                                params["firstIndex"]            = options.skip;
                                params["lastIndex"]             = options.skip + options.take;
                                params["sort"]                  = options.sort;

                                // 고객기준 메시지 전체 조회
                                //params["sContactBizCd"] = "10";
                                //params["sRefTableNm"] = "CR_0606T"
                                //params["sRefKeyNm"] = $("#callSeq").val();
                                params["sCustNo"] = $("#custNo").val();

                                //console.log('msgHistoryGrid params:',kendo.stringify(params) );
                                return kendo.stringify(params);

                            }else if (operation !== "read" && options.models) {
                                return kendo.stringify(options.models);
                            }
                        }
                    }
                    ,schema:{
                        model:{
                            id:"contactNo",
                            fields:{
                                  contactNo:{type:"number"}
                                 ,contactStatCd:{type:"string"}
                                 ,contactTpNm:{type:"string"}
                                 ,contactCont:{type:"string"}
                                 ,contactBizCdNm:{type:"string"}
                                 ,regDt        :{type:"date"}
                            }
                        }
                    }
                }
            ,autoBind:false
            ,scrollable: {
                virtual: true
            }
            ,editable:false
            ,height:154
            ,navigatable:false
            ,pageable:false
            ,filterable:false
            ,sortable :false
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,selectable:"row"
            ,columns:[
                    {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                        ,filterable:false
                        , attributes:{"class":"ac"}
                    }
                    ,{field:"regDt", title:"<spring:message code='global.crm.contactDt' />", width:100                /* 연락일 */
                        , attributes:{"class":"ac"}
                        , format:"{0:<dms:configValue code='dateFormat' />}"
                    }
                    ,{field:"contactStatCd", title:"<spring:message code='global.lbl.contactStatCd' />", width:100    /* 유형 */
                        , attributes:{"class":"ac"}
                    }
                    ,{field:"contactTpNm", title:"<spring:message code='global.lbl.contactTp' />", width:100, attributes:{"class":"ac"}}    //접촉유형 (CRM321:활동형태 ) ( 01:전화 / 02:방문 / 03:EMAIL / 04:SMS / 05:현장접수 / 06:WeChat )
                    ,{field:"contactBizCdNm", title:"<spring:message code='global.lbl.contactBizCd' />", width:100, attributes:{"class":"ac"}}    /* 접촉업무 */
                    ,{field:"receiveRsltCdNm", title:"<spring:message code='crm.lbl.smsSendRsltCont' />", width:100, attributes:{"class":"ac"}}    /* SMS전송결과 */
                    ,{field:"contactCont", title:"<spring:message code='global.lbl.contactCont' />"}       /* 연락내용 */
            ]
            });
            //메시지이력 그리드 - 종료

            // 콜센터실행 히스토리 그리드 시작
            $("#callHisGrid").kendoExtGrid({
                gridId:"G-CRM-0722-164700"
                ,dataSource:{
                     transport:{
                        read:{
                            url:"<c:url value='/crm/cal/callCenter/selectCallCenterActionHistorys.do' />"
                        }
                        ,parameterMap:function(options, operation) {
                            if (operation === "read") {

                                var params = {};

                                params["recordCountPerPage"] = options.pageSize;
                                params["pageIndex"] = options.page;
                                params["firstIndex"] = options.skip;
                                params["lastIndex"] = options.skip + options.take;
                                params["sort"] = options.sort;

                                params["sCallSeq"] = $("#callSeq").val();
                                params["sBizCd"] = $("#bizCd").val();

                                //console.log("callHis param:"+kendo.stringify(params));

                                return kendo.stringify(params);

                            } else if (operation !== "read" && options.models) {
                                return kendo.stringify(options.models);
                            }
                        }
                    }
                    ,schema:{
                        model:{
                            id:"callSeq"
                            ,fields:{
                                rnum:{type:"number"}
                                ,callSeq:{type:"number"}
                                ,callHisSeq:{type:"number"}
                                ,callCnt:{type:"number"}

                                ,startDt:{type:"date"}
                                ,endDt:{type:"date"}
                                ,updtDt:{type:"date"}

                                ,callStartDtFormat:{type:"date", editable:false}
                                ,callStartDt:{type:"date"}
                                ,callEndDtFormat:{type:"date", editable:false}
                                ,callEndDt:{type:"date"}
                                ,callVsitResvDtFormat:{type:"date", editable:false}
                                ,callVsitResvDt:{type:"date"}
                                ,stsfIvstDtFormat:{type:"date", editable:false}
                                ,stsfIvstDt:{type:"date"}
                                ,scheCallDtFormat:{type:"date", editable:false}
                                ,scheCallDt:{type:"date"}
                                ,realCallDtFormat:{type:"date", editable:false}
                                ,realCallDt:{type:"date"}
                                ,callPrsnAllocDtFormat:{type:"date", editable:false}
                                ,callPrsnAllocDt:{type:"date"}
                                ,regDtFormat:{type:"date", editable:false}
                                ,regDt:{type:"date"}
                            }
                        }
                        ,parse:function(d) {
                            if(d.data){
                                $.each(d.data, function(idx, elem) {
                                    elem.callStartDtFormat = kendo.parseDate(elem.callStartDt, "<dms:configValue code='dateFormat' />");
                                    elem.callEndDtFormat = kendo.parseDate(elem.callEndDt, "<dms:configValue code='dateFormat' />");
                                    elem.callVsitResvDtFormat  = kendo.parseDate(elem.callVsitResvDt, "<dms:configValue code='dateFormat' />");
                                    elem.stsfIvstDtFormat  = kendo.parseDate(elem.stsfIvstDt, "<dms:configValue code='dateFormat' />");
                                    elem.scheCallDtFormat = kendo.parseDate(elem.scheCallDt, "<dms:configValue code='dateFormat' />");
                                    elem.realCallDtFormat = kendo.parseDate(elem.realCallDt, "<dms:configValue code='dateFormat' />");
                                    elem.callPrsnAllocDtFormat  = kendo.parseDate(elem.callPrsnAllocDt, "<dms:configValue code='dateFormat' />");
                                    elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                                });
                            }
                            return d;
                        }
                    }
                }
                ,autoBind:false
                ,scrollable: {
                    virtual: true
                }
                ,editable:false
                ,height:154
                ,navigatable:false
                ,pageable:false
                ,filterable:false
                ,sortable :false
                ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
                ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
                ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
                ,appendEmptyColumn:true           //빈컬럼 적용. default:false
                ,enableTooltip:true               //Tooltip 적용, default:false
                ,selectable:"row"
                ,columns:[
                    {field:"callSeq", title:"", width:100, hidden:true}
                    ,{field:"callCnt", title:"<spring:message code='global.lbl.callCnt' />", width:100,attributes:{ "style":"text-align:right"}, hidden:true}       /* CALL횟수 */
                    ,{field:"remark", title:"remark", width:100, hidden:true}
                    ,{field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                        ,filterable:false
                        ,attributes:{"class":"ac"}
                    }
                    ,{field:"callRsltCdNm", title:"<spring:message code='crm.lbl.callRsltCd' />", width:100, attributes:{"class":"ac"}} // 콜결과
                    ,{field:"callStartDtFormat", title:"<spring:message code='crm.lbl.callStartDt' />", width:150          // 통화시작시간
                        ,attributes:{"class":"ac tooltip-disabled"}
                        ,template:"#if (callStartDtFormat !== null ){# #= kendo.toString(data.callStartDt, '<dms:configValue code='dateTimeFormat' />') # #} else {# #= '' # #}#"
                    }
                    ,{field:"callEndDtFormat", title:"<spring:message code='crm.lbl.callEndDt' />", width:150          // 통화끝난시간
                        ,attributes:{"class":"ac tooltip-disabled"}
                        ,template:"#if (callEndDtFormat !== null ){# #= kendo.toString(data.callEndDt, '<dms:configValue code='dateTimeFormat' />') # #} else {# #= '' # #}#"
                    }
                    ,{field:"callValidYn", title:"<spring:message code='crm.lbl.callValidYn' />", width:100
                        ,attributes:{"class":"ac"}
                        ,template:"#if ( callValidYn === 'Y' ){# #= '<spring:message code='crm.lbl.callValidY' />' # #} else {# #= '<spring:message code='crm.lbl.callValidN' />' # #}#"
                    }   // 유효통과여부
                    ,{field:"callDialNum", title:"<spring:message code='global.lbl.sendTelNo' />", width:100, attributes:{"class":"ac"}}    // 발신전화번호
                    ,{field:"callPrsnNm", title:"<spring:message code='crm.lbl.callPrsnId' />", width:100 }       /* 콜담당자 */
                    ,{field:"callCont", title:"<spring:message code='crm.lbl.callCont' />", width:100}       /* 콜내용 */
                    ,{field:"recFileId", title:"<spring:message code='crm.lbl.recFileId' />", width:100    // 녹취파일
                        ,attributes:{"class":"ac"}
                        ,template:function(dataItem){
                            var spanObj;
                            if ( dms.string.isNotEmpty(dataItem.recFileId) ) {
                                spanObj = "<a href = '#' onClick='recFileDown()'>"+dataItem.recFileId+"</a>";
                            } else {
                                spanObj = "";
                            };
                            return spanObj;
                        }

                    }
                    ,{field:"callVsitResvDtFormat", title:"<spring:message code='crm.lbl.callVsitResvDt' />", width:120          // 내방예약일자
                        ,attributes:{"class":"ac tooltip-disabled"}
                        ,template:"#if (callVsitResvDtFormat !== null ){# #= kendo.toString(data.callVsitResvDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                    }
                    ,{field:"stsfIvstDtFormat", title:"<spring:message code='crm.lbl.stsfIvstDt' />", width:120          // 만족도조사일자
                        ,attributes:{"class":"ac tooltip-disabled"}
                        ,template:"#if (stsfIvstDtFormat !== null ){# #= kendo.toString(data.stsfIvstDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                    }
                    ,{field:"scheCallDtFormat", title:"<spring:message code='crm.lbl.nextCallDt' />", width:120          // 다음Call시간
                        ,attributes:{"class":"ac tooltip-disabled"}
                        ,template:"#if (scheCallDtFormat !== null ){# #= kendo.toString(data.scheCallDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                    }
                    ,{field:"realCallDtFormat", title:"<spring:message code='crm.lbl.realCallDt' />", width:120          // 실제콜일자
                        ,attributes:{"class":"ac tooltip-disabled"}
                        ,template:"#if (realCallDtFormat !== null ){# #= kendo.toString(data.realCallDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                    }
                    ,{field:"callPrsnAllocDtFormat", title:"<spring:message code='crm.lbl.callPrsnAllocDt' />", width:120          // 콜담당배정일자
                        ,attributes:{"class":"ac tooltip-disabled"}
                        ,template:"#if (callPrsnAllocDtFormat !== null ){# #= kendo.toString(data.callPrsnAllocDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
                    }
                    ,{field:"regUsrNm", title:"<spring:message code='crm.lbl.pprocNm' />", width:100}     /* 처리자 */
                    ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:100          // 등록일
                        ,attributes:{"class":"ac tooltip-disabled"}
                        ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                    }
                ]
            });
            // 콜센터실행 히스토리 그리드 종료

            $("#fileGrid").on("dblclick", "tr.k-state-selected", function (e) {
                var grid = $("#fileGrid").data("kendoExtGrid");
                var dataItem = grid.dataItem(grid.select());

                if(dms.string.isNotEmpty(dataItem)){
                    dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
                }
            });


            /*****************************************************************************
             ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
             *******************************************************************************/
             // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
             $("#callHisGrid").on("dblclick", "tr.k-state-selected", function (e) {

                 var gridId = e.delegateTarget.id
                   , grid = $("#"+gridId+"").data("kendoExtGrid")
                   , selectedItem = grid.dataItem(grid.select())
                 ;

                 if ( dms.string.isNotEmpty(selectedItem.recFileId) ){
                     recFileDown();
                 } else {
                     return;
                 }

             });

            // 파일 그리드 시작 //
            $("#fileGrid").kendoExtGrid({
               gridId:"G-CRM-1229-133000"
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
              ,height:220
              , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
              , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
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

            // 보유차량 - selectCustomerInfoMain.jsp, selectCallCenterActionPopup.jsp, selectCustHaveCarSearchPopup.do
            $("#haveCarGrid").kendoExtGrid({
                gridId:"G-CRM-0519-172107"
                , dataSource:{
                    transport:{
                        read:{
                            url:"<c:url value='/crm/cmm/selectHaveCar.do' />"
                        }
                        ,parameterMap:function(options, operation) {
                            if (operation === "read") {

                                // 고객번호
                                if ( dms.string.isEmpty($("#custNo").val()) ) {
                                    dms.notification.warning("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                                    return false;
                                };

                                var params = {};
                                params["sort"]                 = options.sort;

                                params["sCustNo"] = $("#custNo").val();
                                params["sDlrCd"] = $("#dlrCd").val();
                                //params["sUseYn"] = "Y";  // 소유자만만
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
                                id:"vinNo"
                                   ,fields:{
                                      vinNo               :{type:"string"}
                                    , ncarDstinCd         :{type:"string"}
                                    , dlrCd               :{type:"string"}
                                    , carRegNo            :{type:"string"}
                                    , carlineCd           :{type:"string"}
                                    , carlineNm           :{type:"string"}
                                    , modelCd             :{type:"string"}
                                    , modelNm             :{type:"string"}
                                    , ocnCd               :{type:"string"}
                                    , ocnNm               :{type:"string"}
                                    , extColorCd          :{type:"string"}
                                    , extColorNm          :{type:"string"}
                                    , intColorCd          :{type:"string"}
                                    , intColorNm          :{type:"string"}
                                    , corpCarDstinCd      :{type:"string"}
                                    , carBrandCd          :{type:"string"}
                                    , carNm               :{type:"string"}
                                    , enginNo             :{type:"string"}
                                    , custSaleDt          :{type:"date"}
                                    , invcPublDt          :{type:"date"}
                                    , dlrNm               :{type:"string"}
                                    , custRegDt           :{type:"date"}
                                }
                            }
                    }
                }
                ,editable:false
                ,autoBind:false
                ,filterable:false
                ,navigatable:false
                ,pageable:false
                ,height:221
                ,sortable:false
                ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
                ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
                ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
                ,appendEmptyColumn:true           //빈컬럼 적용. default:false
                ,enableTooltip:true               //Tooltip 적용, default:false
                ,selectable:"row"
                ,columns:[
                    {field:"useYn",  title:"<spring:message code='global.lbl.gubun' />",   width:130, attributes:{"class":"ac"}
                        ,template:function(dataItem){
                            return (dataItem.useYn == "Y")?"<spring:message code='global.lbl.haveCar' />":"<spring:message code='global.lbl.historyCar' />";
                        }
                    }
                    ,{field:"ncarDstinCd",  title:"<spring:message code='sal.lbl.carBrand' />",   width:130, attributes:{"class":"ac"}
                        ,template:'#if (ncarDstinCd !== ""){# #= ncarDstinCdMap[ncarDstinCd]# #}#'
                    }
                    ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />",     width:130, attributes:{"class":"ac"}} //차종
                    ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />",     width:130, attributes:{"class":"ac"}} //모델
                    ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNo' />", width:150, attributes:{"class":"ac"}
                        ,template:function(dataItem){
                            var spanObj = "<a href='#' class='linkVin'>"+dataItem.vinNo+"</a>";
                            return spanObj;
                        }
                    } //VIN
                    ,{field:"enginSerialNo", title:"<spring:message code='global.lbl.enginNo' />", width:130, attributes:{"class":"ac"}} //엔진번호
                    ,{field:"carRegNo", title:"<spring:message code='global.lbl.licensePlt' />",     width:130, attributes:{"class":"al"}} //번호판
                    ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />",     width:130, attributes:{"class":"ac"}} //외장색
                    ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColorNm' />",     width:130, attributes:{"class":"ac"}} //내장색
                    //,{field:"ordDlrNm", title:"<spring:message code='global.lbl.purcDlrComp' />",     width:130, attributes:{"class":"ac"}} //구매 딜러사
                    ,{field:"custSaleDt", title:"<spring:message code='sal.lbl.saleDt' />", width:130, attributes:{"class":"ac"} // 구입일자자
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                    } //구매일자
                    ,{field:"invcPublDt", title:"<spring:message code='sal.lbl.invoiceDt' />", width:130, attributes:{"class":"ac"} // 구입일자자
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                    } //영수증일자
                    ,{field:"custRegDt", title:"<spring:message code='global.lbl.regDt' />", width:130, attributes:{"class":"ac"}
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                    } //등록일
                ]
            });
            // 보유차량 그리드 - 종료

            // 정비이력그리드 -- selectCustomerInfoMain.jsp, selectCallCenterActionPopup.jsp 와 같이 수정해주세요
            $("#lbrGrid").kendoExtGrid({
                gridId:"G-CRM-0721-112601"
                , dataSource:{
                    transport:{
                        read:{
                            url:"<c:url value='/crm/cmm/selectRepairOrdersHistory.do' />"
                            ,dataType:"json"
                            ,type:"POST"
                            ,contentType:"application/json"
                        }
                        ,parameterMap:function(options, operation) {
                            if (operation === "read") {

                                // 고객번호
                                if ( dms.string.isEmpty($("#custNo").val()) ) {
                                    dms.notification.warning("<spring:message code='global.lbl.customer' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                                    return false;
                                };

                                var params = {};
                                params["sort"] = options.sort;

                                params["sCarOwnerId"] = $("#custNo").val();
                                params["sSearchGubun"] = "MD";

                                return kendo.stringify(params);

                            }else if (operation !== "read" && options.models) {
                                return kendo.stringify(options.models);
                            }
                        }
                    }
                    ,schema:{
                        model:{
                            id:"rnum"
                            ,fields:{
                                rnum:{type:"number", editable:false}
                                ,dlrCd:{type:"string", editable:false}
                                ,resvDocNo:{type:"string", editable:false}
                                ,roDocNo:{type:"string", editable:false}
                                ,roDt:{type:"date"}
                                ,roPrintDt:{type:"date"}
                                ,updtDt:{type:"date"}
                                ,calcRegDt:{type:"date"}
                                ,calcDt:{type:"date"}
                            }
                        }
                    }
                }
                ,height:221
                ,sortable:false
                ,pageable:false
                ,filterable:false
                ,navigatable:false
                ,autoBind:false
                ,editable:false
                ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
                ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
                ,appendEmptyColumn:true           //빈컬럼 적용. default:false
                ,enableTooltip:true               //Tooltip 적용, default:false
                ,selectable:"row"
                ,columns:[

                          {field:"dlrCd", title:"<spring:message code='ser.lbl.dealer' />", sortable:false, width:100, attributes:{"class":"ac"}}        // 딜러
                          ,{field:"roStatNm", title:"<spring:message code='ser.lbl.roStatus' />", sortable:false, width:100, attributes:{"class":"ac"}}  // RO 상태
                          ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", sortable:false, width:120}    // RO번호
                          ,{field:"roTpNm", title:"<spring:message code='ser.lbl.roTp' />", sortable:false, width:100}
                          ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.roWrtrNm' />", sortable:false, width:100}  // 위탁인
                          ,{field:"roDt", title:"<spring:message code='ser.lbl.roDt' />", width:120
                              , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", attributes:{"class":"ac"}}   // RO확인시간
                          ,{field:"roPrintDt", title:"<spring:message code='ser.lbl.roPrintDt' />", width:120
                              , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", attributes:{"class":"ac"}}   // 최종프린트시간
                          ,{field:"updtDt", title:"<spring:message code='ser.lbl.roUpdtDt' />", width:120
                              , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", attributes:{"class":"ac"}}   // 수정일자
                          ,{field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", sortable:false, width:100}      // 차량번호
                          ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", sortable:false, width:150}         // VIN
                          ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", sortable:false, width:100} // 소유자
                          ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", sortable:false, width:100}      // 방문자
                          ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", sortable:false, width:100} // 차종명칭
                          ,{field:"modelNm", title:"<spring:message code='par.lbl.modelNm' />", sortable:false, width:100}     // 모델명칭
                          ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", sortable:false, width:100
                              ,attributes :{"class":"ar"}
                              ,format:"{0:n0}"
                          } // 주행거리
                          ,{field:"lastRunDistVal", title:"<spring:message code='ser.lbl.dlRunDistVal'/>", sortable:false, width:100
                              ,attributes :{"class":"ar"}
                              ,format:"{0:n0}"
                          } // 누적주행거리
                          ,{field:"calcDocNo", title:"<spring:message code='ser.lbl.calcNo' />", sortable:false, width:120}      // 정산번호
                          ,{field:"calcRegDt", title:"<spring:message code='ser.lbl.calcDt' />", width:120
                              , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", attributes:{"class":"ac"}}   // 정산일자
                          ,{field:"calcPrsnNm", title:"<spring:message code='ser.lbl.calcWrtrNm' />", sortable:false, width:100} // 정산자
                          ,{field:"calcDt", title:"<spring:message code='ser.lbl.calcEndDt' />", width:120
                              , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", attributes:{"class":"ac"}}   // 정산완료일자
                          ,{field:"calcCompUsrNm", title:"<spring:message code='ser.lbl.calcCompNm' />", sortable:false, width:100}   // 정산완료자
                          ,{field:"paymYnNm", title:"<spring:message code='ser.lbl.paidYn' />", sortable:false, width:80,attributes:{"class":"ac"}} //청산완료여부
                      ]
            });
            // 정비이력 그리드 - 종료


            // from 초기화
             initForm();

            /*****************************************************************************
            ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
            *******************************************************************************/

            // 팝업 탭 1번 으로 활성화
            var mainTabStrip = $("#mainTab").data("kendoExtTabStrip");
            mainTabStrip.select(0);
            var subTabStrip = $("#subTab").data("kendoExtTabStrip");
            subTabStrip.select(0);

            // 상세 조회
            if ( dms.string.isNotEmpty(callSeq) && dms.string.isNotEmpty(bizCd) ) {

                var param = {
                        "sCallSeq":callSeq
                        ,"sBizCd":bizCd
                        };

                //console.log("콜센터실행 상세 조회 파람:",JSON.stringify(param));
                //return;

                $.ajax({
                        url:"<c:url value='/crm/cal/callCenter/selectCallCenterActionByKey.do' />"
                        ,data:JSON.stringify(param)      //파라미터
                        ,type:'POST'                        //조회요청
                        ,dataType:'json'                  //json 응답
                        ,contentType:'application/json'   //문자열 파라미터
                        ,async:false
                        ,error:function(jqXHR,status,error){
                            dms.notification.error("<spring:message code='crm.lbl.dtlInfo' var='arg' /><spring:message code='crm.info.findFail' arguments='${arg}' />");
                        }
                }).done(function(body) {

                    //console.log("콜센터실행 상세 조회 결과:",body);

                    $("#btnCallCenterSave").data("kendoButton").enable(true);

                    // 탭버튼 활성화
                    $("#btnRoResv").data("kendoButton").enable(true);
                    $("#btnOBCall").data("kendoButton").enable(true);

                    $("#callSeq").val(body.callSeq);
                    $("#refTableNm").val(body.refTableNm);
                    $("#refKeyNm").val(body.refKeyNm);

                    $("#custNo").val(body.custNo);
                    $("#custNm").val(body.custNm);
                    $("#hpNo").data("kendoMaskedTextBox").value(body.hpNo);

                    $("#callCnt").val(body.callCnt);
                    $("#callPrsnId").val(body.callPrsnId);

                    var bizCd = body.bizCd;
                    $("#bizCd").val(bizCd);
                    subTabView(bizCd);          // 조회 완료후 tab view 변경

                    if ( bizCd === "05" ) {

                        // 만족도조사&& 정비 : 운전자명, 운전자 이동전화 / 정비 X && 법인 : 구매담당자명
                        if ( body.bizSubCd === "01" ) {
                            $("#stsfInfoArea").removeClass("hidden");
                            $("#driverNm").val(body.useCustNm);
                            $("#driverHpNo").val(body.useHpNo);
                        } else if ( body.bizSubCd !== "01" && body.custTp === "02" ) {
                            $("#stsfInfoArea").removeClass("hidden");
                            $("#stsfInfoTxt1").text("<spring:message code='crm.lbl.corpPurcMng'/>");
                            $("#stsfInfoTxt2").text("");
                            $("#stsfInfoTxt3").text("");
                            $("#driverNm").val(body.purcMngNm);
                        };

                        $("#stsfIvstNm").val(body.callBizTitleNm);
                        $("#stsfIvstMthCd").val(stsfIvstMthCdArrVal(body.stsfIvstMthCd));
                        $("#startStftDt").data("kendoExtMaskedDatePicker").value(body.startDt);
                        $("#endStftDt").data("kendoExtMaskedDatePicker").value(body.endDt);
                        $("#seq").val(body.seq);

                        $("#btnSurveySave").data("kendoButton").enable(true);

                        // 만족도 조사 설문조사 시작
                        if ( dms.string.isEmpty($("#callSeq").val()) ) {
                            // [콜번호]을(를) 선택해주세요.
                            dms.notification.warning("<spring:message code='crm.lbl.callSeq' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                            return;
                        }

                        $('#searchFlag').val("T");

                        // TODO 만족도 조사 명 설정
                        $("#surveyName").empty();

                        $(".survey_content > ul").empty();

                        var params = {
                                "sSeq":$("#seq").val()
                                ,"sCallSeq":$("#callSeq").val()
                                ,"sRefKeyNm":$("#refKeyNm").val()
                        };

                        console.log("123123")
                        console.log($("#refKeyNm").val())
                        $.ajax({
                            url:"<c:url value='/crm/cal/callCenter/selectSatisFactionSurvey01s.do'/>",
                            data:JSON.stringify(params),
                            type:'POST',
                            dataType:'json',
                            contentType:'application/json',
                            error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            }
                        }).done(function(result) {

                            var questionList = result["questionList"];
                            var answerList = result["answerList"];
                            var answerListCnt = answerList.length;
                            var satisFactionMobileResultVO = result["satisFactionMobileResultVO"];
                            var cmplReasonCont = "";
                            var stsfIvstYn = "";
                            var stsfIvstResultYn = "N";

                            if ( dms.string.isNotEmpty(satisFactionMobileResultVO) && dms.string.isNotEmpty(satisFactionMobileResultVO.stsfIvstDt)) {

                                if ( dms.string.isNotEmpty(satisFactionMobileResultVO.cmplReasonCont) ) {
                                    cmplReasonCont = satisFactionMobileResultVO.cmplReasonCont;
                                };

                                stsfIvstYn = satisFactionMobileResultVO.stsfIvstYn;
                                stsfIvstResultYn = "Y";

                            };

                            var subyTmplSeq = result["subyTmplSeq"];
                            $("#subyTmplSeq").val(subyTmplSeq);

                            var template = "";
                            var result = "";


                            var data = [];
                            var lastIdx;

                            // 만족도 조사 설문지 && 답안지 html 생성

                            // 시작헤드
                            var headTmpl = '<li><h3>#:index #. #:qestCont # #:answSelCntCont #</h3><div class="answer_area">';

                            // 라디오(객관식 단일)
                            var singleTmpl = '<p><label class="label_check"><input type="radio" id="rad_#:subyTmplSeq #_#:subyTmplQestSeq #_#:itemSeq #" '+
                                              'class="form_check"'+
                                              'name="rad_#:subyTmplSeq #_#:subyTmplQestSeq #"'+
                                              'value="#:itemSeq #"'+
                                              '#if(checkFlag === "Y"){#checked=checked#}#'+
                                              'data-qwv="#:qestWgtVal#" data-qtc="#:qestTpCd#" data-sts="#:subyTmplSeq#"  data-stqs="#:subyTmplQestSeq#"  data-is="#:itemSeq#" data-score="#:answScoreVal#" /> #:answCont #</label></p>';

                            // 체크박스(객관식 다중)
                            var multiTmpl = '<p id="p_chk_#:subyTmplSeq #_#:subyTmplQestSeq #"><label class="label_check"><input type="checkbox" id="chk_#:subyTmplSeq #_#:subyTmplQestSeq #_#:itemSeq #" '+
                                              'class="form_check"'+
                                              'name="chk_#:subyTmplSeq #_#:subyTmplQestSeq #"'+
                                              'value="#:itemSeq #"'+
                                              '#if(checkFlag === "Y"){#checked=checked#}#'+
                                              'data-qIdx="#:qIdx #" data-asc="#:answSelCnt#" data-qwv="#:qestWgtVal#" data-qtc="#:qestTpCd#" data-sts="#:subyTmplSeq#" data-stqs="#:subyTmplQestSeq#"  data-is="#:itemSeq#"  data-score="#:answScoreVal#"/>#:answCont #</label></p>';

                            // 주관식
                            var shortTmpl = '<textarea rows="4" cols="" id="txt_#:subyTmplSeq #_#:subyTmplQestSeq #" maxlength="1333" '+
                                              'class="form_textarea"'+
                                              'name="txt_#:subyTmplSeq #_#:subyTmplQestSeq #"'+
                                              'data-qwv="#:qestWgtVal#" data-qtc="#:qestTpCd#" data-sts="#:subyTmplSeq#"  data-stqs="#:subyTmplQestSeq#"  data-is="#:itemSeq#"  data-score="#:answScoreVal#" style="width:100%;">#:checkFlag #</textarea>';

                            // 종료
                            var tailTmpl = '</div></li>';

                            //만족여부
                            var stsfIvstYnTmpl = '<li style="border-top:1px solid black;"><h3><spring:message code="crm.lbl.stsfIvstYn"/></h3><div class="answer_area"><p>'
                                               + '<label class="label_check"><input type="radio" id="stsfIvstY" name="stsfIvstYn" value="Y" class="form_check" '+'#if(stsfIvstYn === "Y"){#checked=checked#}#'+'/>&nbsp;<spring:message code="crm.lbl.satisfaction"/></label>&nbsp;&nbsp;'
                                               + '<label class="label_check"><input type="radio" id="stsfIvstN" name="stsfIvstYn" value="N" class="form_check" '+'#if(stsfIvstYn === "N"){#checked=checked#}#'+'/>&nbsp;<spring:message code="crm.lbl.dissatisfied"/></label>'
                                               + '</p></div></li>';

                            // 총결
                            var cmplReasonContTmpl = '<li><h3><spring:message code="crm.lbl.cmplReasonCont"/></h3><div class="answer_area">'+
                                                      '<textarea rows="4" cols="" id="cmplReasonCont" maxlength="1333" '+
                                                        'class="form_textarea"'+
                                                        'name="cmplReasonCont'+
                                                        'style="width:100%;">#:cmplReasonCont #</textarea></div></li>';

                            //문제 for
                            var qIdx = 0;
                            for(var i=0;i < questionList.length;i++){
                                var subyTmplSeq = questionList[i].subyTmplSeq;
                                var subyTmplQestSeq = questionList[i].subyTmplQestSeq;
                                //체크박스의 경우 선택할수 있는  갯수가 정해져 있을경우 문제옆에 선택가능한 갯수를 표현해 준다.
                                var answSelCntCont = "";
                                if ( questionList[i].qestTpCd == "02" && questionList[i].answSelCnt > 0 ) {
                                    answSelCntCont = '( <spring:message code="crm.lbl.selected" arguments="'+questionList[i].answSelCnt+'" /> )';
                                };

                                qIdx = i+1;
                                template = kendo.template(headTmpl);
                                data = {
                                        index:qIdx
                                        ,qestCont:questionList[i].qestCont
                                        ,answSelCntCont:answSelCntCont
                                }
                                result += template(data);
                                lastIdx = qIdx+1;
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
                                                    , checkFlag:answerList[j].itemSeq == answerList[j].answSeq ? "Y":"N"
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
                                                    , checkFlag:answerList[j].itemSeq == answerList[j].answSeq ? "Y":"N"
                                                    , answSelCnt:questionList[i].answSelCnt
                                                    , qIdx:qIdx
                                            }
                                            result += template(data)
                                        }
                                    }else{
                                        //주관식
                                        if(subyTmplSeq == answerList[j].subyTmplSeq && subyTmplQestSeq == answerList[j].subyTmplQestSeq){
                                            template = kendo.template(shortTmpl);
                                            data = {subyTmplSeq:answerList[j].subyTmplSeq
                                                    ,subyTmplQestSeq:answerList[j].subyTmplQestSeq
                                                    , itemSeq:answerList[j].itemSeq
                                                    , answScoreVal:answerList[j].answScoreVal
                                                    , qestWgtVal:questionList[i].qestWgtVal
                                                    , qestTpCd:questionList[i].qestTpCd
                                                    , checkFlag:answerList[j].sbjvAnswCont != null ? answerList[j].sbjvAnswCont:""
                                            }
                                            result += template(data);
                                        }
                                    }

                                }
                            }

                            //만족여부 추가
                            template = kendo.template(stsfIvstYnTmpl);
                            data = {stsfIvstYn:stsfIvstYn}
                            result += template(data);

                            //총결
                            template = kendo.template(cmplReasonContTmpl);
                            data = {cmplReasonCont:cmplReasonCont}
                            result += template(data);

                            result += tailTmpl;
                            $(".survey_content > ul").append(result);

                            //콜정보가 종료되었거나 설문 이력이 있는경우 > 만족도 조사 저장버튼 비활성화 / 설문지 읽기전용
                            if ( body.callProcEndYn === "Y" || stsfIvstResultYn === "Y" ) {
                                $("#btnSurveySave").data("kendoButton").enable(false);
                                $(".survey_content ul li textarea").attr("readonly", true).addClass("form_readonly");
                                $(".survey_content ul li input:checkbox").prop("disabled", true);
                                $(".survey_content ul li input:radio").prop("disabled", true);
                            };
                            //콜정보가 종료되었거나 설문 이력이 있는경우 >만족도 조사 저장버튼 비활성화 / 설문지 읽기전용


                        });
                        // 만족도 조사 설문조사

                    } else if ( bizCd === "06" ) {          // 캠페인

                        $("#makNm").val(body.callBizTitleNm);
                        $("#activeCont").val(body.activeCont);
                        $("#talkPlan").val(body.talkPlan);

                        var params = {};
                        params["sRefKeyNm"] = body.refKeyNm;
                        params["sRefTableNm"] = body.refTableNm;

                        $.ajax({
                                url:"<c:url value='/crm/cal/callCenter/selectMarketingCampaignByKey.do' />"
                                ,data:JSON.stringify(params)      //파라미터
                                ,type:'POST'                        //조회요청
                                ,dataType:'json'                  //json 응답
                                ,contentType:'application/json'   //문자열 파라미터
                                ,async:false
                                ,error:function(jqXHR,status,error){
                                    dms.notification.error("<spring:message code='crm.lbl.dtlInfo' var='arg' /><spring:message code='crm.info.findFail' arguments='${arg}' />");
                                }
                        }).done(function(body) {

                            //console.log("캠페인 상세 조회 결과:",body);

                            $("#dlrCd").val(body.dlrCd);        // 딜러코드
                            $("#pltCd").val(body.pltCd);        // 사업장코드
                            $("#delYn").val(body.delYn);
                            $("#crNo").val(body.makCd);     // 캠페인번호(정비용)
                            $("#makCd").val(body.makCd);        // 캠페인번호
                            $("#hostCd").data("kendoExtDropDownList").value(body.hostCd);      // 주최
                            $("#makTpCd").data("kendoExtDropDownList").value(body.makTpCd);    // 유형
                            onSelectMakTpCdSet(body.makTpCd);
                            $("#makSubTpCd").data("kendoExtDropDownList").value(body.makSubTpCd);      // 서브유형
                            $("#makNm").val(body.makNm);        // 캠페인명
                            $("#startDt").data("kendoExtMaskedDatePicker").value(body.startDt);     // 시작일
                            $("#endDt").data("kendoExtMaskedDatePicker").value(body.endDt);         // 종료일
                            $("#prid").val(body.prid);      // 기간
                            $("#placeNm").val(body.placeNm);        // 장소명
                            $("#rcpeAutoYn").val(body.rcpeAutoYn);
                            $("#aapCmpNm").val(body.aapCmpNm);
                            $("#budgetAmt").data("kendoExtNumericTextBox").value(body.budgetAmt);      // 예산
                            $("#statCd").data("kendoExtDropDownList").value(body.statCd);
                            $("#targCustCnt").data("kendoExtNumericTextBox").value(body.targCustCnt);      // 목표인수

                            //serviceInfo1
                            $("#creStartDt").data("kendoExtMaskedDatePicker").value(body.creStartDt);       // 생산시작일자(정비용)
                            $("#creEndDt").data("kendoExtMaskedDatePicker").value(body.creEndDt);           // 생산종료일자(정비용)
                            $("#crEndTp").data("kendoExtDropDownList").value(body.crEndTp);                    // 종료여부(정비용)

                            //serviceInfo2
                            $("#saleStartDt").data("kendoExtMaskedDatePicker").value(body.saleStartDt);     // 판매시작일자(정비용)
                            $("#saleEndDt").data("kendoExtMaskedDatePicker").value(body.saleEndDt);         // 판매종료일자(정비용)
                            $("#pcDstinCd").val(body.pcDstinCd);                                            // 승상용구분코드(정비용)
                            $("#crIsaNm").val(body.crIsaNm);                                                // 캠페인리콜시행처명(정비용)

                            // 딜러 > 정비 인경우 시행처 삭제
                            if ( body.hostCd === "01" ) {
                                $("#crIsaNmTxt").removeClass("hidden");
                                $("#crIsaNm").removeClass("hidden");
                            } else if ( body.hostCd === "02"){
                                $("#crIsaNmTxt").addClass("hidden");
                                $("#crIsaNm").addClass("hidden");
                            };

                            $("#makCont").val(body.makCont);    // 비고
                            $("#regDt").val(body.regDt);        // 등록일
                            $("#updtDt").val(body.updtDt);      // 수정일
                            $("#regUsrId").val(body.regUsrId);  // 등록자
                            $("#activeFileDocNo").val(body.activeFileDocNo);  // 첨부파일번호

                            if ( dms.string.isNotEmpty(body.activeFileDocNo) ) {
                                $("#fileGrid").data("kendoExtGrid").dataSource.page(1);
                            };


                        });

                    } else if ( bizCd === "09" ) {

                        $("#custCareNm").val(body.callBizTitleNm);
                        $("#custCareCont").val(body.custCareCont);

                    };
                    // 고객케어  정보

                    // 콜센터 완료일경우 읽기전용, 저장안됨 TODO 맥스콜 지나면
                    if( body.callProcEndYn === "Y" ) {

                        $("#btnCallCenterSave").data("kendoButton").enable(false);
                        $("#btnOBCall").data("kendoButton").enable(false);

                        $("#callProcEndYn").prop("checked",true);
                        $("#callProcEndYn:checkbox").prop("disabled", true);

                        $("#callRsltCd").data("kendoExtDropDownList").value(body.callRsltCd);
                        $("#callRsltCd").data("kendoExtDropDownList").enable(false);
                        $("#scheCallDt").data("kendoExtMaskedDateTimePicker").value(body.scheCallDt);
                        $("#scheCallDt").data("kendoExtMaskedDateTimePicker").enable(false);
                        $("#callStartDt").data("kendoExtMaskedDateTimePicker").value(body.callStartDt);
                        $("#callStartDt").data("kendoExtMaskedDateTimePicker").enable(false);
                        $("#callEndDt").data("kendoExtMaskedDateTimePicker").value(body.callEndDt);
                        $("#callEndDt").data("kendoExtMaskedDateTimePicker").enable(false);
                        $("#callCont").val(body.callCont).attr("disabled", true).addClass('form_readonly');
                        $("#callVsitResvDt").data("kendoExtMaskedDateTimePicker").enable(false);

                        /* // 만족도 조사:만족도 조사일 / 캠페인,고객케어:내방예약일 view
                        var callVsitResvDt = ""
                            //console.log("bizCd :::::",bizCd);
                        if ( bizCd === "05") {
                            //console.log("11111")
                            callVsitResvDt = body.stsfIvstDt;
                        } else {
                            //console.log("22222")
                            callVsitResvDt = body.callVsitResvDt;
                        }
                        $("#callVsitResvDt").data("kendoExtMaskedDateTimePicker").value(callVsitResvDt);
                        $("#callVsitResvDt").data("kendoExtMaskedDateTimePicker").enable(false); */

                    };

                    // 만족도 조사:만족도 조사일 / 캠페인,고객케어:내방예약일 view
                    var callVsitResvDt = ""
                    if ( bizCd === "05") {
                        callVsitResvDt = body.stsfIvstDt;
                        $("#callVsitResvDt").data("kendoExtMaskedDateTimePicker").value(callVsitResvDt);
                        $("#callVsitResvDt").data("kendoExtMaskedDateTimePicker").enable(false);
                    } else {

                        $("#btnCtlNextStepBefore").removeClass("hidden")
                        callVsitResvDt = body.callVsitResvDt;
                        $("#callVsitResvDt").data("kendoExtMaskedDateTimePicker").value(callVsitResvDt);
                        //$("#callVsitResvDt").data("kendoExtMaskedDateTimePicker").enable(false);
                    };

                });        //조회 후 처리 종료

            }; // 상세조회 종료

            /*****************************************************************************
            ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
            *******************************************************************************/
        })// ready 종료

        /*****************************************************************************
         ******************************* 콜센터 상태호출 *********************************
         *****************************************************************************/
        var XMLHttpReqOB;
        var _isCallPcOB = "";
        var _userId = "";
        var _callStatCd = "";

        // 디바이스 상태를 대기 상태로 초기화한다.
        function callDeviceInit() {

                $("#callStartDt").data("kendoExtMaskedDateTimePicker").value("");
                $("#callEndDt").data("kendoExtMaskedDateTimePicker").value("");
                $("#callHisSeq").val("");
                $("#recFileId").val("");
                $("#callDialNum").val("");

                var params = "event_type=8&line=1&ibseq=&obseq=&device_id=&device_ip=&caller=&RingCnt=&device_port=&duration=&TimeLong=&FilePath=&date=&userId="+_userId;

                $.ajax({
                    url:"<c:url value='/crm/cal/callCenter/callReceive.do' />?"+params
                    ,type:'GET'                        //조회요청
                    ,error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                }).done(function(jqXHR, textStatus) {
                });

        };

        function createXMLHttpRequestOB() {
            if(window.XMLHttpRequest) { //Mozilla
                XMLHttpReqOB = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) { //IE
                try {
                    XMLHttpReqOB = new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e) {
                    try {
                        XMLHttpReqOB = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e) {}
                }
            }
        }

        // 서버에 상태 호출.
        function sendRequestOB() {
            createXMLHttpRequestOB();
            var url = "<c:url value='/crm/cal/callCenter/callStatus.do' />";
            XMLHttpReqOB.open("POST", url, true);
            XMLHttpReqOB.onreadystatechange = processResponseOB;
            XMLHttpReqOB.send(null);
        };

        // 1초마다 호출.
        function processResponseOB() {
            if (XMLHttpReqOB.readyState == 4) {
                if (XMLHttpReqOB.status == 200) {

                    var callStatus = JSON.parse(XMLHttpReqOB.responseText);
                    console.log("OB:",callStatus.callDevicePc+" | userId:"+_userId+" | Status:"+_callStatCd);

                    // 콜센터 PC 인경우 전화걸기 버튼 보여주기
                    if ( callStatus.callDevicePc ) {

                        _userId = callStatus.userId;    // 초기화 번수선언
                        _callStatCd = callStatus.callStatCd;    // 초기화 번수선언
                        _isCallPcOB = callStatus.callDevicePc;    // 초기화 번수선언

                        $("#btnOBCall").removeClass("hidden");
                        setTimeout("sendRequestOB()", 1000);

                    } else {

                        $("#btnOBCall").addClass("hidden");

                        // 통화시간 - 종료인경우 무조건 읽기전용
                        if ( $("#callProcEndYn").is(":checked") ) {
                            $("#callStartDt").data("kendoExtMaskedDateTimePicker").enable(false);
                            $("#callEndDt").data("kendoExtMaskedDateTimePicker").enable(false);
                        };

                    };

                } else {
                    // error
                }
            }
        };

        sendRequestOB();    // 콜상태 호출
        /*****************************************************************************
         ******************************* 콜센터 상태호출 *********************************
         *****************************************************************************/

    </script>
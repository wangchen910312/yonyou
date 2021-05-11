<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

    <!-- 기본정보 -->
    <section class="group">
        <div class="header_area">
        <h1 class="title_basic"><spring:message code="crm.menu.vocMng" /></h1><!-- 고객 요청 관리 -->
            <div class="btn_right">
            <dms:access viewId="VIEW-D-13030" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="global.btn.excelExport" /><!-- 엑셀Export --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11199" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_new" id="btnNew"><spring:message code="global.btn.new" /><!-- 신규 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11200" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
            </dms:access>
            </div>
        </div>
        <div class="table_form" role="search" data-btnid="btnSearch" >
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:23%;">
                    <col>
                    <col style="width:9%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.customer' /><!-- 고객 客户--></th>
                        <td>
                            <input type="text" id="sCust" value="" class="form_input" placeholder="<spring:message code='crm.lbl.custNmHpNo' />"  />
                        </td>
                        <td class="ar">
                            <button type="button" id="btnHidden" class="btn_xs2 btn_detail"><spring:message code='crm.lbl.more' /></button> <!-- 더많음  ?件?情-->
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_form mt5" id="hiddenTable" role="search" data-btnid="btnSearch" >
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sRegStartDt" name="sRegStartDt" value="" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sRegEndDt" name="sRegEndDt" value="" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="global.lbl.type" /><!-- 유형 --></th>
                        <td>
                            <input id="sVocTpCd" name="sVocTpCd" value="" class="form_comboBox" style="width:100%" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.statNm" /><!-- 상태 --></th>
                        <td>
                            <input id="sVocStatCd" name="sVocStatCd" value="" class="form_comboBox" style="width:100%" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.cmplCauCd" /><!-- 불만이유 --></th>
                        <td>
                            <input id="sCmplCauCd" name="sCmplCauCd" value="" class="form_comboBox" style="width:100%" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.pprocId' /><!-- 처리인 --></th>
                        <td>
                            <input type="hidden" id="sMngScId" name="sMngScId" />
                            <input id="sPprocIdNm" name="sPprocIdNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='crm.lbl.vocSource' /><!-- 서비스요청처리 --></th>
                        <td>
                            <input id="sBhmcYn" name="sBhmcYn" class="form_comboBox" />
                        </td>
                        
                        <!-- 2018-11-09 add by fengdequan 增加“服务请求编号”和“审核分派时间”查询条件 start -->
                        <th scope="row"><spring:message code='global.lbl.vocNo' /><!-- 처리인 --></th>
                        <td>
                            <input id="sVocNo" name="sVocNo" class="form_input" />
                        </td>
                        
                        <th scope="row"><spring:message code="global.lbl.evalAllocDt" /><!-- 등록일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sEvalAllocDtStart" name="sEvalAllocDtStart" value="" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sEvalAllocDtEnd" name="sEvalAllocDtEnd" value="" class="form_datepicker">
                                </div>
                            </div>
                        </td> 
                        
                        <!-- 2018-11-09 add by fengdequan 增加“服务请求编号”和“审核分派时间”查询条件 end -->
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="numberOf_box_left mt10" style="">
            <ul>
                <li class="ico03"><p><spring:message code="crm.lbl.vocTpCd1" /><!-- 문의 --> : <span id="vocCnt1"><strong>0</strong></span><spring:message code="global.lbl.cnt" /><!-- 건 --></p></li>
                <li class="ico02"><p><spring:message code="crm.lbl.vocTpCd2" /><!-- 불만 --> : <span id="vocCnt2"><strong>0</strong></span><spring:message code="global.lbl.cnt" /><!-- 건 --></p></li>
                <li class="ico04"><p><spring:message code="crm.lbl.vocTpCd3" /><!-- 요청 --> : <span id="vocCnt3"><strong>0</strong></span><spring:message code="global.lbl.cnt" /><!-- 건 --></p></li>
                <li class="ico05"><p><spring:message code="crm.lbl.vocTpCd4" /><!-- 평가 --> : <span id="vocCnt4"><strong>0</strong></span><spring:message code="global.lbl.cnt" /><!-- 건 --></p></li>
            </ul>
        </div>
        <div class="table_grid mt10">
            <div id="vocGrid"></div>
        </div>
        <div class="header_area">
        <h2 class="title_basic"><spring:message code="global.title.vocReqAccept" /></h2><!-- VOC 요청접수 -->
            <div class="btn_right">
            <dms:access viewId="VIEW-D-12474" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s hidden" name="btnVocStat" id="btnOBCall"><spring:message code="crm.btn.OBcall" /><!-- 전화걸기 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11201" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStat01"><spring:message code="crm.btn.accept" /></button><!-- 접수 -> 활성화 : 신규 -->
            </dms:access>
            <dms:access viewId="VIEW-D-10277" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStat99"><spring:message code="crm.btn.return" /></button><!-- 반송 -> 활성화 : 심사대기 -->
            </dms:access>
            <dms:access viewId="VIEW-D-11202" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStat94"><spring:message code="crm.btn.evalAlloc" /></button><!-- 제조사처리배정 -> 활성화 : 심사대기-->
            </dms:access>
            <dms:access viewId="VIEW-D-11203" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStat03"><spring:message code="crm.btn.proce" /></button><!-- 처리 - 활성화 : 처리대기 -->
            </dms:access>
            <dms:access viewId="VIEW-D-11204" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStat05"><spring:message code="crm.btn.surveySuccessClose" /></button>  <!-- 설문완료CLOSE - 활성화 : 처리완료 설문대기 -->
            </dms:access>
            <dms:access viewId="VIEW-D-11205" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStat07"><spring:message code="crm.btn.surveyFailClose" /></button><!-- 설문안하고CLOSE - 활성화 : 접수 / 처리완료 설문대기 -->
            </dms:access>
            <dms:access viewId="VIEW-D-11206" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStat08"><spring:message code="crm.btn.custVsit" /></button><!-- 고객내방대기 - 활성화 : 접수 / 처리완료 설문대기 -->
            </dms:access>
            <dms:access viewId="VIEW-D-11207" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStat09"><spring:message code="crm.btn.custFU" /></button><!-- 고객F/U중 - 활성화 : 접수 / 처리완료 설문대기 -->
            </dms:access>
            <dms:access viewId="VIEW-D-11208" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStatLEAD"><spring:message code="crm.btn.leadCreate" /></button><!-- 리드생성 -->
            </dms:access>
            <dms:access viewId="VIEW-D-11209" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStatRO"><spring:message code="crm.btn.ROResv" /></button><!-- RO예약 -->
            </dms:access>
            <dms:access viewId="VIEW-D-11211" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStat00"><spring:message code="global.btn.update" /></button><!-- 수정 -> 활성화 : 신규 / 심사대기 / 처리대기 / 고객F/U -->
            </dms:access>
            <dms:access viewId="VIEW-D-11212" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s btn_save" id="btnModify"><spring:message code="global.btn.save" /><!-- 저장 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11213" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s btn_save" id="btnMessage"><spring:message code="global.btn.message" /><!-- 메시지 --></button>
            </dms:access>
            </div>
        </div>

        <form id="defaultInfoForm" name="defaultInfoForm" onsubmit="return false;">
            <div class="table_form form_width_100per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:12%;">
                        <col style="width:13%;">
                        <col style="width:12%;">
                        <col style="width:13%;">
                        <col style="width:12%;">
                        <col style="width:13%;">
                        <col style="width:12%;">
                        <col style="width:13%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.vocNo" /><!-- VOC 번호 --></th>
                            <td>
                                <input id="bhmcYn" name="bhmcYn" type="hidden" value="N" data-json-obj="true" />
                                <input id="bhmcVocNo" name="bhmcVocNo" type="hidden" data-json-obj="true" />
                                <input id="dlrCd" name="dlrCd" type="hidden" value="<c:out value='${loginDlrCd}' />" data-json-obj="true" />
                                <input type="text" id="vocNo" name="vocNo" readonly class="form_input form_readonly ac" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.receiveTelNo" /><!-- 수신 전화번호 --></th>
                            <td>
                                <input type="text" id="receiveTelNo" name="receiveTelNo" class="form_input numberic" data-type="mobile" pattern="\d" maxlength="11" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.sendTelNo" /><!-- 발신 전화번호 --></th>
                            <td>
                                <input type="text" id="sendTelNo" name="sendTelNo" class="form_input numberic" data-type="mobile" pattern="\d" maxlength="11" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.vinNo" /><!-- VIN 번호 --></th>
                            <td>
                                <input type="text" id="vinNo" name="vinNo" class="form_input ac" maxlength="17" style="width:100%" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.statNm" /><!-- 상태 --></th>
                            <td>
                                <input id="vocStatCd" name="vocStatCd" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                                <input type="hidden" id="bfVocStatCd" name="bfVocStatCd" data-json-obj="true" />
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.customer" /><!-- 고객 --></span></th>
                            <td>
                                <input id="custNo" name="custNo" type="hidden" data-json-obj="true" />
                                <div class="form_search">
                                    <input type="text" id="custNm" name="custNm" class="form_input" maxlength="100" style="width:100%" data-json-obj="true" />
                                    <a href="javascript:;" onclick="custSearchPopOpen('C');" ><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                </div>
                            </td>
                            <th scope="row" id="pconRelCdTxt" ><spring:message code="global.lbl.pconRelCd" /><!-- 고객 및 문의자 관계 / 고객 및 불만자 관계 / 고객 및 연계인 관계--></th>
                            <td>
                                <input id="pconRelCd" name="pconRelCd" class="form_comboBox" style="width:100%" data-json-obj="true" />
                                <input type="hidden" id="bfPconRelCd" name="bfPconRelCd" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.carRegNo" /><!-- 차 번호 --></th>
                            <td>
                                <input type="text" id="carRegNo" name="carRegNo" class="form_input ac" maxlength="20" style="width:100%" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.type" /></span> <!-- 유형 --></th>
                            <td>
                                <input id="vocTpCd" name="vocTpCd" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row" id="pconCustInfoTxt" ><spring:message code="global.lbl.pconCustInfo" /><!-- 문의자 / 불만요청자 / 연계인--></th>
                            <td>
                                <input id="pconCustNo" name="pconCustNo" type="hidden" data-json-obj="true" />
                                <input type="text" id="pconCustNm" name="pconCustNm" class="form_input" maxlength="100" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><span id="pprocDeptNmTxt"><spring:message code="global.lbl.pprocDeptNm" /><!-- 처리부서 / 구조진행딜러 --></span></th>
                            <td>
                                <input type="text" id="pprocDeptNm" name="pprocDeptNm" class="form_input" maxlength="50" style="width:100%" data-json-obj="true" />
                                <input type="hidden" id="pprocDeptNmTmp" name="pprocDeptNmTmp" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.carLine" /><!-- 차종 --></th>
                            <td>
                                <input id="carlineNm" name="carlineNm" type="hidden" data-json-obj="true" />
                                <input id="carlineCd" name="carlineCd" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span id="vocTpSubCdSpan" class="bu_required"><spring:message code="crm.lbl.vocTpSubCd" /><!-- VOC 하위 유형 --></span></th>
                            <td class="required_area">
                                <input id="vocTpSubCd" name="vocTpSubCd" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.custPrefCommNo" /><!-- 고객 주요 전화번호 --></th>
                            <td>
                                <input type="text" id="custPrefCommNo" name="custPrefCommNo" class="form_input numberic" data-type="mobile" pattern="\d" maxlength="11" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.pprocId" /><!-- 처리인 --></span></th>
                            <td>
                                <input type="hidden" id="pprocId" name="pprocId" data-json-obj="true" />
                                <div class="form_search" onclick="pprocSearchPopOpen('P1');">
                                    <input type="text" id="pprocNm" name="pprocNm" class="form_input" style="width:100%" data-json-obj="true" />
                                    <a href="javascript:;"><spring:message code="global.btn.search" /><!-- 조회 --></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.model" /><!-- 차형 --></th>
                            <td>
                                <input id="modelNm" name="modelNm" type="hidden" data-json-obj="true" />
                                <input id="modelCd" name="modelCd" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.tendCd" /></span> <!-- 성향 --></th>
                            <td class="required_area">
                                <input id="tendCd" name="tendCd" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.hpNo" /><!-- 고객 이동 전화번호 --></th>
                            <td>
                                <input type="text" id="hpNo" name="hpNo" class="form_input numberic" data-type="mobile" pattern="\d" maxlength="11" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.coopDeptNm" /><!-- 협조부서 --></th>
                            <td>
                                <input type="text" id="coopDeptNm" name="coopDeptNm" class="form_input" maxlength="50" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.ocnNm" /><!-- OCN명 --></th>
                            <td>
                                <input id="ocnNm" name="ocnNm" type="hidden" data-json-obj="true" />
                                <input type="text" id="ocnCd" name="ocnCd" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.vocTpSub1Cd" /></span> <!-- 1급 Sub 유형 --></th>
                            <td class="required_area">
                                <input id="vocTpSub1Cd" name="vocTpSub1Cd" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.homeTelNo" /><!-- 고객 집 전화번호 --></th>
                            <td>
                                <input type="text" id="homeTelNo" name="homeTelNo" class="form_input numberic" data-type="mobile" pattern="\d" maxlength="11" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.division" /><!-- 사업부 --></th>
                            <td>
                                <input type="text" id="bizDeptNm" name="bizDeptNm" class="form_input" maxlength="50" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.runDistVal" /><!-- 키로 수 --></th>
                            <td>
                                <input type="number" id="runDistVal" name="runDistVal" class="form_input ac" maxlength="10" style="width:100%" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.vocTpSub2Cd" /></span> <!-- 2급 Sub 유형 --></th>
                            <td class="required_area">
                                <input id="vocTpSub2Cd" name="vocTpSub2Cd" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.officeTelNo" /><!-- 고객 직장 전화번호 --></th>
                            <td>
                                <input type="text" id="officeTelNo" name="officeTelNo" class="form_input numberic" data-type="mobile" pattern="\d" maxlength="11" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.officeNm" /><!-- 사무소 --></th>
                            <td>
                                <input type="text" id="officeNm" name="officeNm" class="form_input" maxlength="50" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.acptDeptNm" /><!-- 접수부서 --></th>
                            <td>
                                <input type="text" id="acptDeptNm" name="acptDeptNm" class="form_input" maxlength="100" style="width:100%" data-json-obj="true" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.vocTpSub3Cd" /><!-- 3급 유형 --></th>
                            <td>
                                <input id="vocTpSub3Cd" name="vocTpSub3Cd" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.pconCustMjrTelNo" /><!-- 문의자 주요 전화번호 --></th>
                            <td>
                                <input type="text" id="pconCustMjrTelNo" name="pconCustMjrTelNo" class="form_input numberic" data-type="mobile" pattern="\d" maxlength="11" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.sung" /><!-- 성 --></th>
                            <td>
                                <input id="sungNm" name="sungNm" type="hidden" data-json-obj="true" />
                                <input id="sungCd" name="sungCd" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.pacptId" /><!-- 접수인 --></th>
                            <td>
                                <input type="hidden" id="pacptId" name="pacptId" data-json-obj="true" />
                                <input type="text" id="pacptNm" name="pacptNm" class="form_input" style="width:100%" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.acptSrcCd" /></span> <!-- 접수경로 --></th>
                            <td class="required_area">
                                <input id="acptSrcCd" name="acptSrcCd" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.pconCustHpNo" /><!-- 연계인 휴대전화 --></th>
                            <td>
                                <input type="text" id="pconCustHpNo" name="pconCustHpNo" class="form_input numberic" data-type="mobile" pattern="\d" maxlength="11" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.city" /><!-- 도시 --></th>
                            <td>
                                <input id="cityNm" name="cityNm" type="hidden" data-json-obj="true" />
                                <input id="cityCd" name="cityCd" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.acptDt" /></span><!-- 접수시간 --></th>
                            <td class="required_area">
                                <input id="acptDt" name="acptDt" class="form_datepicker ac" style="width:100%" data-json-obj="true" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.activeGainPathCd" /><!-- 활동 취득 경로 --></th>
                            <td>
                                <input id="activeGainPathCd" name="activeGainPathCd" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.pconCustHomeTelNo" /><!-- 문의자 집 전화번호 --></th>
                            <td>
                                <input type="text" id="pconCustHomeTelNo" name="pconCustHomeTelNo" class="form_input numberic" data-type="mobile" pattern="\d" maxlength="11" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"></th>
                            <td>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.manufacturer" /><!-- 제조사/특약점 --></th>
                            <td>
                                <input type="text" id="manufacturer" name="manufacturer" value="" class="form_input ac" maxlength="100" style="width:100%" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span id="cmplCauCdSpan"><spring:message code="global.lbl.cmplCauCd" /><!-- 불만이유 --></span></th>
                            <td>
                                <input id="cmplCauCd" name="cmplCauCd" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.pconCustOfficeTelNo" /><!-- 문의자 직장 전화번호 --></th>
                            <td>
                                <input type="text" id="pconCustOfficeTelNo" name="pconCustOfficeTelNo" class="form_input numberic" data-type="mobile" pattern="\d" maxlength="11" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.custReqCont" /><!-- 고객 요구 --></th>
                            <td colspan="3" rowspan="2">
                                <textarea maxlength="1000" id="custReqCont" name="custReqCont" rows="2" cols="" class="form_textarea" style="height:41px;" data-json-obj="true" ></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.prorCd" /></span> <!-- 중요성 --></th>
                            <td class="required_area">
                                <input id="prorCd" name="prorCd" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.vorResvDt" /><!-- 예약시간 --></th>
                            <td>
                                <input type="text" id="resvDt" name="resvDt" class="form_datepicker ac" style="width:100%" data-json-obj="true" />
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.procLmtCd" /><!-- 처리시한 --></th>
                            <td>
                                <input id="procLmtCd" name="procLmtCd" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.repairBookId" /><!-- 정비예약ID --></th>
                            <td>
                                <input id="repairBookId" name="repairBookId" value="" class="form_input ac" maxlength="20" style="width:100%" data-json-obj="true" >
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.emgcRescLocCont" /><!-- 긴급구조위치내용 --></th>
                            <td colspan="3" rowspan="2">
                                <textarea maxlength="1000" id="emgcRescLocCont" name="emgcRescLocCont" rows="2" cols="" class="form_textarea" style="height:41px;" data-json-obj="true" ></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.vocEndDt" /><!-- Close 시간 --></th>
                            <td>
                                <input id="vocEndDt" name="vocEndDt" value="" class="form_datepicker ac" style="width:100%" data-json-obj="true" />
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.dlrCmpCommYn" /><!-- 딜러사 연락여부 --></th>
                            <td>
                                <label class="label_check ml5"><input id="dlrCmpCommYn" type="checkbox" class="form_check" unchecked data-json-obj="true" ></label>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.emgcRescFstCallYn" /><!-- 긴급구조첫통화여부 --></th>
                            <td>
                                <input id="emgcRescFstCallYn" name="emgcRescFstCallYn" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.emgcRescYn" /><!-- 긴급구조여부 --></th>
                            <td>
                                <input id="emgcRescYn" name="emgcRescYn" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.emgcRescReasonNm" /><!-- 긴급구조원인명 --></th>
                            <td>
                                <input id="emgcRescReasonNm" name="emgcRescReasonNm" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.emgcRescStsfCont" /><!-- 긴급구조만족도내용 --></th>
                            <td>
                                <input id="emgcRescStsfCont" name="emgcRescStsfCont" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="header_area">
            <h2 class="title_basic"><spring:message code="global.title.vocHandling" /></h2><!-- VOC 처리 -->
            </div>

            <div class="table_form form_width_100per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:12%;">
                        <col style="width:13%;">
                        <col style="width:12%;">
                        <col style="width:13%;">
                        <col style="width:12%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.pevalId" /><!-- 심사인 --></th>
                            <td>
                                <input id="pevalId" name="pevalId" type="hidden" />
                                <input type="text" id="pevalNm" name="pevalNm" class="form_input" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.evalAllocDt" /><!-- 심사 배정시간 --></th>
                            <td>
                                <input id="evalAllocDt" name="evalAllocDt" value="" class="form_datepicker ac" style="width:100%">
                            </td>
                            <th scope="row" rowspan="2"><span class="bu_required"><spring:message code="global.lbl.callCenOpnCont" /><!-- 콜센터 의견 --></span></th>
                            <td colspan="3" rowspan="2">
                                <textarea maxlength="1500" id="callCenOpnCont" name="callCenOpnCont" rows="2" cols=""  class="form_textarea" style="height:41px;" data-json-obj="true" ></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.returnCauCont" /><!-- 반송원인 --></th>
                            <td>
                                <input id="returnCauCont" name="returnCauCont" value="" class="form_input" maxlength="500" style="width:100%">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.dataShipStatCd" /><!-- 자료배송상태 --></th>
                            <td>
                                <input id="sendCd" name="sendCd" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.pmoCauCd" /><!-- 승급원인 --></th>
                            <td>
                                <input id="pmoCauCd" name="pmoCauCd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.pmoDt" /><!-- 승급시간 --></th>
                            <td>
                                <input id="pmoDt" name="pmoDt" value="" class="form_datepicker ac" style="width:100%">
                            </td>
                            <th scope="row" rowspan="2"><spring:message code="crm.lbl.revMthCont" /><!-- 검토중인 방안 --></th>
                            <td colspan="3" rowspan="2">
                                <textarea maxlength="1500" id="revMthCont" name="revMthCont" rows="2" cols="" class="form_textarea"  style="height:41px;" data-json-obj="true" ></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.realPprocId" /><!-- 실 처리인 --></th>
                            <td>
                                <input id="realPprocId" name="realPprocId" type="hidden">
                                <input type="text" id="realPprocNm" name="realPprocNm" class="form_input" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.procDt" /><!-- 처리시간 --></th>
                            <td>
                                <input id="procDt" name="procDt" value="" class="form_datepicker ac" style="width:100%">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.pprocTelNo" /><!-- 처리인 전화 --></th>
                            <td>
                                <input type="text" id="pprocTelNo" name="pprocTelNo" value="" class="form_input ac" data-type="tel" pattern="\d" maxlength="20" style="width:100%">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.pprocEmailNm" /><!-- 처리인 E-mail --></th>
                            <td>
                                <input type="email" id="pprocEmailNm" name="pprocEmailNm" value="" class="form_input" maxlength="100" style="width:100%">
                            </td>
                            <th scope="row" rowspan="2"><spring:message code="global.lbl.procRsltCont" /><!-- 처리결과 --></th>
                            <td colspan="3" rowspan="2" >
                                <textarea maxlength="1300" id="procRsltCont" name="procRsltCont" rows="2" cols="" class="form_textarea" style="height:41px;" data-json-obj="true" ></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.stsfIvstEmpId" /><!-- 설문조사인 --></th>
                            <td>
                                <input id="stsfIvstEmpId" name="stsfIvstEmpId" type="hidden">
                                <input type="text" id="stsfIvstEmpNm" name="stsfIvstEmpNm" class="form_input" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.vocStsfIvstDt" /><!-- 설문 조사시간 --></th>
                            <td>
                                <input id="stsfIvstDt" name="stsfIvstDt" value="" class="form_datepicker ac" style="width:100%">
                            </td>
                        </tr>

                        <tr>
                            <th scope="row"><spring:message code="global.lbl.mthAchvHm" /><!-- 방안 달성시간 --></th>
                            <td>
                                <input id="mthAchvHm" name="mthAchvHm" class="form_datepicker ac" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row" rowspan="2" ><spring:message code="crm.lbl.traceRsltCont" /><!-- 추적결과 --></th>
                            <td rowspan="2" rowspan="2" >
                                <textarea maxlength="1300" id="traceRsltCont" name="traceRsltCont" rows="2" cols=""  class="form_textarea" data-json-obj="true" ></textarea>
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.stsfIvstRsltCont" /><!-- 설문결과 --></th>
                            <td colspan="3" rowspan="2" >
                                <textarea maxlength="1300" id="stsfIvstRsltCont" name="stsfIvstRsltCont" rows="2" cols="" class="form_textarea" style="height:41px;" data-json-obj="true" ></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.traceDt" /><!-- 추적시간 --></th>
                            <td>
                                <input id="traceDt" name="traceDt" value="" class="form_datepicker ac" style="width:100%" data-json-obj="true" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div id="addInfoTitle1" class="header_area">
                <h2 class="title_basic"><spring:message code="crm.title.addInfo" /></h2><!-- 추가정보 -->
            </div>

            <div class="table_form form_width_100per" id="addInfoFrom" >
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:12%;">
                        <col style="width:13%;">
                        <col style="width:12%;">
                        <col style="width:13%;">
                        <col style="width:12%;">
                        <col style="width:13%;">
                        <col style="width:12%;">
                        <col style="width:13%;">
                    </colgroup>
                    <tbody>
                        <tr id="addInfo1" >
                            <th scope="row" id="pconStsfIvstTxt" ><spring:message code="crm.lbl.pconStsfIvst" /><!-- 문의만족도 / 불만만족도 --></th>
                            <td>
                                <input id="cmplStsfNm01" name="cmplStsfNm01" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.vocSaleDt" /><!-- 판매시간 --></th>
                            <td>
                                <input id="saleDt01" name="saleDt01" value="" class="saleDt form_datepicker ac" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.salesActiveSrcCd" /><!-- 영업활동정보출처 --></th>
                            <td>
                                <input type="text" id="salesActiveSrcCd" name="salesActiveSrcCd" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.relSalesActiveNo" /><!-- 관계영업활동번호 --></th>
                            <td>
                                <input type="text" id="relSalesActiveNo" name="relSalesActiveNo" class="form_input" style="width:100%" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr id="addInfo2" class="hidden" >
                            <th scope="row"><spring:message code="crm.lbl.cmplStsfCd" /><!-- 불만 만족도 --></th>
                            <td>
                                <input id="cmplStsfNm02" name="cmplStsfNm02" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.cmplReAcptYn" /></th> <!-- 불만 재 접수 여부 -->
                            <td>
                                <label class="label_check ml5"><input id="cmplReAcptYn" type="checkbox" class="form_check" unchecked data-json-obj="true" ></label>
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.cmplReAcptCnt" /><!-- 불만 재 접수 횟수 --></th>
                            <td>
                                <input type="number" id="cmplReAcptCnt" name="cmplReAcptCnt" value="" class="form_input ac" maxlength="10" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.serReqNo" /><!-- 관련서비스 요청번호 --></th>
                            <td>
                                <input id="serReqNo" name="serReqNo" value="" class="form_input ac" maxlength="50" style="width:100%" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr id="addInfo3" class="hidden" >
                            <th scope="row"><spring:message code="crm.lbl.cmplDlDeptNm" /><!-- 불만전달 부서 --></th>
                            <td>
                                <input id="cmplDlDeptNm" name="cmplDlDeptNm" value="" class="form_input" maxlength="50" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.vocCmplDlEmpId" /><!-- 불만전달 자 --></th>
                            <td>
                                <input id="cmplDlEmpId" name="cmplDlEmpId" type="hidden">
                                <input type="text" id="cmplDlEmpNm" name="cmplDlEmpNm" class="form_input" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.vocSaleDt" /><!-- 판매시간 --></th>
                            <td>
                                <input id="saleDt02" name="saleDt02" value="" class="saleDt form_datepicker ac" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.dstbNo" /><!-- 물류번호 --></th>
                            <td>
                                <input id="dstbNo" name="dstbNo" value="" class="form_input ac" maxlength="20" style="width:100%" data-json-obj="true" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div id="itemInfoTitle1" class="header_area">
            <h2 class="title_basic"><spring:message code="ser.title.itemInfo" /></h2><!-- 부품정보 -->
            </div>
            <div id="itemInfo1" class="table_form form_width_100per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:12%;">
                        <col style="width:13%;">
                        <col style="width:12%;">
                        <col style="width:13%;">
                        <col style="width:12%;">
                        <col style="width:13%;">
                        <col style="width:12%;">
                        <col style="width:13%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.parOrdYn" /><!-- 부품오더 여부 --></th>
                            <td>
                                <input id="parOrdYn" name="parOrdYn" value="" class="form_comboBox" style="width:100%" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.parOrdDt" /><!-- 오더시간 --></th>
                            <td>
                                <input id="parOrdDt" name="parOrdDt" value="" class="form_datepicker ac" style="width:100%">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.parArrvDt" /><!-- 도착시간 --></th>
                            <td>
                                <input id="parArrvDt" name="parArrvDt" value="" class="form_datepicker ac" style="width:100%">
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.itemCd" /><!-- 부품번호 --></th>
                            <td>
                                <input id="itemCd" name="itemCd" value="" class="form_input ac" maxlength="18" style="width:100%" data-json-obj="true" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>

        <div class="header_area">
            <div class="btn_right">
            <dms:access viewId="VIEW-D-13284" hasPermission="${dms:getPermissionMask('READ')}"> 
                <button type="button" class="btn_s" id="btnExcelExport2"><spring:message code="global.btn.excelExport" /></button><!-- 저장 -->
            </dms:access> 
            <dms:access viewId="VIEW-D-11214" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s btn_save" id="btnActiveSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
            </dms:access>
            <dms:access viewId="VIEW-D-11215" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s btn_add"  id="btnAdd"><spring:message code="global.btn.rowAdd" /></button><!-- 행추가 -->
            </dms:access>
            <dms:access viewId="VIEW-D-11216" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s btn_cancel" id="btnCancel"><spring:message code="global.btn.cancel" /></button>
            </dms:access>
            </div>
        </div>

        <div class="table_grid">
            <div id="activeGrid"></div>
        </div>

        <!--  ************************** 제조사처리배정 팝업 **************************** -->
        <section id="vocStat94Popup" class="pop_wrap">
            <div class="header_area">
                <div class="btn_right">
                    <button type="button" class="btn_s" id="btnVocStat94Popup"><spring:message code="global.btn.assign" /><!-- 배정 --></button>
                    <button type="button" class="btn_s" id="btnCancel94Popup"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
                </div>
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
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.manufacturer" /><!-- 제조사/특약점 --></th>
                            <td colspan="3">
                                <input type="text" id="manufacturerAppendSiebel" name="manufacturerAppendSiebel" class="form_input" maxlength="50" style="width:100%" disabled />
                            </td>
                            <th scope="row"><spring:message code='global.lbl.realPprocId' /><!-- 실처리인 --></th>
                            <td colspan="3">
                                <input type="hidden" id="pprocIdInputSiebel" name="pprocIdInputSiebel" />
                                <div class="form_search" onclick="pprocSearchPopOpen('RP');" >
                                    <input type="text" id="pprocNmInputSiebel" name="pprocNmInputSiebel" readOnly class="form_input" style="width:100%" />
                                    <a href="javascript:;"><spring:message code="global.btn.search" /><!-- 조회 --></a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.pprocDeptNm" /><!-- 처리부서 --></th>
                            <td colspan="3">
                                <input type="text" id="pprocDeptNmAppendSiebel" name="pprocDeptNmAppendSiebel" value="" readOnly class="form_input form_readonly" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.coopDeptNm" /><!-- 협조부서 --></th>
                            <td colspan="3">
                                <input type="text" id="coopDeptNmAppendSiebel" name="coopDeptNmAppendSiebel" class="form_input" maxlength="50" style="width:100%" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!--  ************************** 제조사처리배정 팝업 **************************** -->

        <!--  ************************** 반송 입력 팝업 **************************** -->
        <section id="vocStat99Popup" class="pop_wrap">
            <div class="header_area">
                <div class="btn_right">
                    <button type="button" class="btn_s" id="btnVocStat99Popup"><spring:message code="crm.btn.return" /><!-- 반송 --></button>
                    <button type="button" class="btn_s" id="btnCancel99Popup"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
                </div>
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
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.returnCauCont" /><!-- 반송원인 --></th>
                            <td colspan="7">
                                <textarea rows="10" cols="" id="returnCauContAppend" name="returnCauContAppend" class="form_textarea" maxlength="1000" data-name="<spring:message code="global.lbl.procRsltCont" />" ></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!--  ************************** 반송 입력 팝업 **************************** -->

        <!--  ************************** 처리 결과 입력 팝업 **************************** -->
        <section id="vocStat03Popup" class="pop_wrap">
            <div class="header_area">
                <div class="btn_right">
                    <button type="button" class="btn_s" id="btnVocStat03Popup"><spring:message code="crm.btn.proce" /><!-- 처리 --></button>
                    <button type="button" class="btn_s" id="btnCancel03Popup"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
                </div>
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
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.procRsltCont" /><!-- 처리결과 --></th>
                            <td colspan="7">
                                <textarea rows="10" cols="" id="procRsltContAppend" name="procRsltContAppend" class="form_textarea" maxlength="1000" data-name="<spring:message code="global.lbl.procRsltCont" />" ></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!--  ************************** 처리 결과 입력 팝업 **************************** -->

        <!--  ************************** 설문완료 CLOSE 입력 팝업 **************************** -->
        <section id="vocStat05Popup" class="pop_wrap">
            <div class="header_area">
                <%-- <h2 class="title_basic">VOC 불만 처리</h2> --%>
                <div class="btn_right">
                    <button type="button" class="btn_s" id="btnVocStat05Popup"><spring:message code="crm.btn.vocComplet" /><!-- 서비스요청CLOSE --></button>
                    <button type="button" class="btn_s" id="btnVocStat97Popup"><spring:message code="crm.btn.returnToProc" /><!-- 처리상태로반송 --></button>
                    <button type="button" class="btn_s" id="btnVocStat96Popup"><spring:message code="crm.btn.returnToCustFU" /><!-- 고객F/U로 반송 --></button>
                    <button type="button" class="btn_s" id="btnCancel05Popup"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
                </div>
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
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.pconStsfIvst" /><!-- 문의만족도 --></th>
                            <td colspan="3">
                                <input id="cmplStsfNmAppend" name="cmplStsfNmAppend" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.stsfIvstRsltCont" /><!-- 설문결과 --></th>
                            <td colspan="3" rowspan="4">
                                <textarea maxlength="1000" id="stsfIvstRsltContAppend" name="stsfIvstRsltContAppend" rows="7" cols=""  class="form_textarea" ></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th></th>
                            <td></td>
                            <td colspan="3">
                            </td>
                        </tr>
                        <tr>
                            <th></th>
                            <td></td>
                            <td colspan="3">
                            </td>
                        </tr>
                        <tr>
                            <th></th>
                            <td></td>
                            <td colspan="3">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!--  ************************** 설문완료 CLOSE 입력 팝업 **************************** -->

        <!--  ************************** 고객내방대기 팝업 **************************** -->
        <section id="vocStat08Popup" class="pop_wrap">
            <div class="header_area">
                <div class="btn_right">
                    <button type="button" class="btn_s" id="btnVocStat08Popup"><spring:message code="crm.btn.proce" /><!-- <!-- 확인 --></button>
                    <button type="button" class="btn_s" id="btnCancel08Popup"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
                </div>
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
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.custVsitPlan" /><!-- 고객내방대기방안 --></th>
                            <td colspan="7">
                                <textarea rows="10" cols="" id="custVsitPlan" name="custVsitPlan" class="form_textarea" maxlength="1000" data-name="<spring:message code="global.lbl.procRsltCont" />" ></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!--  ************************** 고객내방대기 팝업 **************************** -->

        <!--  ************************** 고객F/U중 입력 팝업 **************************** -->
        <section id="vocStat09Popup" class="pop_wrap">
            <div class="header_area">
                <div class="btn_right">
                    <button type="button" class="btn_s" id="btnVocStat09Popup"><spring:message code="crm.btn.proce" /><!-- <!-- 확인 --></button>
                    <button type="button" class="btn_s" id="btnVocStat95Popup"><spring:message code="crm.btn.procReturn" /><!-- <!-- 처리로반송 --></button>
                    <button type="button" class="btn_s" id="btnCancel09Popup"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
                </div>
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
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.custFUResult" /><!-- 고객F/U결과 --></th>
                            <td colspan="7">
                                <textarea rows="10" cols="" id="custFUResult" name="custFUResult" class="form_textarea" maxlength="1000" data-name="<spring:message code="global.lbl.procRsltCont" />" ></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!--  ************************** 고객F/U중 입력 팝업 **************************** -->

        <!--  ************************** 녹취파일 팝업 **************************** -->
        <section id="vocRecFilePopup" class="pop_wrap">
            <div class="header_area">
                <audio id="audioPlayer" controls style="width:100%;" ></audio>
            </div>
        </section>
        <!--  ************************** 녹취파일 팝업 **************************** -->

    </section>
    <!-- //기본정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">


    /*****************************************************************************
     ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
     *******************************************************************************/
     // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
     $("#activeGrid").on("dblclick", "tr.k-state-selected", function (e) {

         var gridId = e.delegateTarget.id
           , grid = $("#"+gridId+"").data("kendoExtGrid")
           , selectedItem = grid.dataItem(grid.select())
         ;

         if ( dms.string.isNotEmpty(selectedItem.recFileId) ){
             recFileDown("A");
         } else {
             return;
         }

     });

    //VOC활동 - 알람, CRM Email Activity Flag 체크 이벤트 처리
    $("#activeGrid").on("click", "input.emailActiveCd", function(e){
        var activeGrid = $("#activeGrid").data("kendoExtGrid");
        var dataItem = activeGrid.dataSource.getByUid($(this).data("uid"));
        $(this).prop("checked") == true? dataItem.emailActiveCd="Y":dataItem.emailActiveCd="N";
    });
    $("#activeGrid").on("click", "input.alrtCd", function(e){
        var activeGrid = $("#activeGrid").data("kendoExtGrid");
        var dataItem = activeGrid.dataSource.getByUid($(this).data("uid"));
        $(this).prop("checked") == true? dataItem.alrtCd="Y":dataItem.alrtCd="N";
    });

    var popupWindow;
    var messagePopupWindow;
    var obCallPopupWindow;

    var vocInputMode = "N";
    var vocCustSearchPopup = "N";

    var isGridReload = false      // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
    var resultKey                 // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )



    var vocTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //VOC유형코드 / CRM604
    <c:forEach var="obj" items="${vocTpCdList}">
        vocTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>


    var vocStatCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //VOC상태코드 / CRM624
    <c:forEach var="obj" items="${vocStatCdList}">
        vocStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var tendCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //성향코드 / CRM609
    <c:forEach var="obj" items="${tendCdList}">
        tendCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var acptSrcCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //접수출처코드 / CRM602
    <c:forEach var="obj" items="${acptSrcCdList}">
        acptSrcCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var activeGainPathCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //활동 획득 경로 코드 / CRM615
    <c:forEach var="obj" items="${activeGainPathCdList}">
        activeGainPathCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var bhmcYnList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; // 서비스요청출처
    bhmcYnList.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='crm.lbl.factory' />"});
    bhmcYnList.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='ser.lbl.dealer' />"});

    var cmplCauCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //불만원인코드 / CRM601
    <c:forEach var="obj" items="${cmplCauCdList}">
        cmplCauCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var prorCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //우선순위코드 / CRM623
    <c:forEach var="obj" items="${prorCdList}">
        prorCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var procLmtCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //처리시한 코드 / CRM616
    <c:forEach var="obj" items="${procLmtCdList}">
        procLmtCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var pmoCauCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //승급 원인 코드 / CRM620
    <c:forEach var="obj" items="${pmoCauCdList}">
        pmoCauCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var sendCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //발송상태 / CRM629
    <c:forEach var="obj" items="${sendCdList}">
        sendCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var salesActiveSrcCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //영업활동정보출처 / CRM630
    <c:forEach var="obj" items="${salesActiveSrcCdList}">
        salesActiveSrcCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var vocTpSub1CdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //1급 SUB 유형 / CRM605
    <c:forEach var="obj" items="${vocTpSub1CdList}">
        vocTpSub1CdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var cmplStsfNmList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //문의만족도 / CRM628
    <c:forEach var="obj" items="${cmplStsfNmList}">
        cmplStsfNmList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var crm030List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //고객 및 연계인 관계
    <c:forEach var="obj" items="${crm030List}">
        crm030List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>



    /*  RO 예약 버튼
     *   1급sub유형 : 01(BM) / 2급 sub유형 : (8)보통예약서비스
     *   1급sub유형 : 03(정비) / 2급 sub유형 : (26) 서비스과정
     */
    function getRoType(){

        var isRo = false;
        var vocTpSub1Cd = $("#vocTpSub1Cd").data("kendoExtDropDownList").value();
        var vocTpSub2Cd = $("#vocTpSub2Cd").data("kendoExtDropDownList").value();

        if ( ( vocTpSub1Cd === "01" && vocTpSub2Cd === "8" ) || ( vocTpSub1Cd === "03" && vocTpSub2Cd === "26" ) ) {
            isRo = true;
        };

        return isRo;

    };

    /*  긴급구조여부
     *   1급sub유형 : 01(bluemembers서비스 / bluemembers服务) / 2급 sub유형 : 14(긴급구조 / 道路救援)
     *   1급sub유형 : 03(bluemembers서비스 / bluemembers服务) / 2급 sub유형 : 33(긴급구조 / 道路救援)
     */
    function getEmgcRescType(){

        var isEmgcResc = false;

        var vocTpSub1Cd = $("#vocTpSub1Cd").val();
        var vocTpSub2Cd = $("#vocTpSub2Cd").val();

        if ( (vocTpSub1Cd === "01" && vocTpSub2Cd === "14" ) || (vocTpSub1Cd === "03" && vocTpSub2Cd === "33") ) {
            isEmgcResc = true;
        };

        return isEmgcResc;

    };

    // VOC 버튼 제어
    function btnActive(vocStatCd, vocTpCd){

        var btnId = vocStatCd;
        btnId = "btnVocStat"+btnId;

        if ( vocTpCd === "01" || vocTpCd === "03" || vocTpCd === "04" ) {

            if ( btnId === "btnVocStat01" ) {
//                  console.log("*신규 | 접수");
                $("#btnVocStat00").data("kendoButton").enable(true);    //수정
                $("#btnVocStat01").data("kendoButton").enable(true);    //접수

            } else if ( btnId === "btnVocStat03" ) {
//                 console.log("*처리대기 | 처리");
                $("#btnVocStat00").data("kendoButton").enable(true);    //수정(처리자)
                $("#btnVocStat03").data("kendoButton").enable(true);    //처리(처리자)
                $("#btnVocStat03Popup").data("kendoButton").enable(true);    //처리
                $("#btnCancel03Popup").data("kendoButton").enable(true);    //취소

            } else if ( btnId === "btnVocStat05" ) {
//                 console.log("*처리완료 설문대기");
                $("#btnVocStat07").data("kendoButton").enable(true);    //설문안하고C
                $("#btnVocStat05").data("kendoButton").enable(true);    //설문완료C
                $("#btnVocStat05Popup").data("kendoButton").enable(true);
                $("#btnVocStat97Popup").data("kendoButton").enable(true);
                $("#btnVocStat96Popup").data("kendoButton").enable(true);
                $("#btnCancel05Popup").data("kendoButton").enable(true);

            } else if ( btnId === "btnVocStat09" ) {
//                 console.log("*고객F/U");
                $("#btnVocStat00").data("kendoButton").enable(true);    //수정
                $("#btnVocStat03").data("kendoButton").enable(true);    //처리
                $("#btnVocStat03Popup").data("kendoButton").enable(true);    //처리
                $("#btnCancel03Popup").data("kendoButton").enable(true);    //취소

            };

        } else if ( vocTpCd === "02" ) {

            if ( btnId === "btnVocStat01" ) {
//                 console.log("*신규 | 접수");
                $("#btnVocStat00").data("kendoButton").enable(true);    //수정
                $("#btnVocStat01").data("kendoButton").enable(true);    //접수

            } else if ( btnId === "btnVocStat03" ) {
//                 console.log("*처리대기 | 처리");
                $("#btnVocStat00").data("kendoButton").enable(true);    //수정(처리자)
                $("#btnVocStat08").data("kendoButton").enable(true);    //고객내방대기

//                // 20161101 siebel 화면 확인해서 프로세스 추가 , 딜러/클레임인경우 고객내방대기 -> 처리 가능
                $("#btnVocStat03").data("kendoButton").enable(true);    //처리(처리자)
                $("#btnVocStat03Popup").data("kendoButton").enable(true);    //처리
                $("#btnCancel03Popup").data("kendoButton").enable(true);    //취소

            } else if ( btnId === "btnVocStat08" ) {
//                 console.log("*고객내방대기");
                $("#btnVocStat09").data("kendoButton").enable(true);    //고객F/U
                $("#btnVocStat09Popup").data("kendoButton").enable(true);
                $("#btnVocStat95Popup").data("kendoButton").enable(true);
                $("#btnCancel09Popup").data("kendoButton").enable(true);

            } else if ( btnId === "btnVocStat09" ) {
//                 console.log("*고객F/U");
                $("#btnVocStat00").data("kendoButton").enable(true);    //수정
                $("#btnVocStat03").data("kendoButton").enable(true);    //처리

            } else if ( btnId === "btnVocStat05" ) {
//                 console.log("*처리완료 설문대기");
                $("#btnVocStat05").data("kendoButton").enable(true);    //설문완료C
                $("#btnVocStat07").data("kendoButton").enable(true);    //설문안하고C

            };

        };


        // 긴급구조
        if ( getEmgcRescType() ) {

            // 버튼 초기화
            btnDisabled();

            // 실처리인 정보가 없으면 배정버튼 활성화
            if (  dms.string.isEmpty($("#realPprocId").val()) ) {

                //$("#btnVocStat02").data("kendoButton").enable(true);        //배정

            // 실처리인 정보가 있으면 배정 완료된것이므로 처리 버튼 활성화, 아니면
            } else if ( dms.string.isNotEmpty($("#realPprocId").val()) ) {

                $("#btnVocStat03").data("kendoButton").enable(true);        //처리
                $("#btnVocStat03Popup").data("kendoButton").enable(true);   //처리  POPUP
                $("#btnCancel03Popup").data("kendoButton").enable(true);    //처리  POPUP

            };

        };

        $("#btnVocStatRO").data("kendoButton").enable(false);      //RO예약

        if ( dms.string.isNotEmpty($("#vocNo").val()) ) {
            $("#btnVocStatLEAD").data("kendoButton").enable(true);      //리드생성
        };

        return;

    };

    // VOC 버튼 제어
    function btnActiveBack(vocStatCd, vocTpCd){

        var btnId = vocStatCd;
        btnId = "btnVocStat"+btnId;

//         console.log("vocStatCd : ",vocStatCd);

        if ( vocTpCd === "01" || vocTpCd === "03" || vocTpCd === "09" ) {

            if ( btnId === "btnVocStat01" ) {
//                 console.log("*신규 | 접수");

                $("#btnVocStat01").data("kendoButton").enable(true);    //접수
                $("#btnVocStat00").data("kendoButton").enable(true);    //수정
                $("#btnVocStat07").data("kendoButton").enable(true);    //설문안하고C


            } else if ( btnId === "btnVocStat99" ) {
//                 console.log("*반송");
                $("#btnVocStat01").data("kendoButton").enable(true);    //접수
                $("#btnVocStat00").data("kendoButton").enable(true);    //수정
                $("#btnVocStat07").data("kendoButton").enable(true);    //설문안하고C

            } else if ( btnId === "btnVocStat00" ) {
//                 console.log("수정");
            } else if ( btnId === "btnVocStat02" ) {
//                 console.log("*심사대기 | 심사배정");

                $("#btnVocStat00").data("kendoButton").enable(true);    //수정
//                 $("#btnVocStat99").data("kendoButton").enable(true);    //반송(배정자)


            <dms:access viewId="VIEW-D-10277" hasPermission="${dms:getPermissionMask('READ')}">
                $("#btnVocStat94").data("kendoButton").enable(true);    //심사배정(배정자)
            </dms:access>



            } else if ( btnId === "btnVocStat03" ) {
//                 console.log("*처리대기 | 처리");

                $("#btnVocStat00").data("kendoButton").enable(true);    //수정(처리자)
                $("#btnVocStat03").data("kendoButton").enable(true);    //처리(처리자)

            } else if ( btnId === "btnVocStat09" ) {
//                 console.log("*고객F/U");
                $("#btnVocStat00").data("kendoButton").enable(true);    //수정
                $("#btnVocStat03").data("kendoButton").enable(true);    //처리

            } else if ( btnId === "btnVocStat05" ) {
//                 console.log("*처리완료 설문대기");

                $("#btnVocStat05").data("kendoButton").enable(true);    //설문완료C
                $("#btnVocStat07").data("kendoButton").enable(true);    //설문안하고C


            } else if ( btnId === "btnVocStat05" ) {

//                 console.log("*설문완료 C");

            } else if ( btnId === "btnVocStat07" ) {

//                 console.log("*설문안하고C");

            };

        } else if ( vocTpCd === "02" ) {

            if ( btnId === "btnVocStat01" ) {
//                 console.log("*신규 | 접수");

                $("#btnVocStat01").data("kendoButton").enable(true);    //접수
                $("#btnVocStat00").data("kendoButton").enable(true);    //수정

            } else if ( btnId === "btnVocStat02" ) {
//                 console.log("*심사대기 | 심사배정");

                $("#btnVocStat00").data("kendoButton").enable(true);    //수정
//                 $("#btnVocStat99").data("kendoButton").enable(true);    //반송(배정자)

            <dms:access viewId="VIEW-D-10277" hasPermission="${dms:getPermissionMask('READ')}">
                $("#btnVocStat94").data("kendoButton").enable(true);    //심사배정(배정자)
            </dms:access>

            } else if ( btnId === "btnVocStat03" ) {
//                 console.log("*처리대기 | 처리");

                $("#btnVocStat00").data("kendoButton").enable(true);    //수정(처리자)
                $("#btnVocStat03").data("kendoButton").enable(true);    //처리(처리자)
                $("#btnVocStat08").data("kendoButton").enable(true);    //고객내방대기

            } else if ( btnId === "btnVocStat08" ) {
//                 console.log("*고객내방대기");
                $("#btnVocStat09").data("kendoButton").enable(true);    //고객F/U

            } else if ( btnId === "btnVocStat09" ) {
//                 console.log("*고객F/U");
                $("#btnVocStat00").data("kendoButton").enable(true);    //수정
                $("#btnVocStat03").data("kendoButton").enable(true);    //처리

            } else if ( btnId === "btnVocStat05" ) {
//                 console.log("*처리완료 설문대기");

                $("#btnVocStat05").data("kendoButton").enable(true);    //설문완료C
                $("#btnVocStat07").data("kendoButton").enable(true);    //설문안하고C

            };

        };

        if ( dms.string.isNotEmpty($("#vocNo").val()) ) {
            $("#btnVocStatLEAD").data("kendoButton").enable(true);      //리드생성
        };

        return;

    };

    // VOC 상태 변경 프로세스 ( 버튼제어 )
    function vocStatUpdt(vocStatCd){

        // 02 : 접수 -> 심사대기
        // 99 : 반송 -> 접수
        // 03 : 접수대기 -> 배정 후 처리대기 /
        // 94 : 제조사처리대기 -> 배정 후 처리대기 /
        // 05 : 처리대기 -> 처리완료설문대기
        // 06 : 처리완료설문대기 -> 설문완료Close
        // 97 : 처리완료설문대기 -> 처리상태로 반송
        // 96 : 처리완료설문대기 -> 고객F/U로 반송
        // 07 : 처리완료설문대기 -> 설문안하고 Close
        // 08 : 처리대기 -> 고객내방대기  ( 클레임 )
        // 09 : 고객내방대기  / 딜러 : 고객내방대기 -> 고객 F/U 중 (클레임) / [제/클레임] 고객내방대기 -> 고객 F/U중
        // 95 : 고객내방대기 -> 고객F/U중 ( 클레임 ) -> 처리로 반송(97)

        var vocNo = $("#vocNo").val();
        var dlrCd = $("#dlrCd").val();
        var bhmcVocNo = $("#bhmcVocNo").val();
        var bhmcYn = $("#bhmcYn").val();
        var vocStatCd = vocStatCd;
        var bfVocStatCd = $("#bfVocStatCd").val();
        var custNm = $("#custNm").val();            // 배정시 알람 보내는데 param으로 필요
        var custNo = $("#custNo").val();
        var pconCustNm = $("#pconCustNm").val();
        var pconCustNo = $("#pconCustNo").val();
        var vocTpCd = $("#vocTpCd").val();
        var pprocDeptNm = $("#pprocDeptNm").val();

//         console.log("vocNo : "+vocNo+" | vocStatCd : "+vocStatCd+" | bhmcVocNo : "+bhmcVocNo)
        var json = {};
        json.vocNo = vocNo;
        json.bhmcVocNo = bhmcVocNo;
        json.bhmcYn = bhmcYn;
        json.dlrCd = dlrCd;
        json.vocStatCd = vocStatCd;
        json.bfVocStatCd = bfVocStatCd;
        json.custNm = custNm;
        json.custNo = custNo;
        json.pconCustNm = pconCustNm;
        json.pconCustNo = pconCustNo;
        json.vocTpCd = vocTpCd;
        json.pprocDeptNm = pprocDeptNm;

        if ( dms.string.isEmpty(vocNo) ) {
            // {VOC 번호}을(를) 확인하여 주세요.
            dms.notification.warning("<spring:message code='global.lbl.vocNo' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
            return false;
        };

        if ( dms.string.isEmpty(vocStatCd) ){
            // {상태}을(를) 확인하여 주세요.
            dms.notification.warning("<spring:message code='global.lbl.statNm' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
            return false;
        };

        if ( vocStatCd === "99" ) {
//             console.log("99 : 반송");
            var returnCauContAppend = $("#returnCauContAppend").val();
            var returnCauCont = $("#returnCauCont").val();

            if ( dms.string.isEmpty(returnCauContAppend) ) {
                // 반송원인 / 을(를) 입력해주세요.
                dms.notification.warning("<spring:message code='global.lbl.returnCauCont' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
                return;
            } else {
                json.returnCauCont = returnCauCont;
                json.returnCauContAppend = returnCauContAppend;
            };

        } else if ( vocStatCd === "94" ) {
//             console.log("94 : 제조사처리대기 -> 제조사처리배정");
            var pprocNmInput = $("#pprocNmInputSiebel").val();
            var pprocIdInput = $("#pprocIdInputSiebel").val();
            var pprocDeptNm = $("#pprocDeptNmAppendSiebel").val(); // 처리부서
            var coopDeptNmAppend = $("#coopDeptNmAppendSiebel").val();  // 협조부서

            /* if ( dms.string.isEmpty(pprocDeptNm) ) {
                // 처리부서 / 을(를) 입력해주세요.
                dms.notification.warning("<spring:message code='global.lbl.pprocDeptNm' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
                return;
            } else */

            if ( dms.string.isEmpty(pprocIdInput) ) {
                // 실처리인 / 을(를) 입력해주세요.
                dms.notification.warning("<spring:message code='global.lbl.realPprocId' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
                return;
            } else {
                json.pprocDeptNm = pprocDeptNm;
                json.coopDeptNm = coopDeptNmAppend;

                //배정시 - 딜러:처리인 / [제조사:실처리인]
                json.realPprocId = pprocIdInput;
                json.realPprocNm = pprocNmInput;
            };

        } else if ( vocStatCd === "05" ) {
//             console.log("05 : 처리대기 -> 처리완료설문대기");, 제조사에서 처리
            var procRsltContAppend = $("#procRsltContAppend").val();
            var procRsltCont = $("#procRsltCont").val();

            if ( dms.string.isEmpty(procRsltContAppend) ) {
                // 처리결과 / 을(를) 입력해주세요.
                dms.notification.warning("<spring:message code='global.lbl.procRsltCont' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
                return;
            } else {
                json.procRsltCont = procRsltCont;
                json.procRsltContAppend = procRsltContAppend;
            };

        } else if ( vocStatCd === "06" ) {
//             console.log("06 : 처리완료설문대기 -> 서비스요청 Close");
            var cmplStsfNm = $("#cmplStsfNmAppend").data("kendoExtDropDownList").value();
            var stsfIvstRsltContAppend = $("#stsfIvstRsltContAppend").val();
            var stsfIvstRsltCont = $("#stsfIvstRsltCont").val();

            if ( dms.string.isEmpty(cmplStsfNm) ) {
                // 문의만족도 / 을(를) 입력해주세요.
                dms.notification.warning("<spring:message code='crm.lbl.pconStsfIvst' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
                return;
            } else if ( dms.string.isEmpty(stsfIvstRsltContAppend) ) {
                // 설문결과/ 을(를) 입력해주세요.
                dms.notification.warning("<spring:message code='crm.lbl.stsfIvstRsltCont' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
                return;
            } else {
                json.cmplStsfNm = cmplStsfNm;
                json.stsfIvstRsltCont = stsfIvstRsltCont;
                json.stsfIvstRsltContAppend = stsfIvstRsltContAppend;
            };

        } else if ( vocStatCd === "97" ) {
//             console.log("97 : 처리완료설문대기 -> 처리상태로 반송");
            var stsfIvstRsltContAppend = $("#stsfIvstRsltContAppend").val();
            var stsfIvstRsltCont = $("#stsfIvstRsltCont").val();

            if ( dms.string.isEmpty(stsfIvstRsltContAppend) ) {
                // 설문결과/ 을(를) 입력해주세요.
                dms.notification.warning("<spring:message code='crm.lbl.stsfIvstRsltCont' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
                return;
            } else {
                json.stsfIvstRsltCont = stsfIvstRsltCont;
                json.stsfIvstRsltContAppend = stsfIvstRsltContAppend;
            };


        } else if ( vocStatCd === "96" ) {
//             console.log("96 : 처리완료설문대기 -> 고개F/U로 반송");
            var stsfIvstRsltContAppend = $("#stsfIvstRsltContAppend").val();

            if ( dms.string.isEmpty(stsfIvstRsltContAppend) ) {
                // 설문결과/ 을(를) 입력해주세요.
                dms.notification.warning("<spring:message code='crm.lbl.stsfIvstRsltCont' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
                return;
            } else {
                json.stsfIvstRsltContAppend = stsfIvstRsltContAppend;
            };

        } else if ( vocStatCd === "07" ) {
            //console.log("07 : 처리완료설문대기 -> 설문안하고 Close");

        } else if ( vocStatCd === "08" ) {
            //console.log("08 : 처리대기 -> 고객내방대기  ( 클레임 )");
            var custVsitPlan = $("#custVsitPlan").val();

            if ( dms.string.isEmpty(custVsitPlan) ) {
                // 고객내방대기방안 / 을(를) 입력해주세요.
                dms.notification.warning("<spring:message code='crm.lbl.custVsitPlan' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
                return;
            } else {
                json.custVsitPlan = custVsitPlan;
            };

        } else if ( vocStatCd === "09" ) {
            //console.log("09 : 고객내방대기 / 제조사처리대기(03) -> 고객F/U중 ( 클레임 )");

            var custFUResult = $("#custFUResult").val();

            if ( dms.string.isEmpty(custFUResult) ) {
                // 고객F/U결과 / 을(를) 입력해주세요.
                dms.notification.warning("<spring:message code='crm.lbl.custFUResult' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
                return;
            } else {
                json.custFUResult = custFUResult;
            };

        } else if ( vocStatCd === "95" ) {
//             console.log("95 : 고객내방대기 -> 고객F/U중 ( 클레임 ) -> 처리로 반송(97)");
        };

        //console.log("voc stat update param : ",JSON.stringify(json));
        //return;

        $.ajax({
             url:"<c:url value='/crm/crq/vocMgmt/updateVocStatCd.do' />"
            ,data:JSON.stringify(json)
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
            ,error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            }
            ,success:function(data) {
                dms.notification.success("<spring:message code='global.info.success'/>");
                $("#vocGrid").data("kendoExtGrid").dataSource.read();
                vocInputMode = "N";

                // 팝업 close
                var closeStatCd;

                // 07인경우는 close 없음.
                if ( vocStatCd !== "07" ) {

                    if ( vocStatCd === "05" ) {
                        closeStatCd = "03"
                    } else if ( vocStatCd === "06" || vocStatCd === "97"  || vocStatCd === "96" ) {
                        closeStatCd = "05"
                    } else if ( vocStatCd === "95" ) {
                        closeStatCd = "09"
                    } else {
                        closeStatCd = vocStatCd;
                    };

                    var win = $("#vocStat"+closeStatCd+"Popup").data("kendoWindow");
                    win.close();

                };

                initForm();
                readOnlyDefualtForm(true);

            }
            ,beforeSend:function(xhr) {
                dms.loading.show();
            }
            ,complete:function(xhr, status) {
                dms.loading.hide();
            }
        });

    };



    // VOC 저장
    function vocSave(){

        // 화면 필수 체크
        if ( dms.string.isEmpty($("#vocTpCd").val())){     // VOC 유형
            dms.notification.warning("<spring:message code='global.lbl.type' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            $("#vocTpCd").focus();
            return false;
        } else {

            //우선순위 : 긴급구조 > 클레임
            if ( !getEmgcRescType() ) {
                if($("#vocTpCd").val() === "02"){
                    if ( dms.string.isEmpty($("#cmplCauCd").val())){       //유형이 불만인경우 불만이유 필수
                        dms.notification.warning("<spring:message code='global.lbl.cmplCauCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        $("#cmplCauCd").focus();
                        return false;
                    };
                };
            };

        };

        if ( dms.string.isEmpty($("#tendCd").val())){      // 성향
            dms.notification.warning("<spring:message code='global.lbl.tendCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            $("#tendCd").focus();
            return false;
        };

        if ( $("#vocTpCd").val() !== "04"){ // VOC 유형

            if ( dms.string.isEmpty($("#vocTpSubCd").val())){ // VOC 하위 유형
                dms.notification.warning("<spring:message code='crm.lbl.vocTpSubCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#vocTpSubCd").focus();
                return false;
            };

        };

        if ( dms.string.isEmpty($("#vocTpSub1Cd").val())){ // 1급유형
            dms.notification.warning("<spring:message code='global.lbl.vocTpSub1Cd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            $("#vocTpSub1Cd").focus();
            return false;
        };

        if ( dms.string.isEmpty($("#vocTpSub2Cd").val())){ // 2급유형
            dms.notification.warning("<spring:message code='global.lbl.vocTpSub2Cd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            $("#vocTpSub2Cd").focus();
            return false;
        };

        if ( dms.string.isEmpty($("#acptSrcCd").val())){   // 접수경로
            dms.notification.warning("<spring:message code='global.lbl.acptSrcCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            $("#acptSrcCd").focus();
            return false;
        };

        if ( dms.string.isEmpty($("#prorCd").val())){      // 중요성
            dms.notification.warning("<spring:message code='global.lbl.prorCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            $("#prorCd").focus();
            return false;
        };

        if ( dms.string.isEmpty($("#custNm").val())){      // 고객명
            dms.notification.warning("<spring:message code='global.lbl.custNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            $("#custNm").focus();
            return false;

        };
        if ( dms.string.isEmpty($("#custNo").val()) && dms.string.isEmpty($("#receiveTelNo").val()) ){      // 고객명
            // {고객명 또는 수신전화번호}은(는) 필수 입력사항 입니다. // TODO 메시지소스 확인 crm.lbl.custNohpNoChk
            dms.notification.warning("<spring:message code='global.lbl.custNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            if ( dms.string.isEmpty($("#custNo").val()) ) {
                $("#custNm").focus();
            }else{
                $("#receiveTelNo").focus();
            };
            return false;
        };

        if ( dms.string.isEmpty($("#acptDt").val())){      // 접수시간
            dms.notification.warning("<spring:message code='global.lbl.acptDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            $("#acptDt").focus();
            return false;
        };

        // 처리인
        if ( dms.string.isEmpty($("#pprocId").val()) ) {
            pprocSearchPopOpen('P1');
            return false;
        };

        /*  20170201 신파 18 : 처리인 선택시 처리부서 자동선택 으로 수정. 필수값 삭제
        // 처리부서
        if ( dms.string.isEmpty($("#pprocDeptNm").val()) ) {
            dms.notification.warning("<spring:message code='global.lbl.pprocDeptNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            return false;
        };
         */

        // 콜센터 의견
        if ( dms.string.isEmpty($("#callCenOpnCont").val()) ) {
            dms.notification.warning("<spring:message code='global.lbl.callCenOpnCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            return false;
        };

        $("#vocNo").prop("readonly", false);

        var json = $("#defaultInfoForm").serializeObject(
                $("#defaultInfoForm").serializeArrayInSelector("[data-json-obj='true']")
        )

        json.vocTpCd = $("#vocTpCd").data("kendoExtDropDownList").value(); // 상세조회시 VOC 유형은 수정불가 (enabel:false). 따라서 값을 가져와야함.
        json.vocStatCd = "03";  // 20170201 - VOC 상태는 바로 처리대기로..

        json.hpNo = $("#hpNo").val();
        json.acptDeptNm = $("#acptDeptNm").val();
        json.pacptId = $("#pacptId").val();
        json.pacptNm = $("#pacptNm").val();
        json.parOrdYn = $("#parOrdYn").data("kendoExtDropDownList").value();
        json.bfPconRelCd = $("#bfPconRelCd").val();

        json.pprocDeptNm = $("#pprocDeptNm").val();
        json.pconCustHpNo = $("#pconCustHpNo").val();

        if ($("#cmplReAcptYn").prop("checked")){
            json.cmplReAcptYn = "Y"
        }else{
            json.cmplReAcptYn = "N"
        };

        if ($("#dlrCmpCommYn").prop("checked")){
            json.dlrCmpCommYn = "Y"
        }else{
            json.dlrCmpCommYn = "N"
        };

        // voc 상태에 따라서 추가 정보 정보 set ( )
        if ( json.vocTpCd === "02" ) {

            json.cmplStsfNm = json.cmplStsfNm02;
            json.saleDt = $("#saleDt02").data("kendoExtMaskedDateTimePicker").value();

            delete json.cmplStsfNm01;
            delete json.cmplStsfNm02;
            delete json.saleDt01;
            delete json.saleDt02;

        } else {

            json.cmplStsfNm = json.cmplStsfNm01;
            json.saleDt = $("#saleDt01").data("kendoExtMaskedDateTimePicker").value();

            delete json.cmplStsfNm01;
            delete json.cmplStsfNm02;
            delete json.saleDt01;
            delete json.saleDt02;

        };

        json.acptDt = $("#acptDt").data("kendoExtMaskedDateTimePicker").value();
        json.vocEndDt = $("#vocEndDt").data("kendoExtMaskedDateTimePicker").value();
        json.resvDt = $("#resvDt").data("kendoExtMaskedDateTimePicker").value();
        json.acptDt = $("#acptDt").data("kendoExtMaskedDateTimePicker").value();
        json.mthAchvHm = $("#mthAchvHm").data("kendoExtMaskedDateTimePicker").value();
        json.traceDt = $("#traceDt").data("kendoExtMaskedDateTimePicker").value();
        json.evalAllocDt = $("#evalAllocDt").data("kendoExtMaskedDateTimePicker").value();
        json.pmoDt = $("#pmoDt").data("kendoExtMaskedDateTimePicker").value();
        json.procDt = $("#procDt").data("kendoExtMaskedDateTimePicker").value();
        json.stsfIvstDt = $("#stsfIvstDt").data("kendoExtMaskedDateTimePicker").value();
        json.parOrdDt = $("#parOrdDt").data("kendoExtMaskedDateTimePicker").value();
        json.parArrvDt = $("#parArrvDt").data("kendoExtMaskedDateTimePicker").value();

        var url = "";

        if ( vocInputMode == "N" ) {
            url = "<c:url value='/crm/crq/vocMgmt/insertVocMgmts.do' />";
        } else if ( vocInputMode == "U" ) {
            url = "<c:url value='/crm/crq/vocMgmt/updateVocMgmts.do' />";
        } else {
            return;
        };

        //console.log("### : ",JSON.stringify(json))
        //return;
        $.ajax({
            url:url
            ,dataType:"json"
            ,type:"POST"
            ,contentType:"application/json"
            ,data:JSON.stringify(json)
            ,error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            }
            ,success:function(vocNo, textStatus) {
                dms.notification.success("<spring:message code='global.info.success'/>");
                $("#vocGrid").data("kendoExtGrid").dataSource.read();

                if ( dms.string.isNotEmpty(vocNo) ) {

                    var activeGrid = $("#activeGrid").data("kendoExtGrid");

                    if( activeGrid._data.length === 1 ) {

                        var dataItem = activeGrid._data[0]
                        dataItem.vocNo = vocNo;

                        var gridActive = $("#activeGrid").data("kendoExtGrid");
                        var saveData = gridActive.getCUDData("insertList", "updateList", "deleteList", ["regDtFormat", "startDtFormat", "endDtFormat", "pgssHmFormat", "expcStartDtFormat", "expcEndDtFormat", "callStartDtFormat", "callEndDtFormat"]);

                        vocActiveInsert(saveData);
                    }

                };

                initForm();
                readOnlyDefualtForm(true);

            }
            ,beforeSend:function(xhr) {
                dms.loading.show();
            }
            ,complete:function(xhr, status) {
                dms.loading.hide();
            }
        });


    };

    /**
     * VOC 유형 / 1급 SUB 유형 / 2급 SUB 유형에 따른 상태 조회(값 셋팅시에만 사용함)
     */
    function onSelectVocTpSubCdSet(grpCd, cmmCd) {

        var param ={
                "sCmmGrpCd":grpCd
                ,"cmmCd":cmmCd
        };

        var responseJson = dms.ajax.getJson({
            url:_contextPath + "/crm/crq/vocMgmt/selectVocTpSubCdList.do"
            ,data:JSON.stringify(param)
            ,async:false
        });

        var vocTpSubDatsSource = responseJson.data;

        if ( grpCd === "CRM606" ) {

            if ( vocTpSubDatsSource.length > 0 ) {
                $("#vocTpSub3Cd").data("kendoExtDropDownList").setDataSource([]);
                $("#vocTpSub3Cd").data("kendoExtDropDownList").enable(false);

                $("#vocTpSub2Cd").data("kendoExtDropDownList").setDataSource(vocTpSubDatsSource);
                $("#vocTpSub2Cd").data("kendoExtDropDownList").enable(true);
            }

        } else if ( grpCd === "CRM607" ) {

            if ( vocTpSubDatsSource.length > 0 ) {
                $("#vocTpSub3Cd").data("kendoExtDropDownList").setDataSource(vocTpSubDatsSource);
                $("#vocTpSub3Cd").data("kendoExtDropDownList").enable(true);
            } else {
                $("#vocTpSub3Cd").data("kendoExtDropDownList").setDataSource([]);
                $("#vocTpSub3Cd").data("kendoExtDropDownList").enable(false);
            }

        } else if ( grpCd === "CRM617" ) {

            if ( vocTpSubDatsSource.length > 0 ) {
                $("#vocTpSubCd").data("kendoExtDropDownList").setDataSource(vocTpSubDatsSource);
                $("#vocTpSubCd").data("kendoExtDropDownList").enable(true);
            } else {
                $("#vocTpSubCd").data("kendoExtDropDownList").setDataSource([]);
                $("#vocTpSubCd").data("kendoExtDropDownList").enable(false);
            }

        };

    };

    // 성코드
    var sungCdList = [];
    <c:forEach var="obj" items="${sungCdInfo}">
        sungCdList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
    </c:forEach>

    //성코드에 따른 도시코드 조회(값 셋팅시에만 사용)
    function onSelectSungCdSet(value) {

        $("#cityCd").data("kendoExtDropDownList").setDataSource([]);
        $("#cityCd").data("kendoExtDropDownList").enable(true);

        if(value == ""){
            $("#cityCd").data("kendoExtDropDownList").setDataSource([]);
            $("#cityCd").data("kendoExtDropDownList").enable(false);
            return false;
        }

        var responseJson = dms.ajax.getJson({
            url:_contextPath + "/crm/crq/vocMgmt/selectCityCdList.do"
            ,data:JSON.stringify({"cmmCd":value})
            ,async:false
        });

        $("#cityCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

    };

    // 차종
    var carlineList = [];
    <c:forEach var="obj" items="${carLineCdInfo}">
        carlineList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
    </c:forEach>

    //차종에 따른 모델 조회(값 셋팅시에만 사용)
    function onSelectCarlineCdSet(value) {

            var responseJson = dms.ajax.getJson({
            url:_contextPath + "/sal/veh/vehicleMaster/selectModel.do"
            ,data:JSON.stringify({"carlineCd":value})
            ,async:false
        });

//             console.log("responseJson.data: ",responseJson.data)

        $("#modelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);

    };

    /**
    * 모델에 따른 OCN 조회(값 셋팅시에만 사용)
    */
    function onSelectModelCdSet(value) {

        var responseJson = dms.ajax.getJson({
            url:_contextPath + "/sal/veh/vehicleMaster/selectOcn.do"
            ,data:JSON.stringify({"modelCd":value})
            ,async:false
        });

        $("#ocnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
    };
    /**
     * 차종에 따른 모델 조회
     */
     function onSelectCarlineCd(e) {
         var dataItem = this.dataItem(e.item);

         $("#modelCd").data("kendoExtDropDownList").setDataSource([]);
         $("#modelCd").data("kendoExtDropDownList").enable(true);

         if(dataItem.carlineCd == ""){
             $("#modelCd").data("kendoExtDropDownList").setDataSource([]);
             $("#modelCd").data("kendoExtDropDownList").enable(false);

             $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
             $("#ocnCd").data("kendoExtDropDownList").enable(false);

             return false;
         }

         var responseJson = dms.ajax.getJson({
             url:_contextPath + "/sal/veh/vehicleMaster/selectModel.do"
             ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
             ,async:false
         });

         $("#modelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
         $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);

     };
     /**
     * 모델에 따른 OCN 조회
     */
     function onSelectModelCd(e) {
         var dataItem = this.dataItem(e.item);

         $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
         $("#ocnCd").data("kendoExtDropDownList").enable(true);

         if(dataItem.modelCd == ""){
             $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
             $("#ocnCd").data("kendoExtDropDownList").enable(false);
             return false;
         }

         var responseJson = dms.ajax.getJson({
             url:_contextPath + "/sal/veh/vehicleMaster/selectOcn.do"
             ,data:JSON.stringify({"modelCd":dataItem.modelCd})
             ,async:false
         });

         $("#ocnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
     };

    /************************************************************************************
    ************************** VOC 활동 드롭다운 리스트 **********************************
    ************************************************************************************/
    var activeStatCdList        = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //활동상태
    var activeTpCdList    = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //활동유형

    //활동상태코드
    var activeStatCdArr = [];
    <c:forEach var="obj" items="${activeStatCdList}">
        activeStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        activeStatCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    activeStatCdArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = activeStatCdArr[val];
        }
        return returnVal;
    };

    //활동유형코드 Array
    var activeTpCdArr = [];
    <c:forEach var="obj" items="${activeTpCdList}">
        activeTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        activeTpCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    activeTpCdArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = activeTpCdArr[val];
        }
        return returnVal;
    };

    //활동유형SUB코드 Array
    var activeTpSubCdListObj = {};
    var activeTpSubCdArr = {};

    <c:forEach var="obj" items="${activeTpSubCdList}">
        if(activeTpSubCdListObj.hasOwnProperty("${obj.remark1}")){
            activeTpSubCdListObj["${obj.remark1}"].push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
        }else{
            activeTpSubCdListObj["${obj.remark1}"] = [];
            activeTpSubCdListObj["${obj.remark1}"].push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
        };

        if(!activeTpSubCdArr.hasOwnProperty("${obj.cmmCd}")){
            activeTpSubCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        };
    </c:forEach>
    activeTpSubCdArrVal = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = activeTpSubCdArr[val];
        }
        return returnVal;
    };
    /************************************************************************************
     ************************** VOC 활동 드롭다운 리스트 **********************************
     ************************************************************************************/

    // 읽기전용 처리
    function readOnlyDefualtForm(readonly){

        if ( readonly ) {
            enableVal = false;
            disabledVal = true;
        } else {
            enableVal = true;
            disabledVal = false;
        };

        // VOC 요청접수
        $("#vocNo").attr("readonly", disabledVal);             // VOC 번호는 항상 읽기전용,
        $("#vocStatCd").data("kendoExtDropDownList").enable(enableVal);
        $("#vocTpCd").data("kendoExtDropDownList").enable(enableVal);
        $("#vocTpSubCd").data("kendoExtDropDownList").enable(enableVal);
        $("#tendCd").data("kendoExtDropDownList").enable(enableVal);
        $("#vocTpSub1Cd").data("kendoExtDropDownList").enable(enableVal);
        $("#vocTpSub2Cd").data("kendoExtDropDownList").enable(enableVal);
        $("#vocTpSub3Cd").data("kendoExtDropDownList").enable(enableVal);
        $("#acptSrcCd").data("kendoExtDropDownList").enable(enableVal);
        $("#activeGainPathCd").data("kendoExtDropDownList").enable(enableVal);
        $("#cmplCauCd").data("kendoExtDropDownList").enable(enableVal);
        $("#prorCd").data("kendoExtDropDownList").enable(enableVal);
        $("#procLmtCd").data("kendoExtDropDownList").enable(enableVal);
        $("#vocEndDt").data("kendoExtMaskedDateTimePicker").enable(enableVal);
        $("#dlrCmpCommYn").prop("disabled", disabledVal);

        //긴급구조
        $("#emgcRescFstCallYn").data("kendoExtDropDownList").enable(enableVal);     //긴급전화 첫 통화여부
        $("#emgcRescYn").data("kendoExtDropDownList").enable(enableVal);     //긴급구조 여부
        $("#emgcRescReasonNm").data("kendoExtDropDownList").enable(enableVal);     //원인
        $("#emgcRescStsfCont").data("kendoExtDropDownList").enable(enableVal);     //구조 만족도
        $("#emgcRescLocCont").attr("disabled", disabledVal);                      //고객구조위치

        $("#receiveTelNo").attr("disabled", disabledVal);
        $("#custNo").attr("disabled", disabledVal);
        $("#custNm").attr("disabled", disabledVal);
        $("#pconCustNm").attr("disabled", disabledVal);
        $("#pconCustNo").attr("disabled", disabledVal);
        $("#custPrefCommNo").attr("disabled", disabledVal);
        $("#hpNo").attr("disabled", disabledVal);
        $("#homeTelNo").attr("disabled", disabledVal);
        $("#officeTelNo").attr("disabled", disabledVal);
        $("#pconCustMjrTelNo").attr("disabled", disabledVal);
        $("#pconCustHpNo").attr("disabled", disabledVal);
        $("#pconCustHomeTelNo").attr("disabled", disabledVal);
        $("#pconCustOfficeTelNo").attr("disabled", disabledVal);
        $("#resvDt").data("kendoExtMaskedDateTimePicker").enable(enableVal);
        $("#repairBookId").attr("disabled", disabledVal);

        $("#sendTelNo").attr("disabled", disabledVal);
        $("#pconRelCd").data("kendoExtDropDownList").enable(enableVal);
        $("#pprocDeptNm").attr("disabled", disabledVal);
        $("#pprocId").attr("disabled", disabledVal);
        $("#pprocNm").attr("disabled", disabledVal);
        $("#coopDeptNm").attr("disabled", disabledVal);
        $("#bizDeptNm").attr("disabled", disabledVal);
        $("#officeNm").attr("disabled", disabledVal);
        $("#sungNm").attr("disabled", disabledVal);
        $("#sungCd").data("kendoExtDropDownList").enable(enableVal);
        $("#cityNm").attr("disabled", disabledVal);
        $("#cityCd").data("kendoExtDropDownList").enable(enableVal);
        $("#custReqCont").attr("disabled", disabledVal);

        $("#vinNo").attr("disabled", disabledVal);
        $("#carRegNo").attr("disabled", disabledVal);
        $("#carlineNm").attr("disabled", disabledVal);
        $("#carlineCd").data("kendoExtDropDownList").enable(enableVal);
        $("#modelCd").data("kendoExtDropDownList").enable(enableVal);
        $("#modelNm").attr("disabled", disabledVal);
        $("#ocnNm").attr("disabled", disabledVal);
        $("#ocnCd").data("kendoExtDropDownList").enable(enableVal);
        $("#runDistVal").attr("disabled", disabledVal);
        $("#acptDeptNm").attr("disabled", disabledVal);
        $("#pacptId").attr("disabled", disabledVal);
        $("#pacptNm").attr("disabled", disabledVal);
        $("#acptDt").data("kendoExtMaskedDateTimePicker").enable(enableVal);
        $("#manufacturer").attr("disabled", disabledVal);

        //VOC 처리
        $("#pevalId").attr("disabled", disabledVal);
        $("#pevalNm").attr("disabled", disabledVal);
        $("#returnCauCont").attr("disabled", disabledVal);
        $("#pmoCauCd").data("kendoExtDropDownList").enable(enableVal);
        $("#realPprocId").attr("disabled", disabledVal);
        $("#realPprocNm").attr("disabled", disabledVal);
        $("#pprocTelNo").attr("disabled", disabledVal);
        $("#stsfIvstEmpId").attr("disabled", disabledVal);
        $("#stsfIvstEmpNm").attr("disabled", disabledVal);
        $("#mthAchvHm").data("kendoExtMaskedDateTimePicker").enable(enableVal);
        $("#traceDt").data("kendoExtMaskedDateTimePicker").enable(enableVal);

        $("#evalAllocDt").data("kendoExtMaskedDateTimePicker").enable(enableVal);
        $("#sendCd").data("kendoExtDropDownList").enable(enableVal);
        $("#pmoDt").data("kendoExtMaskedDateTimePicker").enable(enableVal);
        $("#procDt").data("kendoExtMaskedDateTimePicker").enable(enableVal);
        $("#pprocEmailNm").attr("disabled", disabledVal);
        $("#stsfIvstDt").data("kendoExtMaskedDateTimePicker").enable(enableVal);
        $("#traceRsltCont").attr("disabled", disabledVal);

        $("#callCenOpnCont").attr("disabled", disabledVal);
        $("#revMthCont").attr("disabled", disabledVal);
        $("#procRsltCont").attr("disabled", disabledVal);
        $("#stsfIvstRsltCont").attr("disabled", disabledVal);

        // 추가정보
        //$("#cmplStsfNm01").attr("disabled", disabledVal);
        $("#cmplStsfNm01").data("kendoExtDropDownList").enable(enableVal);
        //$("#cmplStsfNm02").attr("disabled", disabledVal);
        $("#cmplStsfNm02").data("kendoExtDropDownList").enable(enableVal);
        $("#cmplReAcptYn").prop("disabled", disabledVal);
        $("#cmplReAcptCnt").attr("disabled", disabledVal);
        $("#serReqNo").attr("disabled", disabledVal);
        $("#cmplDlDeptNm").attr("disabled", disabledVal);
        $("#cmplDlEmpId").attr("disabled", disabledVal);
        $("#cmplDlEmpNm").attr("disabled", disabledVal);
        $("#saleDt01").data("kendoExtMaskedDateTimePicker").enable(enableVal);
        $("#saleDt02").data("kendoExtMaskedDateTimePicker").enable(enableVal);
        $("#dstbNo").attr("disabled", disabledVal);

        $("#salesActiveSrcCd").data("kendoExtDropDownList").enable(enableVal);
        $("#relSalesActiveNo").attr("disabled", disabledVal);

        // 부품정보
        $("#parOrdYn").data("kendoExtDropDownList").enable(enableVal);
        $("#parOrdDt").data("kendoExtMaskedDateTimePicker").enable(enableVal);
        $("#parArrvDt").data("kendoExtMaskedDateTimePicker").enable(enableVal);
        $("#itemCd").attr("disabled", disabledVal);

    }
    // 읽기전용처리

    // 초기화
    function initForm(){

        vocInputMode = "N";
        vocCustSearchPopup = "N";
        changeComboList("");

        $("#bhmcYn").val("");
        $("#bhmcVocNo").val("");
        $("#dlrCd").val("");

        // VOC 요청접수
        $("#vocNo").val("");
        $("#vocStatCd").data("kendoExtDropDownList").value("");
        $("#bfVocStatCd").val("");
        $("#vocTpCd").data("kendoExtDropDownList").value("");
        $("#vocTpSubCd").data("kendoExtDropDownList").value("");
        $("#tendCd").data("kendoExtDropDownList").value("");
        $("#vocTpSub1Cd").data("kendoExtDropDownList").value("");
        $("#vocTpSub2Cd").data("kendoExtDropDownList").value("");
        $("#vocTpSub3Cd").data("kendoExtDropDownList").value("");
        $("#acptSrcCd").data("kendoExtDropDownList").value("");
        $("#activeGainPathCd").data("kendoExtDropDownList").value("");
        $("#cmplCauCd").data("kendoExtDropDownList").value("");
        $("#cmplCauCdSpan").removeClass("bu_required");
        $("#prorCd").data("kendoExtDropDownList").value("");
        $("#procLmtCd").data("kendoExtDropDownList").value("");
        $("#vocEndDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#dlrCmpCommYn").prop("checked", false);

        //긴급구조
        $("#emgcRescFstCallYn").data("kendoExtDropDownList").value("");                      //긴급전화 첫 통화여부
        $("#emgcRescYn").data("kendoExtDropDownList").value("");                      //긴급구조 여부
        $("#emgcRescReasonNm").data("kendoExtDropDownList").value("");                      //원인
        $("#emgcRescStsfCont").data("kendoExtDropDownList").value("");                      //구조 만족도
        $("#emgcRescLocCont").val("");                            //고객구조위치

        $("#receiveTelNo").val("");
        $("#custNo").val("");
        $("#custNm").val("");
        $("#pconCustNm").val("");
        $("#pconCustNo").val("");
        $("#custPrefCommNo").val("");
        $("#hpNo").val("");
        $("#homeTelNo").val("");
        $("#officeTelNo").val("");
        $("#pconCustMjrTelNo").val("");
        $("#pconCustHpNo").val("");
        $("#pconCustHomeTelNo").val("");
        $("#pconCustOfficeTelNo").val("");
        $("#resvDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#repairBookId").val("");

        $("#sendTelNo").val("");
        $("#pconRelCd").data("kendoExtDropDownList").value("");
        $("#pconRelCd").parent().find(".k-input").html("");
        $("#bfPconRelCd").val("");      // 연계인 추가
        $("#pprocDeptNm").val("");
        $("#pprocDeptNmTmp").val("");
        $("#pprocId").val("");
        $("#pprocNm").val("");
        $("#coopDeptNm").val("");
        $("#bizDeptNm").val("");
        $("#officeNm").val("");
        $("#sungNm").val("");
        $("#sungCd").data("kendoExtDropDownList").value("");
        $("#sungCd").parent().find(".k-input").html("");
        $("#cityNm").val("");
        $("#cityCd").data("kendoExtDropDownList").value("");
        $("#cityCd").parent().find(".k-input").html("");
        $("#custReqCont").val("");

        $("#vinNo").val("");
        $("#carRegNo").val("");
        $("#carlineNm").val("");
        $("#carlineCd").data("kendoExtDropDownList").value("");
        $("#carlineCd").parent().find(".k-input").html("");
        $("#modelCd").data("kendoExtDropDownList").value("");
        $("#modelCd").parent().find(".k-input").html("");
        $("#modelNm").val("");
        $("#ocnNm").val("");
        $("#ocnCd").data("kendoExtDropDownList").value("");
        $("#ocnCd").parent().find(".k-input").html("");
        $("#runDistVal").val("");
        $("#acptDeptNm").val("");
        $("#pacptId").val("");
        $("#pacptId").parent().find(".k-input").html("");
        $("#pacptNm").val("");
        $("#acptDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#manufacturer").val("");

        //VOC 처리
        $("#pevalId").val("");
        $("#pevalNm").val("");
        $("#returnCauCont").val("");
        $("#pmoCauCd").data("kendoExtDropDownList").value("");
        $("#realPprocId").val("");
        $("#realPprocNm").val("");
        $("#pprocTelNo").val("");
        $("#stsfIvstEmpId").val("");
        $("#stsfIvstEmpNm").val("");
        $("#mthAchvHm").data("kendoExtMaskedDateTimePicker").value("");
        $("#traceDt").data("kendoExtMaskedDateTimePicker").value("");

        $("#evalAllocDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#sendCd").data("kendoExtDropDownList").value("");
        $("#pmoDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#procDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#pprocEmailNm").val("");
        $("#stsfIvstDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#traceRsltCont").val("");

        $("#callCenOpnCont").val("");
        $("#revMthCont").val("");
        $("#procRsltCont").val("");
        $("#stsfIvstRsltCont").val("");


        // 추가정보
        $("#cmplStsfNm01").data("kendoExtDropDownList").value("");
        $("#cmplStsfNm01").parent().find(".k-input").html("");
        $("#cmplStsfNm02").data("kendoExtDropDownList").value("");
//         $("#cmplStsfNm01").val("");
//         $("#cmplStsfNm02").val("");
        $("#cmplReAcptYn").prop("checked", false);
        $("#cmplReAcptCnt").val("");
        $("#serReqNo").val("");
        $("#cmplDlDeptNm").val("");
        $("#cmplDlEmpId").val("");
        $("#cmplDlEmpNm").val("");
        $("#saleDt01").data("kendoExtMaskedDateTimePicker").value("");
        $("#saleDt02").data("kendoExtMaskedDateTimePicker").value("");
        $("#dstbNo").val("");

        $("#salesActiveSrcCd").data("kendoExtDropDownList").value("");
        $("#relSalesActiveNo").val("");

        // 부품정보
        $("#parOrdYn").data("kendoExtDropDownList").value("N");
        $("#parOrdDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#parArrvDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#itemCd").val("");

        $("#manufacturerAppendSiebel").val("");
        $("#pprocIdInputSiebel").val("");
        $("#pprocNmInputSiebel").val("");
        $("#pprocDeptNmAppendSiebel").val("");
        $("#coopDeptNmAppendSiebel").val("");

        // 버튼에 따른 팝업
        $("#procRsltContAppend").val("");
        $("#cmplStsfNmAppend").data("kendoExtDropDownList").value("");
        $("#stsfIvstRsltContAppend").val("");
        $("#custVsitPlan").val("");
        $("#custFUResult").val("");

        $("#btnActiveSave").data("kendoButton").enable(false);
        $("#btnAdd").data("kendoButton").enable(false);
        $("#btnCancel").data("kendoButton").enable(false);

        $("#btnModify").data("kendoButton").enable(false);
        $("#btnMessage").data("kendoButton").enable(false);
        $("#btnOBCall").data("kendoButton").enable(false);
        $("#btnExcelExport2").data("kendoButton").enable(false);
        
        //버튼 초기화
        btnDisabled();

        $("#pprocDeptNmTxt").text("<spring:message code='global.lbl.pprocDeptNm' />")       //처리부서

        $("#activeGrid").data("kendoExtGrid").dataSource.data([]);

    };


    function btnDisabled(){

        $("#btnVocStat01").data("kendoButton").enable(false);
        //$("#btnVocStat99").data("kendoButton").enable(false);
        $("#btnVocStat00").data("kendoButton").enable(false);
        $("#btnVocStat94").data("kendoButton").enable(false);
        $("#btnVocStat03").data("kendoButton").enable(false);
        $("#btnVocStat05").data("kendoButton").enable(false);
        $("#btnVocStat07").data("kendoButton").enable(false);
        $("#btnVocStat09").data("kendoButton").enable(false);
        $("#btnVocStat08").data("kendoButton").enable(false);

        $("#btnVocStatLEAD").data("kendoButton").enable(false);      //리드생성
        $("#btnVocStatRO").data("kendoButton").enable(false);        //RO예약

        //$("#btnModify").data("kendoButton").enable(false);        //RO예약

        $("#btnVocStat94Popup").data("kendoButton").enable(false);
        $("#btnCancel94Popup").data("kendoButton").enable(false);
        $("#btnVocStat03Popup").data("kendoButton").enable(false);
        $("#btnCancel03Popup").data("kendoButton").enable(false);
        $("#btnVocStat09Popup").data("kendoButton").enable(false);
        $("#btnVocStat95Popup").data("kendoButton").enable(false);
        $("#btnCancel09Popup").data("kendoButton").enable(false);
        $("#btnVocStat05Popup").data("kendoButton").enable(false);
        $("#btnVocStat97Popup").data("kendoButton").enable(false);
        $("#btnVocStat96Popup").data("kendoButton").enable(false);
        $("#btnCancel05Popup").data("kendoButton").enable(false);
        $("#btnVocStat08Popup").data("kendoButton").enable(false);
        $("#btnCancel08Popup").data("kendoButton").enable(false);
        $("#btnVocStat99Popup").data("kendoButton").enable(false);
        $("#btnCancel99Popup").data("kendoButton").enable(false);

    };



    /**
     * 유형에 따른 입력부 컨트롤 ( 유형 - 불만에 따라서 show / hide )
     */
    function changeFormView(vocTpCd) {

        if(vocTpCd === "02"){

            //추가정보
            $("#addInfoTitle1").removeClass("hidden");
            $("#addInfoFrom").removeClass("hidden");
            $("#addInfo1").addClass("hidden");
            $("#addInfo2").removeClass("hidden");
            $("#addInfo3").removeClass("hidden");
            //부품정보
            $("#itemInfoTitle1").removeClass("hidden");
            $("#itemInfo1").removeClass("hidden");

            $("#cmplCauCdSpan").addClass("bu_required");

        // vocTpCd === "05" 인경우 긴급구조로 인식
        } else if(vocTpCd === "05"){

            //추가정보
            $("#addInfoTitle1").addClass("hidden");
            $("#addInfoFrom").addClass("hidden");
            $("#addInfo1").addClass("hidden");
            $("#addInfo2").addClass("hidden");
            $("#addInfo3").addClass("hidden");
            //부품정보
            $("#itemInfoTitle1").addClass("hidden");
            $("#itemInfo1").addClass("hidden");

            $("#cmplCauCdSpan").removeClass("bu_required");

        } else {

            //추가정보
            $("#addInfoTitle1").removeClass("hidden");
            $("#addInfoFrom").removeClass("hidden");
            $("#addInfo1").removeClass("hidden");
            $("#addInfo2").addClass("hidden");
            $("#addInfo3").addClass("hidden");
            //부품정보
            $("#itemInfoTitle1").removeClass("hidden");
            $("#itemInfo1").removeClass("hidden");

            $("#cmplCauCdSpan").removeClass("bu_required");

        };

    }


    function changeComboList(vocTpCd) {

        if(vocTpCd === "02"){

            $("#cmplCauCd").data("kendoExtDropDownList").enable(true);             //불만이유
            $("#dlrCmpCommYn").prop("disabled", true);                          //딜러사 연락여부
            $("#repairBookId").attr("disabled", true);                          //정비예약ID

            $("#mthAchvHm").data("kendoExtMaskedDateTimePicker").enable(true);                            //방안달성시간
            $("#traceDt").data("kendoExtMaskedDateTimePicker").enable(true);    //추적시간
            $("#sendCd").data("kendoExtDropDownList").enable(false);                        //자료배송상태
            $("#traceRsltCont").attr("disabled", false);                        //추적결과
            $("#revMthCont").attr("disabled", false);                           //검토중인방안

            $("#pconCustInfoTxt").text("<spring:message code='crm.lbl.cmplDlEmpId' />");        //불만요청자
            $("#pconRelCdTxt").text("<spring:message code='crm.lbl.cmplRelCd' />");     //고객 및 불만자 관계
            $("#pprocDeptNmTxt").text("<spring:message code='global.lbl.pprocDeptNm' />")     //처리부서
            $("#pconStsfIvstTxt").text("<spring:message code='crm.lbl.cmplStsfIvst' />")     //불만만족도

            //긴급구조
            $("#emgcRescFstCallYn").data("kendoExtDropDownList").enable(false);     //긴급전화 첫 통화여부
            $("#emgcRescYn").data("kendoExtDropDownList").enable(false);     //긴급구조 여부
            $("#emgcRescReasonNm").data("kendoExtDropDownList").enable(false);     //원인
            $("#emgcRescStsfCont").data("kendoExtDropDownList").enable(false);     //구조 만족도
            $("#emgcRescLocCont").attr("disabled", true);                      //고객구조위치

            if ( dms.string.isNotEmpty($("#pprocDeptNmTmp").val()) ) {
                $("#pprocDeptNm").val($("#pprocDeptNmTmp").val())
            };

        //vocTpCd === "05" 인경우 긴급구조로 인식
        } else if(vocTpCd === "05"){

            $("#cmplCauCd").data("kendoExtDropDownList").enable(false);             //불만이유

            $("#dlrCmpCommYn").prop("disabled", true);                          //딜러사 연락여부
            $("#repairBookId").attr("disabled", true);                          //정비예약ID

            $("#mthAchvHm").data("kendoExtMaskedDateTimePicker").enable(false);                            //방안달성시간
            $("#traceDt").data("kendoExtMaskedDateTimePicker").enable(false);    //추적시간
            $("#sendCd").data("kendoExtDropDownList").enable(true);                        //자료배송상태
            $("#traceRsltCont").attr("disabled", true);                        //추적결과
            $("#revMthCont").attr("disabled", true);                           //검토중인방안

            $("#pconCustInfoTxt").text("<spring:message code='global.lbl.relCustInfo' />");     //연계인
            $("#pconRelCdTxt").text("<spring:message code='crm.lbl.relCd' />");                 //고객 및 연계인 관계
            $("#pprocDeptNmTxt").text("<spring:message code='crm.lbl.emgcRescDlr' />")          //구조진행딜러

            //긴급구조
            $("#emgcRescFstCallYn").data("kendoExtDropDownList").enable(true);      //긴급전화 첫 통화여부
            $("#emgcRescYn").data("kendoExtDropDownList").enable(true);      //긴급구조 여부
            $("#emgcRescReasonNm").data("kendoExtDropDownList").enable(true);      //원인
            $("#emgcRescStsfCont").data("kendoExtDropDownList").enable(true);      //구조 만족도
            $("#emgcRescLocCont").attr("disabled", false);                     //고객구조위치

            if( $("#vocTpCd").data("kendoExtDropDownList").value() === "03" ){
                //유형-요청, 1/2급유형 - 긴급구조일때 : 구조진행딜러 = 제조사/특약점 명으로 설정. 수정불가.
                $("#pprocDeptNm").val($("#manufacturer").val()).attr("readonly", true).addClass("form_readonly");
            };

        } else {

            $("#cmplCauCd").data("kendoExtDropDownList").enable(false);            //불만이유
            $("#dlrCmpCommYn").prop("disabled", false);                         //딜러사 연락여부
            $("#repairBookId").attr("disabled", false);                         //정비예약ID

            $("#mthAchvHm").data("kendoExtMaskedDateTimePicker").enable(false);                             //방안달성시간
            $("#traceDt").data("kendoExtMaskedDateTimePicker").enable(false);   //추적시간
            $("#sendCd").data("kendoExtDropDownList").enable(false);                       //자료배송상태
            $("#traceRsltCont").attr("disabled", true);                         //추적결과
            $("#revMthCont").attr("disabled", true);                            //검토중인방안

            $("#pconCustInfoTxt").text("<spring:message code='global.lbl.pconCustInfo' />");    //문의자
            $("#pconRelCdTxt").text("<spring:message code='global.lbl.pconRelCd' />");          //고객 및 문의자 관계
            $("#pprocDeptNmTxt").text("<spring:message code='global.lbl.pprocDeptNm' />")       //처리부서
            $("#pconStsfIvstTxt").text("<spring:message code='crm.lbl.pconStsfIvst' />")        //문의만족도

            //긴급구조
            $("#emgcRescFstCallYn").data("kendoExtDropDownList").enable(false);     //긴급전화 첫 통화여부
            $("#emgcRescYn").data("kendoExtDropDownList").enable(false);     //긴급구조 여부
            $("#emgcRescReasonNm").data("kendoExtDropDownList").enable(false);     //원인
            $("#emgcRescStsfCont").data("kendoExtDropDownList").enable(false);     //구조 만족도
            $("#emgcRescLocCont").attr("disabled", true);                      //고객구조위치

            if ( dms.string.isNotEmpty($("#pprocDeptNmTmp").val()) ) {
                $("#pprocDeptNm").val($("#pprocDeptNmTmp").val())
            };

        };

        changeFormView(vocTpCd);

    };

    // 고객 검색 팝업 시작 - type : C(고객) / R(연계인)
    function custSearchPopOpen(type) {

        if ( vocCustSearchPopup === "Y" ) { // 신규등록 / 수정모드에서만 팝업허용
            popupWindow = dms.window.popup({
                windowId:"customerSearchPopupMain"
                , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
                , content:{
                    url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                    , data:{
                        "autoBind": false
                        , "pconYn"  : "Y"
                        , "hpNo"  : $("#receiveTelNo").val()
                        , "callbackFunc":function(data){
                            //console.log("고객정보 : ",data);
                            // 고객정보 초기화
                            $("#custNo").val("");
                            $("#custNm").val("");
                            $("#hpNo").val("");
                            $("#pconRelCd").data("kendoExtDropDownList").value("");
                            $("#pconCustNo").val("");
                            $("#pconCustNm").val("");
                            $("#pconCustHpNo").val("");
                            $("#carlineCd").data("kendoExtDropDownList").value("");
                            $("#modelCd").data("kendoExtDropDownList").setDataSource([]);
                            $("#modelCd").data("kendoExtDropDownList").enable(false);
                            $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
                            $("#ocnCd").data("kendoExtDropDownList").enable(false);
                            $("#vinNo").val("");
                            $("#carRegNo").val("");
                            $("#runDistVal").val("");

                            if (data.length >= 1) {

                                var searchTp = data.searchTp
                                    , custNo = data[0].custNo
                                    , custNm = data[0].custNm
                                    , hpNo = data[0].hpNo
                                    , officeTelNo = data[0].officeTelNo
                                    , custTp = data[0].custTp
                                ;

                                $("#custNo").val(custNo);
                                $("#custNm").val(custNm);
                                if ( custTp === "01" ) {
                                    $("#hpNo").val(hpNo);
                                } else if ( custTp === "02" ) {
                                    $("#hpNo").val(officeTelNo);
                                };

                                if ( searchTp === "R" ) {

                                    $("#pconRelCd").data("kendoExtDropDownList").value(data[0].pconTp);
                                    // 문의인일때
                                    $("#pconCustNo").val(data[0].relCustNo);
                                    $("#pconCustNm").val(data[0].relNm);
                                    $("#pconCustHpNo").val(data[0].relHpNo);

                                } else if ( searchTp === "V" ) {

                                    var carlineCd = data.carlineCd;
                                    var modelCd = data.modelCd;
                                    var ocnCd = data.ocnCd;
                                    var vinNo = data.vinNo;
                                    var carRegNo = data.carRegNo;
                                    var runDistVal = data.carRunDistVal;

                                    $("#carlineCd").data("kendoExtDropDownList").value(carlineCd);
                                    $("#modelCd").data("kendoExtDropDownList").value("");
                                    if ( dms.string.isNotEmpty(carlineCd) ) {
                                        onSelectCarlineCdSet(carlineCd);
                                        $("#modelCd").data("kendoExtDropDownList").value(modelCd);
                                        $("#modelCd").data("kendoExtDropDownList").enable(true);
                                    };

                                    $("#ocnCd").data("kendoExtDropDownList").value("");
                                    if ( dms.string.isNotEmpty(modelCd) ) {
                                        onSelectModelCdSet(modelCd);
                                        $("#ocnCd").data("kendoExtDropDownList").value(ocnCd);
                                        $("#ocnCd").data("kendoExtDropDownList").enable(true);
                                    }

                                    $("#vinNo").val(vinNo);
                                    $("#carRegNo").val(carRegNo);
                                    $("#runDistVal").val(runDistVal);

                                };

                            };
                        }
                    }
                }
            });
        };

    };
    // 고객 검색 팝업 종료


    // 처리인 / 처리인팝업 / 제조사실처리인 검색 팝업 시작 - type : P1(처리인) / P2(처리인팝업) / RP(제조사실처리인)
    function pprocSearchPopOpen(type) {

        if ( vocCustSearchPopup === "Y" ) { // 신규등록 / 수정모드에서만 팝업허용

            userSearchPopupWin = dms.window.popup({
                 windowId:"userSearchPopupWin"
                ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
                ,content:{
                     url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                    ,data:{
                         "autoBind":false
                        ,"type"  :null
                        ,"callbackFunc":function(data){
                            if (data.length >= 1) {

                                var usrId = data[0].usrId;
                                var usrNm = data[0].usrNm;
                                var deptNm = data[0].deptNm;
                                //console.log("type : "+type+" | usrId : ",usrId+" | usrNm :"+usrNm+" | deptNm : "+deptNm);

                                if ( type === "P1" ) {                      //처리인
                                    $("#pprocId").val(usrId);
                                    $("#pprocNm").val(usrNm);
                                    $("#pprocDeptNm").val(deptNm);
                                    $("#pprocDeptNmTmp").val(deptNm);
                                } else if ( type === "P2" ) {               //처리인 팝업

                                } else if ( type === "RP" ) {               //실처리인
                                    $("#pprocIdInputSiebel").val(usrId);
                                    $("#pprocNmInputSiebel").val(usrNm);
                                };

                                userSearchPopupWin.close();
                            }
                        }
                    }
                }
            })
        };

    };
    // 고객 검색 팝업 종료

    /**
    * hyperlink in grid event of Customer Information
    */
    $(document).on("click", ".linkCust", function(e){

        var grid = $("#vocGrid").data("kendoExtGrid"),
        row = $(e.target).closest("tr");
        var dataItem = grid.dataItem(row);

        window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-D-10272"); // CUST NO
    });

    function fnVocMgmtByKey(vocNo) {

        // VOC 상세 조회 시작
        var vocNo = vocNo;

        var param = {
                "sVocNo":vocNo
                };
        //console.log("vocNo:"+JSON.stringify(param))

        $.ajax({
                url:"<c:url value='/crm/crq/vocMgmt/selectVocMgmtByKey.do' />"
                ,data:JSON.stringify(param)      //파라미터
                ,type:'POST'                        //조회요청
                ,dataType:'json'                  //json 응답
                ,contentType:'application/json'   //문자열 파라미터
                ,async:false
                ,error:function(jqXHR,status,error){
                    dms.notification.error("<spring:message code='crm.lbl.dtlInfo' var='arg' /><spring:message code='crm.info.findFail' arguments='${arg}' />");
                }
        }).done(function(body) {

            initForm(); //form 초기화
            vocInputMode = "U";

            $("#bhmcYn").val(body.bhmcYn);
            $("#bhmcVocNo").val(body.bhmcVocNo);
            $("#dlrCd").val(body.dlrCd);

            $("#vocNo").val(body.vocNo);
            $("#vocStatCd").data("kendoExtDropDownList").value(body.vocStatCd);
            btnActive(body.vocStatCd, body.vocTpCd);                         // 버튼초기화
            $("#bfVocStatCd").val(body.vocStatCd);

            // VOC 유형은 수정불가
            $("#vocTpCd").data("kendoExtDropDownList").value(body.vocTpCd);
            $("#vocTpCd").data("kendoExtDropDownList").trigger("select")
            $("#vocTpSubCd").data("kendoExtDropDownList").value(body.vocTpSubCd);
            $("#vocTpSubCd").data("kendoExtDropDownList").enable(false);

            $("#tendCd").data("kendoExtDropDownList").value(body.tendCd);

            $("#vocTpSub1Cd").data("kendoExtDropDownList").value(body.vocTpSub1Cd);
            $("#vocTpSub1Cd").data("kendoExtDropDownList").trigger("select");
            $("#vocTpSub2Cd").data("kendoExtDropDownList").value(body.vocTpSub2Cd);
            $("#vocTpSub2Cd").data("kendoExtDropDownList").trigger("select");
            $("#vocTpSub3Cd").data("kendoExtDropDownList").value(body.vocTpSub3Cd);
            $("#vocTpSub2Cd").data("kendoExtDropDownList").enable(false);  // changeComboList 확인
            $("#vocTpSub3Cd").data("kendoExtDropDownList").enable(false);  // changeComboList 확인

            $("#acptSrcCd").data("kendoExtDropDownList").value(body.acptSrcCd);
            $("#activeGainPathCd").data("kendoExtDropDownList").value(body.activeGainPathCd);
            $("#cmplCauCd").data("kendoExtDropDownList").value(body.cmplCauCd);
            $("#cmplCauCd").data("kendoExtDropDownList").enable(false);        // changeComboList 확인
            $("#prorCd").data("kendoExtDropDownList").value(body.prorCd);
            $("#procLmtCd").data("kendoExtDropDownList").value(body.procLmtCd);
            $("#vocEndDt").data("kendoExtMaskedDateTimePicker").value(body.vocEndDt);
            var dlrCmpCommYn = body.dlrCmpCommYn;
            if ( dlrCmpCommYn === 'Y' ) {
                $("#dlrCmpCommYn").prop("checked", true)
            };

            $("#emgcRescFstCallYn").data("kendoExtDropDownList").value(body.emgcRescFstCallYn);   //긴급전화 첫 통화여부
            $("#emgcRescYn").data("kendoExtDropDownList").value(body.emgcRescYn);   //긴급구조 여부
            $("#emgcRescReasonNm").data("kendoExtDropDownList").value(body.emgcRescReasonNm);   //원인
            $("#emgcRescStsfCont").data("kendoExtDropDownList").value(body.emgcRescStsfCont);   //구조 만족도
            $("#emgcRescLocCont").val(body.emgcRescLocCont);                                  //고객구조위치

            $("#receiveTelNo").val(body.receiveTelNo);
            $("#custNo").val(body.custNo);
            $("#custNm").val(body.custNm);
            $("#pconCustNm").val(body.pconCustNm);
            $("#pconCustNo").val(body.pconCustNo);
            $("#custPrefCommNo").val(body.custPrefCommNo);
            $("#hpNo").val(body.hpNo);
            $("#homeTelNo").val(body.homeTelNo);
            $("#officeTelNo").val(body.officeTelNo);
            $("#pconCustMjrTelNo").val(body.pconCustMjrTelNo);
            $("#pconCustHpNo").val(body.pconCustHpNo);
            $("#pconCustHomeTelNo").val(body.pconCustHomeTelNo);
            $("#pconCustOfficeTelNo").val(body.pconCustOfficeTelNo);
            $("#resvDt").data("kendoExtMaskedDateTimePicker").value(body.resvDt);
            $("#repairBookId").val(body.repairBookId);
            $("#repairBookId").attr("disabled", true);      // changeComboList 확인

            $("#sendTelNo").val(body.sendTelNo);
            $("#pconRelCd").data("kendoExtDropDownList").value(body.pconRelCd);
            $("#bfPconRelCd").val(body.pconRelCd);       // 연계인 등록을 위해
            $("#pprocDeptNm").val(body.pprocDeptNm);
            $("#pprocDeptNmTmp").val(body.pprocDeptNm);
            $("#pprocId").val(body.pprocId);
            $("#pprocNm").val(body.pprocNm);
            $("#coopDeptNm").val(body.coopDeptNm);
            $("#bizDeptNm").val(body.bizDeptNm);
            $("#officeNm").val(body.officeNm);
            $("#sungNm").val(body.sungNm);
            $("#sungCd").data("kendoExtDropDownList").value(body.sungCd);
            $("#cityNm").val(body.cityNm);
            $("#cityCd").data("kendoExtDropDownList").enable(false);
            $("#cityCd").data("kendoExtDropDownList").value(body.cityCd);
            $("#custReqCont").val(body.custReqCont);

            $("#vinNo").val(body.vinNo);
            $("#carRegNo").val(body.carRegNo);
            $("#carlineCd").data("kendoExtDropDownList").value(body.carlineCd);
            if(body.carlineCd != null){
                $("#modelCd").data("kendoExtDropDownList").enable(false);
                onSelectCarlineCdSet(body.carlineCd);
            }
            $("#carlineNm").val(body.carlineNm);
            $("#modelCd").data("kendoExtDropDownList").value(body.modelCd);
            if(body.modelCd != null){
                $("#ocnCd").data("kendoExtDropDownList").enable(false);
                onSelectModelCdSet(body.modelCd);
            }
            $("#modelNm").val(body.modelNm);
            $("#ocnNm").val(body.ocnNm);
            $("#ocnCd").data("kendoExtDropDownList").value(body.ocnCd);
            $("#runDistVal").val(body.runDistVal);
            $("#acptDeptNm").val(body.acptDeptNm);
            $("#pacptId").val(body.pacptId);
            $("#pacptNm").val(body.pacptNm);
            $("#acptDt").data("kendoExtMaskedDateTimePicker").value(body.acptDt);
            $("#manufacturer").val("<c:out value='${loginDlrNm}' />");

            $("#pevalId").val(body.pevalId);
            $("#pevalNm").val(body.pevalNm);
            $("#returnCauCont").val(body.returnCauCont);
            $("#pmoCauCd").data("kendoExtDropDownList").value(body.pmoCauCd);
            $("#realPprocId").val(body.realPprocId);
            $("#realPprocNm").val(body.realPprocNm);
            $("#pprocTelNo").val(body.pprocTelNo);
            $("#stsfIvstEmpId").val(body.stsfIvstEmpId);
            $("#stsfIvstEmpNm").val(body.stsfIvstEmpNm);
            $("#mthAchvHm").data("kendoExtMaskedDateTimePicker").value(body.mthAchvHm);
            $("#traceDt").data("kendoExtMaskedDateTimePicker").value(body.traceDt);

            $("#evalAllocDt").data("kendoExtMaskedDateTimePicker").value(body.evalAllocDt);
            $("#sendCd").data("kendoExtDropDownList").value(body.sendCd);
            $("#pmoDt").data("kendoExtMaskedDateTimePicker").value(body.pmoDt);
            $("#procDt").data("kendoExtMaskedDateTimePicker").value(body.procDt);
            $("#pprocEmailNm").val(body.pprocEmailNm);
            $("#stsfIvstDt").data("kendoExtMaskedDateTimePicker").value(body.stsfIvstDt);
            $("#traceRsltCont").val(body.traceRsltCont);

            $("#callCenOpnCont").val(body.callCenOpnCont);
            $("#revMthCont").val(body.revMthCont);
            $("#procRsltCont").val(body.procRsltCont);
            $("#stsfIvstRsltCont").val(body.stsfIvstRsltCont);

            $("#cmplStsfNm01").data("kendoExtDropDownList").value(body.cmplStsfNm);
            $("#cmplStsfNm02").data("kendoExtDropDownList").value(body.cmplStsfNm);
            var cmplReAcptYn = body.cmplReAcptYn;
            if ( cmplReAcptYn === 'Y' ) {
                $("#cmplReAcptYn").prop("checked", true)
            };
            $("#cmplReAcptCnt").val(body.cmplReAcptCnt);
            $("#serReqNo").val(body.serReqNo);
            $("#cmplDlDeptNm").val(body.cmplDlDeptNm);
            $("#cmplDlEmpId").val(body.cmplDlEmpId);
            $("#cmplDlEmpNm").val(body.cmplDlEmpNm);
            $("#saleDt01").data("kendoExtMaskedDateTimePicker").value(body.saleDt);
            $("#saleDt02").data("kendoExtMaskedDateTimePicker").value(body.saleDt);
            $("#dstbNo").val(body.dstbNo);

            $("#salesActiveSrcCd").data("kendoExtDropDownList").value(body.salesActiveSrcCd);
            $("#relSalesActiveNo").val(body.relSalesActiveNo);

            $("#parOrdYn").data("kendoExtDropDownList").value(body.parOrdYn);
            $("#parOrdDt").data("kendoExtMaskedDateTimePicker").value(body.parOrdDt);
            $("#parArrvDt").data("kendoExtMaskedDateTimePicker").value(body.parArrvDt);
            $("#itemCd").val(body.itemCd);

            // 긴급구조일때 화면 변경
            if ( getEmgcRescType() ) {
                $("#pprocDeptNmTxt").text("<spring:message code='crm.lbl.emgcRescDlr' />")          //구조진행딜러
            } else {
                changeFormView(body.vocTpCd);
                $("#pprocDeptNmTxt").text("<spring:message code='global.lbl.pprocDeptNm' />")       //처리부서
            };

            $("#btnActiveSave").data("kendoButton").enable(true);
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnCancel").data("kendoButton").enable(true);
            $("#btnMessage").data("kendoButton").enable(true);
            $("#btnOBCall").data("kendoButton").enable(true);
            $("#btnExcelExport2").data("kendoButton").enable(true);
            

            // 긴급구조 인경우 화면이 변경되기 때문에 마지막에 읽기전용을 해준다.
            readOnlyDefualtForm(true);  //form readonly

            // BHMC 인경우 이름 그대로 보여줌.
            if ( dms.string.isNotEmpty(body.bhmcVocNo) && body.bhmcYn === "Y" ) {

                 readOnlyDefualtForm(true);
                 btnDisabled();      // 상단에서 버튼제어후 BHMC 인경우 다시 제어

                 /**
                 *       제조사 데이터 처리 기준
                 *
                 *       유형 : 문의/평가/요청
                 *           상태 : 처리대기 / 고객FU -> 처리 프로세스만 가능
                 *       유형 : 클레임
                 *           상태 : 처리대기 -> 고객내방대기 프로세스만  가능
                 *           상태 : 처리대기 -> 처리 도 가능 (20170726 수정)
                 *       *긴급구조
                 *       상태 : 처리대기 -> 처리 프로세스만 가능

                 *          20170606 - 실처리인 정보가 없으면 배정버튼 활성화 ( 유형 상관없음 )
                 **/


                 if ( body.vocStatCd === "03" || body.vocStatCd === "09" ) {

                     // 실처리인 정보가 없으면 제조사처리배정 버튼 활성화
                     if ( dms.string.isEmpty(body.realPprocId) ) {

                         $("#btnVocStat94").data("kendoButton").enable(true);        //제조사처리배정
                         $("#btnVocStat94Popup").data("kendoButton").enable(true);   //제조사처리배정 POPUP
                         $("#btnCancel94Popup").data("kendoButton").enable(true);    //제조사처리배정 POPUP

                     // 실처리인 정보가 있으면 배정 완료된것이므로 처리 버튼 활성화, 아니면
                     } else if ( dms.string.isNotEmpty(body.realPprocId) ) {

                         if ( body.vocTpCd === "02" ) {

                             if ( body.vocStatCd === "03" ) {
                                 $("#btnVocStat08").data("kendoButton").enable(true);    //고객내방대기
                                 $("#btnVocStat03").data("kendoButton").enable(true);        //처리
                                 $("#btnVocStat03Popup").data("kendoButton").enable(true);   //처리  POPUP
                                 $("#btnCancel03Popup").data("kendoButton").enable(true);    //처리  POPUP
                             } else if ( body.vocStatCd === "09" ) {
                                 $("#btnVocStat03").data("kendoButton").enable(true);        //처리
                                 $("#btnVocStat03Popup").data("kendoButton").enable(true);   //처리  POPUP
                                 $("#btnCancel03Popup").data("kendoButton").enable(true);    //처리  POPUP
                             };

                         } else{

                             $("#btnVocStat03").data("kendoButton").enable(true);        //처리
                             $("#btnVocStat03Popup").data("kendoButton").enable(true);   //처리  POPUP
                             $("#btnCancel03Popup").data("kendoButton").enable(true);    //처리  POPUP
                         }

                     }

                 };

                 // 긴급구조 : vocTpSub1Cd === "03" && vocTpSub2Cd === "33"  / vocTpSub1Cd === "01" && vocTpSub2Cd === "14" 일때 확인)
                 if ( getEmgcRescType() ) {

                     // 버튼 초기화
                     btnDisabled();

                     if ( body.vocStatCd === "03" ) {

                         // 실처리인 정보가 없으면 배정버튼 활성화
                         if ( dms.string.isEmpty(body.realPprocId) ) {

                             $("#btnVocStat94").data("kendoButton").enable(true);        //제조사처리배정
                             $("#btnVocStat94Popup").data("kendoButton").enable(true);   //제조사처리배정 POPUP
                             $("#btnCancel94Popup").data("kendoButton").enable(true);    //제조사처리배정 POPUP

                         // 실처리인 정보가 있으면 배정 완료된것이므로 처리 버튼 활성화, 아니면
                         } else if ( dms.string.isNotEmpty(body.realPprocId) ) {

                             $("#btnVocStat03").data("kendoButton").enable(true);        //제조사처리배정
                             $("#btnVocStat03Popup").data("kendoButton").enable(true);   //제조사처리배정 POPUP
                             $("#btnCancel03Popup").data("kendoButton").enable(true);    //제조사처리배정 POPUP

                         };

                     };

                 };

                 //console.log("pacptId:"+body.pacptId+" | body.pprocId : "+body.pprocId+" | body.pevalId : "+body.pevalId+" | body.stsfIvstEmpId : "+body.stsfIvstEmpId+" | body.cmplDlEmpId : "+body.cmplDlEmpId+" | body.realPprocId : "+body.realPprocId);

                 // 제조사 정보 노출 : 접수인 / 처리인 / 심사인 / 설문조사인 / 불만전달자
                 //접수인
                 $("#pacptId").val("");
                 $("#pacptNm").val(body.pacptId);

                 //처리인
                 //$("#pprocId").val("");
                 //$("#pprocNm").val(body.pprocId);


                 //설문조사인
                 $("#stsfIvstEmpId").val("");
                 $("#stsfIvstEmpNm").val(body.stsfIvstEmpId);

                 //불만전달자
                 $("#cmplDlEmpId").val("");
                 $("#cmplDlEmpNm").val(body.cmplDlEmpId);

                 //심사인
                 $("#pevalId").val(body.pevalId);
                 $("#pevalNm").val(body.pevalNm);

                 //실처리인
                $("#realPprocId").val(body.realPprocId);
                $("#realPprocNm").val(body.realPprocNm);

                $("#pconRelCd").parent().find(".k-input").html(body.pconTpNm);
                $("#sungCd").parent().find(".k-input").html(body.sungNm);
                $("#cityCd").parent().find(".k-input").html(body.cityNm);
                $("#carlineCd").parent().find(".k-input").html(body.carlineNm);
                $("#modelCd").parent().find(".k-input").html(body.modelNm);
                $("#ocnCd").parent().find(".k-input").html(body.ocnNm);
                $("#pacptId").parent().find(".k-input").html(body.pacptId);
                $("#cmplStsfNm01").parent().find(".k-input").html(body.cmplStsfNm);

            }

            var isRoType = getRoType();
            if ( isRoType ) {
                $("#btnVocStatRO").data("kendoButton").enable(true);      //RO예약
            };

            // 활동목록 그리드 조회
            var grid = $("#activeGrid").data("kendoExtGrid");
            grid.dataSource.page(1);

        });
        // 상세조회 종료

    };



    function vocTxtAppend(preTxt, appendTxt) {

        var resultTxt;

        if ( dms.string.isEmpty(preTxt) ) {
            resultTxt = appendTxt;
        } else {
            resultTxt = preTxt+"\n"+appendTxt;
        };

        return resultTxt;

    }

    function vocActiveAddRow(callHisSeq, recFileId, callStartDt, callEndDt, type, callDialNum) {

        var grid = $('#vocGrid').data('kendoExtGrid');
        var selectedItem = grid.dataItem(grid.select());

        if( selectedItem != null || type === "IB" ) {

            var regDt = kendo.parseDate("<c:out value='${sysDate}' />", "<dms:configValue code='dateTimeFormat' />");
            var vocNo = "";
            var dlrCd = "";
            var bhmcVocNo = "";

            if( selectedItem != null ) {

                vocNo = selectedItem.vocNo;
                dlrCd = selectedItem.dlrCd;
                bhmcVocNo = selectedItem.bhmcVocNo;

            };

            // OB 콜정보가 있는경우
            var activeTpCd = "";
            var activeTpSubCd = "";

            if ( callHisSeq > 0 && dms.string.isNotEmpty(recFileId) && callStartDt !== null && callEndDt !== null ) {
                activeTpCd = "07";
                activeTpSubCd = "25";
                $("#sendTelNo").val(callDialNum);

                // TODO OB 완료후에는 활동에만 set하는데 발신 전화번호 set 한다음에 저장은 어떻게?
            };

            $('#activeGrid').data('kendoExtGrid').dataSource.insert(0, {
                 "dlrCd":dlrCd
                ,"vocNo":vocNo
                ,"regDtFormat":regDt
                ,"regDt":regDt
                ,"startDtFormat":regDt
                ,"startDt":regDt
                ,"endDtFormat":""
                ,"endDt":""
                ,"pgssHmFormat":""
                ,"pgssHm":""
                ,"expcStartDtFormat":""
                ,"expcStartDt":""
                ,"expcEndDtFormat":""
                ,"expcEndDt":""
                ,"regUsrNm":"<c:out value='${loginUserNm}' />"
                ,"regUsrId":"<c:out value='${loginUserId}' />"
                ,"ownerNm":"<c:out value='${loginUserNm}' />"
                ,"ownerId":"<c:out value='${loginUserId}' />"
                ,"regDeptNm":""
                ,"activeStatCd":"01"
                ,"activeTpCd":activeTpCd
                ,"activeTpSubCd":activeTpSubCd
                ,"custNo":$("#custNo").val()
                ,"custNm":$("#custNm").val()
                ,"pconCustNo":$("#pconCustNo").val()
                ,"pconCustNm":$("#pconCustNm").val()
                ,"regDeptNm":$("#pprocDeptNm").val()
                ,"emailActiveCd":"N"
                ,"alrtCd":"N"
                ,"bhmcVocNo":bhmcVocNo
                ,"activeCd":""
                ,"activeRsltCont":""
                ,"callHisSeq":callHisSeq
                ,"recFileId":recFileId
                ,"callStartDt":callStartDt
                ,"callStartDtFormat":callStartDt
                ,"callEndDt":callEndDt
                ,"callEndDtFormat":callEndDt
                ,"callDialNum":callDialNum
            });

        } else {
            //VOC 목록을 먼저 선택해 주십시오.
            dms.notification.info("<spring:message code='global.info.required.selectVoc'/>");
        }

    };

    function vocActiveInsert(saveData) {

        // 그리드 무결성 점검
        var insertList = saveData.insertList;
        if( insertList.length > 0 ) {
            var dataValidate = false;
            $.each(saveData.insertList, function(idx, row){
                if( dms.string.isEmpty(row.activeTpCd) ){
                    // 선택하지 않은 유형이 있습니다.
                    dms.notification.info("<spring:message code='global.lbl.type' var='vocActiveType' /><spring:message code='global.info.nonSelectItem' arguments='${vocActiveType}' />");
                    dataValidate = true;
                    return false;
                };
            });
            if(dataValidate){ return false; }
        };

        // BHMC_VOC_NO 있으면 같이 보내라.
        var vocNoInfo = {
            "vocNo"      :   $("#vocNo").val()
            ,"bhmcVocNo"  :   $("#bhmcVocNo").val()
        };

        saveData.vocMgmtVO = vocNoInfo;
        //return;

      $.ajax({
          url:"<c:url value='/crm/crq/vocMgmt/multiActives.do' />",
          data:JSON.stringify(saveData),
          type:'POST',
          dataType:'json',
          async:false,
          contentType:'application/json',
          error:function(jqXHR,status,error) {
              dms.notification.error(jqXHR.responseJSON.errors);
          },
          success:function(jqXHR, textStatus) {

              $("#activeGrid").data("kendoExtGrid").dataSource._destroyed = [];
              $("#activeGrid").data("kendoExtGrid").dataSource.page(1);

              //정상적으로 반영 되었습니다.
              dms.notification.success("<spring:message code='global.info.success'/>");
          }
          ,beforeSend:function(xhr) {
              dms.loading.show();
          }
          ,complete:function(xhr, status) {
              dms.loading.hide();
          }
      });

    };

    // 검색조건:등록일 시작일-종료일 날짜 비교
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

    function gridCommonParams() {
        // 그리드 상세 조회 및 엑셀export 수량 확인을 위한 공통 param
        var params = {};

        params["sCust"] = $("#sCust").val();
        params["sRegStartDt"] = $("#sRegStartDt").data("kendoExtMaskedDatePicker").value();
        params["sRegEndDt"] = $("#sRegEndDt").data("kendoExtMaskedDatePicker").value();
        params["sBhmcYn"] = $("#sBhmcYn").data("kendoExtDropDownList").value();
        params["sVocTpCd"] = $("#sVocTpCd").val();
        params["sVocStatCd"] = $("#sVocStatCd").val();
        params["sCmplCauCd"] = $("#sCmplCauCd").val();
        params["sMngScId"] = $("#sMngScId").val();
        params["sPprocIdNm"] = $("#sPprocIdNm").val();
        
        params["sVocNo"] = $("#sVocNo").val();
        params["sEvalAllocDtStart"] = $("#sEvalAllocDtStart").data("kendoExtMaskedDatePicker").value();
        params["sEvalAllocDtEnd"] = $("#sEvalAllocDtEnd").data("kendoExtMaskedDatePicker").value(); 

        return params;

    };

$(document).ready(function() {

    var mngScIdCtrl = "${mngScIdCtrl}";
    if (mngScIdCtrl == "N") {
        $("#sMngScId").val("${loginUserId}");
    } else {
        $("#sMngScId").val("");
    }

    var onlyNum = new RegExp("[^0-9]","i");
    $(".numberic").keyup(function(e)
    {
        var content = $(this).val();
        if(content.match(onlyNum)){
            $(this).val('');
        }
    });
	
    // 수정 버튼
    $("#btnVocStat00").kendoButton({
        click:function(e) {

            vocInputMode = "U";
            vocCustSearchPopup = "Y";       // 실처리인 선택 팝업을 띄우기 위한 값설정.

            $("#btnModify").data("kendoButton").enable(true);           // 저장버튼 활성화
            $("#btnVocStat00").data("kendoButton").enable(false);       // 수정버튼 비화성화

            $("#vocTpCd").data("kendoExtDropDownList").enable(true);
            $("#vocTpSubCd").data("kendoExtDropDownList").enable(true);
            $("#tendCd").data("kendoExtDropDownList").enable(true);
            $("#vocTpSub1Cd").data("kendoExtDropDownList").enable(true);
            $("#vocTpSub2Cd").data("kendoExtDropDownList").enable(true);
            $("#vocTpSub3Cd").data("kendoExtDropDownList").enable(true);
            $("#acptSrcCd").data("kendoExtDropDownList").enable(true);

            if ( $("#vocTpCd").data("kendoExtDropDownList").value() === "02" ) {
                $("#cmplCauCd").data("kendoExtDropDownList").enable(true);
            };

            $("#prorCd").data("kendoExtDropDownList").enable(true);
            $("#dlrCmpCommYn").prop("disabled", false);

            $("#custNo").attr("disabled", false);
            $("#custNm").attr("disabled", false);
            $("#pconCustNm").attr("disabled", false);
            $("#pconCustNo").attr("disabled", false);

            $("#pconRelCd").data("kendoExtDropDownList").enable(true);
            $("#pprocId").attr("disabled", false);
            $("#pprocNm").attr("disabled", false);
            $("#coopDeptNm").attr("disabled", false);

            $("#custReqCont").attr("disabled", false);

            $("#vinNo").attr("disabled", false);
            $("#carRegNo").attr("disabled", false);
            $("#carlineNm").attr("disabled", false);
            $("#carlineCd").data("kendoExtDropDownList").enable(true);
            $("#modelCd").data("kendoExtDropDownList").enable(true);
            $("#modelNm").attr("disabled", false);
            $("#ocnNm").attr("disabled", false);
            $("#ocnCd").data("kendoExtDropDownList").enable(true);
            $("#runDistVal").attr("disabled", false);

            $("#sendCd").data("kendoExtDropDownList").enable(true);

            $("#callCenOpnCont").attr("disabled", false);
            $("#procRsltCont").attr("disabled", false);

            $("#activeGainPathCd").data("kendoExtDropDownList").enable(true);
            $("#procLmtCd").data("kendoExtDropDownList").enable(true);
            $("#receiveTelNo").prop("disabled", false);
            $("#repairBookId").prop("disabled", false);
            $("#sendTelNo").prop("disabled", false);
            $("#stsfIvstRsltCont ").prop("disabled", false);
            $("#cmplStsfNm01").data("kendoExtDropDownList").enable(true);

            $("#saleDt01").data("kendoExtMaskedDateTimePicker").enable(true);
            $("#saleDt02").data("kendoExtMaskedDateTimePicker").enable(true);

            $("#salesActiveSrcCd").data("kendoExtDropDownList").enable(true);
            $("#relSalesActiveNo").attr("disabled", false);

                // 부품정보
            $("#parOrdYn").data("kendoExtDropDownList").enable(false);
            $("#parOrdDt").data("kendoExtMaskedDateTimePicker").enable(false);
            $("#parArrvDt").data("kendoExtMaskedDateTimePicker").enable(false);
            $("#itemCd").attr("disabled", false);

            $("#pprocDeptNmTxt").text("<spring:message code='global.lbl.pprocDeptNm' />")       //처리부서

            //긴급구조
            if ( getEmgcRescType() ) {
                changeComboList("05");
            };

        }
        ,enable:false
    });

    /** 전화걸기 **************************************************************/
    $("#btnOBCall").kendoButton({
        click:function(e) {

            var custNo = $("#custNo").val()
              , hpNo = $("#hpNo").val()         // 고객 이동 전화번호
              , custNoRequired = "Y"
            ;

            if ( $("#bhmcYn").val() === "Y"  ) {
                custNoRequired = "N";
            };

            if ( custNoRequired === "Y" && dms.string.isEmpty(custNo) ) {
               // {고객}을(를) 선택해주세요.
               dms.notification.warning("<spring:message code='global.lbl.customer' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
               return;
            };

            callDeviceInit();   // 전화걸기시 디바이스 상태를 초기화해줌.

            obCallPopupWindow = dms.window.popup({
                windowId:"obCallPopupWindow"
                //, title:false       // 타이틀 false 하면 드래그가 안됨
                , title:"<spring:message code='crm.title.OBcall' />"        //전화걸기
                , width:"250px"
                , height:"410px"
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
                                vocActiveAddRow(data.callHisSeq, data.callFileNm, data.callStartDt, data.callEndDt, "OB", data.callDialNum);
                                $("body").scrollTop($(document).height());      // 하단 활동 그리드로 위치
                                obCallPopupWindow.close();
                                // 전송 / 이 완료 되었습니다.
                                //dms.notification.success("<spring:message code='global.btn.transmission' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");
                            };

                        }
                    }
                }
            });

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
        ,enable:false
    });
    /** 전화걸기 **************************************************************/

    /** 접수버튼 : 접수(01) -> 심사대기(02) 후 처리상태로. **************************************************************/
    $("#btnVocStat01").kendoButton({
        click:function(e) {

            vocSave();

        }
        ,enable:false
    });
    /** 접수버튼 : 접수(01) -> 심사대기(02) 후 처리상태로.**************************************************************/

    /** 제조사처리배정 버튼 : 심사대기(02) -> 심사배정 팝업 *******************************************************/
    $("#btnVocStat94").kendoButton({
        click:function(e) {

            vocCustSearchPopup = "Y";       // 실처리인 선택 팝업을 띄우기 위한 값설정.
            $("#pprocDeptNmAppendSiebel").val($("#pprocDeptNm").val());
            $("#manufacturerAppendSiebel").val($("#manufacturer").val());
            $("#coopDeptNmAppendSiebel").val($("#coopDeptNm").val());

            $("#btnVocStat94Popup").data("kendoButton").enable(true);
            $("#btnCancel94Popup").data("kendoButton").enable(true);

            var win = $("#vocStat94Popup").data("kendoWindow");
            win.center();
            win.open();
        }
        ,enable:false
    });
    // 제조사처리배정 팝업 버튼 : 제조사처리대기 (03) -> 배정 -> 처리대기(03)
    $("#btnVocStat94Popup").kendoButton({
        click:function(e) {
            vocStatUpdt('94')
        }
        ,enable:false
    });
    // 제조사처리배정 팝업 취소 버튼
    $("#btnCancel94Popup").kendoButton({
        click:function(e) {
            $("#vocStat94Popup").data("kendoWindow").close();
        }
        ,enable:false
    });
    /** 제조사처리배정 버튼 : 심사대기(02) -> 심사배정 팝업 *******************************************************/

    /** 처리 버튼 : 처리대기 (03) -> 처리 팝업 *************************************************************/
    $("#btnVocStat03").kendoButton({
        click:function(e) {
            $("#btnVocStat03Popup").data("kendoButton").enable(true);
            $("#btnCancel03Popup").data("kendoButton").enable(true);

            var win = $("#vocStat03Popup").data("kendoWindow");
            win.center();
            win.open();
        }
        ,enable:false
    });
    // ##처리 팝업 버튼 : 처리대기 (03) -> 처리완료설문대기(05)
    $("#btnVocStat03Popup").kendoButton({
        click:function(e) {
            vocStatUpdt('05');
        }
        ,enable:false
    });
    // 처리 팝업 취소 버튼
    $("#btnCancel03Popup").kendoButton({
        click:function(e) {
            $("#vocStat03Popup").data("kendoWindow").close();
        }
        ,enable:false
    });
    /** 처리 버튼 : 처리대기 (03) -> 처리 팝업 *************************************************************/

    /** 고객F/U중 버튼(클레임) : 고객내방대기 (08) -> 고객F/U중 팝업 *****************************************/
    $("#btnVocStat09").kendoButton({
        click:function(e) {
            $("#btnVocStat09Popup").data("kendoButton").enable(true);
            $("#btnVocStat95Popup").data("kendoButton").enable(true);
            $("#btnCancel09Popup").data("kendoButton").enable(true);

            var win = $("#vocStat09Popup").data("kendoWindow");
            win.center();
            win.open();
        }
        ,enable:false
    });
    // 고객F/U중 팝업 -> 처리 버튼 : 고객내방대기 (08) -> 고객 F/U 중 (09)
    $("#btnVocStat09Popup").kendoButton({
        click:function(e) {
            vocStatUpdt('09')
        }
        ,enable:false
    });
    // 고객F/U중 팝업 -> 처리로 반송 버튼 : 고객내방대기 (08) -> 처리로 반송 버튼(03)
    $("#btnVocStat95Popup").kendoButton({
        click:function(e) {
            vocStatUpdt('95')
        }
        ,enable:false
    });
    // 고객F/U중 팝업 팝업 -> 취소 버튼
    $("#btnCancel09Popup").kendoButton({
        click:function(e) {
            $("#vocStat09Popup").data("kendoWindow").close();
        }
        ,enable:false
    });
    /** 고객F/U중 버튼(클레임) : 고객내방대기 (08) -> 고객F/U중 팝업 *****************************************/

    /** 설문완료CLOSE 버튼 : 처리완료설문대기(05) -> 설문완료CLOSE 팝업 *************************************/
    $("#btnVocStat05").kendoButton({
        click:function(e) {

            $("#btnVocStat05Popup").data("kendoButton").enable(true);
            $("#btnVocStat97Popup").data("kendoButton").enable(true);
            $("#btnVocStat96Popup").data("kendoButton").enable(true);
            $("#btnCancel05Popup").data("kendoButton").enable(true);

            var win = $("#vocStat05Popup").data("kendoWindow");
            win.center();
            win.open();
        }
        ,enable:false
    });
    // 설문완료CLOSE 팝업 -> 서비스요청CLOSE 버튼 : 처리완료설문대기(05) -> 설문완료 CLOSE(06)
    $("#btnVocStat05Popup").kendoButton({
        click:function(e) {
            vocStatUpdt('06');
        }
        ,enable:false
    });
    // 설문완료CLOSE 팝업 -> 처리상태로반송 버튼 : 처리완료설문대기(05) -> 처리대기(03)
    $("#btnVocStat97Popup").kendoButton({
        click:function(e) {
            vocStatUpdt('97');
        }
        ,enable:false
    });
    // 설문완료CLOSE 팝업 -> 고객F/U로 반송 버튼 : 처리완료설문대기(05) -> 고객F/U(09)
    $("#btnVocStat96Popup").kendoButton({
        click:function(e) {
            vocStatUpdt('96');
        }
        ,enable:false
    });
    // 설문완료CLOSE 팝업 -> 취소 버튼
    $("#btnCancel05Popup").kendoButton({
        click:function(e) {
            $("#vocStat03Popup").data("kendoWindow").close();
        }
        ,enable:false
    });
    /** 설문완료CLOSE 버튼 : 처리완료설문대기(05) -> 설문완료CLOSE 팝업 *************************************/

    /** 설문안하고CLOSE 버튼 : 처리완료설문대기(05) -> 설문안하고 Close(07) *********************************/
    $("#btnVocStat07").kendoButton({
        click:function(e) {
            vocStatUpdt("07");
        }
        ,enable:false
    });
    /** 설문안하고CLOSE 버튼 : 처리완료설문대기(05) -> 설문안하고 Close(07) *********************************/

    /** 고객내방대기 버튼 : 고객내방대기 팝업 **************************************************************/
    $("#btnVocStat08").kendoButton({
        click:function(e) {

            $("#btnVocStat08Popup").data("kendoButton").enable(true);
            $("#btnCancel08Popup").data("kendoButton").enable(true);
            var win = $("#vocStat08Popup").data("kendoWindow");
            win.center();
            win.open();

        }
        ,enable:false
    });
    // 고객내방대기 팝업 -> 확인 버튼 : 처리대기(03) -> 고객내방대기(08)
    $("#btnVocStat08Popup").kendoButton({
        click:function(e) {
            vocStatUpdt('08');
        }
        ,enable:false
    });
    // 고객내방대기 팝업 -> 취소 버튼
    $("#btnCancel08Popup").kendoButton({
        click:function(e) {
            $("#vocStat08Popup").data("kendoWindow").close();
        }
        ,enable:false
    });
    /** 고객내방대기 버튼 : 고객내방대기 팝업 **************************************************************/

    /** 반송 버튼 : 반송 팝업 ***************************************************************************/
    $("#btnVocStat99").kendoButton({
        click:function(e) {

            $("#btnVocStat99Popup").data("kendoButton").enable(true);
            $("#btnCancel99Popup").data("kendoButton").enable(true);

            var win = $("#vocStat99Popup").data("kendoWindow");
            win.center();
            win.open();
        }
        ,enable:false
    });
    // 반송 팝업 -> 반송 버튼 : 반송(99) -> 접수(02)
    $("#btnVocStat99Popup").kendoButton({
        click:function(e) {
            vocStatUpdt('99')
        }
        ,enable:false
    });
    // 반송 팝업 -> 취소 버튼
    $("#btnCancel99Popup").kendoButton({
        click:function(e) {
            $("#vocStat99Popup").data("kendoWindow").close()
        }
    });
    /** 반송 버튼 : 반송 팝업 ***************************************************************************/

    /** 리드생성 버튼 ***************************************************************************/
    $("#btnVocStatLEAD").kendoButton({
        click:function(e) {
            window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.opportunityMng' />", "<c:url value='/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtMain.do' />", "VIEW-D-10316");
        }
        ,enable:false
    });
    /** 리드생성 버튼 ***************************************************************************/

    /** RO예약 버튼 ***************************************************************************/
    $("#btnVocStatRO").kendoButton({
        click:function(e) {

            var isRoType = getRoType();

            if ( isRoType ) {

                var bhmcYn = $("#bhmcYn").val();
                var sVinNo = $("#vinNo").val();
                var sCarRegNo = $("#carRegNo").val();
                var sCarOwnerNm = $("#custNm").val();
                var params;
                var sResvTp;
                var sLinkType = "A";

                if ( dms.string.isEmpty(sVinNo) && dms.string.isEmpty(sCarRegNo) && dms.string.isEmpty(sCarOwnerNm) ) {
                    // {RO예약정보}을(를) 확인하여 주세요.
                    dms.notification.warning("<spring:message code='crm.info.ROResvInfo' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
                    return;

                } else{

                    var vocTpSub1Cd = $("#vocTpSub1Cd").data("kendoExtDropDownList").value();
                    var vocTpSub2Cd = $("#vocTpSub2Cd").data("kendoExtDropDownList").value();

                    if ( bhmcYn === "Y" && vocTpSub1Cd === "01" && vocTpSub2Cd === "8" ) {
                        sResvTp = "03";
                    } else if ( bhmcYn === "Y" && vocTpSub1Cd === "03" && vocTpSub2Cd === "26" ) {
                        sResvTp = "02"
                    } else if ( bhmcYn === "N" && ((vocTpSub1Cd === "01" && vocTpSub2Cd === "8") || (vocTpSub1Cd === "03" && vocTpSub2Cd === "26")) ) {
                        sResvTp = "05"
                    };

                    params = "?sVinNo="+sVinNo+"&sCarRegNo="+sCarRegNo+"&sCarOwnerNm="+sCarOwnerNm+"&sLinkType="+sLinkType+"&sResvTp="+sResvTp;
                };
                //console.log("params : ",params)
                window.parent._createOrReloadTabMenu("<spring:message code='ser.menu.reserCreate' />", "<c:url value='/ser/rev/reservationReceipt/selectReservationReceiptMain.do' />"+params, "VIEW-D-10332");

            } else {

                // {RO예약정보}을(를) 확인하여 주세요.
                dms.notification.warning("<spring:message code='crm.info.ROResvInfo' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
                return;

            };

        }
        ,enable:false
    });
    /** RO예약 버튼 ***************************************************************************/

    // VOC 수정 - 저장 버튼
    $("#btnModify").kendoButton({
        click:function(e) {

            if ( dms.string.isEmpty($("#vocNo").val()) ) {

                // {VOC 번호}을(를) 확인하여 주세요.
                dms.notification.warning("<spring:message code='global.lbl.vocNo' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
                return false;

            } else {
                vocSave();
            };

        }
        ,enable:false
    });

    // 메시지버튼
    $("#btnMessage").kendoButton({
        click:function(e){

            var   smsTmplUserGroup = "N"            // Y:SMS 전송 대상자를 임시 테이블에 저장 / N:SMS 전송 대상자를 리스트 형태로 넘김
                , smsTmplUserSeq                    // sms 전송 대상자 임시 테이블 번호
                , smsTmplUserList = []              // sms 전송 대상자 목록
                , refKeyNm = $("#custNo").val()
                , refTableNm = "CR_0601T"
                , contactBizCd = "04"       //[공통코드 확인] 업무구분 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,??:08,고객케어:09,콜센터:10)
                , custNoRequired = "Y"
            ;


            if ( $("#bhmcYn").val() === "Y"  ) {
                custNoRequired = "N";
            };

            if ( custNoRequired === "Y"  && dms.string.isEmpty($("#custNo").val()) ) {
               // {고객}을(를) 선택해주세요.
               dms.notification.warning("<spring:message code='global.lbl.customer' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
               return;
            }

            if ($("#hpNo").val().length <= 10) {
                dms.notification.warning("<spring:message code='crm.info.hpno11DigitRequired' />");
                $("#hpNo").focus();
                return false;
             }

            smsTmplUserList.push({
                "custNo" :$("#custNo").val()
              , "custNm" :$("#custNm").val()
              , "hpNo"   :$("#hpNo").val()
              , "refKeyNm"   :refKeyNm
            });

            // SMS 전송 대상자를 임시 테이블에 저장
            if ( smsTmplUserGroup === "Y" ) {

                $.ajax({
                    url:"<c:url value='/crm/cmm/customerInfo/insertSmsTmplUsers.do' />"
                    ,data:JSON.stringify(smsTmplUserList)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,async:false
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(jqXHR, textStatus) {

                        if ( jqXHR > 0 && textStatus === "success" ) {
                            smsTmplUserSeq = jqXHR;
                        } else {
                            smsTmplUserSeq = ""
                        }

                    }
                });

                smsTmplUserList = [];

            } else if ( smsTmplUserGroup === "N" ) {

                smsTmplUserSeq = ""
            }

            messagePopupWindow = dms.window.popup({
                windowId:"messagePopupWindow"
                , title:"<spring:message code='global.title.msgTransmission' />"   // 메시지전송
                , width:"550px"
                , height:"550px"
                , content:{
                    url:"<c:url value='/crm/cmm/customerInfo/selectMessagePopup.do'/>"
                    , data:{
                        "autoBind":false

                        , "smsTmplUserList":smsTmplUserList
                        , "smsTmplUserSeq" :smsTmplUserSeq

                        , "contactBizCd"   :contactBizCd
                        , "refTableNm"     :refTableNm
                        , "refKeyNm"       :refKeyNm
                        , "custNoRequired" :custNoRequired

                        , "callbackFunc":function(data){

                            if(data == "success"){

                                messagePopupWindow.close();
                                // 전송 / 이 완료 되었습니다.
                                dms.notification.success("<spring:message code='global.btn.transmission' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

                            }

                        }
                    }
                }
            });

        }
        ,enable:false
    });

    // ************************** 녹취파일 팝업 ****************************
    $("#vocRecFilePopup").kendoWindow({
        animation:false
        ,draggable:true
        ,modal:false
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='crm.lbl.recFileId' />"      //녹취파일
        ,width:"950px"
        ,height:"50px"
    }).data("kendoWindow");
    // ************************** 녹취파일 팝업 ****************************

    // ************************** 제조사처리배정 팝업 ****************************
    $("#vocStat94Popup").kendoWindow({
        animation:false
        ,draggable:true
        ,modal:false
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='crm.btn.evalAlloc' />"      //제조사처리배정
        ,width:"950px"
        ,height:"120px"
    }).data("kendoWindow");
    // ************************** 제조사처리배정 팝업 ****************************

    // ************************** 처리 결과 입력 팝업 ****************************
    $("#vocStat03Popup").kendoWindow({
        animation:false
        ,draggable:true
        ,modal:false
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='crm.title.procRsltCont' />"      // <!-- 처리결과 -->
        ,width:"950px"
        ,height:"220px"
    }).data("kendoWindow");
    // ************************** 처리 결과 입력 팝업 ****************************

    // ************************** 고객 FU 중 결과 입력 팝업 ****************************
    $("#vocStat09Popup").kendoWindow({
        animation:false
        ,draggable:true
        ,modal:false
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='crm.title.custFU' />"      // <!-- 고객 FU 중 -->
        ,width:"950px"
        ,height:"200px"
    }).data("kendoWindow");
    // ************************** 고객 FU 중 결과 입력 팝업 ****************************

    // ************************** 설문완료 CLOSE 입력 팝업 ****************************
    $("#vocStat05Popup").kendoWindow({
        animation:false
        ,draggable:true
        ,modal:false
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='crm.title.surveySuccessClose' />"      // <!-- 설문완료 CLOSE -->
        ,width:"950px"
        ,height:"175px"
    }).data("kendoWindow");
    // ************************** 설문완료 CLOSE 입력 팝업 ****************************

    // ************************** 고객내방대기 팝업 ****************************
    $("#vocStat08Popup").kendoWindow({
        animation:false
        ,draggable:true
        ,modal:false
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='crm.title.custVsit' />"      // <!-- 고객내방대기 -->
        ,width:"950px"
        ,height:"220px"
    }).data("kendoWindow");
    // ************************** 고객내방대기 팝업 ****************************

    // ************************** 반송 팝업 ****************************
    $("#vocStat99Popup").kendoWindow({
        animation:false
        ,draggable:true
        ,modal:false
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='crm.title.return' />"         //반송
        ,width:"950px"
        ,height:"200px"
    }).data("kendoWindow");
    // ************************** 반송 팝업 ****************************

    // show/hide
    $("#btnHidden").kendoButton({
        click:function(e){
            $("#hiddenTable").toggle();
            resizeGrid();
        }
    });

/*************************************************************
드랍다운 리스트 셋팅
*************************************************************/

    // 시작일
    $("#sRegStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 종료일
    $("#sRegEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    
    
    
    $("#sEvalAllocDtStart").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 종료일
    $("#sEvalAllocDtEnd").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });


    //유형(조회부).   vocTpCdList
    $("#sVocTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:vocTpCdList
        , select:function(e){
            var dataItem = this.dataItem(e.item);
            var cmmCd = dataItem.cmmCd;

            if ( cmmCd === "02" ) {
                $("#sCmplCauCd").data("kendoExtDropDownList").enable(true);
            } else {
                $("#sCmplCauCd").data("kendoExtDropDownList").enable(false);
            };

        }
    });

    //상태(조회부).
    $("#sVocStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:vocStatCdList
    });

    //제조사,딜러
    $("#sBhmcYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:bhmcYnList
    });

    //불만이유(조회부).   cmplCauCdList
    $("#sCmplCauCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:cmplCauCdList
    });
    $("#sCmplCauCd").data("kendoExtDropDownList").enable(false);

    // Close 시간(입력부)
    $("#vocEndDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,minTime:"08:00"
        ,maxTime:"24:00"
    });

    // 예약시간(입력부)
    $("#resvDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,minTime:"08:00"
        ,maxTime:"24:00"
    });

    // 접수시간(입력부)
    $("#acptDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,minTime:"08:00"
        ,maxTime:"24:00"
    });

    // 방안달성시간(입력부)
    $("#mthAchvHm").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,minTime:"08:00"
        ,maxTime:"24:00"
    });

    // 추적시간(입력부)
    $("#traceDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,minTime:"08:00"
        ,maxTime:"24:00"
    });

    // 심사 배정시간(입력부)
    $("#evalAllocDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,minTime:"08:00"
        ,maxTime:"24:00"
    });

    // 승급시간(입력부)
    $("#pmoDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,minTime:"08:00"
        ,maxTime:"24:00"
    });

    // 처리일자(입력부)
    $("#procDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,minTime:"08:00"
        ,maxTime:"24:00"
    });

    // 만족도 조사시간(입력부)
    $("#stsfIvstDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,minTime:"08:00"
        ,maxTime:"24:00"
    });

    // 판매시간(입력부)
    $("#saleDt01").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,minTime:"08:00"
        ,maxTime:"24:00"
    });
    $("#saleDt02").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,minTime:"08:00"
        ,maxTime:"24:00"
    });

    // 오더시간(입력부)
    $("#parOrdDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,minTime:"08:00"
        ,maxTime:"24:00"
    });

    // 도착시간(입력부)
    $("#parArrvDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,minTime:"08:00"
        ,maxTime:"24:00"
    });

    //상태(입력부).  VOC 상태는 유형에 따라서 변하기 때문에 최초 읽기전용.
    $("#vocStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "  // 전체
        , dataSource:vocStatCdList
    });
    $("#vocStatCd").data("kendoExtDropDownList").enable(false);

    //유형(입력부).   vocTpCdList
    $("#vocTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:vocTpCdList
        , select:function(e){
            var dataItem = this.dataItem(e.item);
            var value = dataItem.cmmCd;

            $("#vocTpSub1Cd").data("kendoExtDropDownList").value("");
            $("#vocTpSub2Cd").data("kendoExtDropDownList").setDataSource([]);
            $("#vocTpSub2Cd").data("kendoExtDropDownList").enable(false);

            if(dms.string.isNotEmpty(value)){
                onSelectVocTpSubCdSet("CRM617", value);
                changeComboList(dataItem.cmmCd);
            };

            if ( value === "04" ) {
                $("#vocTpSubCdSpan").removeClass("bu_required");
            } else {
                $("#vocTpSubCdSpan").addClass("bu_required");
            };

        }
    });

    //하위유형(입력부).
    $("#vocTpSubCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    });

    //성향(입력부).   tendCdList
    $("#tendCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:tendCdList
    });

    //1급 Sub 유형(입력부).   vocTpSub1CdList
    $("#vocTpSub1Cd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:vocTpSub1CdList
        , select:function(e){
            var dataItem = this.dataItem(e.item);

            if(dms.string.isNotEmpty(dataItem)){
                onSelectVocTpSubCdSet("CRM606", dataItem.cmmCd);
            };

            changeComboList($("#vocTpCd").val());

        }
    });

    //문의만족도.   cmplStsfNmList
    $("#cmplStsfNm01").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:cmplStsfNmList
        , enable:false
    });

    //문의만족도 ( 처리시 사용 ).   cmplStsfNmList
    $("#cmplStsfNmAppend").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:cmplStsfNmList
    });

    //불만만족도.   cmplStsfNmList
    $("#cmplStsfNm02").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:cmplStsfNmList
        , enable:false
    });

    //2급 Sub 유형(입력부).
    $("#vocTpSub2Cd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , filter:"contains"
        , change:function(e){
            var dataItem = this.dataItem(e.item);

            if(dms.string.isNotEmpty(dataItem.cmmCd)){
                var vocTpSub1Cd = $("#vocTpSub1Cd").data("kendoExtDropDownList").value();
                var vocTpSub2Cd = dataItem.cmmCd;
                onSelectVocTpSubCdSet("CRM607", vocTpSub2Cd);
            };

            // 긴급구조일때 화면 변경
            if ( getEmgcRescType() ) {
                changeComboList("05");
            } else {
                changeComboList($("#vocTpCd").val());
            };
        }
    });

    //3급 유형(입력부).
    $("#vocTpSub3Cd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , filter:"contains"
        , optionLabel:" "
    });

    //접수경로(입력부).   acptSrcCdList
    $("#acptSrcCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:acptSrcCdList
    });

    //활동 알게 되는 경로(입력부).   activeGainPathCdList
    $("#activeGainPathCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:activeGainPathCdList
    });

    //불만이유(입력부).   cmplCauCdList
    $("#cmplCauCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:cmplCauCdList
    });

    //심각성(입력부).   prorCdList
    $("#prorCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:prorCdList
    });

    //처리시한(입력부).   procLmtCdList
    $("#procLmtCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:procLmtCdList
    });

    var ynDataSource = [{"cmmCd":"Y", "cmmCdNm":"<spring:message code='global.lbl.yes' />"}, {"cmmCd":"N", "cmmCdNm":"<spring:message code='global.lbl.n' />"}]
    //emgcRescFstCallYn(입력부).   emgcRescFstCallYn
    $("#emgcRescFstCallYn").kendoExtDropDownList({
          dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource : ynDataSource
        , optionLabel:" "
    });
    //emgcRescYn(입력부).   emgcRescYn
    $("#emgcRescYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource : ynDataSource
        , optionLabel:" "
    });
    //emgcRescReasonNm(입력부).   emgcRescReasonNm
    $("#emgcRescReasonNm").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource : ynDataSource
        , optionLabel:" "
    });
    //emgcRescStsfCont(입력부).   emgcRescStsfCont
    $("#emgcRescStsfCont").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource : ynDataSource
        , optionLabel:" "
    });

    //고객 및 연계인 관계(입력부).   crm030List
    $("#pconRelCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:crm030List
    });

    //성코드(입력부).
    $("#sungCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "  // 전체
        , dataSource:sungCdList
        , select:function(e){
            var dataItem = this.dataItem(e.item);
            if(dms.string.isNotEmpty(dataItem.cmmCd)){
                onSelectSungCdSet(dataItem.cmmCd);
            };
        }
    });

    //도시코드(입력부).
    $("#cityCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "  // 전체
    });

    $("#cityCd").data("kendoExtDropDownList").enable(false);

    //차종 콤보박스
    $("#carlineCd").kendoExtDropDownList({
         dataTextField:"carlineNm"
        ,dataValueField:"carlineCd"
        ,dataSource:carlineList
        ,select:onSelectCarlineCd
        ,optionLabel:" "  // 전체
    });

    //모델 콤보박스
    $("#modelCd").kendoExtDropDownList({
        dataTextField:"modelNm"
        ,dataValueField:"modelCd"
        ,select:onSelectModelCd
        ,optionLabel:" "  // 전체
    });
    $("#modelCd").data("kendoExtDropDownList").enable(false);

    //OCN 콤보박스
    $("#ocnCd").kendoExtDropDownList({
        dataTextField:"ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "  // 전체
    });
    $("#ocnCd").data("kendoExtDropDownList").enable(false);


    //승급원인(입력부).   pmoCauCdList
    $("#pmoCauCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:pmoCauCdList
    });

    //자료배송상태(입력부).   sendCdList
    $("#sendCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:sendCdList
    });

    //영업활동정보출처      salesActiveSrcCdList
    $("#salesActiveSrcCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:salesActiveSrcCdList
    });

    //부품오더여부(입력부).
    $("#parOrdYn").kendoExtDropDownList({
         dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,dataSource:ynDataSource
        ,index:1
    });

/*************************************************************
 * 이벤트 정의
 *************************************************************/

     //조회버튼
     $("#btnSearch").kendoButton({
         click:function(e) {
             var grid = $("#vocGrid").data("kendoExtGrid");
             if(crmJs.isDateValidPeriod($("#sRegStartDt").data("kendoExtMaskedDatePicker").value()
                     ,$("#sRegEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                 grid.dataSource.page(1);
                 initForm();
                 readOnlyDefualtForm(true);
             }else{
                 $("#sRegEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                 $("#sRegEndDt").focus();
             }
             
             
             if(crmJs.isDateValidPeriod($("#sEvalAllocDtStart").data("kendoExtMaskedDatePicker").value()
                     ,$("#sEvalAllocDtEnd").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                 grid.dataSource.page(1);
                 initForm();
                 readOnlyDefualtForm(true);
             }else{
                 $("#sEvalAllocDtEnd").data("kendoExtMaskedDatePicker").value(new Date(''));
                 $("#sEvalAllocDtEnd").focus();
             } 
             
         }
     });

     setKendoDate = function( dtValue){
         return kendo.toString(kendo.parseDate(dtValue),"<dms:configValue code='dateFormat' />");
     };
     //엑셀Export
     $("#btnExcelExport").kendoButton({
         click:function(e) {

             var params = {};
             params = gridCommonParams();
			 //2018-11-09 add by 审核分派时间查询条件校验
           
            /*  if (crmJs.isDateValidPeriod($("#sEvalAllocDtEnd").data("kendoExtMaskedDatePicker").value()
                     ,$("#sEvalAllocDtStart").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
            	 
            	 $("#sEvalAllocDtEnd").data("kendoExtMaskedDatePicker").value(new Date(''));
                 $("#sEvalAllocDtEnd").focus();
              
             } */

             if(crmJs.isDateValidPeriod($("#sRegStartDt").data("kendoExtMaskedDatePicker").value()
                     ,$("#sRegEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
              // VOC 엑셀Export 수량 데이터를 조회한다.
                 $.ajax({
                     url:"<c:url value='/crm/crq/vocMgmt/selectVocMgmtsExcelExportCnt.do' />",
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

                         dms.ajax.excelExport({
                             "beanName":"vocMgmtService"
                             ,"templateFile":"VocMgmtExcel_Tpl.xlsx"
                             ,"fileName":"<spring:message code='crm.menu.vocMng' />_"+kendo.toString(new Date(), "yyyy-MM-dd-HHmmss")+".xlsx"
                             ,"sCust":$("#sCust").val()
                             ,"sVocNo":$("#sVocNo").val()
                             ,"sRegStartDt":setKendoDate($("#sRegStartDt").data("kendoExtMaskedDatePicker").value())
                             ,"sRegEndDt":setKendoDate($("#sRegEndDt").data("kendoExtMaskedDatePicker").value())
                              ,"sEvalAllocDtStart":setKendoDate($("#sEvalAllocDtStart").data("kendoExtMaskedDatePicker").value())
                             ,"sEvalAllocDtEnd":setKendoDate($("#sEvalAllocDtEnd").data("kendoExtMaskedDatePicker").value()) 
                             ,"sBhmcYn":$("#sBhmcYn").data("kendoExtDropDownList").value()
                             ,"sVocTpCd":$("#sVocTpCd").val()
                             ,"sVocStatCd":$("#sVocStatCd").val()
                             ,"sCmplCauCd":$("#sCmplCauCd").val()
                             ,"sMngScId":$("#sMngScId").val()
                             ,"sPprocIdNm":$("#sPprocIdNm").val()
                         });

                     }
                 });

             }else{
                 $("#sRegEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                 $("#sRegEndDt").focus();
             }
         }
         , enable:false
     });

      // 신규 - vocGrid
      $("#btnNew").kendoButton({
          click:function(e) {

              initForm();   // 초기화
              readOnlyDefualtForm(false);   // 읽기전용 해제
              vocCustSearchPopup = "Y";       // 실처리인 선택 팝업을 띄우기 위한 값설정.

              $("#btnVocStat01").data("kendoButton").enable(true);    //접수 ( 페이지 로딩 , 신규 시 접수버튼 활성화 )

              //******* VOC 요청접수 일때 읽기전용 *******//
              $("#vocNo").attr("readonly", true);
              $("#vocStatCd").data("kendoExtDropDownList").value("");
              $("#vocStatCd").data("kendoExtDropDownList").enable(false);
              $("#vocTpCd").data("kendoExtDropDownList").value("01");
              $("#vocTpCd").data("kendoExtDropDownList").trigger("select")


              $("#vocTpSub2Cd").data("kendoExtDropDownList").enable(false);
              $("#vocTpSub3Cd").data("kendoExtDropDownList").enable(false);

              $("#cmplCauCd").data("kendoExtDropDownList").enable(false);              //불만이유
              $("#vocEndDt").data("kendoExtMaskedDateTimePicker").enable(false);

              //긴급구조
              $("#emgcRescFstCallYn").data("kendoExtDropDownList").enable(false);
              $("#emgcRescYn").data("kendoExtDropDownList").enable(false);
              $("#emgcRescReasonNm").data("kendoExtDropDownList").enable(false);
              $("#emgcRescStsfCont").data("kendoExtDropDownList").enable(false);
              $("#emgcRescLocCont").attr("disabled", true);                            //고객구조위치

              $("#custPrefCommNo").attr("disabled", true);
              $("#hpNo").attr("disabled", true);
              $("#homeTelNo").attr("disabled", true);
              $("#officeTelNo").attr("disabled", true);
              $("#pconCustMjrTelNo").attr("disabled", true);
              $("#pconCustHpNo").attr("disabled", true);
              $("#pconCustHomeTelNo").attr("disabled", true);
              $("#pconCustOfficeTelNo").attr("disabled", true);
              $("#resvDt").data("kendoExtMaskedDateTimePicker").enable(false);

              $("#pprocDeptNm").attr("disabled", true);
              $("#bizDeptNm").attr("disabled", true);
              $("#officeNm").attr("disabled", true);
              $("#sungCd").data("kendoExtDropDownList").enable(false);
              $("#cityCd").data("kendoExtDropDownList").enable(false);

              $("#modelCd").data("kendoExtDropDownList").enable(false);
              $("#ocnCd").data("kendoExtDropDownList").enable(false);

              $("#acptDeptNm").attr("disabled", true);
              $("#pacptId").attr("disabled", true);
              $("#pacptNm").attr("disabled", true);
              $("#acptDt").data("kendoExtMaskedDateTimePicker").enable(false);
              $("#manufacturer").attr("disabled", true);

              //VOC 처리
              $("#pevalId").attr("disabled", true);
              $("#pevalNm").attr("disabled", true);
              $("#returnCauCont").attr("disabled", true);
              $("#pmoCauCd").data("kendoExtDropDownList").enable(false);
              $("#realPprocNm").attr("disabled", true);
              $("#pprocTelNo").attr("disabled", true);
              $("#stsfIvstEmpNm").attr("disabled", true);
              $("#mthAchvHm").data("kendoExtMaskedDateTimePicker").enable(false);
              $("#traceDt").data("kendoExtMaskedDateTimePicker").enable(false);

              $("#evalAllocDt").data("kendoExtMaskedDateTimePicker").enable(false);
              $("#pmoDt").data("kendoExtMaskedDateTimePicker").enable(false);
              $("#procDt").data("kendoExtMaskedDateTimePicker").enable(false);
              $("#pprocEmailNm").attr("disabled", true);
              $("#stsfIvstDt").data("kendoExtMaskedDateTimePicker").enable(false);
              $("#traceRsltCont").attr("disabled", true);

              $("#revMthCont").attr("disabled", true);

              // 부품정보
              $("#parOrdYn").data("kendoExtDropDownList").enable(false);
              $("#parOrdDt").data("kendoExtMaskedDateTimePicker").enable(false);
              $("#parArrvDt").data("kendoExtMaskedDateTimePicker").enable(false);
              //******* VOC 요청접수 일때 읽기전용 *******//

              $("#btnVocStat01").data("kendoButton").enable(true);    //접수 ( 페이지 로딩 , 신규 시 접수버튼 활성화 )

              // 접수인(로그인), 접수시간(현재시간)
              $.ajax({
                  url:"<c:url value='/crm/cmm/selectSysDate.do' />",
                  type:'POST',
                  dataType:'json',
                  contentType:'application/json',
                  error:function(jqXHR,status,error) {
                      dms.notification.error(jqXHR.responseJSON.errors);
                      $("#acptDt").data("kendoExtMaskedDateTimePicker").enable(true);
                  },
                  success:function(jqXHR, textStatus) {
                      var sysDateTime = jqXHR;
                      $("#acptDt").data("kendoExtMaskedDateTimePicker").value(sysDateTime);
                  }
              });

              $("#pacptId").val("<c:out value='${loginUserId}' />");
              $("#pacptNm").val("<c:out value='${loginUserNm}' />");
              $("#manufacturer").val("<c:out value='${loginDlrNm}' />");

          }
          , enable:true
      });

      //활동목록 그리드
      //버튼 - 추가
      $("#btnAdd").kendoButton({
          click:function(e) {

              var grid = $('#vocGrid').data('kendoExtGrid');
              var selectedItem = grid.dataItem(grid.select());

              if ( selectedItem !== null ) {

                  vocActiveAddRow(0, "", null, null, null);
              };

          }
          , enable:false
      });

      //버튼 - 저장
      $("#btnActiveSave").kendoButton({
          click:function(e) {

              var grid = $('#vocGrid').data('kendoExtGrid');
              var selectedItem = grid.dataItem(grid.select());
              if(selectedItem!=null) {
                  var gridActive = $("#activeGrid").data("kendoExtGrid");
                  var saveData = gridActive.getCUDData("insertList", "updateList", "deleteList", ["regDtFormat", "startDtFormat", "endDtFormat", "pgssHmFormat", "expcStartDtFormat", "expcEndDtFormat", "callStartDtFormat", "callEndDtFormat"]);
                  if (gridActive.cudDataLength == 0) {
                      //변경된 정보가 없습니다.
                      dms.notification.info("<spring:message code='global.info.required.change'/>");
                      return;
                  }

                  if (gridActive.gridValidation()) {

                      vocActiveInsert(saveData);

                  }else{
                      //입력값을 확인하여 주십시오.
                      dms.notification.warning("<spring:message code='global.info.check.input'/>");
                  }
              } else {
                  //VOC 목록을 먼저 선택해 주십시오.
                  dms.notification.info("<spring:message code='global.info.required.selectVoc'/>");
              }
          }
          , enable:false
      });

      //취소
      $("#btnCancel").kendoButton({
          click:function(e) {
              $('#activeGrid').data('kendoExtGrid').cancelChanges();
          }
          , enable:false
      });

/*************************************************************
 * DataSource 영역
 *************************************************************/

/*************************************************************
 * 그리드 셋팅
 *************************************************************/
       //그리드 설정(VOC 마스터)
       $("#vocGrid").kendoExtGrid({
           gridId:"G-CRM-0519-172116"
           ,dataSource:{
               transport:{
                   read:{
                       url:"<c:url value='/crm/crq/vocMgmt/selectVocMgmts.do' />"
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

                           //console.log("voc : ",params);
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
                           id:"vocNo"
                           ,fields:{
                                 vocNo              :{type:"string", editable:false} //VOC번호
                               , vocEndDt           :{type:"date",   editable:false} //VOC종료일자
                               , resvDt             :{type:"date",   editable:false} //예약일자
                               , acptDt             :{type:"date",   editable:false} //접수일자
                               , evalAllocDt        :{type:"date",   editable:false} //심사배정일자
                               , pmoDt              :{type:"date",   editable:false} //승급일자
                               , procDt             :{type:"date",   editable:false} //처리일자
                               , stsfIvstDt         :{type:"date",   editable:false} //만족도조사일자
                               , mthAchvHm          :{type:"date",   editable:false} //방안달성시간
                               , saleDt             :{type:"date",   editable:false} //판매일자
                               , parOrdDt           :{type:"date",   editable:false} //부품오더일자
                               , parArrvDt          :{type:"date",   editable:false} //부품도착일자
                               , regDt              :{type:"date",   editable:false} //등록일자
                               , updtDt             :{type:"date",   editable:false} //수정일자
                               , acptDtFormat       :{type:"date",   editable:false} //요청일자
                               , procDtFormat       :{type:"date",   editable:false} //처리일자
                               , regDtFormat        :{type:"date",   editable:false} //수정일자

                           }
                       }
                       ,parse:function(d) {
                           if(d.data){
                               $.each(d.data, function(idx, elem) {
                                   elem.acptDtFormat = kendo.parseDate(elem.acptDt, "<dms:configValue code='dateFormat' />");
                                   elem.procDtFormat = kendo.parseDate(elem.procDt, "<dms:configValue code='dateFormat' />");
                                   elem.regDtFormat  = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                               });
                           }
                           return d;
                       }
               }
           }
           ,dataBound:function (e) {

               var param = {};
               var vocCnt1 = 0;
               var vocCnt2 = 0;
               var vocCnt3 = 0;
               var vocCnt4 = 0;

               $.ajax({
                       url:"<c:url value='/crm/crq/vocMgmt/selectVocTpCdSummeryCnt.do' />"
                       ,data:JSON.stringify(param)      //파라미터
                       ,type:'POST'                        //조회요청
                       ,dataType:'json'                  //json 응답
                       ,contentType:'application/json'   //문자열 파라미터
                       ,async:false
                       ,error:function(jqXHR,status,error){
                           //dms.notification.error("<spring:message code='crm.lbl.dtlInfo' var='arg' /><spring:message code='crm.info.findFail' arguments='${arg}' />");
                       }
               }).done(function(body) {

                   vocCnt1 = body.vocCnt1;
                   vocCnt2 = body.vocCnt2;
                   vocCnt3 = body.vocCnt3;
                   vocCnt4 = body.vocCnt4;

               });

               $("#vocCnt1").html("<strong>"+vocCnt1+"</strong>");
               $("#vocCnt2").html("<strong>"+vocCnt2+"</strong>");
               $("#vocCnt3").html("<strong>"+vocCnt3+"</strong>");
               $("#vocCnt4").html("<strong>"+vocCnt4+"</strong>");

               // TODO 조회 완료후 상단 요약정보 조회 ( 진행중인 상태의 전체 목록 / 검색조건이랑 상관없음 )
               var dataItems = e.sender.dataSource.view();

               if ( dataItems.length > 0 ) {
                   $("#btnExcelExport").data("kendoButton").enable(true);
               } else {
                   $("#btnExcelExport").data("kendoButton").enable(false);
               };


               // 콜번호가 있는경우 연락처 조회후 첫번째 그리드 선택
               if ( isGridReload ) {

                   var grid = $("#vocGrid").data("kendoExtGrid")
                   , rows = grid.tbody.find("tr")
                   , gridData
                   , selectRow

                   gridData = grid.dataSource.at(0);
                   selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(0);
                   grid.select(selectRow);
                   isGridReload = false;

               };

           }
           ,height:350
           ,navigatable:false
           ,resizable:true
           ,editable:false
           ,filterable:{
               mode:"row"
           }
           ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
           ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
           ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
           ,appendEmptyColumn:true           //빈컬럼 적용. default:false
           ,enableTooltip:true               //Tooltip 적용, default:false
           ,selectable:"row"
           ,change:function(e){

               var selectedItem = this.dataItem(this.select());

               if( dms.string.isNotEmpty(selectedItem) ){


                   fnVocMgmtByKey(selectedItem.vocNo);

               };

           }
           ,columns:[
                        {field:"vocNo", title:"<spring:message code='global.lbl.vocNo' />", attributes:{"class":"ac"}, width:170}    //VOC번호
                       ,{field:"bhmcYn", hidden:true}      // 서비스요청출처
                       ,{field:"bhmcYnNm", title:"<spring:message code='crm.lbl.vocSource' />", attributes:{"class":"ac"}, width:100}      // 서비스요청출처
                       ,{field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100         // 고객명
                           ,template:function(dataItem){
                               if(dataItem.custNm === null){
                                   dataItem.custNm = "";
                               };
                               var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                               if ( dataItem.bhmcYn === "N" ) {
                                   spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                               } else {
                                   spanObj = dataItem.custNm;
                               };
                               return spanObj;
                           }
                       }
                       ,{field:"custPrefCommNo", title:"<spring:message code='global.lbl.telNumer' />", attributes:{"class":"ac"}, width:100}    //연락처
                       ,{field:"vocTpCdNm", title:"<spring:message code='global.lbl.vocTpCd' />", attributes:{"class":"ac"}, width:100}    //VOC유형코드명
                       ,{field:"vocStatCdNm", title:"<spring:message code='global.lbl.vocStatCd' />", attributes:{"class":"ac"}, width:100}    //VOC상태코드명
                       ,{field:"acptDtFormat", title:"<spring:message code='crm.lbl.acptDt' />", width:100   // 접수일
                           ,attributes:{"class":"ac tooltip-disabled"}
                           ,template:"#if (acptDtFormat !== null ){# #= kendo.toString(data.acptDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                       }
                       ,{field:"procDtFormat", title:"<spring:message code='crm.lbl.procDt' />", width:100   // 처리일자
                           ,attributes:{"class":"ac tooltip-disabled"}
                           ,template:"#if (procDtFormat !== null ){# #= kendo.toString(data.procDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                       }
                       ,{field:"emgcRescYn", title:"<spring:message code='crm.lbl.emgcRescYn' />", attributes:{"class":"ac"}, width:100}    //긴급구조여부
                       ,{field:"pprocDeptNm", title:"<spring:message code='global.lbl.pprocDeptNm' />", attributes:{"class":"ac"}, width:100}    //처리부서
                       ,{field:"pprocNm", title:"<spring:message code='global.lbl.pprocId' />", attributes:{"class":"ac"}, width:100}    //처리인
					   /*20190618 add by liuxueying 增加实际处理人*/                       
                       ,{field:"realPprocNm", title:"<spring:message code='global.lbl.realPprocId' />", attributes:{"class":"ac"}, width:100}    //처리인
                       /* 2018-11-09 add by fengdequan 增加审核分派时间查询结果 */
                       ,{field:"evalAllocDt", title:"<spring:message code='global.lbl.evalAllocDt' />", width:100   // 등록일
                           ,attributes:{"class":"ac tooltip-disabled"}
                           ,template:"#if (evalAllocDt !== null ){# #= kendo.toString(data.evalAllocDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                       }
                       
                       ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:100   // 등록일
                           ,attributes:{"class":"ac tooltip-disabled"}
                           ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                       }
           ]
       });
	
	
       //2018-11-08 add byfengdequan 增加下载功能start
       //엑셀버튼
       $("#btnExcelExport2").kendoButton({

           click:function(e){

               var param = $.extend(
                        {"sDlrCd"            :$("#dlrCd").val()}
                       ,{"sVocNo"            :$("#vocNo").val()}
                       ,{"sBhmcVocNo"            :$("#bhmcVocNo").val()}

               );

               // 엑셀다운로드 row수 체크
               $.ajax({
                   url:"<c:url value='/crm/crq/vocMgmt/selectActivesCnt.do' />"
                   ,data:JSON.stringify(param)
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   ,error:function(jqXHR, status, error){
                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   }
                   ,success:function(result){
                       if(result.total <= 10000){
                           dms.ajax.excelExport({
                               "beanName"              :"vocMgmtService"
                                ,"templateFile"         :"vocMgmtServiceList_Tpl.xlsx"
                                ,"fileName"             :"服务请求活动.xlsx"
                                   
                                ,"sDlrCd"            :$("#dlrCd").val()
        	                    ,"sVocNo"            :$("#vocNo").val()
        	                    ,"sBhmcVocNo"        :$("#bhmcVocNo").val()
        	                    ,"sListType"            :"RS"
                           });
                       }else{
                           dms.notification.warning("<spring:message code='global.btn.excelDownload' var='excelDownload'/><spring:message code='global.err.chkGreateParam' arguments='${excelDownload},10000' />");
                       }
                   }
              });
           }
       , enable:false
       });

                  /*  callExcelDownload = function(firstIdx, lastIdx, maxRow, fileCnt, downCnt){
                       dms.ajax.excelProgressExport({
                           "beanName"              :"vocMgmtService"
                           ,"templateFile"         :"vocMgmtServiceList_Tpl.xlsx"
                           ,"fileName"             :"<spring:message code='ser.menu.roStatus' />.xlsx"
                           
                           ,"sDlrCd"            :$("#dlrCd").val()
	                       ,"sVocNo"            :$("#vocNo").val()
	                       ,"sBhmcVocNo"        :$("#bhmcVocNo").val()
                       
                           ,"sListType"            :"RS"
                           ,"firstIndex"           :firstIdx
                           ,"lastIndex"            :lastIdx
                       }, maxRow, fileCnt, downCnt);
                   }; */
                   
                 //2018-11-08 add byfengdequan 增加下载功能end
	

       //그리드 설정(활동목록)
       $("#activeGrid").kendoExtGrid({
           gridId:"G-CRM-0519-172122"
           ,dataSource:{
               transport:{
                   read:{
                       url:"<c:url value='/crm/crq/vocMgmt/selectActives.do' />"
                   }
                   ,parameterMap:function(options, operation) {
                       if (operation === "read") {

                           var params = {};

                           params["recordCountPerPage"]    = options.pageSize;
                           params["pageIndex"]             = options.page;
                           params["firstIndex"]            = options.skip;
                           params["lastIndex"]             = options.skip + options.take;
                           params["sort"]                  = options.sort;

                           params["sDlrCd"]       = $("#dlrCd").val();
                           params["sVocNo"]       = $("#vocNo").val();
                           params["sBhmcVocNo"]   = $("#bhmcVocNo").val();

                           //console.log("vocActive param : ",params);
                           return kendo.stringify(params);

                       }else if (operation !== "read" && options.models) {
                           return kendo.stringify(options.models);
                       }
                   }
               }
               ,schema:{
                       model:{
                           id:"vocActiveNo"
                           ,fields:{
                                 vocActiveNo:{type:"string"}
                               , dlrCd:{type:"string"}
                               , vocNo:{type:"string", editable:false}
                               , regUsrId:{type:"string", editable:false}
                               , regUsrNm:{type:"string",editable:false}
                               , regDeptNm:{type:"string" , editable:false}
                               , activeStatCd:{type:"string"}
                               , activeTpCd:{type:"string"}
                               , activeTpSubCd:{type:"string"}
                               , custNo:{type:"string"}
                               , custNm:{type:"string", editable:false}
                               , pconCustNo:{type:"string"}
                               , pconCustNm:{type:"string", editable:false}
                               , activeRsltCont:{type:"string"}
                               , activeCd:{type:"string"}
                               , activeTpCd:{type:"string",editable:true}

                               , bhmcVocActiveNo:{type:"string",editable:false}
                               , alrtCd:{type:"string",editable:false}
                               , callSeq:{type:"string",editable:false}
                               , emailActiveCd:{type:"string",editable:false}
                               , bhmcVocNo:{type:"string",editable:false}
                               , ownerNm:{type:"string",editable:false}

                               , recFileId:{type:"string",editable:false}
                               , callHisSeq:{type:"number",editable:false}
                               , callDialNum:{type:"string",editable:false}

                               , regDt:{type:"date", editable:false}
                               , regDtFormat:{type:"date", editable:false}
                               , startDt :{type:"date", editable:false}
                               , startDtFormat :{type:"date", editable:false}
                               , endDt :{type:"date", editable:false}
                               , endDtFormat :{type:"date", editable:false}
                               , pgssHm :{type:"date", editable:false}
                               , pgssHmFormat :{type:"date", editable:false}
                               , expcStartDt :{type:"date", editable:false}
                               , expcStartDtFormat :{type:"date", editable:false}
                               , expcEndDt :{type:"date", editable:false}
                               , expcEndDtFormat :{type:"date", editable:false}
                               , callStartDt :{type:"date", editable:false}
                               , callStartDtFormat :{type:"date", editable:false}
                               , callEndDt :{type:"date", editable:false}
                               , callEndDtFormat :{type:"date", editable:false}
                           }
                       }
                       ,parse:function(d) {
                           if(d.data){
                               $.each(d.data, function(idx, elem) {
                                   elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateTimeFormat' />");
                                   elem.startDtFormat = kendo.parseDate(elem.startDt, "<dms:configValue code='dateTimeFormat' />");
                                   elem.endDtFormat = kendo.parseDate(elem.endDt, "<dms:configValue code='dateTimeFormat' />");
                                   elem.pgssHmFormat = kendo.parseDate(elem.pgssHm, "<dms:configValue code='dateTimeFormat' />");
                                   elem.expcStartDtFormat = kendo.parseDate(elem.expcStartDt, "<dms:configValue code='dateTimeFormat' />");
                                   elem.expcEndDtFormat = kendo.parseDate(elem.expcEndDt, "<dms:configValue code='dateTimeFormat' />");
                                   elem.callStartDtFormat = kendo.parseDate(elem.callStartDt, "<dms:configValue code='dateTimeFormat' />");
                                   elem.callEndDtFormat = kendo.parseDate(elem.callEndDt, "<dms:configValue code='dateTimeFormat' />");
                               });
                           }
                           return d;
                       }
               }
               //2018-12-04 add byfengdequan 防止查询结果为0，导出报错 start
           }  ,dataBound:function (e) {

               var param = {};
      
               var dataItems = e.sender.dataSource.view();

               if ( dataItems.length > 0 ) {
                   $("#btnExcelExport2").data("kendoButton").enable(true);
               } else {
                   $("#btnExcelExport2").data("kendoButton").enable(false);
               };
           }
         //2018-12-04 add byfengdequan 防止查询结果为0，导出报错 end 
         ,autoBind:false
           ,height:200
           ,navigatable:true
           //,resizable:false
           ,sortable:false
           ,scrollable: {
               virtual: true
           }
           ,filterable:{
               mode:"row"
           }
           ,cellTextToClipboard:true         //그리드 셀에서 CTRL+더블클릭시 셀데이터를 클립보드에 복사한다.
           ,appendEmptyColumn:true           //빈컬럼 적용. default:false
           ,enableTooltip:true               //Tooltip 적용, default:false
           ,height:200
           ,editableOnlyNew:true
           ,selectable:"row"
           ,columns:[
                 {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
                ,{field:"vocNo", title:"<spring:message code='global.lbl.vocNo' />", hidden:true}          // VOC번호
                ,{field:"vocActiveNo", title:"<spring:message code='global.lbl.vocActiveNo' />", hidden:true} // VOC활동번호
                ,{field:"regDtFormat", title:"<spring:message code='crm.lbl.regDt' />", width:150   // 작성시간
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateTimeFormat' />') # #} else {# #= '' # #}#"
                }
                ,{field:"regUsrNm", title:"<spring:message code='crm.lblvocRregUsrId' />"       //작성인
                    , attributes:{"class":"ac"}, width:100
                }
                ,{field:"regDeptNm", title:"<spring:message code='crm.lbl.vocRegDeptNm' />"     //작성 부문
                    , attributes:{"class":"ac"}, width:150
                }
                ,{field:"activeStatCd", title:"<spring:message code='global.lbl.statNm' />", width:100        // 상태
                    ,editor:function(container, options) {
                        $('<input name="activeStatCd" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                             autoBind:false
                            ,dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:activeStatCdList
                        })
                        $('<span class="k-invalid-msg" data-for="activeStatCd"></span>').appendTo(container);
                    }
                    ,template:'#= activeStatCdArrVal(activeStatCd)#'
                }
                ,{ field:"activeTpCd" ,title:"<spring:message code='global.lbl.type' />" ,width:150   // 유형
                    ,template:"#=activeTpCdArrVal(activeTpCd)#"
                    ,editor:function (container, options){
                        if ( dms.string.isEmpty(options.model.vocActiveNo) || dms.string.isEmpty(options.model.activeTpCd) ) {

                            var  bhmcYn = $("#bhmcYn").val()
                                ,bhmcVonNo = $("#bhmcVonNo").val()
                                ,activeTpCdFilterList = []
                            ;

                            // bhmc 여부에 따라서 드롭다운리스트 DS가 변경.
                            if ( dms.string.isEmpty(bhmcVonNo) && bhmcYn === "N" ) {
                                activeTpCdFilterList = activeTpCdList;
                            } else {
                                activeTpCdFilterList = dms.data.cmmCdFilter(activeTpCdList);
                            }

                            $('<input name="activeTpCd" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                autoBind:false
                                ,dataTextField:"cmmCdNm"
                                ,dataValueField:"cmmCd"
                                ,dataSource:activeTpCdFilterList
                                ,select:function(e){
                                    var dataItem = this.dataItem(e.item);
                                    var grid = $("#activeGrid").data("kendoExtGrid");
                                    var selectRow = grid.dataItem(grid.select());
                                    selectRow.set("activeTpSubCd", '');
                                }
                            });

                        }else{
                            container.context.innerText = dms.string.strNvl(activeTpCdArrVal[options.model.activeTpCd]);
                        }
                    }
                }
                 , { field:"activeTpSubCd", title:"<spring:message code='crm.lbl.activeTpSubCd' />" ,width:140      //자 유형
                    ,editor:function(container, options) {

                        var activeTpCd = options.model.activeTpCd;

                         $('<input data-bind="value:' + options.field + '"  />')
                         .appendTo(container)
                         .kendoExtDropDownList({
                             dataTextField: "cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:activeTpSubCdListObj[activeTpCd]
                         });
                     }
                    ,template:'#= activeTpSubCdArrVal(activeTpSubCd)#'
                 }
                ,{field:"custNo", title:"<spring:message code='global.lbl.customer' />", hidden:true}           // 고객
                ,{field:"custNm", title:"<spring:message code='global.lbl.customer' />", width:100, attributes:{"class":"ac"}}     // 고객

                ,{field:"pconCustNo", title:"<spring:message code='crm.lbl.pconCustInfo' />", hidden:true}       // 연계인
                ,{field:"pconCustNm", title:"<spring:message code='crm.lbl.pconCustInfo' />", width:100, attributes:{"class":"ac"}}    // 연계인

                ,{field:"activeRsltCont", title:"<spring:message code='crm.lbl.activeRsltCont' />"
                    ,attributes:{"class":"tooltip-enabled"}
                    ,width:200
                    ,editor:function(container, options) {
                        $('<input name="activeRsltCont" type="text" maxlength="1500" style="width:100%" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        $('<span class="k-invalid-msg" data-for="activeRsltCont"></span>').appendTo(container);
                    }
                }       // 실행 결과
                ,{field:"activeCont", title:"<spring:message code='crm.lbl.vocActiveCont' />", width:100    //실행 내용
                    ,attributes:{"class":"tooltip-enabled"}
                    ,editor:function(container, options) {
                        $('<input name="activeCont" type="text" maxlength="150" style="width:100%" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        $('<span class="k-invalid-msg" data-for="activeCont"></span>').appendTo(container);
                    }
                }
                ,{field:"alrtCd", title:"<spring:message code='crm.lbl.vocAlrtCd' />", width:80, filterable:false   //알람
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem) {

                        var checked = "";
                        var disabled = "";

                        if(dataItem.alrtCd == "Y"){
                            checked = "checked"
                        };

                        if ( dms.string.isNotEmpty(dataItem.vocActiveNo) ) {
                            disabled = "disabled";
                        } else {
                            disabled = "";
                        };

                        return "<input type='checkbox' name='alrtCd' data-uid='" + dataItem.uid + "' class='alrtCd' " + checked +" "+disabled+" />";

                    }
                }
                , {field:"callSeq", title:"<spring:message code='crm.lbl.vocCallSeq' />"    //통화번호
                    , width:100, attributes:{"class":"ac"}
                }
                , {field:"stsfCont", title:"<spring:message code='crm.lbl.vocStsfCont' />", width:100    //만족도
                    , attributes:{"class":"ac"}
                }
                , {field:"emailSenderNm", title:"<spring:message code='crm.lbl.vocEmailSenderNm' />", width:100        //발건인
                    , attributes:{"class":"ac"}
                }
                , {field:"emailSenderAddrNm", title:"<spring:message code='crm.lbl.vocEmailSenderAddrNm' />", width:100    //발건주소
                    , attributes:{"class":"ac"}
                }
                ,{field:"emailActiveCd", title:"<spring:message code='crm.lbl.vocEmailActiveCd' />", width:80, filterable:false
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem) {

                        var checked = "";
                        var disabled = "";

                        if(dataItem.emailActiveCd == "Y"){
                            checked = "checked"
                        };

                        if ( dms.string.isNotEmpty(dataItem.vocActiveNo) ) {
                            disabled = "disabled";
                        } else {
                            disabled = "";
                        };
                        return "<input type='checkbox' name='emailActiveCd' data-uid='" + dataItem.uid + "' class='emailActiveCd' " + checked +" "+disabled+" />";
                    }
                }
                , {field:"ownerNm", title:"<spring:message code='crm.lbl.vocOwnerId' />", width:100        //소유자
                    , attributes:{"class":"ac"}
                }
                , {field:"bhmcVocNo", title:"<spring:message code='global.lbl.BhmcVocNo' />", width:100, hidden:true    //BHMCVOC번호
                    , attributes:{"class":"ac"}
                }
                , {field:"bhmcVocActiveNo", title:"<spring:message code='crm.lbl.bhmcVocActiveNo' />", width:100    //BHMC VOC활동번호
                    , attributes:{"class":"ac"}
                }
                ,{field:"startDt", title:"<spring:message code='crm.lbl.vocActiveStartDt' />", width:150   // 시작시간
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (startDtFormat !== null ){# #= kendo.toString(data.startDt, '<dms:configValue code='dateTimeFormat' />') # #} else {# #= '' # #}#"
                }
                ,{field:"endDt", title:"<spring:message code='crm.vocActiveEndDt' />", width:150   // 종료시간
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (endDtFormat !== null ){# #= kendo.toString(data.endDt, '<dms:configValue code='dateTimeFormat' />') # #} else {# #= '' # #}#"
                }
                ,{field:"pgssHm", title:"<spring:message code='crm.lbl.vocPgssHm' />", width:150   // 통화 연결 시간
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (pgssHmFormat !== null ){# #= kendo.toString(data.pgssHm, '<dms:configValue code='dateTimeFormat' />') # #} else {# #= '' # #}#"
                }
                ,{field:"expcStartDt", title:"<spring:message code='crm.lbl.vocActivePlanStartDt' />", width:150   // 계획시작시간
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (expcStartDtFormat !== null ){# #= kendo.toString(data.expcStartDt, '<dms:configValue code='dateTimeFormat' />') # #} else {# #= '' # #}#"
                }
                ,{field:"expcEndDt", title:"<spring:message code='crm.lbl.expcEndDt' />", width:150   // 예정종료일자
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (expcEndDtFormat !== null ){# #= kendo.toString(data.expcEndDt , '<dms:configValue code='dateTimeFormat' />') # #} else {# #= '' # #}#"
                }
                ,{field:"callDialNum", title:"<spring:message code='global.lbl.sendTelNo' />", width:100, attributes:{"class":"ac"}}
                ,{field:"callStartDt", title:"<spring:message code='crm.lbl.callStartDt' />", width:150   // 통화시작시간
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (callStartDtFormat !== null ){# #= kendo.toString(data.callStartDt, '<dms:configValue code='dateTimeFormat' />') # #} else {# #= '' # #}#"
                }
                ,{field:"callEndDt", title:"<spring:message code='crm.lbl.callEndDt' />", width:150   // 통화끝난시간
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (callEndDtFormat !== null ){# #= kendo.toString(data.callEndDt , '<dms:configValue code='dateTimeFormat' />') # #} else {# #= '' # #}#"
                }
                ,{field:"recFileId", title:"<spring:message code='crm.lbl.recFileId' />", width:100    // 녹취파일
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj;
                        if ( dms.string.isNotEmpty(dataItem.recFileId) ) {
                            spanObj = "<a href = '#' onClick='recFileDown(\"A\")'>"+dataItem.recFileId+"</a>";
                        } else {
                            spanObj = "";
                        };
                        return spanObj;
                    }
                }
                ,{field:"callHisSeq", title:"<spring:message code='crm.lbl.callHisSeq' />", width:100    // 콜센터이력일련번호
                    ,attributes:{"class":"ac"}
                    ,template:"#if (callHisSeq > 0){# #= callHisSeq # #} else {# #= '' # #}#"

                }
           ]
       });

       if($("#vocNo").val() === ""){
           changeComboList($("#vocTpCd").val());
           readOnlyDefualtForm(true);
       };

//        console.log("mngScIdCtrl:::" + "${mngScIdCtrl}" );


        <%-- IB가 있는경우 --%>
        <c:if test="${callTelNo != ''}">

            var callTelNo = "<c:out value='${callTelNo}' />";
            $("#btnNew").click();
            $("#receiveTelNo").val(callTelNo);
            custSearchPopOpen('R');
            // TODO VOC 검색이 고객>연계인 팝업

        </c:if>

        <%-- VOC 번호가 있는경우 --%>
        <c:if test="${vocNo != ''}">
            fnVocMgmtByKey("${vocNo}");
        </c:if>

});

/*****************************************************************************
 ******************************* 콜센터 상태호출 *********************************
 *****************************************************************************/
var XMLHttpReqOB;
var _isCallPcOB = "";
var _userId = "";
var _callStatCd = "";

// 디바이스 상태를 대기 상태로 초기화한다.
function callDeviceInit() {

    var params = "event_type=8&line=1&ibseq=&obseq=&device_id=&device_ip=&caller=&RingCnt=&device_port=&duration=&TimeLong=&FilePath=&date=&userId="+_userId;

    //console.log("voc OB 초기화 : ",params)
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
            console.log("VOC OB:",callStatus.callDevicePc+" | userId:"+_userId+" | Status:"+_callStatCd);
            // 콜센터 PC 인경우 전화걸기 버튼 보여주기
            if ( callStatus.callDevicePc ) {

                _userId = callStatus.userId;    // 초기화 번수선언
                _callStatCd = callStatus.callStatCd;    // 초기화 번수선언
                _isCallPcOB = callStatus.callDevicePc;    // 초기화 번수선언

                $("#btnOBCall").removeClass("hidden");
                setTimeout("sendRequestOB()", 1000);

            } else {

                $("#btnOBCall").addClass("hidden");

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

// 콜센터에서 IB 종료후 해당 함수를 호출해서 콜센터 통화 정보를 넘겨준다.
function sendToVocCallInfo(callHisSeq, callFileNm, callDeviceIpNo, callStartDt, callHm){

    if (  dms.string.isEmpty(callHisSeq) ) {
        // {콜센터이력일련번호}을(를) 확인하여 주세요.
        dms.notification.warning("<spring:message code='crm.lbl.callHisSeq' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
        return;
    };
    if (  dms.string.isEmpty(callFileNm) ) {
        // {녹취파일}을(를) 확인하여 주세요.
        dms.notification.warning("<spring:message code='crm.lbl.recFileId' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
        return;
    };

    if( dms.string.isEmpty(callHm) ) {
        callHm = 0;
    };

    var parseCallStartDt = kendo.parseDate(callStartDt, "<dms:configValue code='dateTimeFormat' />");
    var parseCallEndDt = kendo.parseDate(callStartDt, "<dms:configValue code='dateTimeFormat' />");
    parseCallEndDt.setSeconds(parseCallEndDt.getSeconds() + (Number(callHm)));        // 종료시간 설정

    vocActiveAddRow(callHisSeq, callFileNm, parseCallStartDt, parseCallEndDt, "IB");
    $("body").scrollTop($(document).height());      // 하단 활동 그리드로 위치

    callDeviceInit();   // 전화걸기시 디바이스 상태를 초기화해줌.

};

function recFileDown(type) {

    var type
      , dlrCd
      , vocNo
      , recFileId
      , callHisSeq
    ;

    if ( type === "A" ) {

        var grid = $('#activeGrid').data('kendoExtGrid');
        var selectedItem = grid.dataItem(grid.select());

        if ( selectedItem !== null ) {
            vocNo = selectedItem.vocActiveNo;      // 저장여부를 체크하기 위함
            recFileId = selectedItem.recFileId;
            callHisSeq = selectedItem.callHisSeq;
            dlrCd = selectedItem.dlrCd;
        };

    };

    if (  dms.string.isNotEmpty(vocNo) && dms.string.isNotEmpty(recFileId) ) {

        if (  callHisSeq <= 0  ) {
            // {콜센터이력일련번호}을(를) 확인하여 주세요.
            dms.notification.warning("<spring:message code='crm.lbl.callHisSeq' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
            return;
        };

        if (  dms.string.isEmpty(dlrCd) ) {
            // {딜러코드}을(를) 확인하여 주세요.
            dms.notification.warning("<spring:message code='global.lbl.dlrCd' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
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

</script>

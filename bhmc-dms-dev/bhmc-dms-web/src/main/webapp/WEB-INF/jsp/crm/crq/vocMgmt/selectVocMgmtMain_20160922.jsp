<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 기본정보 -->
    <section class="group">
        <div class="header_area">
        <h1 class="title_basic"><spring:message code="crm.menu.vocMng" /></h1><!-- 고객 요청 관리 -->
            <div class="btn_right">
                <button type="button" class="btn_m" id="btnProce"><spring:message code="crm.btn.proce" /></button><!-- 처리 -->
                <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                <button type="button" class="btn_m btn_new" id="btnNew"><spring:message code="global.btn.new" /><!-- 신규 --></button>
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
            </div>
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
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
                            <button type="button" id="btnHidden" class="btn_s"><spring:message code='crm.lbl.custExtrTermDetail' /></button> <!-- 조건상세  条件详情-->
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_form mt5" id="hiddenTable" style="display:none;">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:12%;">
                    <col style="width:10%;">
                    <col style="width:12%;">
                    <col style="width:10%;">
                    <col style="width:12%;">
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
                </tbody>
            </table>
        </div>

        <div class="table_form mt5">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:100%;">
                </colgroup>
                <tbody>
                    <tr>
                        <td>
                            <input id="vocCnt1" name="vocCnt1" type="hidden">
                            <input id="vocCnt2" name="vocCnt2" type="hidden">
                            <input id="vocCnt3" name="vocCnt3" type="hidden">
                            <input id="vocCnt4" name="vocCnt4" type="hidden">
                            <input id="vocCnt5" name="vocCnt5" type="hidden">
                            <input id="vocCnt" name="vocCnt" value="" readOnly class="form_input form_readonly" style="width:100%">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <div id="vocGrid"></div>
        </div>

        <!--  ************************** 그리드 팝업 호출 / 팝업 영역 지정 **************************** -->
        <!-- VOC 불만 처리 -->
        <section id="vocProcRsltContPopup" class="pop_wrap">
            <div class="header_area">
                <%-- <h2 class="title_basic">VOC 불만 처리</h2> --%>
                <div class="btn_right">
                    <button type="button" class="btn_s" id="btnProceSave"><spring:message code="crm.btn.proce" /></button><!-- 처리 -->
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
                                <textarea rows="10" cols="" id="procRsltContTmp" name="procRsltContTmp" class="form_textarea" maxlength="1000" data-name="<spring:message code="global.lbl.procRsltCont" />" ></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!-- //VOC 불만 처리 -->
        <!--  ************************** 그리드 팝업 호출 / 팝업 영역 지정 **************************** -->

        <div class="header_area">
        <h2 class="title_basic"><spring:message code="global.title.vocReqAccept" /></h2><!-- VOC 요청접수 -->
            <%-- <div class="btn_right">
                <button type="button" class="btn_s btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
            </div> --%>
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
                                <input id="bhmcYn" name="bhmcYn" type="hidden" value="N" />
                                <input id="bhmcVocNo" name="bhmcVocNo" type="hidden" />
                                <input id="dlrCd" name="dlrCd" type="hidden" />
                                <input type="text" id="vocNo" name="vocNo" disabled="disabled" class="form_input form_readonly ac" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.telNo" /><!-- 전화번호 --></th>
                            <td>
                                <input type="text" id="receiveTelNo" name="receiveTelNo" class="form_input numberic" data-type="tel" pattern="\d" maxlength="40" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.sendTelNo" /><!-- 발신전화번호 --></th>
                            <td>
                                <input type="text" id="sendTelNo" name="sendTelNo" class="form_input ac" data-type="tel" pattern="\d" maxlength="40" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.vinNo" /><!-- VIN 번호 --></th>
                            <td>
                                <input type="text" id="vinNo" name="vinNo" class="form_input ac" maxlength="17" style="width:100%" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.type" /></span> <!-- 유형 --></th>
                            <td>
                                <input id="vocTpCd" name="vocTpCd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.customer" /><!-- 고객 --></span></th>
                            <td>
                                <input id="custNo" name="custNo" type="hidden">
                                <div id="custSearch" class="form_search">
                                    <input type="text" id="custNm" name="custNm" class="form_input" maxlength="100" style="width:100%" />
                                    <a href="javascript:;"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                </div>
                            </td>
                            <th scope="row" id="pconRelCdTxt" ><spring:message code="global.lbl.pconRelCd" /><!-- 고객 및 문의자 관계 / 고객 및 불만자 관계 / 고객 및 연계인 관계--></th>
                            <td>
                                <input id="pconRelCd" name="pconRelCd" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.carRegNo" /><!-- 차 번호 --></th>
                            <td>
                                <input type="text" id="carRegNo" name="carRegNo" class="form_input ac" maxlength="20" style="width:100%" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.statNm" /><!-- 상태 --></th>
                            <td>
                                <input id="vocStatCd" name="vocStatCd" value="" class="form_comboBox" style="width:100%" />
                                <input type="hidden" id="bfVocStatCd" name="bfVocStatCd" />
                            </td>
                            <th scope="row" id="pconCustInfoTxt" ><spring:message code="global.lbl.pconCustInfo" /><!-- 문의자 / 불만요청자 / 연계인--></th>
                            <td>
                                <input id="pconCustNo" name="pconCustNo" type="hidden">
                                <div id="pconCustSearch" class="form_search">
                                    <input type="text" id="pconCustNm" name="pconCustNm" class="form_input" maxlength="100" style="width:100%" />
                                    <a href="javascript:;"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                </div>
                            </td>
                            <th scope="row" id="pprocDeptNmTxt" ><spring:message code="global.lbl.pprocDeptNm" /><!-- 처리부서 --></th>
                            <td>
                                <input type="text" id="pprocDeptNm" name="pprocDeptNm" class="form_input" maxlength="50" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.carLine" /><!-- 차종 --></th>
                            <td>
                                <input id="carlineNm" name="carlineNm" type="hidden">
                                <input id="carlineCd" name="carlineCd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.vocTpSubCd" /><!-- VOC 하위 유형 --></th>
                            <td class="required_area">
                                <input id="vocTpSubCd" name="vocTpSubCd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.custPrefCommNo" /><!-- 고객 주요 전화번호 --></th>
                            <td>
                                <input type="text" id="custPrefCommNo" name="custPrefCommNo" class="form_input ac" data-type="tel" pattern="\d" maxlength="40" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.pprocId" /><!-- 처리인 --></th>
                            <td>
                                <input type="hidden" id="pprocId" name="pprocId" />
                                <div id="pprocSearch" class="form_search">
                                    <input type="text" id="pprocNm" name="pprocNm" class="form_input" style="width:100%" />
                                    <a href="javascript:;"><spring:message code="global.btn.search" /><!-- 조회 --></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.model" /><!-- 차형 --></th>
                            <td>
                                <input id="modelNm" name="modelNm" type="hidden">
                                <input id="modelCd" name="modelCd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.tendCd" /></span> <!-- 성향 --></th>
                            <td class="required_area">
                                <input id="tendCd" name="tendCd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.hpNo" /><!-- 고객 이동 전화번호 --></th>
                            <td>
                                <input type="text" id="hpNo" name="hpNo" class="form_input ac" data-type="mobile" pattern="\d" maxlength="40" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.coopDeptNm" /><!-- 협조부서 --></th>
                            <td>
                                <input type="text" id="coopDeptNm" name="coopDeptNm" class="form_input" maxlength="50" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.ocnNm" /><!-- OCN명 --></th>
                            <td>
                                <input id="ocnNm" name="ocnNm" type="hidden">
                                <input type="text" id="ocnCd" name="ocnCd" class="form_comboBox" style="width:100%" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.vocTpSub1Cd" /></span> <!-- 1급 Sub 유형 --></th>
                            <td class="required_area">
                                <input id="vocTpSub1Cd" name="vocTpSub1Cd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.homeTelNo" /><!-- 고객 집 전화번호 --></th>
                            <td>
                                <input type="text" id="homeTelNo" name="homeTelNo" class="form_input ac" data-type="tel" pattern="\d" maxlength="40" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.division" /><!-- 사업부 --></th>
                            <td>
                                <input type="text" id="bizDeptNm" name="bizDeptNm" class="form_input" maxlength="50" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.runDistVal" /><!-- 키로 수 --></th>
                            <td>
                                <input type="number" id="runDistVal" name="runDistVal" class="form_input ac" maxlength="10" style="width:100%" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.vocTpSub2Cd" /></span> <!-- 2급 Sub 유형 --></th>
                            <td class="required_area">
                                <input id="vocTpSub2Cd" name="vocTpSub2Cd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.officeTelNo" /><!-- 고객 직장 전화번호 --></th>
                            <td>
                                <input type="text" id="officeTelNo" name="officeTelNo" class="form_input ac" data-type="tel" pattern="\d" maxlength="40" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.officeNm" /><!-- 사무소 --></th>
                            <td>
                                <input type="text" id="officeNm" name="officeNm" class="form_input" maxlength="50" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.acptDeptNm" /><!-- 접수부서 --></th>
                            <td>
                                <input type="text" id="acptDeptNm" name="acptDeptNm" class="form_input" maxlength="100" style="width:100%" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.vocTpSub3Cd" /><!-- 3급 유형 --></th>
                            <td>
                                <input id="vocTpSub3Cd" name="vocTpSub3Cd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.pconCustMjrTelNo" /><!-- 문의자 주요 전화번호 --></th>
                            <td>
                                <input type="text" id="pconCustMjrTelNo" name="pconCustMjrTelNo" class="form_input ac" data-type="tel" pattern="\d" maxlength="40" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.sung" /><!-- 성 --></th>
                            <td>
                                <input id="sungNm" name="sungNm" type="hidden">
                                <input id="sungCd" name="sungCd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.pacptId" /><!-- 접수인 --></th>
                            <td>
                                <input type="hidden" id="pacptId" name="pacptId" />
                                <div id="pacptSearch" class="form_search">
                                    <input type="text" id="pacptNm" name="pacptNm" class="form_input" style="width:100%" />
                                    <a href="javascript:;"><spring:message code="global.btn.search" /><!-- 조회 --></a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.acptSrcCd" /></span> <!-- 접수경로 --></th>
                            <td class="required_area">
                                <input id="acptSrcCd" name="acptSrcCd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.pconCustHpNo" /><!-- 연계인 휴대전화 --></th>
                            <td>
                                <input type="text" id="pconCustHpNo" name="pconCustHpNo" class="form_input ac" data-type="tel" pattern="\d" maxlength="40" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.city" /><!-- 도시 --></th>
                            <td>
                                <input id="cityNm" name="cityNm" type="hidden">
                                <input id="cityCd" name="cityCd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.acptDt" /></span><!-- 접수시간 --></th>
                            <td class="required_area">
                                <input type="text" id="acptDt" name="acptDt" class="form_datepicker ac" style="width:100%" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.activeGainPathCd" /><!-- 활동 취득 경로 --></th>
                            <td>
                                <input id="activeGainPathCd" name="activeGainPathCd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.pconCustHomeTelNo" /><!-- 문의자 집 전화번호 --></th>
                            <td>
                                <input type="text" id="pconCustHomeTelNo" name="pconCustHomeTelNo" class="form_input ac" data-type="tel" pattern="\d" maxlength="40" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.openDlrYn" /><!-- OPEN한 딜러여부 --></th>
                            <td>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.manufacturer" /><!-- 제조사/특약점 --></th>
                            <td>
                                <input type="text" id="manufacturer" name="manufacturer" value="" class="form_input ac" maxlength="100" style="width:100%">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.cmplCauCd" /><!-- 불만이유 --></th>
                            <td>
                                <input id="cmplCauCd" name="cmplCauCd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.pconCustOfficeTelNo" /><!-- 문의자 직장 전화번호 --></th>
                            <td>
                                <input type="text" id="pconCustOfficeTelNo" name="pconCustOfficeTelNo" class="form_input ac" data-type="tel" pattern="\d" maxlength="40" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.custReqCont" /><!-- 고객 요구 --></th>
                            <td colspan="3" rowspan="2">
                                <textarea maxlength="1000" id="custReqCont" name="custReqCont" rows="2" cols="" class="form_textarea" style="height:41px;"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.prorCd" /></span> <!-- 중요성 --></th>
                            <td class="required_area">
                                <input id="prorCd" name="prorCd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.resvDt" /><!-- 예약시간 --></th>
                            <td>
                                <input type="text" id="resvDt" name="resvDt" class="form_datepicker ac" style="width:100%" />
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.procLmtCd" /><!-- 처리시한 --></th>
                            <td>
                                <input id="procLmtCd" name="procLmtCd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.repairBookId" /><!-- 정비예약ID --></th>
                            <td>
                                <input id="repairBookId" name="repairBookId" value="" class="form_input ac" maxlength="20" style="width:100%">
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.emgcRescLocCont" /><!-- 긴급구조위치내용 --></th>
                            <td colspan="3" rowspan="2">
                                <textarea maxlength="1000" id="emgcRescLocCont" name="emgcRescLocCont" rows="2" cols="" class="form_textarea" style="height:41px;"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.vocEndDt" /><!-- Close 시간 --></th>
                            <td>
                                <input id="vocEndDt" name="vocEndDt" value="" class="form_datepicker ac" style="width:100%" />
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.dlrCmpCommYn" /><!-- 딜러사 연락여부 --></th>
                            <td>
                                <label class="label_check ml5"><input id="dlrCmpCommYn" type="checkbox" class="form_check" unchecked></label>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.emgcRescFstCallYn" /><!-- 긴급구조첫통화여부 --></th>
                            <td>
                                <input id="emgcRescFstCallYn" name="emgcRescFstCallYn" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.emgcRescYn" /><!-- 긴급구조여부 --></th>
                            <td>
                                <input id="emgcRescYn" name="emgcRescYn" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.emgcRescReasonNm" /><!-- 긴급구조원인명 --></th>
                            <td>
                                <input id="emgcRescReasonNm" name="emgcRescReasonNm" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.emgcRescStsfCont" /><!-- 긴급구조만족도내용 --></th>
                            <td>
                                <input id="emgcRescStsfCont" name="emgcRescStsfCont" value="" class="form_comboBox" style="width:100%" />
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
                                <input id="pevalId" name="pevalId" type="hidden">
                                <div id="pevalSearch" class="form_search">
                                    <input type="text" id="pevalNm" name="pevalNm" class="form_input" style="width:100%" />
                                    <a href="javascript:;"><spring:message code="global.btn.search" /><!-- 조회 --></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.evalAllocDt" /><!-- 심사 배정시간 --></th>
                            <td>
                                <input id="evalAllocDt" name="evalAllocDt" value="" class="form_datepicker ac" style="width:100%">
                            </td>
                            <th scope="row" rowspan="2"><spring:message code="global.lbl.callCenOpnCont" /><!-- 콜센터 의견 --></th>
                            <td colspan="3" rowspan="2">
                                <textarea maxlength="2000" id="callCenOpnCont" name="callCenOpnCont" rows="2" cols=""  class="form_textarea" style="height:41px;"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.returnCauCont" /><!-- 반송원인 --></th>
                            <td>
                                <input id="returnCauCont" name="returnCauCont" value="" class="form_input" maxlength="500" style="width:100%">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.dataShipStatCd" /><!-- 자료배송상태 --></th>
                            <td>
                                <input type="text" id="dataShipStatNm" name="dataShipStatNm" value="" class="form_input" style="width:100%" />
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
                            <th scope="row" rowspan="2"><spring:message code="global.lbl.revMthCont" /><!-- 검토중인 방안 --></th>
                            <td colspan="3" rowspan="2">
                                <textarea maxlength="2000" id="revMthCont" name="revMthCont" rows="2" cols="" class="form_textarea"  style="height:41px;"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.realPprocId" /><!-- 실 처리인 --></th>
                            <td>
                                <input id="realPprocId" name="realPprocId" type="hidden">
                                <div id="realPprocSearch" class="form_search">
                                    <input type="text" id="realPprocNm" name="realPprocNm" class="form_input" style="width:100%" />
                                    <a href="javascript:;"><spring:message code="global.btn.search" /><!-- 조회 --></a>
                                </div>
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
                                <textarea maxlength="2000" id="procRsltCont" name="procRsltCont" rows="2" cols="" class="form_textarea"  style="height:41px;"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.stsfIvstEmpId" /><!-- 만족도 조사인 --></th>
                            <td>
                                <input id="stsfIvstEmpId" name="stsfIvstEmpId" type="hidden">
                                <div id="stsfIvstEmpSearch" class="form_search">
                                    <input type="text" id="stsfIvstEmpNm" name="stsfIvstEmpNm" class="form_input" style="width:100%" />
                                    <a href="javascript:;"><spring:message code="global.btn.search" /><!-- 조회 --></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.stsfIvstDt" /><!-- 만족도 조사시간 --></th>
                            <td>
                                <input id="stsfIvstDt" name="stsfIvstDt" value="" class="form_datepicker ac" style="width:100%">
                            </td>
                        </tr>

                        <tr>
                            <th scope="row"><spring:message code="global.lbl.mthAchvHm" /><!-- 방안 달성시간 --></th>
                            <td>
                                <input type="number" id="mthAchvHm" name="mthAchvHm" value="" class="form_input ac" maxlength="10" style="width:100%">
                            </td>
                            <th scope="row" rowspan="2" ><spring:message code="crm.lbl.traceRsltCont" /><!-- 추적결과 --></th>
                            <td rowspan="2" rowspan="2" >
                                <textarea maxlength="2000" id="traceRsltCont" name="traceRsltCont" rows="2" cols=""  class="form_textarea"></textarea>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.stsfIvstRsltCont" /><!-- 만족도 조사결과 --></th>
                            <td colspan="3" rowspan="2" >
                                <textarea maxlength="2000" id="stsfIvstRsltCont" name="stsfIvstRsltCont" rows="2" cols=""  class="form_textarea"  style="height:41px;"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.traceDt" /><!-- 추적시간 --></th>
                            <td>
                                <input id="traceDt" name="traceDt" value="" class="form_datepicker ac" style="width:100%">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div id="addInfoTitle1" class="header_area">
                <h2 class="title_basic"><spring:message code="global.title.addInfo" /></h2><!-- 추가정보 -->
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
                                <input type="text" id="cmplStsfNm01" name="cmplStsfNm01" value="" class="form_input" style="width:100%" disable />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.saleDt" /><!-- 판매시간 --></th>
                            <td>
                                <input id="saleDt01" name="saleDt01" value="" class="saleDt form_datepicker ac" style="width:100%">
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.salesActiveSrcCd" /><!-- 영업활동정보출처 --></th>
                            <td>
                                <input type="text" id="salesActiveSrcCd" name="salesActiveSrcCd" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.relSalesActiveNo" /><!-- 관계영업활동번호 --></th>
                            <td>
                                <input type="text" id="relSalesActiveNo" name="relSalesActiveNo" class="form_input" style="width:100%" />
                            </td>
                        </tr>
                        <tr id="addInfo2" class="hidden" >
                            <th scope="row"><spring:message code="global.lbl.cmplStsfCd" /><!-- 불만 만족도 --></th>
                            <td>
                                <input type="text" id="cmplStsfNm02" name="cmplStsfNm02" value="" class="form_input" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.cmplReAcptYn" /></th> <!-- 불만 재 접수 여부 -->
                            <td>
                                <label class="label_check ml5"><input id="cmplReAcptYn" type="checkbox" class="form_check" unchecked></label>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.cmplReAcptCnt" /><!-- 불만 재 접수 횟수 --></th>
                            <td>
                                <input type="number" id="cmplReAcptCnt" name="cmplReAcptCnt" value="" class="form_input ac" maxlength="10" style="width:100%">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.serReqNo" /><!-- 관련서비스 요청번호 --></th>
                            <td>
                                <input id="serReqNo" name="serReqNo" value="" class="form_input ac" maxlength="50" style="width:100%">
                            </td>
                        </tr>
                        <tr id="addInfo3" class="hidden" >
                            <th scope="row"><spring:message code="global.lbl.cmplDlDeptNm" /><!-- 불만전달 부서 --></th>
                            <td>
                                <input id="cmplDlDeptNm" name="cmplDlDeptNm" value="" class="form_input" maxlength="50" style="width:100%">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.cmplDlEmpId" /><!-- 불만전달 자 --></th>
                            <td>
                                <input id="cmplDlEmpId" name="cmplDlEmpId" type="hidden">
                                <div id="cmplDlEmpSearch" class="form_search">
                                    <input type="text" id="cmplDlEmpNm" name="cmplDlEmpNm" class="form_input" style="width:100%" />
                                    <a href="javascript:;"><spring:message code="global.btn.search" /><!-- 조회 --></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.saleDt" /><!-- 판매시간 --></th>
                            <td>
                                <input id="saleDt02" name="saleDt02" value="" class="saleDt form_datepicker ac" style="width:100%">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.dstbNo" /><!-- 물류번호 --></th>
                            <td>
                                <input id="dstbNo" name="dstbNo" value="" class="form_input ac" maxlength="20" style="width:100%">
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
                                <input id="parOrdYn" name="parOrdYn" value="" class="form_comboBox" style="width:100%">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.parOrdDt" /><!-- 오더시간 --></th>
                            <td>
                                <input id="parOrdDt" name="parOrdDt" value="" class="form_datepicker ac" style="width:100%">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.parArrvDt" /><!-- 도착시간 --></th>
                            <td>
                                <input id="parArrvDt" name="parArrvDt" value="" class="form_datepicker ac" style="width:100%">
                            </td>
                            <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                            <td>
                                <input id="itemCd" name="itemCd" value="" class="form_input ac" maxlength="18" style="width:100%">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>

        <div class="header_area">
            <div class="btn_right">
                <button type="button" class="btn_s btn_save" id="btnActiveSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                <button type="button" class="btn_s btn_add"  id="btnAdd"><spring:message code="global.btn.rowAdd" /></button><!-- 행추가 -->
            </div>
        </div>

        <div class="table_grid">
            <div id="activeGrid"></div>
        </div>

    </section>
    <!-- //기본정보 -->









<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">

    var popupWindow;



    var vocTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //VOC유형코드 / CRM604
    <c:forEach var="obj" items="${vocTpCdList}">
        vocTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var vocTpSubCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //VOC유형SUB코드 / CRM617
    <c:forEach var="obj" items="${vocTpSubCdList}">
        vocTpSubCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
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

    var vocTpSub1CdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //1급 SUB 유형 / CRM605
    <c:forEach var="obj" items="${vocTpSub1CdList}">
        vocTpSub1CdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    /**
    * 유형에 따른 상태 조회(조회조건)
    */
    function onSelectVocStatCdSearch(value) {

        $("#sVocStatCd").data("kendoExtDropDownList").setDataSource([]);
        $("#sVocStatCd").data("kendoExtDropDownList").enable(true);

        if(value == ""){
            $("#sVocStatCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sVocStatCd").data("kendoExtDropDownList").enable(false);
            return false;
        }

        var responseJson = dms.ajax.getJson({
            url:_contextPath + "/crm/crq/vocMgmt/selectVocTpCdList.do"
            ,data:JSON.stringify({"cmmCd":value})
            ,async:false
        });

        $("#sVocStatCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

    };

    //유형에 따른 상태 조회(값 셋팅시에만 사용함)
    function onSelectVocStatCdSet(value) {


        // VOC 유형이 긴급구조인경우 상태는?
        $("#vocStatCd").data("kendoExtDropDownList").setDataSource([]);
        $("#vocStatCd").data("kendoExtDropDownList").enable(true);

        if(value == ""){
            $("#vocStatCd").data("kendoExtDropDownList").setDataSource([]);
            $("#vocStatCd").data("kendoExtDropDownList").enable(false);
            return false;
        }

        var responseJson = dms.ajax.getJson({
            url:_contextPath + "/crm/crq/vocMgmt/selectVocTpCdList.do"
            ,data:JSON.stringify({"cmmCd":value})
            ,async:false
        });

        console.log("responseJson:",responseJson)

        $("#vocStatCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

    };

    /**
     * SUB 유형에 따른 상태 조회(값 셋팅시에만 사용함)
     */
    function onSelectVocTpSubCdSet(grpCd, cmmCd) {

        var param ={
                "sCmmGrpCd":grpCd
                ,"cmmCd":cmmCd
        };

        //console.log("vocSubTp param:",param);
        var responseJson = dms.ajax.getJson({
            url:_contextPath + "/crm/crq/vocMgmt/selectVocTpSubCdList.do"
            ,data:JSON.stringify(param)
            ,async:false
        });

        var vocTpSubDatsSource = responseJson.data;
        //console.log("responseJson.data :: ",vocTpSubDatsSource);

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
            url:_contextPath + "/sal/svo/askHelpCar/selectModel.do"
            ,data:JSON.stringify({"carlineCd":value})
            ,async:false
        });

        $("#modelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);

    };

    /**
    * 모델에 따른 OCN 조회(값 셋팅시에만 사용)
    */
    function onSelectModelCdSet(value) {

        var responseJson = dms.ajax.getJson({
            url:_contextPath + "/sal/svo/askHelpCar/selectOcn.do"
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
             url:_contextPath + "/sal/svo/askHelpCar/selectModel.do"
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
             url:_contextPath + "/sal/svo/askHelpCar/selectOcn.do"
             ,data:JSON.stringify({"modelCd":dataItem.modelCd})
             ,async:false
         });

         $("#ocnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
     };










    var com020List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //여부
    <c:forEach var="obj" items="${com020List}">
        com020List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var crm030List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //고객 및 연계인 관계
    <c:forEach var="obj" items="${crm030List}">
        crm030List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>



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
            activeTpSubCdListObj["${obj.remark1}"].push({cmmCd: "${obj.cmmCd}", cmmCdNm: "${obj.cmmCdNm}"});
        }else{
            activeTpSubCdListObj["${obj.remark1}"] = [];
            activeTpSubCdListObj["${obj.remark1}"].push({cmmCd: "${obj.cmmCd}", cmmCdNm: "${obj.cmmCdNm}"});
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

    function callBackFunc(){
        //var customerForm = $("#tabFormIframe").contents().find("#customerForm").html();
        //$("#tabstrip-1", parent.document).html(customerForm);
        //$("#tabFormIframe").contents().find("#customerForm").html();
    }

    var mode = "N";

    // 읽기전용 처리
    function readOnlyDefualtForm(){

        $("#btnProce").data("kendoButton").enable(true);
        $("#btnSave").data("kendoButton").enable(false);

        // VOC 요청접수
        $("#vocNo").attr("disabled", true);             // VOC 번호는 항상 읽기전용
        $("#vocStatCd").data("kendoExtDropDownList").enable(false);
        $("#bfVocStatCd").attr("disabled", true);
        $("#vocTpCd").data("kendoExtDropDownList").enable(false);
        $("#vocTpSubCd").data("kendoExtDropDownList").enable(false);
        $("#tendCd").data("kendoExtDropDownList").enable(false);
        $("#vocTpSub1Cd").data("kendoExtDropDownList").enable(false);
        $("#vocTpSub2Cd").data("kendoExtDropDownList").enable(false);
        $("#vocTpSub3Cd").data("kendoExtDropDownList").enable(false);
        $("#acptSrcCd").data("kendoExtDropDownList").enable(false);
        $("#activeGainPathCd").data("kendoExtDropDownList").enable(false);
        $("#cmplCauCd").data("kendoExtDropDownList").enable(false);
        $("#prorCd").data("kendoExtDropDownList").enable(false);
        $("#procLmtCd").data("kendoExtDropDownList").enable(false);
        $("#vocEndDt").data("kendoExtMaskedDateTimePicker").enable(false);
        $("#dlrCmpCommYn").prop("disabled", true);

        //긴급구조
        $("#emgcRescFstCallYn").data("kendoExtDropDownList").enable(false);     //긴급전화 첫 통화여부
        $("#emgcRescYn").data("kendoExtDropDownList").enable(false);     //긴급구조 여부
        $("#emgcRescReasonNm").data("kendoExtDropDownList").enable(false);     //원인
        $("#emgcRescStsfCont").data("kendoExtDropDownList").enable(false);     //구조 만족도
        $("#emgcRescLocCont").attr("disabled", true);                      //고객구조위치

        $("#receiveTelNo").attr("disabled", true);
        $("#custNo").attr("disabled", true);
        $("#custNm").attr("disabled", true);
        $("#pconCustNm").attr("disabled", true);
        $("#pconCustNo").attr("disabled", true);
        $("#custPrefCommNo").attr("disabled", true);
        $("#hpNo").attr("disabled", true);
        $("#homeTelNo").attr("disabled", true);
        $("#officeTelNo").attr("disabled", true);
        $("#pconCustMjrTelNo").attr("disabled", true);
        $("#pconCustHpNo").attr("disabled", true);
        $("#pconCustHomeTelNo").attr("disabled", true);
        $("#pconCustOfficeTelNo").attr("disabled", true);
        $("#resvDt").data("kendoExtMaskedDateTimePicker").enable(false);
        $("#repairBookId").attr("disabled", true);

        $("#sendTelNo").attr("disabled", true);
        $("#pconRelCd").data("kendoExtDropDownList").enable(false);
        $("#pprocDeptNm").attr("disabled", true);
        $("#pprocId").attr("disabled", true);
        $("#pprocNm").attr("disabled", true);
        $("#coopDeptNm").attr("disabled", true);
        $("#bizDeptNm").attr("disabled", true);
        $("#officeNm").attr("disabled", true);
        $("#sungNm").attr("disabled", true);
        $("#sungCd").data("kendoExtDropDownList").enable(false);
        $("#cityNm").attr("disabled", true);
        $("#cityCd").data("kendoExtDropDownList").enable(false);
        $("#custReqCont").attr("disabled", true);

        $("#vinNo").attr("disabled", true);
        $("#carRegNo").attr("disabled", true);
        $("#carlineNm").attr("disabled", true);
        $("#carlineCd").data("kendoExtDropDownList").enable(false);
        $("#modelCd").data("kendoExtDropDownList").enable(false);
        $("#modelNm").attr("disabled", true);
        $("#ocnNm").attr("disabled", true);
        $("#ocnCd").data("kendoExtDropDownList").enable(false);
        $("#runDistVal").attr("disabled", true);
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
        $("#realPprocId").attr("disabled", true);
        $("#realPprocNm").attr("disabled", true);
        $("#pprocTelNo").attr("disabled", true);
        $("#stsfIvstEmpId").attr("disabled", true);
        $("#stsfIvstEmpNm").attr("disabled", true);
        $("#mthAchvHm").attr("disabled", true);
        $("#traceDt").data("kendoExtMaskedDateTimePicker").enable(false);

        $("#evalAllocDt").data("kendoExtMaskedDateTimePicker").enable(false);
        $("#dataShipStatNm").attr("disabled", true);
        $("#pmoDt").data("kendoExtMaskedDateTimePicker").enable(false);
        $("#procDt").data("kendoExtMaskedDateTimePicker").enable(false);
        $("#pprocEmailNm").attr("disabled", true);
        $("#stsfIvstDt").data("kendoExtMaskedDateTimePicker").enable(false);
        $("#traceRsltCont").attr("disabled", true);

        $("#callCenOpnCont").attr("disabled", true);
        $("#revMthCont").attr("disabled", true);
        $("#procRsltCont").attr("disabled", true);
        $("#stsfIvstRsltCont").attr("disabled", true);

        // 추가정보
        $("#cmplStsfNm01").attr("disabled", true);
        $("#cmplStsfNm02").attr("disabled", true);
        $("#cmplReAcptYn").prop("disabled", true);
        $("#cmplReAcptCnt").attr("disabled", true);
        $("#serReqNo").attr("disabled", true);
        $("#cmplDlDeptNm").attr("disabled", true);
        $("#cmplDlEmpId").attr("disabled", true);
        $("#cmplDlEmpNm").attr("disabled", true);
        $("#saleDt01").data("kendoExtMaskedDateTimePicker").enable(false);
        $("#saleDt02").data("kendoExtMaskedDateTimePicker").enable(false);
        $("#dstbNo").attr("disabled", true);

        $("#salesActiveSrcCd").data("kendoExtDropDownList").enable(false);
        $("#relSalesActiveNo").attr("disabled", true);

        // 부품정보
        $("#parOrdYn").data("kendoExtDropDownList").enable(false);
        $("#parOrdDt").data("kendoExtMaskedDateTimePicker").enable(false);
        $("#parArrvDt").data("kendoExtMaskedDateTimePicker").enable(false);
        $("#itemCd").attr("disabled", true);


    }
    // 읽기전용처리

    // 초기화 + 읽기전용 해제
    function initForm(){

        changeComboList("");

        $("#bhmcYn").val("");
        $("#bhmcVocNo").val("");
        $("#dlrCd").val("");

        // VOC 요청접수
        $("#vocNo").val("").attr("disabled", true);             // VOC 번호는 항상 읽기전용
        //onSelectVocStatCdSet("");           // VOC 상태는 유형에 따라서 선택됨. 최초 읽기전용
        $("#vocStatCd").data("kendoExtDropDownList").value("");
        $("#vocStatCd").data("kendoExtDropDownList").enable(false);
        $("#vocStatCd").data("kendoExtDropDownList").setDataSource([]);
        $("#bfVocStatCd").val("").attr("disabled", false);
        $("#vocTpCd").data("kendoExtDropDownList").value("");
        $("#vocTpCd").data("kendoExtDropDownList").enable(true);
        $("#vocTpSubCd").data("kendoExtDropDownList").value("");
        $("#vocTpSubCd").data("kendoExtDropDownList").enable(true);
        $("#tendCd").data("kendoExtDropDownList").value("");
        $("#tendCd").data("kendoExtDropDownList").enable(true);
        $("#vocTpSub1Cd").data("kendoExtDropDownList").value("");
        $("#vocTpSub1Cd").data("kendoExtDropDownList").enable(true);
        $("#vocTpSub2Cd").data("kendoExtDropDownList").value("");
        $("#vocTpSub2Cd").data("kendoExtDropDownList").enable(true);
        $("#vocTpSub3Cd").data("kendoExtDropDownList").value("");
        $("#vocTpSub3Cd").data("kendoExtDropDownList").enable(true);
        $("#acptSrcCd").data("kendoExtDropDownList").value("");
        $("#acptSrcCd").data("kendoExtDropDownList").enable(true);
        $("#activeGainPathCd").data("kendoExtDropDownList").value("");
        $("#activeGainPathCd").data("kendoExtDropDownList").enable(true);
        $("#cmplCauCd").data("kendoExtDropDownList").value("");
        $("#cmplCauCd").data("kendoExtDropDownList").enable(false);
        $("#prorCd").data("kendoExtDropDownList").value("");
        $("#prorCd").data("kendoExtDropDownList").enable(true);
        $("#procLmtCd").data("kendoExtDropDownList").value("");
        $("#procLmtCd").data("kendoExtDropDownList").enable(true);
        $("#vocEndDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#vocEndDt").data("kendoExtMaskedDateTimePicker").enable(true);
        $("#dlrCmpCommYn").prop("checked", false);
        $("#dlrCmpCommYn").prop("disabled", false);

        //긴급구조
        $("#emgcRescFstCallYn").data("kendoExtDropDownList").value("");                      //긴급전화 첫 통화여부
        $("#emgcRescFstCallYn").data("kendoExtDropDownList").enable(false);
        $("#emgcRescYn").data("kendoExtDropDownList").value("");                      //긴급구조 여부
        $("#emgcRescYn").data("kendoExtDropDownList").enable(false);
        $("#emgcRescReasonNm").data("kendoExtDropDownList").value("");                      //원인
        $("#emgcRescReasonNm").data("kendoExtDropDownList").enable(false);
        $("#emgcRescStsfCont").data("kendoExtDropDownList").value("");                      //구조 만족도
        $("#emgcRescStsfCont").data("kendoExtDropDownList").enable(false);
        $("#emgcRescLocCont").val("").attr("disabled", true);                            //고객구조위치

        $("#receiveTelNo").val("").attr("disabled", false);
        $("#custNo").val("").attr("disabled", false);
        $("#custNm").val("").attr("disabled", false);
        $("#pconCustNm").val("").attr("disabled", false);
        $("#pconCustNo").val("").attr("disabled", false);
        $("#custPrefCommNo").val("").attr("disabled", false);
        $("#hpNo").val("").attr("disabled", false);
        $("#homeTelNo").val("").attr("disabled", false);
        $("#officeTelNo").val("").attr("disabled", false);
        $("#pconCustMjrTelNo").val("").attr("disabled", false);
        $("#pconCustHpNo").val("").attr("disabled", false);
        $("#pconCustHomeTelNo").val("").attr("disabled", false);
        $("#pconCustOfficeTelNo").val("").attr("disabled", false);
        $("#resvDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#resvDt").data("kendoExtMaskedDateTimePicker").enable(true);
        $("#repairBookId").val("").attr("disabled", false);

        $("#sendTelNo").val("").attr("disabled", false);
        $("#pconRelCd").data("kendoExtDropDownList").value("");
        $("#pconRelCd").data("kendoExtDropDownList").enable(true);
        $("#pprocDeptNm").val("").attr("disabled", false);
        $("#pprocId").val("").attr("disabled", false);
        $("#pprocNm").val("").attr("disabled", false);
        $("#coopDeptNm").val("").attr("disabled", false);
        $("#bizDeptNm").val("").attr("disabled", false);
        $("#officeNm").val("").attr("disabled", false);
        $("#sungNm").val("").attr("disabled", false);
        $("#sungCd").data("kendoExtDropDownList").value("");
        $("#sungCd").data("kendoExtDropDownList").enable(true);
        $("#cityNm").val("").attr("disabled", false);
        $("#cityCd").data("kendoExtDropDownList").value("");
        $("#cityCd").data("kendoExtDropDownList").enable(false);
        $("#cityCd").data("kendoExtDropDownList").setDataSource([]);
        $("#custReqCont").val("").attr("disabled", false);

        $("#vinNo").val("").attr("disabled", false);
        $("#carRegNo").val("").attr("disabled", false);
        $("#carlineNm").val("").attr("disabled", false);
        $("#carlineCd").data("kendoExtDropDownList").value("");
        $("#carlineCd").data("kendoExtDropDownList").enable(true);
        $("#modelCd").data("kendoExtDropDownList").value("");
        $("#modelCd").data("kendoExtDropDownList").enable(false);
        $("#modelCd").data("kendoExtDropDownList").setDataSource([]);
        $("#modelNm").val("").attr("disabled", false);
        $("#ocnNm").val("").attr("disabled", false);
        $("#ocnCd").data("kendoExtDropDownList").value("");
        $("#ocnCd").data("kendoExtDropDownList").enable(false);
        $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
        $("#runDistVal").val("").attr("disabled", false);
        $("#acptDeptNm").val("").attr("disabled", false);
        $("#pacptId").val("").attr("disabled", false);
        $("#pacptNm").val("").attr("disabled", false);
        $("#acptDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#acptDt").data("kendoExtMaskedDateTimePicker").enable(true);
        $("#manufacturer").val("").attr("disabled", false);

        //VOC 처리
        $("#pevalId").val("").attr("disabled", false);
        $("#pevalNm").val("").attr("disabled", false);
        $("#returnCauCont").val("").attr("disabled", false);
        $("#pmoCauCd").data("kendoExtDropDownList").value("");
        $("#pmoCauCd").data("kendoExtDropDownList").enable(true);
        $("#realPprocId").val("").attr("disabled", false);
        $("#realPprocNm").val("").attr("disabled", false);
        $("#pprocTelNo").val("").attr("disabled", false);
        $("#stsfIvstEmpId").val("").attr("disabled", false);
        $("#stsfIvstEmpNm").val("").attr("disabled", false);
        $("#mthAchvHm").val("").attr("disabled", true);
        $("#traceDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#traceDt").data("kendoExtMaskedDateTimePicker").enable(false);

        $("#evalAllocDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#evalAllocDt").data("kendoExtMaskedDateTimePicker").enable(true);
        $("#dataShipStatNm").val("").attr("disabled", false);
        $("#pmoDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#pmoDt").data("kendoExtMaskedDateTimePicker").enable(true);
        $("#procDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#procDt").data("kendoExtMaskedDateTimePicker").enable(true);
        $("#pprocEmailNm").val("").attr("disabled", false);
        $("#stsfIvstDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#stsfIvstDt").data("kendoExtMaskedDateTimePicker").enable(true);
        $("#traceRsltCont").val("").attr("disabled", true);

        $("#callCenOpnCont").val("").attr("disabled", false);
        $("#revMthCont").val("").attr("disabled", true);
        $("#procRsltCont").val("").attr("disabled", false).attr("readonly", false);
        $("#procRsltContTmp").val("");
        $("#stsfIvstRsltCont").val("").attr("disabled", false);


        // 추가정보
        $("#cmplStsfNm01").val("").attr("disabled", false);
        $("#cmplStsfNm02").val("").attr("disabled", false);
        $("#cmplReAcptYn").prop("checked", false);
        $("#cmplReAcptYn").prop("disabled", false);
        $("#cmplReAcptCnt").val("").attr("disabled", false);
        $("#serReqNo").val("").attr("disabled", false);
        $("#cmplDlDeptNm").val("").attr("disabled", false);
        $("#cmplDlEmpId").val("").attr("disabled", false);
        $("#cmplDlEmpNm").val("").attr("disabled", false);
        $("#saleDt01").data("kendoExtMaskedDateTimePicker").value("");
        $("#saleDt01").data("kendoExtMaskedDateTimePicker").enable(true);
        $("#saleDt02").data("kendoExtMaskedDateTimePicker").value("");
        $("#saleDt02").data("kendoExtMaskedDateTimePicker").enable(true);
        $("#dstbNo").val("").attr("disabled", false);

        $("#salesActiveSrcCd").data("kendoExtDropDownList").value("");
        $("#salesActiveSrcCd").data("kendoExtDropDownList").enable(true);
        $("#relSalesActiveNo").val("").attr("disabled", false);

        // 부품정보
        $("#parOrdYn").data("kendoExtDropDownList").value("");
        $("#parOrdYn").data("kendoExtDropDownList").enable(true);
        $("#parOrdDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#parOrdDt").data("kendoExtMaskedDateTimePicker").enable(true);
        $("#parArrvDt").data("kendoExtMaskedDateTimePicker").value("");
        $("#parArrvDt").data("kendoExtMaskedDateTimePicker").enable(true);
        $("#itemCd").val("").attr("disabled", false);

        $("#btnProce").data("kendoButton").enable(false);
        $("#btnSave").data("kendoButton").enable(true);
        $("#btnActiveSave").data("kendoButton").enable(false);
        $("#btnAdd").data("kendoButton").enable(false);
        $("#btnProceSave").data("kendoButton").enable(false);

        $("#activeGrid").data("kendoExtGrid").dataSource.data([]);

    };


    /**
     * 유형에 따른 입력부 컨트롤 ( 유형 - 불만에 따라서 show / hide )
     */
    function changeComboList(value) {

        console.log("유형에 따른 입력부 컨트롤 ( 유형 - 불만에 따라서 show / hide ):"+value)

        if(value === "02"){

            $("#vocTpSubCd").data("kendoExtDropDownList").enable(false);           //VOC 하위유형
            $("#cmplCauCd").data("kendoExtDropDownList").enable(true);             //불만이유
            $("#dlrCmpCommYn").prop("disabled", true);                          //딜러사 연락여부
            $("#repairBookId").attr("disabled", true);                          //정비예약ID

            $("#mthAchvHm").attr("disabled", false);                            //방안달성시간
            $("#traceDt").data("kendoExtMaskedDateTimePicker").enable(true);    //추적시간
            $("#dataShipStatNm").attr("disabled", true);                        //자료배송상태
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

            //추가정보
            $("#addInfoTitle1").removeClass("hidden");
            $("#addInfoFrom").removeClass("hidden");
            $("#addInfo1").addClass("hidden");
            $("#addInfo2").removeClass("hidden");
            $("#addInfo3").removeClass("hidden");
            //부품정보
            $("#itemInfoTitle1").removeClass("hidden");
            $("#itemInfo1").removeClass("hidden");

        } else if(value == "05"){

            $("#vocTpSubCd").data("kendoExtDropDownList").enable(false);           //VOC 하위유형
            $("#cmplCauCd").data("kendoExtDropDownList").enable(false);             //불만이유
            $("#dlrCmpCommYn").prop("disabled", true);                          //딜러사 연락여부
            $("#repairBookId").attr("disabled", true);                          //정비예약ID

            $("#mthAchvHm").attr("disabled", true);                            //방안달성시간
            $("#traceDt").data("kendoExtMaskedDateTimePicker").enable(false);    //추적시간
            $("#dataShipStatNm").attr("disabled", true);                        //자료배송상태
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

            //추가정보
            $("#addInfoTitle1").addClass("hidden");
            $("#addInfoFrom").addClass("hidden");
            $("#addInfo1").addClass("hidden");
            $("#addInfo2").addClass("hidden");
            $("#addInfo3").addClass("hidden");
            //부품정보
            $("#itemInfoTitle1").addClass("hidden");
            $("#itemInfo1").addClass("hidden");

        } else {

            $("#vocTpSubCd").data("kendoExtDropDownList").enable(true);            //VOC 하위유형
            $("#cmplCauCd").data("kendoExtDropDownList").enable(false);            //불만이유
            $("#dlrCmpCommYn").prop("disabled", false);                         //딜러사 연락여부
            $("#repairBookId").attr("disabled", false);                         //정비예약ID

            $("#mthAchvHm").attr("disabled", true);                             //방안달성시간
            $("#traceDt").data("kendoExtMaskedDateTimePicker").enable(false);   //추적시간
            $("#dataShipStatNm").attr("disabled", false);                       //자료배송상태
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

            //추가정보
            $("#addInfoTitle1").removeClass("hidden");
            $("#addInfoFrom").removeClass("hidden");
            $("#addInfo1").removeClass("hidden");
            $("#addInfo2").addClass("hidden");
            $("#addInfo3").addClass("hidden");
            //부품정보
            $("#itemInfoTitle1").removeClass("hidden");
            $("#itemInfo1").removeClass("hidden");

        };

    };

    //고객 팝업 조회
    function selectCustPopupWindow(uid, cnt){
        var uidVal = uid;

        if ( $("#bhmcYn").val() === "N" || dms.string.isEmpty($("#bhmcYn").val()) ) {        // BHMC_YN = Y 인경우는 읽기전용이기 때문에 팝업 허용 안함
            popupWindow = dms.window.popup({
                windowId:"customerSearchPopupMain"
                ,title:"<spring:message code = 'global.title.custSearch'/>"   // 고객 조회
                ,content:{
                    url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                    ,data: {
                        "autoBind":false
                        , "type"  :null
                        , "callbackFunc":function(data){

                            var grid = $('#activeGrid').data('kendoExtGrid');

                            var rows = grid.tbody.find("tr");

                            /*
                            // 중복값 체크
                            var checkVal = true;
                            $.each(rows, function(idx, row){
                                var item = grid.dataItem(row);
                                if(data[0].custNo == item.bpCd){
                                    checkVal = false;
                                }
                            });
                            */

                            var dataSourceRow;
                            $.each(rows, function(idx, row){
                                var item = grid.dataItem(row);
                                if(uidVal == item.uid){
                                    dataSourceRow = grid.dataSource.getByUid(uid);
                                }
                            });

                            if(cnt == "1"){
                                dataSourceRow.set("custNo", data[0].custNo);
                                dataSourceRow.set("custNm", data[0].custNm);
                            }else{
                                dataSourceRow.set("pconCustNo", data[0].custNo);
                                dataSourceRow.set("pconCustNm", data[0].custNm);
                            }
                        }
                    }
                }
            });
        }
    };

$(document).ready(function() {




    // ************************** 그리드 팝업 호출 / 팝업 설정 ****************************
    $("#vocProcRsltContPopup").kendoWindow({
        animation:false
        ,draggable: false
        ,modal: true
        ,resizable: false
        ,visible: false
        ,title: "<spring:message code='crm.title.vocProcRsltCont' />"      // <!-- 고객요청 처리결과 -->
        ,width: "950px"
        ,height: "200px"
    }).data("kendoWindow");
    // ************************** 그리드 팝업 호출 / 팝업 설정 ****************************


    // show/hide
    $("#btnHidden").kendoButton({
        click: function(e){
            $("#hiddenTable").toggle();
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

    //유형(조회부).   vocTpCdList
    $("#sVocTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:vocTpCdList
        , select:function(e){
            var dataItem = this.dataItem(e.item);
            onSelectVocStatCdSearch(dataItem.cmmCd);
        }
    });

    //상태(조회부).
    $("#sVocStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "  // 전체
    });

    $("#sVocStatCd").data("kendoExtDropDownList").enable(false);

    //불만이유(조회부).   cmplCauCdList
    $("#sCmplCauCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:cmplCauCdList
    });







    // Close 시간(입력부)
    $("#vocEndDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 예약시간(입력부)
    $("#resvDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 접수시간(입력부)
    $("#acptDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 추적시간(입력부)
    $("#traceDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 심사 배정시간(입력부)
    $("#evalAllocDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 승급시간(입력부)
    $("#pmoDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 처리일자(입력부)
    $("#procDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 만족도 조사시간(입력부)
    $("#stsfIvstDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 판매시간(입력부)
    $("#saleDt01").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    $("#saleDt02").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 오더시간(입력부)
    $("#parOrdDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 도착시간(입력부)
    $("#parArrvDt").kendoExtMaskedDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //상태(입력부).  VOC 상태는 유형에 따라서 변하기 때문에 최초 읽기전용.
    $("#vocStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "  // 전체
    });
    $("#vocStatCd").data("kendoExtDropDownList").enable(false);

    //유형(입력부).   vocTpCdList
    $("#vocTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:vocTpCdList
        , select:function(e){
            var dataItem = this.dataItem(e.item);
            changeComboList(dataItem.cmmCd);
            onSelectVocStatCdSet(dataItem.cmmCd);
        }
    });

    //하위유형(입력부).   vocTpSubCdList
    $("#vocTpSubCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:vocTpSubCdList
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
            onSelectVocTpSubCdSet("CRM606", dataItem.cmmCd);
        }
    });

    //2급 Sub 유형(입력부).
    $("#vocTpSub2Cd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , select:function(e){
            var dataItem = this.dataItem(e.item);
            onSelectVocTpSubCdSet("CRM607", dataItem.cmmCd);
        }
    });

    //3급 유형(입력부).
    $("#vocTpSub3Cd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
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

    //emgcRescFstCallYn(입력부).   emgcRescFstCallYn
    $("#emgcRescFstCallYn").kendoExtDropDownList({
        //dataTextField:"cmmCdNm"
        //, dataValueField:"cmmCd"
        dataSource:['Y','N']
    , optionLabel:" "
    });
    //emgcRescYn(입력부).   emgcRescYn
    $("#emgcRescYn").kendoExtDropDownList({
        //dataTextField:"cmmCdNm"
        //, dataValueField:"cmmCd"
        dataSource:['Y','N']
    , optionLabel:" "
    });
    //emgcRescReasonNm(입력부).   emgcRescReasonNm
    $("#emgcRescReasonNm").kendoExtDropDownList({
        //dataTextField:"cmmCdNm"
        //, dataValueField:"cmmCd"
        dataSource:['Y','N']
    , optionLabel:" "
    });
    //emgcRescStsfCont(입력부).   emgcRescStsfCont
    $("#emgcRescStsfCont").kendoExtDropDownList({
        //dataTextField:"cmmCdNm"
        //, dataValueField:"cmmCd"
         dataSource:['Y','N']
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
            onSelectSungCdSet(dataItem.cmmCd);
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

    //영업활동정보출처
    $("#salesActiveSrcCd").kendoExtDropDownList({
         dataTextField:"carlineNm"
        ,dataValueField:"carlineCd"
        ,dataSource:carlineList
        ,select:onSelectCarlineCd
        ,optionLabel:" "  // 전체
    });

    //부품오더여부(입력부).   com020List
    $("#parOrdYn").kendoExtDropDownList({
         dataSource:['Y','N']
        ,autoBind:false
        ,index:0
    });



/*************************************************************
 * 이벤트 정의
 *************************************************************/

     //고객조회
     $("#custSearch").click(function(){
         if ( $("#bhmcYn").val() === "N" || dms.string.isEmpty($("#bhmcYn").val()) ) {        // BHMC_YN = Y 인경우는 읽기전용이기 때문에 팝업 허용 안함
             popupWindow = dms.window.popup({
                 windowId:"customerSearchPopupMain"
                 , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
                 , content:{
                     url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                     , data:{
                         "autoBind":false
                         , "type"  :null
                         , "callbackFunc":function(data){
                             if (data.length >= 1) {
                                 console.log(data[0]);
                                 $("#custNo").val(data[0].custNo);
                                 $("#custNm").val(data[0].custNm);
                             }
                         }
                     }
                 }
             });
         }

     });

     //문의인 조회
     $("#pconCustSearch").click(function(){
         if ( $("#bhmcYn").val() === "N" || dms.string.isEmpty($("#bhmcYn").val()) ) {        // BHMC_YN = Y 인경우는 읽기전용이기 때문에 팝업 허용 안함
             popupWindow = dms.window.popup({
                 windowId:"customerSearchPopupMain"
                 , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
                 , content:{
                     url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                     , data:{
                         "autoBind":false
                         , "type"  :null
                         , "callbackFunc":function(data){
                             if (data.length >= 1) {
                                 console.log(data[0]);
                                 $("#pconCustNo").val(data[0].custNo);
                                 $("#pconCustNm").val(data[0].custNm);
                             }
                         }
                     }
                 }
             });
         }
     });

     //처리인 조회
     $("#pprocSearch").click(function(){
         if ( $("#bhmcYn").val() === "N" || dms.string.isEmpty($("#bhmcYn").val()) ) {        // BHMC_YN = Y 인경우는 읽기전용이기 때문에 팝업 허용 안함
             userSearchPopupWin = dms.window.popup({
                windowId:"userSearchPopupWin"
                ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
                ,content:{
                    url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                    , data: {
                        "autoBind":false
                        , "type"  :null
                        ,"callbackFunc":function(data){
                            if (data.length >= 1) {
                                console.log("Return to User Popup");
                                console.log(data[0]);
                                $("#pprocId").val(data[0].usrId);
                                $("#pprocNm").val(data[0].usrNm);
                            }
                        }
                    }
                }
             })
         }
     });

     //접수자 조회
     $("#pacptSearch").click(function(){
         if ( $("#bhmcYn").val() === "N" || dms.string.isEmpty($("#bhmcYn").val()) ) {        // BHMC_YN = Y 인경우는 읽기전용이기 때문에 팝업 허용 안함
             userSearchPopupWin = dms.window.popup({
                windowId:"userSearchPopupWin"
                ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
                ,content:{
                    url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                    , data: {
                        "autoBind":false
                        ,"usrNm": ""
                        ,"callbackFunc":function(data){
                            if (data.length >= 1) {
                                console.log("Return to User Popup");
                                console.log(data[0]);
                                $("#pacptId").val(data[0].usrId);
                                $("#pacptNm").val(data[0].usrNm);
                            }
                        }
                    }
                }
             })
         }
     });

     //심사인 조회
     $("#pevalSearch").click(function(){
         if ( $("#bhmcYn").val() === "N" || dms.string.isEmpty($("#bhmcYn").val()) ) {        // BHMC_YN = Y 인경우는 읽기전용이기 때문에 팝업 허용 안함
             userSearchPopupWin = dms.window.popup({
                windowId:"userSearchPopupWin"
                ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
                ,content:{
                    url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                    , data: {
                        "autoBind":false
                        , "type"  :null
                        ,"callbackFunc":function(data){
                            if (data.length >= 1) {
                                console.log("Return to User Popup");
                                console.log(data[0]);
                                $("#pevalId").val(data[0].usrId);
                                $("#pevalNm").val(data[0].usrNm);
                            }
                        }
                    }
                }
             })
         }
     });

     //실처리인 조회
     $("#realPprocSearch").click(function(){
         if ( $("#bhmcYn").val() === "N" || dms.string.isEmpty($("#bhmcYn").val()) ) {        // BHMC_YN = Y 인경우는 읽기전용이기 때문에 팝업 허용 안함
             userSearchPopupWin = dms.window.popup({
                windowId:"userSearchPopupWin"
                ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
                ,content:{
                    url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                    , data: {
                        "autoBind":false
                        , "type"  :null
                        ,"callbackFunc":function(data){
                            if (data.length >= 1) {
                                console.log("Return to User Popup");
                                console.log(data[0]);
                                $("#realPprocId").val(data[0].usrId);
                                $("#realPprocNm").val(data[0].usrNm);
                            }
                        }
                    }
                }
             })
         }
     });

     //만족도조사인 조회
     $("#stsfIvstEmpSearch").click(function(){
         if ( $("#bhmcYn").val() === "N" || dms.string.isEmpty($("#bhmcYn").val()) ) {        // BHMC_YN = Y 인경우는 읽기전용이기 때문에 팝업 허용 안함
             userSearchPopupWin = dms.window.popup({
                windowId:"userSearchPopupWin"
                ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
                ,content:{
                    url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                    , data: {
                        "autoBind":false
                        , "type"  :null
                        ,"callbackFunc":function(data){
                            if (data.length >= 1) {
                                console.log("Return to User Popup");
                                console.log(data[0]);
                                $("#stsfIvstEmpId").val(data[0].usrId);
                                $("#stsfIvstEmpNm").val(data[0].usrNm);
                            }
                        }
                    }
                }
             })
         }
     });

     //불만전달자 조회
     $("#cmplDlEmpSearch").click(function(){
         if ( $("#bhmcYn").val() === "N" || dms.string.isEmpty($("#bhmcYn").val()) ) {        // BHMC_YN = Y 인경우는 읽기전용이기 때문에 팝업 허용 안함
             userSearchPopupWin = dms.window.popup({
                windowId:"userSearchPopupWin"
                ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
                ,content:{
                    url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                    , data: {
                        "autoBind":false
                        , "type"  :null
                        ,"callbackFunc":function(data){
                            if (data.length >= 1) {
                                console.log("Return to User Popup");
                                console.log(data[0]);
                                $("#cmplDlEmpId").val(data[0].usrId);
                                $("#cmplDlEmpNm").val(data[0].usrNm);
                            }
                        }
                    }
                }
             })
         }
     });




     //조회버튼
     $("#btnSearch").kendoButton({
         click:function(e) {

             var grid = $("#vocGrid").data("kendoExtGrid");
             grid.dataSource.page(1);

//             var venderDs = grid.dataSource;
//             $("#vocCnt").val(venderDs.at(0).vocCnt);

             mode = "N";
             initForm();
         }
     });

      // 신규 - vocGrid
      $("#btnNew").kendoButton({
          click: function(e) {
              mode = "N";

              initForm();

              //$("#vocStatCd").data("kendoExtDropDownList").enable(false);
              //$("#cityCd").data("kendoExtDropDownList").enable(false);
              //$("#modelCd").data("kendoExtDropDownList").enable(false);
              //$("#ocnCd").data("kendoExtDropDownList").enable(false);


              // 접수인(로그인), 접수시간(현재시간)
              $("#acptDt").data("kendoExtMaskedDateTimePicker").value("<c:out value='${sysDate}' />");
              $("#pacptId").val("<c:out value='${loginUserId}' />");
              $("#pacptNm").val("<c:out value='${loginUserNm}' />");

          }
          , enable:true
      });

      //버튼 - 처리 - vocGrid
      $("#btnProce").kendoButton({
         click:function(e){

             // BHMC VOC 인경우에 팝업 오픈
             if ( dms.string.isEmpty($("#bhmcVocNo").val()) && $("#bhmcYn").val() === "N"  ) {
                 return;
             } else {

                 if ( dms.string.isEmpty($("#vocNo").val())){
                     // {VOC 번호}을(를) 확인하여 주세요.
                     dms.notification.warning("<spring:message code='global.lbl.vocNo' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
                     return false;
                 };
                 if ( dms.string.isEmpty($("#bhmcVocNo").val())){
                     // {BHMCVOC번호}을(를) 확인하여 주세요.
                     dms.notification.warning("<spring:message code='global.lbl.BhmcVocNo' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
                     return false;
                 };
                 if ( dms.string.isEmpty($("#vocStatCd").val())){
                     // {상태}을(를) 확인하여 주세요.
                     dms.notification.warning("<spring:message code='global.lbl.statNm' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
                     return false;
                 };
                 if ( $("#bhmcYn").val() === "N" ){
                     // {BHMC 여부}을(를) 확인하여 주세요.
                     dms.notification.warning("<spring:message code='crm.lbl.bhmcYn' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
                     return false;
                 };

                 $("#btnProceSave").data("kendoButton").enable(true);

                 var win = $("#vocProcRsltContPopup").data("kendoWindow");
                 win.center();
                 win.open();

             };


         }
         , enable:false
      });


      //버튼 - 처리 저장
      $("#btnProceSave").kendoButton({
         click:function(e){

             if ( dms.string.isEmpty($("#vocNo").val())){
                 // {VOC 번호}을(를) 확인하여 주세요.
                 dms.notification.warning("<spring:message code='global.lbl.vocNo' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
                 return false;
             };
             if ( dms.string.isEmpty($("#bhmcVocNo").val())){
                 // {BHMCVOC번호}을(를) 확인하여 주세요.
                 dms.notification.warning("<spring:message code='global.lbl.BhmcVocNo' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
                 return false;
             };
             if ( dms.string.isEmpty($("#vocStatCd").val()) ){
                 // {상태}을(를) 확인하여 주세요.
                 dms.notification.warning("<spring:message code='global.lbl.statNm' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
                 return false;
             };
             if ( $("#bhmcYn").val() === "N" ){
                 // {BHMC 여부}을(를) 확인하여 주세요.
                 dms.notification.warning("<spring:message code='crm.lbl.bhmcYn' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
                 return false;
             };
             if ( dms.string.isEmpty($("#procRsltContTmp").val()) ){
                 // {처리결과}을(를) 확인하여 주세요.
                 dms.notification.warning("<spring:message code='global.lbl.procRsltCont' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
                 return false;
             };

             var json = {};
             json.vocNo = $("#vocNo").val();
             json.bhmcVocNo = $("#bhmcVocNo").val();
             json.bhmcYn = $("#bhmcYn").val();
             json.vocStatCd = $("#vocStatCd").data("kendoExtDropDownList").value();
             json.procRsltCont = $("#procRsltCont").val();
             json.procRsltContTmp = $("#procRsltContTmp").val();

             console.log("defaultInfoForm"+JSON.stringify(json));
             //return;

             $.ajax({
                  url:"<c:url value='/crm/crq/vocMgmt/updateBhmcVocProce.do' />"
                 ,data:JSON.stringify(json)
                 ,dataType:"json"
                 ,type:"POST"
                 ,contentType:"application/json"
                 ,error: function(jqXHR,status,error) {
                     dms.notification.error(jqXHR.responseJSON.errors);
                 }
                 ,success:function(data) {
                     dms.notification.success("<spring:message code='global.info.success'/>");
                     $("#vocGrid").data("kendoExtGrid").dataSource.read();
                     mode = "N";
                     initForm();
                 }
             });




         }
         , enable:false
      });


      //버튼 - 저장 - vocGrid
      $("#btnSave").kendoButton({
         click:function(e){

             // 화면 필수 체크
             if ( dms.string.isEmpty($("#vocTpCd").val())){     // VOC 유형
                 dms.notification.warning("<spring:message code='global.lbl.type' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#vocTpCd").focus();
                 return false;
             } else {

                 if($("#vocTpCd").val() === "02"){
                     if ( dms.string.isEmpty($("#cmplCauCd").val())){       //유형이 불만인경우 불만이유 필수
                         dms.notification.warning("<spring:message code='global.lbl.cmplCauCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                         $("#cmplCauCd").focus();
                         return false;
                     }
                 }
             };

             if ( dms.string.isEmpty($("#tendCd").val())){      // 성향
                 dms.notification.warning("<spring:message code='global.lbl.tendCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#tendCd").focus();
                 return false;
             };

             if ( dms.string.isEmpty($("#custNo").val())){      // 고객명
                 dms.notification.warning("<spring:message code='global.lbl.custNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#custNm").focus();
                 return false;
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

             if ( dms.string.isEmpty($("#acptDt").val())){      // 접수시간
                 dms.notification.warning("<spring:message code='global.lbl.acptDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#acptDt").focus();
                 return false;
             };

             if ( dms.string.isEmpty($("#prorCd").val())){      // 중요성
                 dms.notification.warning("<spring:message code='global.lbl.prorCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#prorCd").focus();
                 return false;
             };

             $("#vocNo").prop("disabled", false);

             var json = $("#defaultInfoForm").serializeObject();

             // 상세조회시 VOC 유형은 수정불가 (enabel:false). 따라서 값을 가져와야함.
             json.vocTpCd = $("#vocTpCd").data("kendoExtDropDownList").value();

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

             json.vocEndDt = $("#vocEndDt").data("kendoExtMaskedDateTimePicker").value();
             json.resvDt = $("#resvDt").data("kendoExtMaskedDateTimePicker").value();
             json.acptDt = $("#acptDt").data("kendoExtMaskedDateTimePicker").value();
             json.traceDt = $("#traceDt").data("kendoExtMaskedDateTimePicker").value();
             json.evalAllocDt = $("#evalAllocDt").data("kendoExtMaskedDateTimePicker").value();
             json.pmoDt = $("#pmoDt").data("kendoExtMaskedDateTimePicker").value();
             json.procDt = $("#procDt").data("kendoExtMaskedDateTimePicker").value();
             json.stsfIvstDt = $("#stsfIvstDt").data("kendoExtMaskedDateTimePicker").value();
             json.parOrdDt = $("#parOrdDt").data("kendoExtMaskedDateTimePicker").value();
             json.parArrvDt = $("#parArrvDt").data("kendoExtMaskedDateTimePicker").value();

             console.log(json);

             var url = "";

             if(mode == "N"){
                 url = "<c:url value='/crm/crq/vocMgmt/insertVocMgmts.do' />";
             }else{
                 url = "<c:url value='/crm/crq/vocMgmt/updateVocMgmts.do' />";
             }
             $.ajax({
                 url:url
                 ,dataType:"json"
                 ,type:"POST"
                 ,contentType:"application/json"
                 ,data:JSON.stringify(json)
                 ,error: function(jqXHR,status,error) {
                     dms.notification.error(jqXHR.responseJSON.errors);
                 }
                 ,success:function(data) {
                     dms.notification.success("<spring:message code='global.info.success'/>");
                     $("#vocGrid").data("kendoExtGrid").dataSource.read();
                     mode = "N";
                     initForm();
                 }
             });

             $("#vocNo").prop("disabled", true);
         }
         , enable:true
      });


      //활동목록 그리드
      //버튼 - 추가
      $("#btnAdd").kendoButton({
          click:function(e) {
              var grid = $('#vocGrid').data('kendoExtGrid');
              var selectedItem = grid.dataItem(grid.select());
              console.log("selectedItem :: ",selectedItem)
              if(selectedItem!=null) {
                  var regDt = kendo.parseDate("<c:out value='${sysDate}' />", "<dms:configValue code='dateFormat' />");

                  var vocNo = selectedItem.vocNo;
                  console.log("vocNo :: ",vocNo)
                  if( dms.string.isNotEmpty(vocNo) ) {
                      $('#activeGrid').data('kendoExtGrid').dataSource.insert(0, {
                           "dlrCd":selectedItem.dlrCd
                          ,"vocNo":vocNo
                          ,"regDtFormat":regDt
                          ,"regDt":regDt
                          ,"regUsrNm":"<c:out value='${loginUserNm}' />"
                          ,"regUsrId":"<c:out value='${loginUserId}' />"
                          ,"regDeptNm":""
                          ,"activeStatCd":""
                          ,"activeTpCd":""
                          ,"activeTpSubCd":""
                          ,"custNo":selectedItem.custNo
                          ,"custNm":selectedItem.custNm
                          ,"pconCustNo":selectedItem.pconCustNo
                          ,"pconCustNm":selectedItem.pconCustNm
                          ,"bhmcVocNo":selectedItem.bhmcVocNo
                          ,"activeCd":""
                          ,"activeRsltCont":""
                      });
                  }
              } else {
                  //VOC 목록을 먼저 선택해 주십시오.
                  dms.notification.info("<spring:message code='global.info.required.selectVoc'/>");
              }
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
                  var saveData = gridActive.getCUDData("insertList", "updateList", "deleteList", ["regDtFormat", "regUsrNm"]);
                  if (gridActive.cudDataLength == 0) {
                      //변경된 정보가 없습니다.
                      dms.notification.info("<spring:message code='global.info.required.change'/>");
                      return;
                  }

                  if (gridActive.gridValidation()) {

                      var venderDs = gridActive.dataSource;
                      var iRowCnt = venderDs.total();
                      for(var i = 0 ;i < iRowCnt ;i++){
                          venderDs.at(i).updtDt = null;
                      }

                      console.log("VOC_ACTION SAVE:",JSON.stringify(saveData))
                      $.ajax({
                          url:"<c:url value='/crm/crq/vocMgmt/multiActives.do' />",
                          data:JSON.stringify(saveData),
                          type:'POST',
                          dataType:'json',
                          contentType:'application/json',
                          error:function(jqXHR,status,error) {
                              dms.notification.error(jqXHR.responseJSON.errors);
                          },
                          success:function(jqXHR, textStatus) {

                              gridActive.dataSource._destroyed = [];
                              gridActive.dataSource.page(1);

                              //정상적으로 반영 되었습니다.
                              dms.notification.success("<spring:message code='global.info.success'/>");
                          }
                      });
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



/*************************************************************
 * DataSource 영역
 *************************************************************/

/*************************************************************
 * 그리드 셋팅
 *************************************************************/
       //그리드 설정(VOC 마스터)
       $("#vocGrid").kendoExtGrid({
           gridId:"G-CRM-0519-172113"
           ,dataSource:{
               transport:{
                   read:{
                       url:"<c:url value='/crm/crq/vocMgmt/selectVocMgmts.do' />"
                   }
                   ,parameterMap:function(options, operation) {
                       if (operation === "read") {

                           var params = {};

                           params["recordCountPerPage"]    = options.pageSize;
                           params["pageIndex"]             = options.page;
                           params["firstIndex"]            = options.skip;
                           params["lastIndex"]             = options.skip + options.take;
                           params["sort"]                  = options.sort;

                           params["sCust"] = $("#sCust").val();
                           params["sRegStartDt"]    = $("#sRegStartDt").data("kendoExtMaskedDatePicker").value();
                           params["sRegEndDt"]      = $("#sRegEndDt").data("kendoExtMaskedDatePicker").value();
                           params["sVocTpCd"]       = $("#sVocTpCd").val();
                           params["sVocStatCd"]     = $("#sVocStatCd").val();
                           params["sCmplCauCd"]     = $("#sCmplCauCd").val();

                           console.log(params);
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
                               , vocStatCd          :{type:"string", editable:false} //VOC상태코드
                               , vocStatNm          :{type:"string", editable:false} //VOC상태코드명
                               , vocTpCd            :{type:"string", editable:false} //VOC유형코드
                               , vocTpNm            :{type:"string", editable:false} //VOC유형코드명
                               , tendCd             :{type:"string", editable:false} //성향코드
                               , vocTpSub1Cd        :{type:"string", editable:false} //VOC유형하위1코드
                               , vocTpSub2Cd        :{type:"string", editable:false} //VOC유형하위2코드
                               , vocTpSub3Cd        :{type:"string", editable:false} //VOC유형하위3코드
                               , acptSrcCd          :{type:"string", editable:false} //접수출처코드
                               , activeGainPathCd   :{type:"string", editable:false} //활동획득경로코드
                               , cmplCauCd          :{type:"string", editable:false} //불만원인코드
                               , prorCd             :{type:"string", editable:false} //우선순위코드
                               , procLmtCd          :{type:"string", editable:false} //처리시한코드
                               , vocEndDt           :{type:"date",   editable:false} //VOC종료일자
                               , receiveTelNo       :{type:"string", editable:false} //수신전화번호
                               , custNm             :{type:"string", editable:false} //고객명
                               , custNo             :{type:"string", editable:false} //고객번호
                               , custPrefCommNo     :{type:"string", editable:false} //고객선호연락번호
                               , hpNo               :{type:"string", editable:false} //휴대폰번호
                               , homeTelNo          :{type:"string", editable:false} //집전화번호
                               , officeTelNo        :{type:"string", editable:false} //직장전화번호
                               , pconCustNm         :{type:"string", editable:false} //연계인고객명
                               , pconCustNo         :{type:"string", editable:false} //연계인고객번호
                               , pconCustMjrTelNo   :{type:"string", editable:false} //연계인고객주요전화번호
                               , pconCustHpNo       :{type:"string", editable:false} //연계인고객휴대폰번호
                               , pconCustHomeTelNo  :{type:"string", editable:false} //연계인고객집전화번호
                               , pconCustOfficeTelNo:{type:"string", editable:false} //연계인고객직장전화번호
                               , resvDt             :{type:"date",   editable:false} //예약일자
                               , sendTelNo          :{type:"string", editable:false} //발신전화번호
                               , pconRelCd          :{type:"string", editable:false} //연계인관계코드
                               , pprocId            :{type:"string", editable:false} //처리인ID
                               , coopDeptNm         :{type:"string", editable:false} //협조부서명
                               , bizDeptNm          :{type:"string", editable:false} //사업부서명
                               , officeNm           :{type:"string", editable:false} //사무소명
                               , sungCd             :{type:"string", editable:false} //성코드
                               , sungNm             :{type:"string", editable:false} //성명
                               , cityCd             :{type:"string", editable:false} //도시코드
                               , cityNm             :{type:"string", editable:false} //도시명
                               , vinNo              :{type:"string", editable:false} //차대번호
                               , carRegNo           :{type:"string", editable:false} //차량등록번호
                               , carlineCd          :{type:"string", editable:false} //차종코드
                               , carlineNm          :{type:"string", editable:false} //차종명
                               , modelCd            :{type:"string", editable:false} //모델코드
                               , modelNm            :{type:"string", editable:false} //모델명
                               , ocnCd              :{type:"string", editable:false} //OCN코드
                               , ocnNm              :{type:"string", editable:false} //OCN명
                               , runDistVal         :{type:"string", editable:false} //주행거리값
                               , acptDeptNm         :{type:"string", editable:false} //접수부서
                               , pacptId            :{type:"string", editable:false} //접수자ID
                               , acptDt             :{type:"date",   editable:false} //접수일자
                               , custReqCont        :{type:"string", editable:false} //고객요청내용
                               , pevalId            :{type:"string", editable:false} //심사인ID
                               , evalAllocDt        :{type:"date",   editable:false} //심사배정일자
                               , callCenOpnCont     :{type:"string", editable:false} //콜센터의견내용
                               , returnCauCont      :{type:"string", editable:false} //반송원인내용
                               , pmoCauCd           :{type:"string", editable:false} //승급원인코드
                               , pmoDt              :{type:"date",   editable:false} //승급일자
                               , revMthCont         :{type:"string", editable:false} //검토방안내용
                               , realPprocId        :{type:"string", editable:false} //실처리인ID
                               , procDt             :{type:"date",   editable:false} //처리일자
                               , pprocTelNo         :{type:"string", editable:false} //처리인전화번호
                               , pprocEmailNm       :{type:"string", editable:false} //처리인이메일명
                               , procRsltCont       :{type:"string", editable:false} //처리결과내용
                               , stsfIvstEmpId      :{type:"string", editable:false} //만족도조사인ID
                               , stsfIvstDt         :{type:"date",   editable:false} //만족도조사일자
                               , stsfIvstRsltCont   :{type:"string", editable:false} //만족도조사결과내용
                               , mthAchvHm          :{type:"string", editable:false} //방안달성시간
                               , cmplStsfNm         :{type:"string", editable:false} //불만만족도
                               , cmplReAcptYn       :{type:"string", editable:false} //불만재접수여부
                               , cmplReAcptCnt      :{type:"string", editable:false} //불만재접수횟수
                               , serReqNo           :{type:"string", editable:false} //서비스요청번호
                               , cmplDlDeptNm       :{type:"string", editable:false} //불만전달부서명
                               , cmplDlEmpId        :{type:"string", editable:false} //불만전달자ID
                               , saleDt             :{type:"date",   editable:false} //판매일자
                               , dstbNo             :{type:"string", editable:false} //물류번호
                               , parOrdYn           :{type:"string", editable:false} //부품오더여부
                               , parOrdDt           :{type:"date",   editable:false} //부품오더일자
                               , parArrvDt          :{type:"date",   editable:false} //부품도착일자
                               , itemCd             :{type:"string", editable:false} //품목코드
                               , bhmcYn             :{type:"string", editable:false} //BHMC여부
                               , bhmcVocNo          :{type:"string", editable:false} //BHMCVOC번호
                               , regUsrId           :{type:"string", editable:false} //등록자ID
                               , regDt              :{type:"date",   editable:false} //등록일자
                               , updtUsrId          :{type:"string", editable:false} //수정자ID
                               , updtDt             :{type:"date",   editable:false} //수정일자
                               , pprocDeptNm        :{type:"string", editable:false} //처리부서명
                               , vocCnt             :{type:"string", editable:false} //정보VIEW
                               , dlrCd              :{type:"string"}
                               , acptDtFormat       :{type:"date",   editable:false} //요청일자
                               , procDtFormat       :{type:"date",   editable:false} //처리일자
                               , regDtFormat        :{type:"date",   editable:false} //수정일자

                           }
                       }
                       ,parse: function(d) {
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

               var dataItems = e.sender.dataSource.view();
               var vocCnt1 = dataItems.length == 0 ? "0":dataItems[0]["vocCnt1"];
               var vocCnt2 = dataItems.length == 0 ? "0":dataItems[0]["vocCnt2"];
               var vocCnt3 = dataItems.length == 0 ? "0":dataItems[0]["vocCnt3"];
               var vocCnt4 = dataItems.length == 0 ? "0":dataItems[0]["vocCnt4"];
               var vocCnt5 = dataItems.length == 0 ? "0":dataItems[0]["vocCnt5"];

               console.log(dataItems)

               $("#vocCnt1").val(vocCnt1);
               $("#vocCnt2").val(vocCnt2);
               $("#vocCnt3").val(vocCnt3);
               $("#vocCnt4").val(vocCnt4);
               $("#vocCnt5").val(vocCnt5);

               $("#vocCnt").val("<spring:message code='crm.info.vocTpCdCnt' arguments='"+vocCnt1+","+vocCnt2+","+vocCnt3+","+vocCnt4+","+vocCnt5+"' />");
           }
           ,height:350
           ,navigatable:false
           ,resizable:false
           ,editable:false
           ,filterable: {
               mode:"row"
           }
           ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
           ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
           ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
           ,appendEmptyColumn:true           //빈컬럼 적용. default:false
           ,enableTooltip:true               //Tooltip 적용, default:false
           ,change:function(e){

               var selectedItem = this.dataItem(this.select());

               if( dms.string.isNotEmpty(selectedItem) ){

                   // 고객케어 상세 조회
                   var vocNo = selectedItem.vocNo;

                   var param = {
                           "sVocNo":vocNo
                           };
                   console.log("vocNo:"+JSON.stringify(param))

                   $.ajax({
                           url:"<c:url value='/crm/crq/vocMgmt/selectVocMgmtByKey.do' />"
                           ,data: JSON.stringify(param)      //파라미터
                           ,type: 'POST'                        //조회요청
                           ,dataType:'json'                  //json 응답
                           ,contentType:'application/json'   //문자열 파라미터
                           ,async:false
                           ,error: function(jqXHR,status,error){
                               dms.notification.error(jqXHR.responseJSON.errors);
                           }
                   }).done(function(body) {

                       console.log("고객케어 관리 상세 조회 결과:",body);

                       //form 초기화
                       initForm();

                       mode = "U";

                       $("#bhmcYn").val(selectedItem.bhmcYn);
                       $("#bhmcVocNo").val(selectedItem.bhmcVocNo);
                       $("#dlrCd").val(selectedItem.dlrCd);

                       $("#vocNo").val(selectedItem.vocNo);
                       onSelectVocStatCdSet(selectedItem.vocTpCd);
                       $("#vocStatCd").data("kendoExtDropDownList").value(selectedItem.vocStatCd);
                       $("#bfVocStatCd").val(selectedItem.bfVocStatCd);
                       // VOC 유형은 수정불가
                       $("#vocTpCd").data("kendoExtDropDownList").value(selectedItem.vocTpCd);
                       $("#vocTpCd").data("kendoExtDropDownList").enable(false);

                       $("#vocTpSubCd").data("kendoExtDropDownList").value(selectedItem.vocTpSubCd);
                       $("#tendCd").data("kendoExtDropDownList").value(selectedItem.tendCd);
                       $("#vocTpSub1Cd").data("kendoExtDropDownList").value(selectedItem.vocTpSub1Cd);
                       onSelectVocTpSubCdSet("CRM606", selectedItem.vocTpSub1Cd);                                   //VOC유형하위2코드 설정
                       $("#vocTpSub2Cd").data("kendoExtDropDownList").value(selectedItem.vocTpSub2Cd);
                       onSelectVocTpSubCdSet("CRM607", selectedItem.vocTpSub2Cd);                                   //VOC유형하위3코드 설정
                       $("#vocTpSub3Cd").data("kendoExtDropDownList").value(selectedItem.vocTpSub3Cd);
                       $("#acptSrcCd").data("kendoExtDropDownList").value(selectedItem.acptSrcCd);
                       $("#activeGainPathCd").data("kendoExtDropDownList").value(selectedItem.activeGainPathCd);
                       $("#cmplCauCd").data("kendoExtDropDownList").value(selectedItem.cmplCauCd);
                       $("#prorCd").data("kendoExtDropDownList").value(selectedItem.prorCd);
                       $("#procLmtCd").data("kendoExtDropDownList").value(selectedItem.procLmtCd);
                       $("#vocEndDt").data("kendoExtMaskedDateTimePicker").value(selectedItem.vocEndDt);
                       var dlrCmpCommYn = selectedItem.dlrCmpCommYn;
                       if ( dlrCmpCommYn === 'Y' ) {
                           $("#dlrCmpCommYn").prop("checked", true)
                       };

                       $("#emgcRescFstCallYn").data("kendoExtDropDownList").value(selectedItem.emgcRescFstCallYn);   //긴급전화 첫 통화여부
                       $("#emgcRescYn").data("kendoExtDropDownList").value(selectedItem.emgcRescYn);   //긴급구조 여부
                       $("#emgcRescReasonNm").data("kendoExtDropDownList").value(selectedItem.emgcRescReasonNm);   //원인
                       $("#emgcRescStsfCont").data("kendoExtDropDownList").value(selectedItem.emgcRescStsfCont);   //구조 만족도
                       $("#emgcRescLocCont").val(selectedItem.emgcRescLocCont);                                  //고객구조위치


                       $("#receiveTelNo").val(selectedItem.receiveTelNo);
                       $("#custNo").val(selectedItem.custNo);
                       $("#custNm").val(selectedItem.custNm);
                       $("#pconCustNm").val(selectedItem.pconCustNm);
                       $("#pconCustNo").val(selectedItem.pconCustNo);
                       $("#custPrefCommNo").val(selectedItem.custPrefCommNo);
                       $("#hpNo").val(selectedItem.hpNo);
                       $("#homeTelNo").val(selectedItem.homeTelNo);
                       $("#officeTelNo").val(selectedItem.officeTelNo);
                       $("#pconCustMjrTelNo").val(selectedItem.pconCustMjrTelNo);
                       $("#pconCustHpNo").val(selectedItem.pconCustHpNo);
                       $("#pconCustHomeTelNo").val(selectedItem.pconCustHomeTelNo);
                       $("#pconCustOfficeTelNo").val(selectedItem.pconCustOfficeTelNo);
                       $("#resvDt").data("kendoExtMaskedDateTimePicker").value(selectedItem.resvDt);
                       $("#repairBookId").val(selectedItem.repairBookId);

                       $("#sendTelNo").val(selectedItem.sendTelNo);
                       $("#pconRelCd").data("kendoExtDropDownList").value(selectedItem.pconRelCd);
                       $("#pprocDeptNm").val(selectedItem.pprocDeptNm);
                       $("#pprocId").val(selectedItem.pprocId);
                       $("#pprocNm").val(selectedItem.pprocNm);
                       $("#coopDeptNm").val(selectedItem.coopDeptNm);
                       $("#bizDeptNm").val(selectedItem.bizDeptNm);
                       $("#officeNm").val(selectedItem.officeNm);
                       $("#sungNm").val(selectedItem.sungNm);
                       $("#sungCd").data("kendoExtDropDownList").value(selectedItem.sungCd);
                       $("#cityNm").val(selectedItem.cityNm);
                       $("#cityCd").data("kendoExtDropDownList").enable(true);
                       onSelectSungCdSet(selectedItem.sungCd);
                       $("#cityCd").data("kendoExtDropDownList").value(selectedItem.cityCd);
                       $("#custReqCont").val(selectedItem.custReqCont);

                       $("#vinNo").val(selectedItem.vinNo);
                       $("#carRegNo").val(selectedItem.carRegNo);
                       $("#carlineCd").data("kendoExtDropDownList").value(selectedItem.carlineCd);
                       if(selectedItem.carlineCd != null){
                           $("#modelCd").data("kendoExtDropDownList").enable(true);
                           onSelectCarlineCdSet(selectedItem.carlineCd);
                       }
                       $("#carlineNm").val(selectedItem.carlineNm);
                       $("#modelCd").data("kendoExtDropDownList").value(selectedItem.modelCd);
                       if(selectedItem.modelCd != null){
                           $("#ocnCd").data("kendoExtDropDownList").enable(true);
                           onSelectModelCdSet(selectedItem.modelCd);
                       }
                       $("#modelNm").val(selectedItem.modelNm);
                       $("#ocnNm").val(selectedItem.ocnNm);
                       $("#ocnCd").data("kendoExtDropDownList").value(selectedItem.ocnCd);
                       $("#runDistVal").val(selectedItem.runDistVal);
                       $("#acptDeptNm").val(selectedItem.acptDeptNm);
                       $("#pacptId").val(selectedItem.pacptId);
                       $("#pacptNm").val(selectedItem.pacptNm);
                       $("#acptDt").data("kendoExtMaskedDateTimePicker").value(selectedItem.acptDt);
                       $("#manufacturer").val(selectedItem.manufacturer);

                       $("#pevalId").val(selectedItem.pevalId);
                       $("#pevalNm").val(selectedItem.pevalNm);
                       $("#returnCauCont").val(selectedItem.returnCauCont);
                       $("#pmoCauCd").data("kendoExtDropDownList").value(selectedItem.pmoCauCd);
                       $("#realPprocId").val(selectedItem.realPprocId);
                       $("#realPprocNm").val(selectedItem.realPprocNm);
                       $("#pprocTelNo").val(selectedItem.pprocTelNo);
                       $("#stsfIvstEmpId").val(selectedItem.stsfIvstEmpId);
                       $("#stsfIvstEmpNm").val(selectedItem.stsfIvstEmpNm);
                       $("#mthAchvHm").val(selectedItem.mthAchvHm);
                       $("#traceDt").data("kendoExtMaskedDateTimePicker").value(selectedItem.traceDt);

                       $("#evalAllocDt").data("kendoExtMaskedDateTimePicker").value(selectedItem.evalAllocDt);
                       $("#dataShipStatNm").val(selectedItem.dataShipStatNm);
                       $("#pmoDt").data("kendoExtMaskedDateTimePicker").value(selectedItem.pmoDt);
                       $("#procDt").data("kendoExtMaskedDateTimePicker").value(selectedItem.procDt);
                       $("#pprocEmailNm").val(selectedItem.pprocEmailNm);
                       $("#stsfIvstDt").data("kendoExtMaskedDateTimePicker").value(selectedItem.stsfIvstDt);
                       $("#traceRsltCont").val(selectedItem.traceRsltCont);

                       $("#callCenOpnCont").val(selectedItem.callCenOpnCont);
                       $("#revMthCont").val(selectedItem.revMthCont);
                       $("#procRsltCont").val(selectedItem.procRsltCont);
                       $("#stsfIvstRsltCont").val(selectedItem.stsfIvstRsltCont);

                       $("#cmplStsfNm01").val(selectedItem.cmplStsfNm);
                       $("#cmplStsfNm02").val(selectedItem.cmplStsfNm);
                       var cmplReAcptYn = selectedItem.cmplReAcptYn;
                       if ( cmplReAcptYn === 'Y' ) {
                           $("#cmplReAcptYn").prop("checked", true)
                       };
                       $("#cmplReAcptCnt").val(selectedItem.cmplReAcptCnt);
                       $("#serReqNo").val(selectedItem.serReqNo);
                       $("#cmplDlDeptNm").val(selectedItem.cmplDlDeptNm);
                       $("#cmplDlEmpId").val(selectedItem.cmplDlEmpId);
                       $("#cmplDlEmpNm").val(selectedItem.cmplDlEmpNm);
                       $("#saleDt01").data("kendoExtMaskedDateTimePicker").value(selectedItem.saleDt);
                       $("#saleDt02").data("kendoExtMaskedDateTimePicker").value(selectedItem.saleDt);
                       $("#dstbNo").val(selectedItem.dstbNo);


                       changeComboList(selectedItem.vocTpCd);

                       $("#btnActiveSave").data("kendoButton").enable(true);
                       $("#btnAdd").data("kendoButton").enable(true);

                       // BHMC 일경우 처리 결과 form 빼고 읽기전용
                       if ( dms.string.isNotEmpty(selectedItem.bhmcVocNo) && selectedItem.bhmcYn === "Y") {
                           readOnlyDefualtForm();
                           $("#btnProce").data("kendoButton").enable(true);
                           $("#btnSave").data("kendoButton").enable(false);
                       }

                       // 활동목록 그리드 조회
                       var grid = $("#activeGrid").data("kendoExtGrid");
                       grid.dataSource.page(1);

                   });

               };

           }
           ,columns:[
                        {field:"vocNo"            , title:"<spring:message code='global.lbl.vocNo' />"      , attributes:{"class":"ac"}, width:150}    //VOC번호
                       ,{field:"bhmcVocNo"        , title:"<spring:message code='global.lbl.BhmcVocNo' />"  , attributes:{"class":"ac"}, width:150}    //BHMCVOC번호
                       ,{field:"custNm"           , title:"<spring:message code='global.lbl.custNm' />"     , attributes:{"class":"ac"}, width:100}    //고객명
                       ,{field:"custPrefCommNo"   , title:"<spring:message code='global.lbl.telNumer' />"   , attributes:{"class":"ac"}, width:100}    //연락처
                       ,{field:"vocTpNm"          , title:"<spring:message code='global.lbl.vocTpCd' />"    , attributes:{"class":"ac"}, width:100}    //VOC유형코드명
                       ,{field:"vocStatNm"        , title:"<spring:message code='global.lbl.vocStatCd' />"  , attributes:{"class":"ac"}, width:100}    //VOC상태코드명
                       ,{field:"acptDtFormat", title:"<spring:message code='crm.lbl.acptDt' />", width:100   // 접수일
                           ,attributes:{"class":"ac tooltip-disabled"}
                           ,template:"#if (acptDtFormat !== null ){# #= kendo.toString(data.acptDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                       }
                       ,{field:"procDtFormat", title:"<spring:message code='crm.lbl.procDt' />", width:100   // 처리일자
                           ,attributes:{"class":"ac tooltip-disabled"}
                           ,template:"#if (procDtFormat !== null ){# #= kendo.toString(data.procDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                       }
                       ,{field:"emgcRescStartYn"      , title:"<spring:message code='global.lbl.emgcRescStartYn' />"   , attributes:{"class":"ac"}, width:100}    //긴급 구조 출발 여부
                       ,{field:"pprocDeptNm"      , title:"<spring:message code='crm.lbl.pprocDeptNm' />"   , attributes:{"class":"ac"}, width:100}    //처리 담당부서
                       ,{field:"pprocNm"          , title:"<spring:message code='crm.lbl.pprocId' />"       , attributes:{"class":"ac"}, width:100}    //처리담다다
                       ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:100   // 등록일
                           ,attributes:{"class":"ac tooltip-disabled"}
                           ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                       }
                       /*
                       ,{field:"vocTpCd"            , title:"<spring:message code='global.lbl.vocTpCd' />"               , hidden:true}                                 //VOC유형코드
                       ,{field:"vocStatCd"          , title:"<spring:message code='global.lbl.vocStatCd' />"              , hidden:true}                                 //VOC상태코드
                       ,{field:"tendCd"             , title:"성향코드"              , hidden:true}  //성향코드
                       ,{field:"vocTpSub1Cd"        , title:"VOC유형하위1코드"      , hidden:true}  //VOC유형하위1코드
                       ,{field:"vocTpSub2Cd"        , title:"VOC유형하위2코드"      , hidden:true}  //VOC유형하위2코드
                       ,{field:"vocTpSub3Cd"        , title:"VOC유형하위3코드"      , hidden:true}  //VOC유형하위3코드
                       ,{field:"acptSrcCd"          , title:"접수출처코드"          , hidden:true}  //접수출처코드
                       ,{field:"activeGainPathCd"   , title:"활동획득경로코드"      , hidden:true}  //활동획득경로코드
                       ,{field:"cmplCauCd"          , title:"불만원인코드"          , hidden:true}  //불만원인코드
                       ,{field:"prorCd"             , title:"우선순위코드"          , hidden:true}  //우선순위코드
                       ,{field:"procLmtCd"          , title:"처리시한코드"          , hidden:true}  //처리시한코드
                       ,{field:"vocEndDt"           , title:"VOC종료일자"           , hidden:true}  //VOC종료일자
                       ,{field:"receiveTelNo"       , title:"수신전화번호"          , hidden:true}  //수신전화번호
                       ,{field:"custNo"             , title:"고객번호"              , hidden:true}  //고객번호
                       ,{field:"hpNo"               , title:"휴대폰번호"            , hidden:true}  //휴대폰번호
                       ,{field:"homeTelNo"          , title:"집전화번호"            , hidden:true}  //집전화번호
                       ,{field:"officeTelNo"        , title:"직장전화번호"          , hidden:true}  //직장전화번호
                       ,{field:"pconCustNm"         , title:"연계인고객명"          , hidden:true}  //연계인고객명
                       ,{field:"pconCustNo"         , title:"연계인고객번호"        , hidden:true}  //연계인고객번호
                       ,{field:"pconCustMjrTelNo"   , title:"연계인고객주요전화번호", hidden:true}  //연계인고객주요전화번호
                       ,{field:"pconCustHpNo"       , title:"연계인고객휴대폰번호"  , hidden:true}  //연계인고객휴대폰번호
                       ,{field:"pconCustHomeTelNo"  , title:"연계인고객집전화번호"  , hidden:true}  //연계인고객집전화번호
                       ,{field:"pconCustOfficeTelNo", title:"연계인고객직장전화번호", hidden:true}  //연계인고객직장전화번호
                       ,{field:"resvDt"             , title:"예약일자"              , hidden:true ,format:"{0:<dms:configValue code='dateFormat' />}" }  //예약일자
                       ,{field:"sendTelNo"          , title:"발신전화번호"          , hidden:true}  //발신전화번호
                       ,{field:"pconRelCd"          , title:"연계인관계코드"        , hidden:true}  //연계인관계코드
                       ,{field:"coopDeptNm"         , title:"협조부서명"            , hidden:true}  //협조부서명
                       ,{field:"officeNm"           , title:"사무소명"              , hidden:true}  //사무소명
                       ,{field:"sungCd"             , title:"성코드"                , hidden:true}  //성코드
                       ,{field:"sungNm"             , title:"성명"                  , hidden:true}  //성명
                       ,{field:"cityCd"             , title:"도시코드"              , hidden:true}  //도시코드
                       ,{field:"cityNm"             , title:"도시명"                , hidden:true}  //도시명
                       ,{field:"vinNo"              , title:"차대번호"              , hidden:true}  //차대번호
                       ,{field:"carRegNo"           , title:"차량등록번호"          , hidden:true}  //차량등록번호
                       ,{field:"carlineCd"          , title:"차종코드"              , hidden:true}  //차종코드
                       ,{field:"carlineNm"          , title:"차종명"                , hidden:true}  //차종명
                       ,{field:"modelCd"            , title:"모델코드"              , hidden:true}  //모델코드
                       ,{field:"modelNm"            , title:"모델명"                , hidden:true}  //모델명
                       ,{field:"ocnCd"              , title:"OCN코드"               , hidden:true}  //OCN코드
                       ,{field:"ocnNm"              , title:"OCN명"                 , hidden:true}  //OCN명
                       ,{field:"runDistVal"         , title:"주행거리값"            , hidden:true}  //주행거리값
                       ,{field:"acptDeptNm"         , title:"접수부서"              , hidden:true}  //접수부서
                       ,{field:"pacptId"            , title:"접수자ID"              , hidden:true}  //접수자ID
                       ,{field:"custReqCont"        , title:"고객요청내용"          , hidden:true}  //고객요청내용
                       ,{field:"pevalId"            , title:"심사인ID"              , hidden:true}  //심사인ID
                       ,{field:"evalAllocDt"        , title:"심사배정일자"          , hidden:true ,format:"{0:<dms:configValue code='dateFormat' />}" }  //심사배정일자
                       ,{field:"callCenOpnCont"     , title:"콜센터의견내용"        , hidden:true}  //콜센터의견내용
                       ,{field:"returnCauCont"      , title:"반송원인내용"          , hidden:true}  //반송원인내용
                       ,{field:"pmoCauCd"           , title:"승급원인코드"          , hidden:true}  //승급원인코드
                       ,{field:"pmoDt"              , title:"승급일자"              , hidden:true ,format:"{0:<dms:configValue code='dateFormat' />}" }  //승급일자
                       ,{field:"revMthCont"         , title:"검토방안내용"          , hidden:true}  //검토방안내용
                       ,{field:"realPprocId"        , title:"실처리인ID"            , hidden:true}  //실처리인ID
                       ,{field:"pprocTelNo"         , title:"처리인전화번호"        , hidden:true}  //처리인전화번호
                       ,{field:"pprocEmailNm"       , title:"처리인이메일명"        , hidden:true}  //처리인이메일명
                       ,{field:"procRsltCont"       , title:"처리결과내용"          , hidden:true}  //처리결과내용
                       ,{field:"stsfIvstEmpId"      , title:"만족도조사인ID"        , hidden:true}  //만족도조사인ID
                       ,{field:"stsfIvstDt"         , title:"만족도조사일자"        , hidden:true ,format:"{0:<dms:configValue code='dateFormat' />}" }  //만족도조사일자
                       ,{field:"stsfIvstRsltCont"   , title:"만족도조사결과내용"    , hidden:true}  //만족도조사결과내용
                       ,{field:"mthAchvHm"          , title:"방안달성시간"          , hidden:true}  //방안달성시간
                       ,{field:"cmplStsfNm"         , title:"불만만족도"        , hidden:true}  //불만만족도코드
                       ,{field:"cmplReAcptYn"       , title:"불만재접수여부"        , hidden:true}  //불만재접수여부
                       ,{field:"cmplReAcptCnt"      , title:"불만재접수횟수"        , hidden:true}  //불만재접수횟수
                       ,{field:"serReqNo"           , title:"서비스요청번호"        , hidden:true}  //서비스요청번호
                       ,{field:"cmplDlDeptNm"       , title:"불만전달부서명"        , hidden:true}  //불만전달부서명
                       ,{field:"cmplDlEmpId"        , title:"불만전달자ID"          , hidden:true}  //불만전달자ID
                       ,{field:"saleDt"             , title:"판매일자"              , hidden:true ,format:"{0:<dms:configValue code='dateFormat' />}" }  //판매일자
                       ,{field:"dstbNo"             , title:"물류번호"              , hidden:true}  //물류번호
                       ,{field:"parOrdYn"           , title:"부품오더여부"          , hidden:true}  //부품오더여부
                       ,{field:"parOrdDt"           , title:"부품오더일자"          , hidden:true ,format:"{0:<dms:configValue code='dateFormat' />}" }  //부품오더일자
                       ,{field:"parArrvDt"          , title:"부품도착일자"          , hidden:true ,format:"{0:<dms:configValue code='dateFormat' />}" }  //부품도착일자
                       ,{field:"itemCd"             , title:"품목코드"              , hidden:true}  //품목코드
                       ,{field:"bhmcYn"             , title:"BHMC여부"              , hidden:true}  //BHMC여부
                       ,{field:"regUsrId"           , title:"등록자ID"              , hidden:true}  //등록자ID
                       ,{field:"updtUsrId"          , title:"수정자ID"              , hidden:true}  //수정자ID
                       ,{field:"updtDt"             , title:"수정일자"              , hidden:true ,format:"{0:<dms:configValue code='dateFormat' />}" }  //수정일자
                       ,{field:"bizDeptNm"          , title:"사업부서"              , hidden:true}  //사업부서명
                       ,{field:"vocCnt1"            , title:"정보VIEW"              , hidden:true}  //정보VIEW
                       ,{field:"vocCnt3"            , title:"정보VIEW"              , hidden:true}  //정보VIEW
                       ,{field:"vocCnt4"            , title:"정보VIEW"              , hidden:true}  //정보VIEW
                       ,{field:"vocCnt5"            , title:"정보VIEW"              , hidden:true}  //정보VIEW
                       ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
                        */
           ]
       });


       //그리드 설정(활동목록)
       $("#activeGrid").kendoExtGrid({
           gridId:"G-CRM-0519-172119"
           ,dataSource:{
               transport:{
                   read:{
                       url:"<c:url value='/crm/crq/vocMgmt/selectActives.do' />"
                   }
                   ,parameterMap:function(options, operation) {
                       if (operation === "read") {

                           var params = {};

                           params["sDlrCd"]       = $("#dlrCd").val();
                           params["sVocNo"]       = $("#vocNo").val();

                           console.log(params);
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
                               , pgssHm:{type:"number", editable:false}

                               , regDt:{type:"date", editable:false}
                               , regUsrId:{type:"string", editable:false}
                               , regDeptNm:{type:"string"}
                               , activeStatCd:{type:"string"}
                               , activeTpCd:{type:"string"}
                               , activeTpSubCd:{type:"string"}
                               , custNo:{type:"string"}
                               , custNm:{type:"string"}
                               , pconCustNo:{type:"string"}
                               , pconCustNm:{type:"string"}
                               , activeRsltCont:{type:"string"}
                               , activeCd:{type:"string"}
                               , activeTpCd:{type:"string",editable:true}
                               , regDtFormat:{type:"date", editable:false}
                           }
                       }
                       ,parse: function(d) {
                           if(d.data){
                               $.each(d.data, function(idx, elem) {
                                   elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                               });
                           }
                           return d;
                       }
               }
           }

           ,autoBind:false
           ,height:200
           ,navigatable:false
           ,resizable:false
           //,editable:false
           ,filterable: {
               mode:"row"
           }
           ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
           ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
           ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
           ,appendEmptyColumn:true           //빈컬럼 적용. default:false
           ,enableTooltip:true               //Tooltip 적용, default:false
           ,pageable:false
           ,height:200
           ,editableOnlyNew:true
           ,editableOnlyNewExcludeColumns:["modelCd"]
           ,columns:[
                 {field:"pgssHm", title:"진행시간", hidden:true}         // 진행시간
                ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
                ,{field:"vocNo", title:"<spring:message code='global.lbl.vocNo' />", hidden:true}          // VOC번호
                ,{field:"vocActiveNo", title:"<spring:message code='global.lbl.vocActiveNo' />", hidden:true} // VOC활동번호
                ,{field:"regUsrId", hidden:true}  //등록자ID

                ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:100   // 등록일
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }
                ,{field:"regUsrId", title:"<spring:message code='global.lbl.regUsrId' />"       //등록자ID
                    , attributes:{"class":"ac"}, width:100
                }
                ,{field:"regDeptNm", title:"<spring:message code='global.lbl.regDeptNm' />"     //등록부서
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
                                    console.log("111")
                                }
                            });

                        }else{
                            container.context.innerText = dms.string.strNvl(activeTpCdArrVal[options.model.activeTpCd]);
                        }
                    }
                }
                 , { field:"activeTpSubCd", title:"<spring:message code='global.lbl.activeTpSubCd' />" ,width:140
                    ,editor: function(container, options) {

                        var activeTpCd = options.model.activeTpCd;

                         $('<input data-bind="value:' + options.field + '"  />')
                         .appendTo(container)
                         .kendoExtDropDownList({
                             dataTextField:  "cmmCdNm"
                            ,dataValueField: "cmmCd"
                            ,dataSource:activeTpSubCdListObj[activeTpCd]
                         });
                     }
                    ,template:'#= activeTpSubCdArrVal(activeTpSubCd)#'
                 }
                ,{field:"custNo", title:"<spring:message code='global.lbl.customer' />", hidden:true}           // 고객
                ,{field:"custNm", title:"<spring:message code='global.lbl.customer' />", width:100, attributes:{"class":"al"}     // 고객
                    ,template:"<div class=\"form_search\"><input class='form_input' value='#if (custNm !== null ){# #= custNm # #} else {# #= '' # #}#' disabled /><a href=\"javascript:selectCustPopupWindow(\'#= uid #\', \'1\');\" ></a></div>"
                }
                ,{field:"pconCustNo", title:"<spring:message code='global.lbl.pconCustInfo' />", hidden:true}       // 문의자
                ,{field:"pconCustNm", title:"<spring:message code='global.lbl.pconCustInfo' />", width:100, attributes:{"class":"al"}     // 문의자
                    ,template:"<div class=\"form_search\"><input class='form_input' value='#if (pconCustNm !== null ){# #= pconCustNm # #} else {# #= '' # #}#' disabled /><a href=\"javascript:selectCustPopupWindow(\'#= uid #\', \'2\');\" ></a></div>"
                }
                ,{field:"activeRsltCont", title:"<spring:message code='global.lbl.activeRsltCont' />", width:200}       // 활동결과
                , {field:"bhmcVocActiveNo", title:"<spring:message code='crm.lbl.bhmcVocActiveNo' />", width:100    //BHMC VOC활동번호
                    , attributes:{"class":"ac"}
                }
                , {field:"activeCont", title:"<spring:message code='crm.lbl.activeCont' />", width:100    //활동내용
                    , attributes:{"class":"ac"}
                }
                , {field:"alrtCd", title:"<spring:message code='crm.lbl.alrtCd' />", width:100    //알람코드
                    , attributes:{"class":"ac"}
                }
                , {field:"callSeq", title:"<spring:message code='crm.lbl.callSeq' />"    //콜번호
                    , width:100, attributes:{"class":"ac"}
                }
                , {field:"stsfCont", title:"<spring:message code='crm.lbl.stsfCont' />", width:100    //설명/화술 (만족도내용)
                    , attributes:{"class":"ac"}
                }
                , {field:"emailSenderNm", title:"<spring:message code='crm.lbl.emailSenderNm' />", width:100        //이메일전송자명
                    , attributes:{"class":"ac"}
                }
                , {field:"emailSenderAddrNm", title:"<spring:message code='crm.lbl.emailSenderAddrNm' />", width:100    //이메일전송자주소명
                    , attributes:{"class":"ac"}
                }
                , {field:"emailActiveCd", title:"<spring:message code='crm.lbl.emailActiveCd' />", width:100    //이메일활동코드
                    , attributes:{"class":"ac"}
                }
                , {field:"ownerId", title:"<spring:message code='crm.lbl.ownerId' />", width:100        //소유자ID
                    , attributes:{"class":"ac"}
                }
                , {field:"bhmcVocNo", title:"<spring:message code='global.lbl.BhmcVocNo' />", width:100    //BHMCVOC번호
                    , attributes:{"class":"ac"}
                }
           ]
       });


       if($("#vocNo").val() == ""){
           changeComboList("");
       }

});





function vocValuSet(){


    $("#bhmcYn").val("Y");
    $("#bhmcVocNo").val("管理员二");
    $("#dlrCd").val("管理员二");

    $("#vocNo").val("");
    $("#vocStatCd").data("kendoExtDropDownList").value("01");
    $("#bfVocStatCd").val("01");
    $("#vocTpCd").data("kendoExtDropDownList").value("01");
    $("#vocTpSubCd").data("kendoExtDropDownList").value("01");
    $("#tendCd").data("kendoExtDropDownList").value("01");
    $("#vocTpSub1Cd").data("kendoExtDropDownList").value("01");
    $("#vocTpSub2Cd").data("kendoExtDropDownList").value("01");
    $("#vocTpSub3Cd").data("kendoExtDropDownList").value("01");
    $("#acptSrcCd").data("kendoExtDropDownList").value("01");
    $("#activeGainPathCd").data("kendoExtDropDownList").value("01");
    $("#cmplCauCd").data("kendoExtDropDownList").value("01");
    $("#prorCd").data("kendoExtDropDownList").value("01");
    $("#procLmtCd").data("kendoExtDropDownList").value("01");
    $("#vocEndDt").data("kendoExtMaskedDateTimePicker").value("2016-08-10 09:00");
    $("#dlrCmpCommYn").prop("checked", true);


    $("#receiveTelNo").val("管理员二");
    $("#custNo").val("管理员二");
    $("#custNm").val("管理员二");
    $("#pconCustNm").val("管理员二");
    $("#pconCustNo").val("管理员二");
    $("#custPrefCommNo").val("管理员二");
    $("#hpNo").val("管理员二");
    $("#homeTelNo").val("管理员二");
    $("#officeTelNo").val("管理员二");
    $("#pconCustMjrTelNo").val("管理员二");
    $("#pconCustHpNo").val("管理员二");
    $("#pconCustHomeTelNo").val("管理员二");
    $("#pconCustOfficeTelNo").val("管理员二");
    $("#resvDt").data("kendoExtMaskedDateTimePicker").value("2016-08-10 09:00");
    $("#repairBookId").val("管理员二");

    $("#sendTelNo").val("管理员二");
    $("#pconRelCd").data("kendoExtDropDownList").value("01");
    $("#pprocDeptNm").val("管理员二");
    $("#pprocId").val("管理员二");
    $("#pprocNm").val("管理员二");
    $("#coopDeptNm").val("管理员二");
    $("#bizDeptNm").val("管理员二");
    $("#officeNm").val("管理员二");
    $("#sungNm").val("管理员二");
    $("#sungCd").data("kendoExtDropDownList").value("01");
    $("#cityNm").val("管理员二");
    $("#cityCd").data("kendoExtDropDownList").value("01");
    $("#custReqCont").val("管理员二");


    $("#vinNo").val("管理员二");
    $("#carRegNo").val("管理员二");
    $("#carlineNm").val("管理员二");
    $("#carlineCd").data("kendoExtDropDownList").value("01");
    $("#modelCd").data("kendoExtDropDownList").value("01");
    $("#modelNm").val("管理员二");
    $("#ocnNm").val("管理员二");
    $("#ocnCd").data("kendoExtDropDownList").value("01");
    $("#runDistVal").val("管理员二");
    $("#acptDeptNm").val("管理员二");
    $("#pacptId").val("管理员二");
    $("#pacptNm").val("管理员二");
    $("#acptDt").data("kendoExtMaskedDateTimePicker").value("2016-08-10 09:00");
    $("#manufacturer").val("管理员二");

    $("#pevalId").val("管理员二");
    $("#pevalNm").val("管理员二");
    $("#returnCauCont").val("管理员二");
    $("#pmoCauCd").data("kendoExtDropDownList").value("01");
    $("#realPprocId").val("管理员二");
    $("#realPprocNm").val("管理员二");
    $("#traceDt").data("kendoExtMaskedDateTimePicker").value("2016-08-10 09:00");

    $("#pprocTelNo").val("管理员二");
    $("#stsfIvstEmpId").val("管理员二");
    $("#stsfIvstEmpNm").val("管理员二");
    $("#mthAchvHm").val("管理员二");
    $("#evalAllocDt").data("kendoExtMaskedDateTimePicker").value("2016-08-10 09:00");
    $("#dataShipStatNm").val("管理");
    $("#pmoDt").data("kendoExtMaskedDateTimePicker").value("2016-08-10 09:00");
    $("#procDt").data("kendoExtMaskedDateTimePicker").value("2016-08-10 09:00");
    $("#pprocEmailNm").val("管理员二");
    $("#stsfIvstDt").data("kendoExtMaskedDateTimePicker").value("2016-08-10 09:00");
    $("#traceRsltCont").val("管理员二");

    $("#callCenOpnCont").val("管理员二");
    $("#revMthCont").val("管理员二");
    $("#procRsltCont").val("管理员二");
    $("#stsfIvstRsltCont").val("管理员二");
    $("#cmplStsfNm01").val("111");
    $("#cmplStsfNm02").val("111");
    $("#cmplReAcptYn").prop("checked", true);
    $("#cmplReAcptCnt").val("管理员二");
    $("#serReqNo").val("管理员二");
    $("#cmplDlDeptNm").val("管理员二");
    $("#cmplDlEmpId").val("管理员二");
    $("#cmplDlEmpNm").val("管理员二");

    $("#saleDt").data("kendoExtMaskedDateTimePicker").value("2016-08-10 09:00");
    $("#dstbNo").val("管理员二");

    $("#salesActiveSrcCd").data("kendoExtDropDownList").value("01");
    $("#relSalesActiveNo").val("管理员二");

    $("#parOrdYn").data("kendoExtDropDownList").value("Y");
    $("#parOrdDt").data("kendoExtMaskedDateTimePicker").value("2016-08-10 09:00");
    $("#parArrvDt").data("kendoExtMaskedDateTimePicker").value("2016-08-10 09:00");
    $("#itemCd").val("01");

};



console.log("1")
</script>

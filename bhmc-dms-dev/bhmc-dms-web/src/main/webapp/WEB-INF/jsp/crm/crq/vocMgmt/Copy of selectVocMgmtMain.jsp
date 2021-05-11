<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 기본정보 -->
    <section class="group">
        <div class="header_area">
        <h1 class="title_basic"><spring:message code="crm.menu.vocMng" /></h1><!-- VOC 요청조회 -->
            <div class="btn_right">
                <button id="btnViewAdd" class="btn_m btn_add"><spring:message code='global.btn.add' /><!-- 추가 --></button>
                <button id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
                <%-- <button type="button" class="btn_m btn_new" id="btnNew"><spring:message code="global.btn.new" /><!-- 신규 --></button> --%>
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
            </div>
        </div>

        <div class="table_form form_width_20per">
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

        <section id="vocMgmtPopup" class="pop_wrap">
        <div class="header_area">
        <h2 class="title_basic"><spring:message code="global.title.vocReqAccept" /></h2><!-- VOC 요청접수 -->
            <div class="btn_right">
                <button type="button" class="btn_s btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
            </div>
        </div>

        <form id="defaultInfoForm" name="defaultInfoForm" onsubmit="return false;">
            <div class="table_form form_width_100per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:13%;">
                        <col style="width:12%;">
                        <col style="width:13%;">
                        <col style="width:12%;">
                        <col style="width:13%;">
                        <col style="width:12%;">
                        <col style="width:13%;">
                        <col style="width:12%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.vocNo" /><!-- VOC 번호 --></th>
                            <td>
                                <input id="dlrCd" name="dlrCd" type="hidden">
                                <input id="pltCd" name="pltCd" type="hidden">
                                <input id="bhmcYn" name="bhmcYn" type="hidden">
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
                            <th scope="row"><spring:message code="global.lbl.statNm" /><!-- 상태 --></th>
                            <td>
                                <input id="vocStatCd" name="vocStatCd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.customer" /><!-- 고객 --></th>
                            <td>
                                <input id="custNo" name="custNo" type="hidden">
                                <div id="custSearch" class="form_search">
                                    <input type="text" id="custNm" name="custNm" class="form_input" maxlength="100" style="width:100%" />
                                    <a href="javascript:;"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.pconRelCd" /><!-- 고객 및 연계인 관계 --></th>
                            <td>
                                <input id="pconRelCd" name="pconRelCd" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.carRegNo" /><!-- 차 번호 --></th>
                            <td>
                                <input type="text" id="carRegNo" name="carRegNo" class="form_input ac" maxlength="20" style="width:100%" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.type" /></span> <!-- 유형 --></th>
                            <td class="required_area">
                                <input id="vocTpCd" name="vocTpCd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.pconCustInfo" /><!-- 문의자 --></th>
                            <td>
                                <input id="pconCustNo" name="pconCustNo" type="hidden">
                                <div id="pconCustSearch" class="form_search">
                                    <input type="text" id="pconCustNm" name="pconCustNm" class="form_input" maxlength="100" style="width:100%" />
                                    <a href="javascript:;"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="global.lbl.pprocDeptNm" /><!-- 처리부서 --></th>
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
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.tendCd" /></span> <!-- 성향 --></th>
                            <td class="required_area">
                                <input id="tendCd" name="tendCd" value="" class="form_comboBox" style="width:100%" />
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
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.vocTpSub1Cd" /></span> <!-- 1급 Sub 유형 --></th>
                            <td class="required_area">
                                <input id="vocTpSub1Cd" name="vocTpSub1Cd" value="" class="form_comboBox" style="width:100%" />
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
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.vocTpSub2Cd" /></span> <!-- 2급 Sub 유형 --></th>
                            <td class="required_area">
                                <input id="vocTpSub2Cd" name="vocTpSub2Cd" value="" class="form_comboBox" style="width:100%" />
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
                            <th scope="row"><spring:message code="global.lbl.vocTpSub3Cd" /><!-- 3급 유형 --></th>
                            <td>
                                <input id="vocTpSub3Cd" name="vocTpSub3Cd" value="" class="form_comboBox" style="width:100%" />
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
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.acptSrcCd" /></span> <!-- 접수경로 --></th>
                            <td class="required_area">
                                <input id="acptSrcCd" name="acptSrcCd" value="" class="form_comboBox" style="width:100%" />
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
                            <th scope="row"><spring:message code="global.lbl.activeGainPathCd" /><!-- 활동 취득 경로 --></th>
                            <td>
                                <input id="activeGainPathCd" name="activeGainPathCd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.pconCustHomeTelNo" /><!-- 문의자 집 전화번호 --></th>
                            <td>
                                <input type="text" id="pconCustHomeTelNo" name="pconCustHomeTelNo" class="form_input ac" data-type="tel" pattern="\d" maxlength="40" style="width:100%" />
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
                            <th id="crimTitTag" scope="row"><span class="bu_required"><spring:message code="global.lbl.cmplCauCd" /></span> <!-- 불만이유 --></th>
                            <td id="crimTag" class="required_area">
                                <input id="cmplCauCd" name="cmplCauCd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th id="a49Tag" colspan="2"></th>
                            <th scope="row"><spring:message code="global.lbl.pconCustOfficeTelNo" /><!-- 문의자 직장 전화번호 --></th>
                            <td>
                                <input type="text" id="pconCustOfficeTelNo" name="pconCustOfficeTelNo" class="form_input ac" data-type="tel" pattern="\d" maxlength="40" style="width:100%" />
                            </td>
                            <th colspan="2"></th>
                            <th scope="row"><spring:message code="global.lbl.manufacturer" /><!-- 제조사/특약점 --></th>
                            <td>
                                <input id="manufacturer" name="manufacturer" value="" class="form_input ac" maxlength="100" style="width:100%">
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
                            <th scope="row" rowspan="2"><spring:message code="global.lbl.custReqCont" /><!-- 고객 요구 --></th>
                            <td colspan="3" rowspan="2">
                                <textarea maxlength="1000" id="custReqCont" name="custReqCont" rows="2" cols="" class="form_textarea" style="height:41px;"></textarea>
                            </td>
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
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.vocEndDt" /><!-- Close 시간 --></th>
                            <td>
                                <input id="vocEndDt" name="vocEndDt" value="" class="form_datepicker ac" style="width:100%" />
                            </td>
                            <th colspan="2"></th>
                            <th id="cusReqTitTag" scope="row" rowspan="2"><spring:message code="global.lbl.custRescLocCont" /><!-- 고객 구조 위치 --></th>
                            <td id="cusReqTag" colspan="3" rowspan="2">
                                <textarea maxlength="1000" id="custRescLocCont" name="custRescLocCont" rows="2" cols="" class="form_textarea" style="height:41px;"></textarea>
                            </td>
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
                        <col style="width:13%;">
                        <col style="width:12%;">
                        <col style="width:13%;">
                        <col style="width:12%;">
                        <col style="width:13%;">
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
                            <td rowspan="2">
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
                                <input id="dataShipStatCd" name="dataShipStatCd" value="" class="form_comboBox" style="width:100%" />
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
                            <th id="a71TitTag" scope="row"><spring:message code="global.lbl.revMthCont" /><!-- 검토중인 방안 --></th>
                            <td id="a71Tag">
                                <textarea maxlength="2000" id="revMthCont" name="revMthCont" rows="1" cols="" class="form_textarea"  style="height:20px;"></textarea>
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
                            <th scope="row" rowspan="2"><spring:message code="global.lbl.procRsltCont" /><!-- 처리결과 --></th>
                            <td rowspan="2">
                                <textarea maxlength="2000" id="procRsltCont" name="procRsltCont" rows="2" cols="" class="form_textarea"  style="height:41px;"></textarea>
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
                            <th scope="row" rowspan="2"><spring:message code="global.lbl.stsfIvstRsltCont" /><!-- 만족도 조사결과 --></th>
                            <td rowspan="2">
                                <textarea maxlength="2000" id="stsfIvstRsltCont" name="stsfIvstRsltCont" rows="2" cols=""  class="form_textarea"  style="height:41px;"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th id="a85TitTag" scope="row"><spring:message code="global.lbl.mthAchvHm" /><!-- 방안 달성시간 --></th>
                            <td id="a85Tag">
                                <input type="number" id="mthAchvHm" name="mthAchvHm" value="" class="form_input ac" maxlength="10" style="width:100%">
                            </td>
                            <th></th>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div id="addInfoTitle" class="header_area">
            <h2 class="title_basic"><spring:message code="global.title.addInfo" /></h2><!-- 추가정보 -->
            </div>

            <div id="addInfo" class="table_form form_width_100per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.cmplStsfCd" /><!-- 불만 만족도 --></th>
                            <td>
                                <input id="cmplStsfCd" name="cmplStsfCd" value="" class="form_comboBox" style="width:100%" />
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
                        <tr>
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
                                <input id="saleDt" name="saleDt" value="" class="form_datepicker ac" style="width:100%">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.dstbNo" /><!-- 물류번호 --></th>
                            <td>
                                <input id="dstbNo" name="dstbNo" value="" class="form_input ac" maxlength="20" style="width:100%">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div id="itemInfoTitle" class="header_area">
            <h2 class="title_basic"><spring:message code="ser.title.itemInfo" /></h2><!-- 부품정보 -->
            </div>

            <div id="itemInfo" class="table_form form_width_100per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
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
                <button type="button" class="btn_s btn_add"  id="btnAdd"><spring:message code="global.btn.rowAdd" /></button><!-- 추가 -->
            </div>
        </div>

        <div class="table_grid">
            <div id="activeGrid"></div>
        </div>
        </section>

    </section>
    <!-- //기본정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">




    /*****************************************************************************
    ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
    *******************************************************************************/
    // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
    $("#vocGrid").on("dblclick", "tr.k-state-selected", function (e) {

        var gridId = e.delegateTarget.id
          , grid = $("#"+gridId+"").data("kendoExtGrid")
          , selectedItem = grid.dataItem(grid.select())
        ;

        if ( dms.string.isNotEmpty(selectedItem) ){

            // 팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
            viewDetail(selectedItem);

        } else {

            // 선택해주세요.
            dms.notification.success("<spring:message code='crm.info.chkSelectItemMsg' />");
            return;
        }



    });

    // 팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
    function viewDetail(selectedItem){

        mode = "N";
        resetDefualtForm();

        console.log("selectedItem:",selectedItem)
        // 상세 조회

            if ( dms.string.isNotEmpty(selectedItem) ) {

                mode = "U";

                $("#dlrCd").val(selectedItem.dlrCd);                                                         //딜러코드
                $("#pltCd").val(selectedItem.pltCd);                                                         //사업장코드
                $("#vocNo").val(selectedItem.vocNo);                                                         //VOC번호
                $("#vocTpCd").data("kendoExtDropDownList").value(selectedItem.vocTpCd);                         //VOC유형코드
                $("#vocStatCd").data("kendoExtDropDownList").enable(true);
                onSelectVocStatCdSet(selectedItem.vocTpCd);
                $("#vocStatCd").data("kendoExtDropDownList").value(selectedItem.vocStatCd);                     //VOC상태코드
                $("#tendCd").data("kendoExtDropDownList").value(selectedItem.tendCd);                           //성향코드
                $("#vocTpSub1Cd").data("kendoExtDropDownList").value(selectedItem.vocTpSub1Cd);                 //VOC유형하위1코드
                $("#vocTpSub2Cd").data("kendoExtDropDownList").value(selectedItem.vocTpSub2Cd);                 //VOC유형하위2코드
                $("#vocTpSub3Cd").data("kendoExtDropDownList").value(selectedItem.vocTpSub3Cd);                 //VOC유형하위3코드
                $("#acptSrcCd").data("kendoExtDropDownList").value(selectedItem.acptSrcCd);                     //접수출처코드
                $("#activeGainPathCd").data("kendoExtDropDownList").value(selectedItem.activeGainPathCd);       //활동획득경로코드
                $("#cmplCauCd").data("kendoExtDropDownList").value(selectedItem.cmplCauCd);                     //불만원인코드
                $("#prorCd").data("kendoExtDropDownList").value(selectedItem.prorCd);                           //우선순위코드
                $("#procLmtCd").data("kendoExtDropDownList").value(selectedItem.procLmtCd);                     //처리시한코드
//                $("#emgcCallCd").data("kendoExtDropDownList").value(selectedItem.emgcCallCd);                   //긴급콜코드
//                $("#emgcRescStartYn").data("kendoExtDropDownList").value(selectedItem.emgcRescStartYn);         //긴급구조시작여부
//                $("#cauCd").data("kendoExtDropDownList").value(selectedItem.cauCd);                             //원인코드
//                $("#emgcRescStsfCd").data("kendoExtDropDownList").value(selectedItem.emgcRescStsfCd);           //긴급구조만족도코드
                $("#vocEndDt").data("kendoExtMaskedDatePicker").value(selectedItem.vocEndDt);                //VOC종료일자
                $("#receiveTelNo").val(selectedItem.receiveTelNo);                                           //수신전화번호
                $("#custNm").val(selectedItem.custNm);                                                       //고객명
                $("#custNo").val(selectedItem.custNo);                                                       //고객번호
                $("#custPrefCommNo").val(selectedItem.custPrefCommNo);                                       //고객선호연락번호
                $("#hpNo").val(selectedItem.hpNo);                                                           //휴대폰번호
                $("#homeTelNo").val(selectedItem.homeTelNo);                                                 //집전화번호
                $("#officeTelNo").val(selectedItem.officeTelNo);                                             //직장전화번호
                $("#pconCustNm").val(selectedItem.pconCustNm);                                               //연계인고객명
                $("#pconCustNo").val(selectedItem.pconCustNo);                                               //연계인고객번호
                $("#pconCustMjrTelNo").val(selectedItem.pconCustMjrTelNo);                                   //연계인고객주요전화번호
                $("#pconCustHpNo").val(selectedItem.pconCustHpNo);                                           //연계인고객휴대폰번호
                $("#pconCustHomeTelNo").val(selectedItem.pconCustHomeTelNo);                                 //연계인고객집전화번호
                $("#pconCustOfficeTelNo").val(selectedItem.pconCustOfficeTelNo);                             //연계인고객직장전화번호
                $("#resvDt").data("kendoExtMaskedDatePicker").value(selectedItem.resvDt);                    //예약일자
                $("#sendTelNo").val(selectedItem.sendTelNo);                                                 //발신전화번호
                $("#pconRelCd").data("kendoExtDropDownList").value(selectedItem.pconRelCd);                     //연계인관계코드
                $("#pprocId").val(selectedItem.pprocId);                                                     //처리인ID
                $("#pprocNm").val(selectedItem.pprocNm);                                                     //처리인명
                $("#coopDeptNm").val(selectedItem.coopDeptNm);                                               //협조부서명
                $("#bizDeptNm").val(selectedItem.bizDeptNm);                                                 //사업부서명
                $("#officeNm").val(selectedItem.officeNm);                                                   //사무소명
                $("#sungCd").data("kendoExtDropDownList").value(selectedItem.sungCd);                           //성코드
                $("#sungNm").val(selectedItem.sungNm);                                                       //성명
                $("#cityCd").data("kendoExtDropDownList").enable(true);
                onSelectSungCdSet(selectedItem.sungCd);
                $("#cityCd").data("kendoExtDropDownList").value(selectedItem.cityCd);                           //도시코드
                $("#cityNm").val(selectedItem.cityNm);                                                       //도시명
                $("#vinNo").val(selectedItem.vinNo);                                                         //차대번호
                $("#carRegNo").val(selectedItem.carRegNo);                                                   //차량등록번호
                $("#carlineCd").data("kendoExtDropDownList").value(selectedItem.carlineCd);                     //차종코드
                if(selectedItem.carlineCd != null){
                    $("#modelCd").data("kendoExtDropDownList").enable(true);
                    onSelectCarlineCdSet(selectedItem.carlineCd);
                }
                $("#carlineNm").val(selectedItem.carlineNm);                                                 //차종명
                $("#modelCd").data("kendoExtDropDownList").value(selectedItem.modelCd);                         //모델코드
                if(selectedItem.modelCd != null){
                    $("#ocnCd").data("kendoExtDropDownList").enable(true);
                    onSelectModelCdSet(selectedItem.modelCd);
                }
                $("#modelNm").val(selectedItem.modelNm);                                                     //모델명
                $("#ocnCd").data("kendoExtDropDownList").value(selectedItem.ocnCd);                             //OCN코드
                $("#ocnNm").val(selectedItem.ocnNm);                                                         //OCN명
                $("#runDistVal").val(selectedItem.runDistVal);                                               //주행거리값
                $("#acptDeptNm").val(selectedItem.acptDeptNm);                                               //접수부서
                $("#pacptId").val(selectedItem.pacptId);                                                     //접수자ID
                $("#pacptNm").val(selectedItem.pacptNm);                                                     //접수자명
                $("#acptDt").data("kendoExtMaskedDatePicker").value(selectedItem.acptDt);                    //접수일자
                $("#custReqCont").val(selectedItem.custReqCont);                                             //고객요청내용
                $("#custRescLocCont").val(selectedItem.custRescLocCont);                                     //고객구조위치내용
                $("#pevalId").val(selectedItem.pevalId);                                                     //심사인ID
                $("#pevalNm").val(selectedItem.pevalNm);                                                     //심사인명
                $("#evalAllocDt").data("kendoExtMaskedDatePicker").value(selectedItem.evalAllocDt);          //심사배정일자
                $("#callCenOpnCont").val(selectedItem.callCenOpnCont);                                       //콜센터의견내용
                $("#returnCauCont").val(selectedItem.returnCauCont);                                         //반송원인내용
                $("#pmoCauCd").data("kendoExtDropDownList").value(selectedItem.pmoCauCd);                       //승급원인코드
                $("#pmoDt").data("kendoExtMaskedDatePicker").value(selectedItem.pmoDt);                      //승급일자
                $("#revMthCont").val(selectedItem.revMthCont);                                               //검토방안내용
                $("#realPprocId").val(selectedItem.realPprocId);                                             //실처리인ID
                $("#realPprocNm").val(selectedItem.realPprocNm);                                             //실처리인명
                $("#procDt").data("kendoExtMaskedDatePicker").value(selectedItem.procDt);                    //처리일자
                $("#pprocTelNo").val(selectedItem.pprocTelNo);                                               //처리인전화번호
                $("#pprocEmailNm").val(selectedItem.pprocEmailNm);                                           //처리인이메일명
                $("#procRsltCont").val(selectedItem.procRsltCont);                                           //처리결과내용
                $("#stsfIvstEmpId").val(selectedItem.stsfIvstEmpId);                                         //만족도조사인ID
                $("#stsfIvstEmpNm").val(selectedItem.stsfIvstEmpNm);                                         //만족도조사인명
                $("#stsfIvstDt").data("kendoExtMaskedDatePicker").value(selectedItem.stsfIvstDt);            //만족도조사일자
                $("#stsfIvstRsltCont").val(selectedItem.stsfIvstRsltCont);                                   //만족도조사결과내용
                $("#mthAchvHm").val(selectedItem.mthAchvHm);                                                 //방안달성시간
                $("#cmplStsfCd").data("kendoExtDropDownList").value(selectedItem.cmplStsfCd);                   //불만만족도코드
                var cmplReAcptYn = selectedItem.cmplReAcptYn;
                if (cmplReAcptYn == 'Y'){ $("#cmplReAcptYn").prop("checked", true) };                        //불만재접수여부
//                $("#cmplReAcptYn").val(selectedItem.cmplReAcptYn);                                           //불만재접수여부
                $("#cmplReAcptCnt").val(selectedItem.cmplReAcptCnt);                                         //불만재접수횟수
                $("#serReqNo").val(selectedItem.serReqNo);                                                   //서비스요청번호
                $("#cmplDlDeptNm").val(selectedItem.cmplDlDeptNm);                                           //불만전달부서명
                $("#cmplDlEmpId").val(selectedItem.cmplDlEmpId);                                             //불만전달자ID
                $("#cmplDlEmpNm").val(selectedItem.cmplDlEmpNm);                                             //불만전달자명
                $("#saleDt").data("kendoExtMaskedDatePicker").value(selectedItem.saleDt);                    //판매일자
                $("#dstbNo").val(selectedItem.dstbNo);                                                       //물류번호
                $("#parOrdYn").data("kendoExtDropDownList").value(selectedItem.parOrdYn);                       //부품오더여부
                $("#parOrdDt").data("kendoExtMaskedDatePicker").value(selectedItem.parOrdDt);                //부품오더일자
                $("#parArrvDt").data("kendoExtMaskedDatePicker").value(selectedItem.parArrvDt);              //부품도착일자
                $("#itemCd").val(selectedItem.itemCd);                                                       //품목코드
                $("#pprocDeptNm").val(selectedItem.pprocDeptNm);                                             //처리부서명
                $("#bhmcYn").val(selectedItem.bhmcYn);                                                       //BHMC여부
                $("#repairBookId").val(selectedItem.repairBookId);                                           //정비예약ID
                $("#manufacturer").val(selectedItem.manufacturer);                                           //제조사/특약점
                $("#dataShipStatCd").data("kendoExtDropDownList").value(selectedItem.dataShipStatCd);           //자료배송상태

                changeComboList(selectedItem.vocTpCd);

                // 활동목록 그리드 조회
                var grid = $("#activeGrid").data("kendoExtGrid");
                grid.dataSource.page(1);

            } else {
                mode = "N";
            }


        // 팝업 오픈
        var vocMgmtPopup = $("#vocMgmtPopup").data("kendoWindow");
        vocMgmtPopup.center();
        vocMgmtPopup.open();


    };
    /*****************************************************************************
    ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
    *******************************************************************************/


    var popupWindow;

    var crm601List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //VOC 불만의 원인
    var crm602List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //VOC 접수출처
    var crm603List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //VOC 심각성
    var crm604List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //VOC 유형
    var crm605List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //1급 SUB 유형
    var crm606List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //2급 Sub 유형
    var crm607List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //3급 Sub 유형
    var crm608List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //VOC 성향
    var crm615List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //활동 획득 경로 코드
    var crm616List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //처리시한 코드
    var crm617List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //긴급 전화 첫 연결 코드
    var crm618List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //원인 코드
    var crm619List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //긴급구조 만족도 코드
    var crm620List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //승급 원인 코드
    var crm621List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //불만 만족도 코드
    var crm622List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //자료배송상태
    var com020List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //여부
    var crm030List = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //고객 및 연계인 관계

    var statList        = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //활동상태
    var activeTpList    = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //활동유형
    var activeSubTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //활동SUB유형
    var activeList      = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //활동코드


    <c:forEach var="obj" items="${crm601List}">
        crm601List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${crm602List}">
        crm602List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${crm603List}">
        crm603List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${crm604List}">
        crm604List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${crm605List}">
        crm605List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${crm606List}">
        crm606List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${crm607List}">
        crm607List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${crm608List}">
        crm608List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${crm615List}">
        crm615List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${crm616List}">
        crm616List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${crm617List}">
        crm617List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${crm618List}">
        crm618List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${crm619List}">
        crm619List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${crm620List}">
        crm620List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${crm621List}">
        crm621List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${crm622List}">
        crm622List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${com020List}">
        com020List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${crm030List}">
        crm030List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //활동상태코드 Array
    <c:forEach var="obj" items="${statList}">
        statList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //활동상태코드 Map
    var statMap = [];
    $.each(statList, function(idx, obj){
        statMap[obj.cmmCd] = obj.cmmCdNm;
    });

    //활동유형코드 Array
    <c:forEach var="obj" items="${activeTpList}">
        activeTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //활동유형코드 Map
    var activeTpMap = [];
    $.each(activeTpList, function(idx, obj){
        activeTpMap[obj.cmmCd] = obj.cmmCdNm;
    });

    //활동SUB유형코드 Array
    <c:forEach var="obj" items="${activeSubTpList}">
        activeSubTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //활동SUB유형코드 Map
    var activeSubTpMap = [];
    $.each(activeSubTpList, function(idx, obj){
        activeSubTpMap[obj.cmmCd] = obj.cmmCdNm;
    });

    //활동코드 Array
    <c:forEach var="obj" items="${activeList}">
        activeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    //활동코드 Map
    var activeMap = [];
    $.each(activeList, function(idx, obj){
        activeMap[obj.cmmCd] = obj.cmmCdNm;
    });


    // 차종
    var carlineList = [];
    <c:forEach var="obj" items="${carLineCdInfo}">
        carlineList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
    </c:forEach>

    /**
     * 차종에 따른 모델 조회(값 셋팅시에만 사용)
     */
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

    /**
     * 유형에 따른 상태 조회(값 셋팅시에만 사용함)
     */
     function onSelectVocStatCdSet(value) {

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

         $("#vocStatCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

     };

     // 성코드
     var sungCdList = [];
     <c:forEach var="obj" items="${sungCdInfo}">
         sungCdList.push({sungNm:"${obj.sungNm}", sungCd:"${obj.sungCd}"});
     </c:forEach>

     /**
      * 성코드에 따른 도시코드 조회(값 셋팅시에만 사용)
      */
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

    function callBackFunc(){
        //var customerForm = $("#tabFormIframe").contents().find("#customerForm").html();
        //$("#tabstrip-1", parent.document).html(customerForm);
        //$("#tabFormIframe").contents().find("#customerForm").html();
    }

    var mode = "N";

    function resetDefualtForm(){
        onSelectVocStatCdSet("");
        changeComboList("");

        $("#dlrCd").val("");
        $("#pltCd").val("");
        $("#vocNo").val("");
        $("#receiveTelNo").val("");
        $("#sendTelNo").val("");
        $("#vinNo").val("");
//        $("#vocStatCd").data("kendoExtDropDownList").select(0);

        $("#vocStatCd").data("kendoExtDropDownList").setDataSource([]);
        $("#vocStatCd").data("kendoExtDropDownList").enable(false);

        $("#custNo").val("");
        $("#custNm").val("");
        $("#pconRelCd").data("kendoExtDropDownList").select(0);
        $("#carRegNo").val("");
        $("#vocTpCd").data("kendoExtDropDownList").select(0);
        $("#pconCustNo").val("");
        $("#pconCustNm").val("");
        $("#pprocId").val("");
        $("#pprocNm").val("");
        $("#carlineNm").val("");
        $("#carlineCd").data("kendoExtDropDownList").select(0);
        $("#tendCd").data("kendoExtDropDownList").select(0);
        $("#custPrefCommNo").val("");
        $("#coopDeptNm").val("");
        $("#modelNm").val("");
//        $("#modelCd").data("kendoExtDropDownList").select(0);

        $("#modelCd").data("kendoExtDropDownList").setDataSource([]);
        $("#modelCd").data("kendoExtDropDownList").enable(false);

        $("#vocTpSub1Cd").data("kendoExtDropDownList").select(0);
        $("#hpNo").val("");
        $("#bizDeptNm").val("");
        $("#ocnNm").val("");
//        $("#ocnCd").data("kendoExtDropDownList").select(0);

        $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
        $("#ocnCd").data("kendoExtDropDownList").enable(false);

        $("#vocTpSub2Cd").data("kendoExtDropDownList").select(0);
        $("#homeTelNo").val("");
        $("#officeNm").val("");
        $("#runDistVal").val("");
        $("#vocTpSub3Cd").data("kendoExtDropDownList").select(0);
        $("#officeTelNo").val("");
        $("#sungCd").data("kendoExtDropDownList").select(0);
        $("#sungNm").val("");
        $("#acptDeptNm").val("");
        $("#acptSrcCd").data("kendoExtDropDownList").select(0);
        $("#pconCustMjrTelNo").val("");
//        $("#cityCd").data("kendoExtDropDownList").select(0);

        $("#cityCd").data("kendoExtDropDownList").setDataSource([]);
        $("#cityCd").data("kendoExtDropDownList").enable(false);

        $("#cityNm").val("");
        $("#pacptId").val("");
        $("#pacptNm").val("");
        $("#activeGainPathCd").data("kendoExtDropDownList").select(0);
        $("#pconCustHomeTelNo").val("");
        $("#acptDt").val("");
        $("#prorCd").data("kendoExtDropDownList").select(0);
        $("#pconCustOfficeTelNo").val("");
        $("#custReqCont").val("");
//        $("#emgcCallCd").data("kendoExtDropDownList").select(0);
        $("#cmplCauCd").data("kendoExtDropDownList").select(0);
        $("#resvDt").val("");
//        $("#emgcRescStartYn").data("kendoExtDropDownList").select(0);
        $("#procLmtCd").data("kendoExtDropDownList").select(0);
//        $("#cauCd").data("kendoExtDropDownList").select(0);
        $("#custRescLocCont").val("");
//        $("#emgcRescStsfCd").data("kendoExtDropDownList").select(0);
        $("#vocEndDt").val("");
        $("#repairBookId").val("");
        $("#manufacturer").val("");
        $("#dataShipStatCd").data("kendoExtDropDownList").select(0);

        $("#pevalId").val("");
        $("#pevalNm").val("");
        $("#evalAllocDt").val("");
        $("#callCenOpnCont").val("");
        $("#returnCauCont").val("");
        $("#pmoCauCd").data("kendoExtDropDownList").select(0);
        $("#pmoDt").val("");
        $("#revMthCont").val("");
        $("#realPprocId").val("");
        $("#realPprocNm").val("");
        $("#procDt").val("");
        $("#procRsltCont").val("");
        $("#pprocTelNo").val("");
        $("#pprocEmailNm").val("");
        $("#stsfIvstEmpId").val("");
        $("#stsfIvstEmpNm").val("");
        $("#stsfIvstDt").val("");
        $("#stsfIvstRsltCont").val("");
        $("#mthAchvHm").val("");

        $("#cmplStsfCd").data("kendoExtDropDownList").select(0);
        $("#cmplReAcptYn").prop("checked", false);
        $("#cmplReAcptCnt").val("");
        $("#serReqNo").val("");
        $("#cmplDlDeptNm").val("");
        $("#cmplDlEmpId").val("");
        $("#cmplDlEmpNm").val("");
        $("#saleDt").val("");
        $("#dstbNo").val("");

        $("#parOrdYn").data("kendoExtDropDownList").select(0);
        $("#parOrdDt").val("");
        $("#parArrvDt").val("");
        $("#itemCd").val("");
        $("#pprocDeptNm").val("");

        // 활동목록 그리드 조회
        var grid = $("#activeGrid").data("kendoExtGrid");
        grid.dataSource.page(1);
    }

$(document).ready(function() {



    // ************************** 그리드 팝업 호출 / 팝업 설정 ****************************
    $("#vocMgmtPopup").kendoWindow({
        animation:false
        ,draggable:false
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code="crm.menu.vocMng" />"      // <!-- VOC 요청조회 -->
        ,width:"950px"
        ,height:"500px"
    }).data("kendoWindow");
    // ************************** 그리드 팝업 호출 / 팝업 설정 ****************************


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
    $("#sRegStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 종료일
    $("#sRegEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 접수시간(입력부)
    $("#acptDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 예약시간(입력부)
    $("#resvDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // Close 시간(입력부)
    $("#vocEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 심사 배정시간(입력부)
    $("#evalAllocDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 승급시간(입력부)
    $("#pmoDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 처리일자(입력부)
    $("#procDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 만족도 조사시간(입력부)
    $("#stsfIvstDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 판매시간(입력부)
    $("#saleDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 오더시간(입력부)
    $("#parOrdDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 도착시간(입력부)
    $("#parArrvDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    if($("#vocNo").val() == ""){
        changeComboList("");
    }


    //유형(조회부).   crm604List
    $("#sVocTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:crm604List
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
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    });

    $("#sVocStatCd").data("kendoExtDropDownList").enable(false);

    //불만이유(조회부).   crm601List
    $("#sCmplCauCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:crm601List
    });


    //유형(입력부).   crm604List
    $("#vocTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:crm604List
        , select:function(e){
            var dataItem = this.dataItem(e.item);
            changeComboList(dataItem.cmmCd);
            onSelectVocStatCdSet(dataItem.cmmCd);
        }
    });

    //상태(입력부).
    $("#vocStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "  // 전체
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    });

    $("#vocStatCd").data("kendoExtDropDownList").enable(false);

    //고객 및 연계인 관계(입력부).   crm030List
    $("#pconRelCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:crm030List
    });

    //성향(입력부).   crm608List
    $("#tendCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:crm608List
    });

    //1급 Sub 유형(입력부).   crm605List
    $("#vocTpSub1Cd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:crm605List
    });

    //2급 Sub 유형(입력부).   crm606List
    $("#vocTpSub2Cd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:crm606List
    });

    //3급 유형(입력부).   crm607List
    $("#vocTpSub3Cd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:crm607List
    });

    //접수경로(입력부).   crm602List
    $("#acptSrcCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:crm602List
    });

    //활동 알게 되는 경로(입력부).   crm615List
    $("#activeGainPathCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:crm615List
    });

    //중요성(입력부).   crm603List
    $("#prorCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:crm603List
    });
/*
    //긴급 전화 첫 연결(입력부).   crm617List
    $("#emgcCallCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:crm617List
    });

    //긴급 구조 출발 여부(입력부).
    $("#emgcRescStartYn").kendoExtDropDownList({
        dataSource:['Y','N']
        ,autoBind:false
        ,index:0
    });

    //원인(입력부).   crm618List
    $("#cauCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:crm618List
    });

    //긴급 구조 만족도(입력부).   crm619List
    $("#emgcRescStsfCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:crm619List
    });
*/
    //승급원인(입력부).   crm620List
    $("#pmoCauCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:crm620List
    });

    //불만만족도(입력부).   crm621List
    $("#cmplStsfCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:crm621List
    });

    //불만이유(입력부).   crm601List
    $("#cmplCauCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:crm601List
    });

    //처리시한(입력부).   crm616List
    $("#procLmtCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:crm616List
    });

    //부품오더여부(입력부).   com020List
    $("#parOrdYn").kendoExtDropDownList({
        dataSource:['Y','N']
        ,autoBind:false
        ,index:0
    });

    //자료배송상태(입력부).   crm622List
    $("#dataShipStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:crm622List
    });

    //성코드(입력부).   crm604List
    $("#sungCd").kendoExtDropDownList({
        dataTextField:"sungNm"
        , dataValueField:"sungCd"
        , optionLabel:" "  // 전체
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        , dataSource:sungCdList
        , select:function(e){
            var dataItem = this.dataItem(e.item);
            onSelectSungCdSet(dataItem.sungCd);
        }
    });

    //도시코드(입력부).
    $("#cityCd").kendoExtDropDownList({
        dataTextField:"cityNm"
        , dataValueField:"cityCd"
        , optionLabel:" "  // 전체
    //    , optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    });

    $("#cityCd").data("kendoExtDropDownList").enable(false);

    /**
     * 차종 콤보박스
     */
     $("#carlineCd").kendoExtDropDownList({
         dataTextField:"carlineNm"
        ,dataValueField:"carlineCd"
        ,dataSource:carlineList
        ,select:onSelectCarlineCd
        ,optionLabel:" "  // 전체
//        ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
     });
     /**
      * 모델 콤보박스
      */
     $("#modelCd").kendoExtDropDownList({
         dataTextField:"modelNm"
         ,dataValueField:"modelCd"
         ,select:onSelectModelCd
         ,optionLabel:" "  // 전체
//         ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
     });

     $("#modelCd").data("kendoExtDropDownList").enable(false);

      /**
       * OCN 콤보박스
       */
     $("#ocnCd").kendoExtDropDownList({
         dataTextField:"ocnNm"
         ,dataValueField:"ocnCd"
         ,optionLabel:" "  // 전체
//         ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
     });

     $("#ocnCd").data("kendoExtDropDownList").enable(false);

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



/*************************************************************
 * 이벤트 정의
 *************************************************************/
     //고객조회
     $("#custSearch").click(function(){
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
         })
     });

     //문의인 조회
     $("#pconCustSearch").click(function(){
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
         })
     });

     //처리인 조회
     $("#pprocSearch").click(function(){

         userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                , data:{
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
     });

     //접수자 조회
     $("#pacptSearch").click(function(){

         userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
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
     });

     //심사인 조회
     $("#pevalSearch").click(function(){

         userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                , data:{
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
     });

     //실처리인 조회
     $("#realPprocSearch").click(function(){

         userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                , data:{
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
     });

     //만족도조사인 조회
     $("#stsfIvstEmpSearch").click(function(){

         userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                , data:{
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
     });

     //불만전달자 조회
     $("#cmplDlEmpSearch").click(function(){

         userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                , data:{
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
     });




     //조회버튼
     $("#btnSearch").kendoButton({
         click:function(e) {

             var grid = $("#vocGrid").data("kendoExtGrid");
             grid.dataSource.page(1);

//             var venderDs = grid.dataSource;
//             $("#vocCnt").val(venderDs.at(0).vocCnt);

             mode = "N";
             resetDefualtForm();
         }
     });



     // 추가
     $("#btnViewAdd").kendoButton({
         click:function(e){

             // 팝업오픈
             viewDetail();

         }
     })

     // 상세정보
     $("#btnViewDetail").kendoButton({
         click:function(e){

             var grid = $("#vocGrid").data("kendoExtGrid");
             var selectedItem = grid.dataItem(grid.select());
             if ( dms.string.isNotEmpty(selectedItem) ){

                 viewDetail(selectedItem);

             } else {

                 // 선택해주세요.
                 dms.notification.success("<spring:message code='crm.info.chkSelectItemMsg' />");
                 return;
             }

         }
         , enable:false
     })


      // 신규 - vocGrid
      $("#btnNew").kendoButton({
          click:function(e) {
              mode = "N";
              resetDefualtForm();
          }
          , enable:true
      });

      //버튼 - 저장 - vocGrid
      $("#btnSave").kendoButton({
         click:function(e){

             // 화면 필수 체크
             if ( dms.string.isEmpty($("#vocTpCd").val())){
                 dms.notification.warning("<spring:message code='global.lbl.type' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#vocTpCd").focus();
                 return false;
             }

             if ( dms.string.isEmpty($("#tendCd").val())){
                 dms.notification.warning("<spring:message code='global.lbl.tendCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#tendCd").focus();
                 return false;
             }

             if ( dms.string.isEmpty($("#vocTpSub1Cd").val())){
                 dms.notification.warning("<spring:message code='global.lbl.vocTpSub1Cd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#vocTpSub1Cd").focus();
                 return false;
             }

             if ( dms.string.isEmpty($("#vocTpSub2Cd").val())){
                 dms.notification.warning("<spring:message code='global.lbl.vocTpSub2Cd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#vocTpSub2Cd").focus();
                 return false;
             }

             if ( dms.string.isEmpty($("#acptSrcCd").val())){
                 dms.notification.warning("<spring:message code='global.lbl.acptSrcCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#acptSrcCd").focus();
                 return false;
             }

             if ( dms.string.isEmpty($("#acptDt").val())){
                 dms.notification.warning("<spring:message code='global.lbl.acptDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#acptDt").focus();
                 return false;
             }

             if ( dms.string.isEmpty($("#prorCd").val())){
                 dms.notification.warning("<spring:message code='global.lbl.prorCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                 $("#prorCd").focus();
                 return false;
             }

             if($("#vocTpCd").val() == "02"){
                 if ( dms.string.isEmpty($("#cmplCauCd").val())){
                     dms.notification.warning("<spring:message code='global.lbl.cmplCauCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                     $("#cmplCauCd").focus();
                     return false;
                 }
             }

             $("#vocNo").prop("disabled", false);

             var json = $("#defaultInfoForm").serializeObject();

             if ($("#cmplReAcptYn").prop("checked")){
                 json.cmplReAcptYn = "Y"
             }else{
                 json.cmplReAcptYn = "N"
             };

             json.vocEndDt = $("#vocEndDt").data("kendoExtMaskedDatePicker").value();
             json.resvDt = $("#resvDt").data("kendoExtMaskedDatePicker").value();
             json.acptDt = $("#acptDt").data("kendoExtMaskedDatePicker").value();
             json.evalAllocDt = $("#evalAllocDt").data("kendoExtMaskedDatePicker").value();
             json.pmoDt = $("#pmoDt").data("kendoExtMaskedDatePicker").value();
             json.procDt = $("#procDt").data("kendoExtMaskedDatePicker").value();
             json.stsfIvstDt = $("#stsfIvstDt").data("kendoExtMaskedDatePicker").value();
             json.saleDt = $("#saleDt").data("kendoExtMaskedDatePicker").value();
             json.parOrdDt = $("#parOrdDt").data("kendoExtMaskedDatePicker").value();
             json.parArrvDt = $("#parArrvDt").data("kendoExtMaskedDatePicker").value();

             console.log("defaultInfoForm"+JSON.stringify(json));

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
                 ,error:function(jqXHR,status,error) {
                     dms.notification.error(jqXHR.responseJSON.errors);
                 }
                 ,success:function(data) {
                     dms.notification.success("<spring:message code='global.info.success'/>");
                     $("#vocGrid").data("kendoExtGrid").dataSource.read();
                     mode = "N";
                     resetDefualtForm();
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
              if(selectedItem!=null) {
                  var dlrCd = selectedItem.dlrCd;
                  var pltCd = selectedItem.pltCd;
                  var vocNo = selectedItem.vocNo;
                  if(vocNo!="") {
                      $('#activeGrid').data('kendoExtGrid').dataSource.insert(0, {
                           "dlrCd":dlrCd
                          ,"pltCd":pltCd
                          ,"vocNo":vocNo
                          ,"activeStatCd":""
                          ,"activeTpCd":""
                          ,"activeTpSubCd":""
                          ,"activeCd":""
                          ,"custNm":""
                          ,"pconCustNm":""
                      });
                  }
              } else {
                  //VOC 목록을 먼저 선택해 주십시오.
                  dms.notification.info("<spring:message code='global.info.required.selectVoc'/>");
              }
          }
      });

      //버튼 - 저장
      $("#btnActiveSave").kendoButton({
          click:function(e) {

              var grid = $('#vocGrid').data('kendoExtGrid');
              var selectedItem = grid.dataItem(grid.select());
              if(selectedItem!=null) {
                  var gridActive = $("#activeGrid").data("kendoExtGrid");
                  var saveData = gridActive.getCUDData("insertList", "updateList", "deleteList");
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
      });

/*************************************************************
 * DataSource 영역
 *************************************************************/

/*************************************************************
 * 그리드 셋팅
 *************************************************************/
       //그리드 설정(VOC 마스터)
       $("#vocGrid").kendoExtGrid({
           gridId:"G-CRM-0721-112801"
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
                               , custRescLocCont    :{type:"string", editable:false} //고객구조위치내용
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
                               , cmplStsfCd         :{type:"string", editable:false} //불만만족도코드
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
                               , pltCd              :{type:"string"}
                           }
                       }
               }
               ,requestEnd:function(e){
                   if (e.type !== "read"){
                       //this.page(1);
                   }
               }
           }
           ,change:function(e){

               var selectedItem = this.dataItem(this.select());

               if ( dms.string.isNotEmpty(selectedItem) ) {
                   $("#btnViewDetail").data("kendoButton").enable(true);
               }

           }
           ,columns:[
                       {field:"vocNo"              , title:"<spring:message code='global.lbl.vocNo' />"               , attributes:{"class":"ac"}, width:100}    //VOC번호
                       ,{field:"bhmcVocNo"          , title:"<spring:message code='global.lbl.BhmcVocNo' />"           , attributes:{"class":"ac"}, width:100}    //BHMCVOC번호
                       ,{field:"custNm"             , title:"<spring:message code='global.lbl.custNm' />"                , attributes:{"class":"ac"}, width:100}    //고객명
                       ,{field:"custPrefCommNo"     , title:"<spring:message code='global.lbl.telNumer' />"                , attributes:{"class":"ac"}, width:100}    //고객선호연락번호
                       ,{field:"vocTpCd"            , title:"<spring:message code='global.lbl.vocTpCd' />"               , hidden:true}                                 //VOC유형코드
                       ,{field:"vocTpNm"            , title:"<spring:message code='global.lbl.vocTpCd' />"               , attributes:{"class":"ac"}, width:100}    //VOC유형코드명
                       ,{field:"vocStatCd"          , title:"<spring:message code='global.lbl.vocStatCd' />"              , hidden:true}                                 //VOC상태코드
                       ,{field:"vocStatNm"          , title:"<spring:message code='global.lbl.vocStatCd' />"              , attributes:{"class":"ac"}, width:100}    //VOC상태코드명
                       ,{field:"procDt"             , title:"<spring:message code='crm.lbl.procDt' />"              , attributes:{"class":"ac"}, width:100
                               ,format:"{0:<dms:configValue code='dateFormat' />}"
                       }                 //처리일자
                       ,{field:"pprocDeptNm"        , title:"<spring:message code='crm.lbl.pprocDeptNm' />"         , attributes:{"class":"ac"}, width:100}    //사업부서명
                       ,{field:"pprocNm"            , title:"<spring:message code='crm.lbl.pprocId' />"           , attributes:{"class":"ac"}, width:100}    //처리인ID
                       ,{field:"regDt"              , title:"<spring:message code='global.lbl.regDt' />"                , attributes:{"class":"ac"}, width:100
                               ,format:"{0:<dms:configValue code='dateFormat' />}"
                       }                 //등록일자
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
                       ,{field:"resvDt"             , title:"예약일자"              , hidden:true
                               ,format:"{0:<dms:configValue code='dateFormat' />}"
                       }  //예약일자
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
                       ,{field:"acptDt"             , title:"접수일자"              , hidden:true
                               ,format:"{0:<dms:configValue code='dateFormat' />}"
                       }  //접수일자
                       ,{field:"custReqCont"        , title:"고객요청내용"          , hidden:true}  //고객요청내용
                       ,{field:"custRescLocCont"    , title:"고객구조위치내용"      , hidden:true}  //고객구조위치내용
                       ,{field:"pevalId"            , title:"심사인ID"              , hidden:true}  //심사인ID
                       ,{field:"evalAllocDt"        , title:"심사배정일자"          , hidden:true
                               ,format:"{0:<dms:configValue code='dateFormat' />}"
                       }  //심사배정일자
                       ,{field:"callCenOpnCont"     , title:"콜센터의견내용"        , hidden:true}  //콜센터의견내용
                       ,{field:"returnCauCont"      , title:"반송원인내용"          , hidden:true}  //반송원인내용
                       ,{field:"pmoCauCd"           , title:"승급원인코드"          , hidden:true}  //승급원인코드
                       ,{field:"pmoDt"              , title:"승급일자"              , hidden:true
                               ,format:"{0:<dms:configValue code='dateFormat' />}"
                       }  //승급일자
                       ,{field:"revMthCont"         , title:"검토방안내용"          , hidden:true}  //검토방안내용
                       ,{field:"realPprocId"        , title:"실처리인ID"            , hidden:true}  //실처리인ID
                       ,{field:"pprocTelNo"         , title:"처리인전화번호"        , hidden:true}  //처리인전화번호
                       ,{field:"pprocEmailNm"       , title:"처리인이메일명"        , hidden:true}  //처리인이메일명
                       ,{field:"procRsltCont"       , title:"처리결과내용"          , hidden:true}  //처리결과내용
                       ,{field:"stsfIvstEmpId"      , title:"만족도조사인ID"        , hidden:true}  //만족도조사인ID
                       ,{field:"stsfIvstDt"         , title:"만족도조사일자"        , hidden:true
                               ,format:"{0:<dms:configValue code='dateFormat' />}"
                       }  //만족도조사일자
                       ,{field:"stsfIvstRsltCont"   , title:"만족도조사결과내용"    , hidden:true}  //만족도조사결과내용
                       ,{field:"mthAchvHm"          , title:"방안달성시간"          , hidden:true}  //방안달성시간
                       ,{field:"cmplStsfCd"         , title:"불만만족도코드"        , hidden:true}  //불만만족도코드
                       ,{field:"cmplReAcptYn"       , title:"불만재접수여부"        , hidden:true}  //불만재접수여부
                       ,{field:"cmplReAcptCnt"      , title:"불만재접수횟수"        , hidden:true}  //불만재접수횟수
                       ,{field:"serReqNo"           , title:"서비스요청번호"        , hidden:true}  //서비스요청번호
                       ,{field:"cmplDlDeptNm"       , title:"불만전달부서명"        , hidden:true}  //불만전달부서명
                       ,{field:"cmplDlEmpId"        , title:"불만전달자ID"          , hidden:true}  //불만전달자ID
                       ,{field:"saleDt"             , title:"판매일자"              , hidden:true
                               ,format:"{0:<dms:configValue code='dateFormat' />}"
                       }  //판매일자
                       ,{field:"dstbNo"             , title:"물류번호"              , hidden:true}  //물류번호
                       ,{field:"parOrdYn"           , title:"부품오더여부"          , hidden:true}  //부품오더여부
                       ,{field:"parOrdDt"           , title:"부품오더일자"          , hidden:true
                               ,format:"{0:<dms:configValue code='dateFormat' />}"
                       }  //부품오더일자
                       ,{field:"parArrvDt"          , title:"부품도착일자"          , hidden:true
                               ,format:"{0:<dms:configValue code='dateFormat' />}"
                       }  //부품도착일자
                       ,{field:"itemCd"             , title:"품목코드"              , hidden:true}  //품목코드
                       ,{field:"bhmcYn"             , title:"BHMC여부"              , hidden:true}  //BHMC여부
                       ,{field:"regUsrId"           , title:"등록자ID"              , hidden:true}  //등록자ID
                       ,{field:"updtUsrId"          , title:"수정자ID"              , hidden:true}  //수정자ID
                       ,{field:"updtDt"             , title:"수정일자"              , hidden:true
                               ,format:"{0:<dms:configValue code='dateFormat' />}"
                       }  //수정일자
                       ,{field:"bizDeptNm"          , title:"사업부서"              , hidden:true}  //사업부서명
                       ,{field:"vocCnt1"            , title:"정보VIEW"              , hidden:true}  //정보VIEW
                       ,{field:"vocCnt3"            , title:"정보VIEW"              , hidden:true}  //정보VIEW
                       ,{field:"vocCnt4"            , title:"정보VIEW"              , hidden:true}  //정보VIEW
                       ,{field:"vocCnt5"            , title:"정보VIEW"              , hidden:true}  //정보VIEW
                       ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
                       ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}                       // 사업장코드
           ]
           ,dataBound:function (e) {

               var dataItems = e.sender.dataSource.view();
               var vocCnt1 = dataItems.length == 0 ? "0":dataItems[0]["vocCnt1"];
               var vocCnt2 = dataItems.length == 0 ? "0":dataItems[0]["vocCnt2"];
               var vocCnt3 = dataItems.length == 0 ? "0":dataItems[0]["vocCnt3"];
               var vocCnt4 = dataItems.length == 0 ? "0":dataItems[0]["vocCnt4"];
               var vocCnt5 = dataItems.length == 0 ? "0":dataItems[0]["vocCnt5"];

               $("#vocCnt1").val(vocCnt1);
               $("#vocCnt2").val(vocCnt2);
               $("#vocCnt3").val(vocCnt3);
               $("#vocCnt4").val(vocCnt4);
               $("#vocCnt5").val(vocCnt5);

               $("#vocCnt").val("<spring:message code='crm.info.vocTpCdCnt' arguments='"+vocCnt1+","+vocCnt2+","+vocCnt3+","+vocCnt4+","+vocCnt5+"' />");
           }
           , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
           , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
           , multiSelectWithCheckbox:false     //멀티선택 적용. default:false
           , appendEmptyColumn:true           //빈컬럼 적용. default:false
           , enableTooltip:true               //Tooltip 적용, default:false
           ,navigatable:true
           ,height:420
       });


       //그리드 설정(활동목록)
       $("#activeGrid").kendoExtGrid({
           gridId:"G-CRM-0721-112802"
           ,dataSource:{
               transport:{
                   read:{
                       url:"<c:url value='/crm/crq/vocMgmt/selectActives.do' />"
                   }
                   ,parameterMap:function(options, operation) {
                       if (operation === "read") {

                           var params = {};

                           params["sDlrCd"]       = $("#dlrCd").val();
                           params["sPltCd"]       = $("#pltCd").val();
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
                               vocNo:{type:"string", editable:false}
                               , vocActiveNo:{type:"int", editable:false}
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
                               , pgssHm:{type:"int", editable:false}
                               , dlrCd:{type:"string"}
                               , pltCd:{type:"string"}
                           }
                       }
               }
           }
           ,autoBind:false
           , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
           , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
           , multiSelectWithCheckbox:false     //멀티선택 적용. default:false
           , appendEmptyColumn:true           //빈컬럼 적용. default:false
           , enableTooltip:true               //Tooltip 적용, default:false
           ,pageable:false
           ,height:200
           ,editableOnlyNew:true
           ,editableOnlyNewExcludeColumns:["regDeptNm","activeStatCd","activeTpCd","activeTpSubCd","custNm","pconCustNm","activeRsltCont","activeCd"]
           ,columns:[
               {field:"vocNo", title:"<spring:message code='global.lbl.vocNo' />", hidden:true}          // VOC번호
              ,{field:"vocActiveNo", title:"<spring:message code='global.lbl.vocActiveNo' />", hidden:true} // VOC활동번호
              ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", attributes:{"class":"ac"}, width:100
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
              } //등록일자
              ,{field:"regUsrId", title:"<spring:message code='global.lbl.regUsrId' />", attributes:{"class":"ac"}, width:100}  //등록자ID
              ,{field:"regDeptNm", title:"<spring:message code='global.lbl.regDeptNm' />", attributes:{"class":"ac"}, width:100}  //등록부서
              ,{field:"activeStatCd", title:"<spring:message code='global.lbl.statNm' />", width:100
                  ,editor:function(container, options) {
                      $('<input name="activeStatCd" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtDropDownList({
                          autoBind:false
                          ,dataTextField:"cmmCdNm"
                          ,dataValueField:"cmmCd"
                          ,dataSource:statList
                      });
                  }
                  ,template:'#if(activeStatCd !== "") {# #= statMap[activeStatCd]# #}#'
              } // 상태
              ,{field:"activeTpCd", title:"<spring:message code='global.lbl.type' />", width:100
                  ,editor:function(container, options) {
                      $('<input name="activeTpCd" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtDropDownList({
                          autoBind:false
                          ,dataTextField:"cmmCdNm"
                          ,dataValueField:"cmmCd"
                          ,dataSource:activeTpList
                      });
                  }
                  ,template:'#if(activeTpCd !== "") {# #= activeTpMap[activeTpCd]# #}#'
              } // 유형
              ,{field:"activeTpSubCd", title:"<spring:message code='global.lbl.activeTpSubCd' />", width:100
                  ,editor:function(container, options) {
                      $('<input name="activeTpSubCd" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtDropDownList({
                          autoBind:false
                          ,dataTextField:"cmmCdNm"
                          ,dataValueField:"cmmCd"
                          ,dataSource:activeSubTpList
                      });
                  }
                  ,template:'#if(activeTpSubCd !== "") {# #= activeSubTpMap[activeTpSubCd]# #}#'
              } // SUB유형
              ,{field:"custNo", title:"<spring:message code='global.lbl.customer' />", hidden:true}       // 고객
              ,{field:"custNm", title:"<spring:message code='global.lbl.customer' />", width:100, attributes:{"class":"al"}
                ,template:"<div class=\"form_search\"><input class='form_input' value='#=custNm#' disabled /><a href=\"javascript:selectCustPopupWindow(\'#= uid #\', \'1\');\" ></a></div>"
              }       // 고객
              ,{field:"pconCustNo", title:"<spring:message code='global.lbl.pconCustInfo' />", hidden:true}       // 문의자
              ,{field:"pconCustNm", title:"<spring:message code='global.lbl.pconCustInfo' />", width:100, attributes:{"class":"al"}
                ,template:"<div class=\"form_search\"><input class='form_input' value='#=pconCustNm#' disabled /><a href=\"javascript:selectCustPopupWindow(\'#= uid #\', \'2\');\" ></a></div>"
              }       // 문의자
              ,{field:"activeCd", title:"<spring:message code='global.lbl.activeContCd' />", width:100
                  ,editor:function(container, options) {
                      $('<input name="activeCd" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtDropDownList({
                          autoBind:false
                          ,dataTextField:"cmmCdNm"
                          ,dataValueField:"cmmCd"
                          ,dataSource:activeList
                      });
                  }
                  ,template:'#if(activeCd !== "") {# #= activeMap[activeCd]# #}#'
              } // 활동내용
              ,{field:"activeRsltCont", title:"<spring:message code='global.lbl.activeRsltCont' />", width:100}       // 활동결과
              ,{field:"pgssHm", title:"진행시간", hidden:true}         // 진행시간
              ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                       // 딜러코드
              ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}                       // 사업장코드
           ]
       });

});

//고객 팝업 조회
function selectCustPopupWindow(uid, cnt){
    var uidVal = uid;

    popupWindow = dms.window.popup({
        windowId:"customerSearchPopupMain"
        ,title:"<spring:message code = 'global.title.custSearch'/>"   // 고객 조회
        ,content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            ,data:{
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

/**
 * 유형에 따른 입력부 컨트롤
 */
function changeComboList(value) {
    if(value == "02"){
        $("#addInfoTitle").show();
        $("#addInfo").show();
        $("#itemInfoTitle").show();
        $("#itemInfo").show();

        $("#crimTitTag").show();
        $("#crimTag").show();
        $("#a49Tag").hide();

        $("#cusReqTitTag").hide();
        $("#cusReqTag").hide();
        $("#a39Tag").show();

    }else{
        $("#addInfoTitle").hide();
        $("#addInfo").hide();
        $("#itemInfoTitle").hide();
        $("#itemInfo").hide();

        $("#crimTitTag").hide();
        $("#crimTag").hide();
        $("#a49Tag").show();

        $("#cusReqTitTag").show();
        $("#cusReqTag").show();
        $("#a39Tag").hide();
    }
};

</script>
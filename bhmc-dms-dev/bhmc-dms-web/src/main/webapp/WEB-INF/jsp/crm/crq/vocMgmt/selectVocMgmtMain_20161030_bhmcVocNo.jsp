<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 기본정보 -->
    <section class="group">
        <div class="header_area">
        <h1 class="title_basic"><spring:message code="crm.menu.vocMng" /></h1><!-- 고객 요청 관리 -->
            <div class="btn_right">
                <button type="button" class="btn_m btn_new" id="btnNew"><spring:message code="global.btn.new" /><!-- 신규 --></button>
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
            </div>
        </div>
        <div class="table_form" role="search" data-btnid="btnSearch" >
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
                            <button type="button" id="btnHidden" class="btn_xs2 btn_detail"><spring:message code='crm.lbl.more' /></button> <!-- 더많음  ?件?情-->
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
                    <tr>
                        <th scope="row"><spring:message code='crm.lbl.prsNm' /><!-- 담당자 ??--></th>
                        <td>
                            <input id="sMngScId" name="sMngScId" class="form_comboBox" style="width:100%" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.BhmcVocNo' /><!-- BHMCVOC번호 --></th>
                        <td>
                            <input type="text" id="sBhmcVocNo" name="sBhmcVocNo" class="form_input" style="width:100%" />
                        </td>
                        <th scope="row"></th>
                        <td>
                        </td>
                        <th scope="row"></th>
                        <td>
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

        <!--  ************************** 배정 팝업 **************************** -->
        <section id="vocStat02Popup" class="pop_wrap">
            <div class="header_area">
                <div class="btn_right">
                    <button type="button" class="btn_s" id="btnVocStat02Popup"><spring:message code="global.btn.assign" /><!-- 배정 --></button>
                    <button type="button" class="btn_s" id="btnCancel02Popup"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
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
                            <th scope="row"><spring:message code="global.lbl.pprocDeptNm" /><!-- 처리부서 --></th>
                            <td colspan="3">
                                <input type="text" id="pprocDeptNmAppend" name="pprocDeptNmAppend" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.callCenOpnCont" /><!-- 콜센터 의견 --></th>
                            <td colspan="3" rowspan="4">
                                <textarea rows="5" maxlength="2000" id="callCenOpnContAppend" name="callCenOpnContAppend" cols=""  class="form_textarea"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.pprocId" /><!-- 처리인 --></th>
                            <td colspan="3">
                                <input type="hidden" id="pprocIdInput" name="pprocIdInput" />
                                <div id="pprocSearchPopup" class="form_search">
                                    <input type="text" id="pprocNmInput" name="pprocNmInput" class="form_input" style="width:100%" />
                                    <a href="javascript:;"><spring:message code="global.btn.search" /><!-- 조회 --></a>
                                </div>

                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.manufacturer" /><!-- 제조사/특약점 --></th>
                            <td colspan="3">
                                <input type="text" id="manufacturerAppend" name="manufacturerAppend" class="form_input" maxlength="50" style="width:100%" disabled />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.coopDeptNm" /><!-- 협조부서 --></th>
                            <td colspan="3">
                                <input type="text" id="coopDeptNmAppend" name="coopDeptNmAppend" class="form_input" maxlength="50" style="width:100%" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!--  ************************** 배정 팝업 **************************** -->

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
                                <textarea maxlength="2000" id="stsfIvstRsltContAppend" name="stsfIvstRsltContAppend" rows="5" cols=""  class="form_textarea" ></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th></th>
                            <td colspan="3">
                            </td>
                        </tr>
                        <tr>
                            <th></th>
                            <td colspan="3">
                            </td>
                        </tr>
                        <tr>
                            <th></th>
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

        <div class="header_area">
        <h2 class="title_basic"><spring:message code="global.title.vocReqAccept" /></h2><!-- VOC 요청접수 -->
            <div class="btn_right">
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStat01"><spring:message code="crm.btn.accept" /></button><!-- 접수 -> 활성화 : 신규 -->
            <dms:access viewId="VIEW-D-10278" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStat99"><spring:message code="crm.btn.return" /></button><!-- 반송 -> 활성화 : 심사대기 -->
            </dms:access>
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStat02"><spring:message code="crm.btn.evalAlloc" /></button><!-- 심사배정 -> 활성화 : 심사대기-->
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStat03"><spring:message code="crm.btn.proce" /></button><!-- 처리 - 활성화 : 처리대기 -->
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStat05"><spring:message code="crm.btn.surveySuccessClose" /></button>  <!-- 설문완료CLOSE - 활성화 : 처리완료 설문대기 -->
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStat07"><spring:message code="crm.btn.surveyFailClose" /></button><!-- 설문안하고CLOSE - 활성화 : 접수 / 처리완료 설문대기 -->
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStat08"><spring:message code="crm.btn.custVsit" /></button><!-- 고객내방대기 - 활성화 : 접수 / 처리완료 설문대기 -->
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStat09"><spring:message code="crm.btn.custFU" /></button><!-- 고객F/U중 - 활성화 : 접수 / 처리완료 설문대기 -->
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStatLEAD"><spring:message code="crm.btn.leadCreate" /></button><!-- 리드생성 -->
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStatRO"><spring:message code="crm.btn.ROResv" /></button><!-- RO예약 -->
                <button type="button" class="btn_s" name="btnVocStat" id="btnVocStat00"><spring:message code="global.btn.update" /></button><!-- 수정 -> 활성화 : 신규 / 심사대기 / 처리대기 / 고객F/U -->
                <button type="button" class="btn_s btn_save" id="btnModify"><spring:message code="global.btn.save" /><!-- 저장 --></button>
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
                                <input id="bhmcYn" name="bhmcYn" type="hidden" value="N" />
                                <input id="bhmcVocNo" name="bhmcVocNo" type="hidden" />
                                <input id="dlrCd" name="dlrCd" type="hidden" value="<c:out value='${loginDlrCd}' />"/>
                                <input type="text" id="vocNo" name="vocNo" readonly class="form_input form_readonly ac" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.receiveTelNo" /><!-- 전화번호 --></th>
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
                                <input type="hidden" id="bfVocStatCd" name="bfVocStatCd" />
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
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.type" /></span> <!-- 유형 --></th>
                            <td>
                                <input id="vocTpCd" name="vocTpCd" value="" class="form_comboBox" style="width:100%" />
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
                            <th scope="row"><spring:message code="crm.lbl.sung" /><!-- 성 --></th>
                            <td>
                                <input id="sungNm" name="sungNm" type="hidden">
                                <input id="sungCd" name="sungCd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.pacptId" /><!-- 접수인 --></th>
                            <td>
                                <input type="hidden" id="pacptId" name="pacptId" />
                                <input type="text" id="pacptNm" name="pacptNm" class="form_input" style="width:100%" />
                                <%-- <div id="pacptSearch" class="form_search">
                                    <a href="javascript:;"><spring:message code="global.btn.search" /><!-- 조회 --></a>
                                </div> --%>
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
                            <th scope="row"><spring:message code="crm.lbl.city" /><!-- 도시 --></th>
                            <td>
                                <input id="cityNm" name="cityNm" type="hidden">
                                <input id="cityCd" name="cityCd" value="" class="form_comboBox" style="width:100%" />
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.acptDt" /></span><!-- 접수시간 --></th>
                            <td class="required_area">
                                <input id="acptDt" name="acptDt" class="form_datepicker ac" style="width:100%" />
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
                            <th scope="row"><spring:message code="crm.lbl.vorResvDt" /><!-- 예약시간 --></th>
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
                                <input id="sendCd" name="sendCd" class="form_comboBox" style="width:100%" />
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
                            <th scope="row"><spring:message code="crm.lbl.stsfIvstEmpId" /><!-- 설문조사인 --></th>
                            <td>
                                <input id="stsfIvstEmpId" name="stsfIvstEmpId" type="hidden">
                                <div id="stsfIvstEmpSearch" class="form_search">
                                    <input type="text" id="stsfIvstEmpNm" name="stsfIvstEmpNm" class="form_input" style="width:100%" />
                                    <a href="javascript:;"><spring:message code="global.btn.search" /><!-- 조회 --></a>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.vocStsfIvstDt" /><!-- 설문 조사시간 --></th>
                            <td>
                                <input id="stsfIvstDt" name="stsfIvstDt" value="" class="form_datepicker ac" style="width:100%">
                            </td>
                        </tr>

                        <tr>
                            <th scope="row"><spring:message code="global.lbl.mthAchvHm" /><!-- 방안 달성시간 --></th>
                            <td>
                                <input id="mthAchvHm" name="mthAchvHm" class="form_datepicker ac" style="width:100%">
                            </td>
                            <th scope="row" rowspan="2" ><spring:message code="crm.lbl.traceRsltCont" /><!-- 추적결과 --></th>
                            <td rowspan="2" rowspan="2" >
                                <textarea maxlength="2000" id="traceRsltCont" name="traceRsltCont" rows="2" cols=""  class="form_textarea"></textarea>
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.stsfIvstRsltCont" /><!-- 설문결과 --></th>
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
                                <input id="cmplStsfNm01" name="cmplStsfNm01" class="form_comboBox" style="width:100%" />
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
                                <input id="cmplStsfNm02" name="cmplStsfNm02" class="form_comboBox" style="width:100%" />
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
                            <th scope="row"><spring:message code="crm.lbl.itemCd" /><!-- 부품번호 --></th>
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

    var vocInputMode = "N";


    var vocTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //VOC유형코드 / CRM604
    <c:forEach var="obj" items="${vocTpCdList}">
        vocTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>


    var vocStatCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}]; //VOC상태코드 / CRM624
    <c:forEach var="obj" items="${vocStatCdList}">
        vocStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
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

    var mngScIdList = [];
    <c:forEach var="obj" items="${mngScIdList}">
        mngScIdList.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
    </c:forEach>

    // VOC 버튼 제어
    function btnActive(vocStatCd, vocTpCd){

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


            <dms:access viewId="VIEW-D-10278" hasPermission="${dms:getPermissionMask('READ')}">
                $("#btnVocStat02").data("kendoButton").enable(true);    //심사배정(배정자)
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

            <dms:access viewId="VIEW-D-10278" hasPermission="${dms:getPermissionMask('READ')}">
                $("#btnVocStat02").data("kendoButton").enable(true);    //심사배정(배정자)
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
            $("#btnVocStatRO").data("kendoButton").enable(true);        //RO예약

        };

        return;

    };

    // VOC 상태 변경 프로세스 ( 버튼제어 )
    function vocStatUpdt(vocStatCd){

        // 02 : 접수 -> 심사대기
        // 99 : 반송 -> 접수
        // 03 : 심사대기 -> 심사배정(처리대기)
        // 05 : 처리대기 -> 처리완료설문대기
        // 06 : 처리완료설문대기 -> 설문완료Close
        // 97 : 처리완료설문대기 -> 처리상태로 반송
        // 96 : 처리완료설문대기 -> 고객F/U로 반송
        // 07 : 처리완료설문대기 -> 설문안하고 Close
        // 08 : 처리대기 -> 고객내방대기  ( 클레임 )
        // 09 : 고객내방대기  / 제조사(처리대기)-> 고객F/U중 ( 클레임 )
        // 95 : 고객내방대기 -> 고객F/U중 ( 클레임 ) -> 처리로 반송(97)

        var vocNo = $("#vocNo").val();
        var dlrCd = $("#dlrCd").val();
        var vocStatCd = vocStatCd;
        var bfVocStatCd = $("#bfVocStatCd").val();
        var bhmcVocNo = $("#bhmcVocNo").val();
        var custNm = $("#custNm").val();            // 배정시 알람 보내는데 param으로 필요

//         console.log("vocNo : "+vocNo+" | vocStatCd : "+vocStatCd+" | bhmcVocNo : "+bhmcVocNo)
        var json = {};
        json.vocNo = vocNo;
        json.bhmcVocNo = bhmcVocNo;
        json.dlrCd = dlrCd;
        json.vocStatCd = vocStatCd;
        json.bfVocStatCd = bfVocStatCd;
        json.custNm = custNm;

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


        if ( vocStatCd === "02" ) {
//             console.log("02 : 접수 -> 심사대기");

            var pprocDeptNm = $("#pprocDeptNm").val();

            if ( dms.string.isEmpty(pprocDeptNm) ) {
                // 처리부서 / 을(를) 입력해주세요.
                dms.notification.warning("<spring:message code='global.lbl.pprocDeptNm' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
                return;
            } else {

                json.pprocDeptNm = pprocDeptNm;

            };

        } else if ( vocStatCd === "99" ) {
//             console.log("99 : 반송");

            var returnCauContAppend = $("#returnCauContAppend").val();
            var returnCauCont = $("#returnCauCont").val();

            if ( dms.string.isEmpty(returnCauContAppend) ) {
                // 반송원인 / 을(를) 입력해주세요.
                dms.notification.warning("<spring:message code='global.lbl.returnCauCont' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
                return;

            } else {

                json.returnCauContAppend = returnCauContAppend;
                json.returnCauCont = returnCauCont;

            };

        } else if ( vocStatCd === "03" ) {
//             console.log("03 : 심사대기 -> 심사배정");

            var pprocDeptNm = $("#pprocDeptNmAppend").val();
            var callCenOpnContAppend = $("#callCenOpnContAppend").val();
            var callCenOpnCont = $("#callCenOpnCont").val();

            var pprocNmInput = $("#pprocNmInput").val();
            var pprocIdInput = $("#pprocIdInput").val();

            var coopDeptNmAppend = $("#coopDeptNmAppend").val();


            if ( dms.string.isEmpty(pprocDeptNm) ) {
                // 처리부서 / 을(를) 입력해주세요.
                dms.notification.warning("<spring:message code='global.lbl.pprocDeptNm' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
                return;
            } else if ( dms.string.isEmpty(callCenOpnContAppend) ) {
                // 콜센터의견 / 을(를) 입력해주세요.
                dms.notification.warning("<spring:message code='global.lbl.callCenOpnCont' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
                return;
            } else if ( dms.string.isEmpty(pprocIdInput) ) {
                // 처리인 / 을(를) 입력해주세요.
                dms.notification.warning("<spring:message code='global.lbl.pprocId' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
                return;
            } else {
                json.pprocDeptNm = pprocDeptNm;
                json.callCenOpnContAppend = callCenOpnContAppend;
                json.callCenOpnCont = callCenOpnCont;
                json.pprocNm = pprocNmInput;
                json.pprocId = pprocIdInput;
                json.coopDeptNm = coopDeptNmAppend;
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
                json.procRsltContAppend = procRsltContAppend;
                json.procRsltCont = procRsltCont;
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
                json.stsfIvstRsltContAppend = stsfIvstRsltContAppend;
                json.stsfIvstRsltCont = stsfIvstRsltCont;
            };

        } else if ( vocStatCd === "97" ) {
//             console.log("97 : 처리완료설문대기 -> 처리상태로 반송");

            var stsfIvstRsltContAppend = $("#stsfIvstRsltContAppend").val();

            if ( dms.string.isEmpty(stsfIvstRsltContAppend) ) {
                // 설문결과/ 을(를) 입력해주세요.
                dms.notification.warning("<spring:message code='crm.lbl.stsfIvstRsltCont' var='arguMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${arguMsg}' />");
                return;
            } else {
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

        console.log("voc stat update param : ",JSON.stringify(json));
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
                var vocStatCd = $("#bfVocStatCd").val();
                if ( vocStatCd === "02" || vocStatCd === "03" || vocStatCd === "09" || vocStatCd === "05" || vocStatCd === "99" || vocStatCd === "08" || vocStatCd === "07" || vocStatCd === "06" || vocStatCd === "97" || vocStatCd === "96" ) {

                    if ( vocStatCd === "09" ) {
                        vocStatCd = "03";
                    };

                    var win = $("#vocStat"+vocStatCd+"Popup").data("kendoWindow");
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

        if ( dms.string.isEmpty($("#custNo").val())){      // 고객명
            dms.notification.warning("<spring:message code='global.lbl.custNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            $("#custNm").focus();
            return false;
        };

        if ( dms.string.isEmpty($("#acptDt").val())){      // 접수시간
            dms.notification.warning("<spring:message code='global.lbl.acptDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            $("#acptDt").focus();
            return false;
        };


        if ( dms.string.isEmpty($("#pprocDeptNm").val()) ) {
            dms.notification.warning("<spring:message code='global.lbl.pprocDeptNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            return false;
        };

        $("#vocNo").prop("readonly", false);

        var json = $("#defaultInfoForm").serializeObject();

        // 상세조회시 VOC 유형은 수정불가 (enabel:false). 따라서 값을 가져와야함.
        json.vocTpCd = $("#vocTpCd").data("kendoExtDropDownList").value();
        json.vocStatCd = $("#vocStatCd").data("kendoExtDropDownList").value();

        json.hpNo = $("#hpNo").val();
        json.acptDeptNm = $("#acptDeptNm").val();
        json.pacptId = $("#pacptId").val();
        json.pacptNm = $("#pacptNm").val();
        json.parOrdYn = $("#parOrdYn").data("kendoExtDropDownList").value();


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


//         console.log("vocNewJson : ",json);

        var url = "";

        if ( vocInputMode == "N" ) {
            url = "<c:url value='/crm/crq/vocMgmt/insertVocMgmts.do' />";
        } else if ( vocInputMode == "U" ) {
            url = "<c:url value='/crm/crq/vocMgmt/updateVocMgmts.do' />";
        } else {
            return;
        };

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
            ,success:function(data) {
                dms.notification.success("<spring:message code='global.info.success'/>");
                $("#vocGrid").data("kendoExtGrid").dataSource.read();
                vocInputMode = "N";
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

//         console.log("유형에 따른 상태 조회 param:");
//         console.log(param);
        var responseJson = dms.ajax.getJson({
            url:_contextPath + "/crm/crq/vocMgmt/selectVocTpSubCdList.do"
            ,data:JSON.stringify(param)
            ,async:false
        });

        var vocTpSubDatsSource = responseJson.data;
//         console.log("유형에 따른 상태 조회 결과");
//         console.log(vocTpSubDatsSource);
        //console.log("responseJson.data ::",vocTpSubDatsSource);

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

//             console.log("responseJson.data: ",responseJson.data)

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

        changeComboList("","","");

        $("#bhmcYn").val("");
        $("#bhmcVocNo").val("");
        $("#dlrCd").val("");

        // VOC 요청접수
        $("#vocNo").val("");
        //onSelectVocStatCdSet("");           // VOC 상태는 유형에 따라서 선택됨. 최초 읽기전용
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
        $("#pprocDeptNm").val("");
        $("#pprocId").val("");
        $("#pprocNm").val("");
        $("#coopDeptNm").val("");
        $("#bizDeptNm").val("");
        $("#officeNm").val("");
        $("#sungNm").val("");
        $("#sungCd").data("kendoExtDropDownList").value("");
        $("#cityNm").val("");
        $("#cityCd").data("kendoExtDropDownList").value("");
        $("#custReqCont").val("");

        $("#vinNo").val("");
        $("#carRegNo").val("");
        $("#carlineNm").val("");
        $("#carlineCd").data("kendoExtDropDownList").value("");
        $("#modelCd").data("kendoExtDropDownList").value("");
        $("#modelNm").val("");
        $("#ocnNm").val("");
        $("#ocnCd").data("kendoExtDropDownList").value("");
        $("#runDistVal").val("");
        $("#acptDeptNm").val("");
        $("#pacptId").val("");
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


        // 버튼에 따른 팝업
        $("#pprocDeptNmAppend").val("");
        $("#callCenOpnContAppend").val("");
        $("#pprocIdInput").val("");
        $("#pprocNmInput").val("");
        $("#manufacturerAppend").val("");
        $("#coopDeptNmAppend").val("");
        $("#procRsltContAppend").val("");
        $("#cmplStsfNmAppend").data("kendoExtDropDownList").value("");
        $("#stsfIvstRsltContAppend").val("");
        $("#custVsitPlan").val("");
        $("#custFUResult").val("");


        $("#btnActiveSave").data("kendoButton").enable(false);
        $("#btnAdd").data("kendoButton").enable(false);

        $("#btnModify").data("kendoButton").enable(false);

        //버튼 초기화
        btnDisabled();



        $("#activeGrid").data("kendoExtGrid").dataSource.data([]);

    };


    function btnDisabled(){

        $("#btnVocStat01").data("kendoButton").enable(false);
        //$("#btnVocStat99").data("kendoButton").enable(false);
        $("#btnVocStat00").data("kendoButton").enable(false);
        $("#btnVocStat02").data("kendoButton").enable(false);
        $("#btnVocStat03").data("kendoButton").enable(false);
        $("#btnVocStat05").data("kendoButton").enable(false);
        $("#btnVocStat07").data("kendoButton").enable(false);
        $("#btnVocStat09").data("kendoButton").enable(false);
        $("#btnVocStat08").data("kendoButton").enable(false);

        $("#btnVocStatLEAD").data("kendoButton").enable(false);      //리드생성
        $("#btnVocStatRO").data("kendoButton").enable(false);        //RO예약

        //$("#btnModify").data("kendoButton").enable(false);        //RO예약

        $("#btnVocStat02Popup").data("kendoButton").enable(false);
        $("#btnCancel02Popup").data("kendoButton").enable(false);
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
    function changeComboList(vocTpCd, vocTpSub1Cd, vocTpSub2Cd) {

        // TODO validation 확인 ( 긴급구조 : vocTpSub1Cd === "03" && vocTpSub2Cd === "18"  / vocTpSub1Cd === "01" && vocTpSub2Cd === "90" 일때 확인)
        //console.log("유형에 따른 입력부 컨트롤 ( 유형 - 불만에 따라서 show / hide ):"+value)

        // 1급 Sub 유형, 2급 Sub 유형에서 긴급구조일때 화면 변경

        if ( dms.string.isEmpty(vocTpCd) ) {
            if ( vocTpSub1Cd === "03" && vocTpSub2Cd === "18" ) {
                vocTpCd = "05"
            };
        };

        if(vocTpCd === "02"){

            $("#vocTpSubCd").data("kendoExtDropDownList").enable(false);           //VOC 하위유형
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

            //추가정보
            $("#addInfoTitle1").removeClass("hidden");
            $("#addInfoFrom").removeClass("hidden");
            $("#addInfo1").addClass("hidden");
            $("#addInfo2").removeClass("hidden");
            $("#addInfo3").removeClass("hidden");
            //부품정보
            $("#itemInfoTitle1").removeClass("hidden");
            $("#itemInfo1").removeClass("hidden");

        } else if(vocTpCd === "05"){

            $("#vocTpSubCd").data("kendoExtDropDownList").enable(false);           //VOC 하위유형
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

        if ( dms.string.isNotEmpty($("#vocNo").val()) ) {        // BHMC_YN = Y 인경우는 읽기전용이기 때문에 팝업 허용 안함
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
    };

$(document).ready(function() {

    // 수정 버튼
    $("#btnVocStat00").kendoButton({
        click:function(e) {

//             console.log("수정 ( 상태 변경 없음 )");

            vocInputMode = "U";

            $("#btnModify").data("kendoButton").enable(true);        // 수정버튼 화성화
            $("#btnVocStat00").data("kendoButton").enable(false);        // 수정버튼 화성화

                // VOC 요청접수
//                 $("#vocNo").attr("disabled", false);             // VOC 번호는 항상 읽기전용
//                 $("#vocStatCd").data("kendoExtDropDownList").enable(true);
//                 $("#bfVocStatCd").attr("disabled", false);
//                 $("#vocTpCd").data("kendoExtDropDownList").enable(true);

            $("#vocTpSubCd").data("kendoExtDropDownList").enable(true);
            $("#tendCd").data("kendoExtDropDownList").enable(true);
            $("#vocTpSub1Cd").data("kendoExtDropDownList").enable(true);
            $("#vocTpSub2Cd").data("kendoExtDropDownList").enable(true);
            $("#vocTpSub3Cd").data("kendoExtDropDownList").enable(true);
            $("#acptSrcCd").data("kendoExtDropDownList").enable(true);
//                 $("#activeGainPathCd").data("kendoExtDropDownList").enable(true);

            if ( $("#vocTpCd").data("kendoExtDropDownList").value() === "02" ) {
                $("#cmplCauCd").data("kendoExtDropDownList").enable(true);
            };



            $("#prorCd").data("kendoExtDropDownList").enable(true);
//                 $("#procLmtCd").data("kendoExtDropDownList").enable(true);
//                 $("#vocEndDt").data("kendoExtMaskedDateTimePicker").enable(true);
            $("#dlrCmpCommYn").prop("disabled", false);

                //긴급구조
//                 $("#emgcRescFstCallYn").data("kendoExtDropDownList").enable(true);     //긴급전화 첫 통화여부
//                 $("#emgcRescYn").data("kendoExtDropDownList").enable(true);     //긴급구조 여부
//                 $("#emgcRescReasonNm").data("kendoExtDropDownList").enable(true);     //원인
//                 $("#emgcRescStsfCont").data("kendoExtDropDownList").enable(true);     //구조 만족도
//                 $("#emgcRescLocCont").attr("disabled", false);                      //고객구조위치

//                 $("#receiveTelNo").attr("disabled", false);
            $("#custNo").attr("disabled", false);
            $("#custNm").attr("disabled", false);
            $("#pconCustNm").attr("disabled", false);
            $("#pconCustNo").attr("disabled", false);
//                 $("#custPrefCommNo").attr("disabled", false);
//                 $("#hpNo").attr("disabled", false);
//                 $("#homeTelNo").attr("disabled", false);
//                 $("#officeTelNo").attr("disabled", false);
//                 $("#pconCustMjrTelNo").attr("disabled", false);
//                 $("#pconCustHpNo").attr("disabled", false);
//                 $("#pconCustHomeTelNo").attr("disabled", false);
//                 $("#pconCustOfficeTelNo").attr("disabled", false);
//                 $("#resvDt").data("kendoExtMaskedDateTimePicker").enable(true);
//                 $("#repairBookId").attr("disabled", false);

//                 $("#sendTelNo").attr("disabled", false);
            $("#pconRelCd").data("kendoExtDropDownList").enable(true);
            $("#pprocDeptNm").attr("disabled", false);
            $("#pprocId").attr("disabled", false);
            $("#pprocNm").attr("disabled", false);
            $("#coopDeptNm").attr("disabled", false);
//                 $("#bizDeptNm").attr("disabled", false);
//                 $("#officeNm").attr("disabled", false);
//                 $("#sungNm").attr("disabled", false);
//                 $("#sungCd").data("kendoExtDropDownList").enable(true);
//                 $("#cityNm").attr("disabled", false);
//                 $("#cityCd").data("kendoExtDropDownList").enable(true);
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

//                 $("#acptDeptNm").attr("disabled", false);
//                 $("#pacptId").attr("disabled", false);
//                 $("#pacptNm").attr("disabled", false);
//                 $("#acptDt").data("kendoExtMaskedDateTimePicker").enable(true);

                //VOC 처리
//                 $("#pevalId").attr("disabled", false);
//                 $("#pevalNm").attr("disabled", false);
//                 $("#returnCauCont").attr("disabled", false);
//                 $("#pmoCauCd").data("kendoExtDropDownList").enable(true);
//                 $("#realPprocId").attr("disabled", false);
//                 $("#realPprocNm").attr("disabled", false);
//                 $("#pprocTelNo").attr("disabled", false);
//                 $("#stsfIvstEmpId").attr("disabled", false);
//                 $("#stsfIvstEmpNm").attr("disabled", false);
//                 $("#mthAchvHm").data("kendoExtMaskedDateTimePicker").enable(true);
//                 $("#traceDt").data("kendoExtMaskedDateTimePicker").enable(true);

//                 $("#evalAllocDt").data("kendoExtMaskedDateTimePicker").enable(true);
            $("#sendCd").data("kendoExtDropDownList").enable(true);
//                 $("#pmoDt").data("kendoExtMaskedDateTimePicker").enable(true);
//                 $("#procDt").data("kendoExtMaskedDateTimePicker").enable(true);
//                 $("#pprocEmailNm").attr("disabled", false);
//                 $("#stsfIvstDt").data("kendoExtMaskedDateTimePicker").enable(true);
//                 $("#traceRsltCont").attr("disabled", false);

            $("#callCenOpnCont").attr("disabled", false);
//                 $("#revMthCont").attr("disabled", false);
            $("#procRsltCont").attr("disabled", false);
//                 $("#stsfIvstRsltCont").attr("disabled", false);

                // 추가정보
             //$("#cmplStsfNm01").attr("disabled", false);
             $("#cmplStsfNm01").data("kendoExtDropDownList").enable(false);
//                 $("#cmplStsfNm02").attr("disabled", false);
//                 $("#cmplReAcptYn").prop("disabled", false);
//                 $("#cmplReAcptCnt").attr("disabled", false);
//                 $("#serReqNo").attr("disabled", false);
//                 $("#cmplDlDeptNm").attr("disabled", false);
//                 $("#cmplDlEmpId").attr("disabled", false);
//                 $("#cmplDlEmpNm").attr("disabled", false);
            $("#saleDt01").data("kendoExtMaskedDateTimePicker").enable(true);
            $("#saleDt02").data("kendoExtMaskedDateTimePicker").enable(true);
//                 $("#dstbNo").attr("disabled", false);

            $("#salesActiveSrcCd").data("kendoExtDropDownList").enable(true);
            $("#relSalesActiveNo").attr("disabled", false);

                // 부품정보
            $("#parOrdYn").data("kendoExtDropDownList").enable(true);
            $("#parOrdDt").data("kendoExtMaskedDateTimePicker").enable(true);
            $("#parArrvDt").data("kendoExtMaskedDateTimePicker").enable(true);
            $("#itemCd").attr("disabled", false);

        }
        ,enable:false
    });

    /** 접수버튼 : 접수(01) -> 심사대기(02)**************************************************************/
    $("#btnVocStat011").kendoButton({
        click:function(e) {
            if ( vocInputMode === "N" ) {
                vocSave();
            } else {
                vocStatUpdt("02");
            };
        }
        ,enable:false
    });
    /** 접수버튼 : 접수(01) -> 심사대기(02)**************************************************************/

    /** 접수버튼 : 접수(01) -> 심사대기(02) 후 처리상태로. **************************************************************/
    $("#btnVocStat01").kendoButton({
        click:function(e) {
            if ( vocInputMode === "N" ) {
                vocSave();
            } else {
                //vocStatUpdt("02");
                $("#pprocDeptNmAppend").val($("#pprocDeptNm").val());
                $("#pprocIdInput").val($("#pprocId").val());
                $("#pprocNmInput").val($("#pprocNm").val());
                $("#manufacturerAppend").val($("#manufacturer").val());
                $("#coopDeptNmAppend").val($("#coopDeptNm").val());

                $("#btnVocStat02Popup").data("kendoButton").enable(true);
                $("#btnCancel02Popup").data("kendoButton").enable(true);

                var win = $("#vocStat02Popup").data("kendoWindow");
                win.center();
                win.open();
            };
        }
        ,enable:false
    });
    /** 접수버튼 : 접수(01) -> 심사대기(02) 후 처리상태로.**************************************************************/

    /** 심사배정 버튼 : 심사대기(02) -> 심사배정 팝업 *******************************************************/
    $("#btnVocStat02").kendoButton({
        click:function(e) {
            $("#pprocDeptNmAppend").val($("#pprocDeptNm").val());
            $("#pprocIdInput").val($("#pprocId").val());
            $("#pprocNmInput").val($("#pprocNm").val());
            $("#manufacturerAppend").val($("#manufacturer").val());
            $("#coopDeptNmAppend").val($("#coopDeptNm").val());

            $("#btnVocStat02Popup").data("kendoButton").enable(true);
            $("#btnCancel02Popup").data("kendoButton").enable(true);

            var win = $("#vocStat02Popup").data("kendoWindow");
            win.center();
            win.open();
        }
        ,enable:false
    });
    // 심사배정 팝업 버튼 : 심사대기(02) -> 처리대기(03)
    $("#btnVocStat02Popup").kendoButton({
        click:function(e) {
            vocStatUpdt('03')
        }
        ,enable:false
    });
    // 심사배정 팝업 취소 버튼
    $("#btnCancel02Popup").kendoButton({
        click:function(e) {
            $("#vocStat02Popup").data("kendoWindow").close();
        }
        ,enable:false
    });
    /** 심사배정 버튼 : 심사대기(02) -> 심사배정 팝업 *******************************************************/

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
    // 처리 팝업 버튼 : 처리대기 (03) -> 처리완료설문대기(05)
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
    // 고객F/U중 팝업 -> 확인 버튼 : 고객내방대기 (08) -> 고객F/U중(09)
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
            //$("#cmplStsfNmAppend").val($("#cmplStsfNm").val());
            //$("#cmplStsfNmAppend").data("kendoExtDropDownList").value();

            $("#stsfIvstRsltContAppend").val($("#stsfIvstRsltCont").val());

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

    //
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

            // TODO 고객번호 / vin 번호 파라미터 확인
            window.parent._createOrReloadTabMenu("<spring:message code='ser.menu.reserCreate' />", "<c:url value='/ser/rev/reservationReceipt/selectReservationReceiptMain.do' />", "VIEW-D-10332");


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

    // ************************** 배정 팝업 ****************************
    $("#vocStat02Popup").kendoWindow({
        animation:false
        ,draggable:true
        ,modal:false
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='crm.title.evalAlloc' />"      //심사배정
        ,width:"950px"
        ,height:"200px"
    }).data("kendoWindow");
    // ************************** 배정 팝업 ****************************

    // ************************** 처리 결과 입력 팝업 ****************************
    $("#vocStat03Popup").kendoWindow({
        animation:false
        ,draggable:true
        ,modal:false
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='crm.title.procRsltCont' />"      // <!-- 처리결과 -->
        ,width:"950px"
        ,height:"200px"
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
        ,height:"200px"
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
        ,height:"200px"
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

    $("#sMngScId").kendoExtDropDownList({
        dataTextField:"usrNm"
       ,dataValueField:"usrId"
       ,dataSource:mngScIdList
       ,optionLabel:" "
       , filter:"contains"
       ,filtering:function(e){
           var filter = e.filter;
       }
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

    // 방안달성시간(입력부)
    $("#mthAchvHm").kendoExtMaskedDateTimePicker({
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
            //onSelectVocStatCdSet(dataItem.cmmCd);

            $("#vocTpSub1Cd").data("kendoExtDropDownList").value("");
            $("#vocTpSub2Cd").data("kendoExtDropDownList").setDataSource([]);
            $("#vocTpSub2Cd").data("kendoExtDropDownList").enable(false);
            changeComboList(dataItem.cmmCd,"","");




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

            changeComboList("","","");


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
        //, enable:false
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
        , select:function(e){
            var dataItem = this.dataItem(e.item);

            var vocTpSub1Cd = $("#vocTpSub1Cd").data("kendoExtDropDownList").value();
            var vocTpSub2Cd = dataItem.cmmCd;

            onSelectVocTpSubCdSet("CRM607", vocTpSub2Cd);

            // 긴급구조일때 화면 변경
            if ( vocTpSub1Cd === "03" && vocTpSub2Cd === "18" ) {
                changeComboList("",vocTpSub1Cd,vocTpSub2Cd);
            } else {
                changeComboList("","","");
            };
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
        ,dataSource:[{"cmmCd":"Y", "cmmCdNm":"<spring:message code='global.lbl.yes' />"}, {"cmmCd":"N", "cmmCdNm":"<spring:message code='global.lbl.n' />"}]
        ,index:1
    });



/*************************************************************
 * 이벤트 정의
 *************************************************************/

     //고객조회
     $("#custSearch").click(function(){
//          console.log("vocNo  : "+$("#vocNo").val())
         if ( dms.string.isEmpty($("#vocNo").val()) ) {        // BHMC_YN = Y 인경우는 읽기전용이기 때문에 팝업 허용 안함
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
//                                  console.log("고객조회 : ",data[0]);
                                 $("#custNo").val(data[0].custNo);
                                 $("#custNm").val(data[0].custNm);

                                 var hpNo;

                                 // 고객유형이 개인인경우 hpNo, 법인인경우 officeTelNo
                                 if ( data[0].custTp === "01" ) {
                                     hpNo = data[0].hpNo;
                                 } else if ( data[0].custTp === "02" ) {
                                     hpNo = data[0].officeTelNo;
                                 };

                                 $("#hpNo").val(hpNo);
                             }
                         }
                     }
                 }
             });
         }

     });

     //문의인 조회
     $("#pconCustSearch").click(function(){
         if ( dms.string.isEmpty($("#vocNo").val()) ) {        // BHMC_YN = Y 인경우는 읽기전용이기 때문에 팝업 허용 안함
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
//                                  console.log(data[0]);
                                 $("#pconCustNo").val(data[0].custNo);
                                 $("#pconCustNm").val(data[0].custNm);

                                 var hpNo;

                                 // 고객유형이 개인인경우 hpNo, 법인인경우 officeTelNo
                                 if ( data[0].custCd === "01" ) {
                                     hpNo = data[0].hpNo;
                                 } else if ( data[0].custCd === "02" ) {
                                     hpNo = data[0].officeTelNo;
                                 };

                                 $("#pconCustHpNo").val(hpNo);

                             }
                         }
                     }
                 }
             });
         }
     });

     //처리인 조회
     $("#pprocSearch").click(function(){
         if ( dms.string.isEmpty($("#vocNo").val()) ) {        // BHMC_YN = Y 인경우는 읽기전용이기 때문에 팝업 허용 안함
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
//                                 console.log("Return to User Popup");
//                                 console.log(data[0]);
                                $("#pprocId").val(data[0].usrId);
                                $("#pprocNm").val(data[0].usrNm);
                            }
                        }
                    }
                }
             })
         }
     });

     //처리인 조회
     $("#pprocSearchPopup").click(function(){

         //if ( dms.string.isEmpty($("#vocNo").val()) ) {        // BHMC_YN = Y 인경우는 읽기전용이기 때문에 팝업 허용 안함
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
//                                 console.log("Return to User Popup");
//                                 console.log(data[0]);
                                $("#pprocIdInput").val(data[0].usrId);
                                $("#pprocNmInput").val(data[0].usrNm);
                            }
                        }
                    }
                }
             })
         //}
     });
<%--
     //접수자 조회
     $("#pacptSearch").click(function(){
         if ( dms.string.isEmpty($("#vocNo").val()) ) {        // BHMC_YN = Y 인경우는 읽기전용이기 때문에 팝업 허용 안함
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
         }
     });
--%>
     //심사인 조회
     $("#pevalSearch").click(function(){
         if ( dms.string.isEmpty($("#vocNo").val()) ) {        // BHMC_YN = Y 인경우는 읽기전용이기 때문에 팝업 허용 안함
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
//                                 console.log("Return to User Popup");
//                                 console.log(data[0]);
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
         if ( dms.string.isEmpty($("#vocNo").val()) ) {        // BHMC_YN = Y 인경우는 읽기전용이기 때문에 팝업 허용 안함
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
//                                 console.log("Return to User Popup");
//                                 console.log(data[0]);
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
         if ( dms.string.isEmpty($("#vocNo").val()) ) {        // BHMC_YN = Y 인경우는 읽기전용이기 때문에 팝업 허용 안함
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
//                                 console.log("Return to User Popup");
//                                 console.log(data[0]);
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
         if ( dms.string.isEmpty($("#vocNo").val()) ) {        // BHMC_YN = Y 인경우는 읽기전용이기 때문에 팝업 허용 안함
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
//                                 console.log("Return to User Popup");
//                                 console.log(data[0]);
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

             vocInputMode = "N";
             initForm();
         }
     });

      // 신규 - vocGrid
      $("#btnNew").kendoButton({
          click:function(e) {

              vocInputMode = "N";

              // 초기화
              initForm();
              // 읽기전용 해제
              readOnlyDefualtForm(false);

              $("#btnVocStat01").data("kendoButton").enable(true);    //접수 ( 페이지 로딩 , 신규 시 접수버튼 활성화 )


              //******* VOC 요청접수 일때 읽기전용 *******//
              $("#vocNo").attr("readonly", true);
              $("#vocStatCd").data("kendoExtDropDownList").value("01");
              $("#vocStatCd").data("kendoExtDropDownList").enable(false);
              $("#vocTpCd").data("kendoExtDropDownList").value("01");
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


              $("#coopDeptNm").attr("disabled", true);
              $("#bizDeptNm").attr("disabled", true);
              $("#officeNm").attr("disabled", true);
              $("#sungCd").data("kendoExtDropDownList").enable(false);
              $("#cityCd").data("kendoExtDropDownList").enable(false);
              // TODO 오픈한딜러여부 읽기전용



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
                  url:"<c:url value='/crm/crq/vocMgmt/selectSysDate.do' />",
                  //data:JSON.stringify(saveData),
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
//               console.log("selectedItem ::",selectedItem)
              if(selectedItem!=null) {
                  var regDt = kendo.parseDate("<c:out value='${sysDate}' />", "<dms:configValue code='dateFormat' />");

                  var vocNo = selectedItem.vocNo;
//                   console.log("vocNo ::",vocNo)
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

                      // BHMC_VOC_NO 있으면 같이 보내라.
                      var vocNoInfo = {
                           "vocNo"      :   $("#vocNo").val()
                          ,"bhmcVocNo"  :   $("#bhmcVocNo").val()
                      };
                      saveData.vocMgmtVO = vocNoInfo;
//                       console.log("VOC_ACTION SAVE:",JSON.stringify(saveData))
                      //return;

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
           gridId:"G-CRM-0519-172115"
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

                           params["sCust"]          = $("#sCust").val();
                           params["sRegStartDt"]    = $("#sRegStartDt").data("kendoExtMaskedDatePicker").value();
                           params["sRegEndDt"]      = $("#sRegEndDt").data("kendoExtMaskedDatePicker").value();
                           params["sVocTpCd"]       = $("#sVocTpCd").val();
                           params["sVocStatCd"]     = $("#sVocStatCd").val();
                           params["sCmplCauCd"]     = $("#sCmplCauCd").val();
                           params["sMngScId"]       = $("#sMngScId").data("kendoExtDropDownList").value();
                           params["sBhmcVocNo"]       = $("#sBhmcVocNo").val();

//                            console.log("voc : ",params);
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
                               /*
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
                               , custReqCont        :{type:"string", editable:false} //고객요청내용
                               , pevalId            :{type:"string", editable:false} //심사인ID
                               , callCenOpnCont     :{type:"string", editable:false} //콜센터의견내용
                               , returnCauCont      :{type:"string", editable:false} //반송원인내용
                               , pmoCauCd           :{type:"string", editable:false} //승급원인코드
                               , revMthCont         :{type:"string", editable:false} //검토방안내용
                               , pprocTelNo         :{type:"string", editable:false} //처리인전화번호
                               , pprocEmailNm       :{type:"string", editable:false} //처리인이메일명
                               , procRsltCont       :{type:"string", editable:false} //처리결과내용
                               , stsfIvstEmpId      :{type:"string", editable:false} //만족도조사인ID
                               , stsfIvstRsltCont   :{type:"string", editable:false} //만족도조사결과내용
                               , realPprocId        :{type:"string", editable:false} //실처리인ID
                               , cmplStsfNm         :{type:"string", editable:false} //불만만족도
                               , cmplReAcptYn       :{type:"string", editable:false} //불만재접수여부
                               , cmplReAcptCnt      :{type:"string", editable:false} //불만재접수횟수
                               , serReqNo           :{type:"string", editable:false} //서비스요청번호
                               , cmplDlDeptNm       :{type:"string", editable:false} //불만전달부서명
                               , cmplDlEmpId        :{type:"string", editable:false} //불만전달자ID
                               , dstbNo             :{type:"string", editable:false} //물류번호
                               , parOrdYn           :{type:"string", editable:false} //부품오더여부
                               , itemCd             :{type:"string", editable:false} //품목코드
                               , bhmcYn             :{type:"string", editable:false} //BHMC여부
                               , bhmcVocNo          :{type:"string", editable:false} //BHMCVOC번호
                               , regUsrId           :{type:"string", editable:false} //등록자ID
                               , updtUsrId          :{type:"string", editable:false} //수정자ID
                               , pprocDeptNm        :{type:"string", editable:false} //처리부서명
                               , vocCnt             :{type:"string", editable:false} //정보VIEW
                               , dlrCd              :{type:"string"}
                               */
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

               var dataItems = e.sender.dataSource.view();
               var vocCnt1 = dataItems.length == 0 ? "0":dataItems[0]["vocCnt1"];
               var vocCnt2 = dataItems.length == 0 ? "0":dataItems[0]["vocCnt2"];
               var vocCnt3 = dataItems.length == 0 ? "0":dataItems[0]["vocCnt3"];
               var vocCnt4 = dataItems.length == 0 ? "0":dataItems[0]["vocCnt4"];
               var vocCnt5 = dataItems.length == 0 ? "0":dataItems[0]["vocCnt5"];

               //console.log(dataItems)

               $("#vocCnt1").val(vocCnt1);
               $("#vocCnt2").val(vocCnt2);
               $("#vocCnt3").val(vocCnt3);
               $("#vocCnt4").val(vocCnt4);
               $("#vocCnt5").val(vocCnt5);

               $("#vocCnt").val("<spring:message code='crm.info.vocTpCdCnt' arguments='"+vocCnt1+","+vocCnt2+","+vocCnt3+","+vocCnt4+","+vocCnt5+"' />");
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
           ,change:function(e){

               var selectedItem = this.dataItem(this.select());

               if( dms.string.isNotEmpty(selectedItem) ){

                   // 고객케어 상세 조회
                   var vocNo = selectedItem.vocNo;

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
                               dms.notification.error(jqXHR.responseJSON.errors);
                           }
                   }).done(function(body) {

                       console.log("vocView :",body);
                       console.log("vocStatCd :",body.vocStatCd);
                       console.log("pprocId :",body.pprocId);
                       console.log("pprocNm :",body.pprocNm);
                       console.log("vocNo Info :",body.vocNo+" | bhmcNo : ",body.bhmcVocNo);

                       //form 초기화
                       initForm();
                       //form readonly
                       readOnlyDefualtForm(true);

                       vocInputMode = "U";

                       $("#bhmcYn").val(body.bhmcYn);
                       $("#bhmcVocNo").val(body.bhmcVocNo);
                       $("#dlrCd").val(body.dlrCd);

                       $("#vocNo").val(body.vocNo);
                       //onSelectVocStatCdSet(body.vocTpCd);
                       $("#vocStatCd").data("kendoExtDropDownList").value(body.vocStatCd);
                       btnActive(body.vocStatCd, body.vocTpCd);
                       $("#bfVocStatCd").val(body.vocStatCd);
                       // VOC 유형은 수정불가
                       $("#vocTpCd").data("kendoExtDropDownList").value(body.vocTpCd);
                       $("#vocTpCd").data("kendoExtDropDownList").enable(false);

//                        console.log("body.vocTpCd ::: ",body.vocTpCd)

                       /*
                       if ( body.vocTpCd === "02" ) {
                           $("#btnVocStat08").removeClass("hidden");
                           $("#btnVocStat09").removeClass("hidden");
                       } else {
                           $("#btnVocStat08").addClass("hidden");
                           $("#btnVocStat09").addClass("hidden");
                       };
                       */

                       $("#vocTpSubCd").data("kendoExtDropDownList").value(body.vocTpSubCd);
                       $("#tendCd").data("kendoExtDropDownList").value(body.tendCd);
                       $("#vocTpSub1Cd").data("kendoExtDropDownList").value(body.vocTpSub1Cd);
                       onSelectVocTpSubCdSet("CRM606", body.vocTpSub1Cd);                                   //VOC유형하위2코드 설정
                       $("#vocTpSub2Cd").data("kendoExtDropDownList").value(body.vocTpSub2Cd);
                       onSelectVocTpSubCdSet("CRM607", body.vocTpSub2Cd);                                   //VOC유형하위3코드 설정
                       $("#vocTpSub3Cd").data("kendoExtDropDownList").value(body.vocTpSub3Cd);

                       $("#vocTpSub2Cd").data("kendoExtDropDownList").enable(false);
                       $("#vocTpSub3Cd").data("kendoExtDropDownList").enable(false);


                       $("#acptSrcCd").data("kendoExtDropDownList").value(body.acptSrcCd);
                       $("#activeGainPathCd").data("kendoExtDropDownList").value(body.activeGainPathCd);
                       $("#cmplCauCd").data("kendoExtDropDownList").value(body.cmplCauCd);
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

                       $("#sendTelNo").val(body.sendTelNo);
                       $("#pconRelCd").data("kendoExtDropDownList").value(body.pconRelCd);
                       $("#pprocDeptNm").val(body.pprocDeptNm);
                       $("#pprocId").val(body.pprocId);
                       $("#pprocNm").val(body.pprocNm);
                       $("#coopDeptNm").val(body.coopDeptNm);
                       $("#bizDeptNm").val(body.bizDeptNm);
                       $("#officeNm").val(body.officeNm);
                       $("#sungNm").val(body.sungNm);
                       $("#sungCd").data("kendoExtDropDownList").value(body.sungCd);
                       $("#cityNm").val(body.cityNm);
                       $("#cityCd").data("kendoExtDropDownList").enable(false);
                       //onSelectSungCdSet(body.sungCd);
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
//                        $("#cmplStsfNm01").val(body.cmplStsfNm);
//                        $("#cmplStsfNm02").val(body.cmplStsfNm);
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

                       //changeComboList(body.vocTpCd,"","");
                       $("#btnActiveSave").data("kendoButton").enable(true);
                       $("#btnAdd").data("kendoButton").enable(true);


                       // BHMC 인경우 이름 그대로 보여줌.
                       if ( dms.string.isNotEmpty(body.bhmcVocNo) && body.bhmcYn === "Y" ) {

                            readOnlyDefualtForm(true);
                            btnDisabled();      // 상단에서 버튼제어후 BHMC 인경우 다시 제어

                            if ( body.vocStatCd === "03" ) {

                                //제조사 VOC 인경우
                                //처리(03) / 고객FU(09) 버튼만 활성화
                                //고객 FU 에서 처리로 반송 버튼 (03 으로 업데이트) 있는데
                                //처리에서 처리로 업데이트 하는꼴임. 어떻게 처리 해야 하나?

                                //제조사 데이터는 처리/고객FU 버튼만 활성화.      -> 03 : 처리버튼 활성화 / 09 : 고객 F/U 버튼 활성화 / 나머지 상태인경우 비활성화
                                $("#btnVocStat03").data("kendoButton").enable(true);        //처리
                                $("#btnVocStat03Popup").data("kendoButton").enable(true);   //처리  POPUP
                                $("#btnCancel03Popup").data("kendoButton").enable(true);    //처리  POPUP

                                $("#btnVocStat09").data("kendoButton").enable(true);        //고객F/U
                                $("#btnVocStat09Popup").data("kendoButton").enable(true);   //고객F/U POPUP
                                $("#btnVocStat95Popup").data("kendoButton").enable(true);   //고객F/U POPUP
                                $("#btnCancel09Popup").data("kendoButton").enable(true);    //고객F/U POPUP

                            };

                            console.log("body.pacptId : ",body.pacptId)
                            // 제조사인경우는 접수인 접수시간 내려온대로 표시
                            $("#pacptId").val(body.pacptId);
                            $("#pacptNm").val(body.pacptId);

                            $("#pprocId").val("");
                            $("#pprocNm").val(body.pprocId);

                            //console.log("pprocId :",body.pprocId);
                            //console.log("pprocNm :",body.pprocNm);

                           $("#realPprocNm").val(body.realPprocId);
                           $("#pconRelCd").parent().find(".k-input").html(body.pconTpNm);
                           $("#sungCd").parent().find(".k-input").html(body.sungNm);
                           $("#cityCd").parent().find(".k-input").html(body.cityNm);
                           $("#carlineCd").parent().find(".k-input").html(body.carlineNm);
                           $("#modelCd").parent().find(".k-input").html(body.modelNm);
                           $("#ocnCd").parent().find(".k-input").html(body.ocnNm);
                           $("#pacptId").parent().find(".k-input").html(body.pacptId);
                           $("#cmplStsfNm01").parent().find(".k-input").html(body.cmplStsfNm);


                       }

                       // 활동목록 그리드 조회
                       var grid = $("#activeGrid").data("kendoExtGrid");
                       grid.dataSource.page(1);

                   });

               };

           }
           ,columns:[
                        {field:"vocNo"            , title:"<spring:message code='global.lbl.vocNo' />"      , attributes:{"class":"ac"}, width:170}    //VOC번호
                       ,{field:"bhmcVocNo"        , title:"<spring:message code='global.lbl.BhmcVocNo' />"  , attributes:{"class":"ac"}, width:130}    //BHMCVOC번호
                       ,{field:"custNm"           , title:"<spring:message code='global.lbl.custNm' />"     , attributes:{"class":"ac"}, width:100}    //고객명
                       ,{field:"custPrefCommNo"   , title:"<spring:message code='global.lbl.telNumer' />"   , attributes:{"class":"ac"}, width:100}    //연락처
                       ,{field:"vocTpNm"          , title:"<spring:message code='global.lbl.vocTpCd' />"    , attributes:{"class":"ac"}, width:100}    //VOC유형코드명
                       ,{field:"vocStatCdNm"        , title:"<spring:message code='global.lbl.vocStatCd' />"  , attributes:{"class":"ac"}, width:100}    //VOC상태코드명
                       ,{field:"acptDtFormat", title:"<spring:message code='crm.lbl.acptDt' />", width:100   // 접수일
                           ,attributes:{"class":"ac tooltip-disabled"}
                           ,template:"#if (acptDtFormat !== null ){# #= kendo.toString(data.acptDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                       }
                       ,{field:"procDtFormat", title:"<spring:message code='crm.lbl.procDt' />", width:100   // 처리일자
                           ,attributes:{"class":"ac tooltip-disabled"}
                           ,template:"#if (procDtFormat !== null ){# #= kendo.toString(data.procDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                       }
                       ,{field:"emgcRescYn"      , title:"<spring:message code='crm.lbl.emgcRescYn' />"   , attributes:{"class":"ac"}, width:100}    //긴급구조여부
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
           gridId:"G-CRM-0519-172121"
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

                           //console.log(params);
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
                       ,parse:function(d) {
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
           ,filterable:{
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
                                }
                            });

                        }else{
                            container.context.innerText = dms.string.strNvl(activeTpCdArrVal[options.model.activeTpCd]);
                        }
                    }
                }
                 , { field:"activeTpSubCd", title:"<spring:message code='global.lbl.activeTpSubCd' />" ,width:140
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
           changeComboList("","","");
           readOnlyDefualtForm(true);
       };


//        console.log("mngScIdCtrl:::" + "${mngScIdCtrl}" );
       var mngScIdCtrl = "${mngScIdCtrl}";
       if (mngScIdCtrl == "N") {
           $("#sMngScId").data("kendoExtDropDownList").value("${loginUsrId}");
           $("#sMngScId").data("kendoExtDropDownList").enable(false);
       } else {

           $("#sMngScId").data("kendoExtDropDownList").enable(true);
           $("#sMngScId").data("kendoExtDropDownList").value("");

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
    $("#mthAchvHm").data("kendoExtMaskedDateTimePicker").value("2016-08-10 09:00");
    $("#evalAllocDt").data("kendoExtMaskedDateTimePicker").value("2016-08-10 09:00");
    $("#sendCd").data("kendoExtDropDownList").value("管理");
    $("#pmoDt").data("kendoExtMaskedDateTimePicker").value("2016-08-10 09:00");
    $("#procDt").data("kendoExtMaskedDateTimePicker").value("2016-08-10 09:00");
    $("#pprocEmailNm").val("管理员二");
    $("#stsfIvstDt").data("kendoExtMaskedDateTimePicker").value("2016-08-10 09:00");
    $("#traceRsltCont").val("管理员二");

    $("#callCenOpnCont").val("管理员二");
    $("#revMthCont").val("管理员二");
    $("#procRsltCont").val("管理员二");
    $("#stsfIvstRsltCont").val("管理员二");
    $("#cmplStsfNm01").data("kendoExtDropDownList").value("01");
    $("#cmplStsfNm02").data("kendoExtDropDownList").value("01");
//     $("#cmplStsfNm01").val("111");
//     $("#cmplStsfNm02").val("111");
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

</script>
